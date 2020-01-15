-- <Migration ID="a9fb0ef8-bcc6-4fc4-93d7-c67478157d27" />
GO

PRINT N'Altering [dbo].[customersDemo]'
GO
ALTER TABLE [dbo].[customersDemo] ADD
[AzureEnvironment] [nvarchar] (200) NULL
GO

