/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.List;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MTransaction;
import org.compiere.util.Env;
import org.compiere.util.Util;

/**
 * @author anca_bradau
 * @author victor.perez@e-evolution.com, www.e-evolution.com
 * 
 */
public class StandardCostingMethod extends AbstractCostingMethod implements ICostingMethod {
	
	public void setCostingMethod (MAcctSchema as,MTransaction mtrx, MCost cost,BigDecimal price, Boolean isSOTrx)
	{
		m_as = as;
		m_trx  = mtrx;
		m_cost = cost;
		m_price = price;
		m_isSOTrx = isSOTrx;
		m_model = mtrx.getDocumentLine();
		m_costdetail = getCostDetail(mtrx);
	}

	private void calculate()
	{	
		if(m_model.getReversalLine_ID() > 0)
			return;
		
		if(m_trx.getMovementType().endsWith("-"))
		{	
			m_CurrentCostPrice = m_cost.getCurrentCostPrice();
			m_Amount = m_model.getMovementQty().multiply(m_CurrentCostPrice);
			m_CumulatedQty = m_cost.getCumulatedQty().add(m_trx.getMovementQty());
			m_CumulatedAmt = m_cost.getCumulatedAmt().add(m_Amount);
			return;
		}	
		
		if(m_costdetail != null)
		{
			m_Amount = m_trx.getMovementQty().multiply(m_costdetail.getCurrentCostPrice());
			m_CumulatedQty = m_costdetail.getCumulatedQty().add(m_trx.getMovementQty());
			m_CumulatedAmt = m_costdetail.getCumulatedAmt().add(m_Amount);
			m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_AdjustCost = m_CurrentCostPrice.multiply(m_cost.getCumulatedQty()).subtract(m_cost.getCumulatedAmt());
			return;
		}
		
		m_Amount = m_trx.getMovementQty().multiply(m_cost.getCurrentCostPrice());
		m_CumulatedAmt = m_cost.getCumulatedAmt().add(m_Amount).add(m_AdjustCost);
		m_CumulatedQty = m_cost.getCumulatedQty().add( m_trx.getMovementQty());
		m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);	
	}
	
	
	private void createCostDetail()
	{
		final String idColumnName = CostEngine.getIDColumnName(m_model);
		if(m_model.getReversalLine_ID() > 0)
		{	
			createReveralCostDetail(m_model);
			return;
		}
		
		if(m_costdetail == null)
		{	
			m_costdetail = new MCostDetail(m_cost, m_model.getAD_Org_ID(), m_CurrentCostPrice.multiply(m_trx.getMovementQty()), m_trx.getMovementQty());
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
		if(m_trx != null)
			m_costdetail.setM_Transaction_ID(m_trx.getM_Transaction_ID());
		m_costdetail.setDescription(description.toString());
		m_costdetail.saveEx();
		return;
	}
	
	private void updateInventoryValue()
	{
			m_cost.setCurrentCostPrice(m_CurrentCostPrice);
			m_cost.setCumulatedQty(m_CumulatedQty);
			m_cost.setCumulatedAmt(m_CumulatedAmt);
			m_cost.saveEx();
	}
	
	public void createCostAdjutment()
	{
		//Create Adjustment
		/**if(m_trx !=null && m_trx.getMovementType().endsWith("+") 
		&& m_CumulatedQty.signum() == 0  
		&& m_CumulatedAmt.signum() < 1)
		{	//Create Adjustment Cost 
			if(m_as.isAdjustCOGS())	
			{
				BigDecimal totalQty = Env.ZERO;
				for(MCostDetail cd : getCostDetail())
				{
					totalQty = totalQty.add(cd.getQty());
				}
				for(MCostDetail cd : getCostDetail())
				{
					// Update and set Adjustment Cost
					BigDecimal ration = (totalQty.divide(cd.getQty()));
					cd.setCostAdjustment(m_CumulatedAmt.divide(ration));
					cd.setCostAdjustmentDate(m_trx.getMovementDate());
					cd.setCumulatedAmt(cd.getCumulatedAmt().add(cd.getCostAdjustment()));
					cd.saveEx();
				}
			}
		}*/	
	}	

	public void process() {
		calculate();
		createCostAdjutment();
		createCostDetail();		
		updateInventoryValue();
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
