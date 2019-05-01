CREATE TABLE [dbo].[GameDetails]
(
	[Id] INT NOT NULL IDENTITY, 
    [TeamId] INT NOT NULL, 
    [ManagerName] NVARCHAR(250) NOT NULL, 
    [CurrentSeasonId] INT NOT NULL,
	[CurrentWeek] INT NOT NULL,
	CONSTRAINT [PK_GameDetails] PRIMARY KEY ([Id])
)
