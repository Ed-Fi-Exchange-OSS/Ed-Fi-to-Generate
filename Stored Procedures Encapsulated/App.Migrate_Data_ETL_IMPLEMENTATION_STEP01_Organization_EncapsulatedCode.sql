﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode]    Script Date: 5/21/2018 2:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode]
	@SchoolYear SMALLINT = NULL
AS


--    /*************************************************************************************************************
--    Date Created:  5/21/2018
--		[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] 2018
--    Purpose:
--        The purpose of this ETL is to manage the State Education Agency (SEA), Local Education Agency (LEA),
--        and School organization information in the Generate ODS.  This ETL is run each time the
--        the ODS is populated and retrieves data from the states source system that houses information
--        related to the school's and LEA's operational status (e.g., Open, Closed, etc.). It will update
--		based on information found in the source data related to SEAs, LEAs and Schools.

--    Assumptions:
--        This procedure assumes that the source tables are ready for consumption. 

--    Account executed under: LOGIN

--    Approximate run time:  ~ 10 seconds

--    Data Sources:  Ed-Fi ODS

--    Data Targets:  Generate Database

--    Return Values:
--    	 0	= Success
  
--    Example Usage: 
--      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] 2018;
--	  Note that this script is called by Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization and is meant to hide
--	  all non-changing, backend code from the person managing Generate.  
    
--    Modification Log:
--      #	  Date		  Issue#   Description
--      --  ----------  -------  --------------------------------------------------------------------
--      01  05/21/2018           First Release		  	 
--    *************************************************************************************************************/


