USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[insert_animalpic]    Script Date: 7/4/2023 12:32:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Insert a record into the AnimalPic table.
-- =============================================
ALTER PROCEDURE [dbo].[insert_animalpic]
(
    @AnimalID int,
    @FileName nvarchar(50),
    @FilePath nvarchar(100),
    @AltText nvarchar(150) = NULL,
    @Source nvarchar(500) = NULL,
    @NewAnimalPicID int Output,
    @Success bit Output,
    @ErrorMsg nvarchar(50) Output
)
AS
BEGIN
    SET NOCOUNT ON;
    SET @Success = 0;
    SET @ErrorMsg = '';
    SET @NewAnimalPicID = 0;

    BEGIN TRY
        -- check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

        -- insert into AnimalPic
        INSERT INTO AnimalPic (AnimalID, FileName, FilePath, AltText, Source, DateSubmitted, IsApproved)
        VALUES (@AnimalID, @FileName, @FilePath, @AltText, @Source, GETDATE(), 0);

        -- set output parameters
        SET @NewAnimalPicID = SCOPE_IDENTITY();
        SET @Success = 1;
        SET @ErrorMsg = '';

    END TRY
    BEGIN CATCH
        SET @ErrorMsg = ERROR_MESSAGE();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

