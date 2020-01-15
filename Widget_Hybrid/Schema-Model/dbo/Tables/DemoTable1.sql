CREATE TABLE [dbo].[DemoTable1]
(
[demoId] [bigint] NOT NULL,
[demoName] [nvarchar] (25) NULL,
[demdesc] [nvarchar] (50) NULL,
[demoDate] [datetime2] NULL,
[Address2] [nvarchar] (200) NULL,
[column_name] [int] NULL,
[RedgatID] [int] NULL,
[UserName] [nvarchar] (100) NULL,
[AzureID] [int] NULL
)
GO
ALTER TABLE [dbo].[DemoTable1] ADD CONSTRAINT [PK__DemoTabl__0B285DB0F0446D7E] PRIMARY KEY CLUSTERED  ([demoId])
GO
