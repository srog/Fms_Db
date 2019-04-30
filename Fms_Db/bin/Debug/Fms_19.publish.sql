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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


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
PRINT N'Creating [dbo].[Division]...';


GO
CREATE TABLE [dbo].[Division] (
    [Id]   INT            NOT NULL,
    [Name] NVARCHAR (250) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[GameDetails]...';


GO
CREATE TABLE [dbo].[GameDetails] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [TeamId]      INT            NOT NULL,
    [ManagerName] NVARCHAR (250) NOT NULL,
    [CurrentYear] INT            NOT NULL,
    [CurrentWeek] INT            NOT NULL,
    CONSTRAINT [PK_GameDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Match]...';


GO
CREATE TABLE [dbo].[Match] (
    [Id]            INT IDENTITY (1, 1) NOT NULL,
    [SeasonId]      INT NOT NULL,
    [DivisionId]    INT NULL,
    [Week]          INT NOT NULL,
    [HomeTeamId]    INT NOT NULL,
    [AwayTeamId]    INT NOT NULL,
    [HomeTeamScore] INT NOT NULL,
    [AwayTeamScore] INT NOT NULL,
    [Completed]     BIT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[MatchEvent]...';


GO
CREATE TABLE [dbo].[MatchEvent] (
    [Id]        INT IDENTITY (1, 1) NOT NULL,
    [MatchId]   INT NOT NULL,
    [EventType] INT NOT NULL,
    [PlayerId]  INT NOT NULL,
    [TeamId]    INT NULL,
    [Minute]    INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[MatchGoal]...';


GO
CREATE TABLE [dbo].[MatchGoal] (
    [Id]             INT IDENTITY (1, 1) NOT NULL,
    [MatchId]        INT NOT NULL,
    [Minute]         INT NOT NULL,
    [PlayerId]       INT NOT NULL,
    [TeamId]         INT NULL,
    [AssistPlayerId] INT NULL,
    [OwnGoal]        BIT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[News]...';


GO
CREATE TABLE [dbo].[News] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [SeasonId]   INT            NULL,
    [DivisionId] INT            NULL,
    [Week]       INT            NULL,
    [NewsText]   NVARCHAR (MAX) NULL,
    [PlayerId]   INT            NULL,
    [TeamId]     INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Player]...';


GO
CREATE TABLE [dbo].[Player] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (250) NOT NULL,
    [Age]          INT            NOT NULL,
    [Position]     INT            NOT NULL,
    [Rating]       INT            NULL,
    [TeamId]       INT            NULL,
    [Value]        INT            NULL,
    [Retired]      BIT            NULL,
    [InjuredWeeks] INT            NULL,
    CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PlayerAttributes]...';


GO
CREATE TABLE [dbo].[PlayerAttributes] (
    [Id]         INT IDENTITY (1, 1) NOT NULL,
    [PlayerId]   INT NOT NULL,
    [Speed]      INT NOT NULL,
    [Passing]    INT NOT NULL,
    [Shooting]   INT NOT NULL,
    [Skills]     INT NOT NULL,
    [Defending]  INT NOT NULL,
    [Crossing]   INT NOT NULL,
    [Tackling]   INT NOT NULL,
    [Handling]   INT NOT NULL,
    [Strength]   INT NOT NULL,
    [Form]       INT NOT NULL,
    [Morale]     INT NOT NULL,
    [Stamina]    INT NOT NULL,
    [Happinness] INT NOT NULL,
    [Aggression] INT NOT NULL,
    CONSTRAINT [PK_PlayerAttributes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PlayerStats]...';


GO
CREATE TABLE [dbo].[PlayerStats] (
    [Id]          INT IDENTITY (1, 1) NOT NULL,
    [PlayerId]    INT NOT NULL,
    [Games]       INT NOT NULL,
    [Goals]       INT NOT NULL,
    [Assists]     INT NOT NULL,
    [CleanSheets] INT NOT NULL,
    CONSTRAINT [PK_PlayerStats] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Season]...';


GO
CREATE TABLE [dbo].[Season] (
    [Id]           INT IDENTITY (1, 1) NOT NULL,
    [GameDetailId] INT NOT NULL,
    [StartYear]    INT NOT NULL,
    [Completed]    BIT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Team]...';


GO
CREATE TABLE [dbo].[Team] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Name]            NVARCHAR (250) NOT NULL,
    [Division]        INT            NULL,
    [Cash]            INT            NOT NULL,
    [YearFormed]      INT            NULL,
    [StadiumCapacity] INT            NULL,
    CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Transfer]...';


GO
CREATE TABLE [dbo].[Transfer] (
    [Id]            INT IDENTITY (1, 1) NOT NULL,
    [PlayerId]      INT NOT NULL,
    [SeasonId]      INT NOT NULL,
    [Week]          INT NULL,
    [TeamFromId]    INT NOT NULL,
    [TeamToId]      INT NOT NULL,
    [TransferValue] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[sp_GetAllDivisions]...';


GO
CREATE PROCEDURE [dbo].[sp_GetAllDivisions]
AS
	SELECT [Id], [Name] FROM [Division]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_GetAllGameDetails]...';


GO
CREATE PROCEDURE [dbo].[sp_GetAllGameDetails]

AS
	SELECT * FROM [GameDetails]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_GetAllPlayers]...';


