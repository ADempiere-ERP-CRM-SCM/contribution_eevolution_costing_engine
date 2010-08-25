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
	
	MBPartner bp =null;
	MBPartnerLocation[]  bpls =null;
	MWarehouse w = null;
	MUser u = null;
	MProduct product = null;
	MAcctSchema as = null;
	String trxName = getTrxName();
	
	Timestamp today = new Timestamp (System.currentTimeMillis());
	
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
		//CLogMgt.setLevel(Level.ALL);

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
		createDataMaster();
		
		MOrder purchase = createPurchaseOrder(today, new BigDecimal(100), new BigDecimal(36));
		MInOut receipt= null;
		for (MOrderLine line : purchase.getLines())
		{	
			receipt = createMaterialReceipt(today,new BigDecimal(10), line.getC_OrderLine_ID());

		}	

		for (MInOutLine line : receipt.getLines())
		{	
			
				assertCostReceipt(line.getM_Product_ID(), line.getM_InOutLine_ID(), as , trxName);	
		}
		
		
		MOrder sales = createSalesOrder(today, new BigDecimal(5), new BigDecimal(45));
		for (MOrderLine line : sales.getLines())
		{	
			
			assertCostShipment(line.getM_Product_ID(), line.getC_OrderLine_ID(), as , trxName);
		}	
		
		
		int M_InOutLine_ID= 0;
		for (MInOutLine line : receipt.getLines())
		{	
			M_InOutLine_ID = line.getM_InOutLine_ID();
			MInvoice invoice = createInvoiceVendor(today, new BigDecimal(10), new BigDecimal(38), line.getM_InOutLine_ID());		
		}	
		
		
		
		assertCostInvoice(product.getM_Product_ID(), M_InOutLine_ID, as ,trxName);
		
		for (MOrderLine line : sales.getLines())
		{				
			assertCostShipmentAdjust(line.getM_Product_ID(), line.getC_OrderLine_ID(), as, trxName);
		}	
			
		//Reverse Material Receipt
		receipt.processIt(DocAction.ACTION_Reverse_Correct);
		receipt.saveEx();
		
		MInOut reversal = new MInOut(getCtx(), receipt.getReversal_ID(), trxName);
		
		for (MInOutLine line : reversal.getLines(true))
		{			
			assertCostReceiptReversal(line.getM_Product_ID(),line.getM_InOutLine_ID(), as, trxName);	
		}
		
		
	}
	
	public MCost assertCost(CostResult costResult)
	{
		MCost cost = getCost(costResult.M_Product_ID);
		assertEquals("Current Price Cost ",cost.getCurrentCostPrice(),costResult.currentCostPrice);
		assertEquals("Cumulate Qty ", cost.getCumulatedQty() , costResult.cumulateQty);
		assertEquals("Cumulate Amt ", cost.getCumulatedAmt() , costResult.cumulateAmt);
		return cost;
	}
	
	public void assertCostDetail(CostResult costResult, String whereClause, ArrayList<Object> parameters)
	{
		MCostDetail cd = getCostDetail(whereClause, parameters);
		assertEquals("Cost Detail Amt ",cd.getAmt() , costResult.cdAmt);
		assertEquals("Cost Detail Adjutment ", cd.getCostAdjustment() , costResult.cdAdjutment);
		assertEquals("Cost Detail Qty", cd.getQty() , costResult.cdQty);
		assertEquals("Cost Detail Current Price Cost ",cd.getCurrentCostPrice(), costResult.cdCurrentCostPrice);
		assertEquals("Cost Detail Cumulate Qty ", cd.getCumulatedQty() , costResult.cdCumulateQty);
		assertEquals("Cost Detail Cumulate Amt ", cd.getCumulatedAmt() , costResult.cdCumulateAmt);
	}
	
	public MCost getCost(int M_Product_ID)
	{
		MCostElement ce = getMaterialElement(trxName);
		String whereClause = "M_Product_ID=? AND M_CostElement_ID=? AND M_CostType_ID=? ";
		ArrayList<Object> parameters = new ArrayList();
		parameters.add(M_Product_ID);
		parameters.add(ce.getM_CostElement_ID());
		parameters.add(as.getM_CostType_ID());
		return new Query (getCtx(), I_M_Cost.Table_Name, whereClause, trxName)
		.setClient_ID()
		.setParameters(parameters)
		.first();
	}
	public MCostDetail getCostDetail(String whereClause, ArrayList<Object> parameters)
	{
		return new Query(getCtx(), I_M_CostDetail.Table_Name, whereClause, trxName)
		.setClient_ID()
		.setParameters(parameters)
		.first();	
	}
	
	
	
	/**
	 * assert Cost Receipt
	 * @param product
	 * @param receiptLine
	 * @param as
	 * @param trxName
	 */
	private void assertCostReceipt(int M_Product_ID,
			int M_InOutLine_ID, 
			MAcctSchema as,
			String trxName)
	{
		CostResult costResult = new CostResult(product.getM_Product_ID(),
				 new BigDecimal("36.0000"),
				 new BigDecimal(10),
				 new BigDecimal("360.0000"),
				 new BigDecimal("360.0000"),
				 new BigDecimal("0"),
				 new BigDecimal("10"),
				 new BigDecimal("0"),
				 new BigDecimal("0"),
				 new BigDecimal("0")
				 );
		
		MCost cost = assertCost(costResult);
		String whereClause = "M_Product_ID=? AND M_CostElement_ID=? AND M_CostType_ID=? AND CostingMethod=? AND M_InOutLine_ID=?";	
		ArrayList<Object> parameters = new ArrayList();	
		parameters.add(costResult.M_Product_ID);
		parameters.add(cost.getM_CostElement_ID());
		parameters.add(cost.getM_CostType_ID());
		parameters.add(as.getCostingMethod());
		parameters.add(M_InOutLine_ID);
		assertCostDetail(costResult,whereClause,parameters);
	}
	
	/**
	 * assert Cost Receipt
	 * @param product
	 * @param receiptLine
	 * @param as
	 * @param trxName
	 */
	private void assertCostShipment(int M_Product_ID,int C_OrderLine_ID, MAcctSchema as , String trxName)
	{
		CostResult costResult = new CostResult(M_Product_ID,
				new BigDecimal("36.0000"),
				new BigDecimal(5),
				new BigDecimal("180.0000"),
				new BigDecimal("-180.0000"),
				new BigDecimal("0"),
				new BigDecimal(-5),
				new BigDecimal("36.0000"),
				new BigDecimal("10"),
				new BigDecimal("360.0000"));
		
		MCost cost = assertCost(costResult);
		String whereClause = "M_Product_ID=? AND M_CostElement_ID=? AND M_CostType_ID=? AND CostingMethod=? AND M_InOutLine_ID IN (SELECT M_InOutLine_ID FROM M_InOutLine iol WHERE iol.C_OrderLine_ID=?)";
		ArrayList<Object> parameters = new ArrayList();	
		parameters.add(costResult.M_Product_ID);
		parameters.add(cost.getM_CostElement_ID());
		parameters.add(cost.getM_CostType_ID());
		parameters.add(as.getCostingMethod());
		parameters.add(C_OrderLine_ID);
		assertCostDetail(costResult,whereClause,parameters);
	}
	
	/**
	 * assert Cost Receipt
	 * @param product
	 * @param receiptLine
	 * @param as
	 * @param trxName
	 */
	private void assertCostShipmentAdjust(int M_Product_ID , int C_OrderLine_ID, MAcctSchema as , String trxName)
	{
		CostResult costResult = new CostResult(M_Product_ID, 
				new BigDecimal("38.0000"),
				new BigDecimal("5"),
				new BigDecimal("190.0000"),
				new BigDecimal("-190.0000"),
				new BigDecimal("0"),
				new BigDecimal("-5"),
				new BigDecimal("38.0000"),
				new BigDecimal("10"),
				new BigDecimal("380.0000"));
		
		MCost cost = assertCost(costResult);		
		String whereClause = "M_Product_ID=? AND M_CostElement_ID=? AND M_CostType_ID=? AND CostingMethod=? AND M_InOutLine_ID IN (SELECT M_InOutLine_ID FROM M_InOutLine iol WHERE iol.C_OrderLine_ID=?)";
		ArrayList<Object> parameters = new ArrayList();	
		parameters.add(costResult.M_Product_ID);
		parameters.add(cost.getM_CostElement_ID());
		parameters.add(cost.getM_CostType_ID());
		parameters.add(as.getCostingMethod());
		parameters.add(C_OrderLine_ID);
		assertCostDetail(costResult,whereClause,parameters);
	}

	/**
	 * assert Cost Receipt
	 * @param product
	 * @param receiptLine
	 * @param as
	 * @param trxName
	 */
	private void assertCostReceiptReversal(
			int M_Product_ID,
			int M_InOutLine_ID, 
			MAcctSchema as,
			String trxName)
	{
		
		CostResult costResult = new CostResult(M_Product_ID, 
				new BigDecimal("38.0000"),
				new BigDecimal("-5"),
				new BigDecimal("-190.0000"),
				new BigDecimal("-360.0000"),
				new BigDecimal("-20.0000"),
				new BigDecimal("-10"),
				new BigDecimal("38.0000"),
				new BigDecimal("5"),
				new BigDecimal("190.0000"));
		
		MCost cost = assertCost(costResult);		
		
		String whereClause = "M_Product_ID=? AND M_CostElement_ID=? AND M_CostType_ID=? AND CostingMethod=? AND M_InOutLine_ID=?";	
		ArrayList<Object> parameters = new ArrayList();	
		parameters.add(costResult.M_Product_ID);
		parameters.add(cost.getM_CostElement_ID());
		parameters.add(cost.getM_CostType_ID());
		parameters.add(as.getCostingMethod());
		parameters.add(M_InOutLine_ID);
		assertCostDetail(costResult,whereClause,parameters);
	}

	
	/**
	 * Assert Cost Invoice 
	 * @param product
	 * @param receiptLine
	 * @param as
	 * @param trxName
	 */
	private void assertCostInvoice(
			int M_Product_ID, 
			int M_InOutLine_ID, 
			MAcctSchema as,
			String trxName)
	{	
		//Evaluate Result
			CostResult costResult = new CostResult(M_Product_ID,
				 new BigDecimal("38.0000"),
				 new BigDecimal("5"),
				 new BigDecimal("190.0000"),
				 new BigDecimal("360.0000"),
				 new BigDecimal("20.0000"),
				 new BigDecimal("10"),
				 new BigDecimal("0"),
				 new BigDecimal("0"),
				 new BigDecimal("0")
				 );
		
			MCost cost = assertCost(costResult);
			String whereClause = "M_Product_ID=? AND  M_CostElement_ID=? AND M_CostType_ID=? AND CostingMethod=? AND M_InOutLine_ID=?";
			ArrayList<Object> parameters = new ArrayList();	
			parameters.add(costResult.M_Product_ID);
			parameters.add(cost.getM_CostElement_ID());
			parameters.add(cost.getM_CostType_ID());
			parameters.add(as.getCostingMethod());
			parameters.add(M_InOutLine_ID);
			assertCostDetail(costResult,whereClause,parameters);	
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
	
	public void createDataMaster()
	{
		bp = (MBPartner) getEntity(I_C_BPartner.Table_Name, I_C_BPartner.COLUMNNAME_Value, "SeedFarm", trxName);
		bpls = MBPartnerLocation.getForBPartner(getCtx(), bp.getC_BPartner_ID(), trxName);
		w = (MWarehouse) getEntity(I_M_Warehouse.Table_Name, I_M_Warehouse.COLUMNNAME_Value, "HQ", trxName);
		u = (MUser) getEntity(I_AD_User.Table_Name, I_AD_User.COLUMNNAME_Name, "GardenAdmin", trxName);
		product = (MProduct) getEntity(I_M_Product.Table_Name, I_M_Product.COLUMNNAME_Value, "Oak" , trxName);
		as = MAcctSchema.get(getCtx(), 101);		
		today = new Timestamp (System.currentTimeMillis());
		if (bp == null ||  w == null || u == null)
			throw new AdempiereException("Object null " );
	}
	
	public MOrder createPurchaseOrder(Timestamp orderDate ,BigDecimal qty,BigDecimal price)
	{
		//Create Purchase Order
		MOrder order = new MOrder(getCtx(), 0, trxName);
		order.setAD_Org_ID(Env.getAD_Org_ID(getCtx()));
		order.setC_BPartner_ID(bp.getC_BPartner_ID());
		order.setIsSOTrx(false);
		order.setDateOrdered(orderDate);
		order.setM_Warehouse_ID(w.getM_Warehouse_ID());
		order.setSalesRep_ID(u.getAD_User_ID());
		order.setC_DocTypeTarget_ID(MDocType.getDocType(MDocType.DOCBASETYPE_PurchaseOrder));
		order.saveEx();
		
		// Create Line
		MOrderLine orderLine = new MOrderLine(order);
		orderLine.setM_Product_ID(product.getM_Product_ID());
		orderLine.setPrice(price);
		orderLine.setQtyEntered(qty);
		orderLine.saveEx();
		
		// Complete Purchase Order
		order.setDocAction(DocAction.ACTION_Complete);
		order.setDocStatus(DocAction.STATUS_Drafted);
		order.processIt(DocAction.ACTION_Complete);
		order.saveEx();
		return order;
	}
	
	public MInOut createMaterialReceipt(Timestamp movementDate,BigDecimal qtyMovement, int C_OrderLine_ID)
	{
		// Create Material Receipt
		MInOut receipt = new MInOut(getCtx() , 0 , trxName);
		receipt.setAD_Org_ID(Env.getAD_Org_ID(getCtx()));
		receipt.setC_DocType_ID(MDocType.getDocType(MDocType.DOCBASETYPE_MaterialReceipt));
		receipt.setC_BPartner_ID(bp.getC_BPartner_ID());
		receipt.setC_BPartner_Location_ID(bpls[0].getC_BPartner_Location_ID());
		receipt.setMovementDate(movementDate);
		receipt.setIsSOTrx(false);
		receipt.setM_Warehouse_ID(w.getM_Warehouse_ID());
		receipt.setMovementType(MInOut.MOVEMENTTYPE_VendorReceipts);
		receipt.saveEx();
		
		// Create Material Receipt Line
		MInOutLine receiptLine = new MInOutLine(receipt);
		receiptLine.setC_OrderLine_ID(C_OrderLine_ID);
		receiptLine.setM_Product_ID(product.getM_Product_ID());
		receiptLine.setMovementQty(qtyMovement);
		receiptLine.setM_Locator_ID(qtyMovement);
		receiptLine.saveEx();
		
		// Complete Receipt
		receipt.setDocStatus(DocAction.STATUS_Drafted);
		receipt.setDocAction(DocAction.ACTION_Complete);
		receipt.processIt(DocAction.ACTION_Complete);
		receipt.saveEx();	
		return receipt;
	}
	
	public MOrder createSalesOrder(Timestamp orderDate ,BigDecimal qty,BigDecimal price)
	{
		MDocType salesType = null;
		for (MDocType dt : MDocType.getOfDocBaseType(getCtx(), MDocType.DOCBASETYPE_SalesOrder))
		{
			if (MDocType.DOCSUBTYPESO_OnCreditOrder.equals(dt.getDocSubTypeSO()))
			{
				salesType = dt;
				break;
			}
		}
		
		//Create Purchase Order
		MOrder salesOrder = new MOrder(getCtx(), 0, trxName);
		salesOrder.setAD_Org_ID(Env.getAD_Org_ID(getCtx()));
		salesOrder.setC_BPartner_ID(bp.getC_BPartner_ID());
		salesOrder.setIsSOTrx(true);
		salesOrder.setDateOrdered(orderDate);
		salesOrder.setM_Warehouse_ID(w.getM_Warehouse_ID());
		salesOrder.setSalesRep_ID(u.getAD_User_ID());
		salesOrder.setC_DocTypeTarget_ID(salesType.getC_DocType_ID());
		salesOrder.saveEx();
		
		// Create Line
		MOrderLine salesOrderLine = new MOrderLine(salesOrder);
		salesOrderLine.setM_Product_ID(product.getM_Product_ID());
		salesOrderLine.setPrice(price);
		salesOrderLine.setQtyEntered(qty);
		salesOrderLine.setQtyOrdered(qty);
		salesOrderLine.saveEx();
		
		// Complete Purchase Order
		salesOrder.setDocAction(DocAction.ACTION_Complete);
		salesOrder.setDocStatus(DocAction.STATUS_Drafted);
		salesOrder.processIt(DocAction.ACTION_Complete);
		salesOrder.saveEx();
		return salesOrder;
	}
	
	public MInvoice createInvoiceVendor(Timestamp documentDate,BigDecimal qty,BigDecimal price, int M_InOutLine_ID)
	{
		MInvoice invoice = new MInvoice(getCtx(), 0 , trxName);
		invoice.setAD_Org_ID(Env.getAD_Org_ID(getCtx()));
		invoice.setC_DocType_ID(MDocType.getDocType(MDocType.DOCBASETYPE_APInvoice));
		invoice.setIsSOTrx(false);
		invoice.setC_BPartner_ID(bp.getC_BPartner_ID());
		invoice.setDateInvoiced(documentDate);
		invoice.setDocStatus(DocAction.STATUS_Drafted);
		invoice.setDocAction(DocAction.ACTION_Complete);
		invoice.saveEx();
		
		MInvoiceLine invoiceLine = new MInvoiceLine(invoice);
		invoiceLine.setM_Product_ID(product.getM_Product_ID());
		invoiceLine.setM_InOutLine_ID(M_InOutLine_ID);
		invoiceLine.setQtyEntered(qty);
		invoiceLine.setPriceActual(price);
		invoiceLine.saveEx();
		
		invoice.processIt(DocAction.ACTION_Complete);
		invoice.saveEx();
		return invoice;
	}
	
}

