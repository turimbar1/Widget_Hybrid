IF OBJECT_ID('[dbo].[Get_LINE_HISTORY]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_LINE_HISTORY];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_LINE_HISTORY] AS
BEGIN
SELECT identCol
     , invoice_number
     , item_id
     , quantity FROM dbo.DM_INVOICE_LINE_HISTORY
END

GO