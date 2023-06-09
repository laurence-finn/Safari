USE [master]
GO
/****** Object:  Database [WildlifeData]    Script Date: 7/4/2023 12:34:35 PM ******/
CREATE DATABASE [WildlifeData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WildlifeData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WildlifeData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WildlifeData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WildlifeData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WildlifeData] SET COMPATIBILITY_LEVEL = 150
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  Table [dbo].[Animal]    Script Date: 7/4/2023 12:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[AnimalID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AnimalTypeID] [int] NULL,
	[DietTypeID] [int] NULL,
	[Weight] [decimal](6, 2) NULL,
	[Height] [decimal](6, 2) NULL,
	[Length] [decimal](6, 2) NULL,
	[IsEndangered] [bit] NULL,
	[Lifespan] [decimal](6, 2) NULL,
	[DateSubmitted] [datetime] NULL,
	[IsApproved] [bit] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalDescription]    Script Date: 7/4/2023 12:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalDescription](
	[AnimalDescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_AnimalDescription] PRIMARY KEY CLUSTERED 
(
	[AnimalDescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalPic]    Script Date: 7/4/2023 12:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalPic](
	[AnimalPicID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalID] [int] NOT NULL,
	[FileName] [nvarchar](50) NULL,
	[FilePath] [nvarchar](100) NULL,
	[AltText] [nvarchar](150) NULL,
	[Source] [nvarchar](500) NULL,
	[DateSubmitted] [datetime] NULL,
	[IsApproved] [bit] NULL,
 CONSTRAINT [PK_AnimalPic] PRIMARY KEY CLUSTERED 
(
	[AnimalPicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalState]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  Table [dbo].[AnimalType]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  Table [dbo].[DietType]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  Table [dbo].[State]    Script Date: 7/4/2023 12:34:35 PM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230530201058_UpdateAnimalEntityWeightLengthLifespan', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230530214409_UpdateLifespanDatatype', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230704172458_AddApprovalAndDate', N'7.0.0')
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (2, N'Texas Horned Lizard', 2, 1, CAST(2.50 AS Decimal(6, 2)), CAST(4.50 AS Decimal(6, 2)), CAST(4.50 AS Decimal(6, 2)), 0, CAST(6.00 AS Decimal(6, 2)), NULL, NULL)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (3, N'American Alligator', 2, 1, CAST(750.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), CAST(13.50 AS Decimal(6, 2)), 0, CAST(38.00 AS Decimal(6, 2)), NULL, NULL)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (4, N'Reddish Egret', 4, 1, CAST(1.75 AS Decimal(6, 2)), CAST(34.00 AS Decimal(6, 2)), CAST(29.50 AS Decimal(6, 2)), 0, CAST(17.00 AS Decimal(6, 2)), NULL, NULL)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (5, N'Nine-banded Armadillo', 1, 3, CAST(12.50 AS Decimal(6, 2)), CAST(8.50 AS Decimal(6, 2)), CAST(27.50 AS Decimal(6, 2)), 0, NULL, NULL, NULL)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (6, N'Attwater''s Prairie Chicken', 4, 2, CAST(2.70 AS Decimal(6, 2)), NULL, NULL, 1, CAST(2.50 AS Decimal(6, 2)), NULL, NULL)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (10, N'Test123', 1, 2, CAST(5.00 AS Decimal(6, 2)), CAST(5.00 AS Decimal(6, 2)), CAST(5.00 AS Decimal(6, 2)), 0, CAST(5.00 AS Decimal(6, 2)), NULL, NULL)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (11, N'Test Guy!', 1, 1, CAST(5.00 AS Decimal(6, 2)), CAST(55.00 AS Decimal(6, 2)), CAST(5.00 AS Decimal(6, 2)), 0, CAST(5.00 AS Decimal(6, 2)), NULL, NULL)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (12, N'Pronghorn Test', 1, 1, CAST(35.00 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), CAST(35.00 AS Decimal(6, 2)), 0, CAST(3.00 AS Decimal(6, 2)), NULL, NULL)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (16, N'AK Test', 1, 1, CAST(3.00 AS Decimal(6, 2)), CAST(3.50 AS Decimal(6, 2)), CAST(3.00 AS Decimal(6, 2)), 1, CAST(11.00 AS Decimal(6, 2)), NULL, NULL)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (17, N'Unicorn', 1, 3, CAST(80.00 AS Decimal(6, 2)), CAST(80.00 AS Decimal(6, 2)), CAST(80.00 AS Decimal(6, 2)), 1, CAST(199.00 AS Decimal(6, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalDescription] ON 

INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (1, 2, N'The Texas horned lizard or "horny toad" is a flat-bodied and fierce-looking lizard. The head has numerous horns, all of which are prominent, with two central head spines being much longer than any of the others. This lizard is brownish with two rows of fringed scales along each side of the body. On most Texas horned lizards, a light line can be seen extending from its head down the middle of its back. It is the only species of horned lizard to have dark brown stripes that radiate downward from the eyes and across the top of the head.

Information courtesy Texas Parks and Wildlife Department © 2004')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (2, 3, N'The American alligator is a large, semi-aquatic, armored reptile that is related to crocodiles. Their body alone ranges from 6 - 14 feet long. Almost black in color, the it has prominent eyes and nostrils with coarse scales over the entire body. It has a large, long head with visible upper teeth along the edge of the jaws. Its front feet have 5 toes, while rear feet have 4 toes that are webbed. 

Information courtesy Texas Parks and Wildlife Department © 2004')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (3, 4, N'Reddish egrets grow to a height of 27 to 32 inches (68 to 82 cm), with a wingspan reaching 46 to 49 inches (116 to 124 cm). Their distinguishing characteristics include two distinctly different color phases: a dark phase and a white phase. Reddish egrets in the dark phase are gray with a reddish head and neck feathers. They have bluish legs and a pink bill with a dark tip. In the white phase, these birds will have white feathers, bluish legs, a pink bill with dark tip, and long shaggy plumes on their heads and necks during breeding season. 

Information courtesy Texas Parks and Wildlife Department © 2004')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (4, 5, N'The Nine-banded Armadillo is a cat-sized, armored, insect-eating mammal. Similar in form to an anteater, the bony, scaled shell of the armadillo protects it from attacks by predators. Unfortunately, armadillos often fall victim to automobiles and are frequently found dead on roadsides.

Information courtesy Texas Parks and Wildlife Department © 2004')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (5, 6, N'The Attwater''s prairie chicken is a small, brown bird about 17 inches long, with short, rounded, dark tail. Males have large orange air sacs on the sides of their necks. During mating season, males make a "booming" sound, amplified by inflating the air sacs on their necks, that can be heard 1/2 mile away.

Attwater''s prairie chickens live on coastal prairie grasslands with tall grasses such as little bluestem, Indian grass, and switchgrass. The birds like a variety of tall and short grasses in their habitat. They gather to choose a mate in an area of bare ground or short grass where the males can be easily seen by the females. This is called a "booming groundor lek." The males dance and make a booming noise to attract the females. Hens build their nest in tallgrass and usually lay 12 eggs during nesting season. The eggs hatch in April or May. Small green leaves, seeds, and insects form the diet of the Attwater''s prairie chicken. Attwater''s prairie chickens live about 2-3 years in the wild.

Tall grass coastal prairies are essential to the survival of this species.

Attwater''s prairie chickens are found only on the coastal prairies of Texas.

Prairie chickens are endangered because the tallgrass prairie has been plowed for farmland and covered by cities. Habitat has also been lost because of heavy grazing by cattle, although some cattle ranches maintain good grassland habitat suitable for prairie chickens. Their population has declined dramatically since 1993, when an estimated 456 Attwater prairie chickens existed in the wild. In 1994, that estimate dropped to 158 birds, and by 1996, only 42 of these rare birds were left.

Information courtesy Texas Parks and Wildlife Department © 2004')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (7, 10, N'asdf')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (8, 11, N'asdfasdf')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (9, 12, N'asdf')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (13, 16, N'asdf')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (14, 17, N'They''re pretty rare, honestly')
SET IDENTITY_INSERT [dbo].[AnimalDescription] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalPic] ON 

INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (2, 2, N'2_Texas Horned Lizard_1.jpg', N'images\2_Texas Horned Lizard_1.jpg', N'Photo courtesy Texas Parks and Wildlife Department © 2006', N'Photo courtesy Texas Parks and Wildlife Department © 2006', NULL, NULL)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (3, 3, N'3_American Alligator_1.jpg', N'images\3_American Alligator_1.jpg', N'Photo courtesy Texas Parks and Wildlife Department © 2006', N'Photo courtesy Texas Parks and Wildlife Department © 2006', NULL, NULL)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (4, 6, N'6_Attwater''s Prairie Chicken_1.jpg', N'images\6_Attwater''s Prairie Chicken_1.jpg', N'Photo courtesy Texas Parks and Wildlife Department © 2006', N'Photo courtesy Texas Parks and Wildlife Department © 2006', NULL, NULL)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (6, 10, N'10_Test123_1.jpg', N'images\10_Test123_1.jpg', N'asdf', N'asdf', NULL, NULL)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (7, 11, N'11_Test Guy!_1.jpg', N'images\11_Test Guy!_1.jpg', N'asdf', N'asdf', NULL, NULL)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (8, 12, N'12_Pronghorn Test_1.jpg', N'images\12_Pronghorn Test_1.jpg', N'asdf', N'asdf', NULL, NULL)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (9, 5, N'5_Nine-banded Armadillo_1.jpg', N'images\5_Nine-banded Armadillo_1.jpg', N'asdf', N'asdf', NULL, NULL)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (13, 16, N'16_AK Test_1.jpg', N'images\16_AK Test_1.jpg', N'fff', N'fff', NULL, NULL)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (21, 2, N'2_Texas Horned Lizard_2.jpg', N'images\2_Texas Horned Lizard_2.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (22, 2, N'2_Texas Horned Lizard_3.jpg', N'images\2_Texas Horned Lizard_3.jpg', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AnimalPic] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalState] ON 

INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (2, 2, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (3, 3, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (4, 4, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (5, 5, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (6, 6, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (10, 10, 3)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (11, 11, 1)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (12, 12, 3)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (20, 16, 4)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (21, 17, 16)
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
/****** Object:  Index [IX_Animal_AnimalTypeID]    Script Date: 7/4/2023 12:34:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Animal_AnimalTypeID] ON [dbo].[Animal]
(
	[AnimalTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Animal_DietTypeID]    Script Date: 7/4/2023 12:34:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Animal_DietTypeID] ON [dbo].[Animal]
(
	[DietTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AnimalPic_AnimalID]    Script Date: 7/4/2023 12:34:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_AnimalPic_AnimalID] ON [dbo].[AnimalPic]
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AnimalState_AnimalID]    Script Date: 7/4/2023 12:34:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_AnimalState_AnimalID] ON [dbo].[AnimalState]
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AnimalState_StateID]    Script Date: 7/4/2023 12:34:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_AnimalState_StateID] ON [dbo].[AnimalState]
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[AnimalState]  WITH CHECK ADD  CONSTRAINT [FK_AnimalState_Animal_AnimalID] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnimalState] CHECK CONSTRAINT [FK_AnimalState_Animal_AnimalID]
GO
ALTER TABLE [dbo].[AnimalState]  WITH CHECK ADD  CONSTRAINT [FK_AnimalState_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[AnimalState] CHECK CONSTRAINT [FK_AnimalState_State]
GO
/****** Object:  StoredProcedure [dbo].[delete_animal]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[delete_animaldescription]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[delete_animalpic]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[delete_animalstate]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[insert_animal]    Script Date: 7/4/2023 12:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Modified date: 5/30/2023
-- Description:	Insert an animal
-- =============================================
CREATE PROCEDURE [dbo].[insert_animal] (
	@Name nvarchar(50),
	@AnimalTypeID int = NULL,
	@DietTypeID int = NULL,
    @Weight decimal(6,2) = NULL,
    @Height decimal(6,2) = NULL,
	@Length decimal(6,2) = NULL,
    @IsEndangered bit = 0,
    @Lifespan int = NULL,
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

	-- Check if AverageLifeSpan is greater than 200
	IF @Lifespan > 200
	BEGIN
		SET @ErrorMsg = 'Lifespan cannot be greater than 200 years.';
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

	--Insert into Animal
	INSERT INTO Animal (Name, AnimalTypeID, DietTypeID, Weight, Height, Length, IsEndangered, Lifespan, DateSubmitted, IsApproved)
	VALUES (@Name, @AnimalTypeID, @DietTypeID, @Weight, @Height, @Length, @IsEndangered, @Lifespan, GETDATE(), 0)
	
	--Set the new animal ID to a variable.
	SET @NewAnimalID = @@IDENTITY;

END TRY
BEGIN CATCH
		SET @ErrorMsg = error_message()
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;

END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[insert_animaldescription]    Script Date: 7/4/2023 12:34:35 PM ******/
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
		-- Check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

        -- Check if the animal already has a description
        IF EXISTS (SELECT * FROM AnimalDescription WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal already has a description.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

        -- Insert into AnimalDescription
        INSERT INTO AnimalDescription (AnimalID, Description)
        VALUES (@AnimalID, @Description);

    END TRY
    BEGIN CATCH
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[insert_animalpic]    Script Date: 7/4/2023 12:34:35 PM ******/
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
    @AltText nvarchar(150) = NULL,
    @Source nvarchar(500) = NULL,
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
        -- check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

        -- insert into AnimalPic
        INSERT INTO AnimalPic (AnimalID, FileName, FilePath, AltText, Source, DateSubmitted, IsApproved)
        VALUES (@AnimalID, @FileName, @FilePath, @AltText, @Source, GETDATE(), 0);

        -- set output parameters
        SET @NewAnimalPicID = SCOPE_IDENTITY();
        SET @Success = 1;
        SET @ErrorMsg = '';

    END TRY
    BEGIN CATCH
        SET @ErrorMsg = ERROR_MESSAGE();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[insert_animalstate]    Script Date: 7/4/2023 12:34:35 PM ******/
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

        -- check if animal exists
        IF NOT EXISTS (SELECT * FROM Animal WHERE AnimalID = @AnimalID)
        BEGIN
            SET @ErrorMsg = 'Animal does not exist.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

		-- check if state exists
		IF NOT EXISTS (SELECT * FROM State WHERE StateID = @StateID)
        BEGIN
            SET @ErrorMsg = 'State does not exist.';
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

		-- Check if the animal state combination already exists
		IF EXISTS (SELECT 1 FROM AnimalState WHERE AnimalID = @AnimalID AND StateID = @StateID)
		BEGIN
			SET @ErrorMsg = 'Animal is already in this state.';
			THROW 51000, @ErrorMsg, 1;
		END

		-- Insert the new row into AnimalState
		INSERT INTO AnimalState (AnimalID, StateID)
		VALUES (@AnimalID, @StateID)

		SET @NewAnimalStateID = SCOPE_IDENTITY();

	END TRY
	BEGIN CATCH
		SET @ErrorMsg = ERROR_MESSAGE();
		THROW 51000, @ErrorMsg, 1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[report_animaldescription]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[report_animalpic]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[report_animalstate]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[update_animal]    Script Date: 7/4/2023 12:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laurence Finn
-- Modified date: June 21, 2023
-- Description:	Updates an Animal in the Animal table.
-- =============================================
CREATE PROCEDURE [dbo].[update_animal] (
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
GO
/****** Object:  StoredProcedure [dbo].[update_animaldescription]    Script Date: 7/4/2023 12:34:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[update_animalpic]    Script Date: 7/4/2023 12:34:35 PM ******/
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
	@IsApproved bit = NULL,
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
		Source = ISNULL(@Source, Source),
		IsApproved = ISNULL(@IsApproved, IsApproved)
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
