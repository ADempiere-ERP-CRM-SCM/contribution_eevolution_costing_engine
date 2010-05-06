/**
 * 
 */
package org.adempiere.exceptions;

import java.math.BigDecimal;

import org.compiere.model.MProduct;
import org.compiere.util.Env;


/**
 * Throwed when the cost can't be calculated at this time
 * @author Teo Sarca, SC ARHIPAC SERVICE SRL
 *
 */
public class CostInsufficientQtyException extends AdempiereException
{
	private static final long serialVersionUID = 1L;
	
//	private int m_product_id;
//	private int m_asi_id;
//	private BigDecimal m_qty;
//	private BigDecimal m_remainingQty;
	
	/**
	 * @param message
	 */
	public CostInsufficientQtyException(int product_id, int asi_id,
			BigDecimal qty, BigDecimal remainingQty)
	{
		super(createMessage(product_id, asi_id, qty, remainingQty));
//		this.m_product_id = product_id;
//		this.m_asi_id = asi_id;
//		this.m_qty = qty;
//		this.m_remainingQty = remainingQty;
	}
	
	private static String createMessage(int product_id, int asi_id, BigDecimal qty, BigDecimal remainingQty)
	{
		MProduct product = MProduct.get(Env.getCtx(), product_id);
		String productValue =	product != null ? product.getValue() : "?";
		String productName =	product != null ? product.getName() : "?";
		//
		return "@M_Product_ID@ : " + productValue + " - " + productName
				+", @Qty@ : " + qty
				+", @RemainingQty@ : "+remainingQty
				+" (ASI:"+asi_id+")"
		;
	}

}
