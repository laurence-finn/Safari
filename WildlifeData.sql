USE [master]
GO
/****** Object:  Database [WildlifeData]    Script Date: 5/6/2023 1:25:55 PM ******/
CREATE DATABASE [WildlifeData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'safari', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\safari.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'safari_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\safari_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Animal]    Script Date: 5/6/2023 1:25:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[AnimalID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StateID] [int] NOT NULL,
	[DietTypeID] [int] NULL,
	[MinWeight] [int] NULL,
	[MaxWeight] [int] NULL,
	[Height] [int] NULL,
	[Endangered] [bit] NULL,
	[AverageLifeSpan] [int] NULL,
	[AnimalPicID] [int] NULL,
	[DateCreated] [datetime] NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalDescription]    Script Date: 5/6/2023 1:25:56 PM ******/
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
/****** Object:  Table [dbo].[AnimalPic]    Script Date: 5/6/2023 1:25:56 PM ******/
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
	[DateUploaded] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_AnimalPic] PRIMARY KEY CLUSTERED 
(
	[AnimalPicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalState]    Script Date: 5/6/2023 1:25:56 PM ******/
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
/****** Object:  Table [dbo].[DietType]    Script Date: 5/6/2023 1:25:56 PM ******/
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
/****** Object:  Table [dbo].[State]    Script Date: 5/6/2023 1:25:56 PM ******/
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
USE [master]
GO
ALTER DATABASE [WildlifeData] SET  READ_WRITE 
GO
