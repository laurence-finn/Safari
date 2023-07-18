SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: July 18, 2023
-- Description:	Deletes all animal state records for a given AnimalID.
-- =============================================
CREATE PROCEDURE [dbo].[delete_allanimalstate] (
	@AnimalId int,
	@Success bit Output,
	@ErrorMsg nvarchar(50) Output
	)

AS
SET NOCOUNT ON;
BEGIN
	SET @Success = 0;
	SET @ErrorMsg = '';

	BEGIN TRY
		-- Delete from AnimalState table for the given AnimalId
		DELETE FROM AnimalState WHERE AnimalId = @AnimalId;
		SET @Success = 1;
		SET @ErrorMsg = '';
	END TRY

	BEGIN CATCH
		SET @ErrorMsg = ERROR_MESSAGE();
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;
	END CATCH

END
