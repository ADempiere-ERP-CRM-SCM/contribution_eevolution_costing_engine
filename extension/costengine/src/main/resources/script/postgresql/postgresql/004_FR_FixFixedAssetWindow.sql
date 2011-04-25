-- Jun 20, 2010 4:17:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=59391
;

-- Jun 20, 2010 4:17:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=59393
;

-- Jun 20, 2010 4:17:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=59394
;

-- Jun 20, 2010 4:17:58 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2010-06-20 16:17:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59392
;

-- Jun 20, 2010 4:18:06 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 16:18:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59393
;

-- Jun 20, 2010 4:18:35 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2010-06-20 16:18:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53324
;

-- Jun 20, 2010 4:18:58 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2010-06-20 16:18:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59394
;

-- Jun 20, 2010 4:19:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2010-06-20 16:19:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59390
;

-- Jun 20, 2010 4:20:24 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=59392
;

-- Jun 20, 2010 4:20:24 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=59394
;

-- Jun 20, 2010 4:25:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Create Date', PrintName='Create Date',Updated=TO_TIMESTAMP('2010-06-20 16:25:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53526
;

-- Jun 20, 2010 4:25:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53526
;

-- Jun 20, 2010 4:25:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Asset_CreateDate', Name='Create Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53526
;

-- Jun 20, 2010 4:25:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_CreateDate', Name='Create Date', Description=NULL, Help=NULL, AD_Element_ID=53526 WHERE UPPER(ColumnName)='A_ASSET_CREATEDATE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:25:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_CreateDate', Name='Create Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53526 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:25:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Create Date', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53526) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:25:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Create Date', Name='Create Date' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53526)
;

-- Jun 20, 2010 4:26:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Parent Asset', PrintName='Parent Asset',Updated=TO_TIMESTAMP('2010-06-20 16:26:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53528
;

-- Jun 20, 2010 4:26:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53528
;

-- Jun 20, 2010 4:26:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Parent_Asset_ID', Name='Parent Asset', Description=NULL, Help=NULL WHERE AD_Element_ID=53528
;

-- Jun 20, 2010 4:26:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Parent_Asset_ID', Name='Parent Asset', Description=NULL, Help=NULL, AD_Element_ID=53528 WHERE UPPER(ColumnName)='A_PARENT_ASSET_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:26:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Parent_Asset_ID', Name='Parent Asset', Description=NULL, Help=NULL WHERE AD_Element_ID=53528 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:26:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Parent Asset', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53528) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:26:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Parent Asset', Name='Parent Asset' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53528)
;

-- Jun 20, 2010 4:26:40 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Revaluation Date', PrintName='Revaluation Date',Updated=TO_TIMESTAMP('2010-06-20 16:26:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53527
;

-- Jun 20, 2010 4:26:40 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53527
;

-- Jun 20, 2010 4:26:40 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Asset_RevalDate', Name='Revaluation Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53527
;

-- Jun 20, 2010 4:26:40 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_RevalDate', Name='Revaluation Date', Description=NULL, Help=NULL, AD_Element_ID=53527 WHERE UPPER(ColumnName)='A_ASSET_REVALDATE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:26:40 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_RevalDate', Name='Revaluation Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53527 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:26:40 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Revaluation Date', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53527) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:26:40 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Revaluation Date', Name='Revaluation Date' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53527)
;

-- Jun 20, 2010 4:27:19 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2010-06-20 16:27:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=450
;

-- Jun 20, 2010 4:31:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO t_alter_column values('a_asset_group','A_Asset_Type_ID','NUMERIC(10)',null,'NULL')
;

-- Jun 20, 2010 4:35:30 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_TIMESTAMP('2010-06-20 16:35:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58996
;

-- Jun 20, 2010 4:36:27 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 16:36:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6150
;

-- Jun 20, 2010 4:36:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 16:36:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58997
;

-- Jun 20, 2010 4:36:40 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 16:36:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6137
;

-- Jun 20, 2010 4:36:47 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 16:36:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6141
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=58996
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=6154
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=6149
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=8345
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=6146
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=58993
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=6135
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=6143
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=6166
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=55830
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=55831
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=12106
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=58994
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=6139
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=6165
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=6147
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=6136
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=6138
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=12107
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=6151
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=6159
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=6156
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=12876
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=12875
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=6160
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=6213
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=6148
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=6142
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=6161
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=6144
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=12872
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=12874
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=12873
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=12877
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=12878
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=58995
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=6141
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=6137
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=6150
;

-- Jun 20, 2010 4:37:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=58997
;

-- Jun 20, 2010 4:37:59 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=58997
;

-- Jun 20, 2010 4:37:59 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=6141
;

-- Jun 20, 2010 4:37:59 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=6137
;

-- Jun 20, 2010 4:37:59 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=6150
;

-- Jun 20, 2010 4:38:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 16:38:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58997
;

-- Jun 20, 2010 4:40:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET PrintName='Costo del Activo',Updated=TO_TIMESTAMP('2010-06-20 16:40:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53489 AND AD_Language='es_MX'
;

-- Jun 20, 2010 4:43:47 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Disposal Gain', PrintName='Disposal Gain',Updated=TO_TIMESTAMP('2010-06-20 16:43:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53532
;

-- Jun 20, 2010 4:43:47 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53532
;

-- Jun 20, 2010 4:43:47 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Disposal_Gain', Name='Disposal Gain', Description=NULL, Help=NULL WHERE AD_Element_ID=53532
;

-- Jun 20, 2010 4:43:47 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Gain', Name='Disposal Gain', Description=NULL, Help=NULL, AD_Element_ID=53532 WHERE UPPER(ColumnName)='A_DISPOSAL_GAIN' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:43:47 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Gain', Name='Disposal Gain', Description=NULL, Help=NULL WHERE AD_Element_ID=53532 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:43:47 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Disposal Gain', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53532) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:43:47 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Disposal Gain', Name='Disposal Gain' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53532)
;

-- Jun 20, 2010 4:44:09 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Disposal Revenue', PrintName='Disposal Revenue',Updated=TO_TIMESTAMP('2010-06-20 16:44:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54195
;

-- Jun 20, 2010 4:44:09 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=54195
;

-- Jun 20, 2010 4:44:09 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Disposal_Revenue_Acct', Name='Disposal Revenue', Description=NULL, Help=NULL WHERE AD_Element_ID=54195
;

-- Jun 20, 2010 4:44:09 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Revenue_Acct', Name='Disposal Revenue', Description=NULL, Help=NULL, AD_Element_ID=54195 WHERE UPPER(ColumnName)='A_DISPOSAL_REVENUE_ACCT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:44:09 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Revenue_Acct', Name='Disposal Revenue', Description=NULL, Help=NULL WHERE AD_Element_ID=54195 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:09 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Disposal Revenue', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=54195) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:09 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Disposal Revenue', Name='Disposal Revenue' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=54195)
;

