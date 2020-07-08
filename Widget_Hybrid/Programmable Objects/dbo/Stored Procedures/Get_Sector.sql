IF OBJECT_ID('[dbo].[Get_Sector]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Sector];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Get_Sector]
AS
    BEGIN
        SELECT
            BairdSector1,
            BairdSector2,
            BairdSector4
        FROM
            dbo.BairdSector;
    END;

GO
