IF OBJECT_ID('[dbo].[GetNotes]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetNotes];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetNotes] AS
BEGIN
SELECT * FROM dbo.DM_CUSTOMER_NOTES
END

GO