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
import org.compiere.util.Env;

/**
 * @author anca_bradau
 * 
 */
public class AveragePOCostingMethod extends  AbstractCostingMethod implements ICostingMethod {

	
	public void setCostingMethod (MAcctSchema as,MTransaction mtrx,
			MCost dimension, BigDecimal costThisLevel , BigDecimal costLowLevel, Boolean isSOTrx)
	{
		m_as = as;
		m_model = mtrx.getDocumentLine();
		m_trx  = mtrx;
		m_dimension = dimension;
		m_costThisLevel = (costThisLevel == null ? Env.ZERO : costThisLevel);
		m_costLowLevel = (costLowLevel == null ? Env.ZERO : costLowLevel);
		m_cost = m_costThisLevel.add(m_costLowLevel);
		m_isSOTrx = isSOTrx;
	}
	
	public void setDocumentLine(IDocumentLine docLine)
	{
		m_model = docLine;
	}
	
	public MCostDetail process()
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

	@Override
	public MCostDetail createReversalCostDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getNewCurrentCostPrice(MCostDetail cd, int scale,
			int roundingMode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getNewCumulatedAmt(MCostDetail cd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getNewCurrentCostPriceLL(MCostDetail cd, int scale,
			int roundingMode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getNewCumulatedAmtLL(MCostDetail cd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getNewCumulatedQty(MCostDetail cd) {
		// TODO Auto-generated method stub
		return null;
	}
}
