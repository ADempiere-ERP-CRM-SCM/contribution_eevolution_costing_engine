/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 2009 SC ARHIPAC SERVICE SRL. All Rights Reserved.            *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * victor.perez@e-evolution.com, www.e-evolution.com 						  *
 *****************************************************************************/
package org.adempiere;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.I_AD_User;
import org.compiere.model.I_C_BPartner;
import org.compiere.model.I_M_Cost;
import org.compiere.model.I_M_CostDetail;
import org.compiere.model.I_M_CostElement;
import org.compiere.model.I_M_Product;
import org.compiere.model.I_M_Warehouse;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MCostElement;
import org.compiere.model.MDocType;
import org.compiere.model.MInOut;
import org.compiere.model.MInOutLine;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MProduct;
import org.compiere.model.MUser;
import org.compiere.model.MWarehouse;
import org.compiere.model.Query;
import org.compiere.process.DocAction;
import org.compiere.util.CLogMgt;
import org.compiere.util.Env;
import org.compiere.util.Trx;
import org.compiere.util.TrxRunnable;

import test.AdempiereTestCase;


/**
 * Run Average Invoice Cost 
 * Business Case Test  
 * @author victor.perez@e-evolution.com, www.e-evolution.com
 */
public class AverageInvoiceCostTest extends AdempiereTestCase
{
	@Override
	protected void setUp() throws Exception
	{
		super.setUp();
		int currencyId = 0;
		currencyId = Integer.parseInt( testProperties.getProperty("$C_Currency_ID", "100") );	
		Env.setContext(Env.getCtx(), "$C_Currency_ID", currencyId);
		Env.setContext(Env.getCtx(), "#M_Warehouse_ID", 103);
		Env.setContext(Env.getCtx(), "#AD_Org_ID", 11);
	}
	
