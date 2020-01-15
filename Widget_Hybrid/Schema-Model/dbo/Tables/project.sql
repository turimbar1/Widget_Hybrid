CREATE TABLE [dbo].[project]
(
[projectID] [bigint] NOT NULL,
[projectDescription] [nvarchar] (50) NULL,
[projectName] [nvarchar] (50) NULL,
[projectOwner] [nvarchar] (50) NULL,
[projectItem] [nvarchar] (100) NULL,
[lastModified] [datetime2] NULL
)
GO
ALTER TABLE [dbo].[project] ADD CONSTRAINT [PK__project__11F14D8522BBD6BF] PRIMARY KEY CLUSTERED  ([projectID])
GO
