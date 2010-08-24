package org.adempiere.process;

import java.sql.Timestamp;
import java.util.List;

import org.adempiere.engine.CostDimension;
import org.adempiere.engine.CostEngineFactory;
import org.adempiere.engine.IDocumentLine;
import org.adempiere.exceptions.FillMandatoryException;
import org.compiere.model.MCostDetail;
import org.compiere.model.MPeriod;
import org.compiere.model.MTransaction;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;


/**
 *	Regenerate Cost Detail
 *	
 *	@author victor.perez@e-evolution.com, www.e-evolution.com
 */
public class RegenerateCostDetail extends SvrProcess
{
	
    /** Parameters **/
	private int p_M_Product_ID;
	private int p_M_CostElement_ID;
	private int p_M_CostType_ID;
	private int p_C_AcctSchema_ID;
	private Timestamp p_DateAcct;
	
	
	private List<MTransaction> m_trxs;
	/**
	 *  Prepare - e.g., get Parameters.
	 */
	protected void prepare()
	{
         ProcessInfoParameter[] parameters = getParameter();
         for(ProcessInfoParameter parameter: parameters)
         {
        	 String name = parameter.getParameterName();
 			if (parameter.getParameter() == null)
 				;
 			else if (name.equals(MCostDetail.COLUMNNAME_M_Product_ID))
 			{	
 				p_M_Product_ID = parameter.getParameterAsInt();
 				if(p_M_Product_ID == 0 )
 		    		throw new FillMandatoryException(MCostDetail.COLUMNNAME_M_Product_ID);
 			}	
 			else if (name.equals(MCostDetail.COLUMNNAME_M_CostElement_ID))
 			{	
 				p_M_CostElement_ID = parameter.getParameterAsInt();
 				if(p_M_CostElement_ID == 0 )
 		    		throw new FillMandatoryException(MCostDetail.COLUMNNAME_M_CostElement_ID);
 			}
 			else if (name.equals(MCostDetail.COLUMNNAME_C_AcctSchema_ID))
 			{	
 	 			p_C_AcctSchema_ID = parameter.getParameterAsInt();
 				if( p_C_AcctSchema_ID == 0 )
 		    		throw new FillMandatoryException(MCostDetail.COLUMNNAME_C_AcctSchema_ID);
 			}

 			else if (name.equals(MCostDetail.COLUMNNAME_M_CostType_ID))
 			{
 				p_M_CostType_ID =  parameter.getParameterAsInt();
 				if(p_M_CostType_ID == 0)
 		    		throw new FillMandatoryException(MCostDetail.COLUMNNAME_M_CostType_ID);
 			
 			}
 			else if (name.equals(MCostDetail.COLUMNNAME_DateAcct))
 			{	
 				p_DateAcct = (Timestamp) parameter.getParameter();
 				if(p_DateAcct == null)
 		    		throw new FillMandatoryException(MCostDetail.COLUMNNAME_DateAcct);
 			}	
         }
         if(p_DateAcct != null && p_M_Product_ID > 0)
         { 
        	 m_trxs = MTransaction.getAfterDateAcct(getCtx(), p_M_Product_ID, p_DateAcct, get_TrxName());
         }	 
         
	}	//	prepare

        
    protected String doIt() throws Exception                
	{
    	deleteCostDetail();
    	generateCostDetail();
		return "@Ok@";
	
	}
    
    private void deleteCostDetail()
    {
    	for (MTransaction trx: m_trxs)
    	{
    		IDocumentLine docline = trx.getDocumentLine();
    		MPeriod.testPeriodOpen(getCtx(), docline.getDateAcct() , docline.getC_DocType_ID(), docline.getAD_Org_ID());
    		CostDimension dimension = new CostDimension(trx.getAD_Client_ID(), trx.getAD_Org_ID(), trx.getM_Product_ID(),trx.getM_AttributeSetInstance_ID(), p_M_CostType_ID, p_C_AcctSchema_ID, p_M_CostElement_ID);
    		MCostDetail cd = MCostDetail.getByTransaction(trx, dimension);
    		cd.delete(true);
    	}
    }
    
    private void generateCostDetail()
    {
    	for (MTransaction trx: m_trxs)
    	{
    		CostEngineFactory.getCostEngine(getAD_Client_ID()).createCostDetail(trx);
    	}
    }
}
