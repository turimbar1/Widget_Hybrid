CREATE TABLE [dbo].[demotable]
(
[DemoId] [bigint] NOT NULL,
[DemoDescription] [nvarchar] (50) NULL,
[FirstName] [nvarchar] (30) NULL,
[LastName] [nvarchar] (50) NULL,
[DemoDate] [datetime] NULL,
[DemoAddress] [nvarchar] (50) NULL,
[ModifiedDate] [date] NULL,
[LastModifiedBy] [nvarchar] (15) NULL,
[DemoAddress2] [nvarchar] (25) NULL,
[DemoNotes] [nvarchar] (50) NULL,
[DemoFeedback] [nvarchar] (200) NULL,
[TableDescription] [nvarchar] (1000) NULL
)
GO
ALTER TABLE [dbo].[demotable] ADD CONSTRAINT [PK__demotabl__977B80755E2EBDD1] PRIMARY KEY CLUSTERED  ([DemoId])
GO
