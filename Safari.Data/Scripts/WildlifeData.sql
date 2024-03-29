USE [master]
GO
/****** Object:  Database [WildlifeData]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE DATABASE [WildlifeData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WildlifeData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WildlifeData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WildlifeData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WildlifeData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  Table [dbo].[Animal]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  Table [dbo].[AnimalDescription]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  Table [dbo].[AnimalPic]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  Table [dbo].[AnimalState]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  Table [dbo].[AnimalType]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 8/17/2023 11:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/17/2023 11:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/17/2023 11:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/17/2023 11:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/17/2023 11:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/17/2023 11:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 8/17/2023 11:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DietType]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  Table [dbo].[State]    Script Date: 8/17/2023 11:00:52 AM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230715161342_CreateIdentitySchema', N'7.0.8')
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (2, N'Texas Horned Lizard', 2, 1, CAST(2.00 AS Decimal(6, 2)), CAST(4.00 AS Decimal(6, 2)), CAST(4.00 AS Decimal(6, 2)), 0, CAST(6.00 AS Decimal(6, 2)), CAST(N'2023-07-18T11:59:59.330' AS DateTime), 1)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (3, N'American Alligator', 2, 1, CAST(750.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), CAST(13.00 AS Decimal(6, 2)), 0, CAST(38.00 AS Decimal(6, 2)), CAST(N'2023-07-18T11:59:59.330' AS DateTime), 1)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (4, N'Reddish Egret', 4, 1, CAST(1.00 AS Decimal(6, 2)), CAST(34.00 AS Decimal(6, 2)), CAST(29.00 AS Decimal(6, 2)), 0, CAST(17.00 AS Decimal(6, 2)), CAST(N'2023-07-18T11:59:59.330' AS DateTime), 1)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (5, N'Nine-banded Armadillo', 1, 3, CAST(12.00 AS Decimal(6, 2)), CAST(8.00 AS Decimal(6, 2)), CAST(27.00 AS Decimal(6, 2)), 0, NULL, CAST(N'2023-07-18T11:59:59.330' AS DateTime), 1)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (6, N'Attwater''s Prairie Chicken', 4, 2, CAST(2.00 AS Decimal(6, 2)), NULL, NULL, 1, CAST(2.00 AS Decimal(6, 2)), CAST(N'2023-07-18T11:59:59.330' AS DateTime), 1)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (19, N'Bearded Seal', 1, 1, CAST(688.00 AS Decimal(6, 2)), NULL, CAST(96.00 AS Decimal(6, 2)), 0, CAST(25.00 AS Decimal(6, 2)), CAST(N'2023-07-19T11:40:47.607' AS DateTime), 1)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (20, N'Leatherback Turtle', 3, 2, CAST(875.00 AS Decimal(6, 2)), NULL, CAST(66.00 AS Decimal(6, 2)), 1, CAST(50.00 AS Decimal(6, 2)), CAST(N'2023-08-03T20:15:04.213' AS DateTime), 1)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (21, N'Thresher Shark', 5, 1, NULL, NULL, NULL, 0, CAST(35.00 AS Decimal(6, 2)), CAST(N'2023-08-03T20:27:26.273' AS DateTime), 1)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (22, N'Bison', 1, NULL, CAST(1350.00 AS Decimal(6, 2)), NULL, CAST(115.00 AS Decimal(6, 2)), 0, CAST(13.00 AS Decimal(6, 2)), CAST(N'2023-08-03T20:57:10.550' AS DateTime), 1)
INSERT [dbo].[Animal] ([AnimalID], [Name], [AnimalTypeID], [DietTypeID], [Weight], [Height], [Length], [IsEndangered], [Lifespan], [DateSubmitted], [IsApproved]) VALUES (23, N'Eskimo Curlew', 4, NULL, NULL, NULL, CAST(12.00 AS Decimal(6, 2)), 1, CAST(10.00 AS Decimal(6, 2)), CAST(N'2023-08-03T21:03:42.993' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalDescription] ON 

INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (1, 2, N'The Texas horned lizard or "horny toad" is a flat-bodied and fierce-looking lizard. The head has numerous horns, all of which are prominent, with two central head spines being much longer than any of the others. This lizard is brownish with two rows of fringed scales along each side of the body. On most Texas horned lizards, a light line can be seen extending from its head down the middle of its back. It is the only species of horned lizard to have dark brown stripes that radiate downward from the eyes and across the top of the head.

Information courtesy Texas Parks and Wildlife Department © 2004')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (2, 3, N'<p>The American alligator is a large, semi-aquatic, armored reptile that is related to crocodiles. Their body alone ranges from 6 - 14 feet long. Almost black in color, the it has prominent eyes and nostrils with coarse scales over the entire body. It has a large, long head with visible upper teeth along the edge of the jaws. Its front feet have 5 toes, while rear feet have 4 toes that are webbed.</p>
<p>Information courtesy Texas Parks and Wildlife Department &copy; 2004</p>')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (3, 4, N'<p>Reddish egrets grow to a height of 27 to 32 inches (68 to 82 cm), with a wingspan reaching 46 to 49 inches (116 to 124 cm). Their distinguishing characteristics include two distinctly different color phases: a dark phase and a white phase. Reddish egrets in the dark phase are gray with a reddish head and neck feathers. They have bluish legs and a pink bill with a dark tip. In the white phase, these birds will have white feathers, bluish legs, a pink bill with dark tip, and long shaggy plumes on their heads and necks during breeding season.</p>
<p>Information courtesy Texas Parks and Wildlife Department &copy; 2004</p>')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (4, 5, N'<p>The Nine-banded Armadillo is a cat-sized, armored, insect-eating mammal. Similar in form to an anteater, the bony, scaled shell of the armadillo protects it from attacks by predators. Unfortunately, armadillos often fall victim to automobiles and are frequently found dead on roadsides.</p>
<p>Information courtesy Texas Parks and Wildlife Department &copy; 2004</p>')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (5, 6, N'<p>The Attwater''s prairie chicken is a small, brown bird about 17 inches long, with short, rounded, dark tail. Males have large orange air sacs on the sides of their necks. During mating season, males make a "booming" sound, amplified by inflating the air sacs on their necks, that can be heard 1/2 mile away.</p>
<p><strong>Life History</strong></p>
<p>Attwater''s prairie chickens live on coastal prairie grasslands with tall grasses such as little bluestem, Indian grass, and switchgrass. The birds like a variety of tall and short grasses in their habitat. They gather to choose a mate in an area of bare ground or short grass where the males can be easily seen by the females. This is called a "booming groundor lek." The males dance and make a booming noise to attract the females. Hens build their nest in tallgrass and usually lay 12 eggs during nesting season. The eggs hatch in April or May. Small green leaves, seeds, and insects form the diet of the Attwater''s prairie chicken. Attwater''s prairie chickens live about 2-3 years in the wild.</p>
<p><strong>Habitat</strong></p>
<p>Tall grass coastal prairies are essential to the survival of this species.</p>
<p><strong>Distribution</strong></p>
<p>Attwater''s prairie chickens are found only on the coastal prairies of Texas.&nbsp;</p>
<p><strong>Other</strong></p>
<p>Prairie chickens are endangered because the tallgrass prairie has been plowed for farmland and covered by cities. Habitat has also been lost because of heavy grazing by cattle, although some cattle ranches maintain good grassland habitat suitable for prairie chickens. Their population has declined dramatically since 1993, when an estimated 456 Attwater prairie chickens existed in the wild. In 1994, that estimate dropped to 158 birds, and by 1996, only 42 of these rare birds were left.&nbsp;</p>
<p>Information courtesy Texas Parks and Wildlife Department &copy; 2004</p>')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (15, 19, N'<p>The bearded seal gets its name from the long white whiskers on its face. These whiskers are very sensitive and are used to find food on the ocean bottom.</p>
<p>Bearded seals inhabit circumpolar Arctic and sub-Arctic waters that are relatively shallow (primarily less than about 1,600 feet deep) and seasonally ice-covered. In U.S. waters, they are found off the coast of Alaska over the continental shelf in the Bering, Chukchi, and Beaufort Seas. Because bearded seals are closely associated with sea ice, particularly pack ice, their seasonal distribution and movements are linked to seasonal changes in ice conditions. To remain associated with their preferred ice habitat, bearded seals generally move north in late spring and summer as the ice melts and retreats and then south in the fall as sea ice forms. As such, they are sensitive to changes in the environment that affect the annual timing and extent of sea ice formation and breakup.</p>
<p>There is no accurate population count at this time, but it is estimated that there are probably over 500,000 bearded seals worldwide.</p>
<p>The Alaska stock is the only stock of bearded seals in U.S. waters.</p>
<p>Although subsistence harvest of bearded seals occurs in some parts of the species&rsquo; range, there is little or no evidence that these harvests currently have or are likely to pose a significant threat. While the United States does not allow commercial harvest of marine mammals, such harvests are permitted in some other portions of the species&rsquo; range; however, there is currently no significant commercial harvest of bearded seals and significant harvests seem unlikely in the foreseeable future.</p>
<p><strong>References </strong></p>
<p>NOAA Fisheries. (n.d.). <em>Bearded seal Species Profile, Alaska Department of Fish and Game.</em> Retrieved July 19, 2023, from <a href="https://www.adfg.alaska.gov/index.cfm?adfg=beardedseal.main" target="_blank" rel="noopener">https://www.adfg.alaska.gov/index.cfm?adfg=beardedseal.main</a></p>')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (16, 20, N'<p>The leatherback sea turtle is the largest turtle in the world. They are the only species of sea turtle that lack scales and a hard shell. They are named for their tough rubbery skin and have existed in their current form since the age of the dinosaurs. Leatherbacks are highly migratory, some swimming over 10,000 miles a year between nesting and foraging grounds. They are also accomplished divers with the deepest recorded dive reaching nearly 4,000 feet&mdash;deeper than most marine mammals.</p>
<p><strong>References</strong></p>
<p style="text-indent: -.5in; line-height: 200%; tab-size: 36pt; margin: 0in 0in 0in .5in;">NOAA Fisheries. (2020, August 10). <em>Leatherback turtle</em>. NOAA. https://www.fisheries.noaa.gov/species/leatherback-turtle</p>')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (17, 21, N'<p>U.S. wild-caught Atlantic common thresher shark is a smart seafood choice because it is sustainably managed and responsibly harvested under U.S. regulations.</p>
<p><strong>Appearance</strong></p>
<div class="wyswyg-edit field field--name-field-appearance field--type-text-long field--label-hidden field--item">
<ul>
<li>Thresher sharks are brown, gray, blue-gray, or blackish on the back and underside of their snout.</li>
<li>They are lighter on the sides, and fully white below.</li>
<li>Their pectoral, pelvic, and dorsal fins are blackish, and there are sometimes white dots on the tips of the pectoral, pelvic, and tail fins.</li>
<li>Their tail fin is sickle-shaped, and the upper part is extremely long, about half the length of their body.&nbsp;</li>
</ul>
<p><strong>Habitat</strong></p>
<div class="wyswyg-edit field field--name-field-habitat field--type-text-long field--label-hidden field--item">
<ul>
<li>Common thresher sharks are highly migratory species, often traveling over entire ocean basins.</li>
<li>They&rsquo;re most common near land and are often found in areas rich with plankton, where their prey is also abundant.&nbsp;</li>
</ul>
</div>
</div>
<p><strong>References</strong></p>
<p><span style="color: rgb(5, 16, 62); font-family: ''Times New Roman'', Inter, ''sans-serif''; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: -48px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">NOAA Fisheries. (2023, June 22).&nbsp;</span><em style="box-sizing: border-box; border-width: 0px; border-style: solid; border-color: rgb(236, 237, 238); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; color: rgb(5, 16, 62); font-family: ''Times New Roman'', Inter, ''sans-serif''; font-size: medium; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: -48px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Atlantic Common Thresher Shark</em><span style="color: rgb(5, 16, 62); font-family: ''Times New Roman'', Inter, ''sans-serif''; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: -48px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">. NOAA. Retrieved August 3, 2023, from&nbsp;</span><span style="box-sizing: border-box; border-width: 0px; border-style: solid; border-color: rgb(236, 237, 238); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; word-break: break-all; color: rgb(5, 16, 62); font-family: ''Times New Roman'', Inter, ''sans-serif''; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: -48px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">https://www.fisheries.noaa.gov/species/atlantic-common-thresher-shark</span></p>')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (18, 22, N'<p>Largest native terrestrial mammal in North America.&nbsp;&nbsp;Both massiveness and height of body accentuated by the shoulder hump.&nbsp;&nbsp;Both sexes have short, black horns that curve upward and inward and taper to a circular, relatively sharp tip.&nbsp;&nbsp;Males are larger and more heavily built than females.&nbsp;&nbsp;Pelage long, with coarse guard hairs and a thick, wooly undercoat.&nbsp;&nbsp;Brown-black hair is long and shaggy on forehead, neck, shoulder hump, and forelegs, but short and straight on hindquarters.&nbsp;&nbsp;Hooves are black, legs are short and stout, and tail is short and tufted at tip.&nbsp;&nbsp;Two subspecies recognized, the woodland (<em>B. b. athabascae</em>) and plains (<em>B. b. bison</em>) bison.</p>
<p><strong>References</strong></p>
<p><span style="color: rgb(5, 16, 62); font-family: ''Times New Roman'', Inter, ''sans-serif''; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: -48px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Best, T. (n.d.).&nbsp;</span><em style="box-sizing: border-box; border-width: 0px; border-style: solid; border-color: rgb(236, 237, 238); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; color: rgb(5, 16, 62); font-family: ''Times New Roman'', Inter, ''sans-serif''; font-size: medium; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: -48px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Bison</em><span style="color: rgb(5, 16, 62); font-family: ''Times New Roman'', Inter, ''sans-serif''; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: -48px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">. Outdoor Alabama. Retrieved August 3, 2023, from&nbsp;</span><span style="box-sizing: border-box; border-width: 0px; border-style: solid; border-color: rgb(236, 237, 238); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; word-break: break-all; color: rgb(5, 16, 62); font-family: ''Times New Roman'', Inter, ''sans-serif''; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: -48px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">https://www.outdooralabama.com/ungulates/bison</span></p>')
INSERT [dbo].[AnimalDescription] ([AnimalDescriptionID], [AnimalID], [Description]) VALUES (19, 23, N'<p>The Eskimo curlew has warm brown feathers with white speckles. Cinnamon-colored feathers line the undersides of their wings. They have long, dark green, dark brown, or dark grey-blue legs and are about 12 inches in length.</p>
<p>In the mid-1800''s, huge flocks of Eskimo Curlew migrated north from South America to their nesting grounds in the Alaskan and Canadian Arctic. Historic reports tell of the skies being full of Eskimo Curlews as they migrated through the prairie states and provinces. One historic report describes a single flock feeding in Nebraska that was said to have covered 40 to 50 acres of ground. During migration, they fed on grasshoppers and other insects on the grasslands of the central United States.</p>
<p>Between 1870 and 1890, unrestricted hunting rapidly reduced populations of Eskimo Curlew. Considered very good to eat, the birds were killed by thousands of market hunters, just as the Passenger Pigeon had been years earlier. The curlew''s lack of fear and habit of traveling in large flocks made it an easy target.&nbsp;</p>
<p>Information courtesy Texas Parks and Wildlife Department &copy; 2004</p>')
SET IDENTITY_INSERT [dbo].[AnimalDescription] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalPic] ON 

INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (2, 2, N'2_Texas Horned Lizard_1.jpg', N'images\2_Texas Horned Lizard_1.jpg', N'Photo courtesy Texas Parks and Wildlife Department © 2006', N'Photo courtesy Texas Parks and Wildlife Department © 2006', NULL, 1)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (3, 3, N'3_American Alligator_1.jpg', N'images\3_American Alligator_1.jpg', N'Photo courtesy Texas Parks and Wildlife Department © 2006', N'Photo courtesy Texas Parks and Wildlife Department © 2006', NULL, 1)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (23, 6, N'6_Attwater''s Prairie Chicken_1.jpg', N'images\6_Attwater''s Prairie Chicken_1.jpg', N'Attwater''s Prairie Chicken', N'Photo courtesy Texas Parks and Wildlife Department © 2006', CAST(N'2023-07-19T11:00:38.860' AS DateTime), 1)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (24, 5, N'5_Nine-banded Armadillo_1.jpg', N'images\5_Nine-banded Armadillo_1.jpg', N'Nine-banded Armadillo, Photo courtesy Texas Parks and Wildlife Department © 2006', N'Photo courtesy Texas Parks and Wildlife Department © 2006', CAST(N'2023-07-19T11:14:49.513' AS DateTime), 1)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (25, 4, N'4_Reddish Egret_1.jpg', N'images\4_Reddish Egret_1.jpg', N'Reddish Egret', N'Pixabay, https://pixabay.com/photos/red-egret-bird-wildlife-egret-2035802/', CAST(N'2023-07-19T11:15:37.760' AS DateTime), 1)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (26, 19, N'19_Bearded Seal_1.jpg', N'images\19_Bearded Seal_1.jpg', N'Bearded Seal, John Jansen, NOAA Fisheries, https://www.fisheries.noaa.gov/species/bearded-seal', N'John Jansen, NOAA Fisheries, https://www.fisheries.noaa.gov/species/bearded-seal', CAST(N'2023-07-19T11:40:47.633' AS DateTime), 1)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (27, 20, N'20_Leatherback Turtle_1.jpg', N'images\20_Leatherback Turtle_1.jpg', N'NOAA Fisheries, https://www.fisheries.noaa.gov/species/leatherback-turtle', N'NOAA Fisheries, https://www.fisheries.noaa.gov/species/leatherback-turtle', CAST(N'2023-08-03T20:15:04.277' AS DateTime), 1)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (28, 21, N'21_Thresher Shark_1.jpg', N'images\21_Thresher Shark_1.jpg', N'Walter Heim, NOAA Fisheries, https://www.fisheries.noaa.gov/species/atlantic-common-thresher-shark', N'Walter Heim, NOAA Fisheries, https://www.fisheries.noaa.gov/species/atlantic-common-thresher-shark', CAST(N'2023-08-03T20:27:26.310' AS DateTime), 1)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (29, 22, N'22_Bison_1.jpg', N'images\22_Bison_1.jpg', N'U. S. Fish and Wildlife Service, https://www.outdooralabama.com/ungulates/bison', N'U. S. Fish and Wildlife Service, https://www.outdooralabama.com/ungulates/bison', CAST(N'2023-08-03T20:57:10.600' AS DateTime), 1)
INSERT [dbo].[AnimalPic] ([AnimalPicID], [AnimalID], [FileName], [FilePath], [AltText], [Source], [DateSubmitted], [IsApproved]) VALUES (30, 23, N'23_Eskimo Curlew_1.jpg', N'images\23_Eskimo Curlew_1.jpg', N'Photo courtesy Texas Parks and Wildlife Department © 2006', N'Photo courtesy Texas Parks and Wildlife Department © 2006', CAST(N'2023-08-03T21:03:43.020' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AnimalPic] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalState] ON 

INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (2, 2, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (42, 19, 2)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (43, 3, 1)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (44, 3, 4)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (45, 3, 9)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (46, 3, 10)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (47, 3, 18)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (48, 3, 24)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (49, 3, 33)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (50, 3, 36)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (51, 3, 40)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (52, 3, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (53, 6, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (54, 5, 16)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (55, 5, 18)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (56, 5, 36)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (57, 5, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (58, 4, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (119, 20, 1)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (120, 20, 2)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (121, 20, 5)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (122, 20, 7)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (123, 20, 8)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (124, 20, 9)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (125, 20, 10)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (126, 20, 11)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (127, 20, 18)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (128, 20, 19)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (129, 20, 20)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (130, 20, 21)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (131, 20, 24)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (132, 20, 29)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (133, 20, 30)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (134, 20, 32)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (135, 20, 33)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (136, 20, 37)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (137, 20, 39)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (138, 20, 40)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (139, 20, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (140, 20, 46)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (141, 20, 47)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (142, 21, 1)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (143, 21, 7)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (144, 21, 8)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (145, 21, 9)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (146, 21, 10)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (147, 21, 18)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (148, 21, 19)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (149, 21, 29)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (150, 21, 30)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (151, 21, 33)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (152, 21, 39)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (153, 21, 40)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (154, 21, 43)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (155, 21, 46)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (167, 22, 1)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (168, 22, 4)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (169, 22, 6)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (170, 22, 13)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (171, 22, 14)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (172, 22, 15)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (173, 22, 25)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (174, 22, 27)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (175, 22, 34)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (176, 22, 36)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (177, 22, 41)
INSERT [dbo].[AnimalState] ([AnimalStateID], [AnimalID], [StateID]) VALUES (183, 23, 43)
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
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'25e4d185-0264-43f9-9a6e-237d52c2877a', N'admin@safariamerica.com', N'ADMIN@SAFARIAMERICA.COM', N'admin@safariamerica.com', N'ADMIN@SAFARIAMERICA.COM', 1, N'AQAAAAIAAYagAAAAEFUHFmsfntufdGbnthaF5YbkB1ESCjmP6WfhJHqqm8XouPuwurXJCrIwfFFfiC7XNw==', N'B4SJWTGRTXLOODOB7KWJTCPZIUWEAVXA', N'2fdefc6e-60ff-4708-9219-edb7ce00db5e', NULL, 0, 0, NULL, 1, 0)
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
/****** Object:  Index [IX_Animal_AnimalTypeID]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_Animal_AnimalTypeID] ON [dbo].[Animal]
(
	[AnimalTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Animal_DietTypeID]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_Animal_DietTypeID] ON [dbo].[Animal]
(
	[DietTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AnimalPic_AnimalID]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_AnimalPic_AnimalID] ON [dbo].[AnimalPic]
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AnimalState_AnimalID]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_AnimalState_AnimalID] ON [dbo].[AnimalState]
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AnimalState_StateID]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_AnimalState_StateID] ON [dbo].[AnimalState]
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 8/17/2023 11:00:52 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
/****** Object:  StoredProcedure [dbo].[delete_allanimalstate]    Script Date: 8/17/2023 11:00:52 AM ******/
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
GO
/****** Object:  StoredProcedure [dbo].[delete_animal]    Script Date: 8/17/2023 11:00:52 AM ******/
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

        SET @Success = 1;
    END TRY
    BEGIN CATCH
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[delete_animaldescription]    Script Date: 8/17/2023 11:00:52 AM ******/
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

