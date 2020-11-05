-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[SchoolYear]
           ,[StudentUSI]
           ,[ParticipationDescriptorId]
           ,[ProficiencyDescriptorId]
           ,[ProgressDescriptorId]
			)
SELECT 
           [BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
		   ,2018 SchoolYear
           ,[StudentUSI]
		   ,ISNULL(ParticipationDescriptorId, 2868) ParticipationDescriptorId
		   ,ISNULL(ProficiencyDescriptorId, 2871) ProficiencyDescriptorId
		   ,ISNULL(ProgressDescriptorId, 2872) ProgressDescriptorId
FROM
(			
			SELECT titleIII.BeginDate, titleIII.EducationOrganizationId

			, titleIII.ProgramEducationOrganizationId, titleIII.ProgramName, titleIII.ProgramTypeDescriptorId, 2018 SchoolYear, titleIII.StudentUSI
			,CASE 
				WHEN Abs(Checksum(NewId())) % 10 <= 6
					THEN (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ParticipationDescriptor' And CodeValue ='Completed')
				ELSE (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ParticipationDescriptor' And CodeValue ='Unable Due To Medical Emergency')
			 END ParticipationDescriptorId
			,CASE 
				WHEN Abs(Checksum(NewId())) % 10 <= 6
					THEN (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ProficiencyDescriptor' And CodeValue ='Proficient')
				ELSE (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ProficiencyDescriptor' And CodeValue ='Not Proficient')
			 END ProficiencyDescriptorId
			,CASE 
				WHEN Abs(Checksum(NewId())) % 10 <= 6
					THEN (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ProgressDescriptor' And CodeValue ='Proficient')
				ELSE (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ProgressDescriptor' And CodeValue ='Progress')
			 END ProgressDescriptorId
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
GO


