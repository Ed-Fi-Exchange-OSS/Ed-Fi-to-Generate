-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/***************************************************************
*
*	FS204: This script is for the unit test for FS204 between the Staging and EdFi
*
***************************************************************/		
USE generate 

DECLARE @SchoolYear INT
DECLARE @StagingCount INT, @EdFiCount INT

SET @SchoolYear = 2018

-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
select s.StudentUniqueId
		FROM [EdFi_Sample_ODS_Data_For_Generate].edfi.Student s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.StudentSchoolAssociation ssa 
			ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.School sch 
			ON sch.SchoolId = ssa.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.EducationOrganization edorg 
			ON sch.SchoolId = edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcode on edorgcode.EducationOrganizationId=edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor ed on ed.DescriptorId=edorgcode.EducationOrganizationIdentificationSystemDescriptorId
		-- LEP
		JOIN (
			select slip.StudentUSI, slip.BeginDate, gsa.EndDate
			from [EdFi_Sample_ODS_Data_For_Generate].edfi.StudentLanguageInstructionProgramAssociation slip
			left join [EdFi_Sample_ODS_Data_For_Generate].edfi.GeneralStudentProgramAssociation gsa 
				on gsa.StudentUSI = slip.StudentUSI
				and gsa.BeginDate = slip.BeginDate and gsa.EducationOrganizationId = slip.EducationOrganizationId and gsa.ProgramEducationOrganizationId = slip.ProgramEducationOrganizationId
				and gsa.ProgramName = slip.ProgramName and gsa.ProgramTypeDescriptorId = slip.ProgramTypeDescriptorId
		) englishlearner
			on englishlearner.StudentUSI=s.StudentUSI
			and isnull(englishlearner.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
			AND englishlearner.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.[Student_Identifier_State]
FROM [Staging].[PersonStatus] staging
JOIN 
(
		select s.StudentUniqueId, slip.StudentUSI, slip.BeginDate, gsa.EndDate
		from [EdFi_Sample_ODS_Data_For_Generate].edfi.StudentLanguageInstructionProgramAssociation slip
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.Student s ON s.StudentUSI = slip.StudentUSI
		left join [EdFi_Sample_ODS_Data_For_Generate].edfi.GeneralStudentProgramAssociation gsa 
			on gsa.StudentUSI = slip.StudentUSI
			and gsa.BeginDate = slip.BeginDate and gsa.EducationOrganizationId = slip.EducationOrganizationId and gsa.ProgramEducationOrganizationId = slip.ProgramEducationOrganizationId
						and gsa.ProgramName = slip.ProgramName and gsa.ProgramTypeDescriptorId = slip.ProgramTypeDescriptorId
			WHERE isnull(gsa.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND slip.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
			and gsa.ProgramName = slip.ProgramName and gsa.ProgramTypeDescriptorId = slip.ProgramTypeDescriptorId
) EdFi
ON
	staging.[Student_Identifier_State] = edfi.StudentUniqueId 

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