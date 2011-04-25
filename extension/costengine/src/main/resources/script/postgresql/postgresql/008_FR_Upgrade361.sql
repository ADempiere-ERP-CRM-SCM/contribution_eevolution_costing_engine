-- Apr 24, 2011 3:16:35 PM MYT
-- Fixed Assets Upgrading
INSERT INTO t_alter_column values('c_invoice','IsFixedAssetInvoice','CHAR(1)',null,'NULL')
;

-- Apr 24, 2011 3:16:56 PM MYT
-- Fixed Assets Upgrading
INSERT INTO t_alter_column values('c_invoiceline','IsFixedAssetInvoice','CHAR(1)',null,'NULL')
;

-- Apr 24, 2011 3:20:11 PM MYT
-- Fixed Assets Upgrading
ALTER TABLE C_InvoiceLine ADD COLUMN IsFixedAssetInvoice CHAR(1) DEFAULT NULL CHECK (IsFixedAssetInvoice IN ('Y','N'))
;

-- Apr 24, 2011 3:20:47 PM MYT
-- Fixed Assets Upgrading
ALTER TABLE C_Invoice ADD COLUMN IsFixedAssetInvoice CHAR(1) DEFAULT NULL CHECK (IsFixedAssetInvoice IN ('Y','N'))
;

