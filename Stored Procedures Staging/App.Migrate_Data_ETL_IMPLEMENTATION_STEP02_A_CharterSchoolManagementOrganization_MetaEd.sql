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


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_A_CharterSchoolManagementOrganization_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_A_CharterSchoolManagementOrganization_MetaEd]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_A_CharterSchoolManagementOrganization_MetaEd]
	@SchoolYear SMALLINT = NULL
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load Charter School Management Organization about students for EDFacts reports that apply to the full year.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP02_A_CharterSchoolManagementOrganization_MetaEd];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;
			
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
			----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
			---------------------------------------------------------------------------------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

			UPDATE s
				SET [CharterSchoolManagementOrganization_Type] = edorgidsdnet.CodeValue
					, [CharterSchoolId] = sch.CedsSchoolId
			FROM  [Staging].[CharterSchoolManagementOrganization] s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].EducationOrganizationNetworkExtension edorgnetExt 
				ON edorgnetExt.EducationOrganizationNetworkId = s.[OrganizationIdentifier]
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor edorgidsdnet 
				ON edorgnetExt.CharterSchoolManagementOrganizationTypeDescriptorId = edorgidsdnet.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool sch ON sch.[EducationOrgabizationNetworkId] = s.[OrganizationIdentifier]

			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Migrant SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Migrant) > 0

		----Validate Staging.Migrant----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_A_CharterSchoolManagementOrganization_MetaEd', 'Migrant', @SchoolYear

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END