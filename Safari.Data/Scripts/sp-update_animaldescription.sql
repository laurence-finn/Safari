SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Update a record in the AnimalDescription table.
-- =============================================
CREATE PROCEDURE [dbo].[update_animaldescription]
	@AnimalDescriptionID int,
	@AnimalID int,
	@Description nvarchar(MAX),
	@Success bit OUTPUT,
	@ErrorMsg nvarchar(50) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TempAnimalID int, @TempAnimalDescriptionID int;

	SET @Success = 0;
	SET @ErrorMsg = '';

	BEGIN TRY
		BEGIN TRANSACTION;

		-- Check if the animal exists
		SELECT @TempAnimalID = AnimalID FROM Animal WHERE AnimalID = @AnimalID;
		IF @TempAnimalID IS NULL
		BEGIN
			SET @ErrorMsg = 'AnimalID does not exist';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Check if the animal description exists
		SELECT @TempAnimalDescriptionID = AnimalDescriptionID FROM AnimalDescription WHERE AnimalDescriptionID = @AnimalDescriptionID;
		IF @TempAnimalDescriptionID IS NULL
		BEGIN
			SET @ErrorMsg = 'AnimalDescriptionID does not exist';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Ensure that the AnimalID is unique in the AnimalDescription table
		IF EXISTS (SELECT * FROM AnimalDescription WHERE AnimalID = @AnimalID AND AnimalDescriptionID <> @AnimalDescriptionID)
		BEGIN
			SET @ErrorMsg = 'Animal already has a description';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Update the AnimalDescription
		UPDATE AnimalDescription SET AnimalID = @AnimalID, Description = @Description WHERE AnimalDescriptionID = @AnimalDescriptionID;
		
		IF @@TRANCOUNT > 0
		BEGIN
			SET @Success = 1;
			SET @ErrorMsg = '';
			COMMIT TRANSACTION;
		END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;

		SET @ErrorMsg = ERROR_MESSAGE();
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;
	END CATCH;
END



