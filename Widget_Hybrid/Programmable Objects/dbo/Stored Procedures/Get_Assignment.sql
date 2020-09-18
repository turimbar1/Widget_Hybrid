IF OBJECT_ID('[dbo].[Get_Assignment]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Assignment];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_Assignment] AS
BEGIN
SELECT
    assignment_id,
    person_id,
    emp_id,
    emp_jobtitle,
    assignment_notes
FROM
    dbo.DM_ASSIGNMENT;
END

GO