-- Jun 20, 2010 4:44:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Disposal Revenue Str',Updated=TO_TIMESTAMP('2010-06-20 16:44:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53561
;

-- Jun 20, 2010 4:44:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53561
;

-- Jun 20, 2010 4:44:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Disposal_Revenue_Str', Name='Disposal Revenue Str', Description=NULL, Help=NULL WHERE AD_Element_ID=53561
;

-- Jun 20, 2010 4:44:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Revenue_Str', Name='Disposal Revenue Str', Description=NULL, Help=NULL, AD_Element_ID=53561 WHERE UPPER(ColumnName)='A_DISPOSAL_REVENUE_STR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:44:19 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Revenue_Str', Name='Disposal Revenue Str', Description=NULL, Help=NULL WHERE AD_Element_ID=53561 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:19 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Disposal Revenue Str', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53561) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:19 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='A_Disposal_Revenue_Str', Name='Disposal Revenue Str' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53561)
;

-- Jun 20, 2010 4:44:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Description=NULL, PrintName='Disposal Revenue Str',Updated=TO_TIMESTAMP('2010-06-20 16:44:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53561
;

-- Jun 20, 2010 4:44:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53561
;

-- Jun 20, 2010 4:44:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Disposal_Revenue_Str', Name='Disposal Revenue Str', Description=NULL, Help=NULL WHERE AD_Element_ID=53561
;

-- Jun 20, 2010 4:44:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Revenue_Str', Name='Disposal Revenue Str', Description=NULL, Help=NULL, AD_Element_ID=53561 WHERE UPPER(ColumnName)='A_DISPOSAL_REVENUE_STR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:44:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Revenue_Str', Name='Disposal Revenue Str', Description=NULL, Help=NULL WHERE AD_Element_ID=53561 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Disposal Revenue Str', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53561) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Disposal Revenue Str', Name='Disposal Revenue Str' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53561)
;

-- Jun 20, 2010 4:44:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Disposed Date', PrintName='Disposed Date',Updated=TO_TIMESTAMP('2010-06-20 16:44:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53551
;

-- Jun 20, 2010 4:44:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53551
;

-- Jun 20, 2010 4:44:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Disposed_Date', Name='Disposed Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53551
;

-- Jun 20, 2010 4:44:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposed_Date', Name='Disposed Date', Description=NULL, Help=NULL, AD_Element_ID=53551 WHERE UPPER(ColumnName)='A_DISPOSED_DATE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:44:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposed_Date', Name='Disposed Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53551 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Disposed Date', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53551) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Disposed Date', Name='Disposed Date' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53551)
;

-- Jun 20, 2010 4:44:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Disposed Method', PrintName='Disposed Method',Updated=TO_TIMESTAMP('2010-06-20 16:44:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53554
;

-- Jun 20, 2010 4:44:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53554
;

-- Jun 20, 2010 4:44:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Disposed_Method', Name='Disposed Method', Description=NULL, Help=NULL WHERE AD_Element_ID=53554
;

-- Jun 20, 2010 4:44:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposed_Method', Name='Disposed Method', Description=NULL, Help=NULL, AD_Element_ID=53554 WHERE UPPER(ColumnName)='A_DISPOSED_METHOD' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:44:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposed_Method', Name='Disposed Method', Description=NULL, Help=NULL WHERE AD_Element_ID=53554 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Disposed Method', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53554) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:44:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Disposed Method', Name='Disposed Method' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53554)
;

-- Jun 20, 2010 4:45:03 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Disposed Reason',Updated=TO_TIMESTAMP('2010-06-20 16:45:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53552
;

-- Jun 20, 2010 4:45:03 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53552
;

-- Jun 20, 2010 4:45:03 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Disposed_Reason', Name='Disposed Reason', Description=NULL, Help=NULL WHERE AD_Element_ID=53552
;

-- Jun 20, 2010 4:45:03 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposed_Reason', Name='Disposed Reason', Description=NULL, Help=NULL, AD_Element_ID=53552 WHERE UPPER(ColumnName)='A_DISPOSED_REASON' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:45:03 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposed_Reason', Name='Disposed Reason', Description=NULL, Help=NULL WHERE AD_Element_ID=53552 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:45:03 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Disposed Reason', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53552) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:45:03 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='A_Disposed_Reason', Name='Disposed Reason' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53552)
;

-- Jun 20, 2010 4:45:11 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET PrintName='Disposed Reason',Updated=TO_TIMESTAMP('2010-06-20 16:45:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53552
;

-- Jun 20, 2010 4:45:11 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53552
;

-- Jun 20, 2010 4:45:11 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Disposed Reason', Name='Disposed Reason' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53552)
;

-- Jun 20, 2010 4:45:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Disposal Loss Str', PrintName='Disposal Loss Str',Updated=TO_TIMESTAMP('2010-06-20 16:45:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53563
;

-- Jun 20, 2010 4:45:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53563
;

-- Jun 20, 2010 4:45:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Disposal_Loss_Str', Name='Disposal Loss Str', Description=NULL, Help=NULL WHERE AD_Element_ID=53563
;

-- Jun 20, 2010 4:45:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Loss_Str', Name='Disposal Loss Str', Description=NULL, Help=NULL, AD_Element_ID=53563 WHERE UPPER(ColumnName)='A_DISPOSAL_LOSS_STR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 4:45:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Disposal_Loss_Str', Name='Disposal Loss Str', Description=NULL, Help=NULL WHERE AD_Element_ID=53563 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:45:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Disposal Loss Str', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53563) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 4:45:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Disposal Loss Str', Name='Disposal Loss Str' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53563)
;

-- Jun 20, 2010 5:25:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Contract Date', PrintName='Contract Date',Updated=TO_TIMESTAMP('2010-06-20 17:25:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53602
;

-- Jun 20, 2010 5:25:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53602
;

-- Jun 20, 2010 5:25:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Contract_Date', Name='Contract Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53602
;

