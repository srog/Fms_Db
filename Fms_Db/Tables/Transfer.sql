CREATE TABLE [dbo].[Transfer]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[PlayerId] INT NOT NULL,
	[SeasonId] INT NOT NULL,
	[Week] INT,
	[TeamFromId] INT NOT NULL,
	[TeamToId] INT NOT NULL,
	[TransferValue] INT NOT NULL

)
