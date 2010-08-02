/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.I_C_OrderLine;
import org.compiere.model.I_M_CostDetail;
import org.compiere.model.I_M_InOutLine;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MInventoryLine;
import org.compiere.model.MMatchInv;
import org.compiere.model.MMatchPO;
import org.compiere.model.MMovementLine;
import org.compiere.model.MTransaction;
import org.compiere.model.Query;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Util;


/**
 * @author ancu
 *
 */
public abstract class AbstractCostingMethod implements ICostingMethod
{
	protected final CLogger log = CLogger.getCLogger (getClass());

	MAcctSchema m_as;
	IDocumentLine m_model;
	MTransaction m_trx; 
	MCost m_cost;
	Boolean m_isSOTrx;
	MCostDetail m_costdetail = null;
	BigDecimal m_CumulatedAmt = Env.ZERO;
	BigDecimal m_CumulatedQty = Env.ZERO;
	BigDecimal m_CurrentCostPrice = Env.ZERO;
	BigDecimal m_Amount= Env.ZERO;
	BigDecimal m_AdjustCost = Env.ZERO;

	protected List<MCostDetail> createCostDetails(MCost cost, IDocumentLine model,
			MTransaction mtrx, boolean setProcessed)
	{ 
		final String idColumnName;
		if (model instanceof MMatchPO)
		{
			idColumnName = "C_OrderLine_ID";
		}
		else if (model instanceof MMatchInv)
		{
			idColumnName = "C_InvoiceLine_ID";
		}
		else
		{
			idColumnName = model.get_TableName()+"_ID";
		}


		List<MCostDetail> list = new ArrayList<MCostDetail>();
		if (model.isSOTrx()== true || model instanceof MInventoryLine || model instanceof MMovementLine)
		{
			List<CostComponent> ccs = getCalculatedCosts();
			for (CostComponent cc : ccs)
			{
				MCostDetail cd = new MCostDetail(cost, model.getAD_Org_ID(), cc.getAmount(), cc.getQty());
				if (!cd.set_ValueOfColumnReturningBoolean(idColumnName, model.get_ID()))
					throw new AdempiereException("Cannot set "+idColumnName);

				StringBuilder description = new StringBuilder();
				if (!Util.isEmpty(model.getDescription(), true))
					description.append(model.getDescription());
				if (model.isSOTrx() != false)
				{
					description.append(model.isSOTrx() ? "(|->)" : "(|<-)");
				}
				if (model.isSOTrx()!= false) //TODO: need evaluate anca
					cd.setIsSOTrx(model.isSOTrx());
				else
					cd.setIsSOTrx(model.isSOTrx());	
				cd.setM_Transaction_ID(mtrx.get_ID());
				cd.setDescription(description.toString());
				if (setProcessed)
					cd.setProcessed(true);
				cd.saveEx();
				list.add(cd);
			}
		}
		else //qty and amt is take from documentline
		{
			MCostDetail cd = new MCostDetail(cost, model.getAD_Org_ID(),
					model.getPriceActual().multiply(model.getMovementQty()), model.getMovementQty());
			int id;
			if (model instanceof MMatchPO)
			{
				
			    I_M_InOutLine iline = mtrx.getM_InOutLine();
			    I_C_OrderLine oline = iline.getC_OrderLine();
			    id = oline.getC_OrderLine_ID();
			    
			}
			else 
			{
				id = model.get_ID(); 
			}
			if (!cd.set_ValueOfColumnReturningBoolean(idColumnName, id))
				throw new AdempiereException("Cannot set "+idColumnName);
			if (model.isSOTrx()!= false)
				cd.setIsSOTrx(model.isSOTrx());
			else
				cd.setIsSOTrx(model.isSOTrx());	
			cd.setM_Transaction_ID(mtrx.get_ID());
			if (setProcessed)
				cd.setProcessed(true);
			cd.saveEx();
			list.add(cd);
		}
		return list;
			}
	
	protected abstract List<CostComponent> getCalculatedCosts();
	
	public MCostDetail getCostDetail()
	{
		final String whereClause = MCostDetail.COLUMNNAME_M_Transaction_ID + "=? AND "
								 + MCostDetail.COLUMNNAME_CostingMethod+ "=? AND "
								 + MCostDetail.COLUMNNAME_M_CostType_ID+ "=? AND "
								 + MCostDetail.COLUMNNAME_M_CostElement_ID+ "=?";
		return new Query (m_model.getCtx(), I_M_CostDetail.Table_Name, whereClause , m_model.get_TrxName())
		.setParameters(m_trx.getM_Transaction_ID(),m_cost.getCostingMethod(), m_cost.getM_CostType_ID(), m_cost.getM_CostElement_ID())
		.setClient_ID()
		.firstOnly();
	}
}
