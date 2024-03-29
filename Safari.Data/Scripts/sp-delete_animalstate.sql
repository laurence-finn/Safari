USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[delete_animalstate]    Script Date: 8/17/2023 10:56:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Delete a record from the AnimalState table.
-- =============================================
ALTER PROCEDURE [dbo].[delete_animalstate] (
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
	
	--If AnimalStateID does not exist, throw an error and rollback.
	IF NOT EXISTS (SELECT AnimalStateID FROM AnimalState WHERE AnimalStateID = @AnimalStateID)
		BEGIN
			SET @ErrorMsg = 'Animal state does not exist.'
			SET @Success = 0;
			THROW 51000, @ErrorMsg, 1;
		END

	--Delete from AnimalState table
	DELETE FROM AnimalState WHERE AnimalStateID = @AnimalStateID
	SET @Success = 1
	SET @ErrorMsg = ''

END TRY
BEGIN CATCH
		SET @ErrorMsg = error_message()
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;

END CATCH
END
