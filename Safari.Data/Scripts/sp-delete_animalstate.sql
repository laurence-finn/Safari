SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Delete a record from the AnimalState table.
-- =============================================
CREATE PROCEDURE dbo.delete_animalstate (
	@AnimalStateID int,
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
	
	--If AnimalStateID does not exist, throw an error and rollback.
	IF NOT EXISTS (SELECT AnimalStateID FROM AnimalState WHERE AnimalStateID = @AnimalStateID)
		BEGIN
			SET @ErrorMsg = 'Animal state does not exist.'
			SET @Success = 0;
			ROLLBACK TRANSACTION;
			THROW 51000, @ErrorMsg, 1;
		END

	--Delete from AnimalState table
	DELETE FROM AnimalState WHERE AnimalStateID = @AnimalStateID
	
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
