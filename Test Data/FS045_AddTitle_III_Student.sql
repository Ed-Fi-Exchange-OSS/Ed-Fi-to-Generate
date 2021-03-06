﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

INSERT INTO [edfi].[GeneralStudentProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[CreateDate]
			)

SELECT '2017-10-01'
	,255901
	, 255901
	,'English as a Second Language (ESL)'
	, 1623
	, 21000
	, GetDate()


INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[EnglishLearnerParticipation])
SELECT '2017-10-01'
	, 255901
	, 255901
	, 'English as a Second Language (ESL)'
	, 1623 [ProgramTypeDescriptorId]
	, 21000
	, 1




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
           ,[CreateDate])
SELECT '2017-10-01'
		,255901
		, 255901
		, 'English as a Second Language (ESL)'
		, 1623
		, 2018
		, 21000
		, 2867 [ParticipationDescriptorId]
		, 2871 [ProficiencyDescriptorId]
		, 2873 [ProgressDescriptorId]
		, GetDate()

  INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[LanguageInstructionProgramServiceDescriptorId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[ServiceBeginDate]
           ,[CreateDate])
		SELECT '2017-10-01'
			,255901
			,2255
			, 255901
			,'English as a Second Language (ESL)'
			, 1623
			, 21000
			, '2017-07-01'
			, GetDate()