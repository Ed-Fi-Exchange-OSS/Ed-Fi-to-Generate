-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/***************************************************************
*
*	FS199: This script is for the unit test for FS199 between the Staging and EdFi
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
			, @SchoolYear SchoolYear
			, stTypeD.CodeValue IndicatorStatusType
			, stD.CodeValue IndicatorStatus
			, subGTyD.CodeValue IndicatorStatusSubgroupType
			, subGD.CodeValue IndicatorStatusSubgroup
			, sis.StatedDefinedIndicatorStatus
		FROM EdFi_Sample_ODS_Data_For_Generate.extension.CedsSchoolIndicatorStatus sis
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sis.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor stTypeD ON stTypeD.DescriptorId = sis.IndicatorStatusTypeDescriptorId	
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor stD ON stD.DescriptorId = sis.IndicatorStatusDescriptorId
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor subGTyD ON subGTyD.DescriptorId = sis.IndicatorStatusSubgroupTypeDescriptorId
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor subGD ON subGD.DescriptorId = sis.IndicatorStatusSubgroupDescriptorId
		WHERE stTypeD.CodeValue = 'GraduationRateIndicatorStatus'
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.SchoolYear, staging.School_Identifier_State, staging.IndicatorStatusType, staging.IndicatorStatus
	, staging.IndicatorStatusSubgroupType, staging.IndicatorStatusSubgroup
 FROM [Staging].[OrganizationSchoolIndicatorStatus] staging
INNER JOIN 
(
		SELECT    
			 schCode.IdentificationCode
			, @SchoolYear SchoolYear
			, stTypeD.CodeValue IndicatorStatusType
			, stD.CodeValue IndicatorStatus
			, subGTyD.CodeValue IndicatorStatusSubgroupType
			, subGD.CodeValue IndicatorStatusSubgroup
			, sis.StatedDefinedIndicatorStatus
		FROM EdFi_Sample_ODS_Data_For_Generate.extension.CedsSchoolIndicatorStatus sis
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sis.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor stTypeD ON stTypeD.DescriptorId = sis.IndicatorStatusTypeDescriptorId	
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor stD ON stD.DescriptorId = sis.IndicatorStatusDescriptorId
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor subGTyD ON subGTyD.DescriptorId = sis.IndicatorStatusSubgroupTypeDescriptorId
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor subGD ON subGD.DescriptorId = sis.IndicatorStatusSubgroupDescriptorId
		WHERE stTypeD.CodeValue = 'GraduationRateIndicatorStatus'
) EdFi
ON
	staging.SchoolYear = edfi.SchoolYear 
	AND staging.School_Identifier_State = edfi.IdentificationCode 
	AND staging.IndicatorStatusType = EdFi.IndicatorStatusType
	AND staging.IndicatorStatus = EdFi.IndicatorStatus
	AND staging.IndicatorStatusSubgroupType = EdFi.IndicatorStatusSubgroupType
	AND staging.IndicatorStatusSubgroup = EdFi.IndicatorStatusSubgroup
WHERE staging.SchoolYear = @SchoolYear
) st


PRINT '-----------------------------------------------------'
PRINT 'The Staging School Graduation Rate Indicator Status: ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi LSchool Graduation Rate Indicator Status: ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT ''' School Graduation Rate Indicator Status: Unit Test To the Staging'' Succeeded'
ELSE
	PRINT ''' School Graduation Rate Indicator Status: Unit Test To the Staging'' Failed'
PRINT ''
-- generate
DECLARE @GenerateCount INT

SELECT @GenerateCount = Count(*)
FROM [ODS].[K12SchoolIndicatorStatus] st
JOIN [ODS].[RefIndicatorStatusType] istype ON istype.RefIndicatorStatusTypeId = st.RefIndicatorStatusTypeId
WHERE istype.Code  = 'GraduationRateIndicatorStatus'

PRINT '-----------------------------------------------------'
PRINT 'The Staging School Graduation Rate Indicator Status: ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate School Graduation Rate Indicator Status: ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''Student School Graduation Rate Indicator Status Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''Student School Graduation Rate Indicator Status Unit Test To Generate.ODS'' Failed'
PRINT ''