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
 * Contributor(s): victor.perez@e-evolution.com http://www.e-evolution.com    *
 *****************************************************************************/

package org.adempiere.engine;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.acct.DocLine;
import org.compiere.model.I_AD_WF_Node;
import org.compiere.model.I_C_InvoiceLine;
import org.compiere.model.I_C_OrderLine;
import org.compiere.model.I_M_Cost;
import org.compiere.model.I_M_CostDetail;
import org.compiere.model.I_M_CostElement;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MClient;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MCostElement;
import org.compiere.model.MCostType;
import org.compiere.model.MLandedCostAllocation;
import org.compiere.model.MMatchInv;
import org.compiere.model.MMatchPO;
import org.compiere.model.MMovementLine;
import org.compiere.model.MProduct;
import org.compiere.model.MTransaction;
import org.compiere.model.PO;
import org.compiere.model.Query;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Util;
import org.eevolution.model.I_PP_Order_BOMLine;
import org.eevolution.model.MPPCostCollector;
import org.eevolution.model.MPPOrderCost;
import org.eevolution.model.RoutingService;
import org.eevolution.model.RoutingServiceFactory;

/**
 * Cost Engine
 * @author victor.perez@e-evolution.com http://www.e-evolution.com
 *
 */
public class CostEngine
{
	/**	Logger							*/
	protected transient CLogger	log = CLogger.getCLogger (getClass());
	
	public String getCostingMethod()
	{
		return MCostElement.COSTINGMETHOD_StandardCosting;
	}
	
	public BigDecimal getResourceStandardCostRate(MPPCostCollector cc, int S_Resource_ID, CostDimension d, String trxName)
	{
		final MProduct resourceProduct = MProduct.forS_Resource_ID(Env.getCtx(), S_Resource_ID, null);
		return getProductStandardCostPrice(
				cc,
				resourceProduct,
				MAcctSchema.get(Env.getCtx(), d.getC_AcctSchema_ID()),
				MCostElement.get(Env.getCtx(), d.getM_CostElement_ID())
		);
	}
	
	public BigDecimal getResourceActualCostRate(MPPCostCollector cc, int S_Resource_ID, CostDimension d, String trxName)
	{
		if (S_Resource_ID <= 0)
			return Env.ZERO;
		final MProduct resourceProduct = MProduct.forS_Resource_ID(Env.getCtx(), S_Resource_ID, null);
		return getProductActualCostPrice(
				cc,
				resourceProduct,
				MAcctSchema.get(Env.getCtx(), d.getC_AcctSchema_ID()),
				MCostElement.get(Env.getCtx(), d.getM_CostElement_ID()),
				trxName
		);
	}
	
	public BigDecimal getProductActualCostPrice(MPPCostCollector cc, MProduct product, MAcctSchema as, MCostElement element, String trxName)
	{
		CostDimension d = new CostDimension(product,
				as, as.getM_CostType_ID(),
				0, //AD_Org_ID,
				0, //M_ASI_ID,
				element.getM_CostElement_ID());
		MCost cost = d.toQuery(MCost.class, trxName).firstOnly();
		if(cost == null)
			throw new AdempiereException("@NotFound@ @M_Cost_ID@ - "+as+", "+element); 
		BigDecimal price = cost.getCurrentCostPrice().add(cost.getCurrentCostPriceLL());
		return roundCost(price, as.getC_AcctSchema_ID());
	}

	public BigDecimal getProductStandardCostPrice(MPPCostCollector cc, MProduct product, MAcctSchema as, MCostElement element)
	{
		CostDimension d = new CostDimension(product,
				as, as.getM_CostType_ID(),
				0, //AD_Org_ID,
				0, //M_ASI_ID,
				element.getM_CostElement_ID());
		MPPOrderCost oc = d.toQuery(MPPOrderCost.class, MPPOrderCost.COLUMNNAME_PP_Order_ID+"=?",
				new Object[]{cc.getPP_Order_ID()},
				cc.get_TrxName())
		.firstOnly();
		if (oc == null)
		{
			return Env.ZERO;
		}
		BigDecimal costs = oc.getCurrentCostPrice().add(oc.getCurrentCostPriceLL());
		return roundCost(costs, as.getC_AcctSchema_ID());
	}
	
	protected BigDecimal roundCost(BigDecimal price, int C_AcctSchema_ID)
	{
		// Fix Cost Precision 
		int precision = MAcctSchema.get(Env.getCtx(), C_AcctSchema_ID).getCostingPrecision();
		BigDecimal priceRounded = price;
		if (priceRounded.scale() > precision)
		{
			priceRounded = priceRounded.setScale(precision, RoundingMode.HALF_UP);
		}
		return priceRounded;
	}

