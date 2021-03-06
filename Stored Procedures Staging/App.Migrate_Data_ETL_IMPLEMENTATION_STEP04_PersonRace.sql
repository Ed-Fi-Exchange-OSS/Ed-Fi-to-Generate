﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace]
END
GO
---Inform the process for when/if ID's change - how will that be addressed, perhaps not now, but in the future.
-------will the use of PersonMaster come into play?
-------Note: id's can change so long as the end result - report outcome would be the same?


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace]
	@SchoolYear SMALLINT = NULL
AS

    /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to populate the Student Race data from source into staging.

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  [Document the Source table(s) here for easy reference]

    Data Targets:  Generate Database:   Generate.ODS.PersonDemographicRace

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace] 2018;
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/

    BEGIN

        SET NOCOUNT ON;
		
		IF @SchoolYear IS NULL 
		BEGIN
			SELECT @SchoolYear = d.Year + 1
			FROM rds.DimDateDataMigrationTypes dd 
			JOIN rds.DimDates d 
				ON dd.DimDateId = d.DimDateId 
			JOIN rds.DimDataMigrationTypes b 
				ON b.DimDataMigrationTypesId = dd.DataMigrationTypeId 
			WHERE dd.IsSelected = 1 
				AND DataMigrationTypeCode = 'ODS'
		END 

		--create the error handling variables
		DECLARE @eStoredProc	varchar(100) = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace'

		-- Clean out the staging data from the last run
		TRUNCATE TABLE Staging.PersonRace

-------------------------------------Begin State Specific Information Section----------------------------------------
---------------------------------------------------------------------------------------------------------------------
----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
----created to work with the data standardized in this location. Do not make any changes to table names or column----
----names or to any of the code after this section.  The only information that should be modified is the source  ----
----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		-------------------------------------------------------------------
        --Pull Student Race -----------------------------------------------                         
        -------------------------------------------------------------------
		BEGIN TRY
 
			INSERT INTO Staging.PersonRace
				( Student_Identifier_State
				, RaceType
				, RecordStartDateTime
				, RecordEndDateTime
				, PersonDemographicRaceId
				, RunDateTime
				)
			SELECT
				s.StudentUniqueId			Student_Identifier_State
				,r.CodeValue				RaceType
				,App.GetFiscalYearStartDate(@SchoolYear)					RecordStartDateTime
				,App.GetFiscalYearEndDate(@SchoolYear)					RecordEndDateTime
				,NULL					PersonDemographicRaceId
				,NULL					RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociationRace] sr
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Student] s ON s.StudentUSI = sr.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor r  ON r.DescriptorId = sr.RaceDescriptorId 

--			PRINT 'Insert successful for Staging.Person Student records'

		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.PersonRace', NULL, 'S12SC100' 
		END CATCH

---------------------------------------------------------------------------------------------------------------------
-------------------------------------End State Specific Information Section------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		BEGIN TRY
	
			UPDATE Staging.PersonRace SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PersonRace) > 0

--			PRINT 'Update successful for RunDateTime on Staging.PersonRace records'

		END TRY

		BEGIN CATCH
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.PersonRace', NULL, 'S12SC150' 
		END CATCH

		-------------------------------------------------------------------------------------------------------------------------
		-------- Begin Validation of Staging Tables included in this ETL --------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------
		BEGIN TRY

			----Validate Staging.Person----
			EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace', 'PersonRace', @SchoolYear

--			PRINT 'Execution of validation procedures successful for PersonRace Staging tables'

		END TRY

		BEGIN CATCH
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.ValidationErrors', NULL, 'S12SC160' 
		END CATCH

    END;


