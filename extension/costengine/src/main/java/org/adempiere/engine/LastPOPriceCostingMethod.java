/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.List;

import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MTransaction;
import org.compiere.util.CLogger;

/**
 * @author anca_bradau
 * 
 */
public class LastPOPriceCostingMethod extends AbstractCostingMethod implements ICostingMethod
{

	
	public void setCostingMethod (MAcctSchema as,MTransaction mtrx,
			MCost cost, BigDecimal price , Boolean isSOTrx)
	{
		m_as = as;
		m_model = mtrx.getDocumentLine();
		m_trx  = mtrx;
		m_cost = cost;
		m_price = price;
		m_isSOTrx = isSOTrx;
		m_dimension = new CostDimension(m_trx.getAD_Client_ID(), m_trx.getAD_Org_ID(), m_trx.getM_Product_ID(), m_trx.getM_AttributeSetInstance_ID(), m_cost.getM_CostType_ID(), m_as.getC_AcctSchema_ID(), m_cost.getM_CostElement_ID());	
	}
	
	public MCostDetail process() {
		MCost cost = ((MCostDetail)  m_costdetail).getM_Cost();
		CLogger s_log = CLogger.getCLogger(LastPOPriceCostingMethod.class);

		boolean isReturnTrx =  m_costdetail.getQty().signum() < 0;
		MAcctSchema as = MAcctSchema.get(m_model.getCtx(),  m_costdetail.getC_AcctSchema_ID(), m_model.get_TrxName());
		int precision = as.getCostingPrecision();
		BigDecimal price = m_costdetail.getAmt();

		if ( m_costdetail.getQty().signum() != 0)
			price =  m_costdetail.getAmt().divide(m_costdetail.getQty(), precision,
					BigDecimal.ROUND_HALF_UP);

		if ( m_costdetail.getC_OrderLine_ID() != 0) {
			if (!isReturnTrx) {
				if ( m_costdetail.getQty().signum() != 0)
					cost.setCurrentCostPrice(price);
				else {
					BigDecimal cCosts = cost.getCurrentCostPrice().add(
							 m_costdetail.getAmt());
					cost.setCurrentCostPrice(cCosts);
				}
			}
			cost.add( m_costdetail.getAmt(),  m_costdetail.getQty());
			s_log.finer("PO - LastPO - " + cost);
		} 
		else if ( m_costdetail.getM_InOutLine_ID() != 0 // AR Shipment Detail Record
				||  m_costdetail.getM_MovementLine_ID() != 0
				||  m_costdetail.getM_InventoryLine_ID() != 0
				||  m_costdetail.getM_ProductionLine_ID() != 0
				||  m_costdetail.getC_ProjectIssue_ID() != 0
				||  m_costdetail.getPP_Cost_Collector_ID() != 0) 
		{
			cost.setCurrentQty(cost.getCurrentQty().add(m_costdetail.getQty()));
			s_log.finer("QtyAdjust - LastPO - " + cost);
			cost.saveEx();
		}
		return m_costdetail;
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
