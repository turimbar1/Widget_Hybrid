IF OBJECT_ID('[dbo].[GetCustomerNotes]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetCustomerNotes];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetCustomerNotes] AS
BEGIN
SELECT * FROM dbo.DM_CUSTOMER_NOTES
END

GO
