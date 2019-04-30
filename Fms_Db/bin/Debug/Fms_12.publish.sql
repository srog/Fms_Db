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
/*
The column [dbo].[Team].[Cash] on table [dbo].[Team] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Team])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Altering [dbo].[Player]...';


GO
ALTER TABLE [dbo].[Player]
    ADD [Value] INT NULL;


GO
PRINT N'Altering [dbo].[Team]...';


GO
ALTER TABLE [dbo].[Team]
    ADD [Cash]       INT NOT NULL,
        [YearFormed] INT NULL;


GO
PRINT N'Altering [dbo].[sp_InsertPlayer]...';


GO
ALTER PROCEDURE [dbo].[sp_InsertPlayer]
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int
AS
	INSERT INTO [Player] ([Name], [Age], [Rating], [Position], [TeamId], [Value])
	VALUES (@name, @age, @rating, @position, @teamId, @value)
RETURN 0
GO
PRINT N'Altering [dbo].[sp_UpdatePlayer]...';


GO
ALTER PROCEDURE [dbo].[sp_UpdatePlayer]
	@id int = 0,
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int
AS
	UPDATE [Player]
	SET [Name] = @name,
		[Rating] = @rating,
		[Age] = @age,
		[Position] = @position,
		[TeamId] = @teamId,
		[Value] = @value
		WHERE [Id] = @id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_UpdateTeam]...';


GO
CREATE PROCEDURE [dbo].[sp_UpdateTeam]
	@id int,
	@name nvarchar(250),
	@division int,
	@cash int
AS
	UPDATE [Team] 
	SET [Name] = @name,
	[Division] = @division,
	[Cash] = @cash
	WHERE [Id] = @id
RETURN 0
GO
PRINT N'Refreshing [dbo].[sp_GetAllPlayers]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_GetAllPlayers]';


GO
PRINT N'Refreshing [dbo].[sp_GetPlayerById]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_GetPlayerById]';


GO
PRINT N'Refreshing [dbo].[sp_GetPlayersByTeam]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_GetPlayersByTeam]';


GO
PRINT N'Refreshing [dbo].[sp_GetAllTeams]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_GetAllTeams]';


GO
PRINT N'Refreshing [dbo].[sp_GetTeamById]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_GetTeamById]';


GO
PRINT N'Refreshing [dbo].[sp_GetTeamsByDivision]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_GetTeamsByDivision]';


GO
PRINT N'Update complete.';


GO
