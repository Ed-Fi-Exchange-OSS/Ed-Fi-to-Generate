
IF NOT EXISTS(SELECT 1 FROM   [ODS].[RefProgramType] where Code = '76000')
INSERT INTO [ODS].[RefProgramType]
           ([Description]
           ,[Code]
           ,[Definition]
           ,[SortOrder])
SELECT 'Homeless program'
	, '76000'
	, 'Homeless program'
	, 35