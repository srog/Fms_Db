CREATE TABLE [dbo].[Player]
(
	[Id] INT NOT NULL IDENTITY, 
    [Name] NVARCHAR(250) NOT NULL, 
    [Age] INT NOT NULL, 
    [Position] INT NOT NULL, 
    [Rating] INT NULL, 
    [TeamId] INT NOT NULL,
	[Value] INT,
	[Retired] BIT NOT NULL, 
    [InjuredWeeks] INT NULL, 
    [GameDetailsId] INT NOT NULL, 
    [TeamSelection] INT NULL, 
    CONSTRAINT [PK_Player] PRIMARY KEY ([Id])
)
