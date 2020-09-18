-- <Migration ID="b941ec6d-4fd0-4933-9042-47c28e27801d" />
GO

PRINT N'Altering [dbo].[HelloDemo]'
GO
ALTER TABLE [dbo].[HelloDemo] ADD
[AzureUser] [nvarchar] (50) NULL
GO
/*
* Use this Post-Deployment script to perform tasks after the deployment of the project.
* Read more at https://www.red-gate.com/SOC7/post-deployment-script-help
*/
UPDATE dbo.demotable SET ChromeUser = 'Default'
GO
