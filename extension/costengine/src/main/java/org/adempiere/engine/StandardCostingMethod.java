/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.compiere.model.I_M_Cost;
import org.compiere.model.I_M_CostDetail;
import org.compiere.model.I_M_Transaction;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MProduct;
import org.compiere.model.MTransaction;
import org.compiere.util.CLogger;

/**
 * @author anca_bradau
 * 
 */
public class StandardCostingMethod implements ICostingMethod
{
	MAcctSchema m_as;
	IDocumentLine m_model;
	MTransaction m_trx; 
	MCost m_cost;
	Boolean m_isSOTrx;
	CostComponent m_CurrentCost;
	CostComponent cc;
	MCostDetail m_costdetail;
	BigDecimal m_CumulatedAmt;
	BigDecimal m_CumulatedQty;
	BigDecimal m_CurrentCostPrice;
	
	public void setCostingMethod (MAcctSchema as,IDocumentLine model,MTransaction mtrx, MCost cost, Boolean isSOTrx)
	{
		m_as = as;
		m_model = model;
		m_trx  = mtrx;
		m_cost = cost;
		m_isSOTrx = isSOTrx;
	}
	
	public void process() 
	{
		MCost cost = ((MCostDetail) m_costdetail).getM_Cost();
		CLogger s_log = CLogger.getCLogger(StandardCostingMethod.class);

		MAcctSchema as = MAcctSchema.get(m_model.getCtx(), m_costdetail.getC_AcctSchema_ID(),
			  	m_model.get_TrxName());
		MProduct product = MProduct.get(m_model.getCtx(), m_costdetail.getM_Product_ID());
		int precision = as.getCostingPrecision();
		BigDecimal price = m_costdetail.getAmt();

		if (m_costdetail.getQty().signum() != 0)
			price = m_costdetail.getAmt().divide(m_costdetail.getQty(), precision,
					BigDecimal.ROUND_HALF_UP);

		if (m_costdetail.getC_OrderLine_ID() != 0) {
			if (cost.getCurrentCostPrice().signum() == 0) {
				cost.setCurrentCostPrice(price);
				// seed initial price
				if (cost.getCurrentCostPrice().signum() == 0
						&& cost.get_ID() == 0)
					cost.setCurrentCostPrice(MCost.getSeedCosts(product,
							m_costdetail.getM_AttributeSetInstance_ID(), as, 
							m_costdetail.getAD_Org_ID(),m_costdetail.getCostingMethod(),
							m_costdetail.getC_OrderLine_ID()));
			}
			cost.add(m_costdetail.getAmt(), m_costdetail.getQty());
			s_log.finer("Inv - Standard - " + cost);
		} 
		else if (m_costdetail.getM_InOutLine_ID() != 0 // AR Shipment Detail Record
				|| m_costdetail.getM_MovementLine_ID() != 0
				|| m_costdetail.getM_InventoryLine_ID() != 0
				|| m_costdetail.getM_ProductionLine_ID() != 0
				|| m_costdetail.getC_ProjectIssue_ID() != 0
				|| m_costdetail.getPP_Cost_Collector_ID() != 0) 
		{
			boolean addition = m_costdetail.getQty().signum() > 0;
			//
			if (addition)
			{
				cost.add(m_costdetail.getAmt(), m_costdetail.getQty());
				// Initial
				if (cost.getCurrentCostPrice().signum() == 0
						&& cost.get_ID() == 0)
					cost.setCurrentCostPrice(price);
			} 
			else
				cost.setCurrentQty(cost.getCurrentQty().add(m_costdetail.getQty()));
			s_log.finer("QtyAdjust - Standard - " + cost);
			cost.saveEx();
		}
		return;
	}

}