	public List<MCost> getByElement (MProduct product, MAcctSchema as, 
			int M_CostType_ID, int AD_Org_ID, int M_AttributeSetInstance_ID, int M_CostElement_ID)
	{
		CostDimension cd = new CostDimension(product, as, M_CostType_ID,
				AD_Org_ID, M_AttributeSetInstance_ID,
				M_CostElement_ID);
		return cd.toQuery(MCost.class, product.get_TrxName())
		.setOnlyActiveRecords(true)
		.list();
	}

	/**
	 * Get Cost Detail
	 * @param model Model Inventory Line
	 * @param as Account Schema
	 * @param M_CostElement_ID Cost Element
	 * @param M_AttributeSetInstance_ID
	 * @return MCostDetail 
	 */
	private MCostDetail getCostDetail(IDocumentLine model, MTransaction mtrx ,MAcctSchema as, int M_CostElement_ID)
	{
		final String whereClause = "AD_Client_ID=? AND AD_Org_ID=?"
			+" AND "+model.get_TableName()+"_ID=?" 
			+" AND "+MCostDetail.COLUMNNAME_M_Product_ID+"=?"
			+" AND "+MCostDetail.COLUMNNAME_M_AttributeSetInstance_ID+"=?"
			+" AND "+MCostDetail.COLUMNNAME_C_AcctSchema_ID+"=?"
			//						+" AND "+MCostDetail.COLUMNNAME_M_CostType_ID+"=?"
			+" AND "+MCostDetail.COLUMNNAME_M_CostElement_ID+"=?";
		final Object[] params = new Object[]{
				mtrx.getAD_Client_ID(), 
				mtrx.getAD_Org_ID(), 
				model.get_ID(),
				mtrx.getM_Product_ID(),
				mtrx.getM_AttributeSetInstance_ID(),
				as.getC_AcctSchema_ID(),
				//as.getM_CostType_ID(), 
				M_CostElement_ID, 
		};
		return new Query(mtrx.getCtx(),MCostDetail.Table_Name, whereClause , mtrx.get_TrxName())
		.setParameters(params)
		.firstOnly();
	}	

	public void createCostDetail (MTransaction mtrx)
	{
		createCostDetail(mtrx , mtrx.getDocumentLine());
	}
	
	public void createCostDetail (MTransaction mtrx ,IDocumentLine model)
	{
		for(MAcctSchema as : MAcctSchema.getClientAcctSchema(mtrx.getCtx(), mtrx.getAD_Client_ID()))
		{
				createCostDetail(mtrx, model , as,model.isSOTrx());
		}	
	}
	
	public void createCostDetail (MTransaction mtrx , IDocumentLine model ,
			MAcctSchema as,
			Boolean isSOTrx)
	{
		
		StringBuilder description = new StringBuilder();
		if (!Util.isEmpty(model.getDescription(), true))
			description.append(model.getDescription());
		if (isSOTrx != null)
		{
			description.append(isSOTrx ? "(|->)" : "(|<-)");
		}
		
		//Validate if exist Cost for Cost Type defined in Account Schema
		validateCostType(model , as);
		
		List<MCost> costs = MCost.getForProduct(as, model);

		for (MCost cost : costs)
		{
			final MCostElement ce = MCostElement.get(cost.getCtx(), cost.getM_CostElement_ID());
			if (ce.isLandedCost())
			{
				// skip landed costs for incoming transactions
			    if (cost.getCurrentQty().equals(Env.ZERO) && mtrx.getMovementType().endsWith("-"))
				{
					continue;
				}
			    else if (!(model instanceof MLandedCostAllocation) && mtrx.getMovementType().equals("V+"))
				{
					continue;
				}
			    else if (isSOTrx != null)
				{
					if (!isSOTrx && model instanceof MMovementLine)
						continue;
				}
				else if (!model.isSOTrx())
				{
					continue;
				}
			}
			if (model instanceof MLandedCostAllocation && !ce.isLandedCost())
			{
				continue;
			}
			final ICostingMethod method = CostingMethodFactory.get().getCostingMethod(ce, cost.getCostingMethod());
			method.setCostingMethod(as, mtrx, cost, model.getPriceActual(), isSOTrx);
			MCostDetail cd = method.process();	
			final String idColumnName = CostEngine.getIDColumnName(model);		
			cd.set_ValueOfColumn(idColumnName,CostEngine.getIDColumn(model));
			cd.saveEx();
		}
	}

