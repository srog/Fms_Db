CREATE TABLE [dbo].[PlayerAttributes]
(
	[Id] INT NOT NULL IDENTITY, 
    [PlayerId] INT NOT NULL, 
    [Speed] INT NOT NULL, 
    [Passing] INT NOT NULL, 
    [Shooting] INT NOT NULL, 
    [Skills] INT NOT NULL, 
    [Defending] INT NOT NULL, 
	[Crossing] INT NOT NULL,
    [Tackling] INT NOT NULL, 
    [Handling] INT NOT NULL, 
    [Strength] INT NOT NULL, 
    [Form] INT NOT NULL, 
    [Morale] INT NOT NULL,
	[Stamina] INT NOT NULL,
	[Happiness] INT NOT NULL,
	[Aggression] INT NOT NULL,
	CONSTRAINT [PK_PlayerAttributes] PRIMARY KEY ([Id])
)
