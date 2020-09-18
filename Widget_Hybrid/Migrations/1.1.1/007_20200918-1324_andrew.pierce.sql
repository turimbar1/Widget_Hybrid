-- <Migration ID="bd8647e3-70a4-4693-a3c2-94df135b3c3d" />
GO

PRINT N'Altering [dbo].[WidgetPrices]'
GO
ALTER TABLE [dbo].[WidgetPrices] DROP
COLUMN [Last_Modified]
GO
PRINT N'Altering [dbo].[WidgetPurchases]'
GO
ALTER TABLE [dbo].[WidgetPurchases] DROP
COLUMN [Last_Changed_By]
GO
PRINT N'Altering [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] ADD
[LinkedIN_ID] [int] NULL
GO
PRINT N'Altering [dbo].[PersonTest]'
GO
ALTER TABLE [dbo].[PersonTest] DROP
COLUMN [PersonDOB],
COLUMN [PersonAddress],
COLUMN [EmailAddress],
COLUMN [PersonState],
COLUMN [CountryCode],
COLUMN [LastModified],
COLUMN [LastModifiedBy],
COLUMN [Address1],
COLUMN [AzureID]
GO
PRINT N'Altering [dbo].[Widgets]'
GO
ALTER TABLE [dbo].[Widgets] DROP
COLUMN [Name]
GO
