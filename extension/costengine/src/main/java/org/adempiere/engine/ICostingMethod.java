/**
 * 
 */
package org.adempiere.engine;

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
	public void setCostingMethod(MAcctSchema as,IDocumentLine model, MTransaction mtrx,
			MCost cost, Boolean isSOTrx, Boolean setProcessed);
	//need setProcessed at MMovement, if is samecostdimension dont touch queue
	public void process();
	public void processCostDetail(MCostDetail m_costdetail);//for reversal documents
}
