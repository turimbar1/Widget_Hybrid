IF OBJECT_ID('[dbo].[USP_GetProject]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_GetProject];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_GetProject] AS
BEGIN
SELECT projectID, projectDescription, projectOwner, projectItem, projectName, lastModified
FROM dbo.project;
END

GO
