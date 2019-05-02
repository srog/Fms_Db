CREATE TABLE [dbo].[PlayerStats]
(
	[Id] INT NOT NULL IDENTITY, 
    [PlayerId] INT NOT NULL, 
    [Games] INT NOT NULL, 
    [Goals] INT NOT NULL, 
    [Assists] INT NOT NULL, 
    [CleanSheets] INT NOT NULL,
	[RedCards] INT NOT NULL, 
    [YellowCards] INT NOT NULL, 
    CONSTRAINT [PK_PlayerStats] PRIMARY KEY ([Id])
)
