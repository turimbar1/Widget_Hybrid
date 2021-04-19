-- <Migration ID="742dd45b-827a-4474-9bf0-7211ffcae2b9" />
GO

/*
* Use this Pre-Deployment script to perform tasks before the deployment of the project.
* Read more at https://www.red-gate.com/SOC7/pre-deployment-script-help
*/
GO
PRINT N'Altering [dbo].[demotable]'
GO
IF COL_LENGTH(N'[dbo].[demotable]', N'LinkedIn_Description') IS NULL
ALTER TABLE [dbo].[demotable] ADD[LinkedIn_Description] [nvarchar] (100) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'Redgate_ID') IS NULL
ALTER TABLE [dbo].[demotable] ADD[Redgate_ID] [nvarchar] (50) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'Redgate_pwd') IS NULL
ALTER TABLE [dbo].[demotable] ADD[Redgate_pwd] [nvarchar] (50) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'Apple_iD') IS NULL
ALTER TABLE [dbo].[demotable] ADD[Apple_iD] [nvarchar] (50) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'Apple_ID_PWD') IS NULL
ALTER TABLE [dbo].[demotable] ADD[Apple_ID_PWD] [nvarchar] (50) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'RG_ID') IS NULL
ALTER TABLE [dbo].[demotable] ADD[RG_ID] [nvarchar] (50) NULL
IF COL_LENGTH(N'[dbo].[demotable]', N'RG_ID2') IS NULL
ALTER TABLE [dbo].[demotable] ADD[RG_ID2] [nvarchar] (50) NULL
GO
IF (COL_LENGTH(N'[dbo].[demotable]', N'LinkedIN_ID') IS NOT NULL) AND (COL_LENGTH(N'[dbo].[demotable]', N'LinkedInID') IS NULL)
EXEC sp_rename N'[dbo].[demotable].[LinkedIN_ID]', N'LinkedInID', N'COLUMN'
GO
PRINT N'Altering [dbo].[ObjectTest]'
GO
IF COL_LENGTH(N'[dbo].[ObjectTest]', N'ObjectDesc') IS NULL
ALTER TABLE [dbo].[ObjectTest] ADD[ObjectDesc] [nvarchar] (50) NULL
IF COL_LENGTH(N'[dbo].[ObjectTest]', N'ObjectAdd') IS NULL
ALTER TABLE [dbo].[ObjectTest] ADD[ObjectAdd] [nvarchar] (50) NULL
IF COL_LENGTH(N'[dbo].[ObjectTest]', N'TestDescription') IS NULL
ALTER TABLE [dbo].[ObjectTest] ADD[TestDescription] [nvarchar] (50) NULL
GO
IF COL_LENGTH(N'[dbo].[ObjectTest]', N'DateModified') IS NOT NULL
ALTER TABLE [dbo].[ObjectTest] DROP COLUMN [DateModified]
IF COL_LENGTH(N'[dbo].[ObjectTest]', N'LinkedInID') IS NOT NULL
ALTER TABLE [dbo].[ObjectTest] DROP COLUMN [LinkedInID]
GO

UPDATE dbo.ObjectTest SET TestDescription = 'DefaultDescr'