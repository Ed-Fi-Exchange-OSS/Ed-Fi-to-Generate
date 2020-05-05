


	IF NOT EXISTS (SELECT * FROM [ODS].[RefProgramType] WHERE Code = 76000)
		INSERT INTO [ODS].[RefProgramType] (
			[Description]
			,[Code]
			,[Definition]
		) VALUES (
			'Homeless program'
			,76000
			,'Homeless program'
		)