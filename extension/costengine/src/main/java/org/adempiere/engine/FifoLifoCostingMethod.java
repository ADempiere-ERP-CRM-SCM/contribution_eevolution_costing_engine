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
import org.compiere.model.MCostQueue;
import org.compiere.model.MProduct;
import org.compiere.model.MTransaction;
import org.compiere.model.ProductCost;
import org.compiere.util.Env;

/**
 * @author teo_sarca
 * @author anca_bradau
 */
public class FifoLifoCostingMethod extends AbstractCostingMethod
{
	

	MAcctSchema m_as;
	IDocumentLine m_model;
	MTransaction m_trx; 
	MCost m_cost;
	Boolean m_isSOTrx;
	CostComponent m_CurrentCost;
	CostComponent ccs;
	MCostDetail m_costdetail;
	
	public void setCostingMethod (MAcctSchema as,IDocumentLine model,MTransaction mtrx, MCost cost, Boolean isSOTrx)
	{
		m_as = as;
		m_model = model;
		m_trx  = mtrx;
		m_cost = cost;
		m_isSOTrx = isSOTrx;
	}
	
	public void calculate()
	{
		ProductCost pc = new ProductCost (m_model.getCtx(), 
				m_model.getM_Product_ID(), m_model.getM_AttributeSetInstance_ID(),
				m_model.get_TrxName());
		pc.setQty(m_trx.getMovementQty());
		//
		
		List<CostComponent> ccs = pc.getProductCostsLayers(m_cost, 0, false);
		if (ccs == null || ccs.size() == 0)
		{
			MProduct product = MProduct.get(Env.getCtx(), m_model.getM_Product_ID());
			throw new AdempiereException("No Costs for " + product.getName());
		}
		m_calculatedCosts = ccs;
	}
	
	protected List<CostComponent> getCalculatedCosts()
	{
		if (m_calculatedCosts == null)
			calculate();
		return m_calculatedCosts;
	}
	private List<CostComponent> m_calculatedCosts = null;

	
	public void updateCurrentCost()
	{
		MCostQueue[] cQueue = MCostQueue.getQueue(m_cost, m_model.getDateAcct(), m_model.get_TrxName());
		//TODO: need evaluate this!
		if (cQueue != null)
		{
			if (cQueue.length >0 && m_cost.getCostElement().isFifo())
	           m_cost.setCurrentCostPrice(cQueue[0].getCurrentCostPrice());
		    else if (cQueue.length > 1 && m_cost.getCostElement().isLandedCost())
			  m_cost.setCurrentCostPrice(cQueue[1].getCurrentCostPrice());
		}	
		m_cost.setCurrentQty(m_cost.getCurrentQty().add(m_model.getMovementQty()));
		// teo_sarca: Cumulate Amt & Qty
		if (cQueue != null && cQueue.length > 0)
		{
			BigDecimal cAmt = cQueue[0].getCurrentCostPrice().multiply(m_model.getMovementQty());
			m_cost.setCumulatedAmt(m_cost.getCumulatedAmt().add(cAmt));
			m_cost.setCumulatedQty(m_cost.getCumulatedQty().add(m_model.getMovementQty()));
		}
		log.finer("QtyAdjust - FiFo/Lifo - " + m_cost);		
		m_cost.saveEx();
	}

	public void process()
	{
	    processCostDetail();
		updateCurrentCost();
	}
	
	public void processCostDetail()
	{
		for (MCostDetail m_costdetail : createCostDetails(m_cost, m_model, m_trx, false))
		{
			boolean addition = m_costdetail.getQty().signum() > 0;
			MAcctSchema as =  MAcctSchema.get(m_model.getCtx(), m_costdetail.getC_AcctSchema_ID());
			int precision = as.getCostingPrecision();
			MProduct product = MProduct.get(m_model.getCtx(), m_costdetail.getM_Product_ID());
			BigDecimal price = m_costdetail.getAmt();

			if (m_costdetail.getQty().signum() != 0)
				price = m_costdetail.getAmt().divide(m_costdetail.getQty(), precision, BigDecimal.ROUND_HALF_UP);

			int AD_Org_ID = m_costdetail.getAD_Org_ID();
			int M_ASI_ID = m_costdetail.getM_AttributeSetInstance_ID();

			if (m_costdetail.getC_OrderLine_ID() != 0)
			{
				log.finer("Inv - FiFo/LiFo - amt=" + m_costdetail.getAmt() + ", qty=" + m_costdetail.getQty() + " [NOTHING TO DO]");	
			}

			else if (m_costdetail.getM_InOutLine_ID() != 0 		//	AR Shipment Detail Record  
					|| m_costdetail.getM_MovementLine_ID() != 0 
					|| m_costdetail.getM_InventoryLine_ID() != 0
					|| m_costdetail.getM_ProductionLine_ID() != 0
					|| m_costdetail.getC_ProjectIssue_ID() != 0
					|| m_costdetail.getPP_Cost_Collector_ID() != 0
					|| m_costdetail.getC_LandedCostAllocation_ID()!=0)
			{
				if (addition)
				{
					//	Real ASI - costing level Org
					// teo_sarca: modified
					MCostQueue.add(product, M_ASI_ID,
							as, AD_Org_ID, m_costdetail.getM_CostElement_ID(),
							m_costdetail.getAmt(), m_costdetail.getQty(), precision,
							(MCostDetail) m_costdetail, m_model.get_TrxName());
					//					MCostQueue cq = MCostQueue.get(product, getM_AttributeSetInstance_ID(), 
					//						as, Org_ID, ce.getM_CostElement_ID(), get_TrxName());
					//					cq.setCosts(amt, qty, precision);
					//					cq.save();
				}
				else
				{
					//	Adjust Queue - costing level Org/ASI
					BigDecimal amtQueue = MCostQueue.adjustQty(m_cost,
							m_costdetail.getQty().negate(), m_costdetail.getDateAcct(), m_model.get_TrxName());
					amtQueue = amtQueue.negate(); // outgoing amt should be negative
					if (m_costdetail.getAmt().compareTo(amtQueue) != 0)
					{
						BigDecimal priceQueue = Env.ZERO;
						if (m_costdetail.getQty().signum() != 0)
							priceQueue = amtQueue.divide(m_costdetail.getQty(), precision, BigDecimal.ROUND_HALF_UP);
						log.warning("Amt not match "+this+": price="+price+", priceQueue="+priceQueue+" [ADJUSTED]");
						// FIXME: teo_sarca: should not happen
						if ("Y".equals(Env.getContext(m_model.getCtx(), "#M_CostDetail_CorrectAmt")))
						{
							m_costdetail.setAmt(amtQueue);
							m_costdetail.setAmt(amtQueue);
							m_costdetail.setPrice(priceQueue);
						}
						else
						{
							throw new AdempiereException("Amt not match "+this+": price="+price+", priceQueue="+priceQueue); 
						}
					}
					/** TEO: END ----------------------------------------------------------------------------- */
				}
			}
		}
	}
}


		
