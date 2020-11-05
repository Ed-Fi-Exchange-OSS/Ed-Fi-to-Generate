-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/***************************************************************
*
*	FS160: This script is for the unit test for FS160 between the Staging and EdFi
*
***************************************************************/		
USE generate 

DECLARE @SchoolYear INT
DECLARE @StagingCount INT, @EdFiCount INT

SET @SchoolYear = 2018

-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
		SELECT
			CASE 
				WHEN pseCatD.CodeValue = 'College Enrollment' THEN 1
				ELSE 0
			END PostSecondaryEnrollment
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s 
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].PostSecondaryEvent pse
			ON pse.[StudentUSI] = s.[StudentUSI]
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pseCatD 
			ON pseCatD.DescriptorID = pse.PostSecondaryEventCategoryDescriptorId
		WHERE  Namespace = 'uri://ed-fi.org/PostSecondaryEventCategoryDescriptor'
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM [Staging].[Enrollment] staging
INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s ON s.StudentUniqueId = staging.Student_Identifier_State
INNER JOIN 
(
		SELECT
			 s.[StudentUSI]
			,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
			,ssa.SchoolId School_Identifier_State	
			,CASE 
				WHEN pseCatD.CodeValue = 'College Enrollment' THEN 1
				ELSE 0
			END PostSecondaryEnrollment
			,@SchoolYear SchoolYear
		FROM Staging.Enrollment en 
		INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s 
			ON s.StudentUniqueId = en.Student_Identifier_State
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].PostSecondaryEvent pse
			ON pse.[StudentUSI] = s.[StudentUSI]
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pseCatD 
			ON pseCatD.DescriptorID = pse.PostSecondaryEventCategoryDescriptorId
		WHERE  Namespace = 'uri://ed-fi.org/PostSecondaryEventCategoryDescriptor'
) EdFi
	ON s.StudentUSI = EdFi.StudentUSI 
	AND staging.SchoolYear = edfi.SchoolYear 
	AND staging.School_Identifier_State = edfi.School_Identifier_State 
	AND staging.PostSecondaryEnrollment = EdFi.PostSecondaryEnrollment
	AND staging.SchoolYear = edfi.SchoolYear
WHERE staging.SchoolYear = @SchoolYear

PRINT '-----------------------------------------------------'
PRINT 'The Staging Student Post Secondary Enrollment by Student: ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi Student Post Secondary Enrollment by Student: ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT '''Student Post Secondary Enrollment Unit Test To the Staging'' Succeeded'
ELSE
	PRINT '''Student Post Secondary Enrollment Unit Test To the Staging'' Failed'
PRINT ''
-- generate
DECLARE @GenerateCount INT

SELECT @GenerateCount = Count(*)
FROM [ODS].[K12StudentAcademicRecord] aca 
WHERE [RefPsEnrollmentActionId] IS NOT NULL

PRINT '-----------------------------------------------------'
PRINT 'The Staging Student Post Secondary Enrollment by Student: ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate Student Post Secondary Enrollment by Student: ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''Student Post Secondary Enrollment Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''Student Post Secondary Enrollment Unit Test To Generate.ODS'' Failed'
PRINT ''