IF OBJECT_ID('[dbo].[USP_GetPurchases]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_GetPurchases];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_GetPurchases] AS
BEGIN
SELECT PurchaseID, WidgetPriceID, Quantity, InvoiceNumber, Date, Description
FROM dbo.WidgetPurchases;
END

GO
