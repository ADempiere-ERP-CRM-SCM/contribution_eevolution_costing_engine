-- Jun 22, 2010 12:05:51 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET AD_Reference_Value_ID=NULL, ColumnSQL=' ', DefaultValue=NULL,Updated=TO_DATE('2010-06-22 12:05:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=13481
;

-- Jun 22, 2010 12:13:44 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_DATE('2010-06-22 12:13:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=11353
;

-- Jun 22, 2010 12:15:33 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=13481
;

-- Jun 22, 2010 12:15:33 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
DELETE FROM AD_Column WHERE AD_Column_ID=13481
;

-- Jun 22, 2010 12:21:46 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=13481
;

-- Jun 22, 2010 12:21:46 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
DELETE FROM AD_Column WHERE AD_Column_ID=13481
;

delete from AD_Field where ad_column_id=13481;

-- Jun 22, 2010 12:36:03 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=13481
;

-- Jun 22, 2010 12:36:03 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
DELETE FROM AD_Column WHERE AD_Column_ID=13481
;

-- Jun 22, 2010 12:41:13 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59584,241,0,17,771,'CostingMethod',TO_DATE('2010-06-22 12:41:10','YYYY-MM-DD HH24:MI:SS'),0,'Indicates how Costs will be calculated','U',1,'The Costing Method indicates how costs will be calculated (Standard, Average, Lifo, FiFo).  The default costing method is defined on accounting schema level and can be optionally overwritten in the product category.  The costing method cannot conflict with the Material Movement Policy (defined on Product Category).','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Costing Method',0,TO_DATE('2010-06-22 12:41:10','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jun 22, 2010 12:41:13 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59584 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 22, 2010 12:41:20 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE M_Cost ADD CostingMethod CHAR(1) DEFAULT NULL 
;

-- Jun 22, 2010 12:41:47 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59584,59453,0,701,TO_DATE('2010-06-22 12:41:46','YYYY-MM-DD HH24:MI:SS'),0,'Indicates how Costs will be calculated',1,'U','The Costing Method indicates how costs will be calculated (Standard, Average, Lifo, FiFo).  The default costing method is defined on accounting schema level and can be optionally overwritten in the product category.  The costing method cannot conflict with the Material Movement Policy (defined on Product Category).','Y','Y','Y','N','N','N','N','N','Costing Method',TO_DATE('2010-06-22 12:41:46','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Jun 22, 2010 12:41:47 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=59453 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Jun 22, 2010 12:41:58 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=59453
;

-- Jun 22, 2010 12:41:58 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=11351
;

-- Jun 22, 2010 12:41:58 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=11346
;

-- Jun 22, 2010 12:46:13 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET AD_Reference_ID=19, IsMandatory='Y',Updated=TO_DATE('2010-06-22 12:46:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=59584
;

-- Jun 22, 2010 12:46:16 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE M_Cost MODIFY CostingMethod CHAR(1)
;

-- Jun 22, 2010 12:46:19 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
--ALTER TABLE M_Cost MODIFY CostingMethod NOT NULL
--;

-- Jun 22, 2010 1:01:11 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET AD_Reference_ID=17,Updated=TO_DATE('2010-06-22 13:01:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=59584
;

-- Jun 22, 2010 1:01:15 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE M_Cost MODIFY CostingMethod CHAR(1)
;

-- Jun 22, 2010 1:01:16 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
--ALTER TABLE M_Cost MODIFY CostingMethod NOT NULL
--;

-- Jun 22, 2010 1:01:41 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET IsMandatory='N',Updated=TO_DATE('2010-06-22 13:01:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=59584
;

-- Jun 22, 2010 1:01:44 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE M_Cost MODIFY CostingMethod CHAR(1) DEFAULT NULL 
;

-- Jun 22, 2010 1:15:19 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET FieldLength=40,Updated=TO_DATE('2010-06-22 13:15:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=59584
;

-- Jun 22, 2010 1:19:55 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET AD_Reference_ID=19, FieldLength=10,Updated=TO_DATE('2010-06-22 13:19:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=59584
;

-- Jun 22, 2010 1:19:59 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE M_Cost MODIFY CostingMethod VARCHAR2(10) DEFAULT NULL 
;

-- Jun 22, 2010 1:26:17 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET AD_Reference_ID=17,Updated=TO_DATE('2010-06-22 13:26:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=59584
;

-- Jun 22, 2010 1:26:21 PM EEST
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE M_Cost MODIFY CostingMethod NVARCHAR2(10) DEFAULT NULL 
;

