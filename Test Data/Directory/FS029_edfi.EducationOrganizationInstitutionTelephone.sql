
IF NOT EXISTS (SELECT 1 FROM  [edfi].[EducationOrganizationInstitutionTelephone] WHERE [EducationOrganizationId] = 255500)
INSERT INTO [edfi].[EducationOrganizationInstitutionTelephone]
           ([EducationOrganizationId]
           ,[TelephoneNumber]
           ,[InstitutionTelephoneNumberTypeDescriptorId])
SELECT 255500, '(303)800-2001', 1602