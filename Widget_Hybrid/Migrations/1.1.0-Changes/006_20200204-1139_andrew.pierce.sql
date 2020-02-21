-- <Migration ID="19fb150f-47db-4ee0-8851-255917d205e0" />
GO

PRINT N'Altering [dbo].[PersonTest]'
GO
ALTER TABLE [dbo].[PersonTest] ADD
[AzureID] [int] NULL
GO
PRINT N'Altering [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] ADD
[AzureID] [int] NULL
GO
PRINT N'Altering [dbo].[customersDemo]'
GO
ALTER TABLE [dbo].[customersDemo] ADD
[AzureUsername] [nvarchar] (200) NULL
GO
