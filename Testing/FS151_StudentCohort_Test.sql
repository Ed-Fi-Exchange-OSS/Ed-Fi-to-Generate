/***************************************************************
*
*	FS151: This script is for the unit test for FS151 between the Stagin and EdFi
*
***************************************************************/		
USE generate 

DECLARE @SchoolYear INT
DECLARE @StagingCount INT, @EdFiCount INT

SET @SchoolYear = 2018

-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
		SELECT DISTINCT
			 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
			,edorg.EducationOrganizationId School_Identifier_State	
			,ISNULL(ssa.ClassOfSchoolYear, ssa.GraduationSchoolYear) ClassOfSchoolYear
			,ssa.GraduationSchoolYear
			,CASE 
				WHEN stch.EndDate IS NOT NULL THEN 'Alternate Diploma - Removed' --Removed from the cohort
				ELSE diptyD.CodeValue
			 END CohortDescription
			,@SchoolYear SchoolYear
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentAcademicRecordDiploma sard ON s.StudentUSI = sard.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] diptyD on diptyD.DescriptorId = sard.DiplomaTypeDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCohortAssociation] stch 
			ON stch.StudentUSI = ssa.StudentUSI AND stch.EducationOrganizationId = ssa.EducationOrganizationId
				AND ssa.EntryDate = stch.BeginDate
		WHERE ssa.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
		AND (ssa.EntryDate IS NULL OR ssa.EntryDate <= App.GetFiscalYearEndDate(@SchoolYear))
		and sard.DiplomaTypeDescriptorId is not null
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM [Staging].[Enrollment] staging
INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s ON s.StudentUniqueId = staging.Student_Identifier_State
INNER JOIN 
(
		SELECT DISTINCT
			 s.StudentUSI
			,edorg.EducationOrganizationId School_Identifier_State	
			,ISNULL(ssa.ClassOfSchoolYear, ssa.GraduationSchoolYear) ClassOfSchoolYear
			,ssa.GraduationSchoolYear
			,CASE 
				WHEN stch.EndDate IS NOT NULL THEN 'Alternate Diploma - Removed' --Removed from the cohort
				ELSE diptyD.CodeValue
			 END CohortDescription
			,@SchoolYear SchoolYear
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentAcademicRecordDiploma sard ON s.StudentUSI = sard.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] diptyD on diptyD.DescriptorId = sard.DiplomaTypeDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCohortAssociation] stch 
			ON stch.StudentUSI = ssa.StudentUSI AND stch.EducationOrganizationId = ssa.EducationOrganizationId
				AND ssa.EntryDate = stch.BeginDate
		WHERE ssa.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
		AND (ssa.EntryDate IS NULL OR ssa.EntryDate <= App.GetFiscalYearEndDate(@SchoolYear))
		and sard.DiplomaTypeDescriptorId is not null
) EdFi
	ON s.StudentUSI = EdFi.StudentUSI 
	AND staging.SchoolYear = edfi.SchoolYear 
	AND staging.School_Identifier_State = edfi.School_Identifier_State 
	AND staging.CohortDescription = EdFi.CohortDescription
	AND staging.CohortGraduationYear = edfi.GraduationSchoolYear
	AND staging.CohortYear = edfi.ClassOfSchoolYear
WHERE staging.SchoolYear = @SchoolYear

PRINT '-----------------------------------------------------'
PRINT 'The Staging Student Cohort by Student: ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi Student Cohort by Student: ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT '''Student Cohort Unit Test To the Staging'' Succeeded'
ELSE
	PRINT '''Student Cohort Unit Test To the Staging'' Failed'
PRINT ''
-- generate
DECLARE @GenerateCount INT

SELECT @GenerateCount = Count(*)
FROM [ODS].[K12StudentCohort] sc
JOIN [ODS].OrganizationPersonRole opr ON sc.OrganizationPersonRoleId = opr.OrganizationPersonRoleId
WHERE [CohortYear] IS NOT NULL AND [CohortDescription] IS NOT NULL

PRINT '-----------------------------------------------------'
PRINT 'The Staging Student Cohort by Student: ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate Student Cohort by Student: ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''Student Cohort Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''Student Cohort Unit Test To Generate.ODS'' Failed'
PRINT ''