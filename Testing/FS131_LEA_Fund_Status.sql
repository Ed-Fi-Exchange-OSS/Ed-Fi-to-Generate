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
		SELECT DISTINCT
			leaCode.IdentificationCode OrganizationIdentifier
			,'LEA' OrganizationType
			,edorgf.FederalProgramCode FederalProgramCode
			,edorgf.FederalProgramsFundingAllocation FederalProgramsFundingAllocation
			,edorgf.ParentalInvolvmementReservationFunds ParentalInvolvementReservationFunds
			,laeREAPD.CodeValue REAPAlternativeFundingStatusCode
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] leaCode on leaCode.EducationOrganizationId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] laeD ON laeD.DescriptorId = leaCode.EducationOrganizationIdentificationSystemDescriptorId and laeD.CodeValue = 'SEA'
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].EducationOrganizationFederalFunding edorgf ON edorglea.EducationOrganizationId = edorgf.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] laeREAPD ON laeREAPD.DescriptorId = edorgf.REAPAlternativeFundingStatusDescriptorId
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.OrganizationIdentifier, staging.OrganizationType, staging.FederalProgramCode, staging.FederalProgramsFundingAllocation
	, staging.ParentalInvolvementReservationFunds, staging.REAPAlternativeFundingStatusCode
 FROM [Staging].OrganizationFederalFunding staging
INNER JOIN 
(
		SELECT DISTINCT
			leaCode.IdentificationCode OrganizationIdentifier
			,'LEA' OrganizationType
			,edorgf.FederalProgramCode FederalProgramCode
			,edorgf.FederalProgramsFundingAllocation FederalProgramsFundingAllocation
			,edorgf.ParentalInvolvmementReservationFunds ParentalInvolvementReservationFunds
			,laeREAPD.CodeValue REAPAlternativeFundingStatusCode
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] leaCode on leaCode.EducationOrganizationId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] laeD ON laeD.DescriptorId = leaCode.EducationOrganizationIdentificationSystemDescriptorId and laeD.CodeValue = 'SEA'
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].EducationOrganizationFederalFunding edorgf ON edorglea.EducationOrganizationId = edorgf.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] laeREAPD ON laeREAPD.DescriptorId = edorgf.REAPAlternativeFundingStatusDescriptorId
) EdFi
ON
	staging.OrganizationIdentifier = edfi.OrganizationIdentifier 
	AND staging.OrganizationType = edfi.OrganizationType 
	AND (staging.FederalProgramCode IS NULL OR staging.FederalProgramCode = EdFi.FederalProgramCode)
	AND (staging.FederalProgramsFundingAllocation IS NULL OR staging.FederalProgramsFundingAllocation = EdFi.FederalProgramsFundingAllocation)
	AND (staging.ParentalInvolvementReservationFunds IS NULL OR staging.ParentalInvolvementReservationFunds = EdFi.ParentalInvolvementReservationFunds)
	AND staging.REAPAlternativeFundingStatusCode = EdFi.REAPAlternativeFundingStatusCode
) st


PRINT '-----------------------------------------------------'
PRINT 'The Staging LEA Reap Alternative Funding Status : ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi LEA Reap Alternative Funding Status : ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT ''' LEA Reap Alternative Funding Status : Unit Test To the Staging'' Succeeded'
ELSE
	PRINT ''' LEA Reap Alternative Funding Status : Unit Test To the Staging'' Failed'
PRINT ''
-- generate
DECLARE @GenerateCount INT

SELECT @GenerateCount = Count(*)
FROM [ODS].[K12FederalFundAllocation] ks
JOIN [ODS].RefReapAlternativeFundingStatus st ON st.[RefReapAlternativeFundingStatusId] = ks.[RefReapAlternativeFundingStatusId]


PRINT '-----------------------------------------------------'
PRINT 'The Staging LEA Reap Alternative Funding Status : ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate LEA Reap Alternative Funding Status : ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''LEA Reap Alternative Funding Status Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''LEA Reap Alternative Funding Status Unit Test To Generate.ODS'' Failed'
PRINT ''