GO
/****** Object:  StoredProcedure [dbo].[delete_animalpic]    Script Date: 8/17/2023 11:00:52 AM ******/
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

        SET @Success = 1;

    END TRY
    BEGIN CATCH
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[delete_animalstate]    Script Date: 8/17/2023 11:00:52 AM ******/
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
	
	--If AnimalStateID does not exist, throw an error and rollback.
	IF NOT EXISTS (SELECT AnimalStateID FROM AnimalState WHERE AnimalStateID = @AnimalStateID)
		BEGIN
			SET @ErrorMsg = 'Animal state does not exist.'
			SET @Success = 0;
			THROW 51000, @ErrorMsg, 1;
		END

	--Delete from AnimalState table
	DELETE FROM AnimalState WHERE AnimalStateID = @AnimalStateID
	SET @Success = 1
	SET @ErrorMsg = ''

END TRY
BEGIN CATCH
		SET @ErrorMsg = error_message()
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;

END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[insert_animal]    Script Date: 8/17/2023 11:00:52 AM ******/
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
	SET @Success = 1;

END TRY
BEGIN CATCH
		SET @ErrorMsg = error_message()
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;

END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[insert_animaldescription]    Script Date: 8/17/2023 11:00:52 AM ******/
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
		SET @Success = 1;

    END TRY
    BEGIN CATCH
        SET @ErrorMsg = error_message();
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[insert_animalpic]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insert_animalstate]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[report_animaldescription]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[report_animalpic]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[report_animalstate]    Script Date: 8/17/2023 11:00:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[update_animal]    Script Date: 8/17/2023 11:00:52 AM ******/
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

		SET @Success = 1;

    END TRY

    BEGIN CATCH
        SET @ErrorMsg = error_message()
        SET @Success = 0;
        THROW 51000, @ErrorMsg, 1;
    END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[update_animaldescription]    Script Date: 8/17/2023 11:00:52 AM ******/
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

		SET @Success = 1;
		
	END TRY

	BEGIN CATCH
		SET @ErrorMsg = ERROR_MESSAGE();
		SET @Success = 0;
		THROW 51000, @ErrorMsg, 1;
	END CATCH;
