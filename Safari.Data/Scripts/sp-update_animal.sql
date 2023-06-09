USE [WildlifeData]
GO
/****** Object:  StoredProcedure [dbo].[update_animal]    Script Date: 7/4/2023 12:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Modified date: June 21, 2023
-- Description:	Updates an Animal in the Animal table.
-- =============================================
ALTER PROCEDURE [dbo].[update_animal] (
    @AnimalID int,
    @Name nvarchar(50) = NULL,
	@AnimalTypeID int = NULL,
    @DietTypeID int = NULL,
    @Weight int = NULL,
    @Height int = NULL,
    @Length int = NULL,
    @IsEndangered bit = NULL,
    @Lifespan int = NULL,
	@IsApproved bit = NULL,
    @Success bit Output,
    @ErrorMsg Nvarchar(50) Output
)
AS
SET NOCOUNT ON;

BEGIN
    SET @Success = 0;
    SET @ErrorMsg = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        --If the animal does not exist, throw an error and rollback.
        IF NOT EXISTS (SELECT AnimalID FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
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

		-- Check if Lifespan is greater than 200
		IF @Lifespan > 200
		BEGIN
			SET @ErrorMsg = 'AverageLifeSpan cannot be greater than 200 years.';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Check if AverageLifeSpan is less than 0
		IF @Lifespan < 0
		BEGIN
			SET @ErrorMsg = 'AverageLifeSpan cannot be negative.';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Check if Height is less than 0
		IF @Height < 0
		BEGIN
			SET @ErrorMsg = 'Height cannot be negative.';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Check if Weight is less than 0
		IF @Weight < 0
		BEGIN
			SET @ErrorMsg = 'Weight cannot be negative.';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Check if Length is less than 0
		IF @Length < 0
		BEGIN
			SET @ErrorMsg = 'Length cannot be negative.';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Check if height is 0 and set to null
		-- We want to avoid zeroes as much as possible so that it doesn't throw off future sorting/calculation features.
		IF (@Height = 0)
		BEGIN
			SET @Height = NULL;
		END

		-- Check if weight is 0 and set to null
		IF (@Weight = 0)
		BEGIN
			SET @Weight = NULL;
		END

		-- Check if length is 0 and set to null
		IF (@Weight = 0)
		BEGIN
			SET @Length = NULL;
		END

		-- Check if averagelifespan is 0 and set to null
		IF (@Lifespan = 0)
		BEGIN
			SET @Lifespan = NULL;
		END
		
        --Update Animal
        UPDATE Animal
        SET Name = ISNULL(@Name, Name),
			AnimalTypeID = ISNULL(@AnimalTypeID, AnimalTypeID),
            DietTypeID = ISNULL(@DietTypeID, DietTypeID),
            Weight = ISNULL(@Weight, Weight),
            Height = ISNULL(@Height, Height),
			Length = ISNULL(@Length, Length),
            IsEndangered = ISNULL(@IsEndangered, IsEndangered),
            Lifespan = ISNULL(@Lifespan, Lifespan),
			IsApproved = ISNULL(@IsApproved, IsApproved)
        WHERE AnimalID = @AnimalID;

        --Commit the transaction if everything is successful
        IF @@TRANCOUNT > 0
        BEGIN
            SET @Success = 1
            SET @ErrorMsg = ''
            COMMIT TRANSACTION
        END
    END TRY
    BEGIN CATCH
        --Rollback the transaction and throw the error message
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION
        END
        SET @ErrorMsg = error_message()
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END
