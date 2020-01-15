IF OBJECT_ID('[dbo].[GetTable]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetTable];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTable] AS
BEGIN
SELECT demoId
     , demoName
     , demdesc
     , demoDate FROM dbo.DemoTable1
END

GO