-- Jun 20, 2010 5:25:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Contract_Date', Name='Contract Date', Description=NULL, Help=NULL, AD_Element_ID=53602 WHERE UPPER(ColumnName)='A_CONTRACT_DATE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:25:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Contract_Date', Name='Contract Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53602 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:25:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Contract Date', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53602) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:25:29 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Contract Date', Name='Contract Date' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53602)
;

-- Jun 20, 2010 5:25:53 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Due On', PrintName='Asset Due On',Updated=TO_TIMESTAMP('2010-06-20 17:25:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53595
;

-- Jun 20, 2010 5:25:53 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53595
;

-- Jun 20, 2010 5:25:53 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Due_On', Name='Asset Due On', Description=NULL, Help=NULL WHERE AD_Element_ID=53595
;

-- Jun 20, 2010 5:25:53 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Due_On', Name='Asset Due On', Description=NULL, Help=NULL, AD_Element_ID=53595 WHERE UPPER(ColumnName)='A_DUE_ON' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:25:53 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Due_On', Name='Asset Due On', Description=NULL, Help=NULL WHERE AD_Element_ID=53595 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:25:53 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Due On', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53595) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:25:53 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Due On', Name='Asset Due On' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53595)
;

-- Jun 20, 2010 5:26:25 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Expired Date', PrintName='Asset Expired Date',Updated=TO_TIMESTAMP('2010-06-20 17:26:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53601
;

-- Jun 20, 2010 5:26:25 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53601
;

-- Jun 20, 2010 5:26:25 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Expired_Date', Name='Asset Expired Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53601
;

-- Jun 20, 2010 5:26:25 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Expired_Date', Name='Asset Expired Date', Description=NULL, Help=NULL, AD_Element_ID=53601 WHERE UPPER(ColumnName)='A_EXPIRED_DATE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:26:25 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Expired_Date', Name='Asset Expired Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53601 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:26:25 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Expired Date', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53601) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:26:25 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Expired Date', Name='Asset Expired Date' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53601)
;

-- Jun 20, 2010 5:27:09 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Finance Method', PrintName='Asset Finance Method',Updated=TO_TIMESTAMP('2010-06-20 17:27:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53593
;

-- Jun 20, 2010 5:27:09 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53593
;

-- Jun 20, 2010 5:27:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Finance_Meth', Name='Asset Finance Method', Description=NULL, Help=NULL WHERE AD_Element_ID=53593
;

-- Jun 20, 2010 5:27:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Finance_Meth', Name='Asset Finance Method', Description=NULL, Help=NULL, AD_Element_ID=53593 WHERE UPPER(ColumnName)='A_FINANCE_METH' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:27:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Finance_Meth', Name='Asset Finance Method', Description=NULL, Help=NULL WHERE AD_Element_ID=53593 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:27:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Finance Method', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53593) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:27:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Finance Method', Name='Asset Finance Method' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53593)
;

-- Jun 20, 2010 5:27:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Monthly Payment', PrintName='Asset Monthly Payment',Updated=TO_TIMESTAMP('2010-06-20 17:27:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53600
;

-- Jun 20, 2010 5:27:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53600
;

-- Jun 20, 2010 5:27:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Monthly_Payment', Name='Asset Monthly Payment', Description=NULL, Help=NULL WHERE AD_Element_ID=53600
;

-- Jun 20, 2010 5:27:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Monthly_Payment', Name='Asset Monthly Payment', Description=NULL, Help=NULL, AD_Element_ID=53600 WHERE UPPER(ColumnName)='A_MONTHLY_PAYMENT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:27:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Monthly_Payment', Name='Asset Monthly Payment', Description=NULL, Help=NULL WHERE AD_Element_ID=53600 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:27:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Monthly Payment', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53600) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:27:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Monthly Payment', Name='Asset Monthly Payment' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53600)
;

-- Jun 20, 2010 5:28:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Info Financial ID', PrintName='Asset Info Financial ID',Updated=TO_TIMESTAMP('2010-06-20 17:28:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53594
;

-- Jun 20, 2010 5:28:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53594
;

-- Jun 20, 2010 5:28:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Asset_Info_Fin_ID', Name='Asset Info Financial ID', Description=NULL, Help=NULL WHERE AD_Element_ID=53594
;

-- Jun 20, 2010 5:28:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Info_Fin_ID', Name='Asset Info Financial ID', Description=NULL, Help=NULL, AD_Element_ID=53594 WHERE UPPER(ColumnName)='A_ASSET_INFO_FIN_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:28:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Info_Fin_ID', Name='Asset Info Financial ID', Description=NULL, Help=NULL WHERE AD_Element_ID=53594 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:28:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Info Financial ID', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53594) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:28:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Info Financial ID', Name='Asset Info Financial ID' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53594)
;

-- Jun 20, 2010 5:29:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Description='Asset Cost',Updated=TO_TIMESTAMP('2010-06-20 17:29:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53489
;

-- Jun 20, 2010 5:29:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53489
;

-- Jun 20, 2010 5:29:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Asset_Cost', Name='Asset Cost', Description='Asset Cost', Help=NULL WHERE AD_Element_ID=53489
;

-- Jun 20, 2010 5:29:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Cost', Name='Asset Cost', Description='Asset Cost', Help=NULL, AD_Element_ID=53489 WHERE UPPER(ColumnName)='A_ASSET_COST' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:29:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Cost', Name='Asset Cost', Description='Asset Cost', Help=NULL WHERE AD_Element_ID=53489 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:29:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Cost', Description='Asset Cost', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53489) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:32:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Proceeds', PrintName='Asset Proceeds',Updated=TO_TIMESTAMP('2010-06-20 17:32:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53553
;

-- Jun 20, 2010 5:32:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53553
;

-- Jun 20, 2010 5:32:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Proceeds', Name='Asset Proceeds', Description=NULL, Help=NULL WHERE AD_Element_ID=53553
;

-- Jun 20, 2010 5:32:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Proceeds', Name='Asset Proceeds', Description=NULL, Help=NULL, AD_Element_ID=53553 WHERE UPPER(ColumnName)='A_PROCEEDS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:32:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Proceeds', Name='Asset Proceeds', Description=NULL, Help=NULL WHERE AD_Element_ID=53553 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:32:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Proceeds', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53553) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:32:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Proceeds', Name='Asset Proceeds' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53553)
;

-- Jun 20, 2010 5:33:24 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Trade', PrintName='Asset Trade',Updated=TO_TIMESTAMP('2010-06-20 17:33:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53555
;

-- Jun 20, 2010 5:33:24 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53555
;

-- Jun 20, 2010 5:33:24 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Asset_Trade_ID', Name='Asset Trade', Description=NULL, Help=NULL WHERE AD_Element_ID=53555
;

-- Jun 20, 2010 5:33:24 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Trade_ID', Name='Asset Trade', Description=NULL, Help=NULL, AD_Element_ID=53555 WHERE UPPER(ColumnName)='A_ASSET_TRADE_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:33:24 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Trade_ID', Name='Asset Trade', Description=NULL, Help=NULL WHERE AD_Element_ID=53555 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:33:24 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Trade', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53555) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:33:24 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Trade', Name='Asset Trade' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53555)
;

