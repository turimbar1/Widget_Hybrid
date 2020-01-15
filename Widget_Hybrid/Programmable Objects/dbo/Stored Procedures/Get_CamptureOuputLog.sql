IF OBJECT_ID('[dbo].[Get_CamptureOuputLog]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_CamptureOuputLog];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_CamptureOuputLog] AS
BEGIN
SELECT * from tSQLt.CaptureOutputLog
END

GO
