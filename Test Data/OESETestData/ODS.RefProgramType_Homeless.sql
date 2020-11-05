-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.




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