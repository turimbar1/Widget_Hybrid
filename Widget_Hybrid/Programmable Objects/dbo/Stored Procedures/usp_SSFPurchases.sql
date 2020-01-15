IF OBJECT_ID('[dbo].[usp_SSFPurchases]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SSFPurchases];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_SSFPurchases] AS
BEGIN
SELECT PurchaseID
     , Quantity
     , InvoiceNumber
     , Date
     FROM dbo.WidgetPurchases
END

GO