	public void createCostDetail (IDocumentLine model ,
			MAcctSchema as, CostComponent cc,
			Boolean isSOTrx, boolean setProcessed)
	{
		final String idColumnName = model.get_TableName()+"_ID";
		final String trxName = model.get_TrxName();
		
		//	Delete Unprocessed zero Differences
		String sql = "DELETE M_CostDetail "
			+ "WHERE Processed='N' AND COALESCE(DeltaAmt,0)=0 AND COALESCE(DeltaQty,0)=0"
			+ " AND "+idColumnName+"=?"
			+ " AND C_AcctSchema_ID=?"
			+ " AND M_AttributeSetInstance_ID=?";
		if (isSOTrx != null)
		{
			sql += " AND "+I_M_CostDetail.COLUMNNAME_IsSOTrx+"="+(isSOTrx ? "'Y'" : "'N'");
		}
		int no = DB.executeUpdateEx(sql,
				new Object[]{model.get_ID(), as.getC_AcctSchema_ID(), model.getM_AttributeSetInstance_ID()},
				trxName);
		if (no != 0)
			log.config("Deleted #" + no);
		
		// Build Description string
		StringBuilder description = new StringBuilder();
		if (!Util.isEmpty(model.getDescription(), true))
			description.append(model.getDescription());
		if (isSOTrx != null)
		{
			description.append(isSOTrx ? "(|->)" : "(|<-)");
		}
		
		List<MCost> costs =MCost.getForProduct(as, model);
		for (MCost cost : costs)
		{
			final MCostElement ce = MCostElement.get(cost.getCtx(), cost.getM_CostElement_ID());
			if (ce.isLandedCost())
			{
				// skip landed costs
				continue;
			}
		
			final ICostingMethod method = CostingMethodFactory.get().getCostingMethod(ce, cost.getCostingMethod());
			method.setCostingMethod(as, null, cost, model.getPriceActual(), isSOTrx);
			method.process();
		}
	}
	
	public void createCostDetailForLandedCost (IDocumentLine model ,
			MAcctSchema as, CostComponent cc,
			Boolean isSOTrx, boolean setProcessed)
	{
		final String idColumnName = model.get_TableName()+"_ID";
		final String trxName = model.get_TrxName();
		// String idColumnName = MLandedCost.COLUMNNAME_C_InvoiceLine_ID;
		//	Delete Unprocessed zero Differences
		String sql = "DELETE M_CostDetail "
			+ "WHERE Processed='N' AND COALESCE(DeltaAmt,0)=0 AND COALESCE(DeltaQty,0)=0"
			+ " AND "+idColumnName+"=?"
			+ " AND C_AcctSchema_ID=?"
			+ " AND M_AttributeSetInstance_ID=?";
		if (isSOTrx != null)
		{
			sql += " AND "+I_M_CostDetail.COLUMNNAME_IsSOTrx+"="+(isSOTrx ? "'Y'" : "'N'");
		}
		int no = DB.executeUpdateEx(sql,
				new Object[]{model.get_ID(), as.getC_AcctSchema_ID(), model.getM_AttributeSetInstance_ID()},
				trxName);
		if (no != 0)
			log.config("Deleted #" + no);

		List<MCost> costs = MCost.getForProduct(as, model);
		for (MCost cost : costs)
		{
			final MCostElement ce = MCostElement.get(cost.getCtx(), cost.getM_CostElement_ID());
			
			if (ce.isLandedCost()) 
			{
				    CostDimension dimension = new CostDimension (model.getAD_Client_ID(), model.getAD_Org_ID(), model.getM_Product_ID(), model.getM_AttributeSetInstance_ID(), cost.getM_CostType_ID(), as.getC_AcctSchema_ID(), cost.getM_CostElement_ID());
					MCostDetail	cd = new MCostDetail(model.getCtx(), dimension, cc.getAmount() , cc.getQty(), model.get_TrxName());

					if (!cd.set_ValueOfColumnReturningBoolean(idColumnName, model.get_ID()))
						throw new AdempiereException("Cannot set "+idColumnName);
					if (isSOTrx != null)
						cd.setIsSOTrx(isSOTrx);
					else
						cd.setIsSOTrx(model.isSOTrx());	
					cd.setM_Transaction_ID(model.get_ID());
					if (setProcessed)
						cd.setProcessed(true);
					cd.saveEx();
					if (!cd.isProcessed())
					{
						MClient client = MClient.get(as.getCtx(), as.getAD_Client_ID());
						if (client.isCostImmediate())
							cd.process();
					}
			//	}
			}
			else 
			{
				continue;
			}
		}
	}


