IF OBJECT_ID('[dbo].[Get_Widg_Ref]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Widg_Ref];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_Widg_Ref]
AS
BEGIN
    SELECT WidgetID,
           Reference
      FROM dbo.WidgetReferences;
END;

GO