	public void test01() throws Exception
	{
		CLogMgt.setLevel(Level.CONFIG);
		String trxName = getTrxName();
		Trx.run(trxName, new TrxRunnable()
		{
			public void run(String trxName) 
			{
				createBusinessCaseTest(trxName);
			}
		});
	}	
	/**
	 * create Business Test Case
	 * @param trxName
	 */
	void createBusinessCaseTest(String trxName)
	{
		MBPartner bp = (MBPartner) getEntity(I_C_BPartner.Table_Name, I_C_BPartner.COLUMNNAME_Value, "SeedFarm", trxName);
		MBPartnerLocation[]  bpls = MBPartnerLocation.getForBPartner(getCtx(), bp.getC_BPartner_ID(), trxName);
		MWarehouse w = (MWarehouse) getEntity(I_M_Warehouse.Table_Name, I_M_Warehouse.COLUMNNAME_Value, "HQ", trxName);
		MUser u = (MUser) getEntity(I_AD_User.Table_Name, I_AD_User.COLUMNNAME_Name, "GardenAdmin", trxName);
		MProduct product = (MProduct) getEntity(I_M_Product.Table_Name, I_M_Product.COLUMNNAME_Value, "Oak" , trxName);
		MAcctSchema as = MAcctSchema.get(getCtx(), 101);
		BigDecimal qtyOrdered = new BigDecimal(100);
		BigDecimal qtyReceipt = new BigDecimal(10);
		BigDecimal qtyInvoiced = new BigDecimal(10);
		
		// Result
		BigDecimal purchasePrice = new BigDecimal(36);
		BigDecimal invoicePrice = new BigDecimal(38);
		
		Timestamp today = new Timestamp (System.currentTimeMillis());
		if (bp == null ||  w == null || u == null)
			throw new AdempiereException("Object null " );
		
		//Create Purchase Order
		MOrder order = new MOrder(getCtx(), 0, trxName);
		order.setAD_Org_ID(Env.getAD_Org_ID(getCtx()));
		order.setC_BPartner_ID(bp.getC_BPartner_ID());
		order.setIsSOTrx(false);
		order.setDateOrdered(today);
		order.setM_Warehouse_ID(w.getM_Warehouse_ID());
		order.setSalesRep_ID(u.getAD_User_ID());
		order.setC_DocTypeTarget_ID(MDocType.getDocType(MDocType.DOCBASETYPE_PurchaseOrder));
		order.saveEx();
		
		// Create Line
		MOrderLine orderLine = new MOrderLine(order);
		orderLine.setM_Product_ID(product.getM_Product_ID());
		orderLine.setPrice(purchasePrice);
		orderLine.setQtyEntered(qtyOrdered);
		orderLine.saveEx();
		
		// Complete Purchase Order
		order.setDocAction(DocAction.ACTION_Complete);
		order.setDocStatus(DocAction.STATUS_Drafted);
		order.processIt(DocAction.ACTION_Complete);
		order.saveEx();
		
		// Create Material Receipt
		MInOut receipt = new MInOut(getCtx() , 0 , trxName);
		receipt.setAD_Org_ID(Env.getAD_Org_ID(getCtx()));
		receipt.setC_DocType_ID(MDocType.getDocType(MDocType.DOCBASETYPE_MaterialReceipt));
		receipt.setC_BPartner_ID(bp.getC_BPartner_ID());
		receipt.setC_BPartner_Location_ID(bpls[0].getC_BPartner_Location_ID());
		receipt.setMovementDate(today);
		receipt.setIsSOTrx(false);
		receipt.setM_Warehouse_ID(w.getM_Warehouse_ID());
		receipt.setMovementType(MInOut.MOVEMENTTYPE_VendorReceipts);
		receipt.saveEx();
		
		// Create Materia Receipt Line
		MInOutLine receiptLine = new MInOutLine(receipt);
		receiptLine.setC_OrderLine_ID(orderLine.getC_OrderLine_ID());
		receiptLine.setM_Product_ID(product.getM_Product_ID());
		receiptLine.setMovementQty(qtyReceipt);
		receiptLine.setM_Locator_ID(qtyReceipt);
		receiptLine.saveEx();
		
		// Complete Receipt
		receipt.setDocStatus(DocAction.STATUS_Drafted);
		receipt.setDocAction(DocAction.ACTION_Complete);
		receipt.processIt(DocAction.ACTION_Complete);
		receipt.saveEx();
		
		assertCostReceipt(product, receiptLine, as , trxName);
		
		MInvoice invoice = new MInvoice(getCtx(), 0 , trxName);
		invoice.setAD_Org_ID(Env.getAD_Org_ID(getCtx()));
		invoice.setC_DocType_ID(MDocType.getDocType(MDocType.DOCBASETYPE_APInvoice));
		invoice.setIsSOTrx(false);
		invoice.setC_BPartner_ID(bp.getC_BPartner_ID());
		invoice.setDateInvoiced(today);
		invoice.setDocStatus(DocAction.STATUS_Drafted);
		invoice.setDocAction(DocAction.ACTION_Complete);
		invoice.saveEx();
		
		MInvoiceLine invoiceLine = new MInvoiceLine(invoice);
		invoiceLine.setM_Product_ID(product.getM_Product_ID());
		invoiceLine.setM_InOutLine_ID(receiptLine.getM_InOutLine_ID());
		invoiceLine.setQtyEntered(qtyInvoiced);
		invoiceLine.setPriceActual(invoicePrice);
		invoiceLine.saveEx();
		
		invoice.processIt(DocAction.ACTION_Complete);
		invoice.saveEx();
		
		assertCostInvoice(product, receiptLine, as, trxName);
	}
	
	/**
	 * assert Cost Receipt
	 * @param product
	 * @param receiptLine
	 * @param as
	 * @param trxName
	 */
	private void assertCostReceipt(MProduct product, MInOutLine receiptLine, MAcctSchema as , String trxName)
	{
		MCostElement ce = getMaterialElement(trxName);

		String whereClause = "M_Product_ID=? AND M_CostElement_ID=? AND M_CostType_ID=? ";
		ArrayList<Object> parameters = new ArrayList();
		parameters.add(product.getM_Product_ID());
		parameters.add(ce.getM_CostElement_ID());
		parameters.add(as.getM_CostType_ID());
		MCost cost = new Query (getCtx(), I_M_Cost.Table_Name, whereClause, trxName)
		.setClient_ID()
		.setParameters(parameters)
		.first();
		if(cost != null)
		{	
			assertEquals("Current Price Cost ",cost.getCurrentCostPrice() , new BigDecimal("36.0000"));
			assertEquals("Cumulate Qty ", cost.getCumulatedQty() , new BigDecimal(10));
			assertEquals("Cumulate Amt ", cost.getCumulatedAmt() , new BigDecimal("360"));
		}
		
		whereClause = whereClause + "AND CostingMethod=? AND M_InOutLine_ID=?";
		parameters.add(as.getCostingMethod());
		parameters.add(receiptLine.getM_InOutLine_ID());
		MCostDetail cd = new Query(getCtx(), I_M_CostDetail.Table_Name, whereClause, trxName)
		.setClient_ID()
		.setParameters(parameters)
		.first();
		if(cd != null)
		{
			assertEquals("Cost Detail Amt ",cd.getAmt() , new BigDecimal("360.0000"));
			assertEquals("Cost Detail Adjutment ", cd.getCostAdjustment() , new BigDecimal("0.0000"));
			assertEquals("Cost Detail Qty", cd.getQty() , new BigDecimal(10));
			assertEquals("Cost Detail Current Price Cost ",cd.getCurrentCostPrice() , new BigDecimal("0"));
			assertEquals("Cost Detail Cumulate Qty ", cd.getCumulatedQty() , new BigDecimal("0"));
			assertEquals("Cost Detail Cumulate Amt ", cd.getCumulatedAmt() , (new BigDecimal("0")));
		}
	}
	
