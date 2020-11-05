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
	@SchoolYear SMALLINT = NULL
	AS 
	BEGIN

		/*
			[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd] 2018
		*/
		
		IF @SchoolYear IS NULL BEGIN
			SELECT @SchoolYear = d.Year + 1
			FROM rds.DimDateDataMigrationTypes dd 
			JOIN rds.DimDates d 
				ON dd.DimDateId = d.DimDateId 
			JOIN rds.DimDataMigrationTypes b 
				ON b.DimDataMigrationTypesId = dd.DataMigrationTypeId 
			WHERE dd.IsSelected = 1 
				AND DataMigrationTypeCode = 'ODS'
		END 


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
		-- MepProjectType if any
		-------------------

		UPDATE Staging.Organization
		SET School_VirtualSchoolStatus = virtual.CodeValue
			,School_NationalSchoolLunchProgramStatus = nslp.CodeValue
			,School_SharedTimeIndicator = shared.CodeValue
			,School_ReconstitutedStatus = recon.CodeValue
			,School_MepProjectType = MepProgramTypeDesc.CodeValue
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode 
			ON schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD 
			ON schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId 
			AND schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool ceds ON sch.SchoolId = ceds.CedsSchoolId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor virtual ON ceds.VirtualSchoolStatusDescriptorId = virtual.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor nslp ON ceds.NationalSchoolLunchProgramStatusDescriptorId = nslp.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor shared ON ceds.SharedTimeIndicatorDescriptorId = shared.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor recon ON ceds.ReconstitutedStatusDescriptorId = recon.DescriptorId
		-- MepProgramType
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor MepProgramTypeDesc 
			ON MepProgramTypeDesc.DescriptorId = ceds.MepProjectTypeDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor titleiDesc ON titleiDesc.DescriptorId = ceds.TitleISchoolStatusDescriptorId



		UPDATE Staging.Organization
		SET
			[School_ComprehensiveAndTargetedSupport] = ctsD.CodeValue
			,[School_ComprehensiveSupport] = csD.CodeValue
			,[School_TargetedSupport] = tsD.CodeValue
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode 
			ON schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD 
			ON schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId 
			AND schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN EdFi_Sample_ODS_Data_For_Generate.extension.CedsSchoolComprehensiveAndTargetedSupport csts ON
			csts.SchoolId = sch.SchoolId
		LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor ctsD ON ctsD.DescriptorId = csts.ComprehensiveAndTargetedSupportDescriptorId	
		LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor csD ON csD.DescriptorId = csts.ComprehensiveSupportDescriptorId
		LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor tsD ON tsD.DescriptorId = csts.TargetedSupportDescriptorId

		--------------------------------------
		-- School poverty designation --------
		--------------------------------------
		UPDATE Staging.Organization
		SET School_StatePovertyDesignation= ISNULL(povdesc.CodeValue, 'NEITHER') -- StatePovertY is allowed to be NULL or MISSING
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchool] cedssch ON cedssch.CedsSchoolId=sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] povdesc ON povdesc.DescriptorId=cedssch.StatePovertyDesignationDescriptorId

		--------------------------
		-- School Federal Funds --
		--------------------------
		UPDATE Staging.Organization
		SET SchoolImprovementAllocation = sfedfund.SchoolImprovementAllocation
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].SchoolFederalFunds sfedfund ON sch.SchoolId = sfedfund.SchoolId AND sfedfund.FiscalYear = @SchoolYear

		-------------------
		--LEA Type --------
		-- LEA TitleI related attributes if any
		-- MepProjectType
		-------------------

		UPDATE Staging.Organization
		SET LEA_Type = isnull(leatype.CodeValue, LEA_Type) 
			,LEA_TitleIinstructionalService = TitleIinstructionalServiceDesc.CodeValue
			,LEA_TitleIProgramType = TitleIProgramTypeDesc.CodeValue
			,LEA_K12LeaTitleISupportService = K12LeaTitleISupportServiceDesc.CodeValue
			,LEA_MepProjectType = MepProgramTypeDesc.CodeValue
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] leaCode 
			ON leaCode.EducationOrganizationId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] laeD 
			ON laeD.DescriptorId = leaCode.EducationOrganizationIdentificationSystemDescriptorId and laeD.CodeValue = 'SEA'
		JOIN Staging.Organization org 
			ON org.LEA_Identifier_State = leaCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea 
			ON edorglea.EducationOrganizationId = lea.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsLocalEducationAgency CedsLea 
			ON lea.LocalEducationAgencyId = CEDSLea.LocalEducationAgencyId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor leatype 
			ON lea.LocalEducationAgencyCategoryDescriptorId = leatype.DescriptorId
		-- Title I related attributes
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor TitleIinstructionalServiceDesc 
			ON TitleIinstructionalServiceDesc.DescriptorId = CEDSLea.TitleIinstructionalServiceDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor TitleIProgramTypeDesc 
			ON TitleIProgramTypeDesc.DescriptorId = CEDSLea.TitleIProgramTypeDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor K12LeaTitleISupportServiceDesc 
			ON K12LeaTitleISupportServiceDesc.DescriptorId = CEDSLea.K12LeaTitleISupportServiceDescriptorId
		-- MepProgramType
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor MepProgramTypeDesc 
			ON MepProgramTypeDesc.DescriptorId = CedsLea.MepProjectTypeDescriptorId
		-------------------
		--Charter School Contract--
		-------------------

		UPDATE Staging.Organization
		SET School_CharterContractIDNumber = cc.ContractIdentifier
			, School_CharterContractApprovalDate = cc.ApprovalDate
			, School_CharterContractRenewalDate = cc.RenewalDate
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool ceds ON sch.SchoolId = ceds.CedsSchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CharterContract cc ON cc.ContractIdentifier = ceds.ContractIdentifier

		-------------------
		--School Gun Free Status--
		-------------------

		UPDATE Staging.Organization
		SET School_GunFreeSchoolsActReportingStatus = gunfree.CodeValue
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchoolAccountability ceds ON sch.SchoolId = ceds.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor gunfree ON ceds.GunFreeSchoolsActReportingStatusDescriptorId = gunfree.DescriptorId

		-------------------
		--School Progress Achiving English Proficiency Indicator Status--
		-------------------

		UPDATE Staging.Organization
		SET School_ProgressAchievingEnglishLanguageProficiencyIndicatorStatus = prog.CodeValue
			, School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus = 
			   CASE
				WHEN prog.CodeValue = 'STTDEF' THEN ceds.ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus
				ELSE NULL
			  END
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchoolStatus ceds ON sch.SchoolId = ceds.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor prog ON ceds.ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId = prog.DescriptorId

		-----------------------------------------------------
		-- School Indicator Status Type-- fs199, fs200, fs201
		-----------------------------------------------------

		TRUNCATE TABLE [Staging].[OrganizationSchoolIndicatorStatus]

		INSERT INTO [Staging].[OrganizationSchoolIndicatorStatus]
		(
			[School_Identifier_State]
			,[SchoolYear]
			,[IndicatorStatusType]
			,[IndicatorStatus]
			,[IndicatorStatusSubgroupType]
			,[IndicatorStatusSubgroup]
			,[StatedDefinedIndicatorStatus]
			,RecordStartDateTime
			,RecordEndDateTime
		)
		SELECT    
			schCode.IdentificationCode
			, @SchoolYear
			, stTypeD.CodeValue
			, stD.CodeValue
			, subGTyD.CodeValue
			, subGD.CodeValue
			, sis.StatedDefinedIndicatorStatus
			, sis.RecordStartDateTime
			, sis.RecordEndDateTime
		FROM EdFi_Sample_ODS_Data_For_Generate.extension.CedsSchoolIndicatorStatus sis
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sis.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor stTypeD ON stTypeD.DescriptorId = sis.IndicatorStatusTypeDescriptorId	
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor stD ON stD.DescriptorId = sis.IndicatorStatusDescriptorId
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor subGTyD ON subGTyD.DescriptorId = sis.IndicatorStatusSubgroupTypeDescriptorId
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor subGD ON subGD.DescriptorId = sis.IndicatorStatusSubgroupDescriptorId
		WHERE stTypeD.CodeValue = 'GraduationRateIndicatorStatus' 
			  OR stTypeD.CodeValue = 'AcademicAchievementIndicatorStatus'
			  OR stTypeD.CodeValue = 'OtherAcademicIndicatorStatus'

		-----------------------------------------------------
		-- School Indicator Status Type-- fs202
		-----------------------------------------------------
		TRUNCATE TABLE [Staging].[OrganizationCustomSchoolIndicatorStatusType]

		INSERT INTO [Staging].[OrganizationCustomSchoolIndicatorStatusType]
		(
			[School_Identifier_State]
			,[SchoolYear]
			,[IndicatorStatusType]
			,[IndicatorStatus]
			,[IndicatorStatusSubgroupType]
			,[IndicatorStatusSubgroup]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,RecordEndDateTime
		)
		SELECT    
			schCode.IdentificationCode
			, @SchoolYear
			, stTypeD.CodeValue
			, stD.CodeValue
			, subGTyD.CodeValue
			, subGD.CodeValue
			, csis.StatedDefinedIndicatorStatus
			, csis.StatedDefinedCustomIndicatorStatusType
			, csis.RecordStartDateTime
			, csis.RecordEndDateTime
		FROM EdFi_Sample_ODS_Data_For_Generate.extension.CedsSchoolCustomIndicatorStatusType csis
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode 
			ON schCode.EducationOrganizationId = csis.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD 
			ON schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId 
			AND schD.CodeValue = 'SEA'
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor stTypeD ON stTypeD.DescriptorId = csis.IndicatorStatusTypeDescriptorId	
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor stD ON stD.DescriptorId = csis.IndicatorStatusDescriptorId
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor subGTyD ON subGTyD.DescriptorId = csis.IndicatorStatusSubgroupTypeDescriptorId
		JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor subGD ON subGD.DescriptorId = csis.IndicatorStatusSubgroupDescriptorId
		--WHERE stTypeD.CodeValue = 'SchoolQualityOrStudentSuccessIndicatorStatus' 

		-------------------
		--School Progress Achiving English Proficiency Indicator Status--
		-------------------

		UPDATE Staging.Organization
		SET School_SchoolDangerousStatus = st.CodeValue
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchoolStatus ceds ON sch.SchoolId = ceds.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor st ON ceds.SchoolDangerousStatusDescriptorId = st.DescriptorId

		-------------------------------
		--Organization CharterSchoolManagementOrganizationType Data--
		-------------------------------
		--UPDATE Staging.Organization
		--SET School_CharterSchoolManagementOrganizationType = cschmotype.CodeValue
			
		--FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'School'
		--JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool ceds ON sch.SchoolId = ceds.CedsSchoolId
		--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor cschmotype ON ceds.CharterSchoolManagementOrganizationTypeDescriptorId = cschmotype.DescriptorId

		-------------------------------
		--Organization ConsolidatedMepFundsStatus
		-------------------------------
		UPDATE Staging.Organization
		SET ConsolidatedMepFundsStatus = ceds.ConsolidatedMepFundsStatus
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] schCode on schCode.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schD on schD.DescriptorId = schCode.EducationOrganizationIdentificationSystemDescriptorId and schD.CodeValue = 'SEA'
		JOIN Staging.Organization org ON org.School_Identifier_State = schCode.IdentificationCode
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchoolStatus ceds ON sch.SchoolId = ceds.SchoolId

		-------------------------------
		--Organization Financial Data--
		-------------------------------

		--Federal Program Code for Title I Part A Allocation is 84.010
		TRUNCATE TABLE [Staging].OrganizationFederalFunding

		INSERT INTO Staging.OrganizationFederalFunding
		SELECT DISTINCT
			leaCode.IdentificationCode OrganizationIdentifier
			,'LEA' OrganizationType
			,edorgf.FederalProgramCode FederalProgramCode
			,edorgf.FederalProgramsFundingAllocation FederalProgramsFundingAllocation
			,edorgf.ParentalInvolvmementReservationFunds ParentalInvolvementReservationFunds
			,laeREAPD.CodeValue REAPAlternativeFundingStatusCode
			,leaFPF.CodeValue
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea 
			ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] leaCode 
			ON leaCode.EducationOrganizationId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] laeD 
			ON laeD.DescriptorId = leaCode.EducationOrganizationIdentificationSystemDescriptorId and laeD.CodeValue = 'SEA'
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].EducationOrganizationFederalFunding edorgf 
			ON edorglea.EducationOrganizationId = edorgf.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] laeREAPD 
			ON laeREAPD.DescriptorId = edorgf.REAPAlternativeFundingStatusDescriptorId

		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] leaFPF 
			ON leaFPF.DescriptorId = edorgf.FederalProgramFundingAllocationTypeDescriptorId


		-- Charter School Approval		
		TRUNCATE TABLE [Staging].[CharterSchoolApprovalAgency]

		INSERT INTO [Staging].[CharterSchoolApprovalAgency]
			(
				[CharterSchoolId]
				,[CharterSchoolApprovalAgencyId]
				,[CharterSchoolApprovalAgencyType]
				,[CharterSchoolApprovalAgency_Name]
				,[RunDateTime]
			)
		SELECT 
			sch.CedsSchoolId,
			sch.CharterSchoolApprovalAgencyId, 
			d.CodeValue,
			org.NameOfInstitution,
			GETDATE()
		FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchool] sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].[CharterSchoolApprovalAgency] approvOrg On sch.CharterSchoolApprovalAgencyId = approvOrg.CharterSchoolApprovalAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganization] org ON org.EducationOrganizationId = approvOrg.CharterSchoolApprovalAgencyId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d ON d.DescriptorId = approvOrg.[CharterApprovalAgencyTypeDescriptorId]

		--
		
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

		----Validate Staging.OrganizationFederalFunding----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd', 'CharterSchoolApprovalAgency', @SchoolYear

	END