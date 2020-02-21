IF OBJECT_ID('[dbo].[Get_Inventory_Item_Name]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Inventory_Item_Name];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_Inventory_Item_Name]
AS
BEGIN
    SELECT inventory_item_name
      FROM dbo.DM_INVENTORY_ITEM;
END;

GO