class CostResult
{
	public CostResult(int M_Product_ID ,BigDecimal currentCostPrice, BigDecimal cumulateQty,
			BigDecimal cumulateAmt, BigDecimal cdAmt, BigDecimal cdAdjutment,
			BigDecimal cdQty, BigDecimal cdCurrentCostPrice,
			BigDecimal cdCumulateQty, BigDecimal cdCumulateAmt) {
		super();
		this.M_Product_ID = M_Product_ID;
		this.currentCostPrice = currentCostPrice;
		this.cumulateQty = cumulateQty;
		this.cumulateAmt = cumulateAmt;
		this.cdAmt = cdAmt;
		this.cdAdjutment = cdAdjutment;
		this.cdQty = cdQty;
		this.cdCurrentCostPrice = cdCurrentCostPrice;
		this.cdCumulateQty = cdCumulateQty;
		this.cdCumulateAmt = cdCumulateAmt;
	}
	int M_Product_ID ;
	BigDecimal currentCostPrice;
	BigDecimal cumulateQty;
	BigDecimal cumulateAmt; 
	BigDecimal cdAmt;
	BigDecimal cdAdjutment;
	BigDecimal cdQty;
	BigDecimal cdCurrentCostPrice;
	BigDecimal cdCumulateQty;
	BigDecimal cdCumulateAmt;
}

