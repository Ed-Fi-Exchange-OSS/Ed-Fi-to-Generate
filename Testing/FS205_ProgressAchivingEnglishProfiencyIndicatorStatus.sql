-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/***************************************************************
*
*	FS205: This script is for the unit test for FS205 between the Staging and EdFi
*
***************************************************************/		
USE generate 

DECLARE @SchoolYear INT
DECLARE @StagingCount INT, @EdFiCount INT

SET @SchoolYear = 2018

-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
		SELECT   schCode.IdentificationCode
				,@SchoolYear SchoolYear 
				,prog.CodeValue School_ProgressAchievingEnglishLanguageProficiencyIndicatorStatus
				,CASE
					WHEN prog.CodeValue = 'STTDEF' THEN prog.CodeValue
					ELSE NULL
			   END School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchoolStatus ceds ON sch.SchoolId = ceds.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor prog ON ceds.ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId = prog.DescriptorId
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.[School_Identifier_State], staging.[SchoolYear], staging.School_ProgressAchievingEnglishLanguageProficiencyIndicatorStatus, staging.School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus
 FROM [Staging].[Organization] staging
INNER JOIN 
(
		SELECT   schCode.IdentificationCode
				,@SchoolYear SchoolYear 
				,prog.CodeValue School_ProgressAchievingEnglishLanguageProficiencyIndicatorStatus
				,CASE
					WHEN prog.CodeValue = 'STTDEF' THEN prog.CodeValue
					ELSE NULL
			   END School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchoolStatus ceds ON sch.SchoolId = ceds.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor prog ON ceds.ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId = prog.DescriptorId
) EdFi
ON
	staging.[School_Identifier_State] = edfi.IdentificationCode 
	AND staging.[SchoolYear] = edfi.SchoolYear 
	AND staging.[School_ProgressAchievingEnglishLanguageProficiencyIndicatorStatus] = EdFi.School_ProgressAchievingEnglishLanguageProficiencyIndicatorStatus
	AND (staging.School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus IS NULL OR staging.School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus = EdFi.School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus)
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
FROM [ODS].[K12SchoolStatus] ods
JOIN 
(
		SELECT   k12.K12SchoolId
				,@SchoolYear SchoolYear 
				, ist.[RefProgressAchievingEnglishLanguageProficiencyIndicatorStatusId]
				, CASE
					WHEN ist.Code = 'STTDEF' THEN s.School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus
					ELSE NULL
				END	School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus		
		FROM [Staging].[Organization] s
		JOIN Staging.Organization orgff ON s.School_Identifier_State = orgff.School_Identifier_State
		JOIN ODS.K12School k12 ON k12.OrganizationId = orgff.SchoolOrganizationId
		JOIN [ODS].[RefProgressAchievingEnglishLanguageProficiencyIndicatorStatus] ist ON ist.Code = s.School_ProgressAchievingEnglishLanguageProficiencyIndicatorStatus
) staging 
	ON  ODS.[K12SchoolId] = staging.K12SchoolId
	AND ODS.[RefProgressAchievingEnglishLanguageProficiencyIndicatorStatusId] = staging.[RefProgressAchievingEnglishLanguageProficiencyIndicatorStatusId]

PRINT '-----------------------------------------------------'
PRINT 'The Staging School_Progress Achieving English Language Proficiency Indicator Status : ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate School_Progress Achieving English Language Proficiency Indicator Status : ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''School School_Progress Achieving English Language Proficiency Indicator Status Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''School School_Progress Achieving English Language Proficiency Indicator Status Unit Test To Generate.ODS'' Failed'
PRINT ''