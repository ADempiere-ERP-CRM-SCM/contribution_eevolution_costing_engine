/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.List;

import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MTransaction;
import org.compiere.util.Env;
import org.compiere.util.Util;

/**
 * @author anca_bradau
 * @author victor.perez@e-evolution.com, www.e-evolution.com
 * 
 */
public class AverageInvoiceCostingMethod extends AbstractCostingMethod implements ICostingMethod {
	
	public void setCostingMethod (MAcctSchema as, MTransaction mtrx, MCost cost,BigDecimal price,
			Boolean isSOTrx)
	{
		m_as = as;		
		m_trx  = mtrx;
		m_cost = cost;
		m_price = price;
		m_isSOTrx = isSOTrx;
		m_dimension = new CostDimension(m_trx.getAD_Client_ID(), m_trx.getAD_Org_ID(), m_trx.getM_Product_ID(), m_trx.getM_AttributeSetInstance_ID(), m_cost.getM_CostType_ID(), m_as.getC_AcctSchema_ID(), m_cost.getM_CostElement_ID());
		m_model = mtrx.getDocumentLine();
		m_costdetail = MCostDetail.getByTransaction(m_trx, m_dimension);
		m_last_costdetail = MCostDetail.getLastEntry(m_trx, m_dimension);
	}
	

	public void calculate()
	{	
		if(m_model.getReversalLine_ID() > 0)
			return;

		if(m_last_costdetail == null)
		{
			m_last_costdetail = new MCostDetail(m_trx.getCtx(), m_dimension, Env.ZERO , Env.ZERO, m_trx.get_TrxName());
		}
		
		if(m_trx.getMovementType().endsWith("-"))
		{	
			m_CurrentCostPrice = m_last_costdetail.getNewCurrentCostPrice(m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_Amount = m_trx.getMovementQty().multiply(m_CurrentCostPrice);
			m_CumulatedQty = m_last_costdetail.getNewCumulatedQty().add(m_trx.getMovementQty());
			m_CumulatedAmt = m_last_costdetail.getNewCumulatedAmt().add(m_Amount);
			return;
		}	
		
		if(m_costdetail != null)
		{
			m_Amount = m_trx.getMovementQty().multiply(m_price);	
			m_CumulatedQty = m_costdetail.getCumulatedQty().add(m_trx.getMovementQty());
			m_CumulatedAmt = m_costdetail.getCumulatedAmt().add(m_Amount);
			m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_AdjustCost = m_CurrentCostPrice.multiply(m_costdetail.getNewCumulatedQty()).subtract(m_costdetail.getNewCumulatedAmt());
			return;
		}
	    if (m_price == null) //m_price is null at physical inventory
	    	m_price = m_last_costdetail.getNewCurrentCostPrice(m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
		m_Amount = m_trx.getMovementQty().multiply(m_price);	
		m_CumulatedQty = m_last_costdetail.getNewCumulatedQty().add(m_trx.getMovementQty());
		m_CumulatedAmt = m_last_costdetail.getNewCumulatedAmt().add(m_Amount);
		m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
	}
	
	private void createCostDetail()
	{
		if(m_model.getReversalLine_ID() > 0)
		{	
			createReveralCostDetail(m_model);
			return;
		}
					
		if(m_costdetail == null)
		{				
			m_costdetail = new MCostDetail(m_trx.getCtx(), m_dimension, m_CurrentCostPrice.multiply(m_trx.getMovementQty()) , m_trx.getMovementQty(), m_trx.get_TrxName());
			m_costdetail.setDateAcct(m_model.getDateAcct());
		}		
		else
		{
			if(m_AdjustCost.signum() != 0)
			{
				m_costdetail.setCostAdjustmentDate(m_model.getDateAcct());
				m_costdetail.setCostAdjustment(m_AdjustCost);
				m_costdetail.setProcessed(false);
				m_costdetail.setDescription("Adjust Cost:"+ m_AdjustCost);
			}
			else
			{	
				m_costdetail.setCumulatedAmt(m_last_costdetail.getNewCumulatedAmt());	
				m_costdetail.setCumulatedQty(m_last_costdetail.getNewCumulatedQty());
				m_costdetail.setCurrentCostPrice(m_last_costdetail.getNewCurrentCostPrice(m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP));				
				m_costdetail.setAmt(m_CurrentCostPrice.multiply(m_trx.getMovementQty()));
			}	
			
			m_costdetail.saveEx();
			return;
		}
		
		if (m_isSOTrx != null)
			m_costdetail.setIsSOTrx(m_isSOTrx);
		else
			m_costdetail.setIsSOTrx(m_model.isSOTrx());	
		
		m_costdetail.setCumulatedQty(m_last_costdetail.getNewCumulatedQty());
		m_costdetail.setCumulatedAmt(m_last_costdetail.getNewCumulatedAmt());	
		m_costdetail.setCurrentCostPrice(m_last_costdetail.getNewCurrentCostPrice(m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP));
		
		StringBuilder description = new StringBuilder();
		if (!Util.isEmpty(m_model.getDescription(), true))
			description.append(m_model.getDescription());
		if (m_isSOTrx != null)
		{
			description.append(m_isSOTrx ? "(|->)" : "(|<-)");
		}
		if (m_trx != null)
		   m_costdetail.setM_Transaction_ID(m_trx.getM_Transaction_ID());
		m_costdetail.setDescription(description.toString());
		m_costdetail.saveEx();
		return;
	}

	public MCostDetail process() {

		calculate();
		createCostDetail();		
		updateInventoryValue();
		createCostAdjutment();
		return m_costdetail;
	}
	
	public void createCostAdjutment()
	{
		List<MCostDetail> cds = MCostDetail.getAfterCostAdjustmentDate(m_costdetail);
			
		if(m_as.isAdjustCOGS() && m_costdetail.getCostAdjustmentDate()!= null)	
		{
			for(MCostDetail cd : cds)
			{
				MTransaction trx = new MTransaction(m_model.getCtx(), cd.getM_Transaction_ID(), m_model.get_TrxName());
				CostEngineFactory.getCostEngine(m_model.getAD_Client_ID()).createCostDetail(trx);
			}
		}
		else
		{
			for(MCostDetail cd : cds)
			{
				cd.setProcessed(false);
				cd.saveEx();
			}
		}
	}	

	@Override
	public void processCostDetail(MCostDetail mCostdetail) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected List<CostComponent> getCalculatedCosts() {
		// TODO Auto-generated method stub
		return null;
	}
}
