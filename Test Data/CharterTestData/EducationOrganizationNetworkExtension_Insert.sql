
IF NOT EXISTS(SELECT 1 FROM [edfi].[EducationOrganizationNetwork] WHERE [EducationOrganizationNetworkId] = 255901001)
  INSERT INTO [edfi].[EducationOrganizationNetwork]
           ([EducationOrganizationNetworkId]
           ,[NetworkPurposeDescriptorId])
     VALUES
           (255901001
           ,4010)

IF NOT EXISTS(SELECT 1 FROM [extension].[EducationOrganizationNetworkExtension] WHERE [EducationOrganizationNetworkId] = 255901001)
  INSERT INTO [extension].[EducationOrganizationNetworkExtension]
           ([EducationOrganizationNetworkId]
           ,[CharterSchoolManagementOrganizationTypeDescriptorId]
           ,[CreateDate])
     VALUES
           (255901001
           ,4012
           ,GetDate())


  Update [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchool]
  Set [EducationOrgabizationNetworkId] = 255901001
  where [CedsSchoolId] = 255901001