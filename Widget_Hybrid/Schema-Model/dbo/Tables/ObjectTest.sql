CREATE TABLE [dbo].[ObjectTest]
(
[ObjectID] [bigint] NOT NULL,
[ObjectName] [nvarchar] (25) NULL,
[ObjectDesc] [nvarchar] (50) NULL,
[ObjectAdd] [nvarchar] (50) NULL,
[TestDescription] [nvarchar] (50) NULL
)
GO
ALTER TABLE [dbo].[ObjectTest] ADD CONSTRAINT [PK__ObjectTe__9A6192B18CF93115] PRIMARY KEY CLUSTERED  ([ObjectID])
GO
