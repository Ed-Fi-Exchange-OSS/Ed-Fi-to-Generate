/***************************************************************
*
*	NFS206: This script is for the unit test for School Support and Improvement between the Staging and EdFi
*
***************************************************************/		
USE generate 

DECLARE @SchoolYear INT
DECLARE @StagingCount INT, @EdFiCount INT

SET @SchoolYear = 2018


-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
		SELECT
			schCode.IdentificationCode
			, @SchoolYear [SchoolYear]
			, ctsD.CodeValue [School_ComprehensiveAndTargetedSupport]
			, csD.CodeValue [School_ComprehensiveSupport]
			, tsD.CodeValue [School_TargetedSupport]
		FROM EdFi_Sample_ODS_Data_For_Generate.extension.CedsSchoolComprehensiveAndTargetedSupport csts
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = csts.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor ctsD ON ctsD.DescriptorId = csts.ComprehensiveAndTargetedSupportDescriptorId	
		LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor csD ON csD.DescriptorId = csts.ComprehensiveSupportDescriptorId
		LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor tsD ON tsD.DescriptorId = csts.TargetedSupportDescriptorId
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.School_Identifier_State
FROM [Staging].[OrganizationSchoolComprehensiveAndTargetedSupport] staging
JOIN 
(
		SELECT
			schCode.IdentificationCode
			, @SchoolYear [SchoolYear]
			, ctsD.CodeValue [School_ComprehensiveAndTargetedSupport]
			, csD.CodeValue [School_ComprehensiveSupport]
			, tsD.CodeValue [School_TargetedSupport]
		FROM EdFi_Sample_ODS_Data_For_Generate.extension.CedsSchoolComprehensiveAndTargetedSupport csts
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = csts.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor ctsD ON ctsD.DescriptorId = csts.ComprehensiveAndTargetedSupportDescriptorId	
		LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor csD ON csD.DescriptorId = csts.ComprehensiveSupportDescriptorId
		LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor tsD ON tsD.DescriptorId = csts.TargetedSupportDescriptorId
) EdFi
ON
	staging.School_Identifier_State = edfi.IdentificationCode

) st


PRINT '-----------------------------------------------------'
PRINT 'The Staging School Support and Improvement  : ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi School Support and Improvement   : ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT ''' School School Support and Improvement   : Unit Test To the Staging'' Succeeded'
ELSE
	PRINT ''' School School Support and Improvement   : Unit Test To the Staging'' Failed'
PRINT ''
-- generate
DECLARE @GenerateCount INT

SELECT @GenerateCount = Count(*)
FROM [ODS].[K12SchoolStatus] ods
JOIN 
(
		SELECT
		    k12.K12SchoolId
		   ,cts.RefComprehensiveAndTargetedSupportId
		   ,cs.RefComprehensiveSupportId
		   ,ts.RefTargetedSupportId
		--   ,App.GetFiscalYearStartDate(@SchoolYear) [RecordStartDateTime]
		--   ,App.GetFiscalYearEndDate(@SchoolYear) [RecordEndDateTime]
		FROM [Staging].[OrganizationSchoolComprehensiveAndTargetedSupport] s
		JOIN Staging.Organization orgff ON s.School_Identifier_State = orgff.School_Identifier_State
		JOIN ODS.K12School k12 ON k12.OrganizationId = orgff.SchoolOrganizationId
		JOIN [ODS].[RefComprehensiveAndTargetedSupport] cts ON cts.Code = s.School_ComprehensiveAndTargetedSupport
		LEFT JOIN [ODS].[RefComprehensiveSupport] cs ON cs.Code = s.School_ComprehensiveSupport
		LEFT JOIN [ODS].[RefTargetedSupport] ts ON ts.Code = s.School_TargetedSupport
		LEFT JOIN [ODS].[K12SchoolStatus] ks 
			ON  ks.[K12SchoolId] = s.School_Identifier_State
			AND ks.RefComprehensiveAndTargetedSupportId = cts.RefComprehensiveAndTargetedSupportId
		WHERE ks.K12SchoolStatusId IS NULL
) staging 
	ON  ODS.K12SchoolId = staging.K12SchoolId
		AND ods.RefComprehensiveAndTargetedSupportId = staging.RefComprehensiveAndTargetedSupportId
PRINT '-----------------------------------------------------'
PRINT 'The Staging School Support and Improvement  : ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate School Support and Improvement  : ' + CAST(@GenerateCount AS varchar)
PRINT ''


IF @StagingCount = @GenerateCount 
	PRINT '''School School Support and Improvement   Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''School School Support and Improvement  Unit Test To Generate.ODS'' Failed'
PRINT ''