USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[insert_animalstate]    Script Date: 5/7/2023 6:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Updates the AnimalStates table to add a new animal and state relationship.
-- =============================================
ALTER PROCEDURE [dbo].[insert_animalstate] (
	@AnimalID int,
	@StateID int,
	@NewAnimalStateID int Output,
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

        -- check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

		-- check if state exists
		IF NOT EXISTS (SELECT * FROM State WHERE StateID = @StateID)
        BEGIN
            SET @ErrorMsg = 'State does not exist.';
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

		-- Check if the animal state combination already exists
		IF EXISTS (SELECT 1 FROM AnimalState WHERE AnimalID = @AnimalID AND StateID = @StateID)
		BEGIN
			SET @ErrorMsg = 'Animal is already in this state.'
			ROLLBACK TRANSACTION;
			THROW 51000, @ErrorMsg, 1;
		END

		-- Insert the new row into AnimalState
		INSERT INTO AnimalState (AnimalID, StateID)
		VALUES (@AnimalID, @StateID)

		SET @NewAnimalStateID = SCOPE_IDENTITY();

		-- Check if the transaction completed successfully
		IF @@TRANCOUNT > 0
		BEGIN
			SET @Success = 1
			COMMIT TRANSACTION
		END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END
		SET @ErrorMsg = ERROR_MESSAGE();
		THROW 51000, @ErrorMsg, 1;
	END CATCH
END
