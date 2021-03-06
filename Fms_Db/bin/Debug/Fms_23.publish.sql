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
--:r .\SeedData\TearDown.sql
--:r .\SeedData\Divisions.sql
--:r .\SeedData\Teams.sql
GO

GO
PRINT N'Altering [dbo].[sp_InsertPlayer]...';


GO
ALTER PROCEDURE [dbo].[sp_InsertPlayer]
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int,
	@retired bit,
	@injuredWeeks int,
	@id int OUTPUT
AS
	INSERT INTO [Player] ([Name], [Age], [Rating], [Position], [TeamId], [Value], [Retired], [InjuredWeeks])
	VALUES (@name, @age, @rating, @position, @teamId, @value, @retired, @injuredWeeks)

	SET @id = SCOPE_IDENTITY()
RETURN 0
GO
PRINT N'Update complete.';


GO