	/**
	 * Assert Cost Invoice 
	 * @param product
	 * @param receiptLine
	 * @param as
	 * @param trxName
	 */
	private void assertCostInvoice(MProduct product, MInOutLine receiptLine, MAcctSchema as , String trxName)
	{
		MCostElement ce = getMaterialElement(trxName);
		ArrayList<Object> parameters = new ArrayList();
		parameters.add(product.getM_Product_ID());
		parameters.add(ce.getM_CostElement_ID());
		parameters.add(as.getM_CostType_ID());
		
		String whereClause = "M_Product_ID=? AND  M_CostElement_ID=? AND M_CostType_ID=? ";
		MCost cost = new Query (getCtx(), I_M_Cost.Table_Name, whereClause, trxName)
		.setClient_ID()
		.setParameters(product.getM_Product_ID(), ce.getM_CostElement_ID(), as.getM_CostType_ID())
		.first();
		if(cost != null)
		{	
			assertEquals("Current Price Cost ",cost.getCurrentCostPrice() , new BigDecimal("38.0000"));
			assertEquals("Cumulate Qty ", cost.getCumulatedQty() , new BigDecimal(10));
			assertEquals("Cumulate Amt ", cost.getCumulatedAmt() , new BigDecimal("380"));
		}
		
		whereClause = whereClause + "AND CostingMethod=? AND M_InOutLine_ID=?";
		parameters.add(as.getCostingMethod());
		parameters.add(receiptLine.getM_InOutLine_ID());
		MCostDetail cd = new Query(getCtx(), I_M_CostDetail.Table_Name, whereClause, trxName)
		.setClient_ID()
		.setParameters(parameters)
		.first();
		
		if(cd != null)
		{
			assertEquals("Cost Detail Amt ",cd.getAmt() , new BigDecimal("360.0000"));
			assertEquals("Cost Detail Adjutment ", cd.getCostAdjustment() , new BigDecimal("20.0000"));
			assertEquals("Cost Detail Qty", cd.getQty() , new BigDecimal(10));
			assertEquals("Cost Detail Current Price Cost ",cd.getCurrentCostPrice() , new BigDecimal("0"));
			assertEquals("Cost Detail Cumulate Qty ", cd.getCumulatedQty() , new BigDecimal("0"));
			assertEquals("Cost Detail Cumulate Amt ", cd.getCumulatedAmt() , (new BigDecimal("0")));
		}
	}
	
	/**
	 * get Material Element
	 * @param trxName
	 * @return
	 */
	public MCostElement getMaterialElement(String trxName)
	{
		return new Query(getCtx() , I_M_CostElement.Table_Name , I_M_CostElement.COLUMNNAME_CostElementType + "=?", trxName)
		.setClient_ID()
		.setParameters(MCostElement.COSTELEMENTTYPE_Material)
		.setOrderBy(MCostElement.COLUMNNAME_M_CostElement_ID)
		.first();
	}
	/**
	 * get Instance the Entity
	 * @param tableName
	 * @param columnName
	 * @param value
	 * @param trxName
	 * @return
	 */
	public Object getEntity(String tableName , String columnName ,String  value ,String trxName)
	{
		String whereClause = columnName + "=?";
		return new Query(getCtx() , tableName , whereClause, trxName)
		.setClient_ID()
		.setParameters(value)
		.first();
	}
}