-- Jun 20, 2010 5:34:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset License No', PrintName='Asset License No',Updated=TO_TIMESTAMP('2010-06-20 17:34:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53616
;

-- Jun 20, 2010 5:34:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53616
;

-- Jun 20, 2010 5:34:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_License_No', Name='Asset License No', Description=NULL, Help=NULL WHERE AD_Element_ID=53616
;

-- Jun 20, 2010 5:34:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_License_No', Name='Asset License No', Description=NULL, Help=NULL, AD_Element_ID=53616 WHERE UPPER(ColumnName)='A_LICENSE_NO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:34:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_License_No', Name='Asset License No', Description=NULL, Help=NULL WHERE AD_Element_ID=53616 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:34:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset License No', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53616) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:34:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset License No', Name='Asset License No' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53616)
;

-- Jun 20, 2010 5:35:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset License Fee', PrintName='Asset License Fee',Updated=TO_TIMESTAMP('2010-06-20 17:35:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53614
;

-- Jun 20, 2010 5:35:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53614
;

-- Jun 20, 2010 5:35:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_License_Fee', Name='Asset License Fee', Description=NULL, Help=NULL WHERE AD_Element_ID=53614
;

-- Jun 20, 2010 5:35:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_License_Fee', Name='Asset License Fee', Description=NULL, Help=NULL, AD_Element_ID=53614 WHERE UPPER(ColumnName)='A_LICENSE_FEE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:35:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_License_Fee', Name='Asset License Fee', Description=NULL, Help=NULL WHERE AD_Element_ID=53614 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:35:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset License Fee', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53614) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:35:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset License Fee', Name='Asset License Fee' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53614)
;

-- Jun 20, 2010 5:35:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Renewal Date', PrintName='Asset Renewal Date',Updated=TO_TIMESTAMP('2010-06-20 17:35:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53615
;

-- Jun 20, 2010 5:35:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53615
;

-- Jun 20, 2010 5:35:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Renewal_Date', Name='Asset Renewal Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53615
;

-- Jun 20, 2010 5:35:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Renewal_Date', Name='Asset Renewal Date', Description=NULL, Help=NULL, AD_Element_ID=53615 WHERE UPPER(ColumnName)='A_RENEWAL_DATE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:35:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Renewal_Date', Name='Asset Renewal Date', Description=NULL, Help=NULL WHERE AD_Element_ID=53615 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:35:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Renewal Date', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53615) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:35:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Renewal Date', Name='Asset Renewal Date' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53615)
;

-- Jun 20, 2010 5:36:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 17:36:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=55968
;

-- Jun 20, 2010 5:36:52 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 17:36:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=55966
;

-- Jun 20, 2010 5:37:40 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2010-06-20 17:37:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53322
;

-- Jun 20, 2010 5:38:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Description='Accumulated Depreciation',Updated=TO_TIMESTAMP('2010-06-20 17:38:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53488
;

-- Jun 20, 2010 5:38:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53488
;

-- Jun 20, 2010 5:38:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Accumulated_Depr', Name='Accumulated Depreciation', Description='Accumulated Depreciation', Help=NULL WHERE AD_Element_ID=53488
;

-- Jun 20, 2010 5:38:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Accumulated_Depr', Name='Accumulated Depreciation', Description='Accumulated Depreciation', Help=NULL, AD_Element_ID=53488 WHERE UPPER(ColumnName)='A_ACCUMULATED_DEPR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:38:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Accumulated_Depr', Name='Accumulated Depreciation', Description='Accumulated Depreciation', Help=NULL WHERE AD_Element_ID=53488 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:38:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Accumulated Depreciation', Description='Accumulated Depreciation', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53488) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:38:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Period', PrintName='Asset Period',Updated=TO_TIMESTAMP('2010-06-20 17:38:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53477
;

-- Jun 20, 2010 5:38:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53477
;

-- Jun 20, 2010 5:38:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Period', Name='Asset Period', Description=NULL, Help=NULL WHERE AD_Element_ID=53477
;

-- Jun 20, 2010 5:38:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Period', Name='Asset Period', Description=NULL, Help=NULL, AD_Element_ID=53477 WHERE UPPER(ColumnName)='A_PERIOD' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:38:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Period', Name='Asset Period', Description=NULL, Help=NULL WHERE AD_Element_ID=53477 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:38:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Period', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53477) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:38:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Period', Name='Asset Period' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53477)
;

-- Jun 20, 2010 5:39:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Disposed', PrintName='Asset Disposed',Updated=TO_TIMESTAMP('2010-06-20 17:39:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53550
;

-- Jun 20, 2010 5:39:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53550
;

-- Jun 20, 2010 5:39:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Asset_Disposed_ID', Name='Asset Disposed', Description=NULL, Help=NULL WHERE AD_Element_ID=53550
;

-- Jun 20, 2010 5:39:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Disposed_ID', Name='Asset Disposed', Description=NULL, Help=NULL, AD_Element_ID=53550 WHERE UPPER(ColumnName)='A_ASSET_DISPOSED_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:39:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Disposed_ID', Name='Asset Disposed', Description=NULL, Help=NULL WHERE AD_Element_ID=53550 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:39:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Disposed', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53550) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:39:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Disposed', Name='Asset Disposed' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53550)
;

