-- <Migration ID="da0c22fd-c0c1-427f-87b6-d1c65b5f7ce1" />
GO

PRINT N'Dropping constraints from [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] DROP CONSTRAINT [PK__demotabl__977B80755E2EBDD1]
GO
PRINT N'Dropping index [IX_DMSSTAT_RSTATS] from [dbo].[DMSSTAT_RSTATS]'
GO
DROP INDEX [IX_DMSSTAT_RSTATS] ON [dbo].[DMSSTAT_RSTATS]
GO
PRINT N'Dropping index [IX_DMSSTAT_TSTATS_A] from [dbo].[DMSSTAT_TSTATS]'
GO
DROP INDEX [IX_DMSSTAT_TSTATS_A] ON [dbo].[DMSSTAT_TSTATS]
GO
PRINT N'Dropping [dbo].[DMSSTAT_TSTATS]'
GO
DROP TABLE [dbo].[DMSSTAT_TSTATS]
GO
PRINT N'Dropping [dbo].[DMSSTAT_RSTATS]'
GO
DROP TABLE [dbo].[DMSSTAT_RSTATS]
GO
PRINT N'Creating [dbo].[BairdSector]'
GO
CREATE TABLE [dbo].[BairdSectorHistory]
(
[BairdSectorId] [int] NOT NULL,
[BairdSector1] [varchar] (40) NOT NULL,
[BairdSector2] [varchar] (40) NOT NULL,
[BairdSector3] [varchar] (40) NULL,
[BairdSector4] [varchar] (40) NULL,
[BairdSector5] [varchar] (40) NULL,
[ValidFrom] [datetime2] NOT NULL,
[ValidTo] [datetime2] NOT NULL,
[TreasuryFlag] [bit] NOT NULL,
[CreditFlag] [bit] NOT NULL,
[SecuritizedFlag] [bit] NOT NULL,
[NonAgencyRmbsFlag] [bit] NOT NULL,
[ModifiedDurationFlag] [bit] NOT NULL,
[IsPartial] [bit] NOT NULL,
[MuniFlag] [bit] NOT NULL
)
GO
PRINT N'Creating index [ix_BairdSectorHistory] on [dbo].[BairdSectorHistory]'
GO
CREATE CLUSTERED INDEX [ix_BairdSectorHistory] ON [dbo].[BairdSectorHistory] ([ValidTo], [ValidFrom])
GO
CREATE TABLE [dbo].[BairdSector]
(
[BairdSectorId] [int] NOT NULL IDENTITY(1, 1),
[BairdSector1] [varchar] (40) NOT NULL,
[BairdSector2] [varchar] (40) NOT NULL,
[BairdSector3] [varchar] (40) NULL,
[BairdSector4] [varchar] (40) NULL,
[BairdSector5] [varchar] (40) NULL,
[ValidFrom] [datetime2] GENERATED ALWAYS AS ROW START NOT NULL CONSTRAINT [DF_BairdSector_ValidFrom] DEFAULT (getutcdate()),
[ValidTo] [datetime2] GENERATED ALWAYS AS ROW END NOT NULL CONSTRAINT [DF_BairdSector_ValidTo] DEFAULT ('9999-12-31 23:59:59.9999999'),
[TreasuryFlag] [bit] NOT NULL,
[CreditFlag] [bit] NOT NULL,
[SecuritizedFlag] [bit] NOT NULL,
[NonAgencyRmbsFlag] [bit] NOT NULL,
[ModifiedDurationFlag] [bit] NOT NULL CONSTRAINT [DF_BairdSector_ModifiedDurationFlag] DEFAULT ((0)),
[IsPartial] [bit] NOT NULL CONSTRAINT [DF_BairdSector_IsPartial] DEFAULT ((0)),
[MuniFlag] [bit] NOT NULL CONSTRAINT [DF_BairdSector_MuniFlag] DEFAULT ((0)),
PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo),
CONSTRAINT [PK_BairdSector] PRIMARY KEY CLUSTERED  ([BairdSectorId])
)
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[BairdSectorHistory])
)
GO
PRINT N'Creating index [IX_BairdSector_BairdSectorId_Flags] on [dbo].[BairdSector]'
GO
CREATE NONCLUSTERED INDEX [IX_BairdSector_BairdSectorId_Flags] ON [dbo].[BairdSector] ([BairdSectorId]) INCLUDE ([CreditFlag], [NonAgencyRmbsFlag], [SecuritizedFlag], [TreasuryFlag])
GO
PRINT N'Altering [dbo].[WidgetPurchases]'
GO
ALTER TABLE [dbo].[WidgetPurchases] DROP
COLUMN [Last_Changed_By]
GO
PRINT N'Altering [dbo].[Customer]'
GO
ALTER TABLE [dbo].[Customer] ADD
[LastChangedBy] [date] NULL,
[CustomerNotes] [nvarchar] (200) NULL,
[Notes] [nvarchar] (200) NULL
GO
PRINT N'Altering [dbo].[PersonTest]'
GO
ALTER TABLE [dbo].[PersonTest] ADD
[Address1] [nvarchar] (50) NULL
GO
PRINT N'Creating [dbo].[ObjectDemo]'
GO
CREATE TABLE [dbo].[ObjectDemo]
(
[DemoId] [bigint] NOT NULL,
[DemoFName] [nvarchar] (25) NULL,
[DemoLName] [nvarchar] (25) NULL,
[ObjectNotes] [nvarchar] (1000) NULL
)
GO
PRINT N'Creating primary key [PK__ObjectDe__977B8075D47C7A7C] on [dbo].[ObjectDemo]'
GO
ALTER TABLE [dbo].[ObjectDemo] ADD CONSTRAINT [PK__ObjectDe__977B8075D47C7A7C] PRIMARY KEY CLUSTERED  ([DemoId])
GO
PRINT N'Creating [dbo].[DemoTable1]'
GO
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
PRINT N'Creating primary key [PK__DemoTabl__0B285DB0F0446D7E] on [dbo].[DemoTable1]'
GO
ALTER TABLE [dbo].[DemoTable1] ADD CONSTRAINT [PK__DemoTabl__0B285DB0F0446D7E] PRIMARY KEY CLUSTERED  ([demoId])
GO
PRINT N'Altering [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] ADD
[NewCol] [int] NULL
GO
ALTER TABLE [dbo].[demotable] DROP
COLUMN [DemoDescription],
COLUMN [FirstName],
COLUMN [DemoDate],
COLUMN [DemoAddress],
COLUMN [ModifiedDate],
COLUMN [LastModifiedBy],
COLUMN [TableDescription]
GO
EXEC sp_rename N'[dbo].[demotable].[DemoId]', N'TableId', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[demotable].[DemoAddress2]', N'TableName', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[demotable].[LastName]', N'TableDesc', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[demotable].[DemoFeedback]', N'RedgateEmailAddress', N'COLUMN'
GO
ALTER TABLE [dbo].[demotable] ALTER COLUMN [DemoNotes] [nvarchar] (1000) NULL
GO
PRINT N'Creating primary key [PK__demotabl__7D5F01EE9AAD425A] on [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] ADD CONSTRAINT [PK__demotabl__7D5F01EE9AAD425A] PRIMARY KEY CLUSTERED  ([TableId])
GO
PRINT N'Altering [dbo].[ObjectTest]'
GO
ALTER TABLE [dbo].[ObjectTest] ADD
[DateModified] [datetime2] NULL,
[LinkedInID] [int] NULL
GO
ALTER TABLE [dbo].[ObjectTest] DROP
COLUMN [ObjectDesc],
COLUMN [ObjectAdd],
COLUMN [TestDescription]
GO
PRINT N'Creating [dbo].[NewTestObject]'
GO
CREATE TABLE [dbo].[NewTestObject]
(
[objectId] [bigint] NOT NULL,
[objectDescription] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__NewTestO__5243E26A30FCE0CA] on [dbo].[NewTestObject]'
GO
ALTER TABLE [dbo].[NewTestObject] ADD CONSTRAINT [PK__NewTestO__5243E26A30FCE0CA] PRIMARY KEY CLUSTERED  ([objectId])
GO
PRINT N'Altering [dbo].[customersDemo]'
GO
ALTER TABLE [dbo].[customersDemo] ADD
[CustomerNotes] [nvarchar] (200) NULL,
[LinkedInURL] [nvarchar] (50) NULL,
[OrkutID] [int] NULL
GO
PRINT N'Creating [dbo].[ObjectTest2]'
GO
CREATE TABLE [dbo].[ObjectTest2]
(
[ObjectId] [bigint] NOT NULL,
[ObjectDescription] [nvarchar] (25) NULL
)
GO
PRINT N'Creating primary key [PK__ObjectTe__9A6192912603B78D] on [dbo].[ObjectTest2]'
GO
ALTER TABLE [dbo].[ObjectTest2] ADD CONSTRAINT [PK__ObjectTe__9A6192912603B78D] PRIMARY KEY CLUSTERED  ([ObjectId])
GO
PRINT N'Creating [dbo].[DemoTest2]'
GO
CREATE TABLE [dbo].[DemoTest2]
(
[DemoId] [bigint] NOT NULL,
[DemoDescrip] [nvarchar] (50) NULL,
[RedgateId] [int] NULL,
[LinkedInId] [int] NULL,
[RedgateEmail] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__DemoTest__977B80751365E757] on [dbo].[DemoTest2]'
GO
ALTER TABLE [dbo].[DemoTest2] ADD CONSTRAINT [PK__DemoTest__977B80751365E757] PRIMARY KEY CLUSTERED  ([DemoId])
GO
PRINT N'Creating [dbo].[WidgetTest]'
GO
CREATE TABLE [dbo].[WidgetTest]
(
[WidgetId] [bigint] NOT NULL,
[WidgetDesc] [nvarchar] (25) NULL,
[WidgetName] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__WidgetTe__ADFD3012D69AD3E3] on [dbo].[WidgetTest]'
GO
ALTER TABLE [dbo].[WidgetTest] ADD CONSTRAINT [PK__WidgetTe__ADFD3012D69AD3E3] PRIMARY KEY CLUSTERED  ([WidgetId])
GO
