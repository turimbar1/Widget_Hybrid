IF OBJECT_ID('[dbo].[GetEmpAudit]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetEmpAudit];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetEmpAudit] AS
BEGIN
SELECT identCol, person_id, assignment_id, emp_id, first_name, last_name, full_name FROM dbo.DM_EMP_AUDIT
END

GO