-- Jun 20, 2010 5:40:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsActive='Y',Updated=TO_TIMESTAMP('2010-06-20 17:40:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53164
;

-- Jun 20, 2010 5:40:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsActive='Y',Updated=TO_TIMESTAMP('2010-06-20 17:40:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=451
;

-- Jun 20, 2010 5:40:34 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsActive='Y',Updated=TO_TIMESTAMP('2010-06-20 17:40:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53158
;

-- Jun 20, 2010 5:40:36 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsActive='Y',Updated=TO_TIMESTAMP('2010-06-20 17:40:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=793
;

-- Jun 20, 2010 5:40:37 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsActive='Y',Updated=TO_TIMESTAMP('2010-06-20 17:40:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53160
;

-- Jun 20, 2010 5:40:38 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsActive='Y',Updated=TO_TIMESTAMP('2010-06-20 17:40:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53155
;

-- Jun 20, 2010 5:40:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsActive='Y',Updated=TO_TIMESTAMP('2010-06-20 17:40:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53161
;

-- Jun 20, 2010 5:41:37 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2010-06-20 17:41:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=451
;

-- Jun 20, 2010 5:41:39 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2010-06-20 17:41:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53158
;

-- Jun 20, 2010 5:41:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2010-06-20 17:41:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=793
;

-- Jun 20, 2010 5:43:35 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Insurance Company',Updated=TO_TIMESTAMP('2010-06-20 17:43:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53622
;

-- Jun 20, 2010 5:43:35 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53622
;

-- Jun 20, 2010 5:43:35 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Insurance_Co', Name='Insurance Company', Description=NULL, Help=NULL WHERE AD_Element_ID=53622
;

-- Jun 20, 2010 5:43:35 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Insurance_Co', Name='Insurance Company', Description=NULL, Help=NULL, AD_Element_ID=53622 WHERE UPPER(ColumnName)='A_INSURANCE_CO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:43:35 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Insurance_Co', Name='Insurance Company', Description=NULL, Help=NULL WHERE AD_Element_ID=53622 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:43:35 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Insurance Company', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53622) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:43:35 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='A_Insurance_Co', Name='Insurance Company' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53622)
;

-- Jun 20, 2010 5:43:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET PrintName='Insurance Company',Updated=TO_TIMESTAMP('2010-06-20 17:43:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53622
;

-- Jun 20, 2010 5:43:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53622
;

-- Jun 20, 2010 5:43:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Insurance Company', Name='Insurance Company' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53622)
;

-- Jun 20, 2010 5:44:20 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Policy No', PrintName='Asset Policy No',Updated=TO_TIMESTAMP('2010-06-20 17:44:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53620
;

-- Jun 20, 2010 5:44:20 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53620
;

-- Jun 20, 2010 5:44:20 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Policy_No', Name='Asset Policy No', Description=NULL, Help=NULL WHERE AD_Element_ID=53620
;

-- Jun 20, 2010 5:44:20 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Policy_No', Name='Asset Policy No', Description=NULL, Help=NULL, AD_Element_ID=53620 WHERE UPPER(ColumnName)='A_POLICY_NO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:44:20 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Policy_No', Name='Asset Policy No', Description=NULL, Help=NULL WHERE AD_Element_ID=53620 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:44:20 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Policy No', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53620) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:44:20 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Policy No', Name='Asset Policy No' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53620)
;

-- Jun 20, 2010 5:45:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Insurance Premium', PrintName='Asset Insurance Premium',Updated=TO_TIMESTAMP('2010-06-20 17:45:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53623
;

-- Jun 20, 2010 5:45:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53623
;

-- Jun 20, 2010 5:45:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Ins_Premium', Name='Asset Insurance Premium', Description=NULL, Help=NULL WHERE AD_Element_ID=53623
;

-- Jun 20, 2010 5:45:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Ins_Premium', Name='Asset Insurance Premium', Description=NULL, Help=NULL, AD_Element_ID=53623 WHERE UPPER(ColumnName)='A_INS_PREMIUM' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:45:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Ins_Premium', Name='Asset Insurance Premium', Description=NULL, Help=NULL WHERE AD_Element_ID=53623 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:45:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Insurance Premium', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53623) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:45:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Insurance Premium', Name='Asset Insurance Premium' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53623)
;

-- Jun 20, 2010 5:45:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Replace Cost', PrintName='Asset Replace Cost',Updated=TO_TIMESTAMP('2010-06-20 17:45:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53621
;

-- Jun 20, 2010 5:45:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53621
;

-- Jun 20, 2010 5:45:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Replace_Cost', Name='Asset Replace Cost', Description=NULL, Help=NULL WHERE AD_Element_ID=53621
;

-- Jun 20, 2010 5:45:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Replace_Cost', Name='Asset Replace Cost', Description=NULL, Help=NULL, AD_Element_ID=53621 WHERE UPPER(ColumnName)='A_REPLACE_COST' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:45:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Replace_Cost', Name='Asset Replace Cost', Description=NULL, Help=NULL WHERE AD_Element_ID=53621 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:45:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Replace Cost', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53621) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:45:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Replace Cost', Name='Asset Replace Cost' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53621)
;

-- Jun 20, 2010 5:46:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Insurance Value', PrintName='Asset Insurance Value',Updated=TO_TIMESTAMP('2010-06-20 17:46:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53619
;

-- Jun 20, 2010 5:46:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53619
;

-- Jun 20, 2010 5:46:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Ins_Value', Name='Asset Insurance Value', Description=NULL, Help=NULL WHERE AD_Element_ID=53619
;

-- Jun 20, 2010 5:46:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Ins_Value', Name='Asset Insurance Value', Description=NULL, Help=NULL, AD_Element_ID=53619 WHERE UPPER(ColumnName)='A_INS_VALUE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:46:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Ins_Value', Name='Asset Insurance Value', Description=NULL, Help=NULL WHERE AD_Element_ID=53619 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:46:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Insurance Value', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53619) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:46:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Insurance Value', Name='Asset Insurance Value' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53619)
;

-- Jun 20, 2010 5:48:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Tax Entity', PrintName='Asset Tax Entity',Updated=TO_TIMESTAMP('2010-06-20 17:48:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53591
;

-- Jun 20, 2010 5:48:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53591
;

-- Jun 20, 2010 5:48:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Tax_Entity', Name='Asset Tax Entity', Description=NULL, Help=NULL WHERE AD_Element_ID=53591
;

-- Jun 20, 2010 5:48:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Tax_Entity', Name='Asset Tax Entity', Description=NULL, Help=NULL, AD_Element_ID=53591 WHERE UPPER(ColumnName)='A_TAX_ENTITY' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:48:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Tax_Entity', Name='Asset Tax Entity', Description=NULL, Help=NULL WHERE AD_Element_ID=53591 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:48:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Tax Entity', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53591) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:48:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Tax Entity', Name='Asset Tax Entity' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53591)
;

-- Jun 20, 2010 5:48:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset New Used', PrintName='Asset New Used',Updated=TO_TIMESTAMP('2010-06-20 17:48:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53592
;

-- Jun 20, 2010 5:48:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53592
;

-- Jun 20, 2010 5:48:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_New_Used', Name='Asset New Used', Description=NULL, Help=NULL WHERE AD_Element_ID=53592
;

-- Jun 20, 2010 5:48:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_New_Used', Name='Asset New Used', Description=NULL, Help=NULL, AD_Element_ID=53592 WHERE UPPER(ColumnName)='A_NEW_USED' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:48:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_New_Used', Name='Asset New Used', Description=NULL, Help=NULL WHERE AD_Element_ID=53592 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:48:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset New Used', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53592) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:48:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset New Used', Name='Asset New Used' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53592)
;

