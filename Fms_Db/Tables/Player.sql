CREATE TABLE [dbo].[Player]
(
	[Id] INT NOT NULL IDENTITY, 
    [Name] NVARCHAR(250) NOT NULL, 
    [Age] INT NOT NULL, 
    [Position] INT NOT NULL, 
    [Rating] INT NULL, 
    [TeamId] INT NULL,
	[Value] INT,
	[Retired] BIT NULL, 
    [InjuredWeeks] INT NULL, 
    CONSTRAINT [PK_Player] PRIMARY KEY ([Id])
)
