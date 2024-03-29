USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[delete_animalpic]    Script Date: 8/17/2023 10:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 8, 2023
-- Description:	Delete an animal picture from the AnimalPic table.
-- =============================================
ALTER PROCEDURE [dbo].[delete_animalpic] (
    @AnimalPicID int,
    @Success bit OUTPUT,
    @ErrorMsg nvarchar(50) OUTPUT
)
AS
SET NOCOUNT ON;
BEGIN
    SET @Success = 0;
    SET @ErrorMsg = '';

    BEGIN TRY

        -- Check if AnimalPic exists
        IF NOT EXISTS (
            SELECT * FROM AnimalPic WHERE AnimalPicID = @AnimalPicID
        )
        BEGIN
            SET @ErrorMsg = 'Animal picture not found.';
            THROW 51000, @ErrorMsg, 1;
        END

        -- Delete from AnimalPic
        DELETE FROM AnimalPic WHERE AnimalPicID = @AnimalPicID;

        SET @Success = 1;

    END TRY
    BEGIN CATCH
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

