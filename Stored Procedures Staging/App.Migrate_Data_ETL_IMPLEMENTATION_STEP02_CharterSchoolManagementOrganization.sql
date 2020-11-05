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


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_CharterSchoolManagementOrganization') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_CharterSchoolManagementOrganization]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_CharterSchoolManagementOrganization]
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
		TRUNCATE TABLE Staging.CharterSchoolManagementOrganization

		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------Begin State Specific Information Section----------------------------------------
		---------------------------------------------------------------------------------------------------------------------
		----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
		----created to work with the data standardized in this location. Do not make any changes to table names or column----
		----names or to any of the code after this section.  The only information that should be modified is the source  ----
		----of this information.  Codeset mapping is configured in ODS.EdFiReferenceData. -----------------------------------
		---------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------------------------------------------------------------------


		/* Build Up Staging tables with all charter school management organization data
		-------------------------------------------
		In this section, the staging tables will be loaded with state specific
		data. Any adjustment or customizations to this data specific to the state
		will be run immediately following the population of these tables.  All other
		processes following those customizations will be standard across generate
		states and do not require any further adjustment unless something in generate
		or CEDS is modified.
		*/

		--Insert ManagementOrganization Information--
		INSERT Staging.CharterSchoolManagementOrganization
		   (
		   [CharterSchoolManagementOrganization_Identifier_EIN]
           ,[CharterSchoolManagementOrganization_Name]
           ,[CharterSchoolManagementOrganization_Type]
		   ,OrganizationIdentifier
           ,[CharterSchoolManagementOrganizationId]
           ,[CharterSchoolId]
           ,[RunDateTime])
		SELECT DISTINCT
			 edorgcodecs.IdentificationCode CharterSchoolManagementOrganization_Identifier_EIN
			,magorg.NameOfInstitution CharterSchoolManagementOrganization_Name
			,NULL CharterSchoolManagementOrganization_Type
			,sch.EducationOrganizationId OrganizationIdentifier
			,NULL CharterSchoolManagementOrganizationId			-- edorgcs.EducationOrganizationId
			,NULL [CharterSchoolId]
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationNetworkAssociation associa
			ON associa.MemberEducationOrganizationId = sch.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationNetwork edorgnet 
			ON edorgnet.EducationOrganizationNetworkId=associa.EducationOrganizationNetworkId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization magorg ON magorg.EducationOrganizationId = edorgnet.EducationOrganizationNetworkId

		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcodecs 
			ON edorgcodecs.EducationOrganizationId= magorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor edorgidsdcs 
			ON edorgcodecs.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdcs.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor purpose 
			ON edorgnet.NetworkPurposeDescriptorId = purpose.DescriptorId
		WHERE edorgidsdcs.CodeValue = 'SEA'	
			AND purpose.CodeValue = 'CharterSchoolManagement'
		--SELECT DISTINCT
		--	 edorgcodecs.IdentificationCode CharterSchoolManagementOrganization_Identifier_EIN
		--	,edorgcs.NameOfInstitution CharterSchoolManagementOrganization_Name
		--	,NULL CharterSchoolManagementOrganization_Type
		--	,edorgcs.EducationOrganizationId OrganizationIdentifier
		--	,NULL CharterSchoolManagementOrganizationId			-- edorgcs.EducationOrganizationId
		--	,NULL [CharterSchoolId]
		--	,NULL RunDateTime
		--FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgcs
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationNetwork edorgnet 
		--	ON edorgnet.EducationOrganizationNetworkId=edorgcs.EducationOrganizationId
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcodecs 
		--	ON edorgcodecs.EducationOrganizationId=edorgcs.EducationOrganizationId
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor edorgidsdcs 
		--	ON edorgcodecs.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdcs.DescriptorId
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor purpose 
		--	ON edorgnet.NetworkPurposeDescriptorId = purpose.DescriptorId
		--WHERE edorgidsdcs.CodeValue = 'SEA'	
		--	AND purpose.CodeValue = 'CharterSchoolManagement'

		--Note if it requires multiple inserts/updates to populate this table, do that in this location.

		--The purpose of the _ChangedIdentifier and _Identifier_Old is for when a state modifies the LEA or School identifier from one year to the next
		--but the entity will remain the same.  Example - the school's state identifer last year was AB123, but the state has decided to change their
		--identification system to numbers only.  So instead of AB123, this same schools state identifer is now just 99123. The bit value will indicate 
		--true (1) that an identifier has changed from last year to this year and the _Identifier_Old will indicate what the identifier was previously
		--Generate will treat this as an identifier change, but will leave the entity as a single organization.  Without this, Generate would treat this
		--as an entirly new organization.  Note: there is a process just below the state specific information section that uses the NCES ID to discover
		--these changes as well in case the source system is unable to supply the old identifier.

		--CharterSchoolManagementOrganization Address--
		INSERT INTO Staging.OrganizationAddress
		SELECT DISTINCT
			 edorgcs.EducationOrganizationId OrganizationIdentifier
			,'CharterSchoolManagementOrganization' AS OrganizationType
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
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgcs
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationNetwork edorgnet 
			ON edorgnet.EducationOrganizationNetworkId=edorgcs.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcodecs 
			ON edorgcodecs.EducationOrganizationId=edorgcs.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor edorgidsdcs 
			ON edorgcodecs.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdcs.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationAddress edorgaddress 
			ON edorgcs.EducationOrganizationId = edorgaddress.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aty 
			ON aty.DescriptorId = edorgaddress.AddressTypeDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] sat 
			ON sat.DescriptorId = edorgaddress.StateAbbreviationDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor purpose 
			ON edorgnet.NetworkPurposeDescriptorId = purpose.DescriptorId
		JOIN ODS.RefState sd ON sat.CodeValue = sd.Code
		WHERE edorgidsdcs.CodeValue = 'IRS - EIN'	
			AND purpose.CodeValue = 'CharterSchoolManagement'
			AND edorgaddress.StreetNumberName IS NOT NULL
			AND edorgaddress.StreetNumberName <> ''
			AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')

		--Ensure the OrganizationIdentifier is the same as the Staging.CharterSchoolManagementOrganization table
		--This is current address information - if it is different from previous years address information, the ETL code below will end date the
		--address for this address type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they will be end
		--dated on June 30, xxxx and the new record will begin July 1, xxxx.

		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.CharterSchoolManagementOrganization SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.CharterSchoolManagementOrganization) > 0
		UPDATE Staging.OrganizationAddress SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationAddress) > 0

		-------------------------------------------------------------------------------------------------------------------------
		-------- Begin Validation of Staging Table(s) included in this ETL --------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------

		--Validate Staging.Organization
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_CharterSchoolManagementOrganization', 'CharterSchoolManagementOrganization', @SchoolYear

		--Validate Staging.OrganizationAddress
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_CharterSchoolManagementOrganization', 'OrganizationAddress', @SchoolYear

		/*
			exec [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_CharterSchoolManagementOrganization] 2018
		*/
	END