GO
CREATE PROCEDURE [dbo].[sp_GetAllPlayers]
AS
	SELECT * FROM [Player]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_GetAllTeams]...';


GO
CREATE PROCEDURE [dbo].[sp_GetAllTeams]

AS
	SELECT * FROM [Team]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_GetDivisionById]...';


GO
CREATE PROCEDURE [dbo].[sp_GetDivisionById]
	@id int
AS
	SELECT * FROM [Division] WHERE [Id] = @id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_GetNews]...';


GO
CREATE PROCEDURE [dbo].[sp_GetNews]
	@seasonId int = null,
	@divisionId int = null,
	@week int = null,
	@playerId int = null,
	@teamId int = null
AS
	SELECT * FROM [News]
	WHERE [SeasonId] = @seasonId
	AND [DivisionId] = @divisionId
	AND [Week] = @week
	AND [PlayerId] = @playerId
	AND [TeamId] = @teamId
	ORDER BY [SeasonId] desc, [DivisionId], [Week] desc, [Id] desc
RETURN 0
GO
PRINT N'Creating [dbo].[sp_GetPlayerById]...';


GO
CREATE PROCEDURE [dbo].[sp_GetPlayerById]
	@id int = 0
AS
	SELECT * FROM [Player] WHERE [Id] = @id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_GetPlayersByTeam]...';


GO
CREATE PROCEDURE [dbo].[sp_GetPlayersByTeam]
	@teamId int
AS
	SELECT * FROM [Player] WHERE [TeamId] = @teamId
RETURN 0
GO
PRINT N'Creating [dbo].[sp_GetTeamById]...';


GO
CREATE PROCEDURE [dbo].[sp_GetTeamById]
	@id int
AS
	SELECT * FROM [Team] WHERE [Id] = @id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_GetTeamsByDivision]...';


GO
CREATE PROCEDURE [dbo].[sp_GetTeamsByDivision]
	@divisionId int
AS
	SELECT * FROM [Team] WHERE [Division] = @divisionId
RETURN 0
GO
PRINT N'Creating [dbo].[sp_InsertGameDetails]...';


GO
CREATE PROCEDURE [dbo].[sp_InsertGameDetails]
	@teamId int,
	@managerName nvarchar(250)
AS
	INSERT INTO [GameDetails] ([TeamId], [ManagerName], [CurrentYear])
	VALUES (@teamId, @managerName,2020)
RETURN 0
GO
PRINT N'Creating [dbo].[sp_InsertNews]...';


GO
CREATE PROCEDURE [dbo].[sp_InsertNews]
	@seasonId int,
	@divisionId int,
	@week int,
	@playerId int,
	@teamId int,
	@newsText nvarchar(max)
AS
	INSERT INTO [News] ([SeasonId], [DivisionId], [Week], [PlayerId], [TeamId], [NewsText])
	VALUES (@seasonId, @divisionId, @week, @playerId, @teamId, @newsText)
