/**
 * 
 */
package org.adempiere.engine;

import java.util.ArrayList;
import java.util.List;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MCost;
import org.compiere.model.MCostDetail;
import org.compiere.model.MInventoryLine;
import org.compiere.model.MMovementLine;
import org.compiere.model.MTransaction;
import org.compiere.util.CLogger;
import org.compiere.util.Util;


/**
 * @author ancu
 *
 */
public abstract class AbstractCostingMethod implements ICostingMethod
{
	protected final CLogger log = CLogger.getCLogger (getClass());


	protected List<MCostDetail> createCostDetails(MCost cost, IDocumentLine model,
			MTransaction mtrx, boolean setProcessed)
	{ 
		final String idColumnName = model.get_TableName()+"_ID";
		List<MCostDetail> list = new ArrayList<MCostDetail>();
		if (model.isSOTrx()== true || model instanceof MInventoryLine || model instanceof MMovementLine)
		{
			List<CostComponent> ccs = getCalculatedCosts();
			for (CostComponent cc : ccs)
			{
				MCostDetail cd = new MCostDetail(cost, model.getAD_Org_ID(), cc.getAmount(), cc.getQty());
				if (!cd.set_ValueOfColumnReturningBoolean(idColumnName, model.get_ID()))
					throw new AdempiereException("Cannot set "+idColumnName);

				StringBuilder description = new StringBuilder();
				if (!Util.isEmpty(model.getDescription(), true))
					description.append(model.getDescription());
				if (model.isSOTrx() != false)
				{
					description.append(model.isSOTrx() ? "(|->)" : "(|<-)");
				}
				if (model.isSOTrx()!= false) //TODO: need evaluate anca
					cd.setIsSOTrx(model.isSOTrx());
				else
					cd.setIsSOTrx(model.isSOTrx());	
				cd.setM_Transaction_ID(mtrx.get_ID());
				cd.setDescription(description.toString());
				if (setProcessed)
					cd.setProcessed(true);
				cd.saveEx();
				list.add(cd);
			}
		}
		else //qty and amt is take from documentline
		{
			MCostDetail cd = new MCostDetail(cost, model.getAD_Org_ID(),
					model.getPriceActual().multiply(model.getMovementQty()), model.getMovementQty());
			if (!cd.set_ValueOfColumnReturningBoolean(idColumnName, model.get_ID()))
				throw new AdempiereException("Cannot set "+idColumnName);
			if (model.isSOTrx()!= false)
				cd.setIsSOTrx(model.isSOTrx());
			else
				cd.setIsSOTrx(model.isSOTrx());	
			cd.setM_Transaction_ID(model.get_ID());
			if (setProcessed)
				cd.setProcessed(true);
			cd.saveEx();
			list.add(cd);
		}
		return list;
	}
	
	protected abstract List<CostComponent> getCalculatedCosts();
}