	public MCostDetail getCostDetail (MCost cost, IDocumentLine line, Boolean isSOTrx)
	{
		final String idColumnName = line.get_TableName()+"_ID";
		
		List<Object> params = new ArrayList<Object>();
		String whereClauseFinal = idColumnName+"=?"
		+ " AND M_AttributeSetInstance_ID=?"
		+ " AND C_AcctSchema_ID=?"
		+ " AND M_CostType_ID=?";
		params.add(line.get_ID());
		params.add(cost.getM_AttributeSetInstance_ID());
		params.add(cost.getC_AcctSchema_ID());
		params.add(cost.getM_CostType_ID());
		if (isSOTrx != null)
		{
			whereClauseFinal += " AND IsSOTrx=?";
			params.add(isSOTrx);
		}
		MCostDetail retValue = new Query(cost.getCtx(), MCostDetail.Table_Name, whereClauseFinal, cost.get_TrxName())
		.setParameters(params)
		.first();
		return retValue;
	}


	/**
	 * Create Cost Detail (Material Issue, Material Receipt)
	 * @param model
	 * @param mtrx Material Transaction
	 */
	public void createStandardCostDetail (IDocumentLine model , MTransaction mtrx)
	{
		final MPPCostCollector cc = (model instanceof MPPCostCollector ? (MPPCostCollector)model : null);
		for(MAcctSchema as : getAcctSchema(mtrx))
		{
			// Cost Detail
			final MProduct product = MProduct.get(mtrx.getCtx(), mtrx.getM_Product_ID());
			final String costingMethod = product.getCostingMethod(as);
			// Check costing method
			if (!getCostingMethod().equals(costingMethod))
			{
				throw new AdempiereException("Costing method not supported - "+costingMethod);
			}
			//
			for (MCostElement element : getCostElements(mtrx.getCtx()))
			{
				//
				//	Delete Unprocessed zero Differences
				deleteCostDetail(model, as, element.get_ID(), mtrx.getM_AttributeSetInstance_ID());
				//
				// Get Costs
				final BigDecimal qty = mtrx.getMovementQty();
				final BigDecimal price = getProductActualCostPrice(cc, product, as, element, mtrx.get_TrxName());
				final BigDecimal amt = roundCost(price.multiply(qty), as.getC_AcctSchema_ID());
				//
				// Create / Update Cost Detail
				MCostDetail cd = getCostDetail(model, mtrx ,as, element.get_ID());
				if (cd == null)		//	createNew
				{	
					List<MCostType> costtypes = MCostType.get(as.getCtx(), as.get_TrxName());
	                for (MCostType mc : costtypes)
					{	
	                int M_CostType_ID = mc.get_ID();
					cd = new MCostDetail (as, mtrx.getAD_Org_ID(), 
							mtrx.getM_Product_ID(), mtrx.getM_AttributeSetInstance_ID(), 
							element.get_ID(),
							amt,
							qty,
							model.getDescription(),
							mtrx.get_TrxName(), M_CostType_ID);
//					cd.setMovementDate(mtrx.getMovementDate());
//					if (cost != null)
//					{	
//						cd.setCurrentCostPrice(cost.getCurrentCostPrice());
//						cd.setCurrentCostPriceLL(cost.getCurrentCostPriceLL());
//					}
//					else
//					{
//						cd.setCurrentCostPrice(Env.ZERO);
//						cd.setCurrentCostPriceLL(Env.ZERO);
//					}
//					cd.setM_CostType_ID(as.getM_CostType_ID());
//					//cd.setCostingMethod(element.getCostingMethod());
//					cd.setM_Transaction_ID(mtrx.get_ID());
					if(model instanceof MPPCostCollector)
						cd.setPP_Cost_Collector_ID(model.get_ID());
				}
				}
				else
				{
					cd.setDeltaAmt(amt.subtract(cd.getAmt()));
					cd.setDeltaQty(mtrx.getMovementQty().subtract(cd.getQty()));
					if (cd.isDelta())
					{
						cd.setProcessed(false);
						cd.setAmt(amt);
						cd.setQty(mtrx.getMovementQty());
					}
				}
				cd.saveEx();
				processCostDetail(cd);
				log.config("" + cd);
			} // for ELements	
		} // Account Schema 			
	}

