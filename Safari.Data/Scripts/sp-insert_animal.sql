USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[insert_animal]    Script Date: 5/8/2023 1:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: 5/7/2023
-- Description:	Insert an animal
-- =============================================
ALTER PROCEDURE [dbo].[insert_animal] (
	@Name nvarchar(50),
	@AnimalTypeID int = NULL,
	@DietTypeID int = NULL,
    @MinWeight decimal(6,2) = NULL,
    @MaxWeight decimal(6,2) = NULL,
    @Height decimal(6,2) = NULL,
    @IsEndangered bit = 0,
    @AverageLifeSpan int = NULL,
	@NewAnimalID int Output,
	@Success bit Output,
	@ErrorMsg Nvarchar(50) Output
)

AS
SET NOCOUNT ON;
BEGIN
	SET @Success = 0;
	SET @ErrorMsg = '';
	SET @NewAnimalID = 0;
	
BEGIN TRY
	BEGIN TRANSACTION;

	--If the animal already exists, throw an error and rollback.
    IF EXISTS (
        SELECT * FROM Animal WHERE Name = @Name
    )
    BEGIN
        SET @ErrorMsg = 'Animal already exists.';
        THROW 51000, @ErrorMsg, 1;
    END
	
	-- Check if the provided AnimalTypeID exists in the AnimalType table
	IF @AnimalTypeID IS NOT NULL AND NOT EXISTS (SELECT AnimalTypeID FROM AnimalType WHERE AnimalTypeID = @AnimalTypeID)
	BEGIN
		SET @ErrorMsg = 'Animal type does not exist.';
		THROW 51000, @ErrorMsg, 1;
	END

	-- Check if the provided DietTypeID exists in the DietType table
	IF @DietTypeID IS NOT NULL AND NOT EXISTS (SELECT DietTypeID FROM DietType WHERE DietTypeID = @DietTypeID)
	BEGIN
		SET @ErrorMsg = 'Diet type does not exist.';
		THROW 51000, @ErrorMsg, 1;
	END

	-- Check if MinWeight is greater than MaxWeight
	IF (@MinWeight IS NOT NULL AND @MaxWeight IS NOT NULL AND @MinWeight > @MaxWeight)
	BEGIN
		SET @ErrorMsg = 'MinWeight cannot be greater than MaxWeight.';
		THROW 51000, @ErrorMsg, 1;
	END

	-- Check if AverageLifeSpan is greater than 200
	IF @AverageLifeSpan > 200
	BEGIN
		SET @ErrorMsg = 'AverageLifeSpan cannot be greater than 200 years.';
		THROW 51000, @ErrorMsg, 1;
	END

	-- Check if height is 0 and set to null
	-- We want to avoid zeroes as much as possible so that it doesn't throw off future sorting/calculation features.
	IF (@Height = 0)
	BEGIN
		SET @Height = NULL;
	END

	-- Check if averagelifespan is 0 and set to null
	IF (@AverageLifeSpan = 0)
	BEGIN
		SET @AverageLifeSpan = NULL;
	END

	--Insert into Animal
	INSERT INTO Animal (Name, AnimalTypeID, DietTypeID, MinWeight, MaxWeight, Height, IsEndangered, AverageLifeSpan)
	VALUES (@Name, @AnimalTypeID, @DietTypeID, @MinWeight, @MaxWeight, @Height, @IsEndangered, @AverageLifeSpan)
	
	--Set the new animal ID to a variable.
	SET @NewAnimalID = @@IDENTITY;
	   	   	
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
