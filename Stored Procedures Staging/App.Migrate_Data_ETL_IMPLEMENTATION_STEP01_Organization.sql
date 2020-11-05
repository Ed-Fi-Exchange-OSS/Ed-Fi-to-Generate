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


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization]
	@SchoolYear SMALLINT
	AS 
	BEGIN


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
		
		*/


		--Insert SEA Details--
		INSERT INTO Staging.StateDetail
		SELECT DISTINCT
			  NULL OrganizationId
			, 'Nebraska' StateName
			, sat.CodeValue StateCode
			, edorg.NameOfInstitution SeaName
			, edorg.ShortNameOfInstitution SeaShortName
			, StateOrganizationId SeaStateIdentifier
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
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].AddressType aty
			ON edorgadd.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateAbbreviationType sat
			ON edorgadd.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
		WHERE aty.CodeValue = 'Physical'
		

		--Insert Organization Information--
		INSERT Staging.Organization
		SELECT DISTINCT
			 edorglea.StateOrganizationId LEA_Identifier_State
			,leancesid.IdentificationCode AS LEA_Identifier_NCES
			,NULL LEA_SupervisoryUnionIdentificationNumber
			,edorglea.NameOfInstitution LEA_Name
			,edorglea.WebSite LEA_WebSiteAddress
			,ostlea.CodeValue LEA_OperationalStatus
			,App.GetFiscalYearStartDate(@SchoolYear) AS LEA_OperationalStatusEffectiveDate
			,leacst.CodeValue LEA_CharterSchoolIndicator
			,NULL LEA_Type
			,edorgschool.StateOrganizationId School_Identifier_State
			,schncesid.IdentificationCode AS School_Identifier_NCES
			,edorgschool.NameOfInstitution School_Name
			,edorgschool.WebSite School_WebSiteAddress
			,ostschool.CodeValue School_OperationalStatus
			,App.GetFiscalYearStartDate(@SchoolYear) School_OperationalStatusEffectiveDate
			,st.CodeValue School_Type
			,NULL School_MagnetOrSpecialProgramEmphasisSchool
			,NULL School_SharedTimeIndicator
			,NULL School_VirtualSchoolStatus
			,NULL School_NationalSchoolLunchProgramStatus
			,NULL School_ReconstitutedStatus
			,NULL School_CharterSchoolApprovalAgencyType
			,schcst.CodeValue School_CharterSchoolIndicator
			,@SchoolYear AS SchoolYear
			,NULL LEAOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SEAOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SpecialEducationProgramOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL TitleIProgramOrganizationId
			,NULL MigrantProgramOrganizationId
			,NULL FosterProgramOrganizationId
			,0 NewLEA -- Leave this value 0, the Code below will populate as necessary
			,0 NewSchool -- Leave this value 0, the Code below will populate as necessary
			,0 NewSpecialEducationProgram -- Leave this value 0, the Code below will populate as necessary
			,0 NewTitleIProgram
			,0 NewMigrantProgram
			,0 NewFosterProgram
			,0 LEA_Identifier_State_ChangedIdentifier -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_Identifier_State_Identifier_Old -- Only populate if an LEA State Identifier has changed, otherwise NULL
			,0 School_Identifier_State_ChangedIdentifier -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_Identifier_State_Identifier_Old -- Only populate if a School State Identifier has changed, otherwise NULL
			,NULL SEAToLEA_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEAToSchool_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolToSpecialEducationProgram_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolToTitleIProgram_OrganizationRelationshipId
			,NULL SchoolToMigrantProgram_OrganizationRelationshipId
			,NULL SchoolToFosterProgram_OrganizationRelationshipId
			,NULL LEA_OrganizationWebsiteId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationWebsiteId -- Leave this value NULL, the Code below will populate as necessary
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SchoolType st ON sch.SchoolTypeId = st.SchoolTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].OperationalStatusType ostlea ON edorglea.OperationalStatusTypeId = ostlea.OperationalStatusTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].OperationalStatusType ostschool ON edorgschool.OperationalStatusTypeId = ostschool.OperationalStatusTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].CharterStatusType leacst ON lea.CharterStatusTypeId = leacst.CharterStatusTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].CharterStatusType schcst ON sch.CharterStatusTypeId = schcst.CharterStatusTypeId
		-- LEA NCES IDs
		LEFT JOIN (
			SELECT 
				  edorgidcodelea.EducationOrganizationId
				, edorgidcodelea.IdentificationCode
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgidcodelea 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemDescriptor edorgidsdlea ON edorgidcodelea.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdlea.EducationOrganizationIdentificationSystemDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemType edorgidstlea ON edorgidsdlea.EducationOrganizationIdentificationSystemTypeId = edorgidstlea.EducationOrganizationIdentificationSystemTypeId 
				AND edorgidstlea.CodeValue = 'NCES'
		) leancesid ON edorglea.EducationOrganizationId = leancesid.EducationOrganizationId
		-- School NCES IDs
		LEFT JOIN (
			SELECT 
				  edorgidcodesch.EducationOrganizationId
				, edorgidcodesch.IdentificationCode
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgidcodesch 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemDescriptor edorgidsdsch ON edorgidcodesch.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdsch.EducationOrganizationIdentificationSystemDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemType edorgidstsch ON edorgidsdsch.EducationOrganizationIdentificationSystemTypeId = edorgidstsch.EducationOrganizationIdentificationSystemTypeId
				AND edorgidstsch.CodeValue = 'NCES'
		) schncesid ON edorgschool.EducationOrganizationId = schncesid.EducationOrganizationId

	  


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


		--SEA  Address--
		INSERT INTO Staging.OrganizationAddress
		SELECT DISTINCT
			 edorgsea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('SEA', '001156') AS OrganizationType
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
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].AddressType aty ON edorgaddress.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateAbbreviationType sat ON edorgaddress.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
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
				edorglea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('LEA', '001156') OrganizationType
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
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].AddressType aty ON edorgaddress.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateAbbreviationType sat ON edorgaddress.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
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
				edorgschool.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('K12School', '001156') OrganizationType
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
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].AddressType aty ON edorgaddress.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateAbbreviationType sat ON edorgaddress.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
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
				edorgsea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('SEA', '001156') AS OrganizationType
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateEducationAgency sea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgsea ON sea.StateEducationAgencyId = edorgsea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorgsea.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].InstitutionTelephoneNumberType itnt ON edorgphone.InstitutionTelephoneNumberTypeId = itnt.InstitutionTelephoneNumberTypeId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeId IS NOT NULL
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current phone information - if it is different from previous years telephone information, the ETL code below will end date the
		--telephone for this telephone number type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--LEA Telephone--
		INSERT INTO Staging.OrganizationPhone
		SELECT DISTINCT
				edorglea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('LEA', '001156') OrganizationType
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorglea.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].InstitutionTelephoneNumberType itnt ON edorgphone.InstitutionTelephoneNumberTypeId = itnt.InstitutionTelephoneNumberTypeId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeId IS NOT NULL
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current phone information - if it is different from previous years telephone information, the ETL code below will end date the
		--telephone for this telephone number type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--School Telephone--
		INSERT INTO Staging.OrganizationPhone
		SELECT DISTINCT
				edorgschool.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('K12School', '001156') OrganizationType
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorgschool.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].InstitutionTelephoneNumberType itnt ON edorgphone.InstitutionTelephoneNumberTypeId = itnt.InstitutionTelephoneNumberTypeId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeId IS NOT NULL
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current phone information - if it is different from previous years telephone information, the ETL code below will end date the
		--telephone for this telephone number type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.

		INSERT INTO Staging.OrganizationGradeOffered
		SELECT DISTINCT
				edorgschool.StateOrganizationId OrganizationIdentifier
			,glt.CodeValue GradeOffered
			,NULL OrganizationId -- Leave this value NULL, the code below will populatee as necessary
			,NULL K12SchoolGradeOfferedId -- Leave this value NULL, the code below will populate as necessary
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SchoolGradeLevel sgl ON sch.SchoolId = sgl.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].GradeLevelDescriptor gld ON sgl.GradeLevelDescriptorId = gld.GradeLevelDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].GradeLevelType glt ON gld.GradeLevelTypeId = glt.GradeLevelTypeId
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