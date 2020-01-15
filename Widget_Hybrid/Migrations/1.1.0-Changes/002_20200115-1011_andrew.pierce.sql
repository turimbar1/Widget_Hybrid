-- <Migration ID="bb58fa00-b7de-40ec-bbcb-84848271bd16" />
GO

PRINT N'Dropping constraints from [dbo].[NewTestObject]'
GO
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__NewTestO__5243E26A30FCE0CA]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[NewTestObject]', 'U'))
ALTER TABLE [dbo].[NewTestObject] DROP CONSTRAINT [PK__NewTestO__5243E26A30FCE0CA]
GO
PRINT N'Dropping constraints from [dbo].[ObjectDemo]'
GO
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__ObjectDe__977B8075D47C7A7C]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[ObjectDemo]', 'U'))
ALTER TABLE [dbo].[ObjectDemo] DROP CONSTRAINT [PK__ObjectDe__977B8075D47C7A7C]
GO
PRINT N'Dropping constraints from [dbo].[ObjectTest2]'
GO
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__ObjectTe__9A6192912603B78D]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[ObjectTest2]', 'U'))
ALTER TABLE [dbo].[ObjectTest2] DROP CONSTRAINT [PK__ObjectTe__9A6192912603B78D]
GO
PRINT N'Dropping constraints from [dbo].[WidgetTest]'
GO
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__WidgetTe__ADFD3012D69AD3E3]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[WidgetTest]', 'U'))
ALTER TABLE [dbo].[WidgetTest] DROP CONSTRAINT [PK__WidgetTe__ADFD3012D69AD3E3]
GO
PRINT N'Dropping constraints from [dbo].[demotable]'
GO
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__demotabl__7D5F01EE9AAD425A]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[demotable]', 'U'))
ALTER TABLE [dbo].[demotable] DROP CONSTRAINT [PK__demotabl__7D5F01EE9AAD425A]
GO
PRINT N'Dropping [dbo].[WidgetTest]'
GO
IF OBJECT_ID(N'[dbo].[WidgetTest]', 'U') IS NOT NULL
DROP TABLE [dbo].[WidgetTest]
GO
PRINT N'Dropping [dbo].[ObjectTest2]'
GO
IF OBJECT_ID(N'[dbo].[ObjectTest2]', 'U') IS NOT NULL
DROP TABLE [dbo].[ObjectTest2]
GO
PRINT N'Dropping [dbo].[NewTestObject]'
GO
IF OBJECT_ID(N'[dbo].[NewTestObject]', 'U') IS NOT NULL
DROP TABLE [dbo].[NewTestObject]
GO
PRINT N'Dropping [dbo].[ObjectDemo]'
GO
IF OBJECT_ID(N'[dbo].[ObjectDemo]', 'U') IS NOT NULL
DROP TABLE [dbo].[ObjectDemo]
GO
PRINT N'Altering [dbo].[WidgetPurchases]'
GO
IF COL_LENGTH(N'[dbo].[WidgetPurchases]', N'Last_Changed_By') IS NULL
ALTER TABLE [dbo].[WidgetPurchases] ADD[Last_Changed_By] [nvarchar] (50) NULL
GO
PRINT N'Altering [dbo].[demotable]'
GO
IF COL_LENGTH(N'[dbo].[demotable]', N'FirstName') IS NULL
ALTER TABLE [dbo].[demotable] ADD[FirstName] [nvarchar] (30) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'LastName') IS NULL
ALTER TABLE [dbo].[demotable] ADD[LastName] [nvarchar] (50) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'DemoDate') IS NULL
ALTER TABLE [dbo].[demotable] ADD[DemoDate] [datetime] NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'DemoAddress') IS NULL
ALTER TABLE [dbo].[demotable] ADD[DemoAddress] [nvarchar] (50) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'ModifiedDate') IS NULL
ALTER TABLE [dbo].[demotable] ADD[ModifiedDate] [date] NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'LastModifiedBy') IS NULL
ALTER TABLE [dbo].[demotable] ADD[LastModifiedBy] [nvarchar] (15) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'TableDescription') IS NULL
ALTER TABLE [dbo].[demotable] ADD[TableDescription] [nvarchar] (1000) NULL
GO
IF COL_LENGTH(N'[dbo].[demotable]', N'NewCol') IS NOT NULL
ALTER TABLE [dbo].[demotable] DROP COLUMN [NewCol]
GO
IF (COL_LENGTH(N'[dbo].[demotable]', N'TableId') IS NOT NULL) AND (COL_LENGTH(N'[dbo].[demotable]', N'DemoId') IS NULL)
EXEC sp_rename N'[dbo].[demotable].[TableId]', N'DemoId', N'COLUMN'
GO
IF (COL_LENGTH(N'[dbo].[demotable]', N'TableDesc') IS NOT NULL) AND (COL_LENGTH(N'[dbo].[demotable]', N'DemoDescription') IS NULL)
EXEC sp_rename N'[dbo].[demotable].[TableDesc]', N'DemoDescription', N'COLUMN'
GO
IF (COL_LENGTH(N'[dbo].[demotable]', N'TableName') IS NOT NULL) AND (COL_LENGTH(N'[dbo].[demotable]', N'DemoAddress2') IS NULL)
EXEC sp_rename N'[dbo].[demotable].[TableName]', N'DemoAddress2', N'COLUMN'
GO
IF (COL_LENGTH(N'[dbo].[demotable]', N'RedgateEmailAddress') IS NOT NULL) AND (COL_LENGTH(N'[dbo].[demotable]', N'DemoFeedback') IS NULL)
EXEC sp_rename N'[dbo].[demotable].[RedgateEmailAddress]', N'DemoFeedback', N'COLUMN'
GO
ALTER TABLE [dbo].[demotable] ALTER COLUMN [DemoNotes] [nvarchar] (50) NULL
GO
PRINT N'Creating primary key [PK__demotabl__977B80755E2EBDD1] on [dbo].[demotable]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__demotabl__977B80755E2EBDD1]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[demotable]', 'U'))
ALTER TABLE [dbo].[demotable] ADD CONSTRAINT [PK__demotabl__977B80755E2EBDD1] PRIMARY KEY CLUSTERED  ([DemoId])
GO
PRINT N'Altering [dbo].[DemoTest2]'
GO
IF COL_LENGTH(N'[dbo].[DemoTest2]', N'AzureID') IS NULL
ALTER TABLE [dbo].[DemoTest2] ADD[AzureID] [int] NULL
IF COL_LENGTH(N'[dbo].[DemoTest2]', N'AzureUser') IS NULL
ALTER TABLE [dbo].[DemoTest2] ADD[AzureUser] [int] NULL
GO
PRINT N'Altering [dbo].[customersDemo]'
GO
IF COL_LENGTH(N'[dbo].[customersDemo]', N'CustomerNotes') IS NOT NULL
ALTER TABLE [dbo].[customersDemo] DROP COLUMN [CustomerNotes]
IF COL_LENGTH(N'[dbo].[customersDemo]', N'LinkedInURL') IS NOT NULL
ALTER TABLE [dbo].[customersDemo] DROP COLUMN [LinkedInURL]
IF COL_LENGTH(N'[dbo].[customersDemo]', N'OrkutID') IS NOT NULL
ALTER TABLE [dbo].[customersDemo] DROP COLUMN [OrkutID]
GO
