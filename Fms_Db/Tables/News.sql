CREATE TABLE [dbo].[News]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[SeasonId] INT,
	[DivisionId] INT,
	[Week] INT,
	[NewsText] NVARCHAR(MAX),
	[PlayerId] INT,
	[TeamId] INT
)
