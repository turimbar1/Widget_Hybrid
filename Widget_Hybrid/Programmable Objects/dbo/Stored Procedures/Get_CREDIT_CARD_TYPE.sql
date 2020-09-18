IF OBJECT_ID('[dbo].[Get_CREDIT_CARD_TYPE]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_CREDIT_CARD_TYPE];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Get_CREDIT_CARD_TYPE] AS
BEGIN
SELECT d.DemoId, d.DemoDescription, d.FirstName, d.LastName, d.DemoDate, d.DemoAddress, d.ModifiedDate, d.LastModifiedBy, d.DemoAddress2, d.DemoNotes, d.DemoFeedback, d.TableDescription
FROM dbo.demotable AS d;
END

GO
