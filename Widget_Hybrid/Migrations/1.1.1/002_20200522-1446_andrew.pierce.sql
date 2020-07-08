-- <Migration ID="b3bd48b8-c24b-4790-a5fc-5833674504b8" />
GO

PRINT N'Altering [dbo].[customersDemo]'
GO
ALTER TABLE [dbo].[customersDemo] ADD
[RedgateUserEmail] [nvarchar] (100) NULL
GO
/*
* Use this Post-Deployment script to perform tasks after the deployment of the project.
* Read more at https://www.red-gate.com/SOC7/post-deployment-script-help
*/

