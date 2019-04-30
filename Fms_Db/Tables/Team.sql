CREATE TABLE [dbo].[Team]
(
	[Id] INT NOT NULL  IDENTITY, 
    [Name] NVARCHAR(250) NOT NULL, 
    [Division] INT NULL, 
    [Cash] INT NOT NULL, 
    [YearFormed] INT NULL, 
	[StadiumCapacity] INT
    CONSTRAINT [PK_Team] PRIMARY KEY ([Id])
)
