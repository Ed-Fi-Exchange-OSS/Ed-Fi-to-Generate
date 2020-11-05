-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/***************************************************************
*
*	FS138: This script is for the unit test for FS138 between the Staging and EdFi
*
***************************************************************/		
USE generate 

DECLARE @SchoolYear INT
DECLARE @StagingCount INT, @EdFiCount INT

SET @SchoolYear = 2018

-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,sch.SchoolId School_Identifier_State
				,titleIII.BeginDate ProgramParticipationBeginDate
				,NULL ProgramParticipationEndDate
				,parti.CodeValue Participation_TitleIII
				,profc.CodeValue Proficiency_TitleIII
				,prog.CodeValue Progress_TitleIII 
				,titleIII.EnglishLearnerParticipation EnglishLearnerParticipation
				,langc.CodeValue LanguageInstructionProgramServiceType
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL PersonProgramParticipationID
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation] cte 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation] titleIII 
				ON s.StudentUSI = titleIII.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pt 
				ON titleIII.ProgramTypeDescriptorId = pt.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg 
				ON titleIII.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] seaCode 
				ON seaCode.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] seaD 
				ON seaD.DescriptorId = seaCode.EducationOrganizationIdentificationSystemDescriptorId 
				AND seaD.CodeValue = 'SEA'
			-- SchoolId
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] sta
				ON sta.StudentUSI = s.StudentUSI 
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] sch
				ON sch.SchoolId = sta.SchoolId and sch.LocalEducationAgencyId = titleIII.EducationOrganizationId

			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment] asses
				ON titleIII.StudentUSI = asses.StudentUSI 
				AND titleIII.EducationOrganizationId = asses.EducationOrganizationId 
				AND titleIII.ProgramEducationOrganizationId = asses.ProgramEducationOrganizationId
				AND titleIII.ProgramName = asses.ProgramName 
				AND titleIII.BeginDate = asses.BeginDate 
				AND titleIII.ProgramTypeDescriptorId = asses.ProgramTypeDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor profc 
				ON asses.ProficiencyDescriptorId = profc.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor parti 
				ON asses.ParticipationDescriptorId = parti.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor prog 
				ON asses.ProgressDescriptorId = prog.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService] serv
				ON titleIII.StudentUSI = serv.StudentUSI 
				AND titleIII.EducationOrganizationId = serv.EducationOrganizationId 
				AND titleIII.ProgramEducationOrganizationId = serv.ProgramEducationOrganizationId
				AND titleIII.ProgramName = serv.ProgramName 
				AND titleIII.BeginDate = serv.BeginDate 
				AND titleIII.ProgramTypeDescriptorId = serv.ProgramTypeDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor langc 
				ON serv.LanguageInstructionProgramServiceDescriptorId = langc.DescriptorId

			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] studentassess 
				ON studentassess.StudentUSI = s.StudentUSI 
				AND studentassess.SchoolYear = @SchoolYear

			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] gspa 
				ON gspa.[StudentUSI] = titleIII.[StudentUSI]
				AND gspa.[EducationOrganizationId] = titleIII.EducationOrganizationId
				AND gspa.[ProgramName] = titleIII.ProgramName
				AND gspa.[ProgramEducationOrganizationId] = titleIII.ProgramEducationOrganizationId
				AND gspa.[BeginDate] = titleIII.BeginDate
				AND gspa.[ProgramTypeDescriptorId] = titleIII.ProgramTypeDescriptorId
				AND isnull(gspa.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND gspa.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.Student_Identifier_State, staging.School_Identifier_State, staging.ProgramParticipationBeginDate, staging.Participation_TitleIII
	, staging.Proficiency_TitleIII, staging.Progress_TitleIII
 FROM [Staging].ProgramParticipationTitleIII staging
INNER JOIN 
(
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,sch.SchoolId School_Identifier_State
				,titleIII.BeginDate ProgramParticipationBeginDate
				,NULL ProgramParticipationEndDate
				,parti.CodeValue Participation_TitleIII
				,profc.CodeValue Proficiency_TitleIII
				,prog.CodeValue Progress_TitleIII 
				,titleIII.EnglishLearnerParticipation EnglishLearnerParticipation
				,langc.CodeValue LanguageInstructionProgramServiceType
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL PersonProgramParticipationID
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation] cte 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation] titleIII 
				ON s.StudentUSI = titleIII.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pt 
				ON titleIII.ProgramTypeDescriptorId = pt.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg 
				ON titleIII.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] seaCode 
				ON seaCode.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] seaD 
				ON seaD.DescriptorId = seaCode.EducationOrganizationIdentificationSystemDescriptorId 
				AND seaD.CodeValue = 'SEA'
			-- SchoolId
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] sta
				ON sta.StudentUSI = s.StudentUSI 
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] sch
				ON sch.SchoolId = sta.SchoolId and sch.LocalEducationAgencyId = titleIII.EducationOrganizationId

			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment] asses
				ON titleIII.StudentUSI = asses.StudentUSI 
				AND titleIII.EducationOrganizationId = asses.EducationOrganizationId 
				AND titleIII.ProgramEducationOrganizationId = asses.ProgramEducationOrganizationId
				AND titleIII.ProgramName = asses.ProgramName 
				AND titleIII.BeginDate = asses.BeginDate 
				AND titleIII.ProgramTypeDescriptorId = asses.ProgramTypeDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor profc 
				ON asses.ProficiencyDescriptorId = profc.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor parti 
				ON asses.ParticipationDescriptorId = parti.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor prog 
				ON asses.ProgressDescriptorId = prog.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService] serv
				ON titleIII.StudentUSI = serv.StudentUSI 
				AND titleIII.EducationOrganizationId = serv.EducationOrganizationId 
				AND titleIII.ProgramEducationOrganizationId = serv.ProgramEducationOrganizationId
				AND titleIII.ProgramName = serv.ProgramName 
				AND titleIII.BeginDate = serv.BeginDate 
				AND titleIII.ProgramTypeDescriptorId = serv.ProgramTypeDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor langc 
				ON serv.LanguageInstructionProgramServiceDescriptorId = langc.DescriptorId

			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] studentassess 
				ON studentassess.StudentUSI = s.StudentUSI 
				AND studentassess.SchoolYear = @SchoolYear

			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] gspa 
				ON gspa.[StudentUSI] = titleIII.[StudentUSI]
				AND gspa.[EducationOrganizationId] = titleIII.EducationOrganizationId
				AND gspa.[ProgramName] = titleIII.ProgramName
				AND gspa.[ProgramEducationOrganizationId] = titleIII.ProgramEducationOrganizationId
				AND gspa.[BeginDate] = titleIII.BeginDate
				AND gspa.[ProgramTypeDescriptorId] = titleIII.ProgramTypeDescriptorId
				AND isnull(gspa.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND gspa.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
) EdFi
ON
	staging.Student_Identifier_State = edfi.Student_Identifier_State 
	AND staging.School_Identifier_State = edfi.School_Identifier_State 
	AND (staging.ProgramParticipationBeginDate IS NULL OR staging.ProgramParticipationBeginDate = EdFi.ProgramParticipationBeginDate)
	AND (staging.Participation_TitleIII IS NULL OR staging.Participation_TitleIII = EdFi.Participation_TitleIII)
	AND (staging.Proficiency_TitleIII IS NULL OR staging.Proficiency_TitleIII = EdFi.Proficiency_TitleIII)
	AND (staging.Progress_TitleIII IS NULL OR staging.Progress_TitleIII = EdFi.Progress_TitleIII)
) st


PRINT '-----------------------------------------------------'
PRINT 'The Staging Title III English Language Proficiency Test : ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi Title III English Language Proficiency Test : ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT ''' Title III English Language Proficiency Test : Unit Test To the Staging'' Succeeded'
ELSE
	PRINT ''' Title III English Language Proficiency Test : Unit Test To the Staging'' Failed'
PRINT ''
-- generate
DECLARE @GenerateCount INT

-- The staging to generate test is handled at one script


PRINT '-----------------------------------------------------'
PRINT 'The Staging Title III English Language Proficiency Test : ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate Title III English Language Proficiency Test : ' + CAST(@GenerateCount AS varchar)
PRINT ''

--IF @StagingCount = @GenerateCount 
--	PRINT '''Title III English Language Proficiency Test To Generate.ODS'' Succeeded'
--ELSE
--	PRINT '''Title III English Language Proficiency Test To Generate.ODS'' Failed'
--PRINT ''