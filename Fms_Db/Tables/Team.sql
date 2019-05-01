CREATE TABLE [dbo].[Team]
(
	[Id] INT NOT NULL  IDENTITY, 
    [Name] NVARCHAR(250) NOT NULL, 
    [DivisionId] INT NULL, 
    [Cash] INT NOT NULL, 
    [YearFormed] INT NULL, 
	[StadiumCapacity] INT,
	[GameDetailsId] INT NOT NULL,
    CONSTRAINT [PK_Team] PRIMARY KEY ([Id])    
)
