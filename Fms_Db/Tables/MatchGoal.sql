CREATE TABLE [dbo].[MatchGoal]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[MatchId] INT NOT NULL,
	[Minute] INT NOT NULL,
	[PlayerId] INT NOT NULL,
	[TeamId] INT,
	[AssistPlayerId] INT,
	[OwnGoal] BIT NOT NULL
)
