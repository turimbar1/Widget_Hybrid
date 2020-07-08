-- <Migration ID="09ce1d47-ffb0-45fe-80f4-ffc997b77a28" />
GO

PRINT N'Altering [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] ADD
[ChromeUser] [nvarchar] (50) NULL,
[ChromeUserID] [int] NULL,
[NikeID] [int] NULL,
[demoDate2] [datetime2] NULL,
[AzureUserDescription] [nvarchar] (250) NULL
GO
/*
* Use this Post-Deployment script to perform tasks after the deployment of the project.
* Read more at https://www.red-gate.com/SOC7/post-deployment-script-help
*/
UPDATE dbo.demotable SET ChromeUser = 'Default'
GO
