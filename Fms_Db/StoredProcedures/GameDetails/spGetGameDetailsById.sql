﻿CREATE PROCEDURE [dbo].[spGetGameDetailsById]
	@id int
AS
	SELECT * FROM [GameDetails] WHERE [Id] = @id
RETURN 0
