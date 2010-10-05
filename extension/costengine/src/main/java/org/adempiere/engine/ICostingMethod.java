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
			MCost dimension, BigDecimal costThisLevel, BigDecimal costLowLevel, Boolean isSOTrx);
	public MCostDetail process();
	public void processCostDetail(MCostDetail m_costdetail);//for reversal documents
}