-- Jun 20, 2010 5:49:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Investment CR', PrintName='Asset Investment CR',Updated=TO_TIMESTAMP('2010-06-20 17:49:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53590
;

-- Jun 20, 2010 5:49:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53590
;

-- Jun 20, 2010 5:49:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Investment_CR', Name='Asset Investment CR', Description=NULL, Help=NULL WHERE AD_Element_ID=53590
;

-- Jun 20, 2010 5:49:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Investment_CR', Name='Asset Investment CR', Description=NULL, Help=NULL, AD_Element_ID=53590 WHERE UPPER(ColumnName)='A_INVESTMENT_CR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:49:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Investment_CR', Name='Asset Investment CR', Description=NULL, Help=NULL WHERE AD_Element_ID=53590 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:49:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Investment CR', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53590) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:49:21 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Investment CR', Name='Asset Investment CR' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53590)
;

-- Jun 20, 2010 5:49:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Info Tax', PrintName='Asset Info Tax',Updated=TO_TIMESTAMP('2010-06-20 17:49:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53589
;

-- Jun 20, 2010 5:49:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53589
;

-- Jun 20, 2010 5:49:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Asset_Info_Tax_ID', Name='Asset Info Tax', Description=NULL, Help=NULL WHERE AD_Element_ID=53589
;

-- Jun 20, 2010 5:49:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Info_Tax_ID', Name='Asset Info Tax', Description=NULL, Help=NULL, AD_Element_ID=53589 WHERE UPPER(ColumnName)='A_ASSET_INFO_TAX_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:49:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Info_Tax_ID', Name='Asset Info Tax', Description=NULL, Help=NULL WHERE AD_Element_ID=53589 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:49:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Info Tax', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=53589) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:49:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Info Tax', Name='Asset Info Tax' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=53589)
;

