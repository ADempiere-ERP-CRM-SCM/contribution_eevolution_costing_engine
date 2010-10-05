/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * Copyright (C) 2003-2007 e-Evolution,SC. All Rights Reserved.               *
 * Contributor(s): Victor Perez www.e-evolution.com                           *
 *                 Teo Sarca, www.arhipac.ro                                  *
 *****************************************************************************/

package org.eevolution.model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;

import org.compiere.model.I_M_CostDetail;
import org.compiere.model.I_M_Transaction;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MTransaction;
import org.compiere.model.Query;
import org.compiere.util.Env;

/**
 * PP Order Cost Model.
 *
 * @author Victor Perez www.e-evolution.com     
 * @author Teo Sarca, www.arhipac.ro
 */
public class MPPOrderCost extends X_PP_Order_Cost
{
	private static final long serialVersionUID = 1L;

	/**
	 * Get Actual Cost of Parent Product Based on Cost Type
	 * @param order
	 * @param M_CostType_ID
	 * @param trxName
	 * @return
	 */
	public static BigDecimal getParentActualCostByCostType(MPPOrder order,int M_CostType_ID, int M_CostElement_ID)
	{
		StringBuffer whereClause = new StringBuffer();
		
		whereClause.append(MCostDetail.COLUMNNAME_M_CostType_ID + "=? AND ");
		whereClause.append(MCostDetail.COLUMNNAME_M_CostElement_ID + "=? AND ");
		whereClause.append(MCostDetail.COLUMNNAME_PP_Cost_Collector_ID);
		whereClause.append(" IN (SELECT PP_Cost_Collector_ID FROM PP_Cost_Collector cc WHERE cc.PP_Order_ID=? AND ");
		whereClause.append(" cc.CostCollectorType <> '").append(MPPCostCollector.COSTCOLLECTORTYPE_MaterialReceipt).append("')");
		
		BigDecimal actualCost = new Query(order.getCtx(), I_M_CostDetail.Table_Name, whereClause.toString(), order.get_TrxName())
		.setClient_ID()
		.setParameters(M_CostType_ID, M_CostElement_ID, order.getPP_Order_ID())
		.sum("("+MCostDetail.COLUMNNAME_Amt + "+" + MCostDetail.COLUMNNAME_CostAmtLL+")");
		
		whereClause = new StringBuffer();
		whereClause.append(" EXISTS (SELECT 1 FROM PP_Cost_Collector cc WHERE PP_Cost_Collector_ID=M_Transaction.PP_Cost_Collector_ID AND cc.PP_Order_ID=? AND cc.M_Product_ID=? )");
		BigDecimal qtyDelivered = new Query(order.getCtx(), I_M_Transaction.Table_Name, whereClause.toString(), order.get_TrxName())
		.setClient_ID()
		.setParameters(order.getPP_Order_ID(), order.getM_Product_ID())
		.sum(MTransaction.COLUMNNAME_MovementQty);
		
		if (actualCost==null)
			actualCost = Env.ZERO;
		
		if(qtyDelivered.signum() > 0)
			actualCost = actualCost.divide(order.getQtyDelivered());
				
		return actualCost.negate();
	}
	
	
	public MPPOrderCost(Properties ctx, int PP_Order_Cost_ID,String trxName)
	{
		super (ctx, PP_Order_Cost_ID, trxName);
	}	//	MOrder

	public MPPOrderCost(Properties ctx, ResultSet rs, String trxName)
	{
		super (ctx, rs, trxName);
	}	//	MOrder

	/**
	 * Peer constructor
	 * @param cost
	 * @param PP_Order_ID
	 */
	public MPPOrderCost(MCost cost, int PP_Order_ID, String trxName)
	{
		this(cost.getCtx(), 0, trxName);
		setClientOrg(cost);
		setPP_Order_ID(PP_Order_ID);
		setC_AcctSchema_ID(cost.getC_AcctSchema_ID());
		setM_CostType_ID(cost.getM_CostType_ID());
		setCumulatedAmt(cost.getCumulatedAmt());
		setCumulatedQty(cost.getCumulatedQty());
		setCurrentCostPrice(cost.getCurrentCostPrice());
		setCurrentCostPriceLL(cost.getCurrentCostPriceLL());
		setM_Product_ID(cost.getM_Product_ID());
		setM_AttributeSetInstance_ID(cost.getM_AttributeSetInstance_ID());
		setM_CostElement_ID(cost.getM_CostElement_ID());
	}
}
