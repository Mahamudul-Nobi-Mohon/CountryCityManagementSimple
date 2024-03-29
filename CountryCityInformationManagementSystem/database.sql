USE [master]
GO
/****** Object:  Database [CountryCityManagementSystemDB]    Script Date: 10/19/2016 4:00:41 PM ******/
CREATE DATABASE [CountryCityManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryCityManagementSystemDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryCityManagementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryCityManagementSystemDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryCityManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryCityManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryCityManagementSystemDB]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10/19/2016 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[cityName] [varchar](250) NOT NULL,
	[about] [text] NOT NULL,
	[noOfDwellers] [int] NOT NULL,
	[location] [varchar](250) NOT NULL,
	[weather] [text] NOT NULL,
	[countryName] [varchar](250) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[cityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10/19/2016 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[countryName] [varchar](250) NOT NULL,
	[about] [text] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[countryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[City] ([cityName], [about], [noOfDwellers], [location], [weather], [countryName]) VALUES (N'Dhaka', N'Huge Population', 10, N'Dhaka Division', N'abc', N'Bangladesh')
INSERT [dbo].[City] ([cityName], [about], [noOfDwellers], [location], [weather], [countryName]) VALUES (N'xyz', N'<p><em><strong>fjksl</strong></em></p>', 12, N'sf', N'da', N'Bangladesh')
INSERT [dbo].[Country] ([countryName], [about]) VALUES (N'abc', N'ds')
INSERT [dbo].[Country] ([countryName], [about]) VALUES (N'Bangladesh', N'Beautiful Country')
INSERT [dbo].[Country] ([countryName], [about]) VALUES (N'wq', N'wqw')
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_countryName] FOREIGN KEY([countryName])
REFERENCES [dbo].[Country] ([countryName])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_countryName]
GO
USE [master]
GO
ALTER DATABASE [CountryCityManagementSystemDB] SET  READ_WRITE 
GO
