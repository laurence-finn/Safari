USE [master]
GO
/****** Object:  Database [WildlifeData]    Script Date: 5/8/2023 1:58:00 PM ******/
CREATE DATABASE [WildlifeData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WildlifeData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WildlifeData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WildlifeData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WildlifeData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WildlifeData] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WildlifeData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WildlifeData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WildlifeData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WildlifeData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WildlifeData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WildlifeData] SET ARITHABORT OFF 
GO
ALTER DATABASE [WildlifeData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WildlifeData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WildlifeData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WildlifeData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WildlifeData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WildlifeData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WildlifeData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WildlifeData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WildlifeData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WildlifeData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WildlifeData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WildlifeData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WildlifeData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WildlifeData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WildlifeData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WildlifeData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WildlifeData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WildlifeData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WildlifeData] SET  MULTI_USER 
GO
ALTER DATABASE [WildlifeData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WildlifeData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WildlifeData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WildlifeData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WildlifeData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WildlifeData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WildlifeData] SET QUERY_STORE = ON
GO
ALTER DATABASE [WildlifeData] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WildlifeData]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/8/2023 1:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[AnimalID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AnimalTypeID] [int] NULL,
	[DietTypeID] [int] NULL,
	[MinWeight] [decimal](6, 2) NULL,
	[MaxWeight] [decimal](6, 2) NULL,
	[Height] [decimal](6, 2) NULL,
	[IsEndangered] [bit] NULL,
	[AverageLifeSpan] [int] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalDescription]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalDescription](
	[AnimalDescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AnimalDescription] PRIMARY KEY CLUSTERED 
(
	[AnimalDescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalPic]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalPic](
	[AnimalPicID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalID] [int] NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FilePath] [nvarchar](100) NOT NULL,
	[AltText] [nvarchar](150) NULL,
	[Source] [nvarchar](500) NULL,
 CONSTRAINT [PK_AnimalPic] PRIMARY KEY CLUSTERED 
(
	[AnimalPicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalState]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalState](
	[AnimalStateID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
 CONSTRAINT [PK_AnimalState] PRIMARY KEY CLUSTERED 
(
	[AnimalStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalType]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalType](
	[AnimalTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AnimalType] PRIMARY KEY CLUSTERED 
(
	[AnimalTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DietType]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DietType](
	[DietTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_DietType] PRIMARY KEY CLUSTERED 
(
	[DietTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (1, N'Texas Horned Lizard', 2, 2, CAST(0.25 AS Decimal(6, 2)), CAST(0.50 AS Decimal(6, 2)), CAST(3.00 AS Decimal(6, 2)), 0, 5)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (2, N'Swift Fox', 1, 1, CAST(3.00 AS Decimal(6, 2)), CAST(7.00 AS Decimal(6, 2)), CAST(14.00 AS Decimal(6, 2)), 1, 6)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (3, N'Golden-Cheeked Warbler', 4, 2, CAST(0.40 AS Decimal(6, 2)), CAST(0.50 AS Decimal(6, 2)), CAST(4.00 AS Decimal(6, 2)), 1, 10)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (4, N'Texas Blind Salamander', 2, 2, CAST(0.10 AS Decimal(6, 2)), CAST(0.40 AS Decimal(6, 2)), CAST(4.00 AS Decimal(6, 2)), 1, 10)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (5, N'Red-Crowned Parrot', 4, 2, CAST(0.30 AS Decimal(6, 2)), CAST(0.50 AS Decimal(6, 2)), CAST(14.00 AS Decimal(6, 2)), 0, 40)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (6, N'Mexican Free-Tailed Bat', 1, 2, CAST(0.50 AS Decimal(6, 2)), CAST(1.00 AS Decimal(6, 2)), CAST(5.00 AS Decimal(6, 2)), 0, 20)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (7, N'Texas Kangaroo Rat', 1, 2, CAST(0.02 AS Decimal(6, 2)), CAST(0.03 AS Decimal(6, 2)), CAST(5.00 AS Decimal(6, 2)), 0, 5)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (8, N'Texas Tortoise', 3, 2, CAST(6.00 AS Decimal(6, 2)), CAST(8.00 AS Decimal(6, 2)), CAST(8.00 AS Decimal(6, 2)), 0, 100)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (9, N'White-tailed Deer', 1, 2, CAST(100.00 AS Decimal(6, 2)), CAST(300.00 AS Decimal(6, 2)), CAST(48.00 AS Decimal(6, 2)), 0, 15)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [MinWeight], [MaxWeight], [Height], [IsEndangered], [AverageLifeSpan]) VALUES (10, N'Texas Horned Toad', 3, 2, CAST(0.20 AS Decimal(6, 2)), CAST(0.50 AS Decimal(6, 2)), CAST(4.00 AS Decimal(6, 2)), 0, 10)
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalState] ON 

INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (1, 1, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (2, 2, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (3, 3, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (4, 4, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (5, 5, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (6, 6, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (7, 7, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (8, 8, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (9, 9, 43)
SET IDENTITY_INSERT [dbo].[AnimalState] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalType] ON 

INSERT [dbo].[AnimalType] ([AnimalTypeID], [Name]) VALUES (1, N'Mammal')
INSERT [dbo].[AnimalType] ([AnimalTypeID], [Name]) VALUES (2, N'Reptile')
INSERT [dbo].[AnimalType] ([AnimalTypeID], [Name]) VALUES (3, N'Amphibian')
INSERT [dbo].[AnimalType] ([AnimalTypeID], [Name]) VALUES (4, N'Bird')
INSERT [dbo].[AnimalType] ([AnimalTypeID], [Name]) VALUES (5, N'Fish')
SET IDENTITY_INSERT [dbo].[AnimalType] OFF
GO
SET IDENTITY_INSERT [dbo].[DietType] ON 

INSERT [dbo].[DietType] ([DietTypeID], [Name]) VALUES (1, N'Carnivore')
INSERT [dbo].[DietType] ([DietTypeID], [Name]) VALUES (2, N'Herbivore')
INSERT [dbo].[DietType] ([DietTypeID], [Name]) VALUES (3, N'Omnivore')
SET IDENTITY_INSERT [dbo].[DietType] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateID], [Name]) VALUES (1, N'Alabama')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (2, N'Alaska')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (3, N'Arizona')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (4, N'Arkansas')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (5, N'California')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (6, N'Colorado')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (7, N'Connecticut')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (8, N'Delaware')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (9, N'Florida')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (10, N'Georgia')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (11, N'Hawaii')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (12, N'Idaho')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (13, N'Illinois')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (14, N'Indiana')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (15, N'Iowa')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (16, N'Kansas')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (17, N'Kentucky')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (18, N'Louisiana')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (19, N'Maine')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (20, N'Maryland')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (21, N'Massachusetts')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (22, N'Michigan')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (23, N'Minnesota')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (24, N'Mississippi')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (25, N'Missouri')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (26, N'Montana')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (27, N'Nebraska')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (28, N'Nevada')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (29, N'New Hampshire')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (30, N'New Jersey')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (31, N'New Mexico')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (32, N'New York')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (33, N'North Carolina')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (34, N'North Dakota')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (35, N'Ohio')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (36, N'Oklahoma')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (37, N'Oregon')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (38, N'Pennsylvania')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (39, N'Rhode Island')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (40, N'South Carolina')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (41, N'South Dakota')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (42, N'Tennessee')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (43, N'Texas')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (44, N'Utah')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (45, N'Vermont')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (46, N'Virginia')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (47, N'Washington')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (48, N'West Virginia')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (49, N'Wisconsin')
INSERT [dbo].[State] ([StateID], [Name]) VALUES (50, N'Wyoming')
SET IDENTITY_INSERT [dbo].[State] OFF
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_AnimalType] FOREIGN KEY([AnimalTypeID])
REFERENCES [dbo].[AnimalType] ([AnimalTypeID])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_AnimalType]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_DietType] FOREIGN KEY([DietTypeID])
REFERENCES [dbo].[DietType] ([DietTypeID])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_DietType]
GO
ALTER TABLE [dbo].[AnimalDescription]  WITH CHECK ADD  CONSTRAINT [FK_AnimalDescription_Animal] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
GO
ALTER TABLE [dbo].[AnimalDescription] CHECK CONSTRAINT [FK_AnimalDescription_Animal]
GO
ALTER TABLE [dbo].[AnimalPic]  WITH CHECK ADD  CONSTRAINT [FK_AnimalPic_Animal] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
GO
ALTER TABLE [dbo].[AnimalPic] CHECK CONSTRAINT [FK_AnimalPic_Animal]
GO
ALTER TABLE [dbo].[AnimalState]  WITH CHECK ADD  CONSTRAINT [FK_AnimalState_Animal] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
GO
ALTER TABLE [dbo].[AnimalState] CHECK CONSTRAINT [FK_AnimalState_Animal]
GO
ALTER TABLE [dbo].[AnimalState]  WITH CHECK ADD  CONSTRAINT [FK_AnimalState_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[AnimalState] CHECK CONSTRAINT [FK_AnimalState_State]
GO
/****** Object:  StoredProcedure [dbo].[delete_animal]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Deletes an animal from the Animal, AnimalDescription, AnimalState, and AnimalPic tables.
-- =============================================
CREATE PROCEDURE [dbo].[delete_animal] (
    @AnimalID int,
    @Success bit OUTPUT,
    @ErrorMsg nvarchar(50) OUTPUT
)
AS
SET NOCOUNT ON;
BEGIN
    SET @Success = 0;
    SET @ErrorMsg = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if animal exists
        IF NOT EXISTS (
            SELECT * FROM Animal WHERE AnimalID = @AnimalID
        )
        BEGIN
            SET @ErrorMsg = 'Animal not found.';
            THROW 51000, @ErrorMsg, 1;
        END

		-- Delete from AnimalDescription
		DELETE FROM AnimalDescription WHERE AnimalID = @AnimalID;

        -- Delete from AnimalState
        DELETE FROM AnimalState WHERE AnimalID = @AnimalID;

        -- Delete from AnimalPic
        DELETE FROM AnimalPic WHERE AnimalID = @AnimalID;

        -- Delete from Animal
        DELETE FROM Animal WHERE AnimalID = @AnimalID;

        IF @@TRANCOUNT > 0
        BEGIN
            SET @Success = 1;
            COMMIT TRANSACTION;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[delete_animaldescription]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Delete a record from the AnimalDescription table.
-- =============================================
CREATE PROCEDURE [dbo].[delete_animaldescription] (
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
	BEGIN TRANSACTION;
	
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
		SET @ErrorMsg = ERROR_MESSAGE()
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;

END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[delete_animalpic]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 8, 2023
-- Description:	Delete an animal picture from the AnimalPic table.
-- =============================================
CREATE PROCEDURE [dbo].[delete_animalpic] (
    @AnimalPicID int,
    @Success bit OUTPUT,
    @ErrorMsg nvarchar(50) OUTPUT
)
AS
SET NOCOUNT ON;
BEGIN
    SET @Success = 0;
    SET @ErrorMsg = '';

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if AnimalPic exists
        IF NOT EXISTS (
            SELECT * FROM AnimalPic WHERE AnimalPicID = @AnimalPicID
        )
        BEGIN
            SET @ErrorMsg = 'Animal picture not found.';
            THROW 51000, @ErrorMsg, 1;
        END

        -- Delete from AnimalPic
        DELETE FROM AnimalPic WHERE AnimalPicID = @AnimalPicID;

        IF @@TRANCOUNT > 0
        BEGIN
            SET @Success = 1;
            COMMIT TRANSACTION;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[delete_animalstate]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Delete a record from the AnimalState table.
-- =============================================
CREATE PROCEDURE [dbo].[delete_animalstate] (
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
GO
/****** Object:  StoredProcedure [dbo].[insert_animal]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: 5/7/2023
-- Description:	Insert an animal
-- =============================================
CREATE PROCEDURE [dbo].[insert_animal] (
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
GO
/****** Object:  StoredProcedure [dbo].[insert_animaldescription]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Insert a record into the Animal Description table.
-- =============================================
CREATE PROCEDURE [dbo].[insert_animaldescription] (
    @AnimalID int,
    @Description nvarchar(MAX),
    @Success bit Output,
    @ErrorMsg nvarchar(50) Output
)
AS
BEGIN
    SET NOCOUNT ON;
    SET @Success = 0;
    SET @ErrorMsg = '';

    BEGIN TRY
        BEGIN TRANSACTION;

		-- Check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

        -- Check if the animal already has a description
        IF EXISTS (SELECT * FROM AnimalDescription WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal already has a description.';
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

        -- Insert into AnimalDescription
        INSERT INTO AnimalDescription (AnimalID, Description)
        VALUES (@AnimalID, @Description);

        IF @@TRANCOUNT > 0
        BEGIN
            SET @Success = 1;
            SET @ErrorMsg = '';
            COMMIT TRANSACTION;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[insert_animalpic]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Insert a record into the AnimalPic table.
-- =============================================
CREATE PROCEDURE [dbo].[insert_animalpic]
(
    @AnimalID int,
    @FileName nvarchar(50),
    @FilePath nvarchar(100),
    @AltText nvarchar(150),
    @Source nvarchar(500),
    @NewAnimalPicID int Output,
    @Success bit Output,
    @ErrorMsg nvarchar(50) Output
)
AS
BEGIN
    SET NOCOUNT ON;
    SET @Success = 0;
    SET @ErrorMsg = '';
    SET @NewAnimalPicID = 0;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

        -- insert into AnimalPic
        INSERT INTO AnimalPic (AnimalID, FileName, FilePath, AltText, Source)
        VALUES (@AnimalID, @FileName, @FilePath, @AltText, @Source);

        -- set output parameters
        SET @NewAnimalPicID = SCOPE_IDENTITY();
        SET @Success = 1;
        SET @ErrorMsg = '';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- rollback transaction on error
        IF @@TRANCOUNT > 0
		BEGIN
            ROLLBACK TRANSACTION
		END

        SET @ErrorMsg = ERROR_MESSAGE();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[insert_animalstate]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Updates the AnimalStates table to add a new animal and state relationship.
-- =============================================
CREATE PROCEDURE [dbo].[insert_animalstate] (
	@AnimalID int,
	@StateID int,
	@NewAnimalStateID int Output,
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

        -- check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

		-- check if state exists
		IF NOT EXISTS (SELECT * FROM State WHERE StateID = @StateID)
        BEGIN
            SET @ErrorMsg = 'State does not exist.';
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

		-- Check if the animal state combination already exists
		IF EXISTS (SELECT 1 FROM AnimalState WHERE AnimalID = @AnimalID AND StateID = @StateID)
		BEGIN
			SET @ErrorMsg = 'Animal is already in this state.'
			ROLLBACK TRANSACTION;
			THROW 51000, @ErrorMsg, 1;
		END

		-- Insert the new row into AnimalState
		INSERT INTO AnimalState (AnimalID, StateID)
		VALUES (@AnimalID, @StateID)

		SET @NewAnimalStateID = SCOPE_IDENTITY();

		-- Check if the transaction completed successfully
		IF @@TRANCOUNT > 0
		BEGIN
			SET @Success = 1
			COMMIT TRANSACTION
		END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END
		SET @ErrorMsg = ERROR_MESSAGE();
		THROW 51000, @ErrorMsg, 1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[update_animal]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Updates an Animal in the Animal table.
-- =============================================
CREATE PROCEDURE [dbo].[update_animal] (
    @AnimalID int,
    @Name nvarchar(50),
	@AnimalTypeID int = NULL,
    @DietTypeID int = NULL,
    @MinWeight int = NULL,
    @MaxWeight int = NULL,
    @Height int = NULL,
    @IsEndangered bit = 0,
    @AverageLifeSpan int = NULL,
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


        --Update Animal
        UPDATE Animal
        SET Name = @Name,
			AnimalTypeID = @AnimalTypeID,
            DietTypeID = @DietTypeID,
            MinWeight = @MinWeight,
            MaxWeight = @MaxWeight,
            Height = @Height,
            IsEndangered = @IsEndangered,
            AverageLifeSpan = @AverageLifeSpan
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
GO
/****** Object:  StoredProcedure [dbo].[update_animaldescription]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Update a record in the AnimalDescription table.
-- =============================================
CREATE PROCEDURE [dbo].[update_animaldescription]
	@AnimalDescriptionID int,
	@AnimalID int,
	@Description nvarchar(MAX),
	@Success bit OUTPUT,
	@ErrorMsg nvarchar(50) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TempAnimalID int, @TempAnimalDescriptionID int;

	SET @Success = 0;
	SET @ErrorMsg = '';

	BEGIN TRY
		BEGIN TRANSACTION;

		-- Check if the animal exists
		SELECT @TempAnimalID = AnimalID FROM Animal WHERE AnimalID = @AnimalID;
		IF @TempAnimalID IS NULL
		BEGIN
			SET @ErrorMsg = 'AnimalID does not exist';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Check if the animal description exists
		SELECT @TempAnimalDescriptionID = AnimalDescriptionID FROM AnimalDescription WHERE AnimalDescriptionID = @AnimalDescriptionID;
		IF @TempAnimalDescriptionID IS NULL
		BEGIN
			SET @ErrorMsg = 'AnimalDescriptionID does not exist';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Ensure that the AnimalID is unique in the AnimalDescription table
		IF EXISTS (SELECT * FROM AnimalDescription WHERE AnimalID = @AnimalID AND AnimalDescriptionID <> @AnimalDescriptionID)
		BEGIN
			SET @ErrorMsg = 'Animal already has a description';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Update the AnimalDescription
		UPDATE AnimalDescription SET AnimalID = @AnimalID, Description = @Description WHERE AnimalDescriptionID = @AnimalDescriptionID;
		
		IF @@TRANCOUNT > 0
		BEGIN
			SET @Success = 1;
			SET @ErrorMsg = '';
			COMMIT TRANSACTION;
		END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;

		SET @ErrorMsg = ERROR_MESSAGE();
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;
	END CATCH;
END



GO
/****** Object:  StoredProcedure [dbo].[update_animalpic]    Script Date: 5/8/2023 1:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Create date: May 7, 2023
-- Description:	Updates a record in the AnimalDescription table.
-- =============================================
CREATE PROCEDURE [dbo].[update_animalpic] (
	@AnimalPicID int,
	@AnimalID int,
	@AltText nvarchar(150) = NULL,
	@Source nvarchar(500) = NULL,
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
	
	--If AnimalPicID does not exist, throw an error and rollback.
    IF NOT EXISTS (SELECT AnimalPicID FROM AnimalPic WHERE AnimalPicID = @AnimalPicID)
        BEGIN
            SET @ErrorMsg = 'Animal picture does not exist.'
            SET @Success = 0;
            ROLLBACK TRANSACTION;
            THROW 51000, @ErrorMsg, 1;
        END

	--Check if the updated AnimalID exists in the Animal table
	IF NOT EXISTS (SELECT AnimalID FROM Animal WHERE AnimalID = @AnimalID)
		BEGIN
			SET @ErrorMsg = 'Animal does not exist.'
			SET @Success = 0;
			ROLLBACK TRANSACTION;
			THROW 51000, @ErrorMsg, 1;
		END

	--Update the AnimalPic table
	UPDATE AnimalPic 
		SET AnimalID = @AnimalID,
			AltText = ISNULL(@AltText, AltText),
			Source = ISNULL(@Source, Source)
	WHERE AnimalPicID = @AnimalPicID
	
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

GO
USE [master]
GO
ALTER DATABASE [WildlifeData] SET  READ_WRITE 
GO