-- Jun 20, 2010 5:50:27 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET TabLevel=1,Updated=TO_TIMESTAMP('2010-06-20 17:50:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53164
;

-- Jun 20, 2010 5:50:30 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET TabLevel=1,Updated=TO_TIMESTAMP('2010-06-20 17:50:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53160
;

-- Jun 20, 2010 5:50:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET TabLevel=1,Updated=TO_TIMESTAMP('2010-06-20 17:50:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53155
;

-- Jun 20, 2010 5:50:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET TabLevel=1,Updated=TO_TIMESTAMP('2010-06-20 17:50:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53161
;

-- Jun 20, 2010 5:53:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Cost Change', PrintName='Asset Cost Change',Updated=TO_TIMESTAMP('2010-06-20 17:53:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54229
;

-- Jun 20, 2010 5:53:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=54229
;

-- Jun 20, 2010 5:53:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Asset_Cost_Change', Name='Asset Cost Change', Description=NULL, Help=NULL WHERE AD_Element_ID=54229
;

-- Jun 20, 2010 5:53:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Cost_Change', Name='Asset Cost Change', Description=NULL, Help=NULL, AD_Element_ID=54229 WHERE UPPER(ColumnName)='A_ASSET_COST_CHANGE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:53:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Cost_Change', Name='Asset Cost Change', Description=NULL, Help=NULL WHERE AD_Element_ID=54229 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:53:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Cost Change', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=54229) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:53:46 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Cost Change', Name='Asset Cost Change' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=54229)
;

-- Jun 20, 2010 5:54:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Asset Revaluation', PrintName='Asset Revaluation',Updated=TO_TIMESTAMP('2010-06-20 17:54:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54228
;

-- Jun 20, 2010 5:54:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=54228
;

-- Jun 20, 2010 5:54:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Asset_Reval_ID', Name='Asset Revaluation', Description=NULL, Help=NULL WHERE AD_Element_ID=54228
;

-- Jun 20, 2010 5:54:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Reval_ID', Name='Asset Revaluation', Description=NULL, Help=NULL, AD_Element_ID=54228 WHERE UPPER(ColumnName)='A_ASSET_REVAL_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:54:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Asset_Reval_ID', Name='Asset Revaluation', Description=NULL, Help=NULL WHERE AD_Element_ID=54228 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:54:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Asset Revaluation', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=54228) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:54:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Asset Revaluation', Name='Asset Revaluation' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=54228)
;

-- Jun 20, 2010 5:55:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET Name='Change Acumulated Depreciation', PrintName='Change Acumulated Depreciation',Updated=TO_TIMESTAMP('2010-06-20 17:55:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=54230
;

-- Jun 20, 2010 5:55:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=54230
;

-- Jun 20, 2010 5:55:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ColumnName='A_Change_Acumulated_Depr', Name='Change Acumulated Depreciation', Description=NULL, Help=NULL WHERE AD_Element_ID=54230
;

-- Jun 20, 2010 5:55:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Change_Acumulated_Depr', Name='Change Acumulated Depreciation', Description=NULL, Help=NULL, AD_Element_ID=54230 WHERE UPPER(ColumnName)='A_CHANGE_ACUMULATED_DEPR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Jun 20, 2010 5:55:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para SET ColumnName='A_Change_Acumulated_Depr', Name='Change Acumulated Depreciation', Description=NULL, Help=NULL WHERE AD_Element_ID=54230 AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:55:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Change Acumulated Depreciation', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=54230) AND IsCentrallyMaintained='Y'
;

-- Jun 20, 2010 5:55:07 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_PrintFormatItem SET PrintName='Change Acumulated Depreciation', Name='Change Acumulated Depreciation' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=54230)
;

-- Jun 20, 2010 5:55:36 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2010-06-20 17:55:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59284
;

-- Jun 20, 2010 5:55:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsDisplayed='N', IsReadOnly='Y',Updated=TO_TIMESTAMP('2010-06-20 17:55:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59285
;

-- Jun 20, 2010 5:55:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_TIMESTAMP('2010-06-20 17:55:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59284
;

-- Jun 20, 2010 5:56:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2010-06-20 17:56:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59283
;

-- Jun 20, 2010 5:56:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 17:56:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59286
;

-- Jun 20, 2010 5:56:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2010-06-20 17:56:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59287
;

-- Jun 20, 2010 5:57:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 17:57:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59287
;

-- Jun 20, 2010 5:57:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 17:57:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59286
;

-- Jun 20, 2010 5:59:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2010-06-20 17:59:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59138
;

-- Jun 20, 2010 6:00:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2010-06-20 18:00:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59137
;

-- Jun 20, 2010 6:00:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 18:00:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59138
;

-- Jun 20, 2010 6:00:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=59138
;

-- Jun 20, 2010 6:00:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=59137
;

-- Jun 20, 2010 6:00:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=59139
;

-- Jun 20, 2010 6:00:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=59397
;

-- Jun 20, 2010 6:00:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=59137
;

-- Jun 20, 2010 6:01:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 18:01:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59137
;

-- Jun 20, 2010 6:01:20 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2010-06-20 18:01:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59137
;

-- Jun 20, 2010 6:01:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 18:01:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59140
;

-- Jun 20, 2010 6:01:27 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2010-06-20 18:01:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59141
;

-- Jun 20, 2010 6:01:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 18:01:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59397
;

-- Jun 20, 2010 6:03:11 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2010-06-20 18:03:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59395
;

-- Jun 20, 2010 6:03:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=59402
;

-- Jun 20, 2010 6:03:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=59141
;

-- Jun 20, 2010 6:03:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=59398
;

-- Jun 20, 2010 6:03:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=59399
;

-- Jun 20, 2010 6:03:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=59400
;

-- Jun 20, 2010 6:03:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=59401
;

-- Jun 20, 2010 6:04:00 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 18:04:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59141
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=59142
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=59401
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=59399
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=59400
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=59404
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=59405
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=59406
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=59407
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=59408
;

-- Jun 20, 2010 6:04:33 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=59409
;

-- Jun 20, 2010 6:04:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 18:04:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59401
;

-- Jun 20, 2010 6:05:32 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 18:05:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59404
;

-- Jun 20, 2010 6:05:38 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 18:05:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59405
;

-- Jun 20, 2010 6:05:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=59405
;

-- Jun 20, 2010 6:05:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=59398
;

-- Jun 20, 2010 6:05:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=59401
;

-- Jun 20, 2010 6:05:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=59399
;

-- Jun 20, 2010 6:05:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=59400
;

-- Jun 20, 2010 6:05:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=59403
;

-- Jun 20, 2010 6:05:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=59404
;

-- Jun 20, 2010 6:06:25 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 18:06:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59408
;

-- Jun 20, 2010 6:06:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2010-06-20 18:06:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59406
;

-- Jun 20, 2010 6:06:38 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=59408
;

-- Jun 20, 2010 6:06:38 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=59407
;

-- Jun 20, 2010 6:07:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2010-06-20 18:07:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59407
;

-- Jun 20, 2010 6:07:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2010-06-20 18:07:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59409
;

-- Jun 20, 2010 6:09:16 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=59224
;

-- Jun 20, 2010 6:09:16 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=59225
;

-- Jun 20, 2010 6:09:16 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=59226
;

-- Jun 20, 2010 6:09:16 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=59227
;

-- Jun 20, 2010 6:09:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 18:09:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59226
;

-- Jun 20, 2010 6:09:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2010-06-20 18:09:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59225
;

-- Jun 20, 2010 6:09:52 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101, IsSameLine='N',Updated=TO_TIMESTAMP('2010-06-20 18:09:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59227
;

-- Jun 20, 2010 6:09:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 18:09:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59226
;

-- Jun 20, 2010 6:10:02 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2010-06-20 18:10:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59225
;

-- Jun 20, 2010 6:10:52 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2010-06-20 18:10:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=55794
;

-- Jun 20, 2010 6:11:35 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-06-20 18:11:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59244
;

-- Jun 20, 2010 6:11:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=59248
;

-- Jun 20, 2010 6:11:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=59245
;

-- Jun 20, 2010 6:11:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=59246
;

-- Jun 20, 2010 6:11:42 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=59247
;

-- Jun 20, 2010 6:12:20 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2010-06-20 18:12:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53329
;

-- Jun 20, 2010 6:12:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2010-06-20 18:12:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53330
;

-- Jun 20, 2010 6:14:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process SET AccessLevel='3', Name='Asset Parent Report',Updated=TO_TIMESTAMP('2010-06-20 18:14:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53115
;

-- Jun 20, 2010 6:14:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=53115
;

-- Jun 20, 2010 6:14:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu SET Description=NULL, IsActive='Y', Name='Asset Parent Report',Updated=TO_TIMESTAMP('2010-06-20 18:14:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=53156
;

-- Jun 20, 2010 6:14:50 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=53156
;

-- Jun 20, 2010 6:15:06 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process SET Name='Asset Group Defaults',Updated=TO_TIMESTAMP('2010-06-20 18:15:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53131
;

-- Jun 20, 2010 6:15:06 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=53131
;

-- Jun 20, 2010 6:15:06 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu SET Description='Lists Asset Group Settings & Defaults', IsActive='Y', Name='Asset Group Defaults',Updated=TO_TIMESTAMP('2010-06-20 18:15:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=53162
;

-- Jun 20, 2010 6:15:06 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=53162
;

-- Jun 20, 2010 6:15:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process SET AccessLevel='3',Updated=TO_TIMESTAMP('2010-06-20 18:15:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53131
;

-- Jun 20, 2010 6:15:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process SET Name='Depreciation Table',Updated=TO_TIMESTAMP('2010-06-20 18:15:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53117
;

-- Jun 20, 2010 6:15:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=53117
;

-- Jun 20, 2010 6:15:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu SET Description=NULL, IsActive='Y', Name='Depreciation Table',Updated=TO_TIMESTAMP('2010-06-20 18:15:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=53157
;

-- Jun 20, 2010 6:15:28 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=53157
;

-- Jun 20, 2010 6:15:41 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process SET AccessLevel='3',Updated=TO_TIMESTAMP('2010-06-20 18:15:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53117
;

-- Jun 20, 2010 6:16:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process SET Name='Asset Convention Report',Updated=TO_TIMESTAMP('2010-06-20 18:16:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53125
;

-- Jun 20, 2010 6:16:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=53125
;

-- Jun 20, 2010 6:16:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu SET Description='Asset Convention Report', IsActive='Y', Name='Asset Convention Report',Updated=TO_TIMESTAMP('2010-06-20 18:16:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=53160
;

-- Jun 20, 2010 6:16:08 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=53160
;

-- Jun 20, 2010 6:16:12 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process SET AccessLevel='3',Updated=TO_TIMESTAMP('2010-06-20 18:16:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53125
;

-- Jun 20, 2010 6:16:38 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process SET AccessLevel='3', Name='Asset Depreciation Method',Updated=TO_TIMESTAMP('2010-06-20 18:16:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53121
;

-- Jun 20, 2010 6:16:38 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=53121
;

-- Jun 20, 2010 6:16:38 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu SET Description='List Depreciation Methods', IsActive='Y', Name='Asset Depreciation Method',Updated=TO_TIMESTAMP('2010-06-20 18:16:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=53159
;

-- Jun 20, 2010 6:16:38 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=53159
;

-- Jun 20, 2010 6:16:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process SET Name='Depreciation Calculation Methods',Updated=TO_TIMESTAMP('2010-06-20 18:16:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53129
;

-- Jun 20, 2010 6:16:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=53129
;

-- Jun 20, 2010 6:16:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu SET Description='List Depreciation Calculation Methods Available', IsActive='Y', Name='Depreciation Calculation Methods',Updated=TO_TIMESTAMP('2010-06-20 18:16:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=53161
;

-- Jun 20, 2010 6:16:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=53161
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53163
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53135
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53155
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53273
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53278
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53274
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53280
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53151
;

-- Jun 20, 2010 6:17:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53277
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53163
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53135
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53155
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53273
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53278
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53274
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53280
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53151
;

-- Jun 20, 2010 6:18:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53277
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53163
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53135
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53155
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53273
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53278
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53274
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53280
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53151
;

-- Jun 20, 2010 6:18:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53277
;

-- Jun 20, 2010 6:19:22 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53163
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53135
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53278
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53155
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53273
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53278
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53274
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53280
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53151
;

-- Jun 20, 2010 6:19:23 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53277
;

-- Jun 20, 2010 6:19:27 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53278
;

-- Jun 20, 2010 6:19:27 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53137
;

-- Jun 20, 2010 6:19:27 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53138
;

-- Jun 20, 2010 6:19:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53280
;

-- Jun 20, 2010 6:19:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53154
;

-- Jun 20, 2010 6:19:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53153
;

-- Jun 20, 2010 6:19:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53150
;

-- Jun 20, 2010 6:19:45 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53152
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53273
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53144
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53148
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53147
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53146
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53143
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53140
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53145
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53142
;

-- Jun 20, 2010 6:20:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53141
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53273
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53274
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53144
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53148
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53147
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53146
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53143
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53140
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53145
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53142
;

-- Jun 20, 2010 6:20:18 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53141
;

-- Jun 20, 2010 6:20:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53280
;

-- Jun 20, 2010 6:20:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53154
;

-- Jun 20, 2010 6:20:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53153
;

-- Jun 20, 2010 6:20:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53151
;

-- Jun 20, 2010 6:20:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53150
;

-- Jun 20, 2010 6:20:31 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53152
;

-- Jun 20, 2010 6:20:34 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53280
;

-- Jun 20, 2010 6:20:34 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53151
;

-- Jun 20, 2010 6:20:34 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53154
;

-- Jun 20, 2010 6:20:34 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53153
;

-- Jun 20, 2010 6:20:34 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53151
;

-- Jun 20, 2010 6:20:34 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53150
;

-- Jun 20, 2010 6:20:34 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53149, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53152
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53163
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53135
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53155
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:20:49 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53277
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53163
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53135
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53155
;

-- Jun 20, 2010 6:20:56 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53277
;

-- Jun 20, 2010 6:20:59 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53278
;

-- Jun 20, 2010 6:20:59 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53137
;

-- Jun 20, 2010 6:20:59 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:20:59 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53138
;

-- Jun 20, 2010 6:21:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53278
;

-- Jun 20, 2010 6:21:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53137
;

-- Jun 20, 2010 6:21:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53138
;

-- Jun 20, 2010 6:21:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53275
;

-- Jun 20, 2010 6:21:01 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53136, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53138
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53273
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53274
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53277
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53144
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53148
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53147
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53146
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53143
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53140
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53145
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53142
;

-- Jun 20, 2010 6:21:15 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53139, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53141
;

-- Jun 20, 2010 6:21:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:21:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:21:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:21:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:21:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53163
;

-- Jun 20, 2010 6:21:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53135
;

-- Jun 20, 2010 6:21:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53155
;

-- Jun 20, 2010 6:21:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:21:43 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:21:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:21:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:21:55 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:21:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:21:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:21:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:21:57 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:22:00 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:22:00 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:22:00 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:22:00 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:22:00 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:22:02 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:22:02 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:22:02 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:22:02 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:22:02 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:22:02 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53163
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53135
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53155
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=218
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=153
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=263
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=166
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=203
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53242
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=236
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=183
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=160
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=278
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=345
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53014
;

-- Jun 20, 2010 6:22:44 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53108
;

-- Jun 20, 2010 6:22:51 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53163
;

-- Jun 20, 2010 6:22:51 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53135
;

-- Jun 20, 2010 6:22:51 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53134, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53155
;

-- Jun 20, 2010 6:22:51 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:22:51 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:22:51 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:22:51 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:22:51 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:22:51 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=431
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=430
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=474
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=400
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=399
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=348
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:22:54 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=431
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=430
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=474
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=400
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=399
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=348
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:24:05 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=431
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=430
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=474
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=400
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=399
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=348
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:25:04 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:25:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:25:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=431
;

-- Jun 20, 2010 6:25:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=430
;

-- Jun 20, 2010 6:25:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=474
;

-- Jun 20, 2010 6:25:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=400
;

-- Jun 20, 2010 6:25:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=399
;

-- Jun 20, 2010 6:25:10 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=53133, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=348
;

-- Jun 20, 2010 6:25:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=342
;

-- Jun 20, 2010 6:25:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=343
;

-- Jun 20, 2010 6:25:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53276
;

-- Jun 20, 2010 6:25:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53279
;

-- Jun 20, 2010 6:25:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53133
;

-- Jun 20, 2010 6:25:14 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=345, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53134
;

-- Jun 20, 2010 6:25:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu SET Description='Asset Type',Updated=TO_TIMESTAMP('2010-06-20 18:25:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=53279
;

-- Jun 20, 2010 6:25:26 PM CDT
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=53279
;