	private int deleteCostDetail(IDocumentLine model, MAcctSchema as ,int M_CostElement_ID,
			int M_AttributeSetInstance_ID)
	{
		//	Delete Unprocessed zero Differences
		String sql = "DELETE " + MCostDetail.Table_Name
		+ " WHERE Processed='N' AND COALESCE(DeltaAmt,0)=0 AND COALESCE(DeltaQty,0)=0"
		+ " AND "+model.get_TableName()+"_ID=?" 
		+ " AND "+MCostDetail.COLUMNNAME_C_AcctSchema_ID+"=?" 
		+ " AND "+MCostDetail.COLUMNNAME_M_AttributeSetInstance_ID+"=?"
		//			+ " AND "+MCostDetail.COLUMNNAME_M_CostType_ID+"=?"
		+ " AND "+MCostDetail.COLUMNNAME_M_CostElement_ID+"=?";
		Object[] parameters = new Object[]{ model.get_ID(), 
				as.getC_AcctSchema_ID(), 
				M_AttributeSetInstance_ID,
				//as.getM_CostType_ID(),
				M_CostElement_ID};

		int no =DB.executeUpdateEx(sql,parameters, model.get_TrxName());
		if (no != 0)
			log.config("Deleted #" + no);
		return no;
	}
	
	private void processCostDetail(MCostDetail cd)
	{
		if (!cd.isProcessed())
		{
			MAcctSchema as = MAcctSchema.get(cd.getCtx(), cd.getC_AcctSchema_ID());
			MClient client = MClient.get(as.getCtx(), as.getAD_Client_ID());
			if (client.isCostImmediate())
				cd.process();
		}
	}

	public static boolean isActivityControlElement(I_M_CostElement element)
	{
		String costElementType = element.getCostElementType();
		return MCostElement.COSTELEMENTTYPE_Resource.equals(costElementType)
		|| MCostElement.COSTELEMENTTYPE_Overhead.equals(costElementType)
		|| MCostElement.COSTELEMENTTYPE_BurdenMOverhead.equals(costElementType);
	}

	private List<MCostElement> getCostElements(Properties ctx)
	{
		return MCostElement.getByCostingMethod(ctx, getCostingMethod());
	}
	
	private List<MAcctSchema> getAcctSchema(PO po)
	{
		int AD_Org_ID = po.getAD_Org_ID();
		MAcctSchema[] ass = MAcctSchema.getClientAcctSchema(po.getCtx(), po.getAD_Client_ID());
		ArrayList<MAcctSchema> list = new ArrayList<MAcctSchema>(ass.length);
		for (MAcctSchema as : ass)
		{
			if(!as.isSkipOrg(AD_Org_ID))
				list.add(as);
		}
		return list;
	}
	
	private MCostDetail getCostDetail(MPPCostCollector cc, int M_CostElement_ID)
	{
		final String whereClause = MCostDetail.COLUMNNAME_PP_Cost_Collector_ID+"=?"
		+" AND "+MCostDetail.COLUMNNAME_M_CostElement_ID+"=?";
		MCostDetail cd = new Query(cc.getCtx(), MCostDetail.Table_Name, whereClause, cc.get_TrxName())
		.setParameters(new Object[]{cc.getPP_Cost_Collector_ID(), M_CostElement_ID})
		.firstOnly();
		return cd;
	}

	private MPPCostCollector createVarianceCostCollector(MPPCostCollector cc, String CostCollectorType)
	{
		MPPCostCollector ccv = new MPPCostCollector(cc.getCtx(), 0, cc.get_TrxName());
		MPPCostCollector.copyValues(cc, ccv);
		ccv.setProcessing(false);
		ccv.setProcessed(false);
		ccv.setDocStatus(MPPCostCollector.STATUS_Drafted);
		ccv.setDocAction(MPPCostCollector.ACTION_Complete);
		ccv.setCostCollectorType(CostCollectorType);
		ccv.setDocumentNo(null); // reset
		ccv.saveEx();
		return ccv;
	}
	
	/**
	 * Create & Proce Cost Detail for Variances
	 * @param ccv
	 * @param amt
	 * @param qty
	 * @param cd (optional)
	 * @param product
	 * @param as
	 * @param element
	 * @return
	 */
	private MCostDetail createVarianceCostDetail(MPPCostCollector ccv, BigDecimal amt, BigDecimal qty,
			MCostDetail cd, MProduct product, MAcctSchema as, MCostElement element)
	{
		final MCostDetail cdv = new MCostDetail(ccv.getCtx(), 0, ccv.get_TrxName());
		if (cd != null)
		{
			MCostDetail.copyValues(cd, cdv);
			cdv.setProcessed(false);
		}
		if (product != null)
		{
			cdv.setM_Product_ID(product.getM_Product_ID());
			cdv.setM_AttributeSetInstance_ID(0);
		}
		if (as != null)
		{
			cdv.setC_AcctSchema_ID(as.getC_AcctSchema_ID());
		}
		if (element != null)
		{
			cdv.setM_CostElement_ID(element.getM_CostElement_ID());
		}
		//
		cdv.setPP_Cost_Collector_ID(ccv.getPP_Cost_Collector_ID());
		cdv.setAmt(amt);
		cdv.setQty(qty);
		cdv.saveEx();
		processCostDetail(cdv);
		return cdv;
	}
	
