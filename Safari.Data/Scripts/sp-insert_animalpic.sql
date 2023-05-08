SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Insert a record into the AnimalPic table.
-- =============================================
CREATE PROCEDURE [dbo].[InsertAnimalPic]
(
    @AnimalID int,
    @FileName nvarchar(50),
    @FilePath nvarchar(100),
    @AltText nvarchar(150),
    @Source nvarchar(500),
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
        BEGIN TRANSACTION;

        -- check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

        -- insert into AnimalPic
        INSERT INTO AnimalPic (AnimalID, FileName, FilePath, AltText, Source)
        VALUES (@AnimalID, @FileName, @FilePath, @AltText, @Source);

        -- set output parameters
        SET @NewAnimalPicID = SCOPE_IDENTITY();
        SET @Success = 1;
        SET @ErrorMsg = '';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- rollback transaction on error
        IF @@TRANCOUNT > 0
		BEGIN
            ROLLBACK TRANSACTION
		END

        SET @ErrorMsg = ERROR_MESSAGE();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

