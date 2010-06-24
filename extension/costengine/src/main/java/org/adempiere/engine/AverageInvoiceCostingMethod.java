/**
 * 
 */
package org.adempiere.engine;

import java.util.Properties;

import org.compiere.model.I_M_CostDetail;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.util.CLogger;

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
		return;
		}

	}


