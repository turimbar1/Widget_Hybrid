-- <Migration ID="19fb150f-47db-4ee0-8851-255917d205e0" />
GO

PRINT N'Altering [dbo].[PersonTest]'
GO
ALTER TABLE [dbo].[PersonTest] ADD
[AzureID] [int] NULL
GO
PRINT N'Altering [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] ADD
[AzureID] [int] NULL
GO
PRINT N'Altering [dbo].[customersDemo]'
GO
ALTER TABLE [dbo].[customersDemo] ADD
[AzureUsername] [nvarchar] (200) NULL
GO

INSERT INTO dbo.PersonTest(PersonId, PersonName, PersonDOB, PersonAddress, EmailAddress, PersonState, CountryCode, LastModified, LastModifiedBy, Address1)
VALUES(0, -- PersonId - bigint
N'Nana' , -- PersonName - nvarchar(40)
GETDATE(), -- PersonDOB - date
N'337 Monor ave.' , -- PersonAddress - nvarchar(50)
N'Hello@Gmail.com' , -- EmailAddress - nvarchar(50)
N'CA' , -- PersonState - nchar(2)
N'USA' , -- CountryCode - nchar(2)
SYSDATETIME(), -- LastModified - datetime2(7)
N'Bob' , -- LastModifiedBy - nvarchar(50)
N'Pasadena' -- Address1 - nvarchar(50)
    )