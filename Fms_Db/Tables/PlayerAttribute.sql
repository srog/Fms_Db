CREATE TABLE [dbo].[PlayerAttribute]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[PlayerId] INT NOT NULL,
	[AttributeId] INT NOT NULL,
	[AttributeValue] INT NOT NULL
)
