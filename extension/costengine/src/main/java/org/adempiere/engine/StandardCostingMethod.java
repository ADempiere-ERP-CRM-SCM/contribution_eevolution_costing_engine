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
import org.compiere.model.MProduct;
import org.compiere.util.CLogger;

/**
 * @author anca_bradau
 * 
 */
public class StandardCostingMethod implements ICostingMethod {
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
	}
}
