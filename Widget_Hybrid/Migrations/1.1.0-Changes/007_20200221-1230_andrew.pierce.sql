-- <Migration ID="2c9da8a4-de1d-4ee7-902e-eccf797ddd3d" />
GO

PRINT N'Altering [dbo].[customersDemo]'
GO
ALTER TABLE [dbo].[customersDemo] ADD
[AzureEnvironmentName] [nvarchar] (50) NULL,
[RedgateID] [int] NULL,
[RedgateUserName] [nvarchar] (50) NULL
GO

UPDATE dbo.customersDemo SET AzureEnvironmentName = 'Default' 
GO

