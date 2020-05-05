/***************************************************************
*
*	FS163: This script is for the unit test for FS163 between the Staging and EdFi
*
***************************************************************/		
USE generate 

DECLARE @SchoolYear INT
DECLARE @StagingCount INT, @EdFiCount INT

SET @SchoolYear = 2018

-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
select lea.LocalEducationAgencyId, leaAcct.GunFreeSchoolsActReportingStatusDescriptorId
		FROM  [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea 
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[LocalEducationAgencyAccountability] leaAcct on  lea.LocalEducationAgencyId = leaAcct.LocalEducationAgencyId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] gunfreeD ON gunfreeD.DescriptorId = leaAcct.GunFreeSchoolsActReportingStatusDescriptorId
		WHERE  Namespace = 'uri://ed-fi.org/GunFreeSchoolsActReportingStatusDescriptor'
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.SchoolYear, staging.LEA_Identifier_State, staging.LEA_GunFreeSchoolsActReportingStatus FROM [Staging].[Organization] staging
INNER JOIN 
(
select lea.LocalEducationAgencyId, gunfreeD.ShortDescription LEA_GunFreeSchoolsActReportingStatus, leaAcct.SchoolYear
		FROM  [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea 
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[LocalEducationAgencyAccountability] leaAcct on  lea.LocalEducationAgencyId = leaAcct.LocalEducationAgencyId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] gunfreeD ON gunfreeD.DescriptorId = leaAcct.GunFreeSchoolsActReportingStatusDescriptorId
		WHERE  Namespace = 'uri://ed-fi.org/GunFreeSchoolsActReportingStatusDescriptor'
) EdFi
ON
	staging.SchoolYear = edfi.SchoolYear 
	AND staging.LEA_Identifier_State = edfi.LocalEducationAgencyId 
	AND staging.LEA_GunFreeSchoolsActReportingStatus = EdFi.LEA_GunFreeSchoolsActReportingStatus
WHERE staging.SchoolYear = @SchoolYear
) st


PRINT '-----------------------------------------------------'
PRINT 'The Staging LEA Gun Free Status: ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi LEA Gun Free Status: ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT ''' LEA Gun Free Status: Unit Test To the Staging'' Succeeded'
ELSE
	PRINT ''' LEA Gun Free Status: Unit Test To the Staging'' Failed'
PRINT ''
-- generate
DECLARE @GenerateCount INT

SELECT @GenerateCount = Count(*)
		FROM  ODS.[OrganizationFederalAccountability] ofa
		JOIN ODS.OrganizationIdentifier orgid on OFA.OrganizationId = orgid.OrganizationID
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
		AND [RefGunFreeSchoolsActStatusReportingId] IS NOT NULL

PRINT '-----------------------------------------------------'
PRINT 'The Staging LEA Gun Free Status: ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate LEA Gun Free Status: ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''Student LEA Gun Free Status Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''Student LEA Gun Free Status Unit Test To Generate.ODS'' Failed'
PRINT ''


-----------------------------------------------------------------------
-- Unit Testing for School Gun Free Status
-----------------------------------------------------------------------



-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
select sch.SchoolId, ceds.GunFreeSchoolsActReportingStatusDescriptorId 		
	FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool ceds ON sch.SchoolId = ceds.CedsSchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor gunfree ON ceds.GunFreeSchoolsActReportingStatusDescriptorId = gunfree.DescriptorId
		WHERE  gunfree.Namespace = 'uri://ed-fi.org/GunFreeSchoolsActReportingStatusDescriptor'
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.SchoolYear, staging.School_Identifier_State, staging.School_GunFreeSchoolsActReportingStatus FROM [Staging].[Organization] staging
INNER JOIN 
(
select sch.SchoolId, gunfree.CodeValue	 School_GunFreeSchoolsActReportingStatus	
	FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool ceds ON sch.SchoolId = ceds.CedsSchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor gunfree ON ceds.GunFreeSchoolsActReportingStatusDescriptorId = gunfree.DescriptorId
		WHERE  gunfree.Namespace = 'uri://ed-fi.org/GunFreeSchoolsActReportingStatusDescriptor'
) EdFi
ON
	staging.School_Identifier_State = edfi.SchoolId 
	AND staging.School_GunFreeSchoolsActReportingStatus = EdFi.School_GunFreeSchoolsActReportingStatus
WHERE staging.SchoolYear = @SchoolYear
) st


PRINT '-----------------------------------------------------'
PRINT 'The Staging School Gun Free Status: ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi School Gun Free Status: ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT ''' School Gun Free Status: Unit Test To the Staging'' Succeeded'
ELSE
	PRINT ''' School Gun Free Status: Unit Test To the Staging'' Failed'
PRINT ''

-- generate

SELECT @GenerateCount = Count(*)
		FROM  ODS.[OrganizationFederalAccountability] ofa
		JOIN ODS.K12School sch on OFA.OrganizationId = sch.OrganizationID
WHERE [RefGunFreeSchoolsActStatusReportingId] IS NOT NULL

PRINT '-----------------------------------------------------'
PRINT 'The Staging School Gun Free Status: ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate School Gun Free Status: ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''Student School Gun Free Status Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''Student School Gun Free Status Unit Test To Generate.ODS'' Failed'
PRINT ''




-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
select sch.SchoolId, ceds.GunFreeSchoolsActReportingStatusDescriptorId 		
	FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool ceds ON sch.SchoolId = ceds.CedsSchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor gunfree ON ceds.GunFreeSchoolsActReportingStatusDescriptorId = gunfree.DescriptorId
		WHERE  gunfree.Namespace = 'uri://ed-fi.org/GunFreeSchoolsActReportingStatusDescriptor'
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.SchoolYear, staging.School_Identifier_State, staging.School_GunFreeSchoolsActReportingStatus FROM [Staging].[Organization] staging
INNER JOIN 
(
select sch.SchoolId, gunfree.CodeValue	 School_GunFreeSchoolsActReportingStatus	
	FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool ceds ON sch.SchoolId = ceds.CedsSchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor gunfree ON ceds.GunFreeSchoolsActReportingStatusDescriptorId = gunfree.DescriptorId
		WHERE  gunfree.Namespace = 'uri://ed-fi.org/GunFreeSchoolsActReportingStatusDescriptor'
) EdFi
ON
	staging.School_Identifier_State = edfi.SchoolId 
	AND staging.School_GunFreeSchoolsActReportingStatus = EdFi.School_GunFreeSchoolsActReportingStatus
WHERE staging.SchoolYear = @SchoolYear
) st


PRINT '-----------------------------------------------------'
PRINT 'The Staging School Gun Free Status: ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi School Gun Free Status: ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT ''' School Gun Free Status: Unit Test To the Staging'' Succeeded'
ELSE
	PRINT ''' School Gun Free Status: Unit Test To the Staging'' Failed'
PRINT ''
-- generate


SELECT @GenerateCount = Count(*)
		FROM  ODS.[OrganizationFederalAccountability] ofa
		JOIN ODS.K12School sch on OFA.OrganizationId = sch.OrganizationID
WHERE [RefGunFreeSchoolsActStatusReportingId] IS NOT NULL

PRINT '-----------------------------------------------------'
PRINT 'The Staging School Gun Free Status: ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate School Gun Free Status: ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''Student School Gun Free Status Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''Student School Gun Free Status Unit Test To Generate.ODS'' Failed'
PRINT ''