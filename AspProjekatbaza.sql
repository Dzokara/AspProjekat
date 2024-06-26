USE [master]
GO
/****** Object:  Database [AspProjekat]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE DATABASE [AspProjekat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AspProjekat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AspProjekat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AspProjekat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AspProjekat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AspProjekat] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AspProjekat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AspProjekat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AspProjekat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AspProjekat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AspProjekat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AspProjekat] SET ARITHABORT OFF 
GO
ALTER DATABASE [AspProjekat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AspProjekat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AspProjekat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AspProjekat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AspProjekat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AspProjekat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AspProjekat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AspProjekat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AspProjekat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AspProjekat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AspProjekat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AspProjekat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AspProjekat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AspProjekat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AspProjekat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AspProjekat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AspProjekat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AspProjekat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AspProjekat] SET  MULTI_USER 
GO
ALTER DATABASE [AspProjekat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AspProjekat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AspProjekat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AspProjekat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AspProjekat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AspProjekat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AspProjekat] SET QUERY_STORE = ON
GO
ALTER DATABASE [AspProjekat] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AspProjekat]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20-Jun-24 11:17:02 AM ******/
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
/****** Object:  Table [dbo].[BenefitJobs]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenefitJobs](
	[BenefitId] [int] NOT NULL,
	[JobId] [int] NOT NULL,
 CONSTRAINT [PK_BenefitJobs] PRIMARY KEY CLUSTERED 
(
	[BenefitId] ASC,
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Benefits]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benefits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Benefits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryJobs]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryJobs](
	[CategoryId] [int] NOT NULL,
	[JobId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryJobs] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[StrackTrace] [nvarchar](max) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ErrorLogs] PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[Discriminator] [nvarchar](13) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegionId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[RemoteId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PositionId] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
	[Deadline] [datetime2](7) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTechnology]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTechnology](
	[TechnologyId] [int] NOT NULL,
	[JobId] [int] NOT NULL,
 CONSTRAINT [PK_JobTechnology] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[TechnologyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobUser]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobUser](
	[UserId] [int] NOT NULL,
	[JobId] [int] NOT NULL,
	[Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_JobUser] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Remote]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Remote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Remote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Technology]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technology](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Technology] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testimonials]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testimonials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Testimonials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseName] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[UseCaseData] [nvarchar](max) NOT NULL,
	[ExecutedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](60) NOT NULL,
	[Password] [nvarchar](120) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240619113321_init', N'8.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240619181950_Category fk fix', N'8.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240619190230_Fixed another many to many table bug', N'8.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240620085317_benefit', N'8.0.6')
GO
INSERT [dbo].[BenefitJobs] ([BenefitId], [JobId]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[Benefits] ON 

INSERT [dbo].[Benefits] ([Id], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (1, CAST(N'2024-06-19T18:14:33.4433686' AS DateTime2), CAST(N'2024-06-20T07:46:49.8778260' AS DateTime2), 1, N'Benefitt')
SET IDENTITY_INSERT [dbo].[Benefits] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [ImageId], [Title], [Description], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, 7, N'New title1', N'Deskripcijaaaaaaaa', CAST(N'2024-06-19T20:24:11.6343437' AS DateTime2), CAST(N'2024-06-20T08:35:36.5934508' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (1, CAST(N'2024-06-19T18:36:33.9290496' AS DateTime2), CAST(N'2024-06-20T07:54:24.2471389' AS DateTime2), 1, N'KategorijaUpdate')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[CategoryJobs] ([CategoryId], [JobId]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [BlogId], [Text], [AuthorId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, 1, N'Tekst11231231312', 1, CAST(N'2024-06-19T20:46:15.9492625' AS DateTime2), CAST(N'2024-06-19T20:47:17.0475241' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [ImageId], [Description], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (1, 8, N'Deskripcijaaaaaaaa', CAST(N'2024-06-19T14:17:31.7449360' AS DateTime2), CAST(N'2024-06-20T08:46:52.9882059' AS DateTime2), 0, N'Firma Update1')
INSERT [dbo].[Companies] ([Id], [ImageId], [Description], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (2, 2, N'Opis opis opis', CAST(N'2024-06-19T14:25:21.9062169' AS DateTime2), CAST(N'2024-06-19T15:01:28.6875099' AS DateTime2), 0, N'Firma2')
INSERT [dbo].[Companies] ([Id], [ImageId], [Description], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (3, 3, N'Opis opis opis', CAST(N'2024-06-19T14:32:33.2601081' AS DateTime2), CAST(N'2024-06-19T15:01:25.0470602' AS DateTime2), 0, N'Firma3')
INSERT [dbo].[Companies] ([Id], [ImageId], [Description], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (4, 4, N'Opis opis opis', CAST(N'2024-06-19T14:37:56.2552787' AS DateTime2), NULL, 1, N'Firma4')
INSERT [dbo].[Companies] ([Id], [ImageId], [Description], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (5, 5, N'Opis opis opis', CAST(N'2024-06-19T14:42:23.8783728' AS DateTime2), NULL, 1, N'Firma5')
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
INSERT [dbo].[ErrorLogs] ([ErrorId], [Message], [StrackTrace], [Time]) VALUES (N'd2ed6c0f-3c29-414d-9676-0595f32ee327', N'No service for type ''AspProjekat.Application.UseCases.Queries.IGetSingleCompanyQuery'' has been registered.', N'   at Microsoft.Extensions.DependencyInjection.ServiceProviderServiceExtensions.GetRequiredService(IServiceProvider provider, Type serviceType)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ServicesModelBinder.BindModelAsync(ModelBindingContext bindingContext)
   at Microsoft.AspNetCore.Mvc.ModelBinding.ParameterBinder.BindModelAsync(ActionContext actionContext, IModelBinder modelBinder, IValueProvider valueProvider, ParameterDescriptor parameter, ModelMetadata metadata, Object value, Object container)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerBinderDelegateProvider.<>c__DisplayClass0_0.<<CreateBinderDelegate>g__Bind|0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at AspProjekat.API.Core.GlobalExceptionHandlingMiddleware.InvokeAsync(HttpContext httpContext) in C:\Users\dzokara\Desktop\AspProjekat\AspProjekat.API\Core\GlobalExceptionHandlingMiddleware.cs:line 24', CAST(N'2024-06-20T07:20:05.2572857' AS DateTime2))
INSERT [dbo].[ErrorLogs] ([ErrorId], [Message], [StrackTrace], [Time]) VALUES (N'3de5de77-a548-4287-a5a0-2700f3a0e12f', N'An error occurred while saving the entity changes. See the inner exception for details.', N'   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.SqlServer.Update.Internal.SqlServerModificationCommandBatch.Execute(IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.Execute(IEnumerable`1 commandBatches, IRelationalConnection connection)
   at Microsoft.EntityFrameworkCore.Storage.RelationalDatabase.SaveChanges(IList`1 entries)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(IList`1 entriesToSave)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(StateManager stateManager, Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.<>c.<SaveChanges>b__112_0(DbContext _, ValueTuple`2 t)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges(Boolean acceptAllChangesOnSuccess)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChanges()
   at AspProjekat.DataAccess.AspContext.SaveChanges() in C:\Users\dzokara\Desktop\AspProjekat\AspProjekat.DataAccess\AspContext.cs:line 84
   at AspProjekat.Implementation.UseCases.Commands.Jobs.EfUpdateJobCommand.Execute(UpdateJobDto request) in C:\Users\dzokara\Desktop\AspProjekat\AspProjekat.Implementation\UseCases\Commands\Jobs\EfUpdateJobCommand.cs:line 51
   at AspProjekat.Implementation.UseCaseHandler.HandleCommand[TData](ICommand`1 command, TData data) in C:\Users\dzokara\Desktop\AspProjekat\AspProjekat.Implementation\UseCaseHandler.cs:line 28
   at AspProjekat.API.Controllers.JobController.UpdateJob(Int32 id, UpdateJobDto dto, IUpdateJobCommand command) in C:\Users\dzokara\Desktop\AspProjekat\AspProjekat.API\Controllers\JobController.cs:line 86
   at lambda_method58(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at AspProjekat.API.Core.GlobalExceptionHandlingMiddleware.InvokeAsync(HttpContext httpContext) in C:\Users\dzokara\Desktop\AspProjekat\AspProjekat.API\Core\GlobalExceptionHandlingMiddleware.cs:line 24', CAST(N'2024-06-20T09:12:21.1547825' AS DateTime2))
INSERT [dbo].[ErrorLogs] ([ErrorId], [Message], [StrackTrace], [Time]) VALUES (N'd45adb39-2f77-41e5-9c58-7a6609e1e309', N'No service for type ''AspProjekat.Application.UseCases.Commands.Categories.IUpdateCategoryCommand'' has been registered.', N'   at Microsoft.Extensions.DependencyInjection.ServiceProviderServiceExtensions.GetRequiredService(IServiceProvider provider, Type serviceType)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ServicesModelBinder.BindModelAsync(ModelBindingContext bindingContext)
   at Microsoft.AspNetCore.Mvc.ModelBinding.ParameterBinder.BindModelAsync(ActionContext actionContext, IModelBinder modelBinder, IValueProvider valueProvider, ParameterDescriptor parameter, ModelMetadata metadata, Object value, Object container)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerBinderDelegateProvider.<>c__DisplayClass0_0.<<CreateBinderDelegate>g__Bind|0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at AspProjekat.API.Core.GlobalExceptionHandlingMiddleware.InvokeAsync(HttpContext httpContext) in C:\Users\dzokara\Desktop\AspProjekat\AspProjekat.API\Core\GlobalExceptionHandlingMiddleware.cs:line 24', CAST(N'2024-06-20T07:53:10.8967465' AS DateTime2))
INSERT [dbo].[ErrorLogs] ([ErrorId], [Message], [StrackTrace], [Time]) VALUES (N'20e1be4f-e9b9-4570-b306-d796ae7a8e71', N'No service for type ''AspProjekat.Application.UseCases.Commands.Companies.ICreateCompanyCommand'' has been registered.', N'   at Microsoft.Extensions.DependencyInjection.ServiceProviderServiceExtensions.GetRequiredService(IServiceProvider provider, Type serviceType)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ServicesModelBinder.BindModelAsync(ModelBindingContext bindingContext)
   at Microsoft.AspNetCore.Mvc.ModelBinding.ParameterBinder.BindModelAsync(ActionContext actionContext, IModelBinder modelBinder, IValueProvider valueProvider, ParameterDescriptor parameter, ModelMetadata metadata, Object value, Object container)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerBinderDelegateProvider.<>c__DisplayClass0_0.<<CreateBinderDelegate>g__Bind|0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at AspProjekat.API.Core.GlobalExceptionHandlingMiddleware.InvokeAsync(HttpContext httpContext) in C:\Users\dzokara\Desktop\AspProjekat\AspProjekat.API\Core\GlobalExceptionHandlingMiddleware.cs:line 24', CAST(N'2024-06-19T13:40:45.2129523' AS DateTime2))
INSERT [dbo].[ErrorLogs] ([ErrorId], [Message], [StrackTrace], [Time]) VALUES (N'dccd7f4c-548b-4634-ba9f-e40b48fa64b2', N'No service for type ''AspProjekat.Application.UseCases.Commands.Users.IUpdateUseAccessCommand'' has been registered.', N'   at Microsoft.Extensions.DependencyInjection.ServiceProviderServiceExtensions.GetRequiredService(IServiceProvider provider, Type serviceType)
   at Microsoft.AspNetCore.Mvc.ModelBinding.Binders.ServicesModelBinder.BindModelAsync(ModelBindingContext bindingContext)
   at Microsoft.AspNetCore.Mvc.ModelBinding.ParameterBinder.BindModelAsync(ActionContext actionContext, IModelBinder modelBinder, IValueProvider valueProvider, ParameterDescriptor parameter, ModelMetadata metadata, Object value, Object container)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerBinderDelegateProvider.<>c__DisplayClass0_0.<<CreateBinderDelegate>g__Bind|0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at AspProjekat.API.Core.GlobalExceptionHandlingMiddleware.InvokeAsync(HttpContext httpContext) in C:\Users\dzokara\Desktop\AspProjekat\AspProjekat.API\Core\GlobalExceptionHandlingMiddleware.cs:line 24', CAST(N'2024-06-19T12:49:57.4345868' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([Id], [Path], [Discriminator], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, N'635d1991-187f-43e2-ae43-fea011539ee9.PNG', N'CompanyImage', CAST(N'2024-06-19T14:17:31.7449051' AS DateTime2), NULL, 1)
INSERT [dbo].[Image] ([Id], [Path], [Discriminator], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, N'36bc064f-de8d-494e-acb2-72f3f0354945.PNG', N'CompanyImage', CAST(N'2024-06-19T14:25:08.7142664' AS DateTime2), NULL, 1)
INSERT [dbo].[Image] ([Id], [Path], [Discriminator], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (3, N'3ee83c6b-294b-49df-a0e0-dd0d47e9a855.PNG', N'CompanyImage', CAST(N'2024-06-19T14:32:33.2600764' AS DateTime2), NULL, 1)
INSERT [dbo].[Image] ([Id], [Path], [Discriminator], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (4, N'24e43633-e5b2-4f72-8822-22e32352545b.PNG', N'CompanyImage', CAST(N'2024-06-19T14:37:56.2552431' AS DateTime2), NULL, 1)
INSERT [dbo].[Image] ([Id], [Path], [Discriminator], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, N'/images/cddcd660-e025-4c39-8688-9ba3ad67a74b.PNG', N'CompanyImage', CAST(N'2024-06-19T14:42:23.8783403' AS DateTime2), NULL, 1)
INSERT [dbo].[Image] ([Id], [Path], [Discriminator], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (6, N'/images/0d0e553d-7df2-4938-b214-91ee9c4725b1.png', N'BlogImage', CAST(N'2024-06-19T20:24:11.6343125' AS DateTime2), NULL, 1)
INSERT [dbo].[Image] ([Id], [Path], [Discriminator], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (7, N'/images/02630e84-c760-4b75-8eb0-43c1c8ba58c0.PNG', N'BlogImage', CAST(N'2024-06-20T08:35:36.5934080' AS DateTime2), NULL, 1)
INSERT [dbo].[Image] ([Id], [Path], [Discriminator], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (8, N'/images/c330cd50-0179-4fcf-b247-1eb3e52d28d7.PNG', N'CompanyImage', CAST(N'2024-06-20T08:46:52.9881779' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [RegionId], [TypeId], [RemoteId], [CompanyId], [PositionId], [Description], [Salary], [Deadline], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, 1, 4, 1, 1, 1, N'Novi opis posla', CAST(2000.00 AS Decimal(18, 2)), CAST(N'2024-06-20T21:06:18.8470000' AS DateTime2), CAST(N'2024-06-19T21:09:07.0221021' AS DateTime2), CAST(N'2024-06-20T09:15:42.9091514' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
INSERT [dbo].[JobTechnology] ([TechnologyId], [JobId]) VALUES (1, 1)
INSERT [dbo].[JobTechnology] ([TechnologyId], [JobId]) VALUES (2, 1)
GO
INSERT [dbo].[JobUser] ([UserId], [JobId], [Time]) VALUES (1, 1, CAST(N'2024-06-19T21:10:04.2874370' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([Id], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (1, CAST(N'2024-06-19T19:54:56.1807483' AS DateTime2), CAST(N'2024-06-20T08:20:43.8745184' AS DateTime2), 1, N'Senior PHP Developer')
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (1, CAST(N'2024-06-19T19:40:08.3897115' AS DateTime2), CAST(N'2024-06-20T08:13:51.7794648' AS DateTime2), 1, N'Region2')
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Remote] ON 

INSERT [dbo].[Remote] ([Id], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (1, CAST(N'2024-11-11T00:00:00.0000000' AS DateTime2), NULL, 1, N'Home')
SET IDENTITY_INSERT [dbo].[Remote] OFF
GO
SET IDENTITY_INSERT [dbo].[Technology] ON 

INSERT [dbo].[Technology] ([Id], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (1, CAST(N'2024-06-19T18:55:31.0817468' AS DateTime2), CAST(N'2024-06-20T08:14:14.8471862' AS DateTime2), 1, N'Asp')
INSERT [dbo].[Technology] ([Id], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (2, CAST(N'2024-11-11T00:00:00.0000000' AS DateTime2), NULL, 1, N'Junior PHP Developer')
SET IDENTITY_INSERT [dbo].[Technology] OFF
GO
SET IDENTITY_INSERT [dbo].[Testimonials] ON 

INSERT [dbo].[Testimonials] ([Id], [UserId], [Text], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, 1, N'Wow really nice i got my first job here!', CAST(N'2024-06-19T21:02:46.5691548' AS DateTime2), NULL, 1)
INSERT [dbo].[Testimonials] ([Id], [UserId], [Text], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, 1, N'Wow really nice i got my first job here111111111111!', CAST(N'2024-06-19T21:03:02.5466248' AS DateTime2), CAST(N'2024-06-19T21:05:02.9206613' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Testimonials] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([Id], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (3, CAST(N'2024-11-11T00:00:00.0000000' AS DateTime2), NULL, 1, N'Full Time')
INSERT [dbo].[Types] ([Id], [CreatedAt], [UpdatedAt], [IsActive], [Name]) VALUES (4, CAST(N'2024-11-11T00:00:00.0000000' AS DateTime2), NULL, 1, N'Half Time')
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (1, N'UserRegistration', N'unauthorized', N'{"Email":"djole@email","Username":"dzokara","FirstName":"Djordje","LastName":"Jovanovic","Password":"Sifra123"}', CAST(N'2024-06-19T11:39:56.3933333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (2, N'UserRegistration', N'unauthorized', N'{"Email":"string","Username":"string","FirstName":"string","LastName":"string","Password":"string"}', CAST(N'2024-06-19T12:45:00.8933333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (3, N'CreateJob', N'dzokara', N'{"PositionId":0,"CompanyId":0,"TechnologyIds":[0],"RegionId":0,"TypeId":0,"Description":"string","Salary":0.0,"BenefitIds":[0],"Deadline":"2024-06-19T12:47:24.747Z","RemoteId":0}', CAST(N'2024-06-19T12:52:20.8000000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (4, N'CreateCompany', N'dzokara', N'{"Name":"Firma1","Description":"Opis opis opis","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"council.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"council.PNG\""],"Content-Type":["image/png"]},"Length":36417,"Name":"image","FileName":"council.PNG"}}', CAST(N'2024-06-19T14:11:15.7666667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (5, N'CreateCompany', N'dzokara', N'{"Name":"Firma1","Description":"Opis opis opis","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"council.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"council.PNG\""],"Content-Type":["image/png"]},"Length":36417,"Name":"image","FileName":"council.PNG"}}', CAST(N'2024-06-19T14:17:31.5633333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (6, N'CreateCompany', N'dzokara', N'{"Name":"Firma1","Description":"Opis opis opis","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"council.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"council.PNG\""],"Content-Type":["image/png"]},"Length":36417,"Name":"image","FileName":"council.PNG"}}', CAST(N'2024-06-19T14:22:04.3233333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (7, N'CreateCompany', N'dzokara', N'{"Name":"Firma2","Description":"Opis opis opis","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"council.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"council.PNG\""],"Content-Type":["image/png"]},"Length":36417,"Name":"image","FileName":"council.PNG"}}', CAST(N'2024-06-19T14:22:19.4866667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (8, N'CreateCompany', N'dzokara', N'{"Name":"Firma3","Description":"Opis opis opis","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"council.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"council.PNG\""],"Content-Type":["image/png"]},"Length":36417,"Name":"image","FileName":"council.PNG"}}', CAST(N'2024-06-19T14:31:57.4400000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (9, N'CreateCompany', N'dzokara', N'{"Name":"Firma4","Description":"Opis opis opis","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"council.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"council.PNG\""],"Content-Type":["image/png"]},"Length":36417,"Name":"image","FileName":"council.PNG"}}', CAST(N'2024-06-19T14:37:31.9600000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (10, N'CreateCompany', N'dzokara', N'{"Name":"Firma5","Description":"Opis opis opis","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"council.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"council.PNG\""],"Content-Type":["image/png"]},"Length":36417,"Name":"image","FileName":"council.PNG"}}', CAST(N'2024-06-19T14:42:15.2333333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (11, N'CreateCompany', N'dzokara', N'{"Name":"Firma5","Description":"Opis opis opis","Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"council.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"council.PNG\""],"Content-Type":["image/png"]},"Length":36417,"Name":"image","FileName":"council.PNG"}}', CAST(N'2024-06-19T14:55:44.0666667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (12, N'Search Companies', N'dzokara', N'{"Keyword":"s","PerPage":10,"Page":1}', CAST(N'2024-06-19T14:56:24.9766667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (13, N'Search Companies', N'dzokara', N'{"Keyword":"f","PerPage":10,"Page":1}', CAST(N'2024-06-19T14:56:30.1300000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (14, N'Search Companies', N'dzokara', N'{"Keyword":"null","PerPage":10,"Page":1}', CAST(N'2024-06-19T14:58:54.6533333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (15, N'Search Companies', N'dzokara', N'{"Keyword":"f","PerPage":10,"Page":1}', CAST(N'2024-06-19T14:59:10.7100000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (16, N'Search Companies', N'dzokara', N'{"Keyword":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T15:03:58.0466667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (17, N'Search Users', N'dzokara', N'{"Keyword":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T15:04:08.4233333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (18, N'Search Companies', N'dzokara', N'{"Keyword":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T15:04:15.6166667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (19, N'Search Companies', N'dzokara', N'{"Keyword":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T15:05:46.7800000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (20, N'Search benefits', N'dzokara', N'{"Keyword":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T18:14:08.6100000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (21, N'Create benefit', N'dzokara', N'{"Name":"Benefit1"}', CAST(N'2024-06-19T18:14:33.3233333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (22, N'Search benefits', N'dzokara', N'{"Keyword":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T18:14:37.4866667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (23, N'Create category', N'dzokara', N'{"Name":"Category1"}', CAST(N'2024-06-19T18:36:33.8033333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (24, N'Create category', N'dzokara', N'{"Name":"Category1"}', CAST(N'2024-06-19T18:36:36.1433333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (25, N'Search categories', N'dzokara', N'{"Keyword":"a","PerPage":10,"Page":1}', CAST(N'2024-06-19T18:38:09.7800000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (26, N'Create technology', N'dzokara', N'{"Name":"Technology1"}', CAST(N'2024-06-19T18:55:30.9400000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (27, N'Create technology', N'dzokara', N'{"Name":"Technology1"}', CAST(N'2024-06-19T18:55:32.5933333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (28, N'Search technologies', N'dzokara', N'{"Keyword":"a","PerPage":10,"Page":1}', CAST(N'2024-06-19T18:56:06.1766667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (29, N'Search technologies', N'dzokara', N'{"Keyword":"te","PerPage":10,"Page":1}', CAST(N'2024-06-19T18:56:10.1466667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (30, N'Create region', N'dzokara', N'{"Name":"Region1"}', CAST(N'2024-06-19T19:40:08.2366667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (31, N'Search Regions', N'dzokara', N'{"Keyword":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T19:40:13.6900000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (32, N'Create position', N'dzokara', N'{"Name":"Junior PHP Developer"}', CAST(N'2024-06-19T19:54:56.0500000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (33, N'Create position', N'dzokara', N'{"Name":"Junior PHP Developer"}', CAST(N'2024-06-19T19:54:58.0600000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (34, N'Search Positions', N'dzokara', N'{"Keyword":"o","PerPage":10,"Page":1}', CAST(N'2024-06-19T19:55:30.2500000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (35, N'Search Positions', N'dzokara', N'{"Keyword":"juna","PerPage":10,"Page":1}', CAST(N'2024-06-19T19:55:37.9166667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (36, N'Create Blog', N'dzokara', N'{"Title":"Blog1","Description":"Opis prvog blogaaa","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"Naamloos.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"Naamloos.png\""],"Content-Type":["image/png"]},"Length":12580,"Name":"Image","FileName":"Naamloos.png"}}', CAST(N'2024-06-19T20:24:11.4666667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (37, N'Search Blogs', N'dzokara', N'{"PerPage":10,"Page":1}', CAST(N'2024-06-19T20:24:44.8766667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (38, N'Create Comment', N'dzokara', N'{"AuthorId":1,"BlogId":1,"Text":"Tekst11231231312"}', CAST(N'2024-06-19T20:46:15.7933333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (39, N'Search Blogs', N'dzokara', N'{"PerPage":10,"Page":1}', CAST(N'2024-06-19T20:46:46.2000000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (40, N'Create testimonial', N'dzokara', N'{"UserId":1,"Text":"Wow really nice i got my first job here!"}', CAST(N'2024-06-19T21:02:46.4266667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (41, N'Search Testimonials', N'dzokara', N'{"PerPage":10,"Page":1}', CAST(N'2024-06-19T21:02:52.1500000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (42, N'Create testimonial', N'dzokara', N'{"UserId":1,"Text":"Wow really nice i got my first job here111111111111!"}', CAST(N'2024-06-19T21:03:02.5366667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (43, N'Search Testimonials', N'dzokara', N'{"PerPage":10,"Page":1}', CAST(N'2024-06-19T21:03:06.6866667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (44, N'CreateJob', N'dzokara', N'{"PositionId":1,"CompanyId":1,"TechnologyIds":[1],"RegionId":1,"TypeId":3,"Description":"Opis posla 123455","Salary":50000.0,"BenefitIds":[1],"CategoryIds":[1],"Deadline":"2024-06-19T21:06:18.847Z","RemoteId":1}', CAST(N'2024-06-19T21:08:43.3866667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (45, N'CreateJob', N'dzokara', N'{"PositionId":1,"CompanyId":1,"TechnologyIds":[1],"RegionId":1,"TypeId":3,"Description":"Opis posla 123455","Salary":50000.0,"BenefitIds":[1],"CategoryIds":[1],"Deadline":"2024-06-20T21:06:18.847Z","RemoteId":1}', CAST(N'2024-06-19T21:09:06.9466667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (46, N'Job like', N'dzokara', N'1', CAST(N'2024-06-19T21:10:04.2633333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (47, N'Search Users', N'dzokara', N'{"RegionId":null,"TypeId":null,"CompanyId":null,"PositionId":null,"Salary":null,"Benefits":null,"Technologies":null,"Categories":null,"RemoteId":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T21:15:47.4666667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (48, N'Search Users', N'dzokara', N'{"RegionId":null,"TypeId":null,"CompanyId":null,"PositionId":null,"Salary":null,"Benefits":null,"Technologies":null,"Categories":null,"RemoteId":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T21:18:38.0500000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (49, N'Search Users', N'dzokara', N'{"RegionId":null,"TypeId":null,"CompanyId":null,"PositionId":null,"Salary":null,"Benefits":null,"Technologies":null,"Categories":null,"RemoteId":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T21:23:59.5200000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (50, N'Search Users', N'dzokara', N'{"RegionId":null,"TypeId":null,"CompanyId":null,"PositionId":null,"Salary":null,"Benefits":null,"Technologies":null,"Categories":null,"RemoteId":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T21:26:09.8366667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (51, N'Search audit log', N'dzokara', N'{"UseCaseName":null,"Username":null,"PerPage":10,"Page":1}', CAST(N'2024-06-19T21:57:38.6500000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (52, N'Search audit log', N'dzokara', N'{"UseCaseName":null,"Username":"dz","PerPage":10,"Page":1}', CAST(N'2024-06-19T21:59:16.0133333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (53, N'Single company', N'dzokara', N'1', CAST(N'2024-06-20T07:20:55.3166667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (54, N'Single company', N'dzokara', N'5', CAST(N'2024-06-20T07:21:56.5366667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (55, N'Single blog', N'dzokara', N'1', CAST(N'2024-06-20T07:28:45.3233333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (56, N'Single blog', N'dzokara', N'2', CAST(N'2024-06-20T07:28:52.8333333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (57, N'Single job', N'dzokara', N'1', CAST(N'2024-06-20T07:29:04.0833333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (58, N'Search benefits', N'dzokara', N'{"Keyword":null,"PerPage":10,"Page":1}', CAST(N'2024-06-20T07:45:57.2366667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (59, N'Search benefits', N'dzokara', N'{"Keyword":null,"PerPage":10,"Page":1}', CAST(N'2024-06-20T07:46:16.7466667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (60, N'Update Benefit', N'dzokara', N'{"Id":1,"Name":"Benefitt","isActive":true}', CAST(N'2024-06-20T07:46:49.8000000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (61, N'Update Benefit', N'dzokara', N'{"Id":1,"Name":"","isActive":true}', CAST(N'2024-06-20T07:47:01.4000000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (62, N'Update Benefit', N'dzokara', N'{"Id":2,"Name":"","isActive":true}', CAST(N'2024-06-20T07:52:20.6300000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (63, N'Update category', N'dzokara', N'{"Id":1,"Name":"KategorijaUpdate","isActive":true}', CAST(N'2024-06-20T07:54:24.1433333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (64, N'Update category', N'dzokara', N'{"Id":1,"Name":"KategorijaUpdate","isActive":true}', CAST(N'2024-06-20T07:54:46.3000000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (65, N'Update region', N'dzokara', N'{"Id":1,"Name":"Region1","isActive":true}', CAST(N'2024-06-20T08:13:39.7033333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (66, N'Update region', N'dzokara', N'{"Id":1,"Name":"Region2","isActive":true}', CAST(N'2024-06-20T08:13:51.7400000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (67, N'Update technology', N'dzokara', N'{"Id":1,"Name":"Asp","isActive":true}', CAST(N'2024-06-20T08:14:14.8233333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (68, N'Update position', N'dzokara', N'{"Id":1,"Name":"Senior PHP Developer","isActive":true}', CAST(N'2024-06-20T08:20:43.7466667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (69, N'Update Blog', N'dzokara', N'{"Id":1,"Title":"New title","Description":"Deskripcijaaaaaaaa","Image":null,"isActive":true}', CAST(N'2024-06-20T08:34:50.4500000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (70, N'Update Blog', N'dzokara', N'{"Id":1,"Title":"New title","Description":"Deskripcijaaaaaaaa","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"underrot.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"underrot.PNG\""],"Content-Type":["image/png"]},"Length":28242,"Name":"Image","FileName":"underrot.PNG"},"isActive":true}', CAST(N'2024-06-20T08:35:25.6566667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (71, N'Update Blog', N'dzokara', N'{"Id":1,"Title":"New title1","Description":"Deskripcijaaaaaaaa","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"underrot.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"underrot.PNG\""],"Content-Type":["image/png"]},"Length":28242,"Name":"Image","FileName":"underrot.PNG"},"isActive":true}', CAST(N'2024-06-20T08:35:36.5500000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (72, N'Update Company', N'dzokara', N'{"Id":1,"Name":"Firma Update","Description":"Deskripcijaaaaaaaa","Image":null}', CAST(N'2024-06-20T08:46:27.7433333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (73, N'Update Company', N'dzokara', N'{"Id":1,"Name":"Firma Update","Description":"Deskripcijaaaaaaaa","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"underrot.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"underrot.PNG\""],"Content-Type":["image/png"]},"Length":28242,"Name":"Image","FileName":"underrot.PNG"}}', CAST(N'2024-06-20T08:46:45.7366667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (74, N'Update Company', N'dzokara', N'{"Id":1,"Name":"Firma Update1","Description":"Deskripcijaaaaaaaa","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"underrot.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"underrot.PNG\""],"Content-Type":["image/png"]},"Length":28242,"Name":"Image","FileName":"underrot.PNG"}}', CAST(N'2024-06-20T08:46:52.9466667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (75, N'Update Job', N'dzokara', N'{"Id":1,"PositionId":null,"CompanyId":null,"TechnologyIds":[1,2],"RegionId":null,"TypeId":null,"Description":"Novi opis posla","Salary":null,"BenefitIds":null,"CategoryIds":null,"Deadline":null,"RemoteId":2}', CAST(N'2024-06-20T09:11:34.6333333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (76, N'Update Job', N'dzokara', N'{"Id":1,"PositionId":null,"CompanyId":null,"TechnologyIds":[1,2],"RegionId":null,"TypeId":null,"Description":"Novi opis posla","Salary":null,"BenefitIds":null,"CategoryIds":null,"Deadline":null,"RemoteId":null}', CAST(N'2024-06-20T09:11:52.2200000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (77, N'Update Job', N'dzokara', N'{"Id":1,"PositionId":null,"CompanyId":null,"TechnologyIds":[2],"RegionId":null,"TypeId":null,"Description":"Novi opis posla","Salary":null,"BenefitIds":null,"CategoryIds":null,"Deadline":null,"RemoteId":null}', CAST(N'2024-06-20T09:12:35.2300000' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (78, N'Update Job', N'dzokara', N'{"Id":1,"PositionId":null,"CompanyId":null,"TechnologyIds":[2],"RegionId":null,"TypeId":4,"Description":null,"Salary":2000.0,"BenefitIds":null,"CategoryIds":null,"Deadline":null,"RemoteId":null}', CAST(N'2024-06-20T09:13:10.3833333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (79, N'Update Job', N'dzokara', N'{"Id":1,"PositionId":null,"CompanyId":null,"TechnologyIds":null,"RegionId":null,"TypeId":4,"Description":null,"Salary":2000.0,"BenefitIds":null,"CategoryIds":null,"Deadline":null,"RemoteId":null}', CAST(N'2024-06-20T09:13:19.8266667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Username], [UseCaseData], [ExecutedAt]) VALUES (80, N'Update Job', N'dzokara', N'{"Id":1,"PositionId":null,"CompanyId":null,"TechnologyIds":null,"RegionId":null,"TypeId":4,"Description":null,"Salary":2000.0,"BenefitIds":null,"CategoryIds":null,"Deadline":null,"RemoteId":null}', CAST(N'2024-06-20T09:15:42.7266667' AS DateTime2))
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, N'djole@email', N'$2a$10$m2R.iOhFhDpC6hcEQNOJz.qfSQ0RDgi1etk0jgKp7Omzdl6hsMg1e', N'dzokara', N'Djordje', N'Jovanovic', CAST(N'2024-06-19T11:39:56.6949963' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 6)
GO
/****** Object:  Index [IX_BenefitJobs_JobId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_BenefitJobs_JobId] ON [dbo].[BenefitJobs]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Blogs_ImageId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Blogs_ImageId] ON [dbo].[Blogs]
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryJobs_JobId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryJobs_JobId] ON [dbo].[CategoryJobs]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_AuthorId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_AuthorId] ON [dbo].[Comments]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_BlogId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_BlogId] ON [dbo].[Comments]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Companies_ImageId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Companies_ImageId] ON [dbo].[Companies]
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_CompanyId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_CompanyId] ON [dbo].[Jobs]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_PositionId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_PositionId] ON [dbo].[Jobs]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_RegionId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_RegionId] ON [dbo].[Jobs]
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_RemoteId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_RemoteId] ON [dbo].[Jobs]
(
	[RemoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobs_TypeId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Jobs_TypeId] ON [dbo].[Jobs]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobTechnology_TechnologyId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_JobTechnology_TechnologyId] ON [dbo].[JobTechnology]
(
	[TechnologyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobUser_UserId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_JobUser_UserId] ON [dbo].[JobUser]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Testimonials_UserId]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Testimonials_UserId] ON [dbo].[Testimonials]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UseCaseLogs_Username_UseCaseName_ExecutedAt]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_UseCaseLogs_Username_UseCaseName_ExecutedAt] ON [dbo].[UseCaseLogs]
(
	[Username] ASC,
	[UseCaseName] ASC,
	[ExecutedAt] ASC
)
INCLUDE([UseCaseData]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 20-Jun-24 11:17:02 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Image] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Image] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Jobs] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Jobs] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Testimonials] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Testimonials] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[BenefitJobs]  WITH CHECK ADD  CONSTRAINT [FK_BenefitJobs_Benefits_BenefitId] FOREIGN KEY([BenefitId])
REFERENCES [dbo].[Benefits] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BenefitJobs] CHECK CONSTRAINT [FK_BenefitJobs_Benefits_BenefitId]
GO
ALTER TABLE [dbo].[BenefitJobs]  WITH CHECK ADD  CONSTRAINT [FK_BenefitJobs_Jobs_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BenefitJobs] CHECK CONSTRAINT [FK_BenefitJobs_Jobs_JobId]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Image_ImageId] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image] ([Id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Image_ImageId]
GO
ALTER TABLE [dbo].[CategoryJobs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryJobs_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryJobs] CHECK CONSTRAINT [FK_CategoryJobs_Categories_CategoryId]
GO
ALTER TABLE [dbo].[CategoryJobs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryJobs_Jobs_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryJobs] CHECK CONSTRAINT [FK_CategoryJobs_Jobs_JobId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Blogs_BlogId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_AuthorId]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Image_ImageId] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image] ([Id])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Image_ImageId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Companies_CompanyId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Positions_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Positions_PositionId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Region_RegionId] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Region_RegionId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Remote_RemoteId] FOREIGN KEY([RemoteId])
REFERENCES [dbo].[Remote] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Remote_RemoteId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Types_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Types_TypeId]
GO
ALTER TABLE [dbo].[JobTechnology]  WITH CHECK ADD  CONSTRAINT [FK_JobTechnology_Jobs_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobTechnology] CHECK CONSTRAINT [FK_JobTechnology_Jobs_JobId]
GO
ALTER TABLE [dbo].[JobTechnology]  WITH CHECK ADD  CONSTRAINT [FK_JobTechnology_Technology_TechnologyId] FOREIGN KEY([TechnologyId])
REFERENCES [dbo].[Technology] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobTechnology] CHECK CONSTRAINT [FK_JobTechnology_Technology_TechnologyId]
GO
ALTER TABLE [dbo].[JobUser]  WITH CHECK ADD  CONSTRAINT [FK_JobUser_Jobs_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobUser] CHECK CONSTRAINT [FK_JobUser_Jobs_JobId]
GO
ALTER TABLE [dbo].[JobUser]  WITH CHECK ADD  CONSTRAINT [FK_JobUser_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobUser] CHECK CONSTRAINT [FK_JobUser_Users_UserId]
GO
ALTER TABLE [dbo].[Testimonials]  WITH CHECK ADD  CONSTRAINT [FK_Testimonials_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Testimonials] CHECK CONSTRAINT [FK_Testimonials_Users_UserId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
/****** Object:  StoredProcedure [dbo].[AddUseCaseLog]    Script Date: 20-Jun-24 11:17:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AddUseCaseLog] @UseCaseName nvarchar(50), @Username nvarchar(20), @Data nvarchar(MAX), @ExecutedAt Datetime
as begin
	insert into UseCaseLogs (UseCaseName, Username, UseCaseData, ExecutedAt) 
	VALUES (@useCaseName,@username, @data, @executedAt)
end
GO
USE [master]
GO
ALTER DATABASE [AspProjekat] SET  READ_WRITE 
GO
