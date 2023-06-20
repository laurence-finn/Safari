SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: June 20, 2023
-- Description:	Prints the AnimalDescription table with the Animal name included.
-- =============================================
CREATE PROCEDURE [dbo].[report_animaldescription]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT AnimalDescriptionId, b.Name, Description FROM AnimalDescription AS a
	JOIN Animal as b ON a.AnimalID = b.AnimalID

END
GO
