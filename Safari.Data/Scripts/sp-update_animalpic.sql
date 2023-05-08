SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Updates a record in the AnimalDescription table.
-- =============================================
CREATE PROCEDURE dbo.update_animalpic (
	@AnimalPicID int,
	@AnimalID int,
	@AltText nvarchar(150) = NULL,
	@Source nvarchar(500) = NULL,
	@Success bit Output,
	@ErrorMsg nvarchar(50) Output
	)

AS
SET NOCOUNT ON;
BEGIN
	SET @Success = 0;
	SET @ErrorMsg = '';
	
BEGIN TRY
	BEGIN TRANSACTION;
	
	--If AnimalPicID does not exist, throw an error and rollback.
    IF NOT EXISTS (SELECT AnimalPicID FROM AnimalPic WHERE AnimalPicID = @AnimalPicID)
        BEGIN
            SET @ErrorMsg = 'Animal picture does not exist.'
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

	--Check if the updated AnimalID exists in the Animal table
	IF NOT EXISTS (SELECT AnimalID FROM Animal WHERE AnimalID = @AnimalID)
		BEGIN
			SET @ErrorMsg = 'Animal does not exist.'
			SET @Success = 0;
			ROLLBACK TRANSACTION;
			THROW 51000, @ErrorMsg, 1;
		END

	--Update the AnimalPic table
	UPDATE AnimalPic 
		SET AnimalID = @AnimalID,
			AltText = ISNULL(@AltText, AltText),
			Source = ISNULL(@Source, Source)
	WHERE AnimalPicID = @AnimalPicID
	
	IF @@TRANCOUNT > 0
		BEGIN	
			SET @Success = 1
			SET @ErrorMsg = ''
			COMMIT TRANSACTION
		END
END TRY
BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END
		SET @ErrorMsg = error_message()
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;

END CATCH
END

