IF OBJECT_ID('[dbo].[GetInvoice]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetInvoice];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[GetInvoice] AS
BEGIN
SELECT
    invoice_number,
    invoice_date
FROM
    dbo.DM_INVOICE;
END

GO
