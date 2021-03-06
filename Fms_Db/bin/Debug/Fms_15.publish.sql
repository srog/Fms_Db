﻿/*
Deployment script for Fms

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Fms"
:setvar DefaultFilePrefix "Fms"
:setvar DefaultDataPath "D:\Programs\MSSQL14.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "D:\Programs\MSSQL14.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


IF NOT EXISTS (SELECT * FROM [Division]) 
BEGIN
	INSERT INTO [Division] ([Id], [Name]) VALUES (1, 'Premier League')
	INSERT INTO [Division] ([Id], [Name]) VALUES (2, 'Championship')
	INSERT INTO [Division] ([Id], [Name]) VALUES (3, 'League One')
	INSERT INTO [Division] ([Id], [Name]) VALUES (4, 'League Two')
END

IF NOT EXISTS (SELECT * FROM [Team]) 
BEGIN
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Wrexham', 1, 1930, 2000000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Liverpool', 1, 1898, 45000000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Man City', 1, 1901, 300000000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Man Utd', 1, 1908, 200000000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Aston Villa', 2, 1888, 35000000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Norwich City', 2, 1922, 5000000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Sheffield Utd', 2, 1899, 3000000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Leeds Utd', 2, 1912, 45000000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Shrewsbury Town', 3, 1919, 600000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Oldham Athletic', 3, 1904, 450000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Bristol City', 3, 1891, 1200000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Huddersfield Town', 3, 1900, 1900000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Leyton Orient', 4, 1925, 230000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Plymouth Argyle', 4, 1910, 850000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Chester', 4, 1955, 550000)
	INSERT INTO [Team] ([Name], [Division], [YearFormed], [Cash]) VALUES ('Accrington Stanley', 4, 1891, 350000)
END
GO

GO
PRINT N'Creating [dbo].[GameDetails]...';


GO
CREATE TABLE [dbo].[GameDetails] (
    [Id]          INT            NOT NULL,
    [TeamId]      INT            NOT NULL,
    [ManagerName] NVARCHAR (250) NOT NULL,
    [CurrentYear] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PlayerAttributes]...';


GO
CREATE TABLE [dbo].[PlayerAttributes] (
    [Id]        INT NOT NULL,
    [PlayerId]  INT NOT NULL,
    [Speed]     INT NOT NULL,
    [Passing]   INT NOT NULL,
    [Shooting]  INT NOT NULL,
    [Skills]    INT NOT NULL,
    [Defending] INT NOT NULL,
    [Crossing]  INT NOT NULL,
    [Tackling]  INT NOT NULL,
    [Handling]  INT NOT NULL,
    [Strength]  INT NOT NULL,
    [Form]      INT NOT NULL,
    [Morale]    INT NOT NULL,
    [Stamina]   INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PlayerStats]...';


GO
CREATE TABLE [dbo].[PlayerStats] (
    [Id]          INT NOT NULL,
    [PlayerId]    INT NOT NULL,
    [Games]       INT NOT NULL,
    [Goals]       INT NOT NULL,
    [Assists]     INT NOT NULL,
    [CleanSheets] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[sp_GetAllGameDetails]...';


GO
CREATE PROCEDURE [dbo].[sp_GetAllGameDetails]

AS
	SELECT * FROM [GameDetails]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_InsertGameDetails]...';


GO
CREATE PROCEDURE [dbo].[sp_InsertGameDetails]
	@teamId int,
	@managerName nvarchar(250)
AS
	INSERT INTO [GameDetails] ([TeamId], [ManagerName])
	VALUES (@teamId, @managerName)
RETURN 0
GO
PRINT N'Update complete.';


GO
