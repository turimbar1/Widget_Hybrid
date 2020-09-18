CREATE TABLE [dbo].[WidgetPurchases]
(
[PurchaseID] [int] NOT NULL IDENTITY(1, 1),
[WidgetPriceID] [int] NOT NULL,
[Quantity] [int] NOT NULL CONSTRAINT [DF__WidgetPur__Quant__267ABA7A] DEFAULT ((1)),
[InvoiceNumber] [nvarchar] (20) NULL,
[Date] [datetime] NOT NULL CONSTRAINT [DF__WidgetPurc__Date__276EDEB3] DEFAULT (getdate()),
[Description] [nvarchar] (50) NULL
)
GO
CREATE UNIQUE CLUSTERED INDEX [IX_WidgetPurchases] ON [dbo].[WidgetPurchases] ([PurchaseID])
GO
