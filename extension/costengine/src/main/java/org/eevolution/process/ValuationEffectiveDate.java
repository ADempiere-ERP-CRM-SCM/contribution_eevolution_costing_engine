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
 * Copyright (C) 2003-2010 e-Evolution,SC. All Rights Reserved.               *
 * Contributor(s): victor.perez@e-evolution.com http://www.e-evolution.com    *
 *****************************************************************************/
package org.eevolution.process;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.adempiere.exceptions.FillMandatoryException;
import org.compiere.model.MCostDetail;
import org.compiere.model.MProduct;
import org.compiere.model.MWarehouse;
import org.compiere.model.X_T_InventoryValue;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.DB;


/**
 *	Regenerate Cost Detail
 *	
 *	@author victor.perez@e-evolution.com, www.e-evolution.com
 */
public class ValuationEffectiveDate extends SvrProcess
{
	
    /** Parameters **/
	private int p_M_Warehouse_ID;
	private int p_M_Product_ID;
	private int p_M_Product_Category_ID;
	private int p_M_CostType_ID;
	private int p_M_CostElement_ID;
	private Timestamp p_DateValue;
	
	private StringBuffer whereClause = new StringBuffer();
	private ArrayList<Object> params = new ArrayList();   
	
	/**
	 *  Prepare - e.g., get Parameters.
	 */
	protected void prepare()
	{
         ProcessInfoParameter[] parameters = getParameter();
         for(ProcessInfoParameter parameter: parameters)
         {
        	 String name = parameter.getParameterName();
 			if (parameter.getParameter() == null)
 				;
 			else if (name.equals("DateValue"))
 			{	
 				p_DateValue = (Timestamp) parameter.getParameter();
 				if(p_DateValue == null)
 		    		throw new FillMandatoryException("@DateValue@");
 				
 				whereClause.append("WHERE cd.DateAcct<= ").append(DB.TO_DATE(p_DateValue));
 			}
 			else if (name.equals(MWarehouse.COLUMNNAME_M_Warehouse_ID))
 			{	
 				p_M_Warehouse_ID = parameter.getParameterAsInt();
 		    	if(p_M_Warehouse_ID > 0)
 		    	{
 		    		whereClause.append(" AND ").append("l.").append(X_T_InventoryValue.COLUMNNAME_M_Warehouse_ID).append("=? ");
 		    		params.add(p_M_Warehouse_ID);
 		    	}
 			}
 			else if (name.equals(MCostDetail.COLUMNNAME_M_Product_ID))
 			{	
 				p_M_Product_ID = parameter.getParameterAsInt();
 		    	if(p_M_Product_ID > 0)
 		    	{
 		    		whereClause.append(" AND ").append("p.").append(X_T_InventoryValue.COLUMNNAME_M_Product_ID).append("=? ");
 		    		params.add(p_M_Product_ID);
 		    	}
 			}
 			else if (name.equals(MProduct.COLUMNNAME_M_Product_Category_ID))
 			{	
 				p_M_Product_Category_ID = parameter.getParameterAsInt();
 		    	if(p_M_Product_Category_ID > 0)
 		    	{
 		    		whereClause.append(" AND ").append("p.").append(X_T_InventoryValue.COLUMNNAME_M_Product_Category_ID ).append( "=? ");
 		    		params.add(p_M_Product_Category_ID);
 		    	}
 			}
 			else if (name.equals(MCostDetail.COLUMNNAME_M_CostType_ID))
 			{
 				p_M_CostType_ID =  parameter.getParameterAsInt();
 				if(p_M_CostType_ID > 0)
 		    	{
 		    		whereClause.append(" AND ").append("cd.").append(X_T_InventoryValue.COLUMNNAME_M_CostType_ID + "=? ");
 		    		params.add(p_M_CostType_ID);
 		    	}
 			}
 			else if (name.equals(MCostDetail.COLUMNNAME_M_CostElement_ID))
 			{	
 				p_M_CostElement_ID = parameter.getParameterAsInt();
 				if(p_M_CostElement_ID > 0)
 		    	{
 		    		whereClause.append(" AND ").append("cd.").append(X_T_InventoryValue.COLUMNNAME_M_CostElement_ID + "=? ");
 		    		params.add(p_M_CostElement_ID);
 		    	}
 			}
 				
         }
	}	//	prepare

	/**
	 * execute the Valuation Effective Date
	 */    
    protected String doIt() throws Exception                
	{
    	generateInventoryValue();
		return "@Ok@";
	
	}
    
    /**
     * Generate the Inventory Valuation
     */
    private void generateInventoryValue()
    {    	   	
    	StringBuffer insert = new StringBuffer();
    	insert
    	.append("INSERT INTO T_InventoryValue ")
    	.append("(AD_PInstance_ID,DateValue,AD_Client_ID,AD_Org_ID,M_CostElement_ID,M_CostType_ID,M_Warehouse_ID,")
    	.append("M_Product_ID,M_Product_Category_ID,M_AttributeSetInstance_ID,Classification,Group1,Group2,QtyOnHand,CostAmt) ")
    	.append("SELECT ")
    	.append(getAD_PInstance_ID()).append(",")
    	.append("MAX(cd.DateAcct)").append(",")
    	.append("p.AD_Client_ID,p.AD_Org_ID,cd.M_CostElement_ID,cd.M_CostType_ID,l.M_Warehouse_ID,p.M_Product_ID,")
    	.append("p.M_Product_Category_ID,t.M_AttributeSetInstance_ID,p.Classification,p.Group1,p.Group2,MAX(cd.CumulatedQty + cd.Qty) AS QtyOnHand,")
    	.append("MAX(cd.Amt + cd.CumulatedAmt) AS CostAmt")
    	.append(" FROM M_Product p ")
    	.append(" INNER JOIN M_CostDetail cd ON (p.M_Product_ID=cd.M_Product_ID) ")
    	.append(" INNER JOIN M_Transaction t ON (cd.M_Transaction_ID=t.M_Transaction_ID)")
    	.append(" INNER JOIN M_Locator l ON (t.M_Locator_ID=l.M_Locator_ID) ");
    	whereClause.append(" GROUP BY p.AD_Client_ID,p.AD_Org_ID,cd.M_CostElement_ID,cd.M_CostType_ID,l.M_Warehouse_ID,")
    	.append("p.M_Product_ID,p.M_Product_Category_ID,t.M_AttributeSetInstance_ID,p.Classification,p.Group1,p.Group2");
    	insert.append(whereClause);
    	DB.executeUpdateEx(insert.toString(), params.toArray(),get_TrxName());
    	DB.executeUpdate("UPDATE T_InventoryValue SET cost = CostAmt / QtyOnHand ,  DateValue = "
    	+DB.TO_DATE(p_DateValue)+" WHERE AD_PInstance_ID=?", getAD_PInstance_ID(),get_TrxName());
    	
    }
}    
  
