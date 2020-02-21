IF OBJECT_ID('[dbo].[Get_Employee_Assignment]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Employee_Assignment];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_Employee_Assignment]
AS BEGIN
    SELECT *
    FROM dbo.DM_ASSIGNMENT
         INNER JOIN dbo.DM_EMPLOYEE ON DM_EMPLOYEE.assignment_id=DM_ASSIGNMENT.assignment_id;
END;
GO
