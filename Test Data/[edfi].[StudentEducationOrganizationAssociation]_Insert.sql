USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[SexDescriptorId]
)
SELECT  21681
      ,[EducationOrganizationId]
      ,[SexDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociation]
  where [StudentUSI] = 21631
GO


INSERT INTO [edfi].[StudentEducationOrganizationAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[SexDescriptorId]
)
SELECT  21715
      ,[EducationOrganizationId]
      ,[SexDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociation]
  where [StudentUSI] = 21631
GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[SexDescriptorId]
)
SELECT  21716
      ,[EducationOrganizationId]
      ,[SexDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociation]
  where [StudentUSI] = 21631
GO