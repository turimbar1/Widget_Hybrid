IF OBJECT_ID('[dbo].[USP_getContacts]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_getContacts];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_getContacts] AS
BEGIN
SELECT ID, Name, PhoneWork, PhoneMobile, Address1, Address2, Address3, JoiningDate, Email, Description, PhoneHome, LastModifiedBy
FROM dbo.Contacts;
END
GO
