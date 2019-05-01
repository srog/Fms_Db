CREATE TABLE [dbo].[Season]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[GameDetailsId] INT NOT NULL,
	[StartYear] INT NOT NULL,
	[Completed] BIT NOT NULL
)
