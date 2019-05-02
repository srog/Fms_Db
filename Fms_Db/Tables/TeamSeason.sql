CREATE TABLE [dbo].[TeamSeason]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[TeamId] INT NOT NULL,
	[GameDetailsId] INT NOT NULL,
	[SeasonId] INT NOT NULL,
	[DivisionId] INT NOT NULL,
	[Played] INT,
	[Won] INT,
	[Drawn] INT,
	[Lost] INT,
	[Points] INT,
	[GoalsFor] INT,
	[GoalsAgainst] INT,
	[Position] INT
)
