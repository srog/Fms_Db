CREATE TABLE [dbo].[Match]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[GameDetailsId] INT NOT NULL,
	[SeasonId] INT NOT NULL,
	[DivisionId] INT,
	[Week] INT NOT NULL,
	[HomeTeamId] INT NOT NULL,
	[AwayTeamId] INT NOT NULL,
	[HomeTeamScore] INT NOT NULL,
	[AwayTeamScore] INT NOT NULL,
	[Completed] BIT NOT NULL
)
