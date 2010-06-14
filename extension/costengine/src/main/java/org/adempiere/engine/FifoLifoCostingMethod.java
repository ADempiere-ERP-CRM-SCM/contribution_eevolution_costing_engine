/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.Properties;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.I_M_CostDetail;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MCostElement;
import org.compiere.model.MCostQueue;
import org.compiere.model.MProduct;
import org.compiere.util.CLogger;
import org.compiere.util.Env;

/**
 * @author teo_sarca
 * @author anca_bradau
 */
public class FifoLifoCostingMethod implements ICostingMethod //extends AbstractCostingMethod
{
	@Override
	public void process(Properties ctx, I_M_CostDetail cd, String trxName, MCost cost)
	{
		// TODO
		boolean addition = cd.getQty().signum() > 0;
		MAcctSchema as =  MAcctSchema.get(ctx, cd.getC_AcctSchema_ID());
		int precision = as.getCostingPrecision();
		MProduct product = MProduct.get(ctx, cd.getM_Product_ID());
		BigDecimal price = cd.getAmt();
		
		if (cd.getQty().signum() != 0)
			price = cd.getAmt().divide(cd.getQty(), precision, BigDecimal.ROUND_HALF_UP);

		int AD_Org_ID = cd.getAD_Org_ID();
		int M_ASI_ID = cd.getM_AttributeSetInstance_ID();
		MCostElement ce = MCostElement.get(ctx, cd.getM_CostElement_ID());
		
		CLogger s_log = CLogger.getCLogger (FifoLifoCostingMethod.class);
		
		if (cd.getC_OrderLine_ID() != 0)
		{
			s_log.finer("Inv - FiFo/LiFo - amt=" + cd.getAmt() + ", qty=" + cd.getQty() + " [NOTHING TO DO]");	
		}
		else if (cd.getM_InOutLine_ID() != 0 		//	AR Shipment Detail Record  
				|| cd.getM_MovementLine_ID() != 0 
				|| cd.getM_InventoryLine_ID() != 0
				|| cd.getM_ProductionLine_ID() != 0
				|| cd.getC_ProjectIssue_ID() != 0
				|| cd.getPP_Cost_Collector_ID() != 0)
		{
		if (addition)
			{
				//	Real ASI - costing level Org
				// teo_sarca: modified
				MCostQueue.add(product, M_ASI_ID,
						as, AD_Org_ID, cd.getM_CostElement_ID(),
						cd.getAmt(), cd.getQty(), precision,
						(MCostDetail) cd, trxName);
				//					MCostQueue cq = MCostQueue.get(product, getM_AttributeSetInstance_ID(), 
				//						as, Org_ID, ce.getM_CostElement_ID(), get_TrxName());
				//					cq.setCosts(amt, qty, precision);
				//					cq.save();
			}
			else
			{
				//	Adjust Queue - costing level Org/ASI
				BigDecimal amtQueue = MCostQueue.adjustQty(product, M_ASI_ID, 
						as, AD_Org_ID, ce, cd.getQty().negate(), (MCostDetail) cd, trxName);
				amtQueue = amtQueue.negate(); // outgoing amt should be negative
				if (cd.getAmt().compareTo(amtQueue) != 0)
				{
					BigDecimal priceQueue = Env.ZERO;
					if (cd.getQty().signum() != 0)
						priceQueue = amtQueue.divide(cd.getQty(), precision, BigDecimal.ROUND_HALF_UP);
					s_log.warning("Amt not match "+this+": price="+price+", priceQueue="+priceQueue+" [ADJUSTED]");
					// FIXME: teo_sarca: should not happen
					if ("Y".equals(Env.getContext(ctx, "#M_CostDetail_CorrectAmt")))
					{
						cd.setAmt(amtQueue);
						cd.setAmt(amtQueue);
						cd.setPrice(priceQueue);
					}
					else
					{
						throw new AdempiereException("Amt not match "+this+": price="+price+", priceQueue="+priceQueue); 
					}
				}
				/** TEO: END ----------------------------------------------------------------------------- */
			}
			//	Get Costs - costing level Org/ASI
			MCostQueue[] cQueue = MCostQueue.getQueue(product, M_ASI_ID, 
					as, AD_Org_ID, ce, cd.getDateAcct(), trxName);
			if (cQueue != null && cQueue.length > 0)
				cost.setCurrentCostPrice(cQueue[0].getCurrentCostPrice());
			cost.setCurrentQty(cost.getCurrentQty().add(cd.getQty()));
			// teo_sarca: Cumulate Amt & Qty
			if (cQueue != null && cQueue.length > 0)
			{
				BigDecimal cAmt = cQueue[0].getCurrentCostPrice().multiply(cd.getQty());
				cost.setCumulatedAmt(cost.getCumulatedAmt().add(cAmt));
				cost.setCumulatedQty(cost.getCumulatedQty().add(cd.getQty()));
			}
			cost.saveEx();
			s_log.finer("QtyAdjust - FiFo/Lifo - " + cost);
			
		}
		
	}
}


		
