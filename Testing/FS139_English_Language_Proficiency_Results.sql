/***************************************************************
*
*	FS139: This script is for the unit test for FS139 between the Staging and EdFi
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
				,parti.CodeValue Participation_TitleIII
				,profc.CodeValue Proficiency_TitleIII
				,prog.CodeValue Progress_TitleIII 
				,titleIII.EnglishLearnerParticipation EnglishLearnerParticipation
				,langc.CodeValue LanguageInstructionProgramServiceType
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
SELECT DISTINCT staging.[Student_Identifier_State]
FROM [Staging].ProgramParticipationTitleIII staging
JOIN 
(
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,sch.SchoolId School_Identifier_State
				,titleIII.BeginDate ProgramParticipationBeginDate
				,parti.CodeValue Participation_TitleIII
				,profc.CodeValue Proficiency_TitleIII
				,prog.CodeValue Progress_TitleIII 
				,titleIII.EnglishLearnerParticipation EnglishLearnerParticipation
				,langc.CodeValue LanguageInstructionProgramServiceType
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
	staging.[Student_Identifier_State] = edfi.Student_Identifier_State 

) st


PRINT '-----------------------------------------------------'
PRINT 'The Staging School_Progress Achieving English Language Proficiency School Indicator Status : ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi School School_Progress Achieving English Language Proficiency Indicator Status : ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT ''' School School_Progress Achieving English Language Proficiency Indicator Status : Unit Test To the Staging'' Succeeded'
ELSE
	PRINT ''' School School_Progress Achieving English Language Proficiency Indicator Status : Unit Test To the Staging'' Failed'
PRINT ''
-- generate
DECLARE @GenerateCount INT

SELECT @GenerateCount = Count(*)
FROM [ODS].[PersonStatus] ods
JOIN 
(
			SELECT DISTINCT
						ps.PersonId [PersonId]
					   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'LEP') [RefPersonStatusTypeId]
					   ,ps.EnglishLearnerStatus [StatusValue]
					   ,ps.EnglishLearner_StatusStartDate [StatusStartDate]
					   ,ps.EnglishLearner_StatusEndDate [StatusEndDate]
			FROM Staging.PersonStatus ps
			WHERE ps.PersonStatusId_EnglishLearner IS  NULL
			AND ps.EnglishLearnerStatus IS NOT NULL
			AND ps.PersonId IS NOT NULL
) staging 
	ON  ODS.PersonId = staging.PersonId

PRINT '-----------------------------------------------------'
PRINT 'The Staging School_Progress Achieving English Language Proficiency Indicator Status : ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate School_Progress Achieving English Language Proficiency Indicator Status : ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''School School_Progress Achieving English Language Proficiency Indicator Status Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''School School_Progress Achieving English Language Proficiency Indicator Status Unit Test To Generate.ODS'' Failed'
PRINT ''