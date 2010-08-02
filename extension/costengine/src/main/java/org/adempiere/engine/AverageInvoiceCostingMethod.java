/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.List;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.I_M_CostDetail;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MTransaction;
import org.compiere.model.Query;
import org.compiere.util.Env;
import org.compiere.util.Util;

/**
 * @author anca_bradau
 * @author victor.perez@e-evolution.com, www.e-evolution.com
 * 
 */
public class AverageInvoiceCostingMethod extends AbstractCostingMethod implements ICostingMethod {
	
	public void setCostingMethod (MAcctSchema as,IDocumentLine model,MTransaction mtrx, MCost cost,
			Boolean isSOTrx, Boolean setProcessed)
	{
		m_as = as;
		m_model = model;
		m_trx  = mtrx;
		m_cost = cost;
		m_isSOTrx = isSOTrx;
		m_costdetail = getCostDetail();
	}
	
	public void calculate()
	{
		if(m_costdetail != null)
		{
			m_Amount = m_model.getMovementQty().multiply(m_model.getPriceActual());	
			m_CumulatedQty = m_costdetail.getCumulatedQty().add(m_model.getMovementQty());
			m_CumulatedAmt = m_costdetail.getCumulatedAmt().add(m_Amount);
			m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_AdjustCost = m_CurrentCostPrice.multiply(m_cost.getCumulatedQty()).subtract(m_cost.getCumulatedAmt());	
			return;
		}
		m_Amount = m_model.getMovementQty().multiply(m_model.getPriceActual());	
		m_CumulatedQty = m_cost.getCumulatedQty().add(m_model.getMovementQty());
		m_CumulatedAmt = m_cost.getCumulatedAmt().add(m_Amount);
		m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
	}
	
	private void createCostDetail()
	{
		final String idColumnName = CostEngine.getIDColumnName(m_model);			
		if(m_costdetail == null)
		{				
			m_costdetail = new MCostDetail(m_cost, m_model.getAD_Org_ID(), m_CurrentCostPrice.multiply(m_model.getMovementQty()) , m_model.getMovementQty());
			m_costdetail.set_ValueOfColumn(idColumnName,CostEngine.getIDColumn(m_model));
		}		
		else
		{
			if(!m_AdjustCost.equals(Env.ZERO))
			{
				m_costdetail.setCostAdjustment(m_AdjustCost);
				m_costdetail.setProcessed(false);
				m_costdetail.setDescription("Adjust Cost");
			}
			m_costdetail.set_ValueOfColumn(idColumnName,CostEngine.getIDColumn(m_model));
			m_costdetail.saveEx();
			return;
		}
		if (!m_costdetail.set_ValueOfColumnReturningBoolean(idColumnName, m_model.get_ID()))
			throw new AdempiereException("Cannot set "+idColumnName);
		if (m_isSOTrx != null)
			m_costdetail.setIsSOTrx(m_isSOTrx);
		else
			m_costdetail.setIsSOTrx(m_model.isSOTrx());	
		
		m_costdetail.setCumulatedQty(m_cost.getCumulatedQty());
		m_costdetail.setCumulatedAmt(m_cost.getCumulatedAmt());	
		m_costdetail.setCurrentCostPrice(m_cost.getCurrentCostPrice());
		
		StringBuilder description = new StringBuilder();
		if (!Util.isEmpty(m_model.getDescription(), true))
			description.append(m_model.getDescription());
		if (m_isSOTrx != null)
		{
			description.append(m_isSOTrx ? "(|->)" : "(|<-)");
		}
		if (m_trx != null)
		   m_costdetail.setM_Transaction_ID(m_trx.getM_Transaction_ID());
		m_costdetail.setDescription(description.toString());
		m_costdetail.saveEx();
		return;
	}
	
	private void updateCurrentCost()
	{
		m_cost.setCurrentCostPrice(m_CurrentCostPrice);
		m_cost.setCumulatedQty(m_CumulatedQty);
		m_cost.setCumulatedAmt(m_CumulatedAmt);
		m_cost.saveEx();
	}

	public void process() {
		calculate();
		createCostAdjutment();
		createCostDetail();
		updateCurrentCost();
	}
	
	public void createCostAdjutment()
	{
		if (m_costdetail != null)
		{
			if(m_trx.getMovementType().endsWith("+") 
					&& m_CumulatedQty.signum() == 0  
					&& m_CumulatedAmt.signum() < 0)
			{	//Create Adjustment Cost 
				if(m_as.isAdjustCOGS())	
				{
					BigDecimal totalQty = Env.ZERO;
					for(MCostDetail cd : getCostDetailForOutTrx())
					{
						totalQty = totalQty.add(cd.getQty());
					}

					for(MCostDetail cd : getCostDetailForOutTrx())
					{
						// Update and set Adjustment Cost
						BigDecimal ration = (totalQty.divide(cd.getQty()));					
						cd.setCostAdjustment(m_CumulatedAmt.divide(ration));
						cd.setCostAdjustmentDate(m_trx.getMovementDate());
						cd.setProcessed(false);
						cd.saveEx();
					}
				}
			}
		}
	}	

	
	private boolean isAdjustment()
	{
		String whereClause ="EXIST (SELECT 1 FROM M_Transaction t WHERE t.M_Transaction_ID=M_Cost.M_Transaction_ID AND MovementType LIKE '%') AND AcctDate >=?";
		boolean isAjustment = new Query(m_cost.getCtx(), I_M_CostDetail.Table_Name, whereClause, m_cost.get_TrxName())
		.setClient_ID()
		.setParameters(m_model.getDateAcct())
		.setOrderBy(I_M_CostDetail.COLUMNNAME_DateAcct)
		.match();
		return isAjustment;
	}
	
	private List<MCostDetail> getCostDetailForOutTrx()
	{
		StringBuffer whereClause = new StringBuffer("EXIST (SELECT 1 FROM M_Transaction t WHERE")
		.append("t.M_Transaction_ID=M_Cost.M_Transaction_ID AND ")
		.append("MovementType LIKE '%-' AND ")
		.append("t.MovementDate <=? ) AND ") 
		.append("AcctDate => ? AND ")
		.append("CumulatedQty < 0 AND ") 
		.append("CumulatedAmt < 0 ");
		
		return new Query(m_cost.getCtx(), I_M_CostDetail.Table_Name , whereClause.toString(), m_cost.get_TrxName())
		.setClient_ID()
		.setParameters(m_trx.getMovementDate(), m_model.getDateAcct())
		.setOrderBy(I_M_CostDetail.COLUMNNAME_DateAcct + " DESC")
		.list();
	}

	@Override
	public void processCostDetail(MCostDetail mCostdetail) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected List<CostComponent> getCalculatedCosts() {
		// TODO Auto-generated method stub
		return null;
	}

}
