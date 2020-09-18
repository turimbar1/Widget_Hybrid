-- <Migration ID="cc39d545-5b22-44ff-bda3-6576f37df8d2" />
GO

PRINT N'Altering [dbo].[DemoTest2]'
GO
EXEC sp_rename N'[dbo].[DemoTest2].[AzureUser]', N'AzureUserNew', N'COLUMN'
GO
/*
* Use this Post-Deployment script to perform tasks after the deployment of the project.
* Read more at https://www.red-gate.com/SOC7/post-deployment-script-help
*/
UPDATE dbo.demotable SET ChromeUser = 'Default'
GO
