USE [EdFi_Sample_ODS_Data_For_Generate]
GO

--INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService]
--           ([BeginDate]
--           ,[EducationOrganizationId]
--           ,[LanguageInstructionProgramServiceDescriptorId]
--           ,[ProgramEducationOrganizationId]
--           ,[ProgramName]
--           ,[ProgramTypeDescriptorId]
--           ,[StudentUSI]
--)
			
SELECT 
           [BeginDate]
           ,[EducationOrganizationId]
           ,ISNULL([LanguageInstructionProgramServiceDescriptorId], 2255)
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
FROM
(			
			SELECT titleIII.BeginDate, titleIII.EducationOrganizationId
				  ,CASE 
		WHEN Abs(Checksum(NewId())) % 10 <= 6
			THEN (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LanguageInstructionProgramServiceDescriptor' And CodeValue ='Dual Language')
		ELSE (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LanguageInstructionProgramServiceDescriptor' And CodeValue ='Heritage Language')
	   END LanguageInstructionProgramServiceDescriptorId
			, titleIII.ProgramEducationOrganizationId, titleIII.ProgramName, titleIII.ProgramTypeDescriptorId, titleIII.StudentUSI
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation] titleIII
			left JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment] asses
				ON titleIII.StudentUSI = asses.StudentUSI 
				AND titleIII.EducationOrganizationId = asses.EducationOrganizationId 
				AND titleIII.ProgramEducationOrganizationId = asses.ProgramEducationOrganizationId
				AND titleIII.ProgramName = asses.ProgramName 
				AND titleIII.BeginDate = asses.BeginDate 
				AND titleIII.ProgramTypeDescriptorId = asses.ProgramTypeDescriptorId

			where asses.StudentUSI IS NULL AND asses.EducationOrganizationId IS NULL
) ed


