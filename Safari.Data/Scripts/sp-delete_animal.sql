USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[delete_animal]    Script Date: 8/17/2023 10:53:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Deletes an animal from the Animal, AnimalDescription, AnimalState, and AnimalPic tables.
-- =============================================
ALTER PROCEDURE [dbo].[delete_animal] (
    @AnimalID int,
    @Success bit OUTPUT,
    @ErrorMsg nvarchar(50) OUTPUT
)
AS
SET NOCOUNT ON;
BEGIN
    SET @Success = 0;
    SET @ErrorMsg = '';

    BEGIN TRY

        -- Check if animal exists
        IF NOT EXISTS (
            SELECT * FROM Animal WHERE AnimalID = @AnimalID
        )
        BEGIN
            SET @ErrorMsg = 'Animal not found.';
            THROW 51000, @ErrorMsg, 1;
        END

		-- Delete from AnimalDescription
		DELETE FROM AnimalDescription WHERE AnimalID = @AnimalID;

        -- Delete from AnimalState
        DELETE FROM AnimalState WHERE AnimalID = @AnimalID;

        -- Delete from AnimalPic
        DELETE FROM AnimalPic WHERE AnimalID = @AnimalID;

        -- Delete from Animal
        DELETE FROM Animal WHERE AnimalID = @AnimalID;

        SET @Success = 1;
    END TRY
    BEGIN CATCH
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

