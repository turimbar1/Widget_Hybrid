-- <Migration ID="40421191-aba3-4473-8b73-ba40d5f139b6" />
GO
INSERT INTO dbo.DM_ASSIGNMENT(assignment_id, person_id, emp_id, emp_jobtitle, assignment_notes)
VALUES(0, -- assignment_id - int
0   , -- person_id - int
'5'  , -- emp_id - varchar(10)
'Janitor'  , -- emp_jobtitle - varchar(100)
'cleans'  -- assignment_notes - varchar(1000)
    )