	public void createActivityControl(MPPCostCollector cc)
	{
		if (!cc.isCostCollectorType(MPPCostCollector.COSTCOLLECTORTYPE_ActivityControl))
			return;
		//
		final MProduct product = MProduct.forS_Resource_ID(cc.getCtx(), cc.getS_Resource_ID(), null);
		final RoutingService routingService = RoutingServiceFactory.get().getRoutingService(cc.getAD_Client_ID());
		final BigDecimal qty = routingService.getResourceBaseValue(cc.getS_Resource_ID(), cc);
		for (MAcctSchema as : getAcctSchema(cc))
		{
			for (MCostElement element : getCostElements(cc.getCtx()))
			{
				if (!isActivityControlElement(element))
				{
					continue;
				}
				final CostDimension d = new CostDimension(product,
						as,
						as.getM_CostType_ID(),
						0, //AD_Org_ID,
						0, //M_ASI_ID
						element.getM_CostElement_ID());
				final BigDecimal price = getResourceActualCostRate(cc, cc.getS_Resource_ID(), d, cc.get_TrxName());
				BigDecimal costs = price.multiply(qty);
				if (costs.scale() > as.getCostingPrecision())
					costs = costs.setScale(as.getCostingPrecision(), RoundingMode.HALF_UP);
				//
				List<MCostType> costtypes = MCostType.get(as.getCtx(), as.get_TrxName());
				for (MCostType mc : costtypes)
				{	
					int M_CostType_ID = mc.get_ID();
					MCostDetail cd = new MCostDetail(as,
							0, //AD_Org_ID,
							d.getM_Product_ID(),
							0, // M_AttributeSetInstance_ID,
							element.getM_CostElement_ID(),
							costs.negate(),
							qty.negate(),
							"", // Description,
							cc.get_TrxName(), M_CostType_ID);
					cd.setPP_Cost_Collector_ID(cc.getPP_Cost_Collector_ID());
					cd.saveEx();
					processCostDetail(cd);
				}
			}
		}
	}

	public void createUsageVariances(MPPCostCollector ccuv)
	{
		// Apply only for material Usage Variance
		if (!ccuv.isCostCollectorType(MPPCostCollector.COSTCOLLECTORTYPE_UsegeVariance))
		{
			throw new IllegalArgumentException("Cost Collector is not Material Usage Variance");
		}
		//
		final MProduct product;
		final BigDecimal qty;
		if (ccuv.getPP_Order_BOMLine_ID() > 0)
		{
			product = MProduct.get(ccuv.getCtx(), ccuv.getM_Product_ID());
			qty = ccuv.getMovementQty();
		}
		else
		{
			product = MProduct.forS_Resource_ID(ccuv.getCtx(), ccuv.getS_Resource_ID(), null);
			final RoutingService routingService = RoutingServiceFactory.get().getRoutingService(ccuv.getAD_Client_ID());
			qty = routingService.getResourceBaseValue(ccuv.getS_Resource_ID(), ccuv);
		}
		//
		for(MAcctSchema as : getAcctSchema(ccuv))
		{
			for (MCostElement element : getCostElements(ccuv.getCtx()))
			{
				final BigDecimal price = getProductActualCostPrice(ccuv, product, as, element, ccuv.get_TrxName());
				final BigDecimal amt = roundCost(price.multiply(qty), as.getC_AcctSchema_ID());
				//
				// Create / Update Cost Detail
				createVarianceCostDetail(ccuv,
						amt, qty,
						null, // no original cost detail
						product,
						as,
						element);
			} // for ELements	
		} // Account Schema 			
	}
	
