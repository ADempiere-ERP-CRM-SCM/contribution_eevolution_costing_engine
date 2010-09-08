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
import java.sql.Date;
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
import org.compiere.model.MMovement;
import org.compiere.model.MMovementLine;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MProduct;
import org.compiere.model.MUser;
import org.compiere.model.MWarehouse;
import org.compiere.model.Query;
import org.compiere.process.DocAction;
import org.compiere.util.CLogMgt;
import org.compiere.util.Env;
import org.compiere.util.TimeUtil;
import org.compiere.util.Trx;
import org.compiere.util.TrxRunnable;

import test.AdempiereTestCase;


/**
 * Run Average Invoice Cost 
 * Business Case Test  
 * @author victor.perez@e-evolution.com, www.e-evolution.com
 * http://spreadsheets.google.com/pub?key=0AtQL5-PW36eqdGdnUFVBZDhJMXVSbHh1TzMtRHhSbWc&hl=es&output=html
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
	
	Timestamp today; 
	
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
		CLogMgt.setLevel(Level.OFF);
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
		Timestamp dateAcct;
		//First Purchase Receipt 
		dateAcct = today;
		MOrder purchase1 = createPurchaseOrder(dateAcct, new BigDecimal(100), new BigDecimal(36));
		MInOut receipt1= null;
		for (MOrderLine line : purchase1.getLines())
		{	
			receipt1 = createMaterialReceipt(dateAcct,new BigDecimal(10), line.getC_OrderLine_ID());

		}	

		for (MInOutLine line : receipt1.getLines())
		{	
			CostResult costResult = new CostResult(product.getM_Product_ID(),
					 new BigDecimal("36.0000"), //currentCostPrice
					 new BigDecimal("10"), 		// cumulateQty
					 new BigDecimal("360"),//cumulateAmt
					 new BigDecimal("360.0000"),//cdAmt
					 new BigDecimal("0"), //cdAdjutment
					 new BigDecimal("10"),//cdQty
					 new BigDecimal("0"), //cdCurrentCostPrice
					 new BigDecimal("0"), //cdCumulateQty
					 new BigDecimal("0"),  //cdCumulateAmt
					 dateAcct
					 );
			assertCostReceipt(costResult, line.getM_InOutLine_ID(), as , trxName);	
		}
		
		//Create Sales Order Order Credit by 5
		dateAcct = TimeUtil.addDays(today, 15);
		MOrder sales1 = createSalesOrder(dateAcct, new BigDecimal(5), new BigDecimal(45));
		for (MOrderLine line : sales1.getLines())
		{	
			CostResult costResult = new CostResult(product.getM_Product_ID(),
					new BigDecimal("36.0000"),
					new BigDecimal("5"),
					new BigDecimal("180.0000"),
					new BigDecimal("-180.0000"),
					new BigDecimal("0"),
					new BigDecimal("-5"),
					new BigDecimal("36.0000"),
					new BigDecimal("10"),
					new BigDecimal("360"),dateAcct);
			
			assertCostShipment(costResult, line.getC_OrderLine_ID(), as , trxName);
		}	
			
		
		//Second Purchase Receipt 7 day forward
		dateAcct = TimeUtil.addDays(today, 31);
		MOrder purchase2 = createPurchaseOrder(dateAcct, new BigDecimal(100), new BigDecimal(34));
		MInOut receipt2 = null;	
		for (MOrderLine line : purchase2.getLines())
		{	
			receipt2 = createMaterialReceipt(dateAcct,new BigDecimal(10), line.getC_OrderLine_ID());

		}	

		for (MInOutLine line : receipt2.getLines())
		{	
			CostResult costResult = new CostResult(product.getM_Product_ID(),
					 new BigDecimal("34.6667"), //currentCostPrice
					 new BigDecimal("15"), 		// cumulateQty
					 new BigDecimal("520.0000"),//cumulateAmt
					 new BigDecimal("346.6670"),//cdAmt
					 new BigDecimal("0"), //cdAdjutment
					 new BigDecimal("10"),//cdQty
					 new BigDecimal("36.0000"), //cdCurrentCostPrice
					 new BigDecimal("5"), //cdCumulateQty
					 new BigDecimal("180.0000")  //cdCumulateAmt
					, dateAcct
					 );
			
				assertCostReceipt(costResult, line.getM_InOutLine_ID(), as , trxName);	
		}
		
	
		//Create Sales Order Order Credit by 5
		dateAcct = TimeUtil.addDays(today, 60);
		MOrder sales2 = createSalesOrder( dateAcct, new BigDecimal(10), new BigDecimal(45));
		for (MOrderLine line : sales2.getLines())
		{	
			CostResult costResult = new CostResult(product.getM_Product_ID(),
					new BigDecimal("34.6667"),
					new BigDecimal("5"),
					new BigDecimal("173.3330"),
					new BigDecimal("-346.6670"),
					new BigDecimal("0"),
					new BigDecimal("-10"),
					new BigDecimal("34.6667"),
					new BigDecimal("15"),
					new BigDecimal("520.0000"), dateAcct);
			
			assertCostShipment(costResult, line.getC_OrderLine_ID(), as , trxName);
		}		
		
		dateAcct =receipt1.getDateAcct();
		int M_InOutLine_ID= 0;
		for (MInOutLine line : receipt1.getLines())
		{	
			M_InOutLine_ID = line.getM_InOutLine_ID();
			MInvoice invoice = createInvoiceVendor(dateAcct, new BigDecimal(10), new BigDecimal(38), line.getM_InOutLine_ID());		
		}	
		
		CostResult costResult = new CostResult(product.getM_Product_ID(),
				 new BigDecimal("35.3333"), //currentCostPrice
				 new BigDecimal("5"), 		// cumulateQty
				 new BigDecimal("176.6670"),//cumulateAmt
				 new BigDecimal("380"),//cdAmt
				 new BigDecimal("20"), //cdAdjutment
				 new BigDecimal("10"),//cdQty
				 new BigDecimal("0"), //cdCurrentCostPrice
				 new BigDecimal("0"), //cdCumulateQty
				 new BigDecimal("0"),  //cdCumulateAmt
				 dateAcct
				 );
		
		assertCostInvoice(costResult, M_InOutLine_ID, as ,trxName);
		
		dateAcct = Timestamp.valueOf("2010-01-16 00:00:00.0");
		for (MOrderLine line : sales1.getLines())
		{	
			costResult = new CostResult(line.getM_Product_ID(), 
					new BigDecimal("35.3333"),
					new BigDecimal("5"),
					new BigDecimal("176.6670"),
					new BigDecimal("-190.0000"),
					new BigDecimal("0"),
					new BigDecimal("-5"),
					new BigDecimal("38.0000"),
					new BigDecimal("10"),
					new BigDecimal("380"), dateAcct);
			
			assertCostShipmentAdjust(costResult, line.getC_OrderLine_ID(), as, trxName);
		}	
			
		//Reverse Material Receipt
		dateAcct = today;
		receipt1.processIt(DocAction.ACTION_Reverse_Correct);
		receipt1.saveEx();
		
		MInOut reversal = new MInOut(getCtx(), receipt1.getReversal_ID(), trxName);
		
		for (MInOutLine line : reversal.getLines(true))
		{
			costResult = new CostResult(product.getM_Product_ID(),
					 new BigDecimal("40.6666"), //currentCostPrice
					 new BigDecimal("-5"), 		// cumulateQty
					 new BigDecimal("-203.3330"),//cumulateAmt
					 new BigDecimal("-380"),//cdAmt
					 new BigDecimal("-20"), //cdAdjutment
					 new BigDecimal("-10"),//cdQty
					 new BigDecimal("35.3333"), //cdCurrentCostPrice
					 new BigDecimal("5"), //cdCumulateQty
					 new BigDecimal("176.6670"),  //cdCumulateAmt
					 dateAcct 
					 );
			
			assertCostReceiptReversal(costResult,line.getM_InOutLine_ID(), as, trxName);	
		}
		
		//Second Purchase Receipt 7 day forward
		dateAcct = TimeUtil.addDays(today, 1);
		MOrder purchase3 = createPurchaseOrder(dateAcct, new BigDecimal(100), new BigDecimal(37));
		MInOut receipt3 = null;	
		for (MOrderLine line : purchase3.getLines())
		{	
			receipt3 = createMaterialReceipt(dateAcct,new BigDecimal(20), line.getC_OrderLine_ID());

		}	

		for (MInOutLine line : receipt3.getLines())
		{	
			costResult = new CostResult(product.getM_Product_ID(),
					 new BigDecimal("35.8000"), //currentCostPrice
					 new BigDecimal("25"), 		// cumulateQty
					 new BigDecimal("895.0000"),//cumulateAmt
					 new BigDecimal("346.6670"),//cdAmt
					 new BigDecimal("0"), //cdAdjutment
					 new BigDecimal("10"),//cdQty
					 new BigDecimal("36.0000"), //cdCurrentCostPrice
					 new BigDecimal("5"), //cdCumulateQty
					 new BigDecimal("180.0000"),  //cdCumulateAmt
					 dateAcct
					 );
			
				assertCostReceipt(costResult, line.getM_InOutLine_ID(), as , trxName);	
		}
		
		dateAcct = TimeUtil.addDays(today, 65);
		MMovement move = createMovement(dateAcct, new BigDecimal("20"));
		for (MMovementLine line : move.getLines(true))
		{
			costResult = new CostResult(product.getM_Product_ID(),
					 new BigDecimal("35.3334"), //currentCostPrice
					 new BigDecimal("5"), 		// cumulateQty
					 new BigDecimal("176.6670"),//cumulateAmt
					 new BigDecimal("176.6670"),//cdAmt
					 new BigDecimal("0"), //cdAdjutment
					 new BigDecimal("5"),//cdQty
					 new BigDecimal("0"), //cdCurrentCostPrice
					 new BigDecimal("0"), //cdCumulateQty
					 new BigDecimal("0.0000"),  //cdCumulateAmt
					 dateAcct
					 );
			
			assertCostMovement(costResult,line.getM_MovementLine_ID(), as, trxName);	
		}
		
	}
	
	public MCost assertCost(CostResult costResult)
	{
		MCost cost = getCost(costResult.M_Product_ID);
		assertEquals("Current Price Cost ",costResult.currentCostPrice , cost.getCurrentCostPrice());
		assertEquals("Cumulate Qty ", costResult.cumulateQty , cost.getCumulatedQty());
		assertEquals("Cumulate Amt ", costResult.cumulateAmt, cost.getCumulatedAmt());
		return cost;
	}
	
	public void assertCostDetail(CostResult costResult, String whereClause, ArrayList<Object> parameters)
	{
		MCostDetail cd = getCostDetail(whereClause, parameters);
		System.out.println("Result" + costResult.toString());
		System.out.println("Cost Detail " + cd.toString());
		assertEquals("Cost Detail Amt " , costResult.cdAmt ,cd.getAmt());
		assertEquals("Cost Detail Adjutment ", costResult.cdAdjutment, cd.getCostAdjustment());
		assertEquals("Cost Detail Qty", costResult.cdQty,  cd.getQty() );
		assertEquals("Cost Detail Current Price Cost ", costResult.cdCurrentCostPrice, cd.getCurrentCostPrice());
		assertEquals("Cost Detail Cumulate Qty ", costResult.cdCumulateQty , cd.getCumulatedQty());
		assertEquals("Cost Detail Cumulate Amt ", costResult.cdCumulateAmt , cd.getCumulatedAmt());
		assertEquals("Account Date", new Date(costResult.cdDateAcct.getTime()).toString() , new Date(cd.getDateAcct().getTime()).toString());
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
	private void assertCostReceipt(CostResult costResult,
			int M_InOutLine_ID, 
			MAcctSchema as,
			String trxName)
	{		
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
	private void assertCostShipment(CostResult costResult,int C_OrderLine_ID, MAcctSchema as , String trxName)
	{		
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
	private void assertCostShipmentAdjust(CostResult costResult , int C_OrderLine_ID, MAcctSchema as , String trxName)
	{		
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
			CostResult costResult,
			int M_InOutLine_ID, 
			MAcctSchema as,
			String trxName)
	{
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
	private void assertCostMovement(
			CostResult costResult,
			int M_InOutLine_ID, 
			MAcctSchema as,
			String trxName)
	{
		MCost cost = assertCost(costResult);		
		
		String whereClause = "M_Product_ID=? AND M_CostElement_ID=? AND M_CostType_ID=? AND CostingMethod=? AND M_MovementLine_ID=?";	
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
	private void assertCostInvoice(CostResult costResult, 
			int M_InOutLine_ID, 
			MAcctSchema as,
			String trxName)
	{	
		//Evaluate Result
				
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
		today = Timestamp.valueOf("2010-01-01 00:00:00.0");
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
		receipt.setDateAcct(movementDate);
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
		
		//Create Sales Order
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
	
	public MMovement createMovement(Timestamp documentDate,BigDecimal qty)
	{
		MMovement move = new MMovement(getCtx(),0,trxName);
		move.setAD_Org_ID(Env.getAD_Org_ID(getCtx()));
		move.setC_DocType_ID((MDocType.getDocType(MDocType.DOCBASETYPE_MaterialMovement)));
		move.setMovementDate(documentDate);
		move.saveEx();
		
		MMovementLine moveLine = new MMovementLine(getCtx(),0,trxName);
		moveLine.setAD_Org_ID(Env.getAD_Org_ID(getCtx()));
		moveLine.setM_Movement_ID(move.getM_Movement_ID());
		moveLine.setM_Product_ID(product.getM_Product_ID());
		moveLine.setMovementQty(qty);
		moveLine.setM_Locator_ID(101); // Default HQ Locator
		moveLine.setM_LocatorTo_ID(102); // Default Store Locator
		moveLine.saveEx();
		
		move.processIt(DocAction.ACTION_Complete);
		move.saveEx();
		
		return move;
	}
	
}

class CostResult
{
	public CostResult(int M_Product_ID ,BigDecimal currentCostPrice, BigDecimal cumulateQty,
			BigDecimal cumulateAmt, BigDecimal cdAmt, BigDecimal cdAdjutment,
			BigDecimal cdQty, BigDecimal cdCurrentCostPrice,
			BigDecimal cdCumulateQty, BigDecimal cdCumulateAmt, Timestamp cdDateAcct) {
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
		this.cdDateAcct = cdDateAcct;
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
	Timestamp cdDateAcct;
	
	public String toString()
	{
		String value = " Product ID:"  + M_Product_ID 
					 + " Current Price:" + currentCostPrice 
					 + " Cumulate Qty:" + cumulateQty 
					 + " Cumulate Amt:" + cumulateAmt 
					 + " Amt:" + cdAmt 
					 + " Adjuetment:" + cdAdjutment 
					 + " Qty:" + cdQty
					 + " Cost Detail Current Price:" + cdCurrentCostPrice
					 + " Cost Detail Cumulate Qty:" + cdCumulateQty
					 + " Cost Detail Cumulate Amt:" + cdCumulateAmt
					 + " Cost Detail Date Account:" + cdDateAcct;
		return value;
	}
}

