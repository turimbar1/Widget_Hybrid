IF OBJECT_ID('[dbo].[USP_ObjectTestSel]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_ObjectTestSel];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_ObjectTestSel] AS
BEGIN
select ObjectName
     
from dbo.ObjectTest;
END
GO
