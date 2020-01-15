CREATE TABLE [dbo].[Customer]
(
[CustId] [bigint] NOT NULL,
[CustFirstname] [nvarchar] (25) NULL,
[CustLastname] [nvarchar] (25) NULL,
[CustDescription] [nchar] (10) NULL,
[CustAddress] [nvarchar] (50) NULL,
[Last_Modified] [nvarchar] (50) NULL,
[Last_Changed_By] [nvarchar] (15) NULL,
[CustEmailAddress] [nvarchar] (25) NULL,
[LastChangedBy] [date] NULL,
[CustomerNotes] [nvarchar] (200) NULL,
[Notes] [nvarchar] (200) NULL
)
GO
ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [PK__Customer__049E3AA9B86CDE0B] PRIMARY KEY CLUSTERED  ([CustId])
GO
