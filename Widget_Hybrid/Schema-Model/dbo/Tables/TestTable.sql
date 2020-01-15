CREATE TABLE [dbo].[TestTable]
(
[TestId] [bigint] NOT NULL,
[TestName] [nvarchar] (25) NULL,
[TestDescription] [nvarchar] (50) NULL
)
GO
ALTER TABLE [dbo].[TestTable] ADD CONSTRAINT [PK__TestTabl__8CC33160C9CCD1F4] PRIMARY KEY CLUSTERED  ([TestId])
GO