RETURN 0
GO
PRINT N'Creating [dbo].[sp_InsertPlayer]...';


GO
CREATE PROCEDURE [dbo].[sp_InsertPlayer]
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int,
	@retired bit,
	@injuredWeeks int
AS
	INSERT INTO [Player] ([Name], [Age], [Rating], [Position], [TeamId], [Value], [Retired], [InjuredWeeks])
	VALUES (@name, @age, @rating, @position, @teamId, @value, @retired, @injuredWeeks)
RETURN 0
GO
PRINT N'Creating [dbo].[sp_InsertPlayerAttributes]...';


GO
CREATE PROCEDURE [dbo].[sp_InsertPlayerAttributes]
	@playerId int,
	@aggression int = 0,
	@crossing int = 0,
	@defending int = 0,
	@form int = 0,
	@handling int = 0,
	@happinness int = 0,
	@morale int = 0,
	@passing int = 0,
	@shooting int = 0,
	@skills int = 0,
	@speed int = 0,
	@stamina int = 0,
	@strength int = 0,
	@tackling int = 0
AS
	INSERT INTO [PlayerAttributes] ([Aggression], [Crossing], [Defending], [Form], [Handling], 
				[Happinness], [Morale], [Passing], [PlayerId], [Shooting], [Skills], [Speed], [Stamina], [Strength], [Tackling])
				VALUES (@aggression, @crossing, @defending, @form, @handling, @happinness, @morale, @passing, @playerId,
						@shooting, @skills, @speed, @stamina, @strength, @tackling)
RETURN 0
GO
PRINT N'Creating [dbo].[sp_InsertPlayerStats]...';


GO
CREATE PROCEDURE [dbo].[sp_InsertPlayerStats]
	@assists int = 0,
	@cleanSheets int = 0,
	@games int = 0,
	@goals int = 0,
	@playerId int
AS
	INSERT INTO [PlayerStats] ([Assists], [CleanSheets], [Games], [Goals], [PlayerId])
	VALUES (@assists, @cleanSheets, @games, @goals, @playerId)
RETURN 0
GO
PRINT N'Creating [dbo].[sp_UpdatePlayer]...';


GO
CREATE PROCEDURE [dbo].[sp_UpdatePlayer]
	@id int = 0,
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int,
	@retired bit,
	@injuredWeeks int
AS
	UPDATE [Player]
	SET [Name] = @name,
		[Rating] = @rating,
		[Age] = @age,
		[Position] = @position,
		[TeamId] = @teamId,
		[Value] = @value,
		[Retired] = @retired,
		[InjuredWeeks] = @injuredWeeks
		WHERE [Id] = @id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_UpdatePlayerAttributes]...';


GO
CREATE PROCEDURE [dbo].[sp_UpdatePlayerAttributes]
	@playerId int,
	@aggression int,
	@crossing int,
	@defending int,
	@form int,
	@handling int,
	@happinness int,
	@morale int,
	@passing int,
	@shooting int = 0,
	@skills int,
	@speed int,
	@stamina int,
	@strength int,
	@tackling int
AS
	UPDATE [PlayerAttributes]  SET 
	[Aggression] = @aggression, 
	[Crossing] = @crossing, 
	[Defending] = @defending, 
	[Form] = @form, 
	[Handling] = @handling,
	[Happinness] = @happinness, 
	[Morale] = @morale, 
	[Passing] = @passing, 
	[Shooting] = @shooting, 
	[Skills] = @skills, 
	[Speed] = @speed, 
	[Stamina] = @stamina, 
	[Strength] = @strength, 
	[Tackling] = @tackling
	WHERE [PlayerId] = @playerId
RETURN 0
GO
PRINT N'Creating [dbo].[sp_UpdatePlayerStats]...';


GO
CREATE PROCEDURE [dbo].[sp_UpdatePlayerStats]
	@assists int,
	@cleanSheets int,
	@games int,
	@goals int,
	@playerId int
AS
	UPDATE [PlayerStats] SET 
	[Assists] = @assists, 
	[CleanSheets] = @cleanSheets, 
	[Games] = @games, 
	[Goals] = @goals 
	WHERE [PlayerId] = @playerId
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
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO