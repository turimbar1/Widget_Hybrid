IF OBJECT_ID('[dbo].[usp_GetPurchase]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_GetPurchase];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_GetPurchase] AS
BEGIN
SELECT PurchaseID, WidgetPriceID, Quantity, InvoiceNumber, Date, Description FROM dbo.WidgetPurchases
END

GO
