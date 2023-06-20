SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: June 20, 2023
-- Description:	Prints a report of the AnimalPic table with the Animal name included.
-- =============================================
CREATE PROCEDURE [dbo].[report_animalpic]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT AnimalPicId, b.Name, FileName, FilePath, AltText, Source FROM AnimalPic AS a
	JOIN Animal AS b ON a.animalID = b.animalID

END
GO