BEGIN

	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	----All code below this point should not be adjusted. It is created to use the staging tables to load the------------
	----the CEDS Operational Data Store.---------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	--begin transaction


	SET NOCOUNT ON;
	
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

        ---------------------------------------------------
        --- Declare Error Handling Variables           ----
        ---------------------------------------------------
		DECLARE @eStoredProc			varchar(100) = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode'

	--------------------------------------------------------------
	--- Optimize indexes on Staging tables --- 
	--------------------------------------------------------------
	ALTER INDEX ALL ON Staging.Organization
	REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);

	ALTER INDEX ALL ON Staging.OrganizationAddress
	REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);

	ALTER INDEX ALL ON Staging.OrganizationGradeOffered
	REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);

	ALTER INDEX ALL ON Staging.OrganizationPhone
	REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);


	/* Define all local variables */
	-------------------------------
	DECLARE @LEA_OrganizationId INT
		   ,@SCHOOL_OrganizationId INT
		   ,@LocationId INT
		   ,@SpecialEducationProgram_OrganizationId INT
		   ,@LEA_Identifier_State VARCHAR(100)
		   ,@LEA_Identifier_NCES VARCHAR(100)
		   ,@RecordStartDate DATETIME
		   ,@RecordEndDate DATETIME
		   ,@UpdateDateTime DATETIME
		   ,@ID INT
		   ,@FirstDayOfSchool DATETIME
		   ,@OldRecordStartDate DATETIME		   
		   ,@OldRecordEndDate DATETIME

	SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear);

	SET @OldRecordStartDate = App.GetFiscalYearStartDate(@SchoolYear -1);
		
	SET @RecordEndDate = App.GetFiscalYearEndDate(@SchoolYear);

	SET @OldRecordEndDate = App.GetFiscalYearEndDate(@SchoolYear -1);

	SET @UpdateDateTime = GETDATE()



	---Begin Housekeeping items on the temp table---

	--This section ensures that if state identifers change for the LEA or School and the source data does not contain the old identifier, the change is still
	--picked up by using the NCES ID as the crosswalk between the old and the new.

	--This update statement looks for a new state LEA Identifier using the NCES Id as the crosswalk between the temporary table Identifier and the Identifier
	--already stored in the ODS.OrganizationIdentifier table.  If they are different and the LEA_Identifier_State_Identifier_Old column in the staging table
	--is NULL, it will mark it with the Identifier stored in the ODS and will later end date that identifier and replace it with the new one.
	BEGIN TRY
		UPDATE Staging.Organization
		SET LEA_Identifier_State_Identifier_Old = orgid2.Identifier
		FROM ODS.OrganizationIdentifier orgid1
		JOIN ODS.OrganizationIdentifier orgid2 ON orgid1.OrganizationId = orgid2.OrganizationId
		JOIN Staging.Organization tod ON orgid1.Identifier = tod.LEA_Identifier_NCES
		WHERE orgid1.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('NCES', '001072') -- Local Education Agency Identification System'
		AND orgid2.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
		AND orgid1.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid2.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid2.Identifier <> tod.LEA_Identifier_State
		AND tod.LEA_Identifier_State_Identifier_Old IS NOT NULL
	END TRY

	BEGIN CATCH 
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEA_Identifier_State_Identifier_Old', 'S01EC0100'
	END CATCH

	--This update statement looks for a new state School Identifier using the NCES Id as the crosswalk between the temporary table Identifier and the Identifier
	--already stored in the ODS.OrganizationIdentifier table.  If they are different and the School_Identifier_State_Identifier_Old column in the temp table
	--is NULL, it will mark it with the Identifier stored in the ODS and will later enddate that identifier and replace it with the new one.
	BEGIN TRY
		UPDATE Staging.Organization
		SET School_Identifier_State_Identifier_Old = orgid2.Identifier
		FROM ODS.OrganizationIdentifier orgid1
		JOIN ODS.OrganizationIdentifier orgid2 ON orgid1.OrganizationId = orgid2.OrganizationId
		JOIN Staging.Organization tod ON orgid1.Identifier = tod.School_Identifier_NCES
		WHERE orgid1.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('NCES', '001073')
		AND orgid2.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
		AND orgid1.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
		AND orgid2.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
		AND orgid2.Identifier <> tod.School_Identifier_State
		AND tod.School_Identifier_State_Identifier_Old IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'School_Identifier_State_Identifier_Old', 'S01EC0110'
	END CATCH

	--Update the Bit value to indicate that an identifier has changed.

	BEGIN TRY
		UPDATE Staging.Organization SET LEA_Identifier_State_ChangedIdentifier = 1 WHERE LEA_Identifier_State_Identifier_Old IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEA_Identifier_State_ChangedIdentifier', 'S01EC0120'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization SET School_Identifier_State_ChangedIdentifier = 1 WHERE School_Identifier_State_Identifier_Old IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'School_Identifier_State_ChangedIdentifier', 'S01EC0130'
	END CATCH


	/* Load the Department of Education SEA Specific Information
	--------------------------------------------------------------
	This infomration is specific to the SEA only and normally does not
	change. It is set up to load once and then with an IF/THEN statement
	is ignored from thereon so long as the data exist in the ODS
	
	*/

	-------------------------------------------------------------------
	----Create SEA Organization Data ----------------------------------
	-------------------------------------------------------------------
	BEGIN TRY
		IF (SELECT COUNT(*) FROM ODS.OrganizationDetail od join Staging.StateDetail sd on od.Name = sd.SeaName) < 1 BEGIN

			INSERT INTO [ODS].[Organization] DEFAULT VALUES
			UPDATE Staging.StateDetail SET OrganizationId = SCOPE_IDENTITY();

			INSERT INTO [ODS].[OrganizationDetail]
						([OrganizationId]
						,[Name]
						,[RefOrganizationTypeId]
						,[ShortName]
						,[RecordStartDateTime]
						,[RecordEndDateTime])
			SELECT TOP 1
						OrganizationId [OrganizationId]
						,SeaName [Name]
						,App.GetOrganizationTypeId('SEA', '001156') [RefOrganizationTypeId] --CEDS code that represents "State Education Agency (SEA)"--
						,SeaShortName [ShortName]
						,'1900-01-01' [RecordStartDateTime]
						,NULL [RecordEndDateTime]
			FROM Staging.StateDetail

			--Insert StateANSICode into ODS.OrganizationIdentifier-
			INSERT INTO [ODS].[OrganizationIdentifier]
						([Identifier]
						,[RefOrganizationIdentificationSystemId]
						,[OrganizationId]
						,[RefOrganizationIdentifierTypeId])
			SELECT DISTINCT
						rsa.Code [Identifier] --StateANSICode from RefStateANSICode table--
						,[App].[GetOrganizationIdentifierSystemId]('Federal', '001491') [RefOrganizationIdentificationSystemId] --Federal identification from the RefOrganizationIdentificationSystem table--
						,sd.OrganizationId [OrganizationId]
						,[App].[GetOrganizationIdentifierTypeId]('001491') [RefOrganizationIdentifierTypeId] --State Agency Identification System from the RefOrganizationIdentifierType table --
			FROM Staging.StateDetail sd
			JOIN [ODS].[RefState] rs ON rs.Code = sd.StateCode
			JOIN ODS.RefStateANSICode rsa ON rsa.StateName = rs.[Description]

		-- The SEA Organization already exists,
		-- so grab the org ID.
		END ELSE BEGIN 

		UPDATE Staging.StateDetail 
		SET OrganizationId = od.OrganizationId
		FROM ODS.OrganizationDetail od 
		JOIN Staging.StateDetail sd 
			ON od.[Name] = sd.SeaName
		END
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, NULL, NULL, 'S01EC0140'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization 
		SET SEAOrganizationId = sd.OrganizationId 
		FROM Staging.StateDetail sd
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SEAOrganizationId', 'S01EC0150'
	END CATCH

	-------------------------------------------------------------------
	----Create LEA and School Organization Data -----------------------
	-------------------------------------------------------------------

	/* Insert LEA/K12 School/Special Education Program into ODS.Organization
	------------------------------------------------------------------------
	In this section, the LEA, School and Speical Education Programs are created
	as Organizations in the ODS.  And the relationships betweeen the Organizations
	are also created.
	
	*/


	--MERGE LEA data into ODS.Organization


	--First check to see if the LEA already exists so that it is not created a second time.
	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
		AND tod.LEA_Identifier_State_ChangedIdentifier = 0
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAOrganizationId', 'S01EC0160'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.LEA_Identifier_State_Identifier_Old = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
		AND tod.LEA_Identifier_State_ChangedIdentifier = 1
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAOrganizationId', 'S01EC0170'
	END CATCH

	--Insert new LEAs--
	--Get a distinct list of LEA IDs that need to be inserted 
	--so that we can use a MERGE properly.		
	DECLARE @DistinctNewLeas TABLE (
		  LEA_Identifier_State VARCHAR(100)
		, LEA_Identifier_NCES VARCHAR(100)
		, LEA_Name VARCHAR(100)
		, OrganizationId INT NULL
	)

	BEGIN TRY
		INSERT INTO @DistinctNewLeas
		SELECT DISTINCT 
			  LEA_Identifier_State
			, LEA_Identifier_NCES
			, LEA_Name
			, NULL
		FROM Staging.Organization
		WHERE LeaOrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@DistinctNewLeas', NULL, 'S01EC0180'
	END CATCH

	--This table captures the Staging.LEA_Identifier_State 
	--and the new OrganizationId from ODS.Organization 
	--so that we can create the child records.
	DECLARE @NewLeaOrganization TABLE (
		  OrganizationId INT
		, LEA_Identifier_State VARCHAR(100)
	)

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON 1 = 0 -- always insert 
		WHEN NOT MATCHED THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.LEA_Identifier_State
		INTO @NewLeaOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0190'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LeaOrganizationId = norg.OrganizationId
			, NewLea = 1
		FROM Staging.Organization o
		JOIN @NewLeaOrganization norg
			ON o.LEA_Identifier_State = norg.LEA_Identifier_State
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LeaOrganizationId', 'S01EC0200'
	END CATCH

	BEGIN TRY
		UPDATE @DistinctNewLeas
		SET OrganizationId = o.LeaOrganizationId
		FROM Staging.Organization o
		JOIN @DistinctNewLeas norg
			ON o.Lea_Identifier_State = norg.Lea_Identifier_State
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@DistinctNewLeas', 'OrganizationId', 'S01EC0210'
	END CATCH

	BEGIN TRY
		--Update LEA names by end dating the 
		--current OrganizationDetail record and creating a new one
		UPDATE ods.OrganizationDetail
		SET RecordEndDateTime = @UpdateDateTime
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.LeaOrganizationId = od.OrganizationId
			AND o.Lea_Name <> od.[Name]
			AND od.RecordEndDateTime IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ods.OrganizationDetail', 'RecordEndDateTime', 'S01EC0220'
	END CATCH

	BEGIN TRY
		INSERT INTO ods.OrganizationDetail
		SELECT 
			  o.LeaOrganizationId
			, LEFT(o.LEA_Name, 60)
			, App.GetOrganizationTypeId('LEA', '001156')
			, NULL
			, @UpdateDateTime
			, NULL
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.LeaOrganizationId = od.OrganizationId
			AND o.Lea_Name <> od.[Name]
			AND od.RecordEndDateTime = @UpdateDateTime
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ods.OrganizationDetail', NULL, 'S01EC0230'
	END CATCH

	BEGIN TRY

		MERGE ODS.OrganizationDetail AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table

		WHEN NOT MATCHED BY TARGET THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  SOURCE.OrganizationId
				, LEFT(SOURCE.LEA_Name, 60)
				, App.GetOrganizationTypeId('LEA', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0240'
	END CATCH

	-- Title I for LEA


		INSERT INTO [ODS].[OrganizationIdentifier]
					   ([Identifier]
					   ,[RefOrganizationIdentificationSystemId]
					   ,[OrganizationId]
					   ,[RefOrganizationIdentifierTypeId]
					   ,[RecordStartDateTime]
					   ,[RecordEndDateTime])
		SELECT DISTINCT
					tod.LEA_Identifier_State_Identifier_Old [Identifier]
					,[App].[GetOrganizationIdentifierSystemId]('SEA', '001072') AS [RefOrganizationIdentificationSystemId]
					,orgd.OrganizationId [OrganizationId]
					,[App].[GetOrganizationIdentifierTypeId]('001072') as [RefOrganizationIdentifierTypeId]
					,@OldRecordStartDate
					,@OldRecordEndDate
		FROM ODS.OrganizationDetail orgd
		JOIN Staging.Organization tod ON orgd.OrganizationId = tod.LEAOrganizationId
		WHERE tod.LEA_Identifier_State_ChangedIdentifier = 1
		AND LEA_Identifier_State_Identifier_Old IS NOT NULL


		INSERT INTO [ODS].[OrganizationIdentifier]
					([Identifier]
					,[RefOrganizationIdentificationSystemId]
					,[OrganizationId]
					,[RefOrganizationIdentifierTypeId]
					,[RecordStartDateTime]
					,[RecordEndDateTime])
		SELECT DISTINCT
					tod.School_Identifier_State_Identifier_Old [Identifier]
					,[App].[GetOrganizationIdentifierSystemId]('SEA', '001073') AS [RefOrganizationIdentificationSystemId]
					,orgd.OrganizationId [OrganizationId]
					,[App].[GetOrganizationIdentifierTypeId]('001073') as [RefOrganizationIdentifierTypeId]
					,@OldRecordStartDate
					,@OldRecordEndDate
		FROM ODS.OrganizationDetail orgd
		JOIN Staging.Organization tod ON orgd.OrganizationId = tod.LEAOrganizationId
		WHERE tod.School_Identifier_State_ChangedIdentifier = 1
		AND School_Identifier_State_Identifier_Old IS NOT NULL


	--Insert K12 Schools into ODS.Organization--
	DECLARE @NewOrganization TABLE (
		  OrganizationId INT
		, SourceId INT
	)

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.SchoolOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0250'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET SchoolOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolOrganizationId', 'S01EC0260'
	END CATCH

	BEGIN TRY
		--Update School names by end dating the 
		--current OrganizationDetail record and creating a new one
		UPDATE ods.OrganizationDetail
		SET RecordEndDateTime = @UpdateDateTime
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.SchoolOrganizationId = od.OrganizationId
			AND o.School_Name <> od.[Name]
			AND od.RecordEndDateTime IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ods.OrganizationDetail', 'RecordEndDateTime', 'S01EC0270'
	END CATCH

	BEGIN TRY
		INSERT INTO ods.OrganizationDetail
		SELECT 
			  o.SchoolOrganizationId
			, LEFT(o.School_Name, 60)
			, App.GetOrganizationTypeId('K12School', '001156')
			, NULL
			, @UpdateDateTime
			, NULL
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.LeaOrganizationId = od.OrganizationId
			AND o.Lea_Name <> od.[Name]
			AND od.RecordEndDateTime = @UpdateDateTime
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ods.OrganizationDetail', NULL, 'S01EC0280'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.SchoolOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  SOURCE.SchoolOrganizationId
				, LEFT(SOURCE.School_Name, 60)
				, App.GetOrganizationTypeId('K12School', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0290'
	END CATCH

	BEGIN TRY
	-- Delete school records that were inserted because of LEA only rows
		DELETE FROM ods.OrganizationDetail
		WHERE OrganizationId IN (
			SELECT SchoolOrganizationId 
			FROM Staging.Organization
			WHERE School_Name IS NULL
			)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ods.OrganizationDetail', NULL, 'S01EC0300'
	END CATCH

	BEGIN TRY
		DELETE FROM ods.Organization 
			WHERE OrganizationId IN (
				SELECT SchoolOrganizationId 
				FROM Staging.Organization
				WHERE School_Name IS NULL
				)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ods.Organization', NULL, 'S01EC0310'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization
		WHERE OrganizationId IN (
			SELECT SchoolOrganizationId 
			FROM Staging.Organization
			WHERE School_Name IS NULL
			)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0320'
	END CATCH

	BEGIN TRY
		--Schools that have not changed State Identifiers
		UPDATE Staging.Organization
		SET SchoolOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND tod.School_Identifier_State_ChangedIdentifier = 0
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolOrganizationId', 'S01EC0330'
	END CATCH

	BEGIN TRY
		--Schools that have changed State Identifiers
		UPDATE Staging.Organization
		SET SchoolOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State_Identifier_Old = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND tod.School_Identifier_State_ChangedIdentifier = 1
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolOrganizationId', 'S01EC0340'
	END CATCH

	--Update Schools that have changed State Identifiers

/* Cannot uncomment this until the RecordStartDateTime and RecordEndDateTime have been added to the ODS
	IF (SELECT COUNT(*) FROM Staging.Organization WHERE School_Identifier_State_ChangedIdentifier = 1) > 0
		BEGIN

		--Only need to end date Identifiers here. The new identifier is added further below.

			UPDATE ODS.OrganizationIdentifier
			SET RecordEndDateTime = DATEADD(yy, -1, @RecordEndDate)
			FROM ODS.Identifier id
			JOIN Staging.Organization tod ON id.Identifier = tod.School_Identifier_State_Identifier_Old
			WHERE id.RefOrganizationIdentificationSystemId = @[App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND id.RefOrganizationIdentifierTypeId = @[App].[GetOrganizationIdentifierTypeId]('001073')
			AND tod.School_Identifier_State_ChangedIdentifier = 1

			INSERT INTO [ODS].[OrganizationIdentifier]
					   ([Identifier]
					   ,[RefOrganizationIdentificationSystemId]
					   ,[OrganizationId]
					   ,[RefOrganizationIdentifierTypeId])
					   ---Need the RecordStartDateTime added
			SELECT DISTINCT
						tod.School_Identifier_State [Identifier]
					   ,@[App].[GetOrganizationIdentifierSystemId]('SEA', '001073') AS [RefOrganizationIdentificationSystemId]
					   ,orgd.OrganizationId [OrganizationId]
					   ,@[App].[GetOrganizationIdentifierTypeId]('001073') AS [RefOrganizationIdentifierTypeId]
			FROM ODS.OrganizationDetail orgd
			JOIN Staging.Organization tod ON orgd.OrganizationId = tod.SchoolOrganizationId
			WHERE tod.School_Identifier_State_ChangedIdentifier = 1


		END
*/
	----			[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] 2018
	---- LEA Title I 
	---- K12LeaTitleISupportService
	--return
	--DECLARE @SchoolYear INT = 2018
	--DECLARE @RecordStartDate DATETIME
	--DECLARE @RecordEndDate DATETIME
	--SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear);
	--SET @RecordEndDate = App.GetFiscalYearEndDate(@SchoolYear);
	---- 1
	--UPDATE Staging.Organization
	--	SET LEA_K12LeaTitleISupportServiceId = k12lea.K12LeaTitleISupportServiceId
	--FROM ODS.K12LeaTitleISupportService k12lea
	--JOIN Staging.Organization org ON org.LEAOrganizationId = k12lea.OrganizationId

	---- 2
	--INSERT ODS.K12LeaTitleISupportService (
	--	OrganizationId
	--	,RefK12LeaTitleISupportServiceId
	--	,RecordStartDateTime
	--	,RecordEndDateTime
	--)
	--SELECT DISTINCT
	--	org.LEAOrganizationId
	--	,ot.RefK12LEATitleISupportServiceId
	--	,@RecordStartDate
	--	,@RecordEndDate
	--FROM Staging.Organization org
	--LEFT JOIN ODS.K12LeaTitleISupportService k12lea ON k12lea.OrganizationId = org.LEAOrganizationId
	--LEFT JOIN ODS.SourceSystemReferenceData osss
	--		ON org.LEA_K12LeaTitleISupportService = osss.InputCode
	--		AND osss.TableName = 'RefK12LeaTitleISupportService'
	--		AND osss.SchoolYear = @SchoolYear
	--LEFT JOIN ODS.RefK12LeaTitleISupportService ot 
	--		ON osss.OutputCode = ot.Code

	---- K12ProgramOrService
	---- 1
	--UPDATE Staging.Organization
	--	SET LEA_K12programOrServiceId = k12ps.K12ProgramOrServiceId
	--FROM ODS.K12ProgramOrService k12ps
	--JOIN Staging.Organization org ON org.LEAOrganizationId = k12ps.OrganizationId

	---- 2
	--INSERT ODS.K12ProgramOrService (
	--	OrganizationId
	--	,RefTitleIInstructionalServicesId
	--	,RefTitleIProgramTypeId
	--	,RecordStartDateTime
	--	,RecordEndDateTime
	--)
	--SELECT 
	--	org.LEAOrganizationId
	--	,ot1.RefTitleIInstructionalServicesId
	--	,ot2.RefTitleIProgramTypeId
	--	,@RecordStartDate
	--	,@RecordEndDate
	--FROM Staging.Organization org
	--LEFT JOIN ODS.K12LeaTitleISupportService k12lea ON k12lea.OrganizationId = org.LEAOrganizationId
	--LEFT JOIN ODS.SourceSystemReferenceData ss1
	--		ON org.LEA_TitleIinstructionalService = ss1.InputCode
	--		AND ss1.TableName = 'RefTitleIInstructionalServices'
	--		AND ss1.SchoolYear = @SchoolYear
	--LEFT JOIN ODS.RefTitleIInstructionalServices ot1 
	--		ON ss1.OutputCode = ot1.Code

	--LEFT JOIN ODS.SourceSystemReferenceData ss2
	--		ON org.LEA_TitleIProgramType = ss2.InputCode
	--		AND ss2.TableName = 'RefTitleIProgramType'
	--		AND ss2.SchoolYear = @SchoolYear
	--LEFT JOIN ODS.RefTitleIProgramType ot2
	--		ON ss2.OutputCode = ot1.Code

	----------------------------------------------------------------------------------------
	--Create a Special Education Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------

	--LEA
	--First check to see if Special Education Program already exists so that it is not created a second time--
	BEGIN TRY
		UPDATE Staging.Organization
		SET LEA_SpecialEducationProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'Special Education Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SpecialEducationProgramOrganizationId', 'S01EC0350'
	END CATCH

	--Insert new Special Education Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0360'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON 1 = 0
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.OrganizationId
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0370'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET LEA_SpecialEducationProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LEAOrganizationId = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SpecialEducationProgramOrganizationId', 'S01EC0380'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'Special Education Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0390'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LEA_SpecialEducationProgramOrganizationId = norg.OrganizationId
			, NewSpecialEducationProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LEAOrganizationId = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SpecialEducationProgramOrganizationId', 'S01EC0400'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_SpecialEducationProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0410'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_SpecialEducationProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0420'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_SpecialEducationProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0430'
	END CATCH

	BEGIN TRY
		--School
		--First check to see if Special Education Program already exists so that it is not created a second time--
		UPDATE Staging.Organization
		SET School_SpecialEducationProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Special Education Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SpecialEducationProgramOrganizationId', 'S01EC0440'
	END CATCH

	--Insert new Special Education Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0450'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_SpecialEducationProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0460'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_SpecialEducationProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SpecialEducationProgramOrganizationId', 'S01EC0470'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_SpecialEducationProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_SpecialEducationProgramOrganizationId
				, 'Special Education Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0480'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_SpecialEducationProgramOrganizationId = norg.OrganizationId
			, NewSpecialEducationProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SpecialEducationProgramOrganizationId', 'S01EC0490'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_SpecialEducationProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0500'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_SpecialEducationProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0510'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_SpecialEducationProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0520'
	END CATCH

	
-------------------------------------------
--- The Title Program
-------------------------


	--- End of the Title III

			----------------------------------------------------------------------------------------
	--Create a N or D Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------

	--LEA
	--First check to see if Special Education Program already exists so that it is not created a second time--
	BEGIN TRY
		UPDATE Staging.Organization
		SET LEA_NorDProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'N or D Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEA_NorProgramOrganizationId', 'S01EC3010'
	END CATCH

	--Insert new N or D Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC3020'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON 1 = 0
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.OrganizationId
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC3030'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET LEA_NorDProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LEAOrganizationId = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEA_NorDProgramOrganizationId', 'S01EC3040'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'N or D Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC3050'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LEA_NorDProgramOrganizationId = norg.OrganizationId
			, NewNorDProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LEAOrganizationId = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEA_NorDProgramOrganizationId', 'S01EC3060'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_NorDProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC3070'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_NorDProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC3080'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_NorDProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC3090'
	END CATCH

	BEGIN TRY
		--School
		--First check to see if Special Education Program already exists so that it is not created a second time--
		UPDATE Staging.Organization
		SET School_NorDProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'N or D Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'School_NorProgramOrganizationId', 'S01EC3100'
	END CATCH

	--Insert new N or D Programs--
	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC3110'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_NorDProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC3120'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_NorDProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'School_NorProgramOrganizationId', 'S01EC3300'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_NorDProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_TitleIIIProgramOrganizationId --
				, 'N or D Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC3140'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_NorDProgramOrganizationId = norg.OrganizationId
			, NewNorDProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'School_NorProgramOrganizationId', 'S01EC3150'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_NorDProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC3160'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_NorDProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC3170'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_NorDProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC3180'
	END CATCH


	--- End of the N or D

	----------------------------------------------------------------------------------------
	--Create a TitleIII Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------
	
	BEGIN TRY
		-- LEA
		UPDATE Staging.Organization
		SET LEA_TitleIIIProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'Title III Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIIIProgramOrganizationId', 'S01EC0530'
	END CATCH


	--Insert new TitleIII Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0540'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.LEA_TitleIIIProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0550'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET LEA_TitleIIIProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LeaOrganizationid = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', NULL, 'S01EC0560'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'Title III Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0570'
	END CATCH

	BEGIN TRY
		INSERT INTO ODS.OrganizationProgramType
			(OrganizationId
			 , RefProgramTypeId
			 , RecordStartDateTime, RecordEndDateTime)
		SELECT norg.OrganizationId, App.GetProgramTypeId('04906'), @RecordStartDate, @RecordEndDate 
		FROM @NewOrganization norg
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC0580'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LEA_TitleIIIProgramOrganizationId = norg.OrganizationId
			, NewTitleIIIProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIIIProgramOrganizationId', 'S01EC0590'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_TitleIIIProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0600'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_TitleIIIProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0610'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_TitleIIIProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0620'
	END CATCH

	BEGIN TRY
		-- School
		UPDATE Staging.Organization
		SET School_TitleIIIProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Title III Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIIIProgramOrganizationId', 'S01EC0630'
	END CATCH

	--Insert new TitleIII Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0640'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_TitleIIIProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0650'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_TitleIIIProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIIIProgramOrganizationId', 'S01EC0660'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_TitleIIIProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_TitleIIIProgramOrganizationId
				, 'Title III Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0670'
	END CATCH

	BEGIN TRY
		INSERT INTO ODS.OrganizationProgramType
			(OrganizationId
			 , RefProgramTypeId
			 , RecordStartDateTime, RecordEndDateTime)
		SELECT norg.OrganizationId, App.GetProgramTypeId('04906'), @RecordStartDate, @RecordEndDate 
		FROM @NewOrganization norg
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC0680'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_TitleIIIProgramOrganizationId = norg.OrganizationId
			, NewTitleIIIProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIIIProgramOrganizationId', 'S01EC0690'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_TitleIIIProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0700'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_TitleIIIProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0710'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_TitleIIIProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0720'
	END CATCH

	-- END TitleIII -------------------------------------------------------

		----------------------------------------------------------------------------------------
	--Create a CTE Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------

	BEGIN TRY
		-- LEA
		UPDATE Staging.Organization
		SET LEA_CTEProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'CTE Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'CTEProgramOrganizationId', 'S01EC0530'
	END CATCH


	--Insert new CTE Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0540'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.LEA_CTEProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0550'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET LEA_CTEProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LeaOrganizationid = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', NULL, 'S01EC0560'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'CTE Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0570'
	END CATCH

	BEGIN TRY
		INSERT INTO ODS.OrganizationProgramType
			(OrganizationId
			 , RefProgramTypeId
			 , RecordStartDateTime, RecordEndDateTime)
		SELECT norg.OrganizationId, App.GetProgramTypeId('04906'), @RecordStartDate, @RecordEndDate 
		FROM @NewOrganization norg
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC0580'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LEA_CTEProgramOrganizationId = norg.OrganizationId
			, NewCTEProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'CTEProgramOrganizationId', 'S01EC0590'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_CTEProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0600'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_CTEProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0610'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_CTEProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0620'
	END CATCH

	BEGIN TRY
		-- School
		UPDATE Staging.Organization
		SET School_CTEProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'CTE Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'CTEProgramOrganizationId', 'S01EC0630'
	END CATCH

	--Insert new CTE Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0640'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_CTEProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0650'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_CTEProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'CTEProgramOrganizationId', 'S01EC0660'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_CTEProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_CTEProgramOrganizationId
				, 'CTE Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0670'
	END CATCH

	BEGIN TRY
		INSERT INTO ODS.OrganizationProgramType
			(OrganizationId
			 , RefProgramTypeId
			 , RecordStartDateTime, RecordEndDateTime)
		SELECT norg.OrganizationId, App.GetProgramTypeId('04906'), @RecordStartDate, @RecordEndDate 
		FROM @NewOrganization norg
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC0680'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_CTEProgramOrganizationId = norg.OrganizationId
			, NewCTEProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'CTEProgramOrganizationId', 'S01EC0690'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_CTEProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0700'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_CTEProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0710'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_CTEProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0720'
	END CATCH

	-- END Title III  -------------------------------------------------------




	
	----------------------------------------------------------------------------------------
	--Create a Homeless Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------

	BEGIN TRY
		-- LEA
		UPDATE Staging.Organization
		SET LEA_HomelessProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'Homeless Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'CTEProgramOrganizationId', 'S01EC1530'
	END CATCH


	--Insert new Homeless Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1550'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.LEA_HomelessProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1550'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET LEA_HomelessProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LeaOrganizationid = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', NULL, 'S01EC1560'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'Homeless Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1570'
	END CATCH

	BEGIN TRY
		INSERT INTO ODS.OrganizationProgramType
			(OrganizationId
			 , RefProgramTypeId
			 , RecordStartDateTime, RecordEndDateTime)
		SELECT norg.OrganizationId, App.GetProgramTypeId('76000'), @RecordStartDate, @RecordEndDate 
		FROM @NewOrganization norg
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1580'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LEA_HomelessProgramOrganizationId = norg.OrganizationId
			, NewHomelessProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'CTEProgramOrganizationId', 'S01EC1590'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1600'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1610'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1620'
	END CATCH

	BEGIN TRY
		-- School
		UPDATE Staging.Organization
		SET LEA_HomelessProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Homeless Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'HomelessProgramOrganizationId', 'S01EC1630'
	END CATCH

	--Insert new Homeless Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1640'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_HomelessProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1650'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_HomelessProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'HomelessProgramOrganizationId', 'S01EC1660'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_HomelessProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_CTEProgramOrganizationId
				, 'Homeless Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1670'
	END CATCH

	BEGIN TRY
		INSERT INTO ODS.OrganizationProgramType
			(OrganizationId
			 , RefProgramTypeId
			 , RecordStartDateTime, RecordEndDateTime)
		SELECT norg.OrganizationId, App.GetProgramTypeId('76000'), @RecordStartDate, @RecordEndDate 
		FROM @NewOrganization norg
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1680'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_HomelessProgramOrganizationId = norg.OrganizationId
			, NewCTEProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'HomelessProgramOrganizationId', 'S01EC1690'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1700'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1710'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1720'
	END CATCH

	-- END Homeless -------------------------------------------------------







	----------------------------------------------------------------------------------------
	--Create a Title I Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------
	-- LEA

	BEGIN TRY
		--First check to see if Title I Program already exists so that it is not created a second time--
		UPDATE Staging.Organization
		SET LEA_TitleIProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'Title I Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIProgramOrganizationId', 'S01EC0730'
	END CATCH

	BEGIN TRY
		--Insert new Title I Programs--
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0740'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.LEA_TitleIProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0750'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET LEA_TitleIProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LeaOrganizationid = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIProgramOrganizationId', 'S01EC0760'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'Title I Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0770'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LEA_TitleIProgramOrganizationId = norg.OrganizationId
			, NewTitleIProgram= 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIProgramOrganizationId', 'S01EC0780'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_TitleIProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0790'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_TitleIProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0800'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_TitleIProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0810'
	END CATCH

	-- School
	BEGIN TRY
		--First check to see if Title I Program already exists so that it is not created a second time--
		UPDATE Staging.Organization
		SET School_TitleIProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Title I Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIProgramOrganizationId', 'S01EC0820'
	END CATCH

	--Insert new Title I Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0830'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_TitleIProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0840'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_TitleIProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIProgramOrganizationId', 'S01EC0850'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_TitleIProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_TitleIProgramOrganizationId
				, 'Title I Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0860'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_TitleIProgramOrganizationId = norg.OrganizationId
			, NewTitleIProgram= 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'TitleIProgramOrganizationId', 'S01EC0870'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_TitleIProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0880'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_TitleIProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0890'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_TitleIProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0900'
	END CATCH

	----------------------------------------------------------------------------------------
	--Create a Migrant Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------
	-- LEA

	BEGIN TRY 
		--First check to see if Migrant Program already exists so that it is not created a second time--
		UPDATE Staging.Organization
		SET LEA_MigrantProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'Migrant Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'MigrantProgramOrganizationId', 'S01EC0910'
	END CATCH

	--Insert new Migrant Programs--

	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0920'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON 1 = 0
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.OrganizationId
		INTO @NewOrganization;
	END TRY
	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0930'
	END CATCH

	BEGIN TRY
	-- Update organization IDs in the staging table
	UPDATE Staging.Organization 
	SET LEA_MigrantProgramOrganizationId = norg.OrganizationId
	FROM Staging.Organization o
	JOIN @NewOrganization norg
		ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'MigrantProgramOrganizationId', 'S01EC0940'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'Migrant Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0950'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET  LEA_MigrantProgramOrganizationId = norg.OrganizationId
			, NewMigrantProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LeaOrganizationid = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'MigrantProgramOrganizationId', 'S01EC0960'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_MigrantProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC0970'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_MigrantProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC0980'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_MigrantProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC0990'
	END CATCH

	-- School

	BEGIN TRY
		--First check to see if Migrant Program already exists so that it is not created a second time--
		UPDATE Staging.Organization
		SET School_MigrantProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.[Name] = 'Migrant Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'MigrantProgramOrganizationId', 'S01EC1000'
	END CATCH

	--Insert new Migrant Programs--
	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1010'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_MigrantProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1020'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_MigrantProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'MigrantProgramOrganizationId', 'S01EC1030'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_MigrantProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_MigrantProgramOrganizationId
				, 'Migrant Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1040'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_MigrantProgramOrganizationId = norg.OrganizationId
			, NewMigrantProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'MigrantProgramOrganizationId', 'S01EC1050'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_MigrantProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1060'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_MigrantProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1070'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_MigrantProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1080'
	END CATCH

	----------------------------------------------------------------------------------------
	--Create a Foster Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------
	-- LEA

	BEGIN TRY
		--First check to see if Foster Program already exists so that it is not created a second time--
		UPDATE Staging.Organization
		SET LEA_FosterProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'Foster Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'FosterProgramOrganizationId', 'S01EC1090'
	END CATCH

	--Insert new Foster Programs--
	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1100'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON 1 = 0
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.OrganizationId
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1110'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET LEA_FosterProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'FosterProgramOrganizationId', 'S01EC1120'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'Foster Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1130'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LEA_FosterProgramOrganizationId = norg.OrganizationId
			, NewFosterProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LeaOrganizationid = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'FosterProgramOrganizationId', 'S01EC1140'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_FosterProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1150'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_FosterProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1160'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_FosterProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1170'
	END CATCH
 
	-- School

	--First check to see if Foster Program already exists so that it is not created a second time--
	BEGIN TRY
		UPDATE Staging.Organization
		SET School_FosterProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Foster Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'FosterProgramOrganizationId', 'S01EC1180'
	END CATCH


	--Insert new Foster Programs--
	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1190'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_FosterProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1200'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_FosterProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'FosterProgramOrganizationId', 'S01EC1210'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_FosterProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_FosterProgramOrganizationId
				, 'Foster Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1220'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_FosterProgramOrganizationId = norg.OrganizationId
			, NewFosterProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'FosterProgramOrganizationId', 'S01EC1230'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_FosterProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1240'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_FosterProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1250'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_FosterProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1260'
	END CATCH

	--===============================================================================================================================

	----------------------------------------------------------------
	--- Section 504 
	----------------------------------------------------------------
		----------------------------------------------------------------------------------------
	--Create a Section 504 Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------
	-- LEA

	BEGIN TRY
		--First check to see if Section 504 Program already exists so that it is not created a second time--
		UPDATE Staging.Organization
		SET LEA_Section504ProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'Section 504 Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'Section504ProgramOrganizationId', 'S01EC1090'
	END CATCH

	--Insert new Section 504 Programs--
	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1100'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON 1 = 0
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.OrganizationId
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1110'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET LEA_Section504ProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'Section504ProgramOrganizationId', 'S01EC1120'
	END CATCH
	
	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'Section 504 Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1130'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LEA_Section504ProgramOrganizationId = norg.OrganizationId
			, NewSection504Program = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LeaOrganizationid = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'Section504ProgramOrganizationId', 'S01EC1140'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_Section504ProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1150'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_Section504ProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1160'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_Section504ProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1170'
	END CATCH
 
	-- School

	--First check to see if Section 504 Program already exists so that it is not created a second time--
	BEGIN TRY
		UPDATE Staging.Organization
		SET School_Section504ProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Section 504 Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'Section504ProgramOrganizationId', 'S01EC1180'
	END CATCH


	--Insert new Section 504 Programs--
	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1190'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_Section504ProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1200'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_Section504ProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'Section504ProgramOrganizationId', 'S01EC1210'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_Section504ProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_Section504ProgramOrganizationId
				, 'Section 504 Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1220'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_Section504ProgramOrganizationId = norg.OrganizationId
			, NewSection504Program = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'Section504ProgramOrganizationId', 'S01EC1230'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_Section504ProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1240'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_Section504ProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1250'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_Section504ProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1260'
	END CATCH


	------------- End of the Section 504 --------------------------

	----------------------------------------------------------------------------------------
	--Create a Homeless Program for each ODS.Organization (LEA and School)---------
	----------------------------------------------------------------------------------------
	-- LEA

	BEGIN TRY
		--First check to see if Homeless Program already exists so that it is not created a second time--
		UPDATE Staging.Organization
		SET LEA_HomelessProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid 
			ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd 
			ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr 
			ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 
			ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgd2.Name = 'Homeless Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'HomelessProgramOrganizationId', 'S01EC1090'
	END CATCH

	--Insert new Homeless Programs--
	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1100'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON 1 = 0
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.OrganizationId
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1110'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET LEA_HomelessProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'HomelessProgramOrganizationId', 'S01EC1120'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING @NewOrganization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.OrganizationId
				, 'Homeless Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1130'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   LEA_HomelessProgramOrganizationId = norg.OrganizationId
			, NewHomelessProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.LeaOrganizationid = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'HomelessProgramOrganizationId', 'S01EC1140'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT LEA_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1150'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT LEA_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1160'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT LEA_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE LEA_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1170'
	END CATCH
 
	-- School

	--First check to see if Homeless Program already exists so that it is not created a second time--
	BEGIN TRY
		UPDATE Staging.Organization
		SET School_HomelessProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Homeless Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'HomelessProgramOrganizationId', 'S01EC1180'
	END CATCH


	--Insert new Homeless Programs--
	BEGIN TRY
		DELETE FROM @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1190'
	END CATCH

	BEGIN TRY
		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_HomelessProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1200'
	END CATCH

	BEGIN TRY
		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET School_HomelessProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'HomelessProgramOrganizationId', 'S01EC1210'
	END CATCH

	BEGIN TRY
		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.School_HomelessProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.School_HomelessProgramOrganizationId
				, 'Homeless Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1220'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET   School_HomelessProgramOrganizationId = norg.OrganizationId
			, NewHomelessProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'HomelessProgramOrganizationId', 'S01EC1230'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationDetail
		WHERE OrganizationId IN (
				SELECT School_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1240'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Organization
		WHERE OrganizationId IN (
				SELECT School_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Organization', NULL, 'S01EC1250'
	END CATCH

	BEGIN TRY
		DELETE FROM @NewOrganization 
		where OrganizationId in (
				SELECT School_HomelessProgramOrganizationId
				FROM Staging.Organization
				WHERE School_Name IS NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '@NewOrganization', NULL, 'S01EC1260'
	END CATCH


	-- relationship between lea and homeless program
	---------------
	--LEA
	---------------
	BEGIN TRY
		--Create relationship between K12 School and Special Education Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId							[Parent_OrganizationId]
				   ,tod.LEA_HomelessProgramOrganizationId			[OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToHomelessProgram_OrganizationRelationshipId IS NULL
			AND tod.LEA_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1480'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToHomelessProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_HomelessProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToHomelessProgram_OrganizationRelationshipId', 'S01EC1490'
	END CATCH


	---------------
	--SCHOOL
	---------------
	BEGIN TRY
		--Create relationship between K12 School and Special Education Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId									[Parent_OrganizationId]
				   ,tod.School_HomelessProgramOrganizationId					[OrganizationId]
				   ,NULL														[RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToHomelessProgram_OrganizationRelationshipId IS NULL
			AND tod.School_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1480'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToHomelessProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_HomelessProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToHomelessProgram_OrganizationRelationshipId', 'S01EC1490'
	END CATCH





	-----------------------------------------------------------------------------------
	----Create HomelessProgramType ------------------------------------------
	-----------------------------------------------------------------------------------

	----Need to modify the 09999 code to match the Homeless Program code when the Homeless
	----program code is added to the RefProgramType table.
	BEGIN TRY
		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('76000') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('76000')
		WHERE orgd.Name = 'Homeless Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1700'
	END CATCH









	--===============================================================================================================================





	----------------------------------------------------------------------
	--INSERT State/LEA/K12 School into ODS.OrganizationIdentifier---------
	----------------------------------------------------------------------

	BEGIN TRY 
		--Insert LEA NCES ID into ODS.OrganizationIdentifier--
		INSERT INTO [ODS].[OrganizationIdentifier]
				   ([Identifier]
				   ,[RefOrganizationIdentificationSystemId]
				   ,[OrganizationId]
				   ,[RefOrganizationIdentifierTypeId])
				   --Here we will want to add the RecordStartDateTime and make it the beginning of the fiscal year each time
				   --It will only add it if it doesn't already exist, so it will be done yearly
		SELECT DISTINCT
					tod.LEA_Identifier_NCES [Identifier]
				   ,[App].[GetOrganizationIdentifierSystemId]('NCES', '001072') AS [RefOrganizationIdentificationSystemId] 
				   ,tod.LEAOrganizationId [OrganizationId]
				   ,[App].[GetOrganizationIdentifierTypeId]('001072') AS [RefOrganizationIdentifierTypeId] 
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier orgid
			ON tod.LEA_Identifier_NCES = orgid.Identifier
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('NCES', '001072')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.OrganizationId = tod.LEAOrganizationId
		WHERE tod.LEA_Identifier_NCES <> ''
			AND tod.LEA_Identifier_NCES IS NOT NULL
			AND orgid.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationIdentifier', NULL, 'S01EC1270'
	END CATCH

	BEGIN TRY
		--Insert K12 School NCES ID into ODS.OrganizationIdentifier--
		INSERT INTO [ODS].[OrganizationIdentifier]
				   ([Identifier]
				   ,[RefOrganizationIdentificationSystemId]
				   ,[OrganizationId]
				   ,[RefOrganizationIdentifierTypeId])
		SELECT DISTINCT
					tod.School_Identifier_NCES [Identifier]
				   ,[App].[GetOrganizationIdentifierSystemId]('NCES', '001073') AS [RefOrganizationIdentificationSystemId]
				   ,tod.SchoolOrganizationId [OrganizationId]
				   ,[App].[GetOrganizationIdentifierTypeId]('001073') AS [RefOrganizationIdentifierTypeId]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier orgid
			ON tod.School_Identifier_NCES = orgid.Identifier
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('NCES', '001073')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.OrganizationId = tod.SchoolOrganizationId
		WHERE tod.School_Identifier_NCES <> ''
			AND tod.School_Identifier_NCES IS NOT NULL
			AND orgid.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationIdentifier', NULL, 'S01EC1280'
	END CATCH

	BEGIN TRY
		--Insert LEA State ID into ODS.OrganizationIdentifier--
		INSERT INTO [ODS].[OrganizationIdentifier]
				   ([Identifier]
				   ,[RefOrganizationIdentificationSystemId]
				   ,[OrganizationId]
				   ,[RefOrganizationIdentifierTypeId])
		SELECT DISTINCT
					tod.LEA_Identifier_State [Identifier]
				   ,[App].[GetOrganizationIdentifierSystemId]('SEA', '001072') AS [RefOrganizationIdentificationSystemId]
				   ,tod.LEAOrganizationId [OrganizationId]
				   ,[App].[GetOrganizationIdentifierTypeId]('001072') AS [RefOrganizationIdentifierTypeId]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier orgid
			ON tod.LEA_Identifier_State = orgid.Identifier
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.OrganizationId = tod.LEAOrganizationId
		WHERE tod.LEA_Identifier_State IS NOT NULL
		AND tod.LEA_Identifier_State <> ''
		AND orgid.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationIdentifier', NULL, 'S01EC1290'
	END CATCH

	BEGIN TRY
		--Insert K12 School State ID into ODS.OrganizationIdentifier--
		INSERT INTO [ODS].[OrganizationIdentifier]
				   ([Identifier]
				   ,[RefOrganizationIdentificationSystemId]
				   ,[OrganizationId]
				   ,[RefOrganizationIdentifierTypeId])
		SELECT DISTINCT
					tod.School_Identifier_State [Identifier]
				   ,[App].[GetOrganizationIdentifierSystemId]('SEA', '001073') AS [RefOrganizationIdentificationSystemId]
				   ,tod.SchoolOrganizationId [OrganizationId]
				   ,[App].[GetOrganizationIdentifierTypeId]('001073') AS [RefOrganizationIdentifierTypeId]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier orgid
			ON tod.School_Identifier_State = orgid.Identifier
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.OrganizationId = tod.SchoolOrganizationId
		WHERE tod.School_Identifier_State IS NOT NULL
		AND tod.School_Identifier_State <> ''
		AND orgid.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationIdentifier', NULL, 'S01EC1300'
	END CATCH

	BEGIN TRY
		--Insert K12 School Federal (Tax) ID into ODS.OrganizationIdentifier--
		INSERT INTO [ODS].[OrganizationIdentifier]
				   ([Identifier]
				   ,[RefOrganizationIdentificationSystemId]
				   ,[OrganizationId]
				   ,[RefOrganizationIdentifierTypeId])
		SELECT DISTINCT
					tod.School_CharterSchoolFEIN [Identifier]
				   ,[App].[GetOrganizationIdentifierSystemId]('Federal', '001073') AS [RefOrganizationIdentificationSystemId]
				   ,tod.SchoolOrganizationId [OrganizationId]
				   ,[App].[GetOrganizationIdentifierTypeId]('001073') AS [RefOrganizationIdentifierTypeId]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier orgid
			ON tod.School_Identifier_State = orgid.Identifier
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('Federal', '001073')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.OrganizationId = tod.SchoolOrganizationId
		WHERE tod.School_Identifier_State IS NOT NULL
		AND tod.School_Identifier_State <> ''
		AND orgid.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationIdentifier', NULL, 'S01EC1310'
	END CATCH



	--Insert LEA/K12/SEA relationships into ODS.OrganizationRelationiship---------

	BEGIN TRY
		--First check to see if the relationship already exists and put the OrganizationRelationshipId back into the temp table
		UPDATE Staging.Organization
		SET SEAToLEA_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.SEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEAOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SEAToLEA_OrganizationRelationshipId', 'S01EC1320'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToSchool_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SchoolOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToSchool_OrganizationRelationshipId', 'S01EC1330'
	END CATCH

	BEGIN TRY
		--LEA to Program relationships
		UPDATE Staging.Organization
		SET LEAToSpecialEducationProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_SpecialEducationProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToSpecialEducationProgram_OrganizationRelationshipId', 'S01EC1340'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToCTEProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_CTEProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToCTEProgram_OrganizationRelationshipId', 'S01EC1350'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToTitleIIIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_TitleIIIProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToTitleIIIProgram_OrganizationRelationshipId', 'S01EC1350'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToTitleIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_TitleIProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToTitleIProgram_OrganizationRelationshipId', 'S01EC1360'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToMigrantProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_MigrantProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToMigrantProgram_OrganizationRelationshipId', 'S01EC1370'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToFosterProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_FosterProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToFosterProgram_OrganizationRelationshipId', 'S01EC1380'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToSection504Program_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_Section504ProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToSectionProgram_OrganizationRelationshipId', 'S01EC1380'
	END CATCH

	BEGIN TRY
		--School to Program relationships
		UPDATE Staging.Organization
		SET SchoolToSpecialEducationProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_SpecialEducationProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToSpecialEducationProgram_OrganizationRelationshipId', 'S01EC1390'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToCTEProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_CTEProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToCTEProgram_OrganizationRelationshipId', 'S01EC1400'
	END CATCH

		BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToTitleIIIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_TitleIIIProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToTitleIIIProgram_OrganizationRelationshipId', 'S01EC1400'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToTitleIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_TitleIProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToTitleIProgram_OrganizationRelationshipId', 'S01EC1410'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToMigrantProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_MigrantProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToMigrantProgram_OrganizationRelationshipId', 'S01EC1420'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToSection504Program_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_Section504ProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToSection504Program_OrganizationRelationshipId', 'S01EC1430'
	END CATCH

	BEGIN TRY
		--Create relationship between SEA and LEA--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					sd.OrganizationId [Parent_OrganizationId]
				   ,tod.LEAOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		CROSS JOIN Staging.StateDetail sd
		WHERE tod.SEAToLEA_OrganizationRelationshipId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1440'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SEAToLEA_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEAOrganizationId = orgr.OrganizationId
		AND tod.SEAToLEA_OrganizationRelationshipId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SEAToLEA_OrganizationRelationshipId', 'S01EC1450'
	END CATCH


	--Create relationship between LEA and K12 School--

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId [Parent_OrganizationId]
				   ,tod.SchoolOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToSchool_OrganizationRelationshipId IS NULL
			AND tod.School_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1460'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToSchool_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SchoolOrganizationId = orgr.OrganizationId
		AND tod.LEAToSchool_OrganizationRelationshipId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToSchool_OrganizationRelationshipId', 'S01EC1470'
	END CATCH


	---------------
	--LEA
	---------------
	BEGIN TRY
		--Create relationship between LEA and Special Education Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId [Parent_OrganizationId]
				   ,tod.LEA_SpecialEducationProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToSpecialEducationProgram_OrganizationRelationshipId IS NULL
			AND tod.LEA_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1480'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToSpecialEducationProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_SpecialEducationProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToSpecialEducationProgram_OrganizationRelationshipId', 'S01EC1490'
	END CATCH

	BEGIN TRY
		--Create relationship between LEA and CTE Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId [Parent_OrganizationId]
				   ,tod.LEA_CTEProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToCTEProgram_OrganizationRelationshipId IS NULL
			AND tod.LEA_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1500'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToCTEProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_CTEProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToCTEProgram_OrganizationRelationshipId', 'S01EC1510'
	END CATCH

		BEGIN TRY
		--Create relationship between LEA and CTE Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId [Parent_OrganizationId]
				   ,tod.LEA_TitleIIIProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToTitleIIIProgram_OrganizationRelationshipId IS NULL
			AND tod.LEA_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1500'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToTitleIIIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_TitleIIIProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToTitleIIIProgram_OrganizationRelationshipId', 'S01EC1510'
	END CATCH

	BEGIN TRY
		--Create relationship between LEA and Title I Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId [Parent_OrganizationId]
				   ,tod.LEA_TitleIProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToTitleIProgram_OrganizationRelationshipId IS NULL
			AND tod.LEA_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1520'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToTitleIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_TitleIProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToTitleIProgram_OrganizationRelationshipId', 'S01EC1530'
	END CATCH

	BEGIN TRY
		--Create relationship between LEA and Migrant Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId [Parent_OrganizationId]
				   ,tod.LEA_MigrantProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToMigrantProgram_OrganizationRelationshipId IS NULL
			AND tod.LEA_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1540'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToMigrantProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_MigrantProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToMigrantProgram_OrganizationRelationshipId', 'S01EC1550'
	END CATCH

	BEGIN TRY
		--Create relationship between LEA and Foster Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId [Parent_OrganizationId]
				   ,tod.LEA_FosterProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToFosterProgram_OrganizationRelationshipId IS NULL
			AND tod.LEA_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1560'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET LEAToFosterProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr 
			ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEA_FosterProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'LEAToFosterProgram_OrganizationRelationshipId', 'S01EC1570'
	END CATCH

	BEGIN TRY
		--Create relationship between LEA and Section 504 Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId [Parent_OrganizationId]
				   ,tod.LEA_Section504ProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToSection504Program_OrganizationRelationshipId IS NULL
			AND tod.LEA_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1560'
	END CATCH

	---------------
	--Schools
	---------------
	BEGIN TRY
		--Create relationship between K12 School and Special Education Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.School_SpecialEducationProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToSpecialEducationProgram_OrganizationRelationshipId IS NULL
			AND tod.School_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1580'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToSpecialEducationProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_SpecialEducationProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToSpecialEducationProgram_OrganizationRelationshipId', 'S01EC1590'
	END CATCH

	BEGIN TRY
		--Create relationship between K12 School and CTE Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.School_CTEProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToCTEProgram_OrganizationRelationshipId IS NULL
			AND tod.School_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1600'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToCTEProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_CTEProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToCTEProgram_OrganizationRelationshipId', 'S01EC1610'
	END CATCH

		BEGIN TRY
		--Create relationship between K12 School and Title III Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.School_TitleIIIProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToTitleIIIProgram_OrganizationRelationshipId IS NULL
			AND tod.School_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1600'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToTitleIIIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_TitleIIIProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToTitleIIIProgram_OrganizationRelationshipId', 'S01EC1610'
	END CATCH

	BEGIN TRY
		--Create relationship between K12 School and Title I Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.School_TitleIProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToTitleIProgram_OrganizationRelationshipId IS NULL
			AND tod.School_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1620'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToTitleIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_TitleIProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', NULL, 'S01EC1630'
	END CATCH

	BEGIN TRY
		--Create relationship between K12 School and Migrant Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.School_MigrantProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToMigrantProgram_OrganizationRelationshipId IS NULL
			AND tod.School_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1640'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToMigrantProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_MigrantProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToMigrantProgram_OrganizationRelationshipId', 'S01EC1650'
	END CATCH

	BEGIN TRY
		--Create relationship between K12 School and Foster Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.School_FosterProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToFosterProgram_OrganizationRelationshipId IS NULL
			AND tod.School_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1660'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToFosterProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_FosterProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToFosterProgram_OrganizationRelationshipId', 'S01EC1670'
	END CATCH

	BEGIN TRY
		--Create relationship between K12 School and Section 504 Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.School_Section504ProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToSection504Program_OrganizationRelationshipId IS NULL
			AND tod.School_Name IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1660'
	END CATCH

	BEGIN TRY
		UPDATE Staging.Organization
		SET SchoolToSection504Program_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.School_Section504ProgramOrganizationId = orgr.OrganizationId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Organization', 'SchoolToSection504Program_OrganizationRelationshipId', 'S01EC1670'
	END CATCH

	-----------------------------------------------------------------------------------
	----Create SpecialEducationOrganizationProgramType --------------------------------
	-----------------------------------------------------------------------------------
	BEGIN TRY
		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('04888') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('04888')
		WHERE orgd.Name = 'Special Education Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1680'
	END CATCH

	-----------------------------------------------------------------------------------
	----Create CTEOrganizationProgramType --------------------------------
	-----------------------------------------------------------------------------------
	BEGIN TRY
		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('04906') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('04906')
		WHERE orgd.Name = 'CTE Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1690'
	END CATCH

	-----------------------------------------------------------------------------------
	----Create Title III OrganizationProgramType --------------------------------
	-----------------------------------------------------------------------------------
	BEGIN TRY
		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('77000') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('77000')
		WHERE orgd.Name = 'Title III Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1690'
	END CATCH

	-----------------------------------------------------------------------------------
	----Create TitleIOrganizationProgramType ------------------------------------------
	-----------------------------------------------------------------------------------

	----Need to modify the 09999 code to match the Title I Program code when the Title I
	----program code is added to the RefProgramType table.
	BEGIN TRY
		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('09999') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('09999')
		WHERE orgd.Name = 'Title I Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1700'
	END CATCH

	-----------------------------------------------------------------------------------
	----Create MigrantOrganizationProgramType -----------------------------------------
	-----------------------------------------------------------------------------------

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('04920') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('04920')
		WHERE orgd.Name = 'Migrant Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1710'
	END CATCH


	-----------------------------------------------------------------------------------
	----Create FosterOrganizationProgramType -----------------------------------------
	-----------------------------------------------------------------------------------

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('75000') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('75000')
		WHERE orgd.Name = 'Foster Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1720'
	END CATCH

		-----------------------------------------------------------------------------------
	----Create Section 504 OrganizationProgramType -----------------------------------------
	-----------------------------------------------------------------------------------

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('04967') AS [RefProgramTypeId] -- '04967': Section 504 Placement
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('04967')
		WHERE orgd.Name = 'Section 504 Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationProgramType', NULL, 'S01EC1720'
	END CATCH

	BEGIN TRY
		--Update the smaller temporary tables to contain the OrganizationId
		--Need to move this down below where we add the school or they won't have IDs yet.
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = oi.OrganizationId
		FROM Staging.StateDetail oi
		JOIN Staging.OrganizationAddress toda 
			ON oi.SeaStateIdentifier = toda.OrganizationIdentifier
		JOIN ODS.SourceSystemReferenceData osss
			ON toda.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
			AND oet.Code = osss.TableFilter
		WHERE ot.RefOrganizationTypeId = App.GetOrganizationTypeId('SEA', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationAddress', 'OrganizationId', 'S01EC1730'
	END CATCH

	BEGIN TRY
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = tod.LEAOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationAddress toda 
			ON tod.LEA_Identifier_State = toda.OrganizationIdentifier
		JOIN ODS.SourceSystemReferenceData osss
			ON toda.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
			AND oet.Code = osss.TableFilter
		WHERE ot.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationAddress', 'OrganizationId', 'S01EC1740'
	END CATCH

	BEGIN TRY
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = tod.SchoolOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationAddress toda 
			ON tod.School_Identifier_State = toda.OrganizationIdentifier
		JOIN ODS.SourceSystemReferenceData osss
			ON toda.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
			AND oet.Code = osss.TableFilter
		WHERE ot.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationAddress', 'OrganizationId', 'S01EC1750'
	END CATCH

	BEGIN TRY
		UPDATE Staging.OrganizationPhone
		SET OrganizationId = sd.OrganizationId
		FROM Staging.StateDetail sd
		JOIN Staging.OrganizationPhone todp 
			ON sd.SeaStateIdentifier = todp.OrganizationIdentifier
		JOIN ODS.SourceSystemReferenceData osss
			ON todp.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
			AND oet.Code = osss.TableFilter
		WHERE ot.RefOrganizationTypeId = App.GetOrganizationTypeId('SEA', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationPhone', 'OrganizationId', 'S01EC1760'
	END CATCH

	BEGIN TRY
		UPDATE Staging.OrganizationPhone
		SET OrganizationId = tod.LEAOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationPhone todp 
			ON tod.LEA_Identifier_State = todp.OrganizationIdentifier
		JOIN ODS.SourceSystemReferenceData osss
			ON todp.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
			AND oet.Code = osss.TableFilter
		WHERE ot.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationPhone', 'OrganizationId', 'S01EC1770'
	END CATCH

	BEGIN TRY
		UPDATE Staging.OrganizationPhone
		SET OrganizationId = tod.SchoolOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationPhone todp 
			ON tod.School_Identifier_State = todp.OrganizationIdentifier
		JOIN ODS.SourceSystemReferenceData osss
			ON todp.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
			AND oet.Code = osss.TableFilter
		WHERE ot.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationPhone', 'OrganizationId', 'S01EC1780'
	END CATCH

	BEGIN TRY
		UPDATE Staging.OrganizationGradeOffered
		SET OrganizationId = tod.SchoolOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationGradeOffered todgo 
			ON tod.School_Identifier_State = todgo.OrganizationIdentifier
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationGradeOffered', 'OrganizationId', 'S01EC1790'
	END CATCH


	-------------------------------------------------------------------
	----Create OrganizationWebsite ------------------------------------
	-------------------------------------------------------------------

	--Organizaton Website needs its own Primary Key and RecordStartDateTime and RecordEndDateTime

	BEGIN TRY
	--SEA Website
	INSERT INTO [ODS].[OrganizationWebsite]
				([OrganizationId]
				,[Website])
	SELECT DISTINCT
				sd.OrganizationId [OrganizationId]
				,sd.Sea_WebSiteAddress [Website]
	FROM Staging.StateDetail sd
	LEFT JOIN ODS.OrganizationWebsite orgw 
		ON sd.OrganizationId = orgw.OrganizationId
		AND sd.Sea_WebSiteAddress = orgw.Website
	WHERE sd.Sea_WebSiteAddress IS NOT NULL
		AND sd.Sea_WebSiteAddress <> ''
		AND orgw.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationWebsite', NULL, 'S01EC1800'
	END CATCH

	BEGIN TRY
		--LEA Website
		INSERT INTO [ODS].[OrganizationWebsite]
					([OrganizationId]
					,[Website])
		SELECT DISTINCT
					tod.LEAOrganizationId [OrganizationId]
					,tod.LEA_WebSiteAddress [Website]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationWebsite orgw 
			ON tod.LEAOrganizationId = orgw.OrganizationId
			AND tod.LEA_WebSiteAddress = orgw.Website
		WHERE tod.LEA_WebSiteAddress IS NOT NULL
			AND tod.LEA_WebSiteAddress <> ''
			AND orgw.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationWebsite', NULL, 'S01EC1810'
	END CATCH


/* -- Need the OrganizationWebsiteId and RecordStart/EndDateTime
	UPDATE Staging.Organization
	SET LEA_OrganizationWebsiteId = orgw.OrganizationWebsiteId
	FROM Staging.Organization tod
	WHERE tod.LEA_WebSiteAddress IS NOT NULL
	AND tod.LEA_WebSiteAddress <> ''
	JOIN ODS.OrganizationWebsite orgw ON tod.LEAOrganizationId = orgw.OrganizationId
	WHERE tod.LEA_WebSiteAddress = orgw.Website

	UPDATE ODS.OrganizationWebsite
	SET RecordEndDateTime = @RecordStartDate
	FROM ODS.OrganizationWebsite orgw
	JOIN ODS.OrganizationDetail orgd ON orgw.OrganizationId = orgd.OrganizationId
	WHERE orgd.RefOrganizationTypeId = @RefOrganizationTypeId_LEA
	AND RecordEndDateTime IS NOT NULL
	AND NOT EXISTS (SELECT 'x' FROM Staging.Organization tod 
						WHERE orgw.OrganizationWebsiteId = tod.LEA_OrganizationWebsiteId)
*/						

	BEGIN TRY
		--School Website
		INSERT INTO [ODS].[OrganizationWebsite]
					([OrganizationId]
					,[Website])
		SELECT DISTINCT
					tod.SchoolOrganizationId [OrganizationId]
					,tod.School_WebSiteAddress [Website]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationWebsite orgw 
			ON tod.SchoolOrganizationId = orgw.OrganizationId
			AND tod.School_WebSiteAddress = orgw.Website
		WHERE tod.School_WebSiteAddress IS NOT NULL
			AND tod.School_WebSiteAddress <> ''
			AND orgw.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationWebsite', NULL, 'S01EC1820'
	END CATCH

/* -- Need the OrganizationWebsiteId and RecordStart/EndDateTime
	UPDATE Staging.Organization
	SET School_OrganizationWebsiteId = orgw.OrganizationWebsiteId
	FROM Staging.Organization tod
	WHERE tod.School_WebSiteAddress IS NOT NULL
	AND tod.School_WebSiteAddress <> ''
	JOIN ODS.OrganizationWebsite orgw ON tod.SchoolOrganizationId = orgw.OrganizationId
	WHERE tod.School_WebSiteAddress = orgw.Website

	UPDATE ODS.OrganizationWebsite
	SET RecordEndDateTime = @RecordStartDate
	FROM ODS.OrganizationWebsite orgw
	JOIN ODS.OrganizationDetail orgd ON orgw.OrganizationId = orgd.OrganizationId
	WHERE orgd.RefOrganizationTypeId = @GetOrganizationTypeId('K12School', '001156')
	AND RecordEndDateTime IS NOT NULL
	AND NOT EXISTS (SELECT 'x' FROM Staging.Organization tod 
						WHERE orgw.OrganizationWebsiteId = tod.School_OrganizationWebsiteId)
*/	


	--End Date any out of date website addresses once the RecordStartDateTime and RecordEndDateTime has been added to Generate

	-------------------------------------------------------------------
	----Create OrganizationTelephone ----------------------------------
	-------------------------------------------------------------------
	BEGIN TRY
		INSERT INTO [ODS].[OrganizationTelephone]
					([OrganizationId]
					,[TelephoneNumber]
					,[PrimaryTelephoneNumberIndicator]
					,[RefInstitutionTelephoneTypeId])
		SELECT DISTINCT 
					 tod.OrganizationId [OrganizationId]
					,tod.TelephoneNumber [TelephoneNumber]
					,0 [PrimaryTelephoneNumberIndicator]
					,ritt.RefInstitutionTelephoneTypeId [RefInstitutionTelephoneTypeId]
		FROM Staging.OrganizationPhone tod
		JOIN ODS.SourceSystemReferenceData ittss
			ON tod.InstitutionTelephoneNumberType = ittss.InputCode
			AND ittss.TableName = 'RefInstitutionTelephoneType'
			AND ittss.SchoolYear = @SchoolYear
		JOIN ODS.RefInstitutionTelephoneType ritt
			ON ittss.OutputCode = ritt.Code
		LEFT JOIN ODS.OrganizationTelephone orgt 
			ON tod.OrganizationId = orgt.organizationId
			AND ritt.RefInstitutionTelephoneTypeId = orgt.RefInstitutionTelephoneTypeId
		WHERE orgt.RefInstitutionTelephoneTypeId IS NULL
			AND tod.TelephoneNumber IS NOT NULL
			AND tod.TelephoneNumber <> ''
			AND tod.OrganizationId IS NOT NULL
		--End Date and out of date phone numbers once the RecordStartDateTime and RecordEndDateTime has been added to Generate
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationTelephone', NULL, 'S01EC1830'
	END CATCH

	-------------------------------------------------------------------
	----Create OrganizationOperationalStatus --------------------------
	-------------------------------------------------------------------
	BEGIN TRY
		INSERT INTO [ODS].[OrganizationOperationalStatus]
					([OrganizationId]
					,[RefOperationalStatusId]
					,[OperationalStatusEffectiveDate])
		SELECT DISTINCT
					 tod.LEAOrganizationId [OrganizationId]
					,ros.RefOperationalStatusId [RefOperationalStatusId]
					,@RecordStartDate [OperationalStatusEffectiveDate]
		FROM Staging.Organization tod
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.LEA_OperationalStatus = osss.InputCode
			AND osss.TableName = 'RefOperationalStatus'
			AND osss.TableFilter = 'LEA'
			AND osss.SchoolYear = @SchoolYear
		JOIN ods.RefOperationalStatus ros
			ON osss.OutputCode = ros.Code
		LEFT JOIN ODS.OrganizationOperationalStatus orgs 
			ON tod.LEAOrganizationId = orgs.OrganizationId
			AND ros.RefOperationalStatusId = orgs.RefOperationalStatusId
			AND @RecordStartDate = orgs.OperationalStatusEffectiveDate
		WHERE tod.LEA_OperationalStatus IS NOT NULL
			AND tod.LEA_OperationalStatus <> ''
			AND orgs.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationOperationalStatus', NULL, 'S01EC1840'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationOperationalStatus]
					([OrganizationId]
					,[RefOperationalStatusId]
					,[OperationalStatusEffectiveDate])
		SELECT DISTINCT
					 tod.SchoolOrganizationId [OrganizationId]
					,ros.RefOperationalStatusId [RefOperationalStatusId]
					,@RecordStartDate [OperationalStatusEffectiveDate]
		FROM Staging.Organization tod
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.School_OperationalStatus = osss.InputCode
			AND osss.TableName = 'RefOperationalStatus'
			AND osss.TableFilter = 'K12School'
			AND osss.SchoolYear = @SchoolYear
		JOIN ods.RefOperationalStatus ros
			ON osss.OutputCode = ros.Code
		LEFT JOIN ODS.OrganizationOperationalStatus orgs 
			ON tod.SchoolOrganizationId = orgs.OrganizationId
			AND ros.RefOperationalStatusId = orgs.RefOperationalStatusId
			AND tod.School_UpdatedOperationalStatusEffectiveDate = orgs.OperationalStatusEffectiveDate
		WHERE tod.School_OperationalStatus IS NOT NULL
			AND tod.School_OperationalStatus <> ''
			AND orgs.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationOperationalStatus', NULL, 'S01EC1850'
	END CATCH

		/**************************Adding the updated operational status*************************/


BEGIN TRY
		INSERT INTO [ODS].[OrganizationOperationalStatus]
					([OrganizationId]
					,[RefOperationalStatusId]
					,[OperationalStatusEffectiveDate])
		SELECT DISTINCT
					 tod.LEAOrganizationId [OrganizationId]
					,ros.RefOperationalStatusId [RefOperationalStatusId]
					,tod.LEA_UpdatedOperationalStatusEffectiveDate [OperationalStatusEffectiveDate]
		FROM Staging.Organization tod
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.LEA_UpdatedOperationalStatus = osss.InputCode
			AND osss.TableName = 'RefOperationalStatus'
			AND osss.TableFilter = 'LEA'
			AND osss.SchoolYear = @SchoolYear
		JOIN ods.RefOperationalStatus ros
			ON osss.OutputCode = ros.Code
		LEFT JOIN ODS.OrganizationOperationalStatus orgs 
			ON tod.LEAOrganizationId = orgs.OrganizationId
			AND ros.RefOperationalStatusId = orgs.RefOperationalStatusId
			AND tod.LEA_UpdatedOperationalStatusEffectiveDate = orgs.OperationalStatusEffectiveDate
		WHERE tod.LEA_OperationalStatus IS NOT NULL
			AND tod.LEA_OperationalStatus <> ''
			AND orgs.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationOperationalStatus', NULL, 'S01EC1840'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationOperationalStatus]
					([OrganizationId]
					,[RefOperationalStatusId]
					,[OperationalStatusEffectiveDate])
		SELECT DISTINCT
					 tod.SchoolOrganizationId [OrganizationId]
					,ros.RefOperationalStatusId [RefOperationalStatusId]
					,@RecordStartDate [OperationalStatusEffectiveDate]
		FROM Staging.Organization tod
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.School_updatedOperationalStatus = osss.InputCode
			AND osss.TableName = 'RefOperationalStatus'
			AND osss.TableFilter = 'K12School'
			AND osss.SchoolYear = @SchoolYear
		JOIN ods.RefOperationalStatus ros
			ON osss.OutputCode = ros.Code
		LEFT JOIN ODS.OrganizationOperationalStatus orgs 
			ON tod.SchoolOrganizationId = orgs.OrganizationId
			AND ros.RefOperationalStatusId = orgs.RefOperationalStatusId
			AND tod.School_UpdatedOperationalStatusEffectiveDate = orgs.OperationalStatusEffectiveDate
		WHERE tod.School_OperationalStatus IS NOT NULL
			AND tod.School_OperationalStatus <> ''
			AND orgs.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationOperationalStatus', NULL, 'S01EC1850'
	END CATCH

/***************************************************/
	-------------------------------------------------------------------
	----Create CharterSchoolApprovalAgency -----
	-------------------------------------------------------------------
	-- make sure that [ODS].[SourceSystemReferenceData] has correct metadata on corresponding ODS.RefCharterSchoolApprovalAgencyType records
	--declare @SchoolYear int
	--SET @SchoolYear=2018
	--UPDATE [generate].[ODS].[SourceSystemReferenceData]
	--SET [generate].[ODS].[SourceSystemReferenceData].OutputCode='SBE' 
	--	WHERE [generate].[ODS].[SourceSystemReferenceData].SchoolYear = @SchoolYear
	--	AND [generate].[ODS].[SourceSystemReferenceData].TableName = 'RefCharterSchoolApprovalAgencyType'
	--	AND [generate].[ODS].[SourceSystemReferenceData].InputCode = 'State board of education'

	--UPDATE [generate].[ODS].[SourceSystemReferenceData]
	--SET [generate].[ODS].[SourceSystemReferenceData].OutputCode='PCSB' 
	--	WHERE [generate].[ODS].[SourceSystemReferenceData].SchoolYear = @SchoolYear
	--	AND [generate].[ODS].[SourceSystemReferenceData].TableName = 'RefCharterSchoolApprovalAgencyType'
	--	AND [generate].[ODS].[SourceSystemReferenceData].InputCode = 'Public charter school board'

	--UPDATE [generate].[ODS].[SourceSystemReferenceData]
	--SET [generate].[ODS].[SourceSystemReferenceData].OutputCode='UNI' 
	--	WHERE [generate].[ODS].[SourceSystemReferenceData].SchoolYear = @SchoolYear
	--	AND [generate].[ODS].[SourceSystemReferenceData].TableName = 'RefCharterSchoolApprovalAgencyType'
	--	AND [generate].[ODS].[SourceSystemReferenceData].InputCode = 'University'

	--UPDATE [generate].[ODS].[SourceSystemReferenceData]
	--SET [generate].[ODS].[SourceSystemReferenceData].OutputCode='OTH' 
	--	WHERE [generate].[ODS].[SourceSystemReferenceData].SchoolYear = @SchoolYear
	--	AND [generate].[ODS].[SourceSystemReferenceData].TableName = 'RefCharterSchoolApprovalAgencyType'
	--	AND [generate].[ODS].[SourceSystemReferenceData].InputCode = 'Other'


	-- Charter School
	BEGIN TRY
	DECLARE @NewOanizationId INT
			INSERT INTO [ODS].[Organization] DEFAULT VALUES
			SET @NewOanizationId = SCOPE_IDENTITY();

		declare @charterSchoolAuthTypeId as int
		select @charterSchoolAuthTypeId = RefOrganizationTypeId
		from ods.RefOrganizationType 
		where [Code] = 'CharterSchoolAuthorizingOrganization'

			INSERT INTO [ODS].[OrganizationDetail]
						([OrganizationId]
						,[Name]
						,[RefOrganizationTypeId]
						,[ShortName]
						,[RecordStartDateTime]
						,[RecordEndDateTime])
			SELECT TOP 1
						@NewOanizationId [OrganizationId]
						,s.[CharterSchoolApprovalAgency_Name]  [Name]
						,@charterSchoolAuthTypeId [RefOrganizationTypeId] 
						,s.[CharterSchoolApprovalAgency_Name]  [ShortName]
						,'1900-01-01' [RecordStartDateTime]
						,NULL [RecordEndDateTime]
			FROM [Staging].[CharterSchoolApprovalAgency] s

		declare @charterSchoolManagerIdentifierTypeId as int
		select @charterSchoolManagerIdentifierTypeId = RefOrganizationIdentifierTypeId			
		from ods.RefOrganizationIdentifierType
		where [Code] = '000827'

		declare @charterAuthorizerIdentificationSystemId as int
		select @charterAuthorizerIdentificationSystemId = RefOrganizationIdentificationSystemId
		from ods.RefOrganizationIdentificationSystem
		where [Code] = 'SEA'
		and RefOrganizationIdentifierTypeId = @charterSchoolManagerIdentifierTypeId

			--Insert StateANSICode into ODS.OrganizationIdentifier
			INSERT INTO [ODS].[OrganizationIdentifier]
						([Identifier]
						,[RefOrganizationIdentificationSystemId]
						,[OrganizationId]
						,[RefOrganizationIdentifierTypeId])
			SELECT DISTINCT
						s.[CharterSchoolApprovalAgencyId] [Identifier] 
						,@charterAuthorizerIdentificationSystemId [RefOrganizationIdentificationSystemId]
						,@NewOanizationId [OrganizationId]
						,[App].[GetOrganizationIdentifierTypeId]('001491') [RefOrganizationIdentifierTypeId] 
			FROM [Staging].[CharterSchoolApprovalAgency] s


		--Create relationship between Charter School Approval Agency and School--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					@NewOanizationId [Parent_OrganizationId]
				   ,schid.OrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM [Staging].[CharterSchoolApprovalAgency] tod
		JOIN ODS.OrganizationIdentifier oid ON oid.Identifier = tod.[CharterSchoolApprovalAgencyId]
		JOIN ODS.OrganizationIdentifier schid ON schid.Identifier = tod.[CharterSchoolId]
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationRelationship', NULL, 'S01EC1460'
	END CATCH

	BEGIN TRY
		declare @sharedTimeStatusId as int
		select @sharedTimeStatusId = RefOrganizationIndicatorId from ods.RefOrganizationIndicator where code = 'SharedTime'

		INSERT INTO [ODS].[OrganizationIndicator]
			(
			[OrganizationId]
			,[RefOrganizationIndicatorId]
			, IndicatorValue
			)
		SELECT 
			o.SchoolOrganizationId
			,@sharedTimeStatusId
			, o.School_SharedTimeIndicator 
		FROM [Staging].[Organization] o
		WHERE o.School_SharedTimeIndicator iS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12CharterSchoolApprovalAgency', NULL, 'S01EC1870'
	END CATCH

	
	BEGIN TRY
		INSERT INTO [ODS].[K12CharterSchoolApprovalAgency]
				   ([OrganizationId]
				   ,[RefCharterSchoolApprovalAgencyTypeId]
				   )
		SELECT 
					oid.OrganizationId [OrganizationId]
				   ,ref.RefCharterSchoolApprovalAgencyTypeId [RefCharterSchoolApprovalAgencyTypeId]
		FROM [Staging].[CharterSchoolApprovalAgency] o
		JOIN ODS.OrganizationIdentifier oid ON oid.Identifier = o.[CharterSchoolApprovalAgencyId]
		JOIN ods.RefCharterSchoolApprovalAgencyType ref 
			ON ref.Definition = o.[CharterSchoolApprovalAgencyType]
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12CharterSchoolApprovalAgency', NULL, 'S01EC1875'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationRelationship]
					(Parent_OrganizationId
					,OrganizationId
					,RefOrganizationRelationshipId
					)
		Select 
					oi.OrganizationId
					,SchoolOrganizationId
					,'PrimaryAuthorizationBody'
		FROM staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier oi ON tod.[School_CharterPrimaryAuthorizer] = oi.Identifier
											AND oi.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('CharterSchoolAuthorizingOrganization', '001156')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12CharterSchoolApprovalAgency', NULL, 'S01EC1877'
	END CATCH


	--BEGIN TRY
	--	declare @charterSchoolAuthTypeId as int
	--	select @charterSchoolAuthTypeId = RefOrganizationTypeId
	--	from ods.RefOrganizationType 
	--	where [Code] = 'CharterSchoolAuthorizingOrganization'

	--	--UPDATE od
	--	--SET RefOrganizationTypeId = @charterSchoolAuthTypeId
	--	--FROM [ODS].[OrganizationDetail] od
	--	--JOIN ODS.OrganizationIdentifier oid ON oid.[OrganizationId] = od.OrganizationId
	--	--JOIN [Staging].[CharterSchoolApprovalAgency] o ON oid.Identifier = o.CharterSchoolApprovalAgencyId
	--END TRY

	--BEGIN CATCH
	--	EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1880'
	--END CATCH

	--BEGIN TRY
	--	declare @charterSchoolManagerIdentifierTypeId as int
	--	select @charterSchoolManagerIdentifierTypeId = RefOrganizationIdentifierTypeId			
	--	from ods.RefOrganizationIdentifierType
	--	where [Code] = '000827'

	--	declare @charterAuthorizerIdentificationSystemId as int
	--	select @charterAuthorizerIdentificationSystemId = RefOrganizationIdentificationSystemId
	--	from ods.RefOrganizationIdentificationSystem
	--	where [Code] = 'SEA'
	--	and RefOrganizationIdentifierTypeId = @charterSchoolManagerIdentifierTypeId

	--	--UPDATE oid
	--	--SET RefOrganizationIdentificationSystemId = @charterAuthorizerIdentificationSystemId
	--	--FROM [ODS].OrganizationIdentifier oid
	--	--JOIN [Staging].[CharterSchoolApprovalAgency] o ON oid.Identifier = o.CharterSchoolApprovalAgencyId
	--END TRY

	--BEGIN CATCH
	--	EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationDetail', NULL, 'S01EC1890'
	--END CATCH

	-- temporary commented until we find out how to detect this attribute
	-------------------------------------------------------------------
	----Create CharterSchoolManagementOrganizationType -----
	-------------------------------------------------------------------
	--INSERT INTO [ODS].[K12CharterSchoolManagementOrganization]
	--		   ([OrganizationId]
	--		   ,[RefCharterSchoolManagementOrganizationTypeId]
	--		   )
	--SELECT 
	--		    o.SchoolOrganizationId [OrganizationId]
	--		   ,ref.RefCharterSchoolManagementOrganizationTypeId [RefCharterSchoolManagementOrganizationTypeId]
	--FROM Staging.Organization o
	--JOIN ODS.SourceSystemReferenceData stss
	--	ON o.School_CharterSchoolManagementOrganizationType = stss.InputCode
	--	AND stss.TableName = 'RefCharterSchoolManagementOrganizationType'
	--	AND stss.SchoolYear = @SchoolYear
	--JOIN ods.RefCharterSchoolManagementOrganizationType ref 
	--	ON ref.Code=stss.OutputCode

	-------------------------------------------------------------------
	----Create K12LEA and K12School -----------------------------------
	-------------------------------------------------------------------

	BEGIN TRY
		INSERT INTO [ODS].[K12Lea]
					([OrganizationId]
					,[RefLeaTypeId]
					,[SupervisoryUnionIdentificationNumber]
					,[RefLEAImprovementStatusId]
					,[RefPublicSchoolChoiceStatusId]
					,[CharterSchoolIndicator])
		SELECT DISTINCT
					 tod.LEAOrganizationId [OrganizationId]
					,rlt.RefLeaTypeId [RefLeaTypeId]
					,tod.LEA_SupervisoryUnionIdentificationNumber [SupervisoryUnionIdentificationNumber]
					,NULL [RefLEAImprovementStatusId]
					,NULL [RefPublicSchoolChoiceStatusId]
				    ,tod.LEA_CharterSchoolIndicator [CharterSchoolIndicator]
		FROM Staging.Organization tod
		LEFT JOIN ODS.SourceSystemReferenceData ltss
			ON tod.LEA_Type = ltss.InputCode
			AND ltss.TableName = 'RefLeaType'
			AND ltss.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefLeaType rlt
			ON ltss.OutputCode = rlt.Code
		LEFT JOIN ODS.K12Lea kl 
			ON tod.LEAOrganizationId = kl.OrganizationId
		WHERE tod.LEA_Type IS NOT NULL
			AND kl.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12Lea', NULL, 'S01EC1870'
	END CATCH



	--	[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] 2018
	-- LEA Title I 
	-- K12LeaTitleISupportService
	--return
	--DECLARE @SchoolYear INT = 2018
	--DECLARE @RecordStartDate DATETIME
	--DECLARE @RecordEndDate DATETIME
	--SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear);
	--SET @RecordEndDate = App.GetFiscalYearEndDate(@SchoolYear);
	-- 1
	BEGIN TRY
		UPDATE Staging.Organization
		SET LEA_K12LeaTitleISupportServiceId = k12lea.K12LeaTitleISupportServiceId
		FROM ODS.K12LeaTitleISupportService k12lea
		JOIN Staging.Organization org ON org.LEAOrganizationId = k12lea.OrganizationId
	END TRY
	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12LeaTitleISupportService', NULL, 'S01EC1871'
	END CATCH

	-- 2
	BEGIN TRY
		INSERT ODS.K12LeaTitleISupportService (
			OrganizationId
			,RefK12LeaTitleISupportServiceId
			,RecordStartDateTime
			,RecordEndDateTime
		)
		SELECT DISTINCT
			org.LEAOrganizationId
			,ot.RefK12LEATitleISupportServiceId
			,@RecordStartDate
			,@RecordEndDate
		FROM Staging.Organization org
		LEFT JOIN ODS.K12LeaTitleISupportService k12lea ON k12lea.OrganizationId = org.LEAOrganizationId
		LEFT JOIN ODS.SourceSystemReferenceData osss
				ON org.LEA_K12LeaTitleISupportService = osss.InputCode
				AND osss.TableName = 'RefK12LeaTitleISupportService'
				AND osss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefK12LeaTitleISupportService ot 
				ON osss.OutputCode = ot.Code
		WHERE k12lea.OrganizationId IS NULL
			AND ot.RefK12LEATitleISupportServiceId IS NOT NULL
	END TRY
	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12LeaTitleISupportService', NULL, 'S01EC1872'
	END CATCH

	-- K12ProgramOrService LEA level
	-- 1
	BEGIN TRY
		UPDATE Staging.Organization
		SET LEA_K12programOrServiceId = k12ps.K12ProgramOrServiceId
		FROM ODS.K12ProgramOrService k12ps
		JOIN Staging.Organization org ON org.LEAOrganizationId = k12ps.OrganizationId
	END TRY
	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12ProgramOrService', NULL, 'S01EC1873'
	END CATCH

	-- 2
	BEGIN TRY
		INSERT ODS.K12ProgramOrService (
			OrganizationId
			,RefMepProjectTypeId
			,RefTitleIInstructionalServicesId
			,RefTitleIProgramTypeId
			,RecordStartDateTime
			,RecordEndDateTime
		)
		SELECT DISTINCT
			org.LEAOrganizationId
			,remMep.RefMepProjectTypeId
			,ot1.RefTitleIInstructionalServicesId
			,ot2.RefTitleIProgramTypeId
			,@RecordStartDate
			,@RecordEndDate
		FROM Staging.Organization org
		LEFT JOIN ODS.K12ProgramOrService k12lea ON k12lea.OrganizationId = org.LEAOrganizationId
		LEFT JOIN ODS.SourceSystemReferenceData ss1
				ON org.LEA_TitleIinstructionalService = ss1.InputCode
				AND ss1.TableName = 'RefTitleIInstructionalServices'
				AND ss1.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefTitleIInstructionalServices ot1 
				ON ss1.OutputCode = ot1.Code

		LEFT JOIN ODS.SourceSystemReferenceData ss2
				ON org.LEA_TitleIProgramType = ss2.InputCode
				AND ss2.TableName = 'RefTitleIProgramType'
				AND ss2.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefTitleIProgramType ot2
				ON ss2.OutputCode = ot2.Code

		-- MepProjectType
		LEFT JOIN ODS.SourceSystemReferenceData ssmep
				ON ssmep.InputCode = org.LEA_MepProjectType
				AND ssmep.TableName = 'RefMepProjectType'
				AND ssmep.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefMepProjectType remMep
				ON remMep.Code = ssmep.OutputCode 

		WHERE k12lea.OrganizationId IS NULL
	END TRY
	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12ProgramOrService', NULL, 'S01EC1874'
	END CATCH

	-- K12ProgramOrService School level
	-- 1
	BEGIN TRY
		UPDATE Staging.Organization
		SET School_K12programOrServiceId = k12ps.K12ProgramOrServiceId
		FROM ODS.K12ProgramOrService k12ps
		JOIN Staging.Organization org ON org.SchoolOrganizationId = k12ps.OrganizationId
	END TRY
	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12ProgramOrService', NULL, 'S01EC1875'
	END CATCH

	-- 2
	BEGIN TRY
		INSERT ODS.K12ProgramOrService (
			OrganizationId
			,RefMepProjectTypeId
			,RecordStartDateTime
			,RecordEndDateTime
		)
		SELECT DISTINCT
			org.SchoolOrganizationId
			,remMep.RefMepProjectTypeId
			,@RecordStartDate
			,@RecordEndDate
		FROM Staging.Organization org
		LEFT JOIN ODS.K12ProgramOrService k12lea ON k12lea.OrganizationId = org.SchoolOrganizationId
		-- MepProjectType
		LEFT JOIN ODS.SourceSystemReferenceData ssmep
				ON ssmep.InputCode = org.School_MepProjectType
				AND ssmep.TableName = 'RefMepProjectType'
				AND ssmep.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefMepProjectType remMep
				ON remMep.Code = ssmep.OutputCode 

		WHERE org.SchoolOrganizationId IS NOT NULL 
			AND org.SchoolYear = @SchoolYear

	END TRY
	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12ProgramOrService', NULL, 'S01EC1876'
	END CATCH


	--Need to Add RecordStartDate and RecordEndDateTime to the K12Lea table--
	--AND NOT EXISTS (SELECT 'X' FROM ODS.K12Lea kl WHERE tod.LEAOrganizationId = kl.OrganizationId
	--												AND kl.RecordStartDateTime = @RecordStartDate
	--												AND kl.RecordEndDateTime = @RecordEndDate)	 
	BEGIN TRY
		INSERT INTO [ODS].[K12School](
			[OrganizationId]
			,[RefSchoolTypeId]
			,[RefSchoolLevelId]
			,[RefAdministrativeFundingControlId]
			,[CharterSchoolIndicator]
			,[RefCharterSchoolTypeId]
			,[RefIncreasedLearningTimeTypeId]
			,[RefStatePovertyDesignationId]
			,[CharterSchoolApprovalYear]
			,[K12CharterSchoolApprovalAgencyId]
			,[AccreditationAgencyName]
			,[CharterSchoolOpenEnrollmentIndicator]
			,[CharterSchoolContractApprovalDate]
			,[CharterSchoolContractIdNumber]
			,[CharterSchoolContractRenewalDate]
			--,[K12CharterSchoolManagementOrganizationId]
			,[RecordStartDateTime]
			,[RecordEndDateTime]
		)
		SELECT DISTINCT
			tod.SchoolOrganizationId [OrganizationId]
			,rst.RefSchoolTypeId [RefSchoolTypeId]
			,NULL [RefSchoolLevelId] --Do we need this?
			,NULL [RefAdministrativeFundingControlId]
			,tod.School_CharterSchoolIndicator	[CharterSchoolIndicator]
			,NULL [RefCharterSchoolTypeId]
			,NULL [RefIncreasedLearningTimeTypeId]
			,rstpov.RefStatePovertyDesignationId [RefStatePovertyDesignationId]
			,NULL [CharterSchoolApprovalYear]
			,aa.K12CharterSchoolApprovalAgencyId [K12CharterSchoolApprovalAgencyId]
			,NULL [AccreditationAgencyName]
			,tod.School_CharterSchoolOpenEnrollmentIndicator	[CharterSchoolOpenEnrollmentIndicator]
			,tod.School_CharterContractApprovalDate [CharterSchoolContractApprovalDate]
			,tod.School_CharterContractIDNumber [CharterSchoolContractIdNumber]
			,tod.School_CharterContractRenewalDate [CharterSchoolContractRenewalDate]
			,@RecordStartDate
			,@RecordEndDate
		FROM Staging.Organization tod
		LEFT JOIN ODS.SourceSystemReferenceData stss
			ON tod.School_Type = stss.InputCode
			AND stss.TableName = 'RefSchoolType'
			AND stss.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefSchoolType rst
			ON stss.OutputCode = rst.Code
		LEFT JOIN ODS.K12School ks 
			ON tod.SchoolOrganizationId = ks.OrganizationId
			AND ks.RecordStartDateTime = @RecordStartDate
			AND ks.RecordEndDateTime = @RecordEndDate
		LEFT JOIN ODS.K12CharterSchoolApprovalAgency aa 
			ON aa.OrganizationId=tod.SchoolOrganizationId
		LEFT JOIN ODS.K12CharterSchoolManagementOrganization mo 
			ON mo.OrganizationId=tod.SchoolOrganizationId
		-- state poverty designation
		LEFT JOIN ODS.SourceSystemReferenceData stsspov
			ON tod.School_StatePovertyDesignation = stsspov.InputCode
			AND stsspov.TableName = 'RefStatePovertyDesignation'
			AND stsspov.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefStatePovertyDesignation rstpov
			ON stsspov.OutputCode = rstpov.Code
		WHERE ks.K12SchoolId IS NULL
			AND tod.School_Name IS NOT NULL



	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12School', NULL, 'S01EC1880'
	END CATCH

	-------------------------------------------------------------------
	----Create Grades Offered -----
	-------------------------------------------------------------------
	BEGIN TRY
		UPDATE Staging.OrganizationGradeOffered
		SET OrganizationId = oi.OrganizationId
		FROM Staging.OrganizationGradeOffered ogo
		JOIN ods.OrganizationIdentifier oi
			ON ogo.OrganizationIdentifier = oi.Identifier
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationGradeOffered', 'OrganizationId', 'S01EC1890'
	END CATCH

	BEGIN TRY
		INSERT INTO ODS.K12SchoolGradeOffered
		SELECT 
			  sch.K12SchoolId
			, rgl.RefGradeLevelId
		FROM Staging.OrganizationGradeOffered tod
		JOIN ODS.K12School sch 
			ON tod.OrganizationId = sch.OrganizationId
		JOIN ODS.SourceSystemReferenceData grd
			ON tod.GradeOffered = grd.InputCode
			AND grd.TableName = 'RefGradeLevel'
			AND grd.SchoolYear = @SchoolYear
		JOIN ODS.RefGradeLevel rgl 
			ON grd.OutputCode = rgl.Code
		JOIN ODS.RefGradeLevelType rglt 
			ON rgl.RefGradeLevelTypeId = rglt.RefGradeLevelTypeId 
			AND rglt.Code = '000131'
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12SchoolGradeOffered', NULL, 'S01EC1900'
	END CATCH

	-------------------------------------------------------------------
	----Create Location, OrganizationLocation and LocationAddress -----
	-------------------------------------------------------------------


	-------Check for existing address first--------

	BEGIN TRY
		---Update the OrganizationId on the temporary table
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = orgid.OrganizationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.OrganizationIdentifier = orgid.Identifier
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
				AND oet.Code = osss.TableFilter
		WHERE ot.Code = 'SEA'
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001491')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationAddress', 'OrganizationId', 'S01EC1910'
	END CATCH

	BEGIN TRY
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = orgid.OrganizationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.OrganizationIdentifier = orgid.Identifier
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
			AND oet.Code = osss.TableFilter
		WHERE ot.Code = 'LEA'
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationAddress', 'OrganizationId', 'S01EC1920'
	END CATCH

	BEGIN TRY
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = orgid.OrganizationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.OrganizationIdentifier = orgid.Identifier
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
			AND oet.Code = osss.TableFilter
		WHERE ot.Code = 'K12School'
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationAddress', 'OrganizationId', 'S01EC1930'
	END CATCH

	BEGIN TRY
		---Update the location ID where the address is identical
		UPDATE Staging.OrganizationAddress
		SET LocationId = la.LocationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.SourceSystemReferenceData oltss
			ON tod.AddressTypeForOrganization = oltss.InputCode
			AND oltss.TableName = 'RefOrganizationLocationType'
			AND oltss.SchoolYear = @SchoolYear
		JOIN ODS.OrganizationLocation orgl ON tod.OrganizationId = orgl.OrganizationId
		JOIN ODS.RefOrganizationLocationType rolt
			ON oltss.OutputCode = rolt.Code
			AND orgl.RefOrganizationLocationTypeId = rolt.RefOrganizationLocationTypeId
		JOIN ODS.LocationAddress la ON orgl.LocationId = la.LocationId
		WHERE tod.AddressStreetNumberAndName = la.StreetNumberAndName
			AND tod.AddressApartmentRoomOrSuite = la.ApartmentRoomOrSuiteNumber
			AND tod.AddressCity = la.City
			AND tod.AddressPostalCode = la.PostalCode
			AND tod.RefStateId = la.RefStateId
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.OrganizationAddress', 'LocationId', 'S01EC1940'
	END CATCH

	--still need to address where the address exists but doesn't match and we have no way to end date it or start date it--
	--This cannot be done until the ODS is updated with the RecordStartDateTime and RecordEndDateTime on OrganizationLocation--
	--Until that is addressed, we will drop all non matching records with the same AddressTypeForOrganization that we are trying
	--to add new below--
	BEGIN TRY
		CREATE TABLE #existing_organizationlocation (
			 OrganizationId VARCHAR(100)
			,LocationId VARCHAR(100)
			,RefOrganizationLocationTypeId VARCHAR(100)
			,MarkForDeletion BIT)
		INSERT INTO #existing_organizationlocation
			(OrganizationId
			,LocationId
			,RefOrganizationLocationTypeId
			,MarkForDeletion)
		SELECT DISTINCT
			 orgl.OrganizationId OrganizationId
			,orgl.LocationId LocationId
			,orgl.RefOrganizationLocationTypeId RefOrganizationLocationTypeId
			,0 MarkForDeletion
		FROM ODS.OrganizationLocation orgl
		WHERE orgl.LocationId NOT IN (SELECT tod.LocationId FROM Staging.OrganizationAddress tod WHERE tod.LocationId IS NOT NULL)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '#existing_organizationlocation', NULL, 'S01EC1950'
	END CATCH

	BEGIN TRY
		UPDATE #existing_organizationlocation
		SET MarkForDeletion = 1
		WHERE LocationId IN
		(SELECT orgl.LocationId
		FROM ODS.OrganizationLocation orgl
		JOIN Staging.OrganizationAddress tod 
			ON orgl.OrganizationId = tod.OrganizationId
		JOIN ODS.SourceSystemReferenceData oltss
			ON tod.AddressTypeForOrganization = oltss.InputCode
			AND oltss.TableName = 'RefOrganizationLocationType'
			AND oltss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationLocationType rolt
			ON oltss.OutputCode = rolt.Code
		WHERE orgl.RefOrganizationLocationTypeId = rolt.RefOrganizationLocationTypeId)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, '#existing_organizationlocation', 'MarkForDeletion', 'S01EC1960'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.LocationAddress WHERE LocationId IN (SELECT LocationId FROM #existing_organizationlocation WHERE MarkForDeletion = 1)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.LocationAddress', NULL, 'S01EC1970'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.OrganizationLocation WHERE LocationId IN (SELECT LocationId FROM #existing_organizationlocation WHERE MarkForDeletion = 1)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationLocation', NULL, 'S01EC1980'
	END CATCH

	BEGIN TRY
		DELETE FROM ODS.Location WHERE LocationId IN (SELECT LocationId FROM #existing_organizationlocation WHERE MarkForDeletion = 1)
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Location', NULL, 'S01EC1990'
	END CATCH

	BEGIN TRY
		WHILE (SELECT COUNT(*) FROM Staging.OrganizationAddress WHERE LocationId IS NULL) > 0
			BEGIN

				SET @ID = (SELECT TOP 1 ID FROM Staging.OrganizationAddress WHERE LocationId IS NULL)
				
				INSERT INTO [ODS].[Location] DEFAULT VALUES
				SET @LocationId = SCOPE_IDENTITY();

				UPDATE Staging.OrganizationAddress SET LocationId = @LocationId WHERE ID = @ID

			END
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, NULL, NULL, 'S01EC2000'
	END CATCH

	-- Add State Address
	BEGIN TRY
		INSERT INTO [ODS].[OrganizationLocation]
					([OrganizationId]
					,[LocationId]
					,[RefOrganizationLocationTypeId])
		SELECT tod.OrganizationId
			,tod.LocationId [LocationId]
			,rolt.RefOrganizationLocationTypeId [RefOrganizationLocationTypeId]
		FROM [generate].[Staging].[StateDetail] sd
			JOIN [Staging].[OrganizationAddress] tod 
			ON tod.OrganizationIdentifier = sd.SeaStateIdentifier
				JOIN ODS.SourceSystemReferenceData oltss
			ON tod.AddressTypeForOrganization = oltss.InputCode
				AND oltss.TableName = 'RefOrganizationLocationType'
				AND oltss.SchoolYear = 2018
		left JOIN ODS.RefOrganizationLocationType rolt
			ON oltss.OutputCode = rolt.Code
		LEFT JOIN ods.OrganizationLocation ol
			ON ol.OrganizationId = tod.OrganizationId
				AND ol.LocationId = tod.locationId
		WHERE tod.OrganizationId IS NOT NULL
			AND tod.LocationId IS NOT NULL
			AND ol.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationLocation', NULL, 'S01EC2010'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationLocation]
					([OrganizationId]
					,[LocationId]
					,[RefOrganizationLocationTypeId])
	  SELECT
	  oi.OrganizationId [OrganizationId]
						,tod.LocationId [LocationId]
						,rolt.RefOrganizationLocationTypeId [RefOrganizationLocationTypeId]
	  FROM ODS.OrganizationIdentifier oi
	  JOIN [Staging].[OrganizationAddress] tod 
		On oi.Identifier = tod.OrganizationIdentifier
	  JOIN ODS.SourceSystemReferenceData oltss
				ON tod.AddressTypeForOrganization = oltss.InputCode
				AND oltss.TableName = 'RefOrganizationLocationType'
				AND oltss.SchoolYear = 2018
		left JOIN ODS.RefOrganizationLocationType rolt
			ON oltss.OutputCode = rolt.Code
		LEFT JOIN ods.OrganizationLocation ol
		ON ol.OrganizationId = oi.OrganizationId
		AND ol.LocationId = tod.locationId
		WHERE tod.OrganizationId IS NOT NULL
			AND tod.LocationId IS NOT NULL
			AND ol.OrganizationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationLocation', NULL, 'S01EC2015'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[LocationAddress]
					([LocationId]
					,[StreetNumberAndName]
					,[ApartmentRoomOrSuiteNumber]
					,[BuildingSiteNumber]
					,[City]
					,[RefStateId]
					,[PostalCode]
					,[CountyName]
					,[RefCountyId]
					,[RefCountryId]
					,[Latitude]
					,[Longitude]
					,[RefERSRuralUrbanContinuumCodeId])
		SELECT DISTINCT
					tod.LocationId [LocationId]
					,tod.AddressStreetNumberAndName [StreetNumberAndName]
					,tod.AddressApartmentRoomOrSuite [ApartmentRoomOrSuiteNumber]
					,NULL [BuildingSiteNumber]
					,tod.AddressCity [City]
					,tod.RefStateId [RefStateId]
					,tod.AddressPostalCode [PostalCode]
					,NULL [CountyName]
					,NULL [RefCountyId]
					,NULL [RefCountryId]
					,NULL [Latitude]
					,NULL [Longitude]
					,NULL [RefERSRuralUrbanContinuumCodeId]
		FROM Staging.OrganizationAddress tod
		LEFT JOIN [ODS].[LocationAddress] la
			on tod.locationid = la.locationid 
		WHERE la.LocationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.LocationAddress', NULL, 'S01EC2020'
	END CATCH

	-------------------------------------------------------------------
	----Create OrganizationCalendar and OrganizationCalendarSession----
	-------------------------------------------------------------------
	--      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] 2018;
	BEGIN TRY
		INSERT INTO [ODS].[OrganizationCalendar]
				   ([OrganizationId]
				   ,[CalendarCode]
				   ,[CalendarDescription]
				   ,[CalendarYear])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,orgid.Identifier [CalendarCode]
				   ,orgid.Identifier [CalendarDescription]
				   ,@SchoolYear AS [CalendarYear]
		FROM ODS.OrganizationDetail orgd
		JOIN ODS.OrganizationIdentifier orgid 
			ON orgd.OrganizationId = orgid.OrganizationId
		JOIN ODS.RefOrganizationType rot 
			ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
		JOIN ODS.RefOrganizationIdentificationSystem rois 
			ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		LEFT JOIN ODS.OrganizationCalendar orgc 
			ON orgd.OrganizationId = orgc.OrganizationId
			AND orgc.CalendarYear = @SchoolYear
		WHERE rot.Code IN ('LEA', 'K12School')
		AND rois.Code = 'SEA'
		AND orgc.OrganizationCalendarId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationCalendar', NULL, 'S01EC2040'
	END CATCH

	--select * from ods.OrganizationCalendar

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationCalendarSession]
				   ([Designator]
				   ,[BeginDate]
				   ,[EndDate]
				   ,[RefSessionTypeId]
				   ,[InstructionalMinutes]
				   ,[Code]
				   ,[Description]
				   ,[MarkingTermIndicator]
				   ,[SchedulingTermIndicator]
				   ,[AttendanceTermIndicator]
				   ,[OrganizationCalendarId]
				   ,[DaysInSession]
				   ,[FirstInstructionDate]
				   ,[LastInstructionDate]
				   ,[MinutesPerDay]
				   ,[SessionStartTime]
				   ,[SessionEndTime])
		SELECT DISTINCT 
					NULL [Designator]
				   ,@RecordStartDate [BeginDate]
				   ,@RecordEndDate [EndDate]
				   ,(SELECT  [RefSessionTypeId] FROM [ODS].[RefSessionType] WHERE Code = 'FullSchoolYear') [RefSessionTypeId] 
				   ,NULL [InstructionalMinutes]
				   ,NULL [Code]
				   ,NULL [Description]
				   ,NULL [MarkingTermIndicator]
				   ,NULL [SchedulingTermIndicator]
				   ,NULL [AttendanceTermIndicator]
				   ,orgc.OrganizationCalendarId [OrganizationCalendarId]
				   ,NULL [DaysInSession]
				   ,NULL [FirstInstructionDate]
				   ,NULL [LastInstructionDate]
				   ,NULL [MinutesPerDay]
				   ,NULL [SessionStartTime]
				   ,NULL [SessionEndTime]
		FROM ODS.OrganizationCalendar orgc
		LEFT JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgc.OrganizationCalendarId = orgcs.OrganizationCalendarId 
			AND orgc.CalendarYear = @SchoolYear
		WHERE orgc.CalendarYear = @SchoolYear
			AND orgcs.OrganizationCalendarId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationCalendarSession', NULL, 'S01EC2050'
	END CATCH

	-------------------------------------------------------------------
	----Move Organization Financial Data Into Appropriate Tables ------
	-------------------------------------------------------------------
	BEGIN TRY
		INSERT INTO [ODS].[K12LeaFederalFunds]
		   ([OrganizationCalendarSessionId]
		   ,[InnovativeProgramsFundsReceived]
		   ,[InnovativeDollarsSpent]
		   ,[InnovativeDollarsSpentOnStrategicPriorities]
		   ,[PublicSchoolChoiceFundsSpent]
		   ,[SesFundsSpent]
		   ,[SesSchoolChoice20PercentObligation]
		   ,[RefRlisProgramUseId]
		   ,[ParentalInvolvementReservationFunds]
		   ,[RecordStartDateTime]
		   ,[RecordEndDateTime])
		SELECT DISTINCT
		   orgcs.OrganizationCalendarSessionId [OrganizationCalendarSessionId] 
		   ,NULL [InnovativeProgramsFundsReceived]
		   ,NULL [InnovativeDollarsSpent]
		   ,NULL [InnovativeDollarsSpentOnStrategicPriorities]
		   ,NULL [PublicSchoolChoiceFundsSpent]
		   ,NULL [SesFundsSpent]
		   ,NULL [SesSchoolChoice20PercentObligation]
		   ,NULL [RefRlisProgramUseId]
		   ,orgff.ParentalInvolvementReservationFunds [ParentalInvolvementReservationFunds]
		   ,@RecordStartDate [RecordStartDateTime]
		   ,@RecordEndDate [RecordEndDateTime]	
		FROM Staging.OrganizationFederalFunding orgff
		JOIN ODS.OrganizationIdentifier orgid 
			ON orgff.OrganizationIdentifier = orgid.Identifier
		JOIN ODS.OrganizationCalendar orgc 
			ON orgid.OrganizationId = orgc.OrganizationId
		JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgc.OrganizationCalendarId = orgcs.OrganizationCalendarId
		JOIN ODS.SourceSystemReferenceData osss
			ON orgff.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationType'
			AND osss.TableFilter = '001156'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code
		JOIN ODS.RefOrganizationElementType oet
			ON ot.RefOrganizationElementTypeId = oet.RefOrganizationElementTypeId
			AND oet.Code = osss.TableFilter
		JOIN ODS.RefOrganizationIdentificationSystem rois 
			ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		WHERE ot.Code = 'LEA'
		AND rois.Code = 'SEA'
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12LeaFederalFunds', NULL, 'S01EC2060'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[K12FederalFundAllocation]
				   ([OrganizationCalendarSessionId]
				   ,[FederalProgramCode]
				   ,[RefFederalProgramFundingAllocationTypeId]
				   ,[FederalProgramsFundingAllocation]
				   ,[FundsTransferAmount]
				   ,[SchoolImprovementAllocation]
				   ,[LeaTransferabilityOfFunds]
				   ,[RefLeaFundsTransferTypeId]
				   ,[SchoolImprovementReservedPercent]
				   ,[SesPerPupilExpenditure]
				   ,[NumberOfImmigrantProgramSubgrants]
				   ,[RefReapAlternativeFundingStatusId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgcs.OrganizationCalendarSessionId							[OrganizationCalendarSessionId]
				   ,orgff.FederalProgramCode									[FederalProgramCode]
				   ,ffad.RefFederalProgramFundingAllocationTypeId				[RefFederalProgramFundingAllocationTypeId]
				   ,orgff.FederalProgramsFundingAllocation						[FederalProgramsFundingAllocation]
				   ,NULL [FundsTransferAmount]
				   ,NULL [SchoolImprovementAllocation]
				   ,NULL [LeaTransferabilityOfFunds]
				   ,NULL [RefLeaFundsTransferTypeId]
				   ,NULL [SchoolImprovementReservedPercent]
				   ,NULL [SesPerPupilExpenditure]
				   ,NULL [NumberOfImmigrantProgramSubgrants]
				   ,REAPot.RefReapAlternativeFundingStatusId [RefReapAlternativeFundingStatusId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,@RecordEndDate [RecordEndDateTime]
		FROM Staging.OrganizationFederalFunding orgff
		JOIN ODS.OrganizationIdentifier orgid 
			ON orgff.OrganizationIdentifier = orgid.Identifier
		JOIN ODS.OrganizationCalendar orgc 
			ON orgid.OrganizationId = orgc.OrganizationId
		JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgc.OrganizationCalendarId = orgcs.OrganizationCalendarId
		JOIN ODS.SourceSystemReferenceData osss
			ON orgff.OrganizationType = osss.InputCode
			AND osss.TableName = 'RefOrganizationIdentificationSystem'
			AND osss.TableFilter = 'Organization'
			AND osss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationType ot 
			ON osss.OutputCode = ot.Code

		JOIN ODS.SourceSystemReferenceData ffa 
			ON orgff.FederalProgramFundingAllocationType = ffa.InputCode
			AND ffa.TableName = 'RefFederalProgramFundingAllocationType'
			AND ffa.SchoolYear = @SchoolYear
		JOIN ODS.RefFederalProgramFundingAllocationType ffad
			ON ffa.OutputCode = ffad.Code

		JOIN ODS.RefOrganizationIdentificationSystem rois 
			ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		LEFT JOIN ODS.RefReapAlternativeFundingStatus REAPot 
			ON orgff.REAPAlternativeFundingStatusCode = REAPot.Code
		LEFT JOIN [ODS].[K12FederalFundAllocation] k12fs ON k12fs.OrganizationCalendarSessionId = orgcs.OrganizationCalendarSessionId 
		WHERE ot.Code = 'LEA'
		AND rois.Code = 'SEA'	
		AND 
		(
		orgff.FederalProgramCode IS NOT NULL
		OR orgff.FederalProgramsFundingAllocation IS NOT NULL
		OR orgff.ParentalInvolvementReservationFunds IS NOT NULL	
		OR orgff.REAPAlternativeFundingStatusCode IS NOT NULL
		)		
		AND k12fs.K12FederalFundAllocationId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12FederalFundAllocation', NULL, 'S01EC2070'
	END CATCH

	--select * from [ODS].[K12FederalFundAllocation]

	BEGIN TRY
		--==================
		INSERT INTO [ODS].[K12FederalFundAllocation]
				   ([OrganizationCalendarSessionId]
				   ,[FederalProgramCode]
				   ,[RefFederalProgramFundingAllocationTypeId]
				   ,[FederalProgramsFundingAllocation]
				   ,[FundsTransferAmount]
				   ,[SchoolImprovementAllocation]
				   ,[LeaTransferabilityOfFunds]
				   ,[RefLeaFundsTransferTypeId]
				   ,[SchoolImprovementReservedPercent]
				   ,[SesPerPupilExpenditure]
				   ,[NumberOfImmigrantProgramSubgrants]
				   ,[RefReapAlternativeFundingStatusId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgcs.OrganizationCalendarSessionId [OrganizationCalendarSessionId]
				   ,'84.010' [FederalProgramCode]
				   ,NULL [RefFederalProgramFundingAllocationTypeId]
				   ,NULL [FederalProgramsFundingAllocation]
				   ,NULL [FundsTransferAmount]
				   ,orgff.SchoolImprovementAllocation [SchoolImprovementAllocation]
				   ,NULL [LeaTransferabilityOfFunds]
				   ,NULL [RefLeaFundsTransferTypeId]
				   ,NULL [SchoolImprovementReservedPercent]
				   ,NULL [SesPerPupilExpenditure]
				   ,NULL [NumberOfImmigrantProgramSubgrants]
				   ,NULL [RefReapAlternativeFundingStatusId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,@RecordEndDate [RecordEndDateTime]
		FROM Staging.Organization orgff
		JOIN ODS.OrganizationCalendar orgc 
			ON orgc.OrganizationId = orgff.SchoolOrganizationId
		JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgcs.OrganizationCalendarId = orgc.OrganizationCalendarId
		WHERE orgff.SchoolOrganizationId IS NOT NULL 
			AND orgff.SchoolYear = @SchoolYear
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12FederalFundAllocation', NULL, 'S01EC2080'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[K12SchoolImprovement]
			([K12SchoolId]
			 ,[RefSchoolImprovementStatusId]
			 ,[RefSchoolImprovementFundsId]
			 ,[RefSigInterventionTypeId]
			 ,[SchoolImprovementExitDate]
			 )
		SELECT DISTINCT
			k12.K12SchoolId	[K12SchoolId]
			,NULL [RefSchoolImprovementStatusId]
			,(SELECT ODS.RefSchoolImprovementFunds.RefSchoolImprovementFundsId FROM ODS.RefSchoolImprovementFunds WHERE ODS.RefSchoolImprovementFunds.Code = 'Yes')
			,NULL [RefSigInterventionTypeId]
			,NULL [SchoolImprovementExitDate]
		FROM Staging.Organization orgff
		JOIN ODS.K12School k12 ON k12.OrganizationId = orgff.SchoolOrganizationId
		JOIN ODS.OrganizationCalendar orgc 
			ON orgc.OrganizationId = orgff.SchoolOrganizationId
		JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgcs.OrganizationCalendarId = orgc.OrganizationCalendarId
		WHERE orgff.SchoolOrganizationId IS NOT NULL
			AND orgff.SchoolYear = @SchoolYear
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12SchoolImprovement', NULL, 'S01EC2090'
	END CATCH
	--==================

	--------------------------------------
	-- Add 'McKinney-Vento subgrant'
	--------------------------------------

	-- [ODS].[FinancialAccount] is LEA specific
	BEGIN TRY
		INSERT INTO [ODS].[FinancialAccount]
		(
			[Name]
			,[Description]
			,[FederalProgramCode]
		)
		SELECT DISTINCT o.LEA_Name + ' McKinney-Vento subgrant' 
			 , o.LEA_Name + ' McKinney-Vento subgrant' 
			 , '84.196'
		FROM Staging.Organization o
		INNER JOIN 	ODS.OrganizationIdentifier orgid 
			ON o.LEA_Identifier_State = orgid.Identifier
		INNER JOIN 	ODS.OrganizationCalendar orgc 
			ON orgid.OrganizationId = orgc.OrganizationId
		INNER JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgc.OrganizationCalendarId = orgcs.OrganizationCalendarId
		LEFT JOIN [ODS].[FinancialAccount] fa
			ON CHARINDEX(o.LEA_Name, fa.Name) > 0
		WHERE o.LEA_McKinneyVentoSubgrantRecipient = 1
			AND fa.FinancialAccountId  IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.FinancialAccount', NULL, 'S01EC2100'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationFinancial]
		(
			[FinancialAccountId]
			,[OrganizationCalendarSessionId]
		)
		SELECT DISTINCT fa.FinancialAccountId
		 , orgcs.OrganizationCalendarSessionId
		FROM Staging.Organization o
		INNER JOIN 	ODS.OrganizationIdentifier orgid 
			ON o.LEA_Identifier_State = orgid.Identifier
		INNER JOIN 	ODS.OrganizationCalendar orgc 
			ON orgid.OrganizationId = orgc.OrganizationId
		INNER JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgc.OrganizationCalendarId = orgcs.OrganizationCalendarId
		INNER JOIN [ODS].[FinancialAccount] fa
			ON CHARINDEX(o.LEA_Name, fa.Name) > 0
		LEFT JOIN [ODS].[OrganizationFinancial] orgf 
			ON orgf.OrganizationCalendarSessionId = orgcs.OrganizationCalendarSessionId
			AND orgf.FinancialAccountId = fa.FinancialAccountId
		WHERE o.LEA_McKinneyVentoSubgrantRecipient = 1
			AND orgf.OrganizationFinancialId  IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationFinancial', NULL, 'S01EC2110'
	END CATCH

		--------------------------------------
		--Insert LEA Gun Free Schools Act Reporting Status --
		--------------------------------------

		INSERT INTO [ODS].[OrganizationFederalAccountability]
        (
			[OrganizationId]
			,[RefGunFreeSchoolsActStatusReportingId]
		)
		SELECT DISTINCT 
			orgst.LEAOrganizationId
			,gunfreeType.RefGunFreeSchoolsActStatusReportingId
		FROM Staging.Organization orgst
		LEFT JOIN [ODS].[SourceSystemReferenceData] srcRef 
			ON srcRef.InputCode = orgst.LEA_GunFreeSchoolsActReportingStatus
			AND srcRef.TableName='RefGunFreeSchoolsActReportingStatus' 
			AND srcRef.SchoolYear = @SchoolYear
		LEFT JOIN [ODS].[RefGunFreeSchoolsActReportingStatus] gunfreeType 
			ON gunfreeType.Code = srcRef.OutputCode

		--------------------------------------
		--Insert School Gun Free Schools Act Reporting Status --
		--------------------------------------

		INSERT INTO [ODS].[OrganizationFederalAccountability]
        (
			[OrganizationId]
			,[RefGunFreeSchoolsActStatusReportingId]
			,[RefReconstitutedStatusId]
		)
		SELECT DISTINCT 
			orgst.SchoolOrganizationId
			,gunfreeType.RefGunFreeSchoolsActStatusReportingId
			,recon.RefReconstitutedStatusId
		FROM Staging.Organization orgst
		LEFT JOIN [ODS].[SourceSystemReferenceData] srcRef 
			ON srcRef.InputCode = orgst.School_GunFreeSchoolsActReportingStatus
			AND srcRef.TableName='RefGunFreeSchoolsActReportingStatus' 
			AND srcRef.SchoolYear = @SchoolYear
		LEFT JOIN [ODS].[RefGunFreeSchoolsActReportingStatus] gunfreeType 
			ON gunfreeType.Code = srcRef.OutputCode

		LEFT JOIN [ODS].[SourceSystemReferenceData] ssrecon 
			ON ssrecon.InputCode = orgst.School_ReconstitutedStatus
			AND ssrecon.TableName='RefReconstitutedStatus' 
			AND ssrecon.SchoolYear = @SchoolYear
		LEFT JOIN [ODS].[RefReconstitutedStatus] recon 
			ON recon.Code = ssrecon.OutputCode

		--------------------------------------
		--Insert RefReconstituted Status --
		--------------------------------------

		--INSERT INTO [ODS].[OrganizationFederalAccountability]
  --      (
		--	[OrganizationId]
		--	,[RefReconstitutedStatusId]
		--)
		--SELECT DISTINCT 
		--	orgst.LEAOrganizationId
		--	,recon.RefReconstitutedStatusId
		--FROM Staging.Organization orgst
		--JOIN [ODS].[RefReconstitutedStatus] recon 
		--	ON recon.Code = orgst.School_ReconstitutedStatus

	--------------------------------------
	--Insert Cheif State School Officer --
	--------------------------------------

	CREATE TABLE #PersonIdtoPersonIdentifier 
		(PersonID INT
		,Identifier VARCHAR(50))

	BEGIN TRY
		MERGE INTO [ODS].[Person] as tgt
		USING Staging.StateDetail as nisl
		ON 1 = 2  --guarantees no matches
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (PersonMasterId)
		  VALUES(NULL)
		  OUTPUT INSERTED.PersonID, nisl.SeaContact_Identifier INTO #PersonIdtoPersonIdentifier;
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Person', NULL, 'S01EC2120'
	END CATCH

	BEGIN TRY
		UPDATE Staging.StateDetail
		SET PersonId = pt.PersonID
		FROM Staging.StateDetail nisl
		JOIN #PersonIdtoPersonIdentifier pt ON nisl.SeaContact_Identifier = pt.Identifier
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.StateDetail', 'PersonId', 'S01EC2130'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[PersonDetail]
				   ([PersonId]
				   ,[FirstName]
				   ,[MiddleName]
				   ,[LastName]
				   ,[GenerationCode]
				   ,[Prefix]
				   ,[Birthdate]
				   ,[RefSexId]
				   ,[HispanicLatinoEthnicity]
				   ,[RefUSCitizenshipStatusId]
				   ,[RefVisaTypeId]
				   ,[RefStateOfResidenceId]
				   ,[RefProofOfResidencyTypeId]
				   ,[RefHighestEducationLevelCompletedId]
				   ,[RefPersonalInformationVerificationId]
				   ,[BirthdateVerification]
				   ,[RefTribalAffiliationId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					PersonId [PersonId]
				   ,SeaContact_FirstName [FirstName]
				   ,NULL [MiddleName]
				   ,SeaContact_LastOrSurname [LastName]
				   ,NULL [GenerationCode]
				   ,SeaContact_PersonalTitleOrPrefix [Prefix]
				   ,NULL [Birthdate]
				   ,NULL [RefSexId]
				   ,NULL [HispanicLatinoEthnicity]
				   ,NULL [RefUSCitizenshipStatusId]
				   ,NULL [RefVisaTypeId]
				   ,NULL [RefStateOfResidenceId]
				   ,NULL [RefProofOfResidencyTypeId]
				   ,NULL [RefHighestEducationLevelCompletedId]
				   ,NULL [RefPersonalInformationVerificationId]
				   ,NULL [BirthdateVerification]
				   ,NULL [RefTribalAffiliationId]
				   ,App.GetFiscalYearStartDate(@SchoolYear) [RecordStartDateTime]
				   ,App.GetFiscalYearEndDate(@SchoolYear) [RecordEndDateTime]
		FROM Staging.StateDetail
		WHERE SeaContact_FirstName IS NOT NULL
		AND SeaContact_FirstName <> ''
		AND SeaContact_LastOrSurname IS NOT NULL
		AND SeaContact_LastOrSurname <> ''
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.PersonDetail', NULL, 'S01EC2140'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[PersonEmailAddress]
				   ([PersonId]
				   ,[EmailAddress]
				   ,[RefEmailTypeId])
		SELECT DISTINCT
					PersonId [PersonId]
				   ,SeaContact_ElectronicMailAddress [EmailAddress]
				   ,(SELECT RefEmailTypeId FROM ODS.RefEmailType WHERE Code = 'Work') [RefEmailTypeId]
		FROM Staging.StateDetail
		WHERE SeaContact_ElectronicMailAddress IS NOT NULL
		AND SeaContact_ElectronicMailAddress <> ''
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.PersonEmailAddress', NULL, 'S01EC2150'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[PersonTelephone]
				   ([PersonId]
				   ,[TelephoneNumber]
				   ,[PrimaryTelephoneNumberIndicator]
				   ,[RefPersonTelephoneNumberTypeId])
		SELECT DISTINCT
					PersonId [PersonId]
				   ,SeaContact_PhoneNumber [TelephoneNumber]
				   ,1 [PrimaryTelephoneNumberIndicator]
				   ,(SELECT RefTelephoneNumberTypeId FROM ODS.RefTelephoneNumberType WHERE Code = 'Main') [RefPersonTelephoneNumberTypeId]
		FROM Staging.StateDetail
		WHERE SeaContact_PhoneNumber IS NOT NULL
		AND SeaContact_PhoneNumber <> ''
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.PersonTelephone', NULL, 'S01EC2160'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[OrganizationPersonRole]
				   ([OrganizationId]
				   ,[PersonId]
				   ,[RoleId]
				   ,[EntryDate]
				   ,[ExitDate])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,sd.PersonId [PersonId]
				   ,(SELECT RoleId FROM ODS.Role WHERE Name = 'Chief State School Officer') [RoleId]
				   ,App.GetFiscalYearStartDate(@SchoolYear) [EntryDate]
				   ,App.GetFiscalYearEndDate(@SchoolYear) [ExitDate]
		FROM Staging.StateDetail sd
		JOIN ODS.OrganizationDetail orgd ON sd.SeaName = orgd.Name
		JOIN ODS.RefOrganizationType rot ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
		WHERE Code = 'SEA'
		AND sd.PersonId IS NOT NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.OrganizationPersonRole', NULL, 'S01EC2170'
	END CATCH

	BEGIN TRY
		INSERT INTO [ODS].[PersonIdentifier]
				   ([PersonId]
				   ,[Identifier]
				   ,[RefPersonIdentificationSystemId]
				   ,[RefPersonalInformationVerificationId])
		SELECT DISTINCT
					PersonId [PersonId]
				   ,SeaContact_Identifier [Identifier]
				   ,(SELECT ris.RefPersonIdentificationSystemId 
					 FROM ODS.RefPersonIdentificationSystem ris JOIN ODS.RefPersonIdentifierType rit 
						ON ris.RefPersonIdentifierTypeId = rit.RefPersonIdentifierTypeId 
					 WHERE ris.Code = 'State' 
						AND rit.Code = '001074') [RefPersonIdentificationSystemId]
				   ,(SELECT RefPersonalInformationVerificationId FROM ODS.RefPersonalInformationVerification WHERE Code = '01011') [RefPersonalInformationVerificationId]
		FROM Staging.StateDetail
		WHERE PersonId IS NOT NULL
		AND SeaContact_Identifier IS NOT NULL
		AND SeaContact_Identifier <> ''
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.PersonIdentifier', NULL, 'S01EC2180'
	END CATCH

	--------------------------------------
	--Insert School Indicator Status. For now, it's only the Graduation Rate --
	-- inclluded other Statuses - AcademicAchievementIndicatorStatus and OtherAcademicIndicatorStatus
	--------------------------------------
	BEGIN TRY
		INSERT INTO [ODS].[K12SchoolIndicatorStatus] (
			[K12SchoolId]
			,[RefIndicatorStatusTypeId]
			,[RefIndicatorStateDefinedStatusId]
			,[RefIndicatorStatusSubgroupTypeId]
			,[IndicatorStatusSubgroup]
			,[IndicatorStatus]
			,[RecordStartDateTime]
			,[RecordEndDateTime]
		)
		SELECT    
			k12.K12SchoolId
			, ist.RefIndicatorStatusTypeId
			, ds.RefIndicatorStateDefinedStatusId
			, st.RefIndicatorStatusSubgroupTypeId
			, s.IndicatorStatusSubgroup
			, s.StatedDefinedIndicatorStatus
			, s.[RecordStartDateTime]
			, s.[RecordEndDateTime]
		FROM [Staging].[OrganizationSchoolIndicatorStatus] s
		JOIN Staging.Organization orgff ON s.School_Identifier_State = orgff.School_Identifier_State
		JOIN ODS.K12School k12 ON k12.OrganizationId = orgff.SchoolOrganizationId
		JOIN [ODS].[RefIndicatorStatusType] ist ON ist.Code = s.IndicatorStatusType
		JOIN [ODS].[RefIndicatorStateDefinedStatus] ds ON ds.Code = s.IndicatorStatus
		JOIN [ODS].[RefIndicatorStatusSubgroupType] st ON st.Code = s.IndicatorStatusSubgroupType
		LEFT JOIN [ODS].[K12SchoolIndicatorStatus] ks 
			ON  ks.[K12SchoolId] = k12.K12SchoolId
			AND ks.[RefIndicatorStatusTypeId] = ist.RefIndicatorStatusTypeId
			AND ks.[RefIndicatorStateDefinedStatusId] = ds.RefIndicatorStateDefinedStatusId
			AND ks.[RefIndicatorStatusSubgroupTypeId] = st.RefIndicatorStatusSubgroupTypeId
			AND ks.[IndicatorStatusSubgroup] = s.IndicatorStatusSubgroup
		WHERE ks.K12SchoolIndicatorStatusId IS NULL 
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12SchoolIndicatorStatus', NULL, 'S01EC2190'
	END CATCH

	-----------------------------------------------------------------------------------------
	--Insert School Custom Indicator Status - SchoolQualityOrStudentSuccessIndicatorStatus --
	-----------------------------------------------------------------------------------------
	BEGIN TRY
		INSERT INTO [ODS].[K12SchoolIndicatorStatus] (
			[K12SchoolId]
			,[RefIndicatorStatusTypeId]
			,[RefIndicatorStateDefinedStatusId]
			,[RefIndicatorStatusSubgroupTypeId]
			,[IndicatorStatusSubgroup]
			,[IndicatorStatus]
			,[RefIndicatorStatusCustomTypeId]
			,[RecordStartDateTime]
			,[RecordEndDateTime]
		)
		SELECT    
			k12.K12SchoolId
			, ist.RefIndicatorStatusTypeId
			, ds.RefIndicatorStateDefinedStatusId
			, st.RefIndicatorStatusSubgroupTypeId
			, s.IndicatorStatusSubgroup
			, s.StatedDefinedIndicatorStatus
			, cust.RefIndicatorStatusCustomTypeId
			, s.[RecordStartDateTime]
			, s.[RecordEndDateTime]
		FROM [Staging].[OrganizationCustomSchoolIndicatorStatusType] s
		JOIN Staging.Organization orgff ON s.School_Identifier_State = orgff.School_Identifier_State
		JOIN ODS.K12School k12 ON k12.OrganizationId = orgff.SchoolOrganizationId
		JOIN [ODS].[RefIndicatorStatusType] ist ON ist.Code = s.IndicatorStatusType
		JOIN [ODS].[RefIndicatorStateDefinedStatus] ds ON ds.Code = s.IndicatorStatus
		JOIN [ODS].[RefIndicatorStatusSubgroupType] st ON st.Code = s.IndicatorStatusSubgroupType
		JOIN [ODS].[RefIndicatorStatusCustomType] cust ON cust.Code = s.StatedDefinedCustomIndicatorStatusType
			--AND cust.RefJurisdictionId = k12.OrganizationId
		LEFT JOIN [ODS].[K12SchoolIndicatorStatus] ks 
			ON  ks.[K12SchoolId] = k12.K12SchoolId
			AND ks.[RefIndicatorStatusTypeId] = ist.RefIndicatorStatusTypeId
			AND ks.[RefIndicatorStateDefinedStatusId] = ds.RefIndicatorStateDefinedStatusId
			AND ks.[RefIndicatorStatusSubgroupTypeId] = st.RefIndicatorStatusSubgroupTypeId
			AND ks.[IndicatorStatusSubgroup] = s.IndicatorStatusSubgroup
			AND ks.[RefIndicatorStatusCustomTypeId] = cust.RefIndicatorStatusCustomTypeId 
				--AND cust.RefJurisdictionId=k12.OrganizationId
		WHERE ks.K12SchoolIndicatorStatusId IS NULL
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12SchoolIndicatorStatus', NULL, 'S01EC2200'
	END CATCH
	/*
		[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] 2018
	*/

	----------------------------------------------------------------
	-- K12SchoolStatus
	----------------------------------------------------------------
	BEGIN TRY
		----------------------------------------------------------------
		--Insert Progress Achiving English Proficency Indicator Status. 
		----------------------------------------------------------------
		INSERT INTO [ODS].[K12SchoolStatus] (
			[K12SchoolId]
			,[RefMagnetSpecialProgramId]
			,[RefProgressAchievingEnglishLanguageProficiencyIndicatorStatusId]
			,[ProgressAcheivingEnglishLearnerProficiencyStateDefinedStatus]
			,[RefTitleISchoolStatusId]
			,[ConsolidatedMepFundsStatus]
			,[RefComprehensiveAndTargetedSupportId]
			,[RefComprehensiveSupportId]
			,[RefTargetedSupportId]
			,[RefSchoolDangerousStatusId]
			,[RefVirtualSchoolStatusId]
			,[RefNSLPStatusId]
			,[RecordStartDateTime]
			,[RecordEndDateTime]
		)
		SELECT    
			k12.K12SchoolId
			,ssmagout.RefMagnetSpecialProgramId																		[RefMagnetSpecialProgramId]
			,ist.[RefProgressAchievingEnglishLanguageProficiencyIndicatorStatusId]
			,CASE
				WHEN ist.Code = 'STTDEF' THEN s.School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus
				ELSE NULL
			END
			,sst1.RefTitle1SchoolStatusId
			,s.ConsolidatedMepFundsStatus
			,cts.RefComprehensiveAndTargetedSupportId
			,cs.RefComprehensiveSupportId
			,ts.RefTargetedSupportId
			,sd.RefSchoolDangerousStatusId
			,vir.RefVirtualSchoolStatusId
			,nslp.RefNSLPStatusId
			,App.GetFiscalYearStartDate(@SchoolYear) [RecordStartDateTime]
			,App.GetFiscalYearEndDate(@SchoolYear) [RecordEndDateTime]		
		FROM [Staging].[Organization] s
		JOIN Staging.Organization orgff 
			ON s.School_Identifier_State = orgff.School_Identifier_State
		JOIN ODS.K12School k12 
			ON k12.OrganizationId = orgff.SchoolOrganizationId
		LEFT JOIN [ODS].[RefProgressAchievingEnglishLanguageProficiencyIndicatorStatus] ist 
			ON ist.Code = s.School_ProgressAchievingEnglishLanguageProficiencyIndicatorStatus

		LEFT JOIN ODS.SourceSystemReferenceData ssrd
			ON ssrd.InputCode = s.TitleIPartASchoolDesignation 
			AND ssrd.TableName = 'RefTitleISchoolStatus'
			AND ssrd.SchoolYear = @SchoolYear
		LEFT JOIN [ODS].[RefTitleISchoolStatus] sst1 
			ON sst1.Code = ssrd.OutputCode

		LEFT JOIN [ODS].[RefComprehensiveAndTargetedSupport] cts 
			ON cts.Code = s.School_ComprehensiveAndTargetedSupport
		LEFT JOIN [ODS].[RefComprehensiveSupport] cs 
			ON cs.Code = s.School_ComprehensiveSupport
		LEFT JOIN [ODS].[RefTargetedSupport] ts 
			ON ts.Code = s.School_TargetedSupport
		LEFT JOIN [ODS].[RefSchoolDangerousStatus] sd 
			ON sd.Code = orgff.School_SchoolDangerousStatus
		-- MAGNET SCHOOL
		LEFT JOIN ODS.SourceSystemReferenceData ssmagnet
			ON ssmagnet.InputCode = s.School_MagnetOrSpecialProgramEmphasisSchool 
			AND ssmagnet.TableName = 'RefMagnetSpecialProgram'
			AND ssmagnet.SchoolYear = @SchoolYear
		LEFT JOIN [ODS].RefMagnetSpecialProgram ssmagout 
			ON ssmagout.Code = ssmagnet.OutputCode
		LEFT JOIN ODS.RefVirtualSchoolStatus vir 
			ON vir.Code = s.School_VirtualSchoolStatus
		LEFT JOIN ODS.RefNSLPStatus nslp 
			ON nslp.Code = s.School_NationalSchoolLunchProgramStatus
		LEFT JOIN [ODS].[K12SchoolStatus] ks 
			ON  ks.[K12SchoolId] = k12.K12SchoolId
		WHERE ks.K12SchoolStatusId IS NULL

		UPDATE ks
		SET 
			[RefTitleISchoolStatusId] = sst1.RefTitle1SchoolStatusId
			,[RefComprehensiveAndTargetedSupportId] = cts.RefComprehensiveAndTargetedSupportId
			,[RefComprehensiveSupportId] = cs.RefComprehensiveSupportId
			,[RefTargetedSupportId] = ts.RefTargetedSupportId
			,[RefSchoolDangerousStatusId] = sd.RefSchoolDangerousStatusId
		FROM [Staging].[OrganizationSchoolComprehensiveAndTargetedSupport] s
		JOIN Staging.Organization orgff 
			ON s.School_Identifier_State = orgff.School_Identifier_State
		JOIN ODS.K12School k12 
			ON k12.OrganizationId = orgff.SchoolOrganizationId
		JOIN [ODS].[K12SchoolStatus] ks 
			ON  ks.[K12SchoolId] = k12.K12SchoolId

		LEFT JOIN ODS.SourceSystemReferenceData ssrd
			ON ssrd.InputCode = orgff.TitleIPartASchoolDesignation 
			AND ssrd.TableName = 'RefTitleISchoolStatus'
			AND ssrd.SchoolYear = @SchoolYear
		LEFT JOIN [ODS].[RefTitleISchoolStatus] sst1 
			ON sst1.Code = ssrd.OutputCode

		LEFT JOIN [ODS].[RefComprehensiveAndTargetedSupport] cts 
			ON cts.Code = s.School_ComprehensiveAndTargetedSupport
		LEFT JOIN [ODS].[RefComprehensiveSupport] cs 
			ON cs.Code = s.School_ComprehensiveSupport
		LEFT JOIN [ODS].[RefTargetedSupport] ts 
			ON ts.Code = s.School_TargetedSupport
		LEFT JOIN [ODS].[RefSchoolDangerousStatus] sd 
			ON sd.Code = orgff.School_SchoolDangerousStatus
	END TRY

	BEGIN CATCH
		EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.K12SchoolStatus', NULL, 'S01EC2200'
	END CATCH
	--Drop all temporary tables--
	DROP TABLE #existing_organizationlocation
	DROP TABLE #PersonIdtoPersonIdentifier

	SET nocount OFF;

	--rollback
END