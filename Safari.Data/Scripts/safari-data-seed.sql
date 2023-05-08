USE [WildlifeData]
GO

DECLARE @NewAnimalID int
DECLARE @NewAnimalStateID int
DECLARE @Success bit
DECLARE @ErrorMsg nvarchar(50)

DBCC CHECKIDENT ('Animal', RESEED, 0);

EXEC dbo.insert_animal 'Texas Horned Lizard', 2, 2, 0.25, 0.5, 3, 0, 5, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;
EXEC dbo.insert_animal 'Swift Fox', 1, 1, 3, 7, 14, 1, 6, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;
EXEC dbo.insert_animal 'Golden-Cheeked Warbler', 4, 2, 0.4, 0.5, 4, 1, 10, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;
EXEC dbo.insert_animal 'Texas Blind Salamander', 2, 2, 0.1, 0.4, 4, 1, 10, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;
EXEC dbo.insert_animal 'Red-Crowned Parrot', 4, 2, 0.3, 0.5, 14, 0, 40, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;
EXEC dbo.insert_animal 'Mexican Free-Tailed Bat', 1, 2, 0.5, 1, 5, 0, 20, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;
EXEC dbo.insert_animal 'Texas Kangaroo Rat', 1, 2, 0.02, 0.03, 5, 0, 5, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;
EXEC dbo.insert_animal 'Texas Tortoise', 3, 2, 6, 8, 8, 0, 100, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;
EXEC dbo.insert_animal 'White-tailed Deer', 1, 2, 100, 300, 48, 0, 15, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;
EXEC dbo.insert_animal 'Texas Horned Toad', 3, 2, 0.2, 0.5, 4, 0, 10, @NewAnimalID OUTPUT, @Success OUTPUT, @ErrorMsg OUTPUT;

DBCC CHECKIDENT ('AnimalState', RESEED, 0);

EXEC dbo.insert_animalstate 1, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
EXEC dbo.insert_animalstate 2, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
EXEC dbo.insert_animalstate 3, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
EXEC dbo.insert_animalstate 4, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
EXEC dbo.insert_animalstate 5, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
EXEC dbo.insert_animalstate 6, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
EXEC dbo.insert_animalstate 7, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
EXEC dbo.insert_animalstate 8, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
EXEC dbo.insert_animalstate 9, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
EXEC dbo.insert_animalstate 10, 43, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output
