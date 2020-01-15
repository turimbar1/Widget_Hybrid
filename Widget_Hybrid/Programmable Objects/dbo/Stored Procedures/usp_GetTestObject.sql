IF OBJECT_ID('[dbo].[usp_GetTestObject]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_GetTestObject];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_GetTestObject] AS
BEGIN
SELECT objectDescription, ObjectName FROM dbo.NewTestObject
END

GO
