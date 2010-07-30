/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;
import java.util.List;
import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.I_M_CostDetail;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MCostQueue;
import org.compiere.model.MProduct;
import org.compiere.model.MTransaction;
import org.compiere.model.ProductCost;
import org.compiere.model.Query;
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
	Boolean m_setProcessed;
	BigDecimal m_CumulatedAmt;
	BigDecimal m_CumulatedQty;
	BigDecimal m_CurrentCostPrice;
	BigDecimal m_Amount;
	BigDecimal m_AdjustCost = Env.ZERO;

	public void setCostingMethod (MAcctSchema as,IDocumentLine model,MTransaction mtrx, MCost cost,
			Boolean isSOTrx, Boolean setProcessed)
	{
		m_as = as;
		m_model = model;
		m_trx  = mtrx;
		m_cost = cost;
		m_isSOTrx = isSOTrx;
		m_setProcessed = setProcessed;
		m_costdetail = getCostDetail();
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


	public void updateCurrentCost(MCostDetail m_costdetail)
	{
		MCostQueue[] cQueue = MCostQueue.getQueue(m_cost, m_costdetail.getDateAcct(), m_costdetail.get_TrxName());
		//TODO: need evaluate this!
		if (cQueue != null)
		{
			if (cQueue.length >0 && m_cost.getCostElement().isFifo())
				m_cost.setCurrentCostPrice(cQueue[0].getCurrentCostPrice());
			else if (cQueue.length > 0 && m_cost.getCostElement().isLandedCost())
				m_cost.setCurrentCostPrice(cQueue[0].getCurrentCostPrice());
		}	
		m_cost.setCurrentQty(m_cost.getCurrentQty().add(m_costdetail.getQty()));

		if (cQueue != null && cQueue.length > 0)
		{
			BigDecimal cAmt = cQueue[0].getCurrentCostPrice().multiply(m_costdetail.getQty());
			m_cost.setCumulatedAmt(m_cost.getCumulatedAmt().add(cAmt));
			m_cost.setCumulatedQty(m_cost.getCumulatedQty().add(m_costdetail.getQty()));
		}
		log.finer("QtyAdjust - FiFo/Lifo - " + m_cost);		
		m_cost.saveEx();
	}

	public void process()
	{
		processCostDetail();
	}

	public void processCostDetail()
	{
		if(m_costdetail == null)
		{
			for (MCostDetail m_costdetail : createCostDetails(m_cost, m_model, m_trx, m_setProcessed))
			{
				if (m_setProcessed)
					continue;
				processCostDetail(m_costdetail);	
			}
		}
		else 
		{
			m_Amount = m_model.getMovementQty().multiply(m_model.getPriceActual());	
			m_AdjustCost = m_Amount.subtract(m_costdetail.getAmt());
			m_CumulatedAmt = m_costdetail.getCumulatedAmt().add(m_Amount).add(m_AdjustCost);
			m_CumulatedQty = m_cost.getCumulatedQty();
			m_CurrentCostPrice = m_CumulatedAmt.divide(m_CumulatedQty, m_as.getCostingPrecision());

			if (m_AdjustCost.compareTo(Env.ZERO) != 0 )
			{
				m_costdetail.setCostAdjustment(m_AdjustCost);
				m_costdetail.setProcessed(false);
				m_costdetail.setDescription("Adjust Cost");
				m_costdetail.saveEx();
				return;
			}
			return;
		}
	}

	//	need this for reversal documents
	public void processCostDetail(MCostDetail m_costdetail)
	{
		
		boolean addition = m_costdetail.getQty().signum() > 0;
		MAcctSchema as =  MAcctSchema.get(m_costdetail.getCtx(), m_costdetail.getC_AcctSchema_ID());
		int precision = as.getCostingPrecision();
		MProduct product = MProduct.get(m_costdetail.getCtx(), m_costdetail.getM_Product_ID());
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
				MCostQueue.add(product, M_ASI_ID,
						as, AD_Org_ID, m_costdetail.getM_CostElement_ID(),
						m_costdetail.getAmt(), m_costdetail.getQty(), precision,
						(MCostDetail) m_costdetail, m_costdetail.get_TrxName());
			}
			else
			{
				BigDecimal amtQueue = MCostQueue.adjustQty(m_cost,
						m_costdetail.getQty().negate(), m_costdetail.getDateAcct(), m_costdetail.get_TrxName());
				amtQueue = amtQueue.negate(); // outgoing amt should be negative
				if (m_costdetail.getAmt().compareTo(amtQueue) != 0)
				{
					BigDecimal priceQueue = Env.ZERO;
					if (m_costdetail.getQty().signum() != 0)
						priceQueue = amtQueue.divide(m_costdetail.getQty(), precision, BigDecimal.ROUND_HALF_UP);
					log.warning("Amt not match "+this+": price="+price+", priceQueue="+priceQueue+" [ADJUSTED]");
					// FIXME: teo_sarca: should not happen
					if ("Y".equals(Env.getContext(m_costdetail.getCtx(), "#M_CostDetail_CorrectAmt")))
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
			}
			m_costdetail.setCumulatedQty(m_cost.getCumulatedQty());
			m_costdetail.setCumulatedAmt(m_cost.getCumulatedQty());	
			m_costdetail.setCurrentCostPrice(m_cost.getCurrentCostPrice());
			updateCurrentCost(m_costdetail);
			m_costdetail.saveEx();
		}
	}
	private MCostDetail getCostDetail()
	{
	
		final String whereClause = MCostDetail.COLUMNNAME_M_Transaction_ID + "=? AND "
								 + MCostDetail.COLUMNNAME_CostingMethod+ "=? AND "
								 + MCostDetail.COLUMNNAME_M_CostElement_ID+ "=?";
		return new Query (m_model.getCtx(), I_M_CostDetail.Table_Name, whereClause , m_model.get_TrxName())
		.setParameters(m_trx.getM_Transaction_ID(),m_cost.getCostingMethod(), m_cost.getM_CostElement_ID())
		.setClient_ID()
		.firstOnly();
	}
}


		
