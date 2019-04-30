CREATE TABLE [dbo].[MatchEvent]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[MatchId] INT NOT NULL,
	[EventType] INT NOT NULL,
	[PlayerId] INT NOT NULL,
	[TeamId] INT,
	[Minute] INT,

)
