USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization]
	@SchoolYear SMALLINT = NULL
	AS 
	BEGIN
	
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

		-- Clean out the staging data from the last run.
		TRUNCATE TABLE Staging.StateDetail
		TRUNCATE TABLE Staging.Organization
		TRUNCATE TABLE Staging.OrganizationAddress
		TRUNCATE TABLE Staging.OrganizationGradeOffered
		TRUNCATE TABLE Staging.OrganizationPhone
		TRUNCATE TABLE Staging.OrganizationFederalFunding


		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------Begin State Specific Information Section----------------------------------------
		---------------------------------------------------------------------------------------------------------------------
		----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
		----created to work with the data standardized in this location. Do not make any changes to table names or column----
		----names or to any of the code after this section.  The only information that should be modified is the source  ----
		----of this information.  Codeset mapping is configured in ODS.EdFiReferenceData. -----------------------------------
		---------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------------------------------------------------------------------


		/* Build Up Staging tables with all organization data
		-------------------------------------------
		In this section, the staging tables will be loaded with state specific
		data. Any adjustment or customizations to this data specific to the state
		will be run immediately following the population of these tables.  All other
		processes following those customizations will be standard across generate
		states and do not require any further adjustment unless something in generate
		or CEDS is modified.

		EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization] 2018

		*/


		--Insert SEA Details--
		INSERT INTO Staging.StateDetail
		SELECT DISTINCT
			  NULL OrganizationId
			, sat.CodeValue StateCode
			, edorg.NameOfInstitution SeaName
			, edorg.ShortNameOfInstitution SeaShortName
			, edorg.EducationOrganizationId SeaStateIdentifier 
			, edorg.WebSite Sea_WebSiteAddress
			, 'John' SeaContact_FirstName
			, 'Doe' SeaContact_LastOrSurname
			, 'Mr.' SeaContact_PersonalTitleOrPrefix
			, 'John.Doe@txdoe.edu' SeaContact_ElectronicMailAddress
			, '5554127389' SeaContact_PhoneNumber
			,  NEWID() SeaContact_Identifier
			, NULL PersonId
			, NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateEducationAgency sea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg
			ON sea.StateEducationAgencyId = edorg.EducationOrganizationID
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationAddress edorgadd
			ON edorg.EducationOrganizationId = edorgadd.EducationOrganizationid
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aty
			ON edorgadd.AddressTypeDescriptorId = aty.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] sat
			ON edorgadd.StateAbbreviationDescriptorId = sat.DescriptorId
		WHERE aty.CodeValue = 'Physical'
		

		--Insert Organization Information--
		INSERT Staging.Organization 
		SELECT DISTINCT
			 edorglea.EducationOrganizationId									LEA_Identifier_State
			--,NULL																LEA_Identifier_State_Identifier_Old -- Only populate if an LEA State Identifier has changed, otherwise NULL
			,leancesid.IdentificationCode AS									LEA_Identifier_NCES
			,NULL																LEA_SupervisoryUnionIdentificationNumber
			,edorglea.NameOfInstitution											LEA_Name
			,edorglea.WebSite													LEA_WebSiteAddress
			,ostlea.CodeValue													LEA_OperationalStatus
			,ostlea.CodeValue													LEA_UpdatedOperationalStatus
			,App.GetFiscalYearStartDate(@SchoolYear) AS							LEA_UpdatedOperationalStatusEffectiveDate
			,NULL																LEA_CharterLeaStatus
			,CASE 
				WHEN leacst.CodeValue = 'Not a Charter School' THEN 0
				ELSE 1
			 END																LEA_CharterSchoolIndicator
			,leacat.CodeValue													LEA_Type
			,CASE 
				WHEN progchar.EducationOrganizationId IS NOT NULL THEN 1
				ELSE 0
			 END																LEA_McKinneyVentoSubgrantRecipient
			,gunfreeD.CodeValue													LEA_GunFreeSchoolsActReportingStatus

			,NULL																LEA_TitleIinstructionalService
			,NULL																LEA_TitleIProgramType
			,NULL																LEA_K12LeaTitleISupportService
			,NULL																LEA_MepProjectType

			,edorgschool.EducationOrganizationId								School_Identifier_State
			--,NULL																School_Identifier_State_Identifier_Old -- Only populate if a School State Identifier has changed, otherwise NULL
			,schncesid.IdentificationCode AS									School_Identifier_NCES
			,edorgschool.NameOfInstitution										School_Name
			,edorgschool.WebSite												School_WebSiteAddress
			,ostschool.CodeValue												School_OperationalStatus
			,ostschool.CodeValue												School_UpdatedOperationalStatus
			,App.GetFiscalYearStartDate(@SchoolYear)							School_UpdatedOperationalStatusEffectiveDate
			,st.CodeValue														School_Type
			,magnet.CodeValue													School_MagnetOrSpecialProgramEmphasisSchool
			,NULL																School_SharedTimeIndicator
			,NULL																School_VirtualSchoolStatus
			,NULL																School_NationalSchoolLunchProgramStatus
			,NULL																School_ReconstitutedStatus
			,schcharter.CodeValue												School_CharterSchoolApprovalAgencyType
			,CASE 
				WHEN schcst.CodeValue = 'Not a Charter School' THEN 0
				ELSE 1
			 END																School_CharterSchoolIndicator
			,NULL																School_CharterSchoolOpenEnrollmentIndicator
			,fein.IdentificationCode											School_CharterSchoolFEIN
			,NULL																School_CharterSchoolFEIN_Update
			,NULL																School_CharterContractIDNumber
			,NULL																School_CharterContractApprovalDate
			,NULL																School_CharterContractRenewalDate
			,NULL																School_CharterPrimaryAuthorizer
			,NULL																School_CharterSecondaryAuthorizer
			,'Neither'															School_StatePovertyDesignation -- Not allow NULL
			,NULL																SchoolImprovementAllocation
			,NULL																School_IndicatorStatusType
			,NULL																School_GunFreeSchoolsActReportingStatus
			,NULL																School_ProgressAchievingEnglishLanguageProficiencyIndicatorStatus
			,NULL																School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus
			,NULL																School_SchoolDangerousStatus
			,@SchoolYear AS														SchoolYear
			,TitleID.CodeValue													TitleIPartASchoolDesignation
			,NULL																School_ComprehensiveAndTargetedSupport
			,NULL																School_ComprehensiveSupport
			,NULL																School_TargetedSupport
			,NULL																ConsolidatedMepFundsStatus
			,NULL																School_MepProjectType
			,NULL																LEAOrganizationId -- Leave this value NULL, the Code below will populate as necessary	
			,NULL																SchoolOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL																SEAOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL																LEA_SpecialEducationProgramOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL																LEA_CTEProgramOrganizationId -- TODO
			,NULL																LEA_TitleIIIProgramOrganizationId
			,NULL																LEA_NorDProgramOrganizationId
			,NULL																LEA_TitleIProgramOrganizationId
			,NULL																LEA_MigrantProgramOrganizationId	
			,NULL																LEA_FosterProgramOrganizationId
			,NULL																LEA_Section504ProgramOrganizationId
			,NULL																LEA_K12programOrServiceId
			,NULL																LEA_K12LeaTitleISupportServiceId
			,NULL																LEA_HomelessProgramOrganizationId
			,NULL																School_SpecialEducationProgramOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL																School_CTEProgramOrganizationId -- TODO
			,NULL																School_TitleIIIProgramOrganizationId
			,NULL																School_NorDProgramOrganizationId
			,NULL																School_TitleIProgramOrganizationId
			,NULL																School_MigrantProgramOrganizationId	
			,NULL																School_FosterProgramOrganizationId
			,NULL																School_Section504ProgramOrganizationId
			,NULL																School_K12programOrServiceId
			,NULL																School_HomelessProgramOrganizationId
			,0 NewLEA -- Leave this value 0, the Code below will populate as necessary
			,0 NewSchool -- Leave this value 0, the Code below will populate as necessary
			,0 NewSpecialEducationProgram -- Leave this value 0, the Code below will populate as necessary
			,0 NewCTEProgram -- TODO
			,0 NewTitlIIIProgram -- TODO,
			,0 NewNorDProgram -- TODO,
			,0 NewTitleIProgram
			,0 NewMigrantProgram
			,0 NewFosterProgram
			,0 NewSection504Program
			,0 NewHomelessProgram
			,0 LEA_Identifier_State_ChangedIdentifier -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_Identifier_State_Identifier_Old
			,0 School_Identifier_State_ChangedIdentifier -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_Identifier_State_Identifier_Old
			,NULL SEAToLEA_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEAToSchool_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEAToSpecialEducationProgram_OrganizationRelationshipId
			,NULL LEAToCTEProgram_OrganizationRelationshipId
			,NULL LEAToTitleIIIProgram_OrganizationRelationshipId
			,NULL LEAToNorDProgram_OrganizationRelationshipId
			,NULL LEAToTitleIProgram_OrganizationRelationshipId
			,NULL LEAToMigrantProgram_OrganizationRelationshipId
			,NULL LEAToFosterProgram_OrganizationRelationshipId
			,NULL LEAToSection504Program_OrganizationRelationshipId
			,NULL LEAToHomelessProgram_OrganizationRelationshipId
			,NULL SchoolToSpecialEducationProgram_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolToCTEProgram_OrganizationRelationshipId
			,NULL SchoolToTitleIIIProgram_OrganizationRelationshipId
			,NULL SchoolToNorDProgram_OrganizationRelationshipId
			,NULL SchoolToTitleIProgram_OrganizationRelationshipId
			,NULL SchoolToMigrantProgram_OrganizationRelationshipId
			,NULL SchoolToFosterProgram_OrganizationRelationshipId
			,NULL SchoolToSection504Program_OrganizationRelationshipId
			,NULL SchoolToHomelessProgram_OrganizationRelationshipId
			,NULL LEA_OrganizationWebsiteId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationWebsiteId -- Leave this value NULL, the Code below will populate as necessary
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea 
			ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea 
			ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool 
			ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[auth].[EducationOrganizationIdToStateAgencyId] edState 
			ON sch.SchoolId = edState.EducationOrganizationId
		--v3.0 
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] st 
			ON st.DescriptorId = sch.SchoolTypeDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] ostlea 
			ON ostlea.DescriptorId = edorglea.OperationalStatusDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] ostschool 
			ON ostschool.DescriptorId = edorgschool.OperationalStatusDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] leacst 
			ON leacst.DescriptorId = lea.CharterStatusDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] leacat 
			ON leacat.DescriptorId = lea.LocalEducationAgencyCategoryDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schcst 
			ON schcst.DescriptorId = sch.CharterStatusDescriptorId
		-- charter school approval agency desciptor
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schcharter 
			ON schcharter.DescriptorId = sch.CharterApprovalAgencyTypeDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] fein 
			ON sch.SchoolId = fein.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] feind 
			ON feind.DescriptorId = fein.EducationOrganizationIdentificationSystemDescriptorId 
			AND feind.CodeValue = 'Federal'					-- TODO Federal Tax
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[LocalEducationAgencyAccountability] leaAcct 
			ON  lea.LocalEducationAgencyId = leaAcct.LocalEducationAgencyId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] gunfreeD 
			ON gunfreeD.DescriptorId = leaAcct.GunFreeSchoolsActReportingStatusDescriptorId
		-- TitleIPartASchoolDesignation
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] TitleID 
			ON TitleID.DescriptorId = sch.TitleIPartASchoolDesignationDescriptorId
		-- MAGNET School indicator
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] magnet 
			ON magnet.DescriptorId = sch.MagnetSpecialProgramEmphasisSchoolDescriptorId

		-- LEA NCES IDs
		LEFT JOIN (
			SELECT 
				  edorgidcodelea.EducationOrganizationId
				, edorgidcodelea.IdentificationCode
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgidcodelea 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor edorgidsdlea ON edorgidcodelea.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdlea.DescriptorId
			--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemType edorgidstlea ON edorgidsdlea.EducationOrganizationIdentificationSystemTypeId = edorgidstlea.EducationOrganizationIdentificationSystemTypeId 
				AND edorgidsdlea.CodeValue = 'NCES'
		) leancesid ON edorglea.EducationOrganizationId = leancesid.EducationOrganizationId
		-- School NCES IDs
		LEFT JOIN (
			SELECT 
				  edorgidcodesch.EducationOrganizationId
				, edorgidcodesch.IdentificationCode
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgidcodesch 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor edorgidsdsch ON edorgidcodesch.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdsch.DescriptorId
			--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemType edorgidstsch ON edorgidsdsch.EducationOrganizationIdentificationSystemTypeId = edorgidstsch.EducationOrganizationIdentificationSystemTypeId
				AND edorgidsdsch.CodeValue = 'NCES'
		) schncesid ON edorgschool.EducationOrganizationId = schncesid.EducationOrganizationId
		-- McKinney-Vento Subgrant Recipient
		LEFT JOIN (
			SELECT pc.EducationOrganizationId, pcd.CodeValue
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[ProgramCharacteristic] pc
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pcd ON pcd.DescriptorId = pc.ProgramCharacteristicDescriptorId
				AND pcd.CodeValue = 'A McKinney-Vento Program for Homelessness' AND Namespace = 'uri://ed-fi.org/ProgramCharacteristicDescriptor'
		) progchar ON progchar.EducationOrganizationId = edorglea.EducationOrganizationId

		--Note if it requires multiple inserts/updates to populate this table, do that in this location.
		--Every LEA and school that will be reported on directory (FS029) should be included in this table including those
		--schools/LEAs that will be reported as closed.

		--The purpose of the _ChangedIdentifier and _Identifier_Old is for when a state modifies the LEA or School identifier from one year to the next
		--but the entity will remain the same.  Example - the school's state identifer last year was AB123, but the state has decided to change their
		--identification system to numbers only.  So instead of AB123, this same schools state identifer is now just 99123. The bit value will indicate 
		--true (1) that an identifier has changed from last year to this year and the _Identifier_Old will indicate what the identifier was previously
		--Generate will treat this as an identifier change, but will leave the entity as a single organization.  Without this, Generate would treat this
		--as an entirly new organization.  Note: there is a process just below the state specific information section that uses the NCES ID to discover
		--these changes as well in case the source system is unable to supply the old identifier.

		UPDATE Staging.Organization
		SET 
			LEA_SupervisoryUnionIdentificationNumber = leaCode.IdentificationCode
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] leaCode 
			ON leaCode.EducationOrganizationId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] laeD 
			ON laeD.DescriptorId = leaCode.EducationOrganizationIdentificationSystemDescriptorId and laeD.CodeValue = 'Supervisory Union'

		--SEA  Address--
		INSERT INTO Staging.OrganizationAddress
		SELECT DISTINCT
			 edorgsea.EducationOrganizationId OrganizationIdentifier
			,'SEA' OrganizationType
			,aty.CodeValue AddressTypeForOrganization
			,edorgaddress.StreetNumberName AddressStreetNumberAndName
			,edorgaddress.ApartmentRoomSuiteNumber AddressApartmentRoomOrSuite
			,edorgaddress.City AddressCity
			,App.GetRefStateID(sat.CodeValue) RefStateId
			,App.GetRefStateAnsiCode(sd.Description) AddressStateANSICode
			,edorgaddress.PostalCode AddressPostalCode
			,NULL OrganizationId
			,NULL LocationId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateEducationAgency sea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgsea ON sea.StateEducationAgencyId = edorgsea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationAddress edorgaddress ON edorgsea.EducationOrganizationId = edorgaddress.EducationOrganizationId
		--v3.0
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aty on aty.DescriptorId = edorgaddress.AddressTypeDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] sat on sat.DescriptorId = edorgaddress.StateAbbreviationDescriptorId
		JOIN ODS.RefState sd ON sat.CodeValue = sd.Code
		WHERE edorgaddress.StreetNumberName IS NOT NULL
		AND edorgaddress.StreetNumberName <> ''
		AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')

	
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current address information - if it is different from previous years address information, the ETL code below will end date the
		--address for this address type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they will be end
		--dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--LEA Address--
		INSERT INTO Staging.OrganizationAddress
		SELECT DISTINCT
			edorglea.EducationOrganizationId OrganizationIdentifier
			,'LEA' OrganizationType
			,aty.CodeValue AddressTypeForOrganization
			,edorgaddress.StreetNumberName AddressStreetNumberAndName
			,edorgaddress.ApartmentRoomSuiteNumber AddressApartmentRoomOrSuite
			,edorgaddress.City AddressCity
			,App.GetRefStateID(sat.CodeValue) RefStateId
			,App.GetRefStateAnsiCode(sd.Description) AddressStateANSICode
			,edorgaddress.PostalCode AddressPostalCode
			,NULL OrganizationId
			,NULL LocationId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationAddress edorgaddress ON edorglea.EducationOrganizationId = edorgaddress.EducationOrganizationId
		--v3.0
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aty on aty.DescriptorId = edorgaddress.AddressTypeDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] sat on sat.DescriptorId = edorgaddress.StateAbbreviationDescriptorId
		JOIN ODS.RefState sd ON sat.CodeValue = sd.Code
		WHERE edorgaddress.StreetNumberName IS NOT NULL
		AND edorgaddress.StreetNumberName <> ''
		AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current address information - if it is different from previous years address information, the ETL code below will end date the
		--address for this address type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they will be end
		--dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--School Address--
		INSERT INTO Staging.OrganizationAddress
		SELECT DISTINCT
			 edorgschool.EducationOrganizationId OrganizationIdentifier
			,'K12School' OrganizationType
			,aty.CodeValue AddressTypeForOrganization
			,edorgaddress.StreetNumberName AddressStreetNumberAndName
			,edorgaddress.ApartmentRoomSuiteNumber AddressApartmentRoomOrSuite
			,edorgaddress.City AddressCity
			,App.GetRefStateID(sat.CodeValue) RefStateId
			,App.GetRefStateAnsiCode(sd.Description) AddressStateANSICode
			,edorgaddress.PostalCode AddressPostalCode
			,NULL OrganizationId
			,NULL LocationId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationAddress edorgaddress ON edorgschool.EducationOrganizationId = edorgaddress.EducationOrganizationId
		--v3.0
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aty on aty.DescriptorId = edorgaddress.AddressTypeDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] sat on sat.DescriptorId = edorgaddress.StateAbbreviationDescriptorId
		JOIN ODS.RefState sd ON sat.CodeValue = sd.Code
		WHERE edorgaddress.StreetNumberName IS NOT NULL
		AND edorgaddress.StreetNumberName <> ''
		AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current address information - if it is different from previous years address information, the ETL code below will end date the
		--address for this address type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they will be end
		--dated on June 30, xxxx and the new record will begin July 1, xxxx.



		--Insert Telephone Information--

		--SEA Telephone--
		INSERT INTO Staging.OrganizationPhone
		SELECT DISTINCT
			 edorgsea.EducationOrganizationId OrganizationIdentifier
			,'SEA' OrganizationType
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateEducationAgency sea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgsea ON sea.StateEducationAgencyId = edorgsea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorgsea.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] itnt ON itnt.DescriptorId = edorgphone.InstitutionTelephoneNumberTypeDescriptorId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeDescriptorId IS NOT NULL
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current phone information - if it is different from previous years telephone information, the ETL code below will end date the
		--telephone for this telephone number type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--LEA Telephone--
		INSERT INTO Staging.OrganizationPhone
		SELECT DISTINCT
			 edorglea.EducationOrganizationId OrganizationIdentifier
			,'LEA' OrganizationType
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorglea.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] itnt ON itnt.DescriptorId = edorgphone.InstitutionTelephoneNumberTypeDescriptorId

		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeDescriptorId IS NOT NULL
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current phone information - if it is different from previous years telephone information, the ETL code below will end date the
		--telephone for this telephone number type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--School Telephone--
		INSERT INTO Staging.OrganizationPhone
		SELECT DISTINCT
			 edorgschool.EducationOrganizationId OrganizationIdentifier
			,'K12School' OrganizationType
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorgschool.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] itnt ON itnt.DescriptorId = edorgphone.InstitutionTelephoneNumberTypeDescriptorId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeDescriptorId IS NOT NULL
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current phone information - if it is different from previous years telephone information, the ETL code below will end date the
		--telephone for this telephone number type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.

		INSERT INTO Staging.OrganizationGradeOffered
		SELECT DISTINCT
			 edorgschool.EducationOrganizationId OrganizationIdentifier
			,glt.CodeValue GradeOffered
			,NULL OrganizationId -- Leave this value NULL, the code below will populatee as necessary
			,NULL K12SchoolGradeOfferedId -- Leave this value NULL, the code below will populate as necessary
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SchoolGradeLevel sgl ON sch.SchoolId = sgl.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].GradeLevelDescriptor gld ON sgl.GradeLevelDescriptorId = gld.GradeLevelDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor glt ON gld.GradeLevelDescriptorId = glt.DescriptorId
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].GradeLevelType glt ON gld.GradeLevelTypeId = glt.GradeLevelTypeId
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current Grade offered information - if it is different from previous years Grade offered information, the ETL code below will end date the
		--Grade offered for this organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.


		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.StateDetail SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.StateDetail) > 0
		UPDATE Staging.Organization SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Organization) > 0
		UPDATE Staging.OrganizationAddress SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationAddress) > 0
		UPDATE Staging.OrganizationGradeOffered SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationGradeOffered) > 0
		UPDATE Staging.OrganizationPhone SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationPhone) > 0
		UPDATE Staging.OrganizationFederalFunding SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationFederalFunding) > 0


		-------------------------------------------------------------------------------------------------------------------------
		-------- Begin Validation of Staging Tables included in this ETL --------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------

		----Validate Staging.StateDetail----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'StateDetail', @SchoolYear

		--Validate Staging.Organization
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'Organization', @SchoolYear

		--Validate Staging.OrganizationAddress
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'OrganizationAddress', @SchoolYear

		--Validate Staging.OrganizationGradeOffered
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'OrganizationGradeOffered', @SchoolYear

		--Validate Staging.OrganizationPhone
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'OrganizationPhone', @SchoolYear

		--Validate Staging.OrganizationFederalFunding
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'OrganizationFederalFunding', @SchoolYear


	END