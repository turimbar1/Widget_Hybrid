CREATE TABLE [dbo].[DM_CUSTOMER_NOTES]
(
[customer_id] [varchar] (10) NOT NULL,
[customer_firstname] [varchar] (60) NULL,
[customer_lastname] [varchar] (60) NULL,
[customer_notes_entry_date] [datetime] NOT NULL,
[customer_note] [varchar] (2000) NULL
)
GO
CREATE UNIQUE NONCLUSTERED INDEX [cnInd1] ON [dbo].[DM_CUSTOMER_NOTES] ([customer_id], [customer_notes_entry_date])
GO
ALTER TABLE [dbo].[DM_CUSTOMER_NOTES] ADD CONSTRAINT [CN_FK] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[DM_CUSTOMER] ([customer_id])
GO
