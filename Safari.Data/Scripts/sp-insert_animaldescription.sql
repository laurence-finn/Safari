USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[insert_animaldescription]    Script Date: 8/17/2023 10:58:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Insert a record into the Animal Description table.
-- =============================================
ALTER PROCEDURE [dbo].[insert_animaldescription] (
    @AnimalID int,
    @Description nvarchar(MAX),
    @Success bit Output,
    @ErrorMsg nvarchar(50) Output
)
AS
BEGIN
    SET NOCOUNT ON;
    SET @Success = 0;
    SET @ErrorMsg = '';

    BEGIN TRY
		-- Check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

        -- Check if the animal already has a description
        IF EXISTS (SELECT * FROM AnimalDescription WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal already has a description.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

        -- Insert into AnimalDescription
        INSERT INTO AnimalDescription (AnimalID, Description)
        VALUES (@AnimalID, @Description);
		SET @Success = 1;

    END TRY
    BEGIN CATCH
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END


