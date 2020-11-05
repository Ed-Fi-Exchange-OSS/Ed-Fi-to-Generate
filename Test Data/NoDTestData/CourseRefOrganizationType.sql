-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE generate

	DECLARE @RefOrganizationElementTypeId INT
	SELECT @RefOrganizationElementTypeId = RefOrganizationElementTypeId FROM ODS.RefOrganizationElementType WHERE Code = '001156'

	IF NOT EXISTS (SELECT * FROM ODS.RefOrganizationType WHERE Code = 'Course' AND 
			RefOrganizationElementTypeId = @RefOrganizationElementTypeId)
		BEGIN
			INSERT INTO ODS.RefOrganizationType (
				[Description]
				,[Code]
				,[Definition]
				,[RefJurisdictionId]
				,[RefOrganizationElementTypeId]
				,[SortOrder]
			)
			VALUES (
				   'Course'
				  ,'Course'
				  ,'Course'
				  ,NULL
				  ,@RefOrganizationElementTypeId
				  ,50
			)
		END