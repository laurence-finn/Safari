USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[delete_animaldescription]    Script Date: 8/17/2023 10:54:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Delete a record from the AnimalDescription table.
-- =============================================
ALTER PROCEDURE [dbo].[delete_animaldescription] (
	@AnimalDescriptionID int,
	@Success bit Output,
	@ErrorMsg nvarchar(50) Output
	)

AS
SET NOCOUNT ON;
BEGIN
	SET @Success = 0;
	SET @ErrorMsg = '';
	
BEGIN TRY
	
	--If AnimalDescriptionID does not exist, throw an error and rollback.
    IF NOT EXISTS (SELECT AnimalDescriptionID FROM AnimalDescription WHERE AnimalDescriptionID = @AnimalDescriptionID)
        BEGIN
            SET @ErrorMsg = 'Animal Description does not exist.'
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

	--Delete the row from AnimalDescription
	DELETE FROM AnimalDescription WHERE AnimalDescriptionID = @AnimalDescriptionID
	SET @Success = 1
	SET @ErrorMsg = ''
END TRY
BEGIN CATCH
		SET @ErrorMsg = ERROR_MESSAGE()
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;

END CATCH
END