END



GO
/****** Object:  StoredProcedure [dbo].[update_animalpic]    Script Date: 8/17/2023 11:00:52 AM ******/
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
	@AnimalID int = NULL,
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
	
	--If AnimalPicID does not exist, throw an error and rollback.
    IF NOT EXISTS (SELECT AnimalPicID FROM AnimalPic WHERE AnimalPicID = @AnimalPicID)
        BEGIN
            SET @ErrorMsg = 'Animal picture does not exist.'
            SET @Success = 0;
            THROW 51000, @ErrorMsg, 1;
        END

	--Check if the updated AnimalID exists in the Animal table
	IF NOT EXISTS (SELECT AnimalID FROM Animal WHERE AnimalID = @AnimalID)
		BEGIN
			SET @ErrorMsg = 'Animal does not exist.'
			SET @Success = 0;
			THROW 51000, @ErrorMsg, 1;
		END

	--Update the AnimalPic table
	UPDATE AnimalPic 
	SET AnimalID = ISNULL(@AnimalID, AnimalID),
		AltText = ISNULL(@AltText, AltText),
		Source = ISNULL(@Source, Source),
		IsApproved = ISNULL(@IsApproved, IsApproved)
	WHERE AnimalPicID = @AnimalPicID

	SET @Success = 1;

END TRY

BEGIN CATCH

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
