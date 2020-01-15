IF OBJECT_ID('[dbo].[USP_SSFTestResults]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_SSFTestResults];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_SSFTestResults]
AS BEGIN
    SELECT Id, Class, TestCase, Name, TranName, Result, Msg, TestStartTime, TestEndTime
    FROM tSQLt.TestResult;
END;
GO
