-- Jun 20, 2010 3:50:46 PM CDT
-- Fixed Asset
INSERT INTO AD_Window (AD_Client_ID,AD_Org_ID,AD_Window_ID,Created,CreatedBy,EntityType,IsActive,IsBetaFunctionality,IsDefault,IsSOTrx,Name,Processing,Updated,UpdatedBy,WindowType) VALUES (0,0,53120,TO_TIMESTAMP('2010-06-20 15:50:46','YYYY-MM-DD HH24:MI:SS'),100,'ARH1','Y','N','N','Y','Imported Fixed Asset','N',TO_TIMESTAMP('2010-06-20 15:50:46','YYYY-MM-DD HH24:MI:SS'),100,'M')
;

-- Jun 20, 2010 3:50:46 PM CDT
-- Fixed Asset
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=53120 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- Jun 20, 2010 3:50:46 PM CDT
-- Fixed Asset
INSERT INTO AD_Table (AD_Client_ID,AD_Org_ID,AD_Table_ID,AD_Window_ID,AccessLevel,Created,CreatedBy,EntityType,ImportTable,IsActive,IsChangeLog,IsDeleteable,IsHighVolume,IsSecurityEnabled,IsView,Name,ReplicationType,TableName,Updated,UpdatedBy) VALUES (0,0,53277,53120,'3',TO_TIMESTAMP('2010-06-20 15:50:46','YYYY-MM-DD HH24:MI:SS'),100,'ARH1','N','Y','N','Y','Y','N','N','Imported Fixed Asset','L','I_FixedAsset',TO_TIMESTAMP('2010-06-20 15:50:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:46 PM CDT
-- Fixed Asset
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=53277 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

INSERT INTO AD_Sequence (AD_Client_ID,AD_Org_ID,AD_Sequence_ID,Created,CreatedBy,CurrentNext,CurrentNextSys,Description,IncrementNo,IsActive,IsAudited,IsAutoSequence,IsTableID,Name,StartNewYear,StartNo,Updated,UpdatedBy) VALUES (0,0,53391,TO_TIMESTAMP('2010-06-23 18:59:34','YYYY-MM-DD HH24:MI:SS'),100,1000000,50000,'Table I_FixedAsset',1,'Y','N','Y','Y','I_FixedAsset','N',1000000,TO_TIMESTAMP('2010-06-23 18:59:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:47 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='I_FixedAsset_ID', Description=NULL, EntityType='ARH1', Help=NULL, IsActive='Y', Name='Imported Fixed Asset', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Imported Fixed Asset',Updated=TO_TIMESTAMP('2010-06-20 15:50:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54205
;

-- Jun 20, 2010 3:50:47 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=54205
;

-- Jun 20, 2010 3:50:47 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='10 Digit Identifier', EntityType='D', Help=NULL, IsActive='Y', Name='ID', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=13
;

-- Jun 20, 2010 3:50:47 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=13
;

-- Jun 20, 2010 3:50:47 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59496,54205,0,13,53277,'I_FixedAsset_ID',TO_TIMESTAMP('2010-06-20 15:50:47','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',10,'Y','N','N','N','Y','N','N','N','Y','N','N','Imported Fixed Asset',TO_TIMESTAMP('2010-06-20 15:50:47','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:47 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59496 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
CREATE TABLE I_FixedAsset (I_FixedAsset_ID NUMERIC(10) DEFAULT NULL , CONSTRAINT I_FixedAsset_Key PRIMARY KEY (I_FixedAsset_ID))
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='AD_Client_ID', Description='Client/Tenant for this installation.', EntityType='D', Help='A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', IsActive='Y', Name='Client', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Client',Updated=TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=102
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=102
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Direct Table Access', EntityType='D', Help=NULL, IsActive='Y', Name='Table Direct', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=19
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=19
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59497,102,0,19,53277,'AD_Client_ID',TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),100,'Client/Tenant for this installation.','ARH1',10,'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','Y','N','N','N','N','Y','N','N','Y','N','N','Client',TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59497 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN AD_Client_ID NUMERIC(10) NOT NULL
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='AD_Org_ID', Description='Organizational entity within client', EntityType='D', Help='An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', IsActive='Y', Name='Organization', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Organization',Updated=TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=113
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=113
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59498,113,0,19,53277,'AD_Org_ID',TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),100,'Organizational entity within client','ARH1',10,'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','Y','N','N','N','N','Y','N','N','Y','N','N','Organization',TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59498 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN AD_Org_ID NUMERIC(10) NOT NULL
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='IsActive', Description='The record is active in the system', EntityType='D', Help='There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', IsActive='Y', Name='Active', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Active',Updated=TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=348
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=348
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='CheckBox', EntityType='D', Help=NULL, IsActive='Y', Name='Yes-No', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=20
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=20
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59499,348,0,20,53277,'IsActive',TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),100,'''Y''','The record is active in the system','ARH1',1,'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','Y','N','N','N','N','Y','N','N','Y','N','Y','Active',TO_TIMESTAMP('2010-06-20 15:50:48','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:48 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59499 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='Created', Description='Date this record was created', EntityType='D', Help='The Created field indicates the date that this record was created.', IsActive='Y', Name='Created', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Created',Updated=TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=245
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=245
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Date with time', EntityType='D', Help=NULL, IsActive='Y', Name='Date+Time', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=16
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=16
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59500,245,0,16,53277,'Created',TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),100,'Date this record was created','ARH1',7,'The Created field indicates the date that this record was created.','Y','N','N','N','N','Y','N','N','Y','N','N','Created',TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59500 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN Created TIMESTAMP NOT NULL
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='CreatedBy', Description='User who created this records', EntityType='D', Help='The Created By field indicates the user who created this record.', IsActive='Y', Name='Created By', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Created By',Updated=TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=246
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=246
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Table List', EntityType='D', Help=NULL, IsActive='Y', Name='Table', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=18
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=18
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='User selection', EntityType='D', Help=NULL, IsActive='Y', Name='AD_User', ValidationType='T',Updated=TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=110
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=110
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Ref_Table SET AD_Table_ID = 114, AD_Display = 213, AD_Key = 212, isValueDisplayed = 'N', OrderByClause = 'AD_User.Name', EntityType ='D', WhereClause = '' WHERE AD_Reference_ID = 110
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59501,246,0,18,110,53277,'CreatedBy',TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),100,'User who created this records','ARH1',10,'The Created By field indicates the user who created this record.','Y','N','N','N','N','Y','N','N','Y','N','N','Created By',TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59501 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN CreatedBy NUMERIC(10) NOT NULL
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='Updated', Description='Date this record was updated', EntityType='D', Help='The Updated field indicates the date that this record was updated.', IsActive='Y', Name='Updated', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Updated',Updated=TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=607
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=607
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59502,607,0,16,53277,'Updated',TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),100,'Date this record was updated','ARH1',7,'The Updated field indicates the date that this record was updated.','Y','N','N','N','N','Y','N','N','Y','N','N','Updated',TO_TIMESTAMP('2010-06-20 15:50:49','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59502 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:49 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN Updated TIMESTAMP NOT NULL
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='UpdatedBy', Description='User who updated this records', EntityType='D', Help='The Updated By field indicates the user who updated this record.', IsActive='Y', Name='Updated By', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Updated By',Updated=TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=608
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=608
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59503,608,0,18,110,53277,'UpdatedBy',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,'User who updated this records','ARH1',10,'The Updated By field indicates the user who updated this record.','Y','N','N','N','N','Y','N','N','Y','N','N','Updated By',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59503 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN UpdatedBy NUMERIC(10) NOT NULL
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='InventoryNo', Description=NULL, EntityType='ARH1', Help=NULL, IsActive='Y', Name='Inventory No', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Inventory No',Updated=TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54169
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=54169
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Character String', EntityType='D', Help=NULL, IsActive='Y', Name='String', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=10
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=10
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59504,54169,0,10,53277,'InventoryNo',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',30,'Y','N','N','Y','N','N','N','Y','Y','N','Y','Inventory No',10,TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59504 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN InventoryNo VARCHAR(30) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='Name', Description='Alphanumeric identifier of the entity', EntityType='D', Help='The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.', IsActive='Y', Name='Name', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Name',Updated=TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=469
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=469
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59505,469,0,10,53277,'Name',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,'Alphanumeric identifier of the entity','ARH1',120,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','Y','N','N','Y','N','N','N','Y','Y','N','Y','Name',20,TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59505 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN Name VARCHAR(120) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='A_Asset_Group_ID', Description='Group of Assets', EntityType='D', Help='The group of assets determines default accounts.  If an asset group is selected in the product category, assets are created when delivering the asset.', IsActive='Y', Name='Asset Group', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Asset Group',Updated=TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1929
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=1929
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59506,1929,0,19,53277,'A_Asset_Group_ID',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,'Group of Assets','ARH1',10,'The group of assets determines default accounts.  If an asset group is selected in the product category, assets are created when delivering the asset.','Y','N','N','N','N','N','N','N','Y','N','Y','Asset Group',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59506 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Asset_Group_ID NUMERIC(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54233,0,'A_Asset_Group_Value',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,'ARH1','Y','Asset Group Key','Asset Group Key',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:50 PM CDT
-- Fixed Asset
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54233 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59507,54233,0,10,53277,'A_Asset_Group_Value',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',40,'Y','N','N','N','N','N','N','N','Y','N','Y','Asset Group Key',TO_TIMESTAMP('2010-06-20 15:50:50','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59507 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Asset_Group_Value VARCHAR(40) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='A_Asset_Class_ID', Description=NULL, EntityType='ARH1', Help=NULL, IsActive='Y', Name='Asset class', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Asset class',Updated=TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54165
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=54165
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Search Field', EntityType='D', Help=NULL, IsActive='Y', Name='Search', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=30
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=30
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59508,54165,0,30,53277,'A_Asset_Class_ID',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',10,'Y','N','N','N','N','N','N','N','Y','N','Y','Asset class',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59508 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Asset_Class_ID NUMERIC(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54234,0,'A_Asset_Class_Value',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100,'ARH1','Y','Asset Class Key','Asset Class Key',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54234 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59509,54234,0,10,53277,'A_Asset_Class_Value',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',40,'Y','N','N','N','N','N','N','N','Y','N','Y','Asset Class Key',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59509 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Asset_Class_Value VARCHAR(40) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='M_Product_ID', Description='Product, Service, Item', EntityType='D', Help='Identifies an item which is either purchased or sold in this organization.', IsActive='Y', Name='Product', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Product',Updated=TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=454
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=454
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59510,454,0,30,53277,'M_Product_ID',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100,'Product, Service, Item','ARH1',10,'Identifies an item which is either purchased or sold in this organization.','Y','N','N','N','N','N','N','N','Y','N','Y','Product',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59510 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN M_Product_ID NUMERIC(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='ProductValue', Description='Key of the Product', EntityType='D', Help=NULL, IsActive='Y', Name='Product Key', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Product Key',Updated=TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1675
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=1675
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59511,1675,0,10,53277,'ProductValue',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100,'Key of the Product','ARH1',40,'Y','N','N','N','N','N','N','N','Y','N','Y','Product Key',TO_TIMESTAMP('2010-06-20 15:50:51','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59511 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:51 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN ProductValue VARCHAR(40) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='AssetServiceDate', Description='Date when Asset was put into service', EntityType='D', Help='The date when the asset was put into service - usually used as start date for depreciation.', IsActive='Y', Name='In Service Date', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='In Service date',Updated=TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1934
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=1934
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Date mm/dd/yyyy', EntityType='D', Help=NULL, IsActive='Y', Name='Date', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=15
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=15
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59512,1934,0,15,53277,'AssetServiceDate',TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),100,'Date when Asset was put into service','ARH1',7,'The date when the asset was put into service - usually used as start date for depreciation.','Y','N','N','N','N','N','N','N','Y','N','Y','In Service Date',TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59512 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN AssetServiceDate TIMESTAMP DEFAULT NULL 
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='A_Asset_Cost', Description=NULL, EntityType='ARH1', Help=NULL, IsActive='Y', Name='Asset Cost', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Asset Cost',Updated=TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53489
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53489
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Number with 4 decimals', EntityType='D', Help=NULL, IsActive='Y', Name='Amount', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=12
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=12
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59513,53489,0,12,53277,'A_Asset_Cost',TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),100,'0','ARH1',10,'Y','N','N','N','N','Y','N','N','Y','N','Y','Asset Cost',TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59513 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Asset_Cost NUMERIC DEFAULT '0' NOT NULL
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='A_Accumulated_Depr', Description=NULL, EntityType='ARH1', Help=NULL, IsActive='Y', Name='Accumulated Depreciation', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Accumulated Depreciation',Updated=TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53488
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53488
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59514,53488,0,12,53277,'A_Accumulated_Depr',TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',22,'Y','N','N','N','N','N','N','N','Y','N','Y','Accumulated Depreciation',TO_TIMESTAMP('2010-06-20 15:50:52','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59514 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:52 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Accumulated_Depr NUMERIC DEFAULT NULL 
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='A_Accumulated_Depr_F', Description=NULL, EntityType='ARH1', Help=NULL, IsActive='Y', Name='Accumulated Depreciation (fiscal)', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Accumulated Depreciation (fiscal)',Updated=TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54175
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=54175
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59515,54175,0,12,53277,'A_Accumulated_Depr_F',TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',22,'Y','N','N','N','N','N','N','N','Y','N','Y','Accumulated Depreciation (fiscal)',TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59515 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Accumulated_Depr_F NUMERIC DEFAULT NULL 
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='UseLifeMonths', Description='Months of the usable life of the asset', EntityType='D', Help=NULL, IsActive='Y', Name='Usable Life - Months', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Usable life months',Updated=TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1946
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=1946
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='10 Digit numeric', EntityType='D', Help=NULL, IsActive='Y', Name='Integer', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=11
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=11
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59516,1946,0,11,53277,'UseLifeMonths',TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),100,'Months of the usable life of the asset','ARH1',10,'Y','N','N','N','N','Y','N','N','Y','N','Y','Usable Life - Months',TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59516 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN UseLifeMonths NUMERIC(10) NOT NULL
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='UseLifeMonths_F', Description=NULL, EntityType='ARH1', Help=NULL, IsActive='Y', Name='Use Life - Months (fiscal)', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Use Life - Months (fiscal)',Updated=TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54179
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=54179
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59517,54179,0,11,53277,'UseLifeMonths_F',TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',10,'Y','N','N','N','N','Y','N','N','Y','N','Y','Use Life - Months (fiscal)',TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59517 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN UseLifeMonths_F NUMERIC(10) NOT NULL
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='A_Current_Period', Description=NULL, EntityType='ARH1', Help=NULL, IsActive='Y', Name='Current Period', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Current Period',Updated=TO_TIMESTAMP('2010-06-20 15:50:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53501
;

-- Jun 20, 2010 3:50:53 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53501
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59518,53501,0,11,53277,'A_Current_Period',TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',22,'Y','N','N','N','N','N','N','N','Y','N','Y','Current Period',TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59518 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Current_Period NUMERIC(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='DateAcct', Description='Accounting Date', EntityType='D', Help='The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.', IsActive='Y', Name='Account Date', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Acct Date',Updated=TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=263
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=263
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59519,263,0,15,53277,'DateAcct',TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),100,'Accounting Date','ARH1',7,'The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','Y','N','N','N','N','N','N','N','Y','N','Y','Account Date',TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59519 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN DateAcct TIMESTAMP DEFAULT NULL 
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='A_Asset_ID', Description='Asset used internally or by customers', EntityType='D', Help='An asset is either created by purchasing or by delivering a product.  An asset can be used internally or be a customer asset.', IsActive='Y', Name='Asset', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Asset',Updated=TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1884
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=1884
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59520,1884,0,30,53277,'A_Asset_ID',TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),100,'Asset used internally or by customers','ARH1',10,'An asset is either created by purchasing or by delivering a product.  An asset can be used internally or be a customer asset.','Y','N','N','N','N','N','N','N','Y','N','Y','Asset',TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59520 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Asset_ID NUMERIC(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='I_IsImported', Description='Has this import been processed', EntityType='D', Help='The Imported check box indicates if this import has been processed.', IsActive='Y', Name='Imported', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Imported',Updated=TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=913
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=913
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59521,913,0,20,53277,'I_IsImported',TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),100,'''N''','Has this import been processed','ARH1',1,'The Imported check box indicates if this import has been processed.','Y','N','N','N','N','Y','N','N','Y','N','Y','Imported',TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59521 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN I_IsImported CHAR(1) DEFAULT 'N' CHECK (I_IsImported IN ('Y','N')) NOT NULL
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='I_ErrorMsg', Description='Messages generated from import process', EntityType='D', Help='The Import Error Message displays any error messages generated during the import process.', IsActive='Y', Name='Import Error Message', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Import Error Message',Updated=TO_TIMESTAMP('2010-06-20 15:50:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=912
;

-- Jun 20, 2010 3:50:54 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=912
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Character String up to 2000 characters', EntityType='D', Help=NULL, IsActive='Y', Name='Text', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=14
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=14
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59522,912,0,14,53277,'I_ErrorMsg',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'Messages generated from import process','ARH1',2000,'The Import Error Message displays any error messages generated during the import process.','Y','N','N','N','N','N','N','N','Y','N','Y','Import Error Message',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59522 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN I_ErrorMsg VARCHAR(2000) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='Processing', Description=NULL, EntityType='D', Help=NULL, IsActive='Y', Name='Process Now', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Process Now',Updated=TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=524
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=524
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Command Button - starts a process', EntityType='D', Help=NULL, IsActive='Y', Name='Button', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=28
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=28
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process (AD_Client_ID,AD_Org_ID,AD_Process_ID,AccessLevel,Classname,Created,CreatedBy,EntityType,Help,IsActive,IsBetaFunctionality,IsDirectPrint,IsReport,Name,ShowHelp,Statistic_Count,Statistic_Seconds,Updated,UpdatedBy,Value,WorkflowValue) VALUES (0,0,53215,'2','org.compiere.FA.ImportFixedAsset',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'ARH1','Import All Fixed Assets','Y','N','N','N','Import Fixed Assets','Y',0,0,TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'Import_FixedAsset',NULL)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=53215 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para (AD_Client_ID,AD_Element_ID,AD_Org_ID,AD_Process_ID,AD_Process_Para_ID,AD_Reference_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsCentrallyMaintained,IsMandatory,IsRange,Name,SeqNo,Updated,UpdatedBy) VALUES (0,453,0,53215,53413,19,'M_Product_Category_ID',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'Category of a Product','ARH1',0,'Identifies the category which this product belongs to.  Product categories are used for pricing and selection.','Y','Y','Y','N','Product Category',10,TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=53413 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para (AD_Client_ID,AD_Element_ID,AD_Org_ID,AD_Process_ID,AD_Process_Para_ID,AD_Reference_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsCentrallyMaintained,IsMandatory,IsRange,Name,SeqNo,Updated,UpdatedBy) VALUES (0,1929,0,53215,53414,19,'A_Asset_Group_ID',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'Group of Assets','ARH1',0,'The group of assets determines default accounts.  If an asset group is selected in the product category, assets are created when delivering the asset.','Y','Y','N','N','Asset Group',20,TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=53414 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para (AD_Client_ID,AD_Element_ID,AD_Org_ID,AD_Process_ID,AD_Process_Para_ID,AD_Reference_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsCentrallyMaintained,IsMandatory,IsRange,Name,SeqNo,Updated,UpdatedBy) VALUES (0,263,0,53215,53415,15,'DateAcct',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'@#Date@','Accounting Date','ARH1',7,'The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','Y','Y','Y','N','Account Date',30,TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=53415 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para (AD_Client_ID,AD_Element_ID,AD_Org_ID,AD_Process_ID,AD_Process_Para_ID,AD_Reference_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsCentrallyMaintained,IsMandatory,IsRange,Name,SeqNo,Updated,UpdatedBy) VALUES (0,1922,0,53215,53416,20,'DeleteOldImported',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'Before processing delete old imported records in the import table','ARH1',0,'Y','Y','Y','N','Delete old imported records',40,TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=53416 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para (AD_Client_ID,AD_Element_ID,AD_Org_ID,AD_Process_ID,AD_Process_Para_ID,AD_Reference_ID,ColumnName,Created,CreatedBy,DefaultValue,EntityType,FieldLength,IsActive,IsCentrallyMaintained,IsMandatory,IsRange,Name,SeqNo,Updated,UpdatedBy) VALUES (0,54205,0,53215,53417,19,'I_FixedAsset_ID',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'@I_FixedAsset_ID@','ARH1',0,'Y','Y','N','N','Imported Fixed Asset',110,TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=53417 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para (AD_Client_ID,AD_Element_ID,AD_Org_ID,AD_Process_ID,AD_Process_Para_ID,AD_Reference_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,IsActive,IsCentrallyMaintained,IsMandatory,IsRange,Name,SeqNo,Updated,UpdatedBy) VALUES (0,2168,0,53215,53418,20,'IsValidateOnly',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'Y','Validate the date and do not process','ARH1',0,'Y','Y','Y','N','Only Validate Data',120,TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=53418 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Process_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59523,524,0,53215,28,53277,'Processing',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',1,'Y','N','N','N','N','N','N','N','Y','N','Y','Process Now',TO_TIMESTAMP('2010-06-20 15:50:55','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59523 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:55 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN Processing CHAR(1) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='Processed', Description='The document has been processed', EntityType='D', Help='The Processed checkbox indicates that a document has been processed.', IsActive='Y', Name='Processed', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Processed',Updated=TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1047
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=1047
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59524,1047,0,20,53277,'Processed',TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),100,'The document has been processed','ARH1',1,'The Processed checkbox indicates that a document has been processed.','Y','Y','N','N','N','N','N','N','Y','N','Y','Processed',TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59524 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN Processed CHAR(1) DEFAULT NULL CHECK (Processed IN ('Y','N'))
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54235,0,'A_Remaining_Period',TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),100,'ARH1','Y','Remaining Period','Remaining Period',TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54235 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59525,54235,0,11,53277,'A_Remaining_Period',TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),100,'0','ARH1',10,'Y','N','N','N','N','Y','N','N','Y','N','Y','Remaining Period',TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59525 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN A_Remaining_Period NUMERIC(10) DEFAULT '0' NOT NULL
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='DocAction', Description='The targeted status of the document', EntityType='D', Help='You find the current status in the Document Status field. The options are listed in a popup', IsActive='Y', Name='Document Action', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Doc Action',Updated=TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=287
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=287
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Reference List', EntityType='D', Help=NULL, IsActive='Y', Name='List', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=17
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=17
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Document action list', EntityType='D', Help=NULL, IsActive='Y', Name='_Document Action', ValidationType='L',Updated=TO_TIMESTAMP('2010-06-20 15:50:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=135
;

-- Jun 20, 2010 3:50:56 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=135
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59526,287,0,17,135,53277,'DocAction',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100,'''CO''','The targeted status of the document','ARH1',2,'You find the current status in the Document Status field. The options are listed in a popup','Y','N','N','N','N','Y','N','N','Y','N','Y','Document Action',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59526 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN DocAction VARCHAR(2) DEFAULT 'CO' NOT NULL
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54236,0,'AssetPeriodDepreciationAmt',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100,'Applies to Straight Line depreciation','ARH1','Y','Depreciation Amount / Period','Depreciation Amount / Period',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54236 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59527,54236,0,12,53277,'AssetPeriodDepreciationAmt',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100,'0','Applies to Straight Line depreciation','ARH1',22,'Y','N','N','N','N','Y','N','N','Y','N','Y','Depreciation Amount / Period',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59527 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN AssetPeriodDepreciationAmt NUMERIC DEFAULT '0' NOT NULL
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='AssetDepreciationDate', Description='Date of last depreciation', EntityType='D', Help='Date of the last deprecation, if the asset is used internally and depreciated.', IsActive='Y', Name='Asset Depreciation Date', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Asset depreciation date',Updated=TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1931
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=1931
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59528,1931,0,15,53277,'AssetDepreciationDate',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100,'Date of last depreciation','ARH1',7,'Date of the last deprecation, if the asset is used internally and depreciated.','Y','N','N','N','N','N','N','N','Y','N','Y','Asset Depreciation Date',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59528 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN AssetDepreciationDate TIMESTAMP DEFAULT NULL 
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='M_Locator_ID', Description='Warehouse Locator', EntityType='D', Help='The Locator indicates where in a Warehouse a product is located.', IsActive='Y', Name='Locator', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Locator',Updated=TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=448
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=448
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59529,448,0,19,53277,'M_Locator_ID',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100,'Warehouse Locator','ARH1',10,'The Locator indicates where in a Warehouse a product is located.','Y','N','N','N','N','N','N','N','Y','N','Y','Locator',TO_TIMESTAMP('2010-06-20 15:50:58','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59529 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:58 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN M_Locator_ID NUMERIC(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='LocatorValue', Description='Key of the Warehouse Locator', EntityType='D', Help=NULL, IsActive='Y', Name='Locator Key', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Locator Key',Updated=TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=2109
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=2109
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59530,2109,0,10,53277,'LocatorValue',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,'Key of the Warehouse Locator','ARH1',40,'Y','N','N','N','N','N','N','N','Y','N','Y','Locator Key',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59530 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN LocatorValue VARCHAR(40) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='Qty', Description='Quantity', EntityType='D', Help='The Quantity indicates the number of a specific product or item for this document.', IsActive='Y', Name='Quantity', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Qty',Updated=TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=526
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=526
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Quantity data type', EntityType='D', Help=NULL, IsActive='Y', Name='Quantity', ValidationType='D',Updated=TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=29
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=29
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59531,526,0,29,53277,'Qty',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,'1','Quantity','ARH1',10,'The Quantity indicates the number of a specific product or item for this document.','Y','N','N','N','N','N','N','N','Y','N','Y','Quantity',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59531 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN Qty NUMERIC DEFAULT '1' 
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='UOMSymbol', Description='Symbol for a Unit of Measure', EntityType='D', Help='The Symbol identifies the Symbol to be displayed and printed for a Unit of Measure', IsActive='Y', Name='Symbol', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='UoM',Updated=TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=602
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=602
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59532,602,0,10,53277,'UOMSymbol',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,'Symbol for a Unit of Measure','ARH1',10,'The Symbol identifies the Symbol to be displayed and printed for a Unit of Measure','Y','N','N','N','N','N','N','N','Y','N','Y','Symbol',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59532 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN UOMSymbol VARCHAR(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='C_UOM_ID', Description='Unit of Measure', EntityType='D', Help='The UOM defines a unique non monetary Unit of Measure', IsActive='Y', Name='UOM', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='UOM',Updated=TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=215
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=215
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59533,215,0,30,53277,'C_UOM_ID',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,'Unit of Measure','ARH1',10,'The UOM defines a unique non monetary Unit of Measure','Y','N','N','N','N','N','N','N','Y','N','Y','UOM',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59533 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN C_UOM_ID NUMERIC(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='Description', Description='Optional short description of the record', EntityType='D', Help='A description is limited to 255 characters.', IsActive='Y', Name='Description', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Description',Updated=TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=275
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=275
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59534,275,0,10,53277,'Description',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,'Optional short description of the record','ARH1',255,'A description is limited to 255 characters.','Y','N','N','N','N','N','N','N','Y','N','Y','Description',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59534 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN Description VARCHAR(255) DEFAULT NULL 
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54237,0,'C_City_Value',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,'ARH1','Y','City Value','City Value',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54237 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59535,54237,0,10,53277,'C_City_Value',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,'ARH1',40,'Y','N','N','N','N','N','N','N','Y','N','Y','City Value',TO_TIMESTAMP('2010-06-20 15:50:59','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:50:59 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59535 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN C_City_Value VARCHAR(40) DEFAULT NULL 
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='SeqNo', Description='Method of ordering records; lowest number comes first', EntityType='D', Help='The Sequence indicates the order of records', IsActive='Y', Name='Sequence', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Sequence',Updated=TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=566
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=566
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59536,566,0,11,53277,'SeqNo',TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100,'1','Method of ordering records; lowest number comes first','ARH1',10,'The Sequence indicates the order of records','Y','N','N','N','N','N','N','N','Y','N','Y','Sequence',TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59536 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN SeqNo NUMERIC(10) DEFAULT '1' 
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='BPartner_Value', Description='The Key of the Business Partner', EntityType='D', Help=NULL, IsActive='Y', Name='Business Partner Key', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Partner Key',Updated=TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1906
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=1906
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59537,1906,0,10,53277,'BPartner_Value',TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100,'The Key of the Business Partner','ARH1',40,'Y','N','N','N','N','N','N','N','Y','N','Y','Business Partner Key',TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59537 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN BPartner_Value VARCHAR(40) DEFAULT NULL 
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='C_BPartnerSR_ID', Description='Business Partner (Agent or Sales Rep)', EntityType='D', Help=NULL, IsActive='Y', Name='BPartner (Agent)', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='BPartner (Agent)',Updated=TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=2810
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=2810
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Reference SET Description='Business Partner selection (no Summary)', EntityType='D', Help=NULL, IsActive='Y', Name='C_BPartner (Trx)', ValidationType='T',Updated=TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=138
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=138
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Ref_Table SET AD_Table_ID = 291, AD_Display = 2902, AD_Key = 2893, isValueDisplayed = 'Y', OrderByClause = '', EntityType ='D', WhereClause = 'C_BPartner.IsSummary=''N'' AND C_BPartner.IsActive=''Y''' WHERE AD_Reference_ID = 138
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59538,2810,0,30,138,53277,'C_BPartnerSR_ID',TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100,'Business Partner (Agent or Sales Rep)','ARH1',10,'Y','N','N','N','N','N','N','N','Y','N','Y','BPartner (Agent)',TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59538 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN C_BPartnerSR_ID NUMERIC(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Element SET ColumnName='C_City_ID', Description='City', EntityType='D', Help='City in a country', IsActive='Y', Name='City', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='City',Updated=TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1830
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=1830
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,59539,1830,0,30,53277,'C_City_ID',TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100,'City','ARH1',10,'City in a country','Y','N','N','N','N','N','N','N','Y','N','Y','City',TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59539 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
ALTER TABLE I_FixedAsset ADD COLUMN C_City_ID NUMERIC(10) DEFAULT NULL 
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Tab (AD_Client_ID,AD_Org_ID,AD_Tab_ID,AD_Table_ID,AD_Window_ID,CommitWarning,Created,CreatedBy,EntityType,HasTree,IsActive,IsAdvancedTab,IsInfoTab,IsInsertRecord,IsReadOnly,IsSingleRow,IsSortTab,IsTranslationTab,Name,Processing,SeqNo,TabLevel,Updated,UpdatedBy) VALUES (0,0,53334,53277,53120,NULL,TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100,'ARH1','N','Y','N','N','Y','N','N','N','N','Fixed Asset','N',10,0,TO_TIMESTAMP('2010-06-20 15:51:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Jun 20, 2010 3:51:00 PM CDT
-- Fixed Asset
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, CommitWarning,Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.CommitWarning,t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=53334 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

