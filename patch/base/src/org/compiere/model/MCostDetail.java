/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                        *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
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
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.compiere.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;
import java.util.logging.Level;

import org.adempiere.engine.CostingMethodFactory;
import org.adempiere.engine.ICostingMethod;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;

/**
 * 	Cost Detail Model
 *	
 *  @author Jorg Janke
 *  @author Armen Rizal, Goodwill Consulting
 *  	<li>BF: 2431123 Return Trx changes weighted average cost
 *  	<li>BF: 1568752 Average invoice costing: landed costs incorrectly applied
 *  @author Armen Rizal & Bayu Cahya
 *  	<li>BF [ 2129781 ] Cost Detail not created properly for multi acc schema
 *  @version $Id: MCostDetail.java,v 1.3 2006/07/30 00:51:05 jjanke Exp $
 *  
 */
public class MCostDetail extends X_M_CostDetail
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5452006110417178583L;


	/*public static boolean createOrder (MAcctSchema as, int AD_Org_ID, 
			int M_Product_ID, int M_AttributeSetInstance_ID,
			int C_OrderLine_ID, int M_CostElement_ID, 
			BigDecimal Amt, BigDecimal Qty,
			String Description, String trxName, int mtrxID)*/
	
	/*public static boolean createInvoice (MAcctSchema as, int AD_Org_ID, 
			int M_Product_ID, int M_AttributeSetInstance_ID,
			int C_InvoiceLine_ID, int M_CostElement_ID, 
			BigDecimal Amt, BigDecimal Qty,
			String Description, String trxName, int mtrxID)*/
	
	/*public static boolean createShipment (MAcctSchema as, int AD_Org_ID, 
			int M_Product_ID, int M_AttributeSetInstance_ID,
			int M_InOutLine_ID, int M_CostElement_ID, 
			BigDecimal Amt, BigDecimal Qty,
			String Description, boolean IsSOTrx, String trxName, int mtrxID)*/
	

	/*public static boolean createInventory (MAcctSchema as, int AD_Org_ID, 
			int M_Product_ID, int M_AttributeSetInstance_ID,
			int M_InventoryLine_ID, int M_CostElement_ID, 
			BigDecimal Amt, BigDecimal Qty,
			String Description, String trxName, int mtrxID)*/
	
	/*public static boolean createMovement (MAcctSchema as, int AD_Org_ID, 
			int M_Product_ID, int M_AttributeSetInstance_ID,
			int M_MovementLine_ID, int M_CostElement_ID, 
			BigDecimal Amt, BigDecimal Qty, boolean from,
			String Description, String trxName)*/

	/*public static boolean createMovement (MAcctSchema as, int AD_Org_ID, 
			int M_Product_ID, int M_AttributeSetInstance_ID,
			int M_MovementLine_ID, int M_CostElement_ID, 
			BigDecimal Amt, BigDecimal Qty, boolean from,
			boolean autoProcess, // anca_bradau
			String Description, String trxName)*/
	
	/**
	 * 	Create New Order Cost Detail for Production.
	 * 	Called from Doc_Production
	 *	@param as accounting schema
	 *	@param AD_Org_ID org
	 *	@param M_Product_ID product
	 *	@param M_AttributeSetInstance_ID asi
	 *	@param M_ProductionLine_ID production line
	 *	@param M_CostElement_ID optional cost element
	 *	@param Amt amt total amount
	 *	@param Qty qty
	 *	@param Description optional description
	 *	@param trxName transaction
	 *	@return true if no error
	 */
	public static boolean createProduction (MAcctSchema as, int AD_Org_ID, 
			int M_Product_ID, int M_AttributeSetInstance_ID,
			int M_ProductionLine_ID, int M_CostElement_ID, 
			BigDecimal Amt, BigDecimal Qty,
			String Description, String trxName)
	{
		//	Delete Unprocessed zero Differences
		String sql = "DELETE M_CostDetail "
			+ "WHERE Processed='N' AND COALESCE(DeltaAmt,0)=0 AND COALESCE(DeltaQty,0)=0"
			+ " AND M_ProductionLine_ID=" + M_ProductionLine_ID
			+ " AND C_AcctSchema_ID =" + as.getC_AcctSchema_ID()
			+ " AND M_AttributeSetInstance_ID=" + M_AttributeSetInstance_ID;
		int no = DB.executeUpdate(sql, trxName);
		if (no != 0)
			s_log.config("Deleted #" + no);
		MCostDetail cd = get (as.getCtx(), "M_ProductionLine_ID=?", 
				M_ProductionLine_ID, M_AttributeSetInstance_ID, as.getC_AcctSchema_ID(), trxName);
		//
		if (cd == null)		//	createNew
		{
			MCostType[] mcost = null;
			mcost = MCostType.get(as.getCtx(), as.get_TrxName());
			for (MCostType mc : mcost)
			{	
				int M_CostType_ID = mc.get_ID();
				cd = new MCostDetail (as, AD_Org_ID, 
						M_Product_ID, M_AttributeSetInstance_ID, 
						M_CostElement_ID, 
						Amt, Qty, Description, trxName, M_CostType_ID);
				cd.setM_ProductionLine_ID(M_ProductionLine_ID);
			}
		}
		else
		{
			// MZ Goodwill
			// set deltaAmt=Amt, deltaQty=qty, and set Cost Detail for Amt and Qty	 
			cd.setDeltaAmt(Amt.subtract(cd.getAmt()));
			cd.setDeltaQty(Qty.subtract(cd.getQty()));
			if (cd.isDelta())
			{
				cd.setProcessed(false);
				cd.setAmt(Amt);
				cd.setQty(Qty);
			}
			// end MZ
			else
				return true;	//	nothing to do
		}
		boolean ok = cd.save();
		if (ok && !cd.isProcessed())
		{
			MClient client = MClient.get(as.getCtx(), as.getAD_Client_ID());
			if (client.isCostImmediate())
				cd.process();
		}
		s_log.config("(" + ok + ") " + cd);
		return ok;
	}	//	createProduction


	/**************************************************************************
	 * 	Get Cost Detail
	 *	@param ctx context
	 *	@param whereClause where clause
	 *	@param ID 1st parameter
	 *  @param M_AttributeSetInstance_ID ASI
	 *	@param trxName trx
	 *	@return cost detail
	 */
	public static MCostDetail get (Properties ctx, String whereClause, 
			int ID, int M_AttributeSetInstance_ID, int C_AcctSchema_ID, String trxName)
	{
		String whereClauseFinal = whereClause
		+ " AND M_AttributeSetInstance_ID=?"
		+ " AND C_AcctSchema_ID=?";
		//DB.getSQLValue(trxName, "select COUNT(*) FROM ("+sql+")", ID, M_AttributeSetInstance_ID, C_AcctSchema_ID);
		MCostDetail retValue = new Query(ctx, Table_Name, whereClauseFinal, trxName)
		.setParameters(new Object[]{ID, M_AttributeSetInstance_ID, C_AcctSchema_ID})
		.first();
		return retValue;
	}	//	get

	/**
	 * 	Process Cost Details for product
	 *	@param product product
	 *	@param trxName transaction
	 *	@return true if no error
	 */
	public static boolean processProduct (MProduct product, String trxName)
	{
		String sql = "SELECT * FROM M_CostDetail "
			+ "WHERE M_Product_ID=?"
			+ " AND Processed='N' "
			+ "ORDER BY C_AcctSchema_ID, M_CostElement_ID, AD_Org_ID, M_AttributeSetInstance_ID, Created";
		int counterOK = 0;
		int counterError = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement (sql, trxName);
			pstmt.setInt (1, product.getM_Product_ID());
			rs = pstmt.executeQuery ();
			while (rs.next ())
			{
				MCostDetail cd = new MCostDetail(product.getCtx(), rs, trxName);
				if (cd.process())	//	saves
					counterOK++;
				else
					counterError++;
			}
			rs.close ();
			pstmt.close ();
			pstmt = null;
		}
		catch (Exception e)
		{
			s_log.log (Level.SEVERE, sql, e);
			counterError++;
		}
		finally
		{
			DB.close(rs, pstmt);
			rs = null; pstmt = null;
		}

		s_log.config("OK=" + counterOK + ", Errors=" + counterError);
		return counterError == 0;
	}	//	processProduct

	/**	Logger	*/
	private static CLogger 	s_log = CLogger.getCLogger (MCostDetail.class);


	/**************************************************************************
	 * 	Standard Constructor
	 *	@param ctx context
	 *	@param M_CostDetail_ID id
	 *	@param trxName trx
	 */
	public MCostDetail (Properties ctx, int M_CostDetail_ID, String trxName)
	{
		super (ctx, M_CostDetail_ID, trxName);
		if (M_CostDetail_ID == 0)
		{
			//	setC_AcctSchema_ID (0);
			//	setM_Product_ID (0);
			setM_AttributeSetInstance_ID (0);
			//	setC_OrderLine_ID (0);
			//	setM_InOutLine_ID(0);
			//	setC_InvoiceLine_ID (0);
			setProcessed (false);
			setAmt (Env.ZERO);
			setQty (Env.ZERO);
			setIsSOTrx (false);
			setDeltaAmt (Env.ZERO);
			setDeltaQty (Env.ZERO);
		}	
	}	//	MCostDetail

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName trx
	 */
	public MCostDetail (Properties ctx, ResultSet rs, String trxName)
	{
		super (ctx, rs, trxName);
	}	//	MCostDetail

	/**
	 * 	New Constructor
	 *	@param as accounting schema
	 *	@param AD_Org_ID org
	 *	@param M_Product_ID product
	 *	@param M_AttributeSetInstance_ID asi
	 *	@param M_CostElement_ID optional cost element for Freight
	 *	@param Amt amt
	 *	@param Qty qty
	 *	@param Description optional description
	 *	@param trxName transaction
	 * @param M_CostType_ID 
	 */
	public MCostDetail (MAcctSchema as, int AD_Org_ID, 
			int M_Product_ID, int M_AttributeSetInstance_ID,
			int M_CostElement_ID, BigDecimal Amt, BigDecimal Qty,
			String Description, String trxName, int M_CostType_ID)
	{
		this (as.getCtx(), 0, trxName);
		setClientOrg(as.getAD_Client_ID(), AD_Org_ID);
		setC_AcctSchema_ID (as.getC_AcctSchema_ID());
		setM_Product_ID (M_Product_ID);
		setM_AttributeSetInstance_ID (M_AttributeSetInstance_ID);
		//
		setM_CostElement_ID(M_CostElement_ID);
		setM_CostType_ID(M_CostType_ID);
		//
		setAmt (Amt);
		setQty (Qty);
		setDescription(Description);
	}	//	MCostDetail

	/**
	 * @param cost
	 * @param amt
	 * @param qty
	 */
	public MCostDetail(MCost cost, BigDecimal amt, BigDecimal qty)
	{
		this (cost.getCtx(), 0, cost.get_TrxName());
		setClientOrg(cost.getAD_Client_ID(), cost.getAD_Org_ID());
		setC_AcctSchema_ID(cost.getC_AcctSchema_ID());
		setM_Product_ID(cost.getM_Product_ID());
		setM_AttributeSetInstance_ID(cost.getM_AttributeSetInstance_ID());
		//
		setM_CostType_ID(cost.getM_CostType_ID());
		setM_CostElement_ID(cost.getM_CostElement_ID());
		setCostingMethod(cost.getCostingMethod()); 
		//
		setAmt(amt);
		setQty(qty);
		setDescription(cost.getDescription());
	}
	/**
	 * 	Set Amt
	 *	@param Amt amt
	 */
	public void setAmt (BigDecimal Amt)
	{
		if (isProcessed())
			throw new IllegalStateException("Cannot change Amt - processed");
		if (Amt == null)
			super.setAmt (Env.ZERO);
		else
			super.setAmt (Amt);
	}	//	setAmt

	/**
	 * 	Set Qty
	 *	@param Qty qty
	 */
	public void setQty (BigDecimal Qty)
	{
		if (isProcessed())
			throw new IllegalStateException("Cannot change Qty - processed");
		if (Qty == null)
			super.setQty (Env.ZERO);
		else
			super.setQty (Qty);
	}	//	setQty

	/**
	 * 	Is Order
	 *	@return true if order line
	 */
	public boolean isOrder()
	{
		return getC_OrderLine_ID() != 0;
	}	//	isOrder

	/**
	 * 	Is Invoice
	 *	@return true if invoice line
	 */
	public boolean isInvoice()
	{
		return getC_InvoiceLine_ID() != 0;
	}	//	isInvoice

	/**
	 * 	Is Shipment
	 *	@return true if sales order shipment
	 */
	public boolean isShipment()
	{
		return isSOTrx() && getM_InOutLine_ID() != 0;
	}	//	isShipment

	/**
	 * 	Is this a Delta Record (previously processed)?
	 *	@return true if delta is not null
	 */
	public boolean isDelta()
	{
		return !(getDeltaAmt().signum() == 0 
				&& getDeltaQty().signum() == 0);
	}	//	isDelta


	/**
	 * 	After Save
	 *	@param newRecord new
	 *	@param success success
	 *	@return true
	 */
	protected boolean afterSave (boolean newRecord, boolean success)
	{
		return true;
	}	//	afterSave

	/**
	 * 	Before Delete
	 *	@return false if processed
	 */
	protected boolean beforeDelete ()
	{
		return !isProcessed();
	}	//	beforeDelete


	/**
	 * 	String Representation
	 *	@return info
	 */
	public String toString ()
	{
		StringBuffer sb = new StringBuffer ("MCostDetail[");
		sb.append (get_ID());
		if (getC_OrderLine_ID() != 0)
			sb.append (",C_OrderLine_ID=").append (getC_OrderLine_ID());
		if (getM_InOutLine_ID() != 0)
			sb.append (",M_InOutLine_ID=").append (getM_InOutLine_ID());
		if (getC_InvoiceLine_ID() != 0)
			sb.append (",C_InvoiceLine_ID=").append (getC_InvoiceLine_ID());
		if (getC_ProjectIssue_ID() != 0)
			sb.append (",C_ProjectIssue_ID=").append (getC_ProjectIssue_ID());
		if (getM_MovementLine_ID() != 0)
			sb.append (",M_MovementLine_ID=").append (getM_MovementLine_ID());
		if (getM_InventoryLine_ID() != 0)
			sb.append (",M_InventoryLine_ID=").append (getM_InventoryLine_ID());
		if (getM_ProductionLine_ID() != 0)
			sb.append (",M_ProductionLine_ID=").append (getM_ProductionLine_ID());
		if (getM_AttributeSetInstance_ID() != 0)
			sb.append(",ASI=").append(getM_AttributeSetInstance_ID());
		sb.append(",Amt=").append(getAmt())
		.append(",Qty=").append(getQty());
		if (isDelta())
			sb.append(",DeltaAmt=").append(getDeltaAmt())
			.append(",DeltaQty=").append(getDeltaQty());
		sb.append ("]");
		return sb.toString ();
	}	//	toString


	/**************************************************************************
	 * 	Process Cost Detail Record.
	 * 	The record is saved if processed.
	 *	@return true if processed
	 */
	public synchronized boolean process()
	{
		if (isProcessed())
		{
			log.info("Already processed");
			return true;
		}
		boolean ok = false;

		//	get costing level for product
		MAcctSchema as = MAcctSchema.get(getCtx(), getC_AcctSchema_ID());
		MProduct product = MProduct.get(getCtx(), getM_Product_ID());
		String CostingLevel = product.getCostingLevel(as);
		//	Org Element
		int Org_ID = getAD_Org_ID();
		int M_ASI_ID = getM_AttributeSetInstance_ID();
		if (MAcctSchema.COSTINGLEVEL_Client.equals(CostingLevel))
		{
			Org_ID = 0;
			M_ASI_ID = 0;
		}
		else if (MAcctSchema.COSTINGLEVEL_Organization.equals(CostingLevel))
			M_ASI_ID = 0;
		else if (MAcctSchema.COSTINGLEVEL_BatchLot.equals(CostingLevel))
			Org_ID = 0;

		// teo_sarca: begin
		//	Movement: If the costing level is not Organization, then we don't need to alter the costs (specially FIFO/LIFO queue)
		if (getM_MovementLine_ID() > 0 
				&& !MAcctSchema.COSTINGLEVEL_Organization.equals(CostingLevel))
		{
			ok = true;
		}
		else
			//teo_sarca: end
			//	Create Material Cost elements
			if (getM_CostElement_ID() == 0)
			{
				MCostElement[] ces = MCostElement.getCostingMethods(this);
				for (int i = 0; i < ces.length; i++)
				{
					MCostElement ce = ces[i];
					ok = process (as, product, ce, Org_ID, M_ASI_ID);
					if (!ok)
						break;
				}
			}	//	Material Cost elements
			else
			{
				MCostElement ce = MCostElement.get(getCtx(), getM_CostElement_ID());
				ok = process (as, product, ce, Org_ID, M_ASI_ID);
			}

		//	Save it
		if (ok)
		{
			setDeltaAmt(null);
			setDeltaQty(null);
			setProcessed(true);
			ok = save();
		}
		log.info(ok + " - " + toString());
		return ok;
	}	//	process

	/**
	 * 	Process cost detail for cost record
	 *	@param as accounting schema
	 *	@param product product
	 *	@param ce cost element
	 *	@param Org_ID org - corrected for costing level
	 *	@param M_ASI_ID - asi corrected for costing level
	 *	@return true if cost ok
	 */
	private boolean process (MAcctSchema as, MProduct product, MCostElement ce, int Org_ID, int M_ASI_ID)
	{
		// teo_sarca: begin        commented by anca
		/*if (getM_InOutLine_ID() != 0 && !isSOTrx() && !ce.isFifo() && !ce.isLifo())
		{
			// If is Receipt and is not FIFO/LIFO costing method, then do nothing - like in original version
			if (CLogMgt.isLevelFine()) log.fine("SKIP: this=" + this + ", ce=" + ce);
			return true;
		}*/
		// teo_sarca: end
//		MCostType[] mcost = null;
//		mcost = MCostType.get(product.getCtx(), product.get_TrxName());

//		for (MCostType mc : mcost)
//		{
			MCostType mc = (MCostType)getM_CostType();
			m_cost = MCost.get(product, M_ASI_ID, as, Org_ID, ce.getM_CostElement_ID(),
					mc, null /*getCostingMethod()*/, get_TrxName());
			
			if (ce.isFifo() && mc.getName().equalsIgnoreCase("Fifo")   //TODO dont use this!
				|| ce.isAverageInvoice() && mc.getName().equalsIgnoreCase("Average Invoice"))
			{
			CostingMethodFactory cmFactory = CostingMethodFactory.get();
			ICostingMethod cm = cmFactory.getCostingMethod(ce);
			cm.process(getCtx(), this, get_TrxName());
			}
			//	if (cost == null)
			//		cost = new MCost(product, M_ASI_ID, 
			//			as, Org_ID, ce.getM_CostElement_ID());

			// MZ Goodwill
			// used deltaQty and deltaAmt if exist 
			/*BigDecimal qty = Env.ZERO;
			BigDecimal amt = Env.ZERO;
			//comment anca		
			//		if (isDelta())
			//		{
			//			qty = getDeltaQty();
			//			amt = getDeltaAmt();
			//		}
			//		else
			{
				qty = getQty();
				amt = getAmt();
			}
			// end MZ

			int precision = as.getCostingPrecision();
			BigDecimal price = amt;
			if (qty.signum() != 0)
				price = amt.divide(qty, precision, BigDecimal.ROUND_HALF_UP);

			*//** All Costing Methods
		if (ce.isAverageInvoice())
		else if (ce.isAveragePO())
		else if (ce.isFifo())
		else if (ce.isLifo())
		else if (ce.isLastInvoice())
		else if (ce.isLastPOPrice())
		else if (ce.isStandardCosting())
		else if (ce.isUserDefined())
		else if (!ce.isCostingMethod())
			 **//*

			//	*** Purchase Order Detail Record ***
			if (getC_OrderLine_ID() != 0)
			{		
				boolean isReturnTrx = qty.signum() < 0;

				if (ce.isAveragePO())
				{
					cost.setWeightedAverage(amt, qty);
					log.finer("PO - AveragePO - " + cost);
				}
				else if (ce.isLastPOPrice())
				{
					if(!isReturnTrx)
					{
						if (qty.signum() != 0)
							cost.setCurrentCostPrice(price);
						else
						{
							BigDecimal cCosts = cost.getCurrentCostPrice().add(amt);
							cost.setCurrentCostPrice(cCosts);
						}
					}
					cost.add(amt, qty);
					log.finer("PO - LastPO - " + cost);
				}
				else if (ce.isUserDefined())
				{
					//	Interface
					log.finer("PO - UserDef - " + cost);
				}
				else if (!ce.isCostingMethod())
				{
					log.finer("PO - " + ce + " - " + cost);
				}
				//	else
				//		log.warning("PO - " + ce + " - " + cost);
			}

			//	*** AP Invoice Detail Record ***
			else if (getC_InvoiceLine_ID() != 0)
			{
				boolean isReturnTrx = qty.signum() < 0;

				if (ce.isAverageInvoice())
				{
					cost.setWeightedAverage(amt, qty);
					log.finer("Inv - AverageInv - " + cost);
				}
				//else
				if (ce.isFifo()
						|| ce.isLifo())
				{
					// teo_sarca: Cost is created on receipt and the match invoice should check
					// the difference between receipt price and invoice price
					// so, do nothing here
					log.finer("Inv - FiFo/LiFo - amt=" + amt + ", qty=" + qty + " [NOTHING TO DO]");
				}
				else if (ce.isLastInvoice())
				{
					if (!isReturnTrx)
					{
						if (qty.signum() != 0)
							cost.setCurrentCostPrice(price);
						else
						{
							BigDecimal cCosts = cost.getCurrentCostPrice().add(amt);
							cost.setCurrentCostPrice(cCosts);
						}
					}
					cost.add(amt, qty);
					log.finer("Inv - LastInv - " + cost);
				}
				else if (ce.isStandardCosting())
				{
					if (cost.getCurrentCostPrice().signum() == 0)
					{
						cost.setCurrentCostPrice(price);
						//	seed initial price
						if (cost.getCurrentCostPrice().signum() == 0 
								&& cost.get_ID() == 0)
							cost.setCurrentCostPrice(
									MCost.getSeedCosts(product, M_ASI_ID, 
											as, Org_ID, ce.getCostingMethod(), getC_OrderLine_ID()));
					}
					cost.add(amt, qty);
					log.finer("Inv - Standard - " + cost);
				}
				else if (ce.isUserDefined())
				{
					//	Interface
					cost.add(amt, qty);
					log.finer("Inv - UserDef - " + cost);
				}
				else if (!ce.isCostingMethod())		//	Cost Adjustments
				{
					// AZ Goodwill
					//get costing method for product
					String costingMethod = product.getCostingMethod(as);				
					if (MAcctSchema.COSTINGMETHOD_AveragePO.equals(costingMethod) ||
							MAcctSchema.COSTINGMETHOD_AverageInvoice.equals(costingMethod))
					{
						if (cost.getCurrentQty().compareTo(Env.ZERO) == 0)
						{
							//initialize current qty for new landed cost element 
							String sql = "SELECT QtyOnHand FROM M_Storage"					
								+ " WHERE AD_Client_ID=" + cost.getAD_Client_ID()
								+ " AND AD_Org_ID=" + cost.getAD_Org_ID()
								+ " AND M_Product_ID=" + cost.getM_Product_ID()
								+ " AND M_AttributeSetInstance_ID=" + M_ASI_ID;				
							if (M_ASI_ID == 0)
								sql = "SELECT SUM(QtyOnHand) FROM M_Storage"
									+ " WHERE AD_Client_ID=" + cost.getAD_Client_ID()
									+ " AND AD_Org_ID=" + cost.getAD_Org_ID()
									+ " AND M_Product_ID=" + cost.getM_Product_ID();
							BigDecimal bd = DB.getSQLValueBD(get_TrxName(), sql);
							if (bd != null)
								cost.setCurrentQty(bd.subtract(qty)); // (initial qty = onhand qty - allocated qty)
						}
						cost.setWeightedAverage(amt, qty); //also get averaged
					}
					else //original logic from Compiere
					{
						BigDecimal cCosts = cost.getCurrentCostPrice().add(amt);
						cost.setCurrentCostPrice(cCosts);
						cost.add(amt, qty);
					}
					// end AZ
					log.finer("Inv - none - " + cost);
				}
				//	else
				//		log.warning("Inv - " + ce + " - " + cost);
			}

			//	*** Qty Adjustment Detail Record ***
			else if (getM_InOutLine_ID() != 0 		//	AR Shipment Detail Record  
					|| getM_MovementLine_ID() != 0 
					|| getM_InventoryLine_ID() != 0
					|| getM_ProductionLine_ID() != 0
					|| getC_ProjectIssue_ID() != 0
					|| getPP_Cost_Collector_ID() != 0)
			{
				boolean addition = qty.signum() > 0;
				//
				if (ce.isAverageInvoice())
				{
					if (addition)
						cost.setWeightedAverage(amt, qty);
					else
						cost.setCurrentQty(cost.getCurrentQty().add(qty));
					log.finer("QtyAdjust - AverageInv - " + cost);
				}
				//else 
				if (ce.isAveragePO())
				{
					if (addition)
						cost.setWeightedAverage(amt, qty);
					else
						cost.setCurrentQty(cost.getCurrentQty().add(qty));
					log.finer("QtyAdjust - AveragePO - " + cost);
				}
				else if ((ce.isFifo() || ce.isLifo()) 
						&& mc.getName().equalsIgnoreCase("Fifo")) //TODO dont use this!
						{
					if (addition)
					{
						//	Real ASI - costing level Org
						// teo_sarca: modified
						MCostQueue.add(product, M_ASI_ID,
								as, Org_ID, ce.getM_CostElement_ID(),
								amt, qty, precision,
								this, get_TrxName());
						//					MCostQueue cq = MCostQueue.get(product, getM_AttributeSetInstance_ID(), 
						//						as, Org_ID, ce.getM_CostElement_ID(), get_TrxName());
						//					cq.setCosts(amt, qty, precision);
						//					cq.save();
					}
					else
					{
						//	Adjust Queue - costing level Org/ASI
						BigDecimal amtQueue = MCostQueue.adjustQty(product, M_ASI_ID, 
								as, Org_ID, ce, qty.negate(), this, get_TrxName());
						amtQueue = amtQueue.negate(); // outgoing amt should be negative
						if (amt.compareTo(amtQueue) != 0)
						{
							BigDecimal priceQueue = Env.ZERO;
							if (qty.signum() != 0)
								priceQueue = amtQueue.divide(qty, precision, BigDecimal.ROUND_HALF_UP);
							log.warning("Amt not match "+this+": price="+price+", priceQueue="+priceQueue+" [ADJUSTED]");
							// FIXME: teo_sarca: should not happen
							if ("Y".equals(Env.getContext(getCtx(), "#M_CostDetail_CorrectAmt")))
							{
								setAmt(amtQueue);
								amt = amtQueue;
								price = priceQueue;
							}
							else
							{
								throw new AdempiereException("Amt not match "+this+": price="+price+", priceQueue="+priceQueue); 
							}
						}
						*//** TEO: END ----------------------------------------------------------------------------- *//*
					}
					//	Get Costs - costing level Org/ASI
					MCostQueue[] cQueue = MCostQueue.getQueue(product, M_ASI_ID, 
							as, Org_ID, ce, getDateAcct(), get_TrxName());
					if (cQueue != null && cQueue.length > 0)
						cost.setCurrentCostPrice(cQueue[0].getCurrentCostPrice());
					cost.setCurrentQty(cost.getCurrentQty().add(qty));
					// teo_sarca: Cumulate Amt & Qty
					if (cQueue != null && cQueue.length > 0)
					{
						BigDecimal cAmt = cQueue[0].getCurrentCostPrice().multiply(qty);
						cost.setCumulatedAmt(cost.getCumulatedAmt().add(cAmt));
						cost.setCumulatedQty(cost.getCumulatedQty().add(qty));
					}
					cost.saveEx();
					log.finer("QtyAdjust - FiFo/Lifo - " + cost);
				}
				else if (ce.isLastInvoice())
				{
					cost.setCurrentQty(cost.getCurrentQty().add(qty));
					log.finer("QtyAdjust - LastInv - " + cost);
				}
				else if (ce.isLastPOPrice())
				{
					cost.setCurrentQty(cost.getCurrentQty().add(qty));
					log.finer("QtyAdjust - LastPO - " + cost);
				}
				else if (ce.isStandardCosting())
				{
					if (addition)
					{
						cost.add(amt, qty);
						//	Initial
						if (cost.getCurrentCostPrice().signum() == 0 
								&& cost.get_ID() == 0)
							cost.setCurrentCostPrice(price);
					}
					else
						cost.setCurrentQty(cost.getCurrentQty().add(qty));
					log.finer("QtyAdjust - Standard - " + cost);
				}
				else if (ce.isUserDefined())
				{
					//	Interface
					if (addition)
						cost.add(amt, qty);
					else
						cost.setCurrentQty(cost.getCurrentQty().add(qty));
					log.finer("QtyAdjust - UserDef - " + cost);
				}
				else if (!ce.isCostingMethod())
				{
					//	Should not happen
					log.finer("QtyAdjust - ?none? - " + cost);
				}
				else
					log.finer("QtyAdjust - " + ce + " - " + cost);
			}

			else	//	unknown or no id
			{
				log.warning("Unknown Type: " + toString());
				return true;
			}
		}
			//return cost.save();
	//}
*/		
//			}
		return true;
	}

	//	process

	// Elaine 2008/6/20	
	protected boolean afterDelete (boolean success)
	{
		if(success)
		{
			// recalculate MCost			
			boolean ok = false;
			//	get costing level for product
			MAcctSchema as = new MAcctSchema (getCtx(), getC_AcctSchema_ID(), null);
			MProduct product = MProduct.get(getCtx(), getM_Product_ID());
			String CostingLevel = product.getCostingLevel(as);
			//	Org Element
			int Org_ID = getAD_Org_ID();
			int M_ASI_ID = getM_AttributeSetInstance_ID();
			if (MAcctSchema.COSTINGLEVEL_Client.equals(CostingLevel))
			{
				Org_ID = 0;
				M_ASI_ID = 0;
			}
			else if (MAcctSchema.COSTINGLEVEL_Organization.equals(CostingLevel))
				M_ASI_ID = 0;
			else if (MAcctSchema.COSTINGLEVEL_BatchLot.equals(CostingLevel))
				Org_ID = 0;

			//	Create Material Cost elements
			if (getM_CostElement_ID() == 0)
			{
				MCostElement[] ces = MCostElement.getCostingMethods(this);
				for (int i = 0; i < ces.length; i++)
				{
					MCostElement ce = ces[i];
					ok = process (as, product, ce, Org_ID, M_ASI_ID);
					if (!ok)
						break;
				}
			}	//	Material Cost elements
			else
			{
				MCostElement ce = MCostElement.get(getCtx(), getM_CostElement_ID());
				ok = process (as, product, ce, Org_ID, M_ASI_ID);
			}

			return ok;
		}

		return super.afterDelete(success);
	}

	/**
	 * 	Create New Receipt Cost Detail for PO Receipt.
	 * 	Called from Doc_MInOut - for PO Receipt
	 *	@param as accounting schema
	 *	@param AD_Org_ID org
	 *	@param M_Product_ID product
	 *	@param M_AttributeSetInstance_ID asi
	 *	@param M_InOutLine_ID receipt
	 *	@param M_CostElement_ID optional cost element for Freight
	 *	@param Amt amt
	 *	@param Qty qty
	 *	@param Description optional description
	 *	@param IsSOTrx sales order (not used, always considered IsSOTrx=false)
	 * 
	 * @author Teo Sarca
	 * @param mtrxID 
	 */
	/*public static boolean createReceipt (MAcctSchema as, int AD_Org_ID, 
			int M_Product_ID, int M_AttributeSetInstance_ID,
			int M_InOutLine_ID, int M_CostElement_ID, 
			BigDecimal Amt, BigDecimal Qty,
			String Description, boolean IsSOTrx, String trxName, int mtrxID)
	{
		IsSOTrx = false;
		boolean ok = createShipment(as, AD_Org_ID
				, M_Product_ID, M_AttributeSetInstance_ID
				, M_InOutLine_ID, M_CostElement_ID
				, Amt, Qty
				, Description, IsSOTrx, trxName, mtrxID);
		return ok;
	}	//	createReceipt
*/
	private void setDateAcct(boolean force)
	{
		Timestamp dateAcct = getDateAcct();
		if (dateAcct != null && !force)
			return;
		//
		String sql = null;
		int param1 = -1;
		if (getC_InvoiceLine_ID() > 0)
		{
			sql = "SELECT i.DateAcct FROM C_InvoiceLine il"
				+" INNER JOIN C_Invoice i ON (i.C_Invoice_ID=il.C_Invoice_ID)"
				+" WHERE il.C_InvoiceLine_ID=?";
			param1 = getC_InvoiceLine_ID();
		}
		else if (getM_InOutLine_ID() > 0)
		{
			sql = "SELECT i.DateAcct FROM M_InOutLine il"
				+" INNER JOIN M_InOut i ON (i.M_InOut_ID = il.M_InOut_ID)"
				+" WHERE il.M_InOutLine_ID=?";
			param1 = getM_InOutLine_ID();
		}
		else if (getC_OrderLine_ID() > 0)
		{
			sql = "SELECT i.DateAcct FROM C_OrderLine il"
				+" INNER JOIN C_Order i ON (i.C_Order_ID = il.C_Order_ID)"
				+" WHERE il.C_OrderLine_ID=?";
			param1 = getC_OrderLine_ID();
		}
		else if (getM_InventoryLine_ID() > 0)
		{
			sql = "SELECT i.MovementDate FROM M_InventoryLine il"
				+" INNER JOIN M_Inventory i ON (i.M_Inventory_ID = il.M_Inventory_ID)"
				+" WHERE il.M_InventoryLine_ID=?";
			param1 = getM_InventoryLine_ID();
		}
		else if (getM_MovementLine_ID() > 0)
		{
			sql = "SELECT i.MovementDate FROM M_MovementLine il"
				+" INNER JOIN M_Movement i ON (i.M_Movement_ID = il.M_Movement_ID)"
				+" WHERE il.M_MovementLine_ID=?";
			param1 = getM_MovementLine_ID();
		}
		else if (getC_LandedCostAllocation_ID() > 0)
		{
			sql = "SELECT i.DateAcct FROM C_Invoice i"
				+" INNER JOIN C_InvoiceLine il ON (i.C_Invoice_ID=il.C_Invoice_ID)"
				+" INNER JOIN C_LandedCostAllocation la ON (il.C_InvoiceLine_ID=la.C_InvoiceLine_ID)"
				+" WHERE la.C_LandedCostAllocation_ID=?";
			param1 = getC_LandedCostAllocation_ID();
		}
		//
		dateAcct = DB.getSQLValueTSEx(get_TrxName(), sql, param1);
		setDateAcct(dateAcct);
	}


	@Override
	protected boolean beforeSave(boolean newRecord)
	{
		setDateAcct(false);
		return true;
	}


	@Override
	public I_M_CostType getM_CostType() throws RuntimeException
	{
		// TODO OPTIMIZATION: use a cached method
		return super.getM_CostType();
	}

	private MCost m_cost = null;
	public MCost getM_Cost()
	{
		// TODO: load automatically m_cost if is not set
		return m_cost;
	}
}	//	MCostDetail
