/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MCostElement;
import org.compiere.model.MCostType;
import org.compiere.model.MProduct;
import org.compiere.model.MTransaction;
import org.compiere.util.Env;
import org.compiere.util.Util;

/**
 * @author victor.perez@e-evolution.com, www.e-evolution.com
 * 
 */
public class AverageInvoiceCostingMethod extends AbstractCostingMethod implements ICostingMethod {
	
	public void setCostingMethod (MAcctSchema as, MTransaction mtrx, MCost dimension,BigDecimal costThisLevel,
			BigDecimal costLowLevel, Boolean isSOTrx)
	{
		m_as = as;		
		m_trx  = mtrx;
		m_dimension = dimension;
		m_costThisLevel = (costThisLevel == null ? Env.ZERO : costThisLevel);
		m_costLowLevel = (costLowLevel == null ? Env.ZERO : costLowLevel);
		m_isSOTrx = isSOTrx;
		m_model = mtrx.getDocumentLine();
		costingLevel = MProduct.get(mtrx.getCtx(), mtrx.getM_Product_ID()).getCostingLevel(as, mtrx.getAD_Org_ID());
		m_costdetail = MCostDetail.getByTransaction(m_trx, m_as.getC_AcctSchema_ID() , m_dimension.getM_CostType_ID(), m_dimension.getM_CostElement_ID(), false);	
	}
	

