/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.List;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MProduct;
import org.compiere.model.MTransaction;
import org.compiere.util.Env;
import org.compiere.util.Util;

/**
 * @author anca_bradau
 * @author victor.perez@e-evolution.com, www.e-evolution.com
 * 
 */
public class StandardCostingMethod extends AbstractCostingMethod implements ICostingMethod {
	
	public void setCostingMethod (MAcctSchema as,MTransaction mtrx, MCost dimension,
			BigDecimal costThisLevel, BigDecimal costLowLevel, Boolean isSOTrx)
	{
		m_as = as;
		m_trx  = mtrx;
		m_dimension = dimension;
		m_costThisLevel = (costThisLevel == null ? Env.ZERO : costThisLevel);
		m_costLowLevel = (costLowLevel == null ? Env.ZERO : costLowLevel);
		m_isSOTrx = isSOTrx;
		m_model = mtrx.getDocumentLine();
		costingLevel = MProduct.get(mtrx.getCtx(), mtrx.getM_Product_ID()).getCostingLevel(as, mtrx.getAD_Org_ID());
		m_costdetail = MCostDetail.getByTransaction(mtrx,  m_as.getC_AcctSchema_ID() ,m_dimension.getM_CostType_ID(), m_dimension.getM_CostElement_ID(), costingLevel);
	}

	private void calculate()
	{	
		if(m_model.getReversalLine_ID() > 0)
			return;
		
		if(m_trx.getMovementType().endsWith("-"))
		{	
			m_CurrentCostPrice = m_dimension.getCurrentCostPrice();
			m_CurrentCostPriceLL = m_dimension.getCurrentCostPriceLL();
			m_Amount = m_model.getMovementQty().multiply(m_CurrentCostPrice);
			m_AmountLL = m_model.getMovementQty().multiply(m_CurrentCostPriceLL);
			m_CumulatedQty = m_dimension.getCumulatedQty().add(m_trx.getMovementQty());
			m_CumulatedAmt = m_dimension.getCumulatedAmt().add(m_Amount);
			m_CumulatedAmtLL = m_dimension.getCumulatedAmtLL().add(m_AmountLL);
			return;
		}	
		
		if(m_costdetail != null)
		{
			m_Amount = m_trx.getMovementQty().multiply(m_costdetail.getCurrentCostPrice());
			m_AmountLL = m_trx.getMovementQty().multiply(m_costdetail.getCurrentCostPriceLL());
			m_CumulatedQty = m_costdetail.getCumulatedQty().add(m_trx.getMovementQty());
			m_CumulatedAmt = m_costdetail.getCumulatedAmt().add(m_Amount);
			m_CumulatedAmtLL = m_costdetail.getCumulatedAmtLL().add(m_AmountLL);
			m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_CurrentCostPriceLL = m_CumulatedAmtLL.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
			m_AdjustCost = m_CurrentCostPrice.multiply(m_dimension.getCumulatedQty()).subtract(m_dimension.getCumulatedAmt());
			m_AdjustCost = m_CurrentCostPriceLL.multiply(m_dimension.getCumulatedQty()).subtract(m_dimension.getCumulatedAmtLL());
			return;
		}
		
		m_Amount = m_trx.getMovementQty().multiply(m_dimension.getCurrentCostPrice());
		m_AmountLL = m_trx.getMovementQty().multiply(m_dimension.getCurrentCostPriceLL());
		m_CumulatedAmt = m_dimension.getCumulatedAmt().add(m_Amount).add(m_AdjustCost);
		m_CumulatedAmtLL = m_dimension.getCumulatedAmtLL().add(m_AmountLL).add(m_AdjustCostLL);
		m_CumulatedQty = m_dimension.getCumulatedQty().add( m_trx.getMovementQty());
		m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
		m_CurrentCostPriceLL = m_CumulatedAmtLL.divide(m_CumulatedQty, m_as.getCostingPrecision(), BigDecimal.ROUND_HALF_UP);
	}
	
	
	private void createCostDetail()
	{
		final String idColumnName = CostEngine.getIDColumnName(m_model);
		if(m_model.getReversalLine_ID() > 0)
		{	
			createReversalCostDetail();
			return;
		}
		
		if(m_costdetail == null)
		{	
			m_costdetail = new MCostDetail(m_trx,  m_as.getC_AcctSchema_ID() ,m_dimension.getM_CostType_ID(), m_dimension.getM_CostElement_ID(), m_CurrentCostPrice.multiply(m_trx.getMovementQty()) , m_CurrentCostPriceLL.multiply(m_trx.getMovementQty()), m_trx.getMovementQty(), m_trx.get_TrxName());
			m_costdetail.setDateAcct(m_model.getDateAcct());
			m_costdetail.set_ValueOfColumn(idColumnName,CostEngine.getIDColumn(m_model));
		}		
		else
		{
			if(!m_AdjustCost.equals(Env.ZERO))
			{
				m_costdetail.setCostAdjustment(m_AdjustCost);
				m_costdetail.setProcessed(false);
				m_costdetail.setDescription("Adjust Cost");
				
			}
			if(!m_AdjustCostLL.equals(Env.ZERO))
			{
				m_costdetail.setCostAdjustmentLL(m_AdjustCostLL);
				m_costdetail.setProcessed(false);
				m_costdetail.setDescription("Adjust Cost LL");
				
			}
			m_costdetail.set_ValueOfColumn(idColumnName,CostEngine.getIDColumn(m_model));
			m_costdetail.saveEx();
			return;
		}
		
		if (!m_costdetail.set_ValueOfColumnReturningBoolean(idColumnName, m_model.get_ID()))
			throw new AdempiereException("Cannot set "+idColumnName);
		
		if (m_isSOTrx != null)
			m_costdetail.setIsSOTrx(m_isSOTrx);
		else
			m_costdetail.setIsSOTrx(m_model.isSOTrx());	
		
		m_costdetail.setCumulatedQty(m_dimension.getCumulatedQty());
		m_costdetail.setCumulatedAmt(m_dimension.getCumulatedAmt());	
		m_costdetail.setCurrentCostPrice(m_dimension.getCurrentCostPrice());
		m_costdetail.setCumulatedAmtLL(m_dimension.getCumulatedAmtLL());	
		m_costdetail.setCurrentCostPriceLL(m_dimension.getCurrentCostPriceLL());
		StringBuilder description = new StringBuilder();
		if (!Util.isEmpty(m_model.getDescription(), true))
			description.append(m_model.getDescription());
		if (m_isSOTrx != null)
		{
			description.append(m_isSOTrx ? "(|->)" : "(|<-)");
		}
		if(m_trx != null)
			m_costdetail.setM_Transaction_ID(m_trx.getM_Transaction_ID());
		m_costdetail.setDescription(description.toString());
		m_costdetail.saveEx();
		return;
	}
	
	public void createCostAdjutment()
	{
	}	

	public MCostDetail process() {
		calculate();
		createCostDetail();		
		updateInventoryValue();
		createCostAdjutment();
		return m_costdetail;
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

	@Override
	public BigDecimal getNewCurrentCostPrice(MCostDetail cd, int scale,
			int roundingMode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getNewCumulatedAmt(MCostDetail cd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getNewCurrentCostPriceLL(MCostDetail cd, int scale,
			int roundingMode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getNewCumulatedAmtLL(MCostDetail cd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getNewCumulatedQty(MCostDetail cd) {
		// TODO Auto-generated method stub
		return null;
	}

}
