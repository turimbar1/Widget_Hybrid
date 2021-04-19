IF OBJECT_ID('[dbo].[Get_Contacts]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Contacts];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Get_Contacts] AS
BEGIN
SELECT
    Name,
    PhoneWork,
    PhoneMobile,
    Address1
FROM
    dbo.Contacts;
END

GO
