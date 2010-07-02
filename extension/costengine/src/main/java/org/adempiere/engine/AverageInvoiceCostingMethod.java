/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.I_M_CostDetail;
import org.compiere.model.I_M_Transaction;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MCostElement;
import org.compiere.model.MProduct;
import org.compiere.model.ProductCost;
import org.compiere.util.CLogger;
import org.compiere.util.Env;

/**
 * @author anca_bradau
 *
 */
public class AverageInvoiceCostingMethod implements ICostingMethod {


	@Override
	public void process(Properties ctx, I_M_CostDetail cd, String trxName)
	{
		MCost cost = ((MCostDetail)cd).getM_Cost();
		CLogger s_log = CLogger.getCLogger (AverageInvoiceCostingMethod.class);
		if (cd.getC_InvoiceLine_ID() != 0)
		{
			cost.setWeightedAverage(cd.getAmt(), cd.getQty());
			s_log.finer("Inv - AverageInv - " + cost);
		}
		else if (cd.getC_LandedCostAllocation_ID()!=0)
		{
			cost.setWeightedAverage(cd.getAmt(), cd.getQty());
			s_log.finer("Inv - AverageInv - " + cost);
		}
		else if (cd.getM_InOutLine_ID() != 0 		//	AR Shipment Detail Record  
				|| cd.getM_MovementLine_ID() != 0 
				|| cd.getM_InventoryLine_ID() != 0
				|| cd.getM_ProductionLine_ID() != 0
				|| cd.getC_ProjectIssue_ID() != 0
				|| cd.getPP_Cost_Collector_ID() != 0)
		{
			boolean addition = cd.getQty().signum() > 0;
			//
			if (addition)
				cost.setWeightedAverage(cd.getAmt(), cd.getQty());
			else
				cost.setCurrentQty(cost.getCurrentQty().add(cd.getQty()));
			s_log.finer("QtyAdjust - AverageInv - " + cost);
			
		}
		cost.saveEx();
		return;
	}

	@Override
	public List<CostComponent> getCostComponents(MAcctSchema as,
			IDocumentLine model, I_M_Transaction mtrx)
			
   {
		MCost[] costs = MCost.getForProduct(as.getCtx(), model.getM_Product_ID(), model.getAD_Org_ID(), model.get_TrxName());
		BigDecimal cc = null ;
		List<CostComponent> list = new ArrayList<CostComponent>();
		for (MCost cost : costs)
		{
			//TODO: need evaluate this!
			if (MCostElement.COSTINGMETHOD_AverageInvoice.equals(cost.getCostingMethod())
					&& cost.getCurrentCostPrice()!= Env.ZERO)
			//if  (cost.getM_CostElement().getName().equals("Average Invoice")
			//		&& cost.getM_CostType().getName().equals("Average Invoice")
			{
				cc = cost.getCurrentCostPrice();
				list.add(new CostComponent(model.getMovementQty(), cc));
			}
		}
		return list;
		}

}


