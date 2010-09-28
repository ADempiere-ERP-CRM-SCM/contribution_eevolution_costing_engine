/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
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

import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;

import org.compiere.util.CCache;
import org.compiere.util.Msg;

/**
 * 	Cost Type Model
 *  @author Jorg Janke
 *  @version $Id: MCostType.java,v 1.2 2006/07/30 00:58:38 jjanke Exp $
 */
public class MCostType extends X_M_CostType
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2060640115481013228L;
	
	/**	Cache of AcctSchemas 					**/
	private static CCache<Integer,MCostType> s_cache = new CCache<Integer,MCostType>("MCostType", 3);	//  3 accounting schemas
	
	public static MCostType get (Properties ctx, int M_CostType_ID)
	{
		return get(ctx, M_CostType_ID, null);
	}	//	get

	public static MCostType get (Properties ctx, int M_CostType_ID, String trxName)
	{
		//  Check Cache
		Integer key = new Integer(M_CostType_ID);
		MCostType retValue = (MCostType)s_cache.get(key);
		if (retValue != null)
			return retValue;
		retValue = new MCostType (ctx, M_CostType_ID, trxName);
		if (trxName == null)
			s_cache.put(key, retValue);
		return retValue;
	}	//	get

	public static List<MCostType> get (Properties ctx, String trxName)
	{
		// TODO: anca_bradau: do caching
		return new Query(ctx, Table_Name, null, trxName)
		.setOnlyActiveRecords(true)
		.setClient_ID()
		.setOrderBy(COLUMNNAME_M_CostType_ID)
		.list();
	}
	
	public static MCostType getByOrg(Properties ctx,int AD_Org_ID, String trxName)
	{
		return new Query(ctx, Table_Name, "AD_Org_ID=?", trxName)
		.setOnlyActiveRecords(true)
		.setClient_ID()
		.setParameters(AD_Org_ID)
		.setOrderBy(COLUMNNAME_M_CostType_ID)
		.first();
	}
	
	public static MCostType getByMethodCosting(Properties ctx,String costingMethod, String trxName)
	{
		return new Query(ctx, Table_Name, "CostingMethod=?", trxName)
		.setOnlyActiveRecords(true)
		.setParameters(costingMethod)
		.setClient_ID()
		.setOrderBy(COLUMNNAME_CostingMethod)
		.first();
	}
	/**
	 * 	Standard Constructor
	 *	@param ctx context
	 *	@param M_CostType_ID id
	 *	@param trxName trx
	 */
	public MCostType (Properties ctx, int M_CostType_ID, String trxName)
	{
		super (ctx, M_CostType_ID, trxName);
	}	//	MCostType

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName trx
	 */
	public MCostType (Properties ctx, ResultSet rs, String trxName)
	{
		super (ctx, rs, trxName);
	}	//	MCostType
	
	/**
	 * 	String Representation
	 *	@return info
	 */
	public String toString ()
	{
		StringBuffer sb = new StringBuffer ("MCostType[");
		sb.append (get_ID()).append ("-").append (getName ()).append ("]");
		return sb.toString ();
	}	//	toString
	
	/**
	 * 	Before Save
	 *	@param newRecord new
	 *	@return true
	 */
	protected boolean beforeSave (boolean newRecord)
	{
		return true;
	}	//	beforeSave

	/**
	 * 	Before Delete
	 *	@return true if it can be deleted
	 */
	protected boolean beforeDelete ()
	{
		MAcctSchema[] ass = MAcctSchema.getClientAcctSchema(getCtx(), getAD_Client_ID());
		for (int i = 0; i < ass.length; i++)
		{
			if (ass[i].getM_CostType_ID() == getM_CostType_ID())
			{
				log.saveError("CannotDelete", Msg.getElement(getCtx(), "C_AcctSchema_ID")
					+ " - " + ass[i].getName());
				return false;
			}
		}
		return true;
	}	//	beforeDelete
}	//	MCostType