	public void createRateVariances(MPPCostCollector cc)
	{
		final MProduct product;
		if (cc.isCostCollectorType(MPPCostCollector.COSTCOLLECTORTYPE_ActivityControl))
		{
			final I_AD_WF_Node node = cc.getPP_Order_Node().getAD_WF_Node();
			product = MProduct.forS_Resource_ID(cc.getCtx(), node.getS_Resource_ID(), null);
		}
		else if (cc.isCostCollectorType(MPPCostCollector.COSTCOLLECTORTYPE_ComponentIssue))
		{
			final I_PP_Order_BOMLine bomLine = cc.getPP_Order_BOMLine();
			product = MProduct.get(cc.getCtx(), bomLine.getM_Product_ID());
		}
		else
		{
			return;
		}
		
		MPPCostCollector ccrv = null; // Cost Collector - Rate Variance
		for (MAcctSchema as : getAcctSchema(cc))
		{
			for (MCostElement element : getCostElements(cc.getCtx()))
			{
				final MCostDetail cd = getCostDetail(cc, element.getM_CostElement_ID());
				if (cd == null)
					continue;
				//
				final BigDecimal qty = cd.getQty();
				final BigDecimal priceStd = getProductStandardCostPrice(cc, product, as, element);
				final BigDecimal priceActual = getProductActualCostPrice(cc, product, as, element, cc.get_TrxName());
				final BigDecimal amtStd = roundCost(priceStd.multiply(qty), as.getC_AcctSchema_ID());
				final BigDecimal amtActual = roundCost(priceActual.multiply(qty), as.getC_AcctSchema_ID());
				if (amtStd.compareTo(amtActual) == 0)
					continue;
				//
				if (ccrv == null)
				{
					ccrv = createVarianceCostCollector(cc, MPPCostCollector.COSTCOLLECTORTYPE_RateVariance);
				}
				//
				createVarianceCostDetail(ccrv,
						amtActual.negate(), qty.negate(),
						cd, null, as, element);
				createVarianceCostDetail(ccrv,
						amtStd, qty,
						cd, null, as, element);
			}
		}
		//
		if (ccrv != null)
		{
			boolean ok = ccrv.processIt(MPPCostCollector.ACTION_Complete);
			ccrv.saveEx();
			if (!ok)
				throw new AdempiereException(ccrv.getProcessMsg());
		}
	}

	public void createMethodVariances(MPPCostCollector cc)
	{
		if (!cc.isCostCollectorType(MPPCostCollector.COSTCOLLECTORTYPE_ActivityControl))
			return;
		//
		final int std_resource_id = cc.getPP_Order_Node().getAD_WF_Node().getS_Resource_ID();
		final int actual_resource_id = cc.getS_Resource_ID();
		if (std_resource_id == actual_resource_id)
		{
			return;
		}
		//
		MPPCostCollector ccmv = null; // Cost Collector - Method Change Variance
		final RoutingService routingService = RoutingServiceFactory.get().getRoutingService(cc.getAD_Client_ID());
		for (MAcctSchema as : getAcctSchema(cc))
		{
			for (MCostElement element : getCostElements(cc.getCtx()))
			{
				final MProduct resourcePStd = MProduct.forS_Resource_ID(cc.getCtx(), std_resource_id, null); 
				final MProduct resourcePActual = MProduct.forS_Resource_ID(cc.getCtx(), actual_resource_id, null);
				final BigDecimal priceStd = getProductActualCostPrice(cc, resourcePStd, as, element, cc.get_TrxName());
				final BigDecimal priceActual = getProductActualCostPrice(cc, resourcePActual, as, element, cc.get_TrxName());
				if (priceStd.compareTo(priceActual) == 0)
				{
					continue;
				}
				//
				if (ccmv == null)
				{
					ccmv = createVarianceCostCollector(cc, MPPCostCollector.COSTCOLLECTORTYPE_MethodChangeVariance);
				}
				//
				final BigDecimal qty = routingService.getResourceBaseValue(cc.getS_Resource_ID(), cc);
				final BigDecimal amtStd = priceStd.multiply(qty); 
				final BigDecimal amtActual = priceActual.multiply(qty);
				//
				createVarianceCostDetail(ccmv,
						amtActual, qty,
						null, resourcePActual, as, element);
				createVarianceCostDetail(ccmv,
						amtStd.negate(), qty.negate(),
						null, resourcePStd, as, element);
			}
		}
		//
		if (ccmv != null)
		{
			boolean ok = ccmv.processIt(MPPCostCollector.ACTION_Complete);
			ccmv.saveEx();
			if (!ok)
				throw new AdempiereException(ccmv.getProcessMsg());
		}
	}


