USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentSpecialEducationProgramAssociationDisability]
           ([BeginDate]
           ,[DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
		   )
SELECT [BeginDate]
           ,391
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]

  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSpecialEducationProgramAssociation]
  where [StudentUSI] = 21681
GO


