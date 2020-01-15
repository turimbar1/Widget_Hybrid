CREATE TABLE [dbo].[DM_INVOICE]
(
[invoice_number] [varchar] (10) NOT NULL,
[invoice_date] [datetime] NULL,
[invoice_customer_id] [varchar] (60) NULL
)
GO
ALTER TABLE [dbo].[DM_INVOICE] ADD CONSTRAINT [PK__DM_INVOI__8081A63B4A21B92F] PRIMARY KEY CLUSTERED  ([invoice_number])
GO
