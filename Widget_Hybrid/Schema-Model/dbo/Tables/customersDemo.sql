CREATE TABLE [dbo].[customersDemo]
(
[CustID] [bigint] NOT NULL,
[CustDesc] [nvarchar] (25) NULL,
[CustName] [nvarchar] (50) NULL,
[CustDOB] [date] NULL,
[EmailAddress] [nvarchar] (50) NULL,
[AzureEnvironment] [nvarchar] (200) NULL,
[AzureEnvironmentID] [int] NULL
)
GO
ALTER TABLE [dbo].[customersDemo] ADD CONSTRAINT [PK__customer__049E3A89295CB0A4] PRIMARY KEY CLUSTERED  ([CustID])
GO
