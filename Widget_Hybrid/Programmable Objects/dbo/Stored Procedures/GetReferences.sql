IF OBJECT_ID('[dbo].[GetReferences]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetReferences];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetReferences] AS
BEGIN
SELECT WidgetID
     , Reference
FROM dbo.WidgetReferences;
END

GO
