
IF NOT EXISTS (SELECT * FROM [Division]) 
BEGIN
	INSERT INTO [Division] ([Id], [Name]) VALUES (1, 'Premier League')
	INSERT INTO [Division] ([Id], [Name]) VALUES (2, 'Championship')
	INSERT INTO [Division] ([Id], [Name]) VALUES (3, 'League One')
	INSERT INTO [Division] ([Id], [Name]) VALUES (4, 'League Two')
END