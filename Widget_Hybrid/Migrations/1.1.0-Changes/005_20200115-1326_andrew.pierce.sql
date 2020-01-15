-- <Migration ID="7d72f825-90ec-4cec-adfb-be60ceb43ae8" />
GO

PRINT N'Altering [dbo].[customersDemo]'
GO
ALTER TABLE [dbo].[customersDemo] ADD
[AzureEnvironmentID] [int] NULL
GO
