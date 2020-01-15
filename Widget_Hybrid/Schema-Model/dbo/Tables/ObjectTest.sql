CREATE TABLE [dbo].[ObjectTest]
(
[ObjectID] [bigint] NOT NULL,
[ObjectName] [nvarchar] (25) NULL,
[DateModified] [datetime2] NULL,
[LinkedInID] [int] NULL
)
GO
ALTER TABLE [dbo].[ObjectTest] ADD CONSTRAINT [PK__ObjectTe__9A6192B18CF93115] PRIMARY KEY CLUSTERED  ([ObjectID])
GO
