IF OBJECT_ID('[dbo].[Get_Sector_Validity]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Sector_Validity];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_Sector_Validity] AS
BEGIN
SELECT BairdSector5,
       ValidFrom,
       ValidTo,
       TreasuryFlag
FROM dbo.BairdSector;
END

GO
