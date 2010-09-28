/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.I_C_OrderLine;
import org.compiere.model.I_M_InOutLine;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MInventoryLine;
import org.compiere.model.MMatchInv;
import org.compiere.model.MMatchPO;
import org.compiere.model.MMovementLine;
import org.compiere.model.MTransaction;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Util;


/**
 * @author anca_bradau
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
	BigDecimal m_price;
	MCostDetail m_costdetail = null;
	BigDecimal m_CumulatedAmt = Env.ZERO;
	BigDecimal m_CumulatedQty = Env.ZERO;
	BigDecimal m_CurrentCostPrice = Env.ZERO;
	BigDecimal m_Amount= Env.ZERO;
	BigDecimal m_AdjustCost = Env.ZERO;
	MCostDetail m_last_costdetail = null;
	String costingLevel;

	protected List<MCostDetail> createCostDetails(MCost cost,
			MTransaction mtrx)
	{ 
		IDocumentLine model = mtrx.getDocumentLine();
		
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
				MCostDetail cd = new MCostDetail(m_trx, m_as.getC_AcctSchema_ID() ,m_cost.getM_CostType_ID(), m_cost.getM_CostElement_ID(), cc.getAmount(), cc.getQty(), m_model.get_TrxName());
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
				cd.saveEx();
				list.add(cd);
			}
		}
		else //qty and amt is take from documentline
		{
			MCostDetail cd = new MCostDetail(m_trx,  m_as.getC_AcctSchema_ID() ,m_cost.getM_CostType_ID(), m_cost.getM_CostElement_ID() , m_price.multiply(model.getMovementQty()),  model.getMovementQty(), m_model.get_TrxName());
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
			cd.saveEx();
			list.add(cd);
		}
		return list;
			}
	
	protected abstract List<CostComponent> getCalculatedCosts();
	
	/**
	 * Update the Inventory Value based in last transaction
	 */
	public void updateInventoryValue()
	{
		m_cost.setCurrentCostPrice(m_CurrentCostPrice);
		m_cost.setCumulatedAmt(m_CumulatedAmt);
		m_cost.setCumulatedQty(m_CumulatedQty);
		m_cost.setCurrentQty(m_CumulatedQty);
		m_cost.saveEx();
	}
	
	/**
	 * Create Reversal Transaction
	 */
	public MCostDetail createReversalCostDetail()
	{
			MTransaction original_trx = MTransaction.getByDocumentLine(m_trx);
			IDocumentLine model = m_trx.getDocumentLine();
			String idColumnName = model.get_TableName()+"_ID";
			
			MCostDetail original_cd = MCostDetail.getByTransaction(original_trx, m_as.getC_AcctSchema_ID() , m_cost.getM_CostType_ID(), m_cost.getM_CostElement_ID(), costingLevel); 
			m_costdetail = new MCostDetail(m_model.getCtx(), 0 , m_trx.get_TrxName());
			m_costdetail.copyValues(original_cd , m_costdetail);
			m_costdetail.setQty(original_cd.getQty().negate());
			m_costdetail.setAmt(original_cd.getAmt().negate());
			m_costdetail.setCostAmt(original_cd.getCostAmt().negate());
			m_costdetail.setCostAdjustment(original_cd.getCostAdjustment().negate());
			m_costdetail.setCostAdjustmentDate(original_cd.getCostAdjustmentDate());
			m_costdetail.setCumulatedQty(original_cd.getNewCumulatedQty());
			m_costdetail.setCumulatedAmt(original_cd.getNewCumulatedAmt());	
			m_costdetail.setCurrentCostPrice(original_cd.getNewCurrentCostPrice(m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP));	
			m_costdetail.setDateAcct(original_cd.getDateAcct());
			if (!m_costdetail.set_ValueOfColumnReturningBoolean(idColumnName, model.get_ID()))
				throw new AdempiereException("Cannot set "+idColumnName);
			m_costdetail.setM_Transaction_ID(m_trx.getM_Transaction_ID());
			m_costdetail.setDescription("Reversal" + original_cd.getM_Transaction_ID());
			m_costdetail.setIsReversal(true);
			m_costdetail.saveEx(m_trx.get_TrxName());
			
			//Update the original cost detail
			original_cd.setDescription("Reversal" + m_costdetail.getM_Transaction_ID());
			original_cd.setIsReversal(true);
			original_cd.saveEx(m_trx.get_TrxName());
			
			//Update the new cost detail
			m_CumulatedQty = m_costdetail.getNewCumulatedQty();
			m_CumulatedAmt = m_costdetail.getNewCumulatedAmt();
			m_CurrentCostPrice = m_costdetail.getNewCurrentCostPrice(m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			return m_costdetail;
	}
	
}
