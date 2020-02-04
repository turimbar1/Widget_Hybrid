IF OBJECT_ID('[dbo].[Get_Customer]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Customer];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Get_Customer]
AS
BEGIN
    SELECT CustId,
           CustFirstname,
           Last_Changed_By,
           CustEmailAddress,
           LastChangedBy,
           CustomerNotes,
           Notes
    FROM dbo.Customer;
END;

GO
