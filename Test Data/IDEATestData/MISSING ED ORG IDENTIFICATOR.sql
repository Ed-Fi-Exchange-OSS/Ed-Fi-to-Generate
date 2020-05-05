

	-- [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode
	DECLARE @EducationOrganizationId INT = 255901107

	DECLARE @IdentificationCode NVARCHAR(60) = '255901107'

	DECLARE @EducationOrganizationIdentificationSystemDescriptorId INT

	SELECT @EducationOrganizationIdentificationSystemDescriptorId = DescriptorId 
	FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor'
	AND CodeValue = 'SEA'


	IF NOT EXISTS (SELECT * FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode
		WHERE
			[EducationOrganizationId] = @EducationOrganizationId
			AND IdentificationCode = @IdentificationCode
			AND EducationOrganizationIdentificationSystemDescriptorId = @EducationOrganizationIdentificationSystemDescriptorId)
		INSERT INTO [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode (
			[EducationOrganizationId]
			,[IdentificationCode]
			,[CreateDate]
			,[EducationOrganizationIdentificationSystemDescriptorId]
		) VALUES (
			@EducationOrganizationId
			,@IdentificationCode
			,GETDATE()
			,@EducationOrganizationIdentificationSystemDescriptorId
		)
