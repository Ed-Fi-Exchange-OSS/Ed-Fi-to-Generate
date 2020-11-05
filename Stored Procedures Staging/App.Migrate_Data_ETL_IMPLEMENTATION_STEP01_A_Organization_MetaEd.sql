-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd]
	@SchoolYear SMALLINT
	AS 
	BEGIN



		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------Begin State Specific Information Section----------------------------------------
		---------------------------------------------------------------------------------------------------------------------
		----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
		----created to work with the data standardized in this location. Do not make any changes to table names or column----
		----names or to any of the code after this section.  The only information that should be modified is the source  ----
		----of this information.  Codeset mapping is configured in ODS.EdFiReferenceData. -----------------------------------
		---------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		-------------------
		--School Statuses--
		-------------------
		
		UPDATE Staging.Organization
		SET School_VirtualSchoolStatus = virtual.CodeValue
			,School_NationalSchoolLunchProgramStatus = nslp.CodeValue
			,School_SharedTimeIndicator = shared.CodeValue
			,School_ReconstitutedStatus = recon.CodeValue
		FROM Staging.Organization org
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON org.School_Identifier_State = edorgschool.StateOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON edorgschool.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool ceds ON sch.SchoolId = ceds.CedsSchoolId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor virtual ON ceds.VirtualSchoolStatusDescriptorId = virtual.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor nslp ON ceds.NationalSchoolLunchProgramStatusDescriptorId = nslp.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor shared ON ceds.SharedTimeIndicatorDescriptorId = shared.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor recon ON ceds.ReconstitutedStatusDescriptorId = recon.DescriptorId

		-------------------
		--LEA Type --------
		-------------------

		UPDATE Staging.Organization
		SET LEA_Type = leatype.CodeValue
		FROM Staging.Organization org
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON org.LEA_Identifier_State = edorglea.StateOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON edorglea.EducationOrganizationId = lea.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CEDSLocalEducationAgency CEDSLea ON lea.LocalEducationAgencyId = CEDSLea.LocalEducationAgencyId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor leatype ON CEDSLea.LocalEducationAgencyTypeDescriptorId = leatype.DescriptorId


		-------------------------------
		--Organization Financial Data--
		-------------------------------

		--Federal Program Code for Title I Part A Allocation is 84.010
		
		INSERT INTO Staging.OrganizationFederalFunding
		SELECT DISTINCT
			edorglea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('LEA', '001156') OrganizationType
			,edorgf.FederalProgramCode FederalProgramCode
			,edorgf.FederalProgramsFundingAllocation FederalProgramsFundingAllocation
			,edorgf.ParentalInvolvmementReservationFunds ParentalInvolvementReservationFunds
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].EducationOrganizationFederalFunding edorgf ON edorglea.EducationOrganizationId = edorgf.EducationOrganizationId


		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Organization SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Organization) > 0
		UPDATE Staging.OrganizationFederalFunding SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationFederalFunding) > 0

		-------------------------------------------------------------------------------------------------------------------------
		-------- Begin Validation of Staging Tables included in this ETL --------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------

		----Validate Staging.Organization----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd', 'Organization', @SchoolYear

		----Validate Staging.OrganizationFederalFunding----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd', 'OrganizationFederalFunding', @SchoolYear



	END