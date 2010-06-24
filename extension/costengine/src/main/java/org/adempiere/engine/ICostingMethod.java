/**
 * 
 */
package org.adempiere.engine;

import java.util.Properties;

import org.compiere.model.I_M_CostDetail;

/**
 * @author ancu
 *
 */
public interface ICostingMethod
{
	public void process(Properties ctx, I_M_CostDetail cd, String trxName);
}
