-- Jul 2, 2010 4:12:53 PM CDT
-- Costing Engine
INSERT INTO M_CostType (Created,Updated,M_CostType_ID,UpdatedBy,AD_Org_ID,CreatedBy,Description,IsActive,Name,AD_Client_ID) VALUES (TO_DATE('2010-07-02 16:12:50','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2010-07-02 16:12:50','YYYY-MM-DD HH24:MI:SS'),50000,100,0,100,'Average Invoice Consting Method','Y','Average Invoice',11)
;

-- Jul 2, 2010 4:22:26 PM CDT
-- Costing Engine
INSERT INTO AD_TreeBar (AD_Tree_ID,AD_User_ID,Node_ID, AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy)VALUES (10,100,383,11,11,'Y',SysDate,100,SysDate,100)
;

-- Jul 2, 2010 4:29:10 PM CDT
-- Costing Engine
INSERT INTO M_Cost (UpdatedBy,CurrentCostPrice,FutureCostPrice,M_Product_ID,M_CostType_ID,C_AcctSchema_ID,IsActive,Created,Updated,CreatedBy,M_AttributeSetInstance_ID,Percent,CumulatedAmt,CumulatedQty,CurrentQty,AD_Client_ID,FutureCostPriceLL,IsCostFrozen,AD_Org_ID,CurrentCostPriceLL,M_CostElement_ID) VALUES (100,0,0,123,50000,101,'Y',TO_DATE('2010-07-02 16:29:10','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2010-07-02 16:29:10','YYYY-MM-DD HH24:MI:SS'),100,0,0,0,0,0,11,0,'N',0,0,104)
;

