IF OBJECT_ID('[dbo].[Get_Demo]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Demo];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_Demo] AS
BEGIN
SELECT DemoId
     , DemoFName,
     DemoDescription FROM dbo.HelloDemo
END

GO
