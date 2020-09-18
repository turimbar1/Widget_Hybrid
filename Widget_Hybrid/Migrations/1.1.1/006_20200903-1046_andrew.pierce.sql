-- <Migration ID="5b345ef1-dcdc-49ae-86df-c2a89216555b" />
GO

PRINT N'Altering [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] ADD
[DemoName] [nvarchar] (25) NULL,
[DemoName2] [nvarchar] (50) NULL
GO
/*
* Use this Post-Deployment script to perform tasks after the deployment of the project.
* Read more at https://www.red-gate.com/SOC7/post-deployment-script-help
*/
UPDATE dbo.demotable SET ChromeUser = 'Default'
GO