	public void validateCostType(IDocumentLine model , MAcctSchema as)
	{
		MProduct product = new MProduct(model.getCtx(), model.getM_Product_ID(), model.get_TrxName());
		String CostingLevel = product.getCostingLevel(as);
		int AD_Org_ID = model.getAD_Org_ID();
		int M_AttributeSetInstance_ID = model.getM_AttributeSetInstance_ID();
		String costingMethod = as.getCostingMethod();
		
		if (MAcctSchema.COSTINGLEVEL_Client.equals(CostingLevel))
		{
			AD_Org_ID = 0;
			M_AttributeSetInstance_ID = 0;
		}
		else if (MAcctSchema.COSTINGLEVEL_Organization.equals(CostingLevel))
			M_AttributeSetInstance_ID = 0;
		else if (MAcctSchema.COSTINGLEVEL_BatchLot.equals(CostingLevel))
			AD_Org_ID = 0;
		//	Costing Method
		if (costingMethod == null)
		{
			costingMethod = product.getCostingMethod(as);
			if (costingMethod == null)
			{
				throw new IllegalArgumentException("No Costing Method");
			}
		}
		
		String whereClause = I_M_CostElement.COLUMNNAME_CostElementType + "=?";
		MCostElement ce = new Query(model.getCtx(), I_M_CostElement.Table_Name, whereClause, model.get_TrxName())
		.setClient_ID()
		.setOnlyActiveRecords(true)
		.setParameters(MCostElement.COSTELEMENTTYPE_Material)
		.setOrderBy(MCostElement.COLUMNNAME_M_CostElement_ID +","+MCostElement.COLUMNNAME_CostElementType)
		.first();
		 
		 if(ce == null)
			 throw new IllegalArgumentException("No Costing Elemnt Material Type"); 
		 
		MCostType costtype = new  MCostType(model.getCtx() , as.getM_CostType_ID() , model.get_TrxName());
		if(costtype== null)
		{	
			throw new AdempiereException("Error do not exist material cost element for method cost " + as.getCostingMethod());
		}	
		
		whereClause = I_M_Cost.COLUMNNAME_AD_Org_ID + "=? AND "
								 + I_M_Cost.COLUMNNAME_C_AcctSchema_ID + "=? AND "
								 + I_M_Cost.COLUMNNAME_M_Product_ID + "=? AND "
								 + I_M_Cost.COLUMNNAME_M_AttributeSetInstance_ID + "=? AND "
								 + I_M_Cost.COLUMNNAME_M_CostElement_ID + "=? AND "
								 + I_M_Cost.COLUMNNAME_M_CostType_ID + "=?";

		MCost cost = new Query(model.getCtx(), I_M_Cost.Table_Name, whereClause, model.get_TrxName())
		.setClient_ID()
		.setParameters(AD_Org_ID, 
		as.getC_AcctSchema_ID(), 
		model.getM_Product_ID(), 
		M_AttributeSetInstance_ID, 
		ce.getM_CostElement_ID(), 
		as.getM_CostType_ID())	
		.first();
		if(cost == null)
		{	
			cost = new MCost(product, M_AttributeSetInstance_ID, as , AD_Org_ID , ce.getM_CostElement_ID() , costtype);
			cost.saveEx();
		}	
		return;
	}


	public MCostDetail[] getCostDetails (DocLine docLine, MAcctSchema as, int AD_Org_ID, String whereClause)
	{
		final String whereClauseFinal = "AD_Org_ID=?" 
			+" AND M_Product_ID=?"
			+" AND C_AcctSchema_ID=?"
			+" AND M_CostType_ID=?" //ancabradau
			+(Util.isEmpty(whereClause, true) ? "" : " AND "+whereClause)
		;
		List<MCostDetail> list = new Query(docLine.getCtx(), MCostDetail.Table_Name, whereClauseFinal, docLine.getTrxName())
			.setParameters(new Object[]{AD_Org_ID,
					docLine.getM_Product_ID(),
					as.getC_AcctSchema_ID(),
					as.getM_CostType_ID()}) //ancabradau
			.setOrderBy("IsSOTrx ASC") // Receipt First (IsSOTrx=N)
			.list();
		return list.toArray(new MCostDetail[list.size()]);
	}

	
	static public String getIDColumnName(IDocumentLine model)
	{
		String idColumnName = model.get_TableName()+"_ID";			
		if( model instanceof MMatchPO)
		{
			idColumnName = I_C_OrderLine.COLUMNNAME_C_OrderLine_ID;
		}
		if( model instanceof MMatchInv)
		{
			idColumnName = I_C_InvoiceLine.COLUMNNAME_C_InvoiceLine_ID;
		}
		return idColumnName;		
	}
	
	static public int getIDColumn(IDocumentLine model)
	{
		int id = model.get_ID();
			
		if( model instanceof MMatchPO)
		{
			id = ((MMatchPO) model).getC_OrderLine_ID();			
		}
		if( model instanceof MMatchInv)
		{
			id = ((MMatchInv) model).getC_InvoiceLine_ID();
		}
		return id ;
	}
}
