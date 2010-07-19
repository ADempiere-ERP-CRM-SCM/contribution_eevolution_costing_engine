/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MTransaction;
import org.compiere.util.CLogger;

/**
 * @author anca_bradau
 * 
 */
public class AveragePOCostingMethod implements ICostingMethod {

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
		CLogger s_log = CLogger.getCLogger(AveragePOCostingMethod.class);
		if (m_costdetail.getC_OrderLine_ID() != 0)
		{
			cost.setWeightedAverage(m_costdetail.getAmt(), m_costdetail.getQty());
			s_log.finer("PO - AveragePO - " + cost);
		} 
		else if (m_costdetail.getM_InOutLine_ID() != 0 // AR Shipment Detail Record
				|| m_costdetail.getM_MovementLine_ID() != 0
				|| m_costdetail.getM_InventoryLine_ID() != 0
				|| m_costdetail.getM_ProductionLine_ID() != 0
				|| m_costdetail.getC_ProjectIssue_ID() != 0
				|| m_costdetail.getPP_Cost_Collector_ID() != 0) {
			boolean addition = m_costdetail.getQty().signum() > 0;

			if (addition)
				cost.setWeightedAverage(m_costdetail.getAmt(), m_costdetail.getQty());
			else
				cost.setCurrentQty(cost.getCurrentQty().add(m_costdetail.getQty()));
			s_log.finer("QtyAdjust - AveragePO - " + cost);
			cost.saveEx();
		}
		return;
	}

		
	/*public List<CostComponent> getCostComponents(IDocumentLine model, 
			I_M_Transaction mtrx, I_M_Cost cost) {

		List<CostComponent> list = new ArrayList<CostComponent>();
		BigDecimal cc = cost.getCurrentCostPrice();
		list.add(new CostComponent(mtrx.getMovementQty(), cc));

		return list;
	}*/
}
