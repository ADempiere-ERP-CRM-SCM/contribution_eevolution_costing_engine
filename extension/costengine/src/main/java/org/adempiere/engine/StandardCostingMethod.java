/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;

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
 * 
 */
public class StandardCostingMethod implements ICostingMethod {
	
	MAcctSchema m_as;
	IDocumentLine m_model;
	MTransaction m_trx; 
	MCost m_cost;
	Boolean m_isSOTrx;
	MCostDetail m_costdetail = null;
	BigDecimal m_CumulatedAmt = Env.ZERO;
	BigDecimal m_CumulatedQty = Env.ZERO;
	BigDecimal m_CurrentCostPrice = Env.ZERO;
	BigDecimal m_Amount= Env.ZERO;
	BigDecimal m_AdjustCost = Env.ZERO;
	
	public void setCostingMethod (MAcctSchema as,IDocumentLine model,MTransaction mtrx, MCost cost, Boolean isSOTrx,Boolean setProcessed)
	{
		m_as = as;
		m_model = model;
		m_trx  = mtrx;
		m_cost = cost;
		m_isSOTrx = isSOTrx;
		m_costdetail = getCostDetail();
	}
	

	private void calculate()
	{
		if(m_costdetail != null)
		{
			m_Amount = m_model.getMovementQty().multiply(m_costdetail.getCurrentCostPrice());
			m_AdjustCost = m_Amount.subtract(m_costdetail.getAmt());
			m_CumulatedAmt = m_cost.getCumulatedAmt().add(m_Amount).add(m_AdjustCost);
			m_CumulatedQty = m_cost.getCumulatedQty();
			return;
		}
		
		m_Amount = m_model.getMovementQty().multiply(m_cost.getCurrentCostPrice());
		m_CumulatedAmt = m_cost.getCumulatedAmt().add(m_Amount).add(m_AdjustCost);
		m_CumulatedQty = m_cost.getCumulatedQty().add( m_model.getMovementQty());
		m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision());
	
		
	}
	
	
	private void createCostDetail()
	{
		
		final String idColumnName = CostEngine.getIDColumnName(m_model);
		if(m_costdetail == null)
		{	
			m_costdetail = new MCostDetail(m_cost, m_model.getAD_Org_ID(), m_Amount, m_model.getMovementQty());
		}		
		else
		{
			if(!m_AdjustCost.equals(Env.ZERO))
			{
				m_costdetail.setCostAdjustment(m_AdjustCost);
				m_costdetail.setProcessed(false);
				m_costdetail.setDescription("Adjust Cost");
				m_costdetail.saveEx();
				return;
			}
			return;
		}
		if (!m_costdetail.set_ValueOfColumnReturningBoolean(idColumnName, m_model.get_ID()))
			throw new AdempiereException("Cannot set "+idColumnName);
		if (m_isSOTrx != null)
			m_costdetail.setIsSOTrx(m_isSOTrx);
		else
			m_costdetail.setIsSOTrx(m_model.isSOTrx());	

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
	
	private void updateCurrentCost()
	{
		if(m_costdetail.getCumulatedQty().signum() != 0)
		{
			m_cost.setCurrentCostPrice(m_CurrentCostPrice);
		}	
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
	
	/*private List<MCostDetail> getCostDetail()
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
	}*/	

	public void process() {
		calculate();
		createCostAdjutment();
		createCostDetail();		
		updateCurrentCost();
	}
	/*
	@Override
	public void process(Properties ctx, I_M_CostDetail cd, String trxName) {
		MCost cost = ((MCostDetail) cd).getM_Cost();
		CLogger s_log = CLogger.getCLogger(StandardCostingMethod.class);

		MAcctSchema as = MAcctSchema.get(ctx, cd.getC_AcctSchema_ID(), trxName);
		MProduct product = MProduct.get(ctx, cd.getM_Product_ID());
		int precision = as.getCostingPrecision();
		BigDecimal price = cd.getAmt();

		if (cd.getQty().signum() != 0)
			price = cd.getAmt().divide(cd.getQty(), precision,
					BigDecimal.ROUND_HALF_UP);

		if (cd.getC_OrderLine_ID() != 0) {
			if (cost.getCurrentCostPrice().signum() == 0) {
				cost.setCurrentCostPrice(price);
				// seed initial price
				if (cost.getCurrentCostPrice().signum() == 0
						&& cost.get_ID() == 0)
					cost.setCurrentCostPrice(MCost.getSeedCosts(product, cd
							.getM_AttributeSetInstance_ID(), as, cd
							.getAD_Org_ID(), cd.getCostingMethod(), cd
							.getC_OrderLine_ID()));
			}
			cost.add(cd.getAmt(), cd.getQty());
			s_log.finer("Inv - Standard - " + cost);
		} else if (cd.getM_InOutLine_ID() != 0 // AR Shipment Detail Record
				|| cd.getM_MovementLine_ID() != 0
				|| cd.getM_InventoryLine_ID() != 0
				|| cd.getM_ProductionLine_ID() != 0
				|| cd.getC_ProjectIssue_ID() != 0
				|| cd.getPP_Cost_Collector_ID() != 0) {
			boolean addition = cd.getQty().signum() > 0;
			//
			if (addition) {
				cost.add(cd.getAmt(), cd.getQty());
				// Initial
				if (cost.getCurrentCostPrice().signum() == 0
						&& cost.get_ID() == 0)
					cost.setCurrentCostPrice(price);
			} else
				cost.setCurrentQty(cost.getCurrentQty().add(cd.getQty()));
			s_log.finer("QtyAdjust - Standard - " + cost);
			cost.saveEx();
		}
		return;
	}

	@Override
	public List<CostComponent> getCostComponents(MAcctSchema as,
			IDocumentLine model, I_M_Transaction mtrx, MCost cost) {
		List<CostComponent> list = new ArrayList<CostComponent>();
		BigDecimal cc = cost.getCurrentCostPrice();
		list.add(new CostComponent(mtrx.getMovementQty(), cc));
		return list;
	}*/
	@Override
	public void processCostDetail(MCostDetail mCostdetail) {
		// TODO Auto-generated method stub
		
	}
	
	private MCostDetail getCostDetail()
	{
	
		final String whereClause = MCostDetail.COLUMNNAME_M_Transaction_ID + "=? AND "
								 + MCostDetail.COLUMNNAME_CostingMethod+ "=? AND "
								 + MCostDetail.COLUMNNAME_M_CostElement_ID+ "=?";
		return new Query (m_model.getCtx(), I_M_CostDetail.Table_Name, whereClause , m_model.get_TrxName())
		.setParameters(m_trx.getM_Transaction_ID(),m_cost.getCostingMethod(), m_cost.getM_CostElement_ID())
		.setClient_ID()
		.firstOnly();
	}

}
