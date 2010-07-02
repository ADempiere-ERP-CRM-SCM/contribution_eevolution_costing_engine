/**
 * 
 */
package org.adempiere.engine;

import java.util.List;
import java.util.Properties;

import org.compiere.model.I_M_CostDetail;
import org.compiere.model.I_M_Transaction;
import org.compiere.model.MAcctSchema;

/**
 * @author ancu
 *
 */
public interface ICostingMethod
{
	public void process(Properties ctx, I_M_CostDetail cd, String trxName);
	public List<CostComponent> getCostComponents(MAcctSchema as, IDocumentLine model, I_M_Transaction mtrx);
}
