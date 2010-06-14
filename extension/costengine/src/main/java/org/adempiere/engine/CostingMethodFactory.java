/**
 * 
 */
package org.adempiere.engine;

import java.util.HashMap;
import java.util.Map;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.I_M_CostElement;
import org.compiere.model.X_M_CostElement;

/**
 * @author teo_sarca
 *
 */
public class CostingMethodFactory
{
	private static final CostingMethodFactory s_instance = new CostingMethodFactory();
	
	public static CostingMethodFactory get()
	{
		return s_instance;
	}
	
	private static final Map<String, Class<? extends ICostingMethod>>
	s_map = new HashMap<String, Class<? extends ICostingMethod>>();
	static
	{
		s_map.put(X_M_CostElement.COSTINGMETHOD_Fifo, FifoLifoCostingMethod.class);
		s_map.put(X_M_CostElement.COSTINGMETHOD_Lifo, FifoLifoCostingMethod.class);
		s_map.put(X_M_CostElement.COSTINGMETHOD_AverageInvoice, AverageInvoiceCostingMethod.class);
	}
	
	private CostingMethodFactory()
	{
	}
	
	public ICostingMethod getCostingMethod(I_M_CostElement ce)
	{
		String costingMethod = ce.getCostingMethod();
		Class<? extends ICostingMethod> cl = s_map.get(costingMethod);
		if (cl == null)
		{
			throw new AdempiereException("No implementation found for costing method "+costingMethod);
		}
		ICostingMethod cm;
		try
		{
			cm = cl.newInstance();
		}
		catch (Exception e)
		{
			throw new AdempiereException(e);
		}
		return cm;
	}
}
