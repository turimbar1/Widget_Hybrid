IF OBJECT_ID('[dbo].[Get_TranResult]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_TranResult];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_TranResult] AS
BEGIN
SELECT TranName, Result, Msg, TestStartTime, TestEndTime
FROM tSQLt.TestResult;
END

GO
