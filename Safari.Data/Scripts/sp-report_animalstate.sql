SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: June 20, 2023
-- Description:	Prints the AnimalState IDs with animal names and state names.
-- =============================================
CREATE PROCEDURE [dbo].[report_animalstate] 

AS
BEGIN
	SET NOCOUNT ON;

	SELECT AnimalStateId, b.Name as 'Animal', c.Name as 'State' FROM AnimalState AS a
	JOIN Animal AS b ON a.AnimalID = b.AnimalID
	JOIN State AS c ON a.StateID = c.StateID

END
GO
