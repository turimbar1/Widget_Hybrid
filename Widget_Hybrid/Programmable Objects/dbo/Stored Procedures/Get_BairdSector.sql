IF OBJECT_ID('[dbo].[Get_BairdSector]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_BairdSector];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_BairdSector] AS
BEGIN
SELECT bs.BairdSectorId,
       bs.BairdSector1,
       bs.BairdSector2,
       bs.BairdSector3,
       bs.BairdSector4,
       bs.BairdSector5,
       bs.ValidFrom,
       bs.ValidTo,
       bs.TreasuryFlag,
       bs.CreditFlag,
       bs.SecuritizedFlag,
       bs.NonAgencyRmbsFlag,
       bs.ModifiedDurationFlag,
       bs.IsPartial,
       bs.MuniFlag
  FROM dbo.BairdSector AS bs;
END

GO