	public void calculate()
	{	
		if(m_model.getReversalLine_ID() > 0)
			return;
		//find the last cost detail transaction
		m_last_costdetail =  MCostDetail.getLastTransaction(m_trx, m_as.getC_AcctSchema_ID(), m_dimension.getM_CostType_ID(), m_dimension.getM_CostElement_ID(),m_model.getDateAcct(), costingLevel);
		if(m_last_costdetail == null)
		{	//created a new cost detail 
			m_last_costdetail = new MCostDetail(m_trx , m_as.getC_AcctSchema_ID(), m_dimension.getM_CostType_ID(), m_dimension.getM_CostElement_ID() , Env.ZERO , Env.ZERO, Env.ZERO, m_trx.get_TrxName());
			m_last_costdetail.setDateAcct(new Timestamp(System.currentTimeMillis()));	
		}
		
		//Use the last current cost price for out transaction
		if(m_trx.getMovementType().endsWith("-"))
		{	
			m_CurrentCostPrice = getNewCurrentCostPrice(m_last_costdetail,m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_CurrentCostPriceLL = getNewCurrentCostPriceLL(m_last_costdetail,m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_Amount = m_trx.getMovementQty().multiply(m_CurrentCostPrice);
			m_AmountLL = m_trx.getMovementQty().multiply(m_CurrentCostPriceLL);
			m_CumulatedQty = getNewCumulatedQty(m_last_costdetail).add(m_trx.getMovementQty());
			m_CumulatedAmt = getNewCumulatedAmt(m_last_costdetail).add(m_Amount);
			m_CumulatedAmtLL = getNewCumulatedAmtLL(m_last_costdetail).add(m_AmountLL);
			return;
		}	
		//The cost detail was create before
		if(m_costdetail != null)
		{
		 	m_Amount = m_trx.getMovementQty().multiply(m_costThisLevel);
		 	m_AmountLL = m_trx.getMovementQty().multiply(m_costLowLevel);
			m_CumulatedQty = getNewCumulatedQty(m_last_costdetail).add(m_trx.getMovementQty());
			m_CumulatedAmt = getNewCumulatedAmt(m_last_costdetail).add(m_Amount);
			m_CumulatedAmtLL = getNewCumulatedAmtLL(m_last_costdetail).add(m_AmountLL);
			m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_CurrentCostPriceLL = m_CumulatedAmtLL.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_AdjustCost = m_costThisLevel.multiply(m_trx.getMovementQty()).subtract(m_costdetail.getCostAmt());
			m_AdjustCostLL = m_costLowLevel.multiply(m_trx.getMovementQty()).subtract(m_costdetail.getCostAmtLL());
			return;
		}
	    
		m_Amount = m_trx.getMovementQty().multiply(m_costThisLevel);	
		m_AmountLL = m_trx.getMovementQty().multiply(m_costLowLevel);	
		m_CumulatedQty = getNewCumulatedQty(m_last_costdetail).add(m_trx.getMovementQty());
		m_CumulatedAmt = getNewCumulatedAmt(m_last_costdetail).add(m_Amount);
		m_CumulatedAmtLL = getNewCumulatedAmtLL(m_last_costdetail).add(m_AmountLL);
		if(m_CumulatedAmt.signum() != 0)
			m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
		else
			m_CurrentCostPrice = Env.ZERO;
		if(m_CumulatedAmtLL.signum() != 0)
			m_CurrentCostPriceLL = m_CumulatedAmtLL.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
		else
			m_CurrentCostPriceLL = Env.ZERO;
	}
	
	private void createCostDetail()
	{
		if(m_model.getReversalLine_ID() > 0)
		{	
			createReversalCostDetail();
			return;
		}
					
		if(m_costdetail == null)
		{				
			m_costdetail = new MCostDetail(m_trx, m_as.getC_AcctSchema_ID() ,m_dimension.getM_CostType_ID(), m_dimension.getM_CostElement_ID(), m_CurrentCostPrice.multiply(m_trx.getMovementQty()) , m_CurrentCostPriceLL.multiply(m_trx.getMovementQty()), m_trx.getMovementQty(), m_trx.get_TrxName());
			m_costdetail.setDateAcct(m_model.getDateAcct());
		}		
		else
		{
			if(m_AdjustCost.signum() != 0)
			{
				m_costdetail.setCostAdjustmentDate(m_model.getDateAcct());
				m_costdetail.setCostAdjustment(m_costdetail.getCostAdjustment().add(m_AdjustCost));
				m_costdetail.setProcessed(false);
				m_costdetail.setAmt(m_costdetail.getCostAmt().add(m_costdetail.getCostAdjustment()));
				m_costdetail.setDescription(m_costdetail.getDescription() + " Adjust Cost:"+ m_AdjustCost);
			}
			else
			{	
				m_costdetail.setCumulatedAmt(getNewCumulatedAmt(m_last_costdetail));	
				m_costdetail.setCumulatedQty(getNewCumulatedQty(m_last_costdetail));
				m_costdetail.setCurrentCostPrice(getNewCurrentCostPrice(m_last_costdetail,m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP));				
				m_costdetail.setAmt(m_CurrentCostPrice.multiply(m_trx.getMovementQty()));
				if(m_trx.getMovementType().contains("-"))
					m_costdetail.setCostAmt(m_costdetail.getAmt());
			}
			if(m_AdjustCostLL.signum() != 0)
			{
				m_costdetail.setCostAdjustmentDateLL(m_model.getDateAcct());
				m_costdetail.setCostAdjustmentLL(m_costdetail.getCostAdjustmentLL().add(m_AdjustCostLL));
				m_costdetail.setProcessed(false);
				m_costdetail.setAmtLL(m_costdetail.getCostAmtLL().add(m_costdetail.getCostAdjustmentLL()));
				m_costdetail.setDescription(m_costdetail.getDescription() +" Adjust Cost LL:"+ m_AdjustCost);
			}
			else
			{	
				m_costdetail.setCumulatedAmtLL(getNewCumulatedAmtLL(m_last_costdetail));	
				m_costdetail.setCumulatedQty(getNewCumulatedQty(m_last_costdetail));
				m_costdetail.setCurrentCostPriceLL(getNewCurrentCostPriceLL(m_last_costdetail,m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP));				
				m_costdetail.setAmtLL(m_CurrentCostPriceLL.multiply(m_trx.getMovementQty()));
				if(m_trx.getMovementType().contains("-"))
					m_costdetail.setCostAmtLL(m_costdetail.getAmtLL());
			}
			m_costdetail.saveEx();
			return;
		}
		
		if (m_isSOTrx != null)
			m_costdetail.setIsSOTrx(m_isSOTrx);
		else
			m_costdetail.setIsSOTrx(m_model.isSOTrx());	
		
		if(m_trx.getMovementType().contains("+"))
		{	
			m_costdetail.setCostAmt(m_costThisLevel.multiply(m_trx.getMovementQty()));
			m_costdetail.setCostAmtLL(m_costLowLevel.multiply(m_trx.getMovementQty()));
		}	
		if(m_trx.getMovementType().contains("-"))
		{	
			m_costdetail.setCostAmt(m_costdetail.getAmt());
			m_costdetail.setCostAmtLL(m_costdetail.getAmtLL());
		}	

		m_costdetail.setCumulatedQty(getNewCumulatedQty(m_last_costdetail));
		m_costdetail.setCumulatedAmt(getNewCumulatedAmt(m_last_costdetail));
		m_costdetail.setCumulatedAmtLL(getNewCumulatedAmtLL(m_last_costdetail));
		m_costdetail.setCurrentCostPrice(getNewCurrentCostPrice(m_last_costdetail,m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP));
		m_costdetail.setCurrentCostPriceLL(getNewCurrentCostPriceLL(m_last_costdetail,m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP));
		m_costdetail.setCostAdjustment(Env.ZERO);
		m_costdetail.setCostAdjustmentLL(Env.ZERO);
		
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
		//void the cycle process
		if(m_costdetail.isProcessing())
			return;
		
		if(m_AdjustCost.signum() != 0 || MCostDetail.isEarlierTransaction(m_costdetail, m_as.getC_AcctSchema_ID() , m_dimension.getM_CostType_ID(), m_dimension.getM_CostElement_ID(), costingLevel))
		{	
		
			List<MCostDetail> cds = MCostDetail.getAfterDate(m_costdetail,costingLevel);
			
			if(cds == null || cds.size() == 0)
				return;
				
			if(m_as.isAdjustCOGS())	
			{
				for(MCostDetail cd : cds)
				{
					cd.setProcessing(true);
					cd.saveEx();
					MTransaction trx = new MTransaction(m_model.getCtx(), cd.getM_Transaction_ID(), m_model.get_TrxName());
					MCostType ct = (MCostType) cd.getM_CostType();
					MCostElement ce =(MCostElement) cd.getM_CostElement();
					CostEngineFactory.getCostEngine(m_model.getAD_Client_ID()).createCostDetail(m_as,trx,trx.getDocumentLine(),ct,ce);
					cd.setProcessing(false);
					cd.saveEx();
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


	/**
	 * Average Invoice 
	 * Get the New Current Cost Price This Level
	 * @param cd Cost Detail
	 * @param scale Scale
	 * @param roundingMode Rounding Mode
	 * @return New Current Cost Price This Level
	 */
	public BigDecimal getNewCurrentCostPrice(MCostDetail cd, int scale,
			int roundingMode) 
	{		
		if(getNewCumulatedQty(cd).signum() != 0)
			return getNewCumulatedAmt(cd).divide(getNewCumulatedQty(cd), scale , roundingMode);
		else return BigDecimal.ZERO;
	}


	/**
	 * Average Invoice 
	 * Get the New Cumulated Amt This Level
	 * @param cd Cost Detail
	 * @return  New Cumulated Amt This Level
	 */
	public BigDecimal getNewCumulatedAmt(MCostDetail cd) {
		return cd.getCumulatedAmt().add(cd.getCostAmt()).add(cd.getCostAdjustment());
	}


	/**
	 * Average Invoice 
	 * Get the New Current Cost Price low level
	 * @param cd Cost Detail
	 * @param scale Scale
	 * @param roundingMode Rounding Mode
	 * @return New Current Cost Price low level
	 */
	public BigDecimal getNewCurrentCostPriceLL(MCostDetail cd, int scale,
			int roundingMode) {
		if(getNewCumulatedQty(cd).signum() != 0)
			return getNewCumulatedAmtLL(cd).divide(getNewCumulatedQty(cd), scale , roundingMode);
		else return BigDecimal.ZERO;
	}


	/**
	 *  Average Invoice 
	 * Get the new Cumulated Amt Low Level
	 * @param cd MCostDetail
	 * @return New Cumulated Am Low Level
	 */
	public BigDecimal getNewCumulatedAmtLL(MCostDetail cd) {
		return cd.getCumulatedAmtLL().add(cd.getCostAmtLL()).add(cd.getCostAdjustmentLL());
	}


	/**
	 * Average Invoice 
	 * Get the new Cumulated Qty
	 * @param cd Cost Detail
	 * @return New Cumulated Qty
	 */
	public BigDecimal getNewCumulatedQty(MCostDetail cd) {
		return cd.getCumulatedQty().add(cd.getQty());
	}
}
