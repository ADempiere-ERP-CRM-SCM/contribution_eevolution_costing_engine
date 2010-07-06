/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.compiere.model.I_M_CostDetail;
import org.compiere.model.I_M_Transaction;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.util.CLogger;

/**
 * @author anca_bradau
 * 
 */
public class LastInvoiceCostingMethod implements ICostingMethod {

	@Override
	public void process(Properties ctx, I_M_CostDetail cd, String trxName) {
		MCost cost = ((MCostDetail) cd).getM_Cost();
		CLogger s_log = CLogger.getCLogger(LastInvoiceCostingMethod.class);

		boolean isReturnTrx = cd.getQty().signum() < 0;
		MAcctSchema as = MAcctSchema.get(ctx, cd.getC_AcctSchema_ID(), trxName);
		int precision = as.getCostingPrecision();
		BigDecimal price = cd.getAmt();

		if (cd.getQty().signum() != 0)
			price = cd.getAmt().divide(cd.getQty(), precision,
					BigDecimal.ROUND_HALF_UP);
		if (cd.getC_OrderLine_ID() != 0) {
			if (!isReturnTrx) {
				if (cd.getQty().signum() != 0)
					cost.setCurrentCostPrice(price);
				else {
					BigDecimal cCosts = cost.getCurrentCostPrice().add(
							cd.getAmt());
					cost.setCurrentCostPrice(cCosts);
				}
			}
			cost.add(cd.getAmt(), cd.getQty());
			s_log.finer("Inv - LastInv - " + cost);
		} else if (cd.getM_InOutLine_ID() != 0 // AR Shipment Detail Record
				|| cd.getM_MovementLine_ID() != 0
				|| cd.getM_InventoryLine_ID() != 0
				|| cd.getM_ProductionLine_ID() != 0
				|| cd.getC_ProjectIssue_ID() != 0
				|| cd.getPP_Cost_Collector_ID() != 0) {

			cost.setCurrentQty(cost.getCurrentQty().add(cd.getQty()));
			s_log.finer("QtyAdjust - LastInv - " + cost);
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
	}
}
