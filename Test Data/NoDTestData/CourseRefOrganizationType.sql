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