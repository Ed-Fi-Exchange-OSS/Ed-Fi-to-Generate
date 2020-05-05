USE EdFi_Sample_ODS_Data_For_Generate
IF NOT EXISTS(SELECT 1 FROM [edfi].[EducationOrganizationInstitutionTelephone] WHERE [EducationOrganizationId] = 255500)
INSERT INTO [edfi].[EducationOrganizationInstitutionTelephone]
    ([EducationOrganizationId]
    ,[TelephoneNumber]
    ,[CreateDate]
    ,[InstitutionTelephoneNumberTypeDescriptorId])
SELECT 255500
	,'(936) 805-8500'
	, GETDATE()
	, 1602

	