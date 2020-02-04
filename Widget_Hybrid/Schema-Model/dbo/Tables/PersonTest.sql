CREATE TABLE [dbo].[PersonTest]
(
[PersonId] [bigint] NOT NULL,
[PersonName] [nvarchar] (40) NULL,
[PersonDOB] [date] NULL,
[PersonAddress] [nvarchar] (50) NULL,
[EmailAddress] [nvarchar] (50) NULL,
[PersonState] [nchar] (2) NULL,
[CountryCode] [nchar] (2) NULL,
[LastModified] [datetime2] NULL,
[LastModifiedBy] [nvarchar] (50) NULL,
[Address1] [nvarchar] (50) NULL,
[AzureID] [int] NULL
)
GO
ALTER TABLE [dbo].[PersonTest] ADD CONSTRAINT [PK__PersonTe__AA2FFBE59FB67109] PRIMARY KEY CLUSTERED  ([PersonId])
GO
