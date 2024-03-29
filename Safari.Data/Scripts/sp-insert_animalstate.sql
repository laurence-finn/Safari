USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[insert_animalstate]    Script Date: 8/17/2023 10:58:32 AM ******/
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

        -- check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

		-- check if state exists
		IF NOT EXISTS (SELECT * FROM State WHERE StateID = @StateID)
        BEGIN
            SET @ErrorMsg = 'State does not exist.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

		-- Check if the animal state combination already exists
		IF EXISTS (SELECT 1 FROM AnimalState WHERE AnimalID = @AnimalID AND StateID = @StateID)
		BEGIN
			SET @ErrorMsg = 'Animal is already in this state.';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Insert the new row into AnimalState
		INSERT INTO AnimalState (AnimalID, StateID)
		VALUES (@AnimalID, @StateID)

		SET @NewAnimalStateID = SCOPE_IDENTITY();
		SET @Success = 1;

	END TRY
	BEGIN CATCH
		SET @ErrorMsg = ERROR_MESSAGE();
		THROW 51000, @ErrorMsg, 1;
	END CATCH
END
