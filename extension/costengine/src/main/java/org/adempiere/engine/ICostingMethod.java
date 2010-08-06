/**
 * 
 */
package org.adempiere.engine;

import java.math.BigDecimal;

import org.compiere.model.MAcctSchema;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MTransaction;

/**
 * @author anca_bradau
 *
 */
public interface ICostingMethod
{
	public void setCostingMethod(MAcctSchema as,MTransaction mtrx,
			MCost cost, BigDecimal price, Boolean isSOTrx);
	public void process();
	public void processCostDetail(MCostDetail m_costdetail);//for reversal documents
}
