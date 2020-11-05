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
	@SchoolYear SMALLINT
AS


--    /*************************************************************************************************************
--    Date Created:  5/21/2018

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
--      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization];
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


	BEGIN TRY
	
		set nocount on;

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

		SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear);
			
		SET @RecordEndDate = App.GetFiscalYearEndDate(@SchoolYear);

		SET @UpdateDateTime = GETDATE()



		---Begin Housekeeping items on the temp table---

		--This section ensures that if state identifers change for the LEA or School and the source data does not contain the old identifier, the change is still
		--picked up by using the NCES ID as the crosswalk between the old and the new.

		--This update statement looks for a new state LEA Identifier using the NCES Id as the crosswalk between the temporary table Identifier and the Identifier
		--already stored in the ODS.OrganizationIdentifier table.  If they are different and the LEA_Identifier_State_Identifier_Old column in the staging table
		--is NULL, it will mark it with the Identifier stored in the ODS and will later end date that identifier and replace it with the new one.
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

		--This update statement looks for a new state School Identifier using the NCES Id as the crosswalk between the temporary table Identifier and the Identifier
		--already stored in the ODS.OrganizationIdentifier table.  If they are different and the School_Identifier_State_Identifier_Old column in the temp table
		--is NULL, it will mark it with the Identifier stored in the ODS and will later enddate that identifier and replace it with the new one.
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

		--Update the Bit value to indicate that an identifier has changed.
		UPDATE Staging.Organization SET LEA_Identifier_State_ChangedIdentifier = 1 WHERE LEA_Identifier_State_Identifier_Old IS NOT NULL
		UPDATE Staging.Organization SET School_Identifier_State_ChangedIdentifier = 1 WHERE School_Identifier_State_Identifier_Old IS NOT NULL



        /* Load the Department of Education SEA Specific Information
		--------------------------------------------------------------
		This infomration is specific to the SEA only and normally does not
		change. It is set up to load once and then with an IF/THEN statement
		is ignored from thereon so long as the data exist in the ODS
		
		*/

		-------------------------------------------------------------------
		----Create SEA Organization Data ----------------------------------
		-------------------------------------------------------------------

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

			--Insert StateANSICode into ODS.OrganizationIdentifier
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
			JOIN ODS.RefStateANSICode rsa
				ON rsa.StateName = sd.StateName

		-- The SEA Organization already exists,
		-- so grab the org ID.
		END ELSE BEGIN 
			UPDATE Staging.StateDetail 
			SET OrganizationId = od.OrganizationId
			FROM ODS.OrganizationDetail od 
			JOIN Staging.StateDetail sd 
				ON od.[Name] = sd.SeaName
		END

		UPDATE Staging.Organization 
		SET SEAOrganizationId = sd.OrganizationId 
		FROM Staging.StateDetail sd
		
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

		UPDATE Staging.Organization
		SET LEAOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
		AND tod.LEA_Identifier_State_ChangedIdentifier = 0

		UPDATE Staging.Organization
		SET LEAOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.LEA_Identifier_State_Identifier_Old = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
		AND tod.LEA_Identifier_State_ChangedIdentifier = 1

		--Insert new LEAs--
		--Get a distinct list of LEA IDs that need to be inserted 
		--so that we can use a MERGE properly.		
		DECLARE @DistinctNewLeas TABLE (
			  LEA_Identifier_State VARCHAR(100)
			, LEA_Identifier_NCES VARCHAR(100)
			, LEA_Name VARCHAR(100)
			, OrganizationId INT NULL
		)

		INSERT INTO @DistinctNewLeas
		SELECT DISTINCT 
			  LEA_Identifier_State
			, LEA_Identifier_NCES
			, LEA_Name
			, NULL
		FROM Staging.Organization
		WHERE LeaOrganizationId IS NULL

		--This table captures the Staging.LEA_Identifier_State 
		--and the new OrganizationId from ODS.Organization 
		--so that we can create the child records.
		DECLARE @NewLeaOrganization TABLE (
			  OrganizationId INT
			, LEA_Identifier_State VARCHAR(100)
		)

		MERGE ODS.Organization AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON 1 = 0 -- always insert 
		WHEN NOT MATCHED THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.LEA_Identifier_State
		INTO @NewLeaOrganization;

		UPDATE Staging.Organization
		SET   LeaOrganizationId = norg.OrganizationId
			, NewLea = 1
		FROM Staging.Organization o
		JOIN @NewLeaOrganization norg
			ON o.LEA_Identifier_State = norg.LEA_Identifier_State

		UPDATE @DistinctNewLeas
		SET OrganizationId = o.LeaOrganizationId
		FROM Staging.Organization o
		JOIN @DistinctNewLeas norg
			ON o.Lea_Identifier_State = norg.Lea_Identifier_State


		--Update LEA names by end dating the 
		--current OrganizationDetail record and creating a new one
		UPDATE ods.OrganizationDetail
		SET RecordEndDateTime = @UpdateDateTime
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.LeaOrganizationId = od.OrganizationId
			AND o.Lea_Name <> od.[Name]
			AND od.RecordEndDateTime IS NULL

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

		

 /* Cannot uncomment this until we have the RecordStartDateTime and RecordEndDateTime in the OrganizationIdentifier table
		--Update LEAs that have changed State Identifiers
		IF (SELECT COUNT(*) FROM Staging.Organization WHERE LEA_Identifier_State_ChangedIdentifier = 1) > 0
			BEGIN
			--Only need to end date Identifiers here. The new identifier is added further below.

				UPDATE ODS.OrganizationIdentifier
				SET RecordEndDateTime = DATEADD(yy, -1, @RecordEndDate)
				FROM ODS.Identifier id
				JOIN Staging.Organization tod ON id.Identifier = tod.LEA_Identifier_State_Identifier_Old
				WHERE id.RefOrganizationIdentificationSystemId = @[App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
				AND id.RefOrganizationIdentifierTypeId = @[App].[GetOrganizationIdentifierTypeId]('001072')
				AND tod.LEA_Identifier_State_ChangedIdentifier = 1

				INSERT INTO [ODS].[OrganizationIdentifier]
						   ([Identifier]
						   ,[RefOrganizationIdentificationSystemId]
						   ,[OrganizationId]
						   ,[RefOrganizationIdentifierTypeId])
						   ---Need the RecordStartDateTime added
				SELECT DISTINCT
							tod.LEA_Identifier_State [Identifier]
						   ,@[App].[GetOrganizationIdentifierSystemId]('SEA', '001072') AS [RefOrganizationIdentificationSystemId]
						   ,orgd.OrganizationId [OrganizationId]
						   ,@[App].[GetOrganizationIdentifierTypeId]('001072') as [RefOrganizationIdentifierTypeId]
				FROM ODS.OrganizationDetail orgd
				JOIN Staging.Organization tod ON orgd.OrganizationId = tod.LEAOrganizationId
				WHERE tod.LEA_Identifier_State_ChangedIdentifier = 1

			END

			---Add in if the Identifer (School or LEA) does not exist in the source data anymore, then end date it. but need to figure out which one is the new identifier.  Use the NCES ID to do this.
			---Last year compared to this year -- put in - difference between closed and identifier change -- consider this --- cause Ed-Fi supplies closed.

*/



		--Insert K12 Schools into ODS.Organization--
		DECLARE @NewOrganization TABLE (
			  OrganizationId INT
			, SourceId INT
		)


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

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET SchoolOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		
		--Update School names by end dating the 
		--current OrganizationDetail record and creating a new one
		UPDATE ods.OrganizationDetail
		SET RecordEndDateTime = @UpdateDateTime
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.SchoolOrganizationId = od.OrganizationId
			AND o.School_Name <> od.[Name]
			AND od.RecordEndDateTime IS NULL

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




		--Create a Special Education Program for each ODS.Organization (School)---------

		--First check to see if Special Education Program already exists so that it is not created a second time--

		UPDATE Staging.Organization
		SET SpecialEducationProgramOrganizationId = orgd2.OrganizationId
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

		--Insert new Special Education Programs--

		DELETE FROM @NewOrganization;

		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.SpecialEducationProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET SpecialEducationProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.SpecialEducationProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.SpecialEducationProgramOrganizationId
				, 'Special Education Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
				  
		UPDATE Staging.Organization
		SET   SpecialEducationProgramOrganizationId = norg.OrganizationId
			, NewSpecialEducationProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId


		--Create a Title I Program for each ODS.Organization (School)---------

		--First check to see if Title I Program already exists so that it is not created a second time--

		UPDATE Staging.Organization
		SET TitleIProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Title I Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')

		--Insert new Title I Programs--

		DELETE FROM @NewOrganization;

		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.TitleIProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET TitleIProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.TitleIProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.TitleIProgramOrganizationId
				, 'Title I Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
				  
		UPDATE Staging.Organization
		SET   TitleIProgramOrganizationId = norg.OrganizationId
			, NewTitleIProgram= 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId


		--Create a Migrant Program for each ODS.Organization (School)---------

		--First check to see if Migrant Program already exists so that it is not created a second time--

		UPDATE Staging.Organization
		SET MigrantProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Migrant Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')

		--Insert new Migrant Programs--

		DELETE FROM @NewOrganization;

		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.MigrantProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET MigrantProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.MigrantProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.MigrantProgramOrganizationId
				, 'Migrant Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
				  
		UPDATE Staging.Organization
		SET   MigrantProgramOrganizationId = norg.OrganizationId
			, NewMigrantProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId


		--Create a Foster Program for each ODS.Organization (School)---------

		--First check to see if Foster Program already exists so that it is not created a second time--

		UPDATE Staging.Organization
		SET FosterProgramOrganizationId = orgd2.OrganizationId
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

		--Insert new Foster Programs--

		DELETE FROM @NewOrganization;

		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.FosterProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET FosterProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.FosterProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.FosterProgramOrganizationId
				, 'Foster Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
				  
		UPDATE Staging.Organization
		SET   FosterProgramOrganizationId = norg.OrganizationId
			, NewFosterProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId



		----------------------------------------------------------------------
		--INSERT State/LEA/K12 School into ODS.OrganizationIdentifier---------
		----------------------------------------------------------------------

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


		--Insert LEA/K12/SEA relationships into ODS.OrganizationRelationiship---------

		--First check to see if the relationship already exists and put the OrganizationRelationshipId back into the temp table
		UPDATE Staging.Organization
		SET SEAToLEA_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEAOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET LEAToSchool_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SchoolOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET SchoolToSpecialEducationProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SpecialEducationProgramOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET SchoolToTitleIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.TitleIProgramOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET SchoolToMigrantProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.MigrantProgramOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET SchoolToFosterProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.FosterProgramOrganizationId = orgr.OrganizationId


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

		UPDATE Staging.Organization
		SET SEAToLEA_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEAOrganizationId = orgr.OrganizationId
		AND tod.SEAToLEA_OrganizationRelationshipId IS NULL

		--Create relationship between LEA and K12 School--

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

		UPDATE Staging.Organization
		SET LEAToSchool_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SchoolOrganizationId = orgr.OrganizationId
		AND tod.LEAToSchool_OrganizationRelationshipId IS NULL


		--Create relationship between K12 School and Special Education Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.SpecialEducationProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToSpecialEducationProgram_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET SchoolToSpecialEducationProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SpecialEducationProgramOrganizationId = orgr.OrganizationId

		--Create relationship between K12 School and Title I Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.TitleIProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToTitleIProgram_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET SchoolToTitleIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.TitleIProgramOrganizationId = orgr.OrganizationId

		--Create relationship between K12 School and Migrant Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.MigrantProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToMigrantProgram_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET SchoolToMigrantProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.MigrantProgramOrganizationId = orgr.OrganizationId

		--Create relationship between K12 School and Foster Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.FosterProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToFosterProgram_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET SchoolToFosterProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.FosterProgramOrganizationId = orgr.OrganizationId

		-----------------------------------------------------------------------------------
		----Create SpecialEducationOrganizationProgramType --------------------------------
		-----------------------------------------------------------------------------------

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


		-----------------------------------------------------------------------------------
		----Create TitleIOrganizationProgramType ------------------------------------------
		-----------------------------------------------------------------------------------

		----Need to modify the 09999 code to match the Title I Program code when the Title I
		----program code is added to the RefProgramType table.

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


		-----------------------------------------------------------------------------------
		----Create MigrantOrganizationProgramType -----------------------------------------
		-----------------------------------------------------------------------------------

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


		-----------------------------------------------------------------------------------
		----Create FosterOrganizationProgramType -----------------------------------------
		-----------------------------------------------------------------------------------

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


		--Update the smaller temporary tables to contain the OrganizationId
		--Need to move this down below where we add the school or they won't have IDs yet.
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = oi.OrganizationId
		FROM Staging.StateDetail oi
		JOIN Staging.OrganizationAddress toda ON oi.SeaStateIdentifier = toda.OrganizationIdentifier
		WHERE toda.OrganizationType = App.GetOrganizationTypeId('SEA', '001156')

		UPDATE Staging.OrganizationAddress
		SET OrganizationId = tod.LEAOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationAddress toda ON tod.LEA_Identifier_State = toda.OrganizationIdentifier
		WHERE toda.OrganizationType = App.GetOrganizationTypeId('LEA', '001156')

		UPDATE Staging.OrganizationAddress
		SET OrganizationId = tod.SchoolOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationAddress toda ON tod.School_Identifier_State = toda.OrganizationIdentifier
		WHERE toda.OrganizationType = App.GetOrganizationTypeId('K12School', '001156')

		UPDATE Staging.OrganizationPhone
		SET OrganizationId = sd.OrganizationId
		FROM Staging.StateDetail sd
		JOIN Staging.OrganizationPhone todp ON sd.SeaStateIdentifier = todp.OrganizationIdentifier
		WHERE todp.OrganizationType = App.GetOrganizationTypeId('SEA', '001156')

		UPDATE Staging.OrganizationPhone
		SET OrganizationId = tod.LEAOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationPhone todp ON tod.LEA_Identifier_State = todp.OrganizationIdentifier
		WHERE todp.OrganizationType = App.GetOrganizationTypeId('LEA', '001156')

		UPDATE Staging.OrganizationPhone
		SET OrganizationId = tod.SchoolOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationPhone todp ON tod.School_Identifier_State = todp.OrganizationIdentifier
		WHERE todp.OrganizationType = App.GetOrganizationTypeId('K12School', '001156')

		UPDATE Staging.OrganizationGradeOffered
		SET OrganizationId = tod.SchoolOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationGradeOffered todgo ON tod.School_Identifier_State = todgo.OrganizationIdentifier

		-------------------------------------------------------------------
		----Create OrganizationWebsite ------------------------------------
		-------------------------------------------------------------------

		--Organizaton Website needs its own Primary Key and RecordStartDateTime and RecordEndDateTime

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

		-------------------------------------------------------------------
		----Create OrganizationOperationalStatus --------------------------
		-------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationOperationalStatus]
					([OrganizationId]
					,[RefOperationalStatusId]
					,[OperationalStatusEffectiveDate])
		SELECT DISTINCT
					 tod.LEAOrganizationId [OrganizationId]
					,ros.RefOperationalStatusId [RefOperationalStatusId]
					,tod.LEA_OperationalStatusEffectiveDate [OperationalStatusEffectiveDate]
		FROM Staging.Organization tod
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.LEA_OperationalStatus = osss.InputCode
			AND osss.TableName = 'RefOperationalStatus'
			AND osss.SchoolYear = @SchoolYear
		JOIN ods.RefOperationalStatus ros
			ON osss.OutputCode = ros.Code
		LEFT JOIN ODS.OrganizationOperationalStatus orgs 
			ON tod.LEAOrganizationId = orgs.OrganizationId
			AND ros.RefOperationalStatusId = orgs.RefOperationalStatusId
			AND tod.LEA_OperationalStatusEffectiveDate = orgs.OperationalStatusEffectiveDate
		WHERE tod.LEA_OperationalStatus IS NOT NULL
			AND tod.LEA_OperationalStatus <> ''
			AND orgs.OrganizationId IS NULL

		INSERT INTO [ODS].[OrganizationOperationalStatus]
					([OrganizationId]
					,[RefOperationalStatusId]
					,[OperationalStatusEffectiveDate])
		SELECT DISTINCT
					 tod.SchoolOrganizationId [OrganizationId]
					,ros.RefOperationalStatusId [RefOperationalStatusId]
					,tod.School_OperationalStatusEffectiveDate [OperationalStatusEffectiveDate]
		FROM Staging.Organization tod
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.School_OperationalStatus = osss.InputCode
			AND osss.TableName = 'RefOperationalStatus'
			AND osss.SchoolYear = @SchoolYear
		JOIN ods.RefOperationalStatus ros
			ON osss.OutputCode = ros.Code
		LEFT JOIN ODS.OrganizationOperationalStatus orgs 
			ON tod.SchoolOrganizationId = orgs.OrganizationId
			AND ros.RefOperationalStatusId = orgs.RefOperationalStatusId
			AND tod.School_OperationalStatusEffectiveDate = orgs.OperationalStatusEffectiveDate
		WHERE tod.School_OperationalStatus IS NOT NULL
			AND tod.School_OperationalStatus <> ''
			AND orgs.OrganizationId IS NULL


		-------------------------------------------------------------------
		----Create K12LEA and K12School -----------------------------------
		-------------------------------------------------------------------
					   
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
				    ,CASE tod.LEA_CharterSchoolIndicator
						WHEN 'College/University Charter' THEN 1
						WHEN 'Not a Charter School' THEN 0
						WHEN 'Open Enrollment' THEN 1
						WHEN 'School Charter' THEN 1
 				     END AS [CharterSchoolIndicator]
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

		--Need to Add RecordStartDate and RecordEndDateTime to the K12Lea table--
		--AND NOT EXISTS (SELECT 'X' FROM ODS.K12Lea kl WHERE tod.LEAOrganizationId = kl.OrganizationId
		--												AND kl.RecordStartDateTime = @RecordStartDate
		--												AND kl.RecordEndDateTime = @RecordEndDate)	 

		INSERT INTO [ODS].[K12School]
				   ([OrganizationId]
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
				   ,[K12CharterSchoolManagementOrganizationId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime]
				   )
		SELECT DISTINCT
				    tod.SchoolOrganizationId [OrganizationId]
				   ,rst.RefSchoolTypeId [RefSchoolTypeId]
				   ,NULL [RefSchoolLevelId] --Do we need this?
				   ,NULL [RefAdministrativeFundingControlId]
				   ,CASE School_CharterSchoolIndicator
						WHEN 'College/University Charter' THEN 1
						WHEN 'Not a Charter School' THEN 0
						WHEN 'Open Enrollment' THEN 1
						WHEN 'School Charter' THEN 1
 				    END AS [CharterSchoolIndicator]
				   ,NULL [RefCharterSchoolTypeId]
				   ,NULL [RefIncreasedLearningTimeTypeId]
				   ,NULL [RefStatePovertyDesignationId]
				   ,NULL [CharterSchoolApprovalYear]
				   ,NULL [K12CharterSchoolApprovalAgencyId]
				   ,NULL [AccreditationAgencyName]
				   ,NULL [CharterSchoolOpenEnrollmentIndicator]
				   ,NULL [CharterSchoolContractApprovalDate]
				   ,NULL [CharterSchoolContractIdNumber]
				   ,NULL [CharterSchoolContractRenewalDate]
				   ,NULL [K12CharterSchoolManagementOrganizationId]
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
			AND ks.RecordEndDateTime = @RecordStartDate
			AND ks.RecordEndDateTime = @RecordEndDate
		WHERE ks.K12SchoolId IS NULL


		-------------------------------------------------------------------
		----Create Grades Offered -----
		-------------------------------------------------------------------
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
			

		-------------------------------------------------------------------
		----Create Location, OrganizationLocation and LocationAddress -----
		-------------------------------------------------------------------


		-------Check for existing address first--------

		---Update the OrganizationId on the temporary table
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = orgid.OrganizationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.OrganizationIdentifier = orgid.Identifier
		WHERE tod.OrganizationType = App.GetOrganizationTypeId('SEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001491')

		UPDATE Staging.OrganizationAddress
		SET OrganizationId = orgid.OrganizationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.OrganizationIdentifier = orgid.Identifier
		WHERE tod.OrganizationType = App.GetOrganizationTypeId('LEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')

		UPDATE Staging.OrganizationAddress
		SET OrganizationId = orgid.OrganizationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.OrganizationIdentifier = orgid.Identifier
		WHERE tod.OrganizationType = App.GetOrganizationTypeId('K12School', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')

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

		--still need to address where the address exists but doesn't match and we have no way to end date it or start date it--
		--This cannot be done until the ODS is updated with the RecordStartDateTime and RecordEndDateTime on OrganizationLocation--
		--Until that is addressed, we will drop all non matching records with the same AddressTypeForOrganization that we are trying
		--to add new below--

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

		DELETE FROM ODS.LocationAddress WHERE LocationId IN (SELECT LocationId FROM #existing_organizationlocation WHERE MarkForDeletion = 1)
		DELETE FROM ODS.OrganizationLocation WHERE LocationId IN (SELECT LocationId FROM #existing_organizationlocation WHERE MarkForDeletion = 1)
		DELETE FROM ODS.Location WHERE LocationId IN (SELECT LocationId FROM #existing_organizationlocation WHERE MarkForDeletion = 1)

		WHILE (SELECT COUNT(*) FROM Staging.OrganizationAddress WHERE LocationId IS NULL) > 0
			BEGIN

				SET @ID = (SELECT TOP 1 ID FROM Staging.OrganizationAddress WHERE LocationId IS NULL)
				
				INSERT INTO [ODS].[Location] DEFAULT VALUES
				SET @LocationId = SCOPE_IDENTITY();

				UPDATE Staging.OrganizationAddress SET LocationId = @LocationId WHERE ID = @ID

			END

		INSERT INTO [ODS].[OrganizationLocation]
					([OrganizationId]
					,[LocationId]
					,[RefOrganizationLocationTypeId])
		SELECT DISTINCT
					tod.OrganizationId [OrganizationId]
					,tod.LocationId [LocationId]
					,rolt.RefOrganizationLocationTypeId [RefOrganizationLocationTypeId]
		FROM Staging.OrganizationAddress tod
		JOIN ODS.SourceSystemReferenceData oltss
			ON tod.AddressTypeForOrganization = oltss.InputCode
			AND oltss.TableName = 'RefOrganizationLocationType'
			AND oltss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationLocationType rolt
			ON oltss.OutputCode = rolt.Code
		LEFT JOIN ods.OrganizationLocation ol
			ON ol.OrganizationId = tod.OrganizationId
			AND ol.LocationId = tod.locationId
		WHERE tod.OrganizationId IS NOT NULL
			AND tod.LocationId IS NOT NULL
			AND ol.OrganizationId IS NULL

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

		-------------------------------------------------------------------
		----Create OrganizationCalendar and OrganizationCalendarSession----
		-------------------------------------------------------------------

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
		JOIN ODS.OrganizationIdentifier orgid ON orgd.OrganizationId = orgid.OrganizationId
		JOIN ODS.RefOrganizationType rot ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
		JOIN ODS.RefOrganizationIdentificationSystem rois ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		LEFT JOIN ODS.OrganizationCalendar orgc 
			ON orgd.OrganizationId = orgc.OrganizationId
			AND orgc.CalendarYear = @SchoolYear
		WHERE rot.Code = 'K12School'
		AND rois.Code = 'SEA'
		AND orgc.OrganizationCalendarId IS NULL

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
		JOIN ODS.OrganizationIdentifier orgid ON orgd.OrganizationId = orgid.OrganizationId
		JOIN ODS.RefOrganizationType rot ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
		JOIN ODS.RefOrganizationIdentificationSystem rois ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		LEFT JOIN ODS.OrganizationCalendar orgc 
			ON orgd.OrganizationId = orgc.OrganizationId
			AND orgc.CalendarYear = @SchoolYear
		WHERE rot.Code = 'LEA'
		AND rois.Code = 'SEA'
		AND orgc.OrganizationCalendarId IS NULL

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
				   ,NULL [RefSessionTypeId]
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

		-------------------------------------------------------------------
		----Move Organization Financial Data Into Appropriate Tables ------
		-------------------------------------------------------------------

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
		JOIN ODS.RefOrganizationType rot 
			ON orgff.OrganizationType = rot.RefOrganizationTypeId
		JOIN ODS.RefOrganizationIdentificationSystem rois 
			ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		WHERE rot.Code = 'LEA'
		AND rois.Code = 'SEA'


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
				   ,orgff.FederalProgramCode [FederalProgramCode]
				   ,NULL [RefFederalProgramFundingAllocationTypeId]
				   ,orgff.FederalProgramsFundingAllocation [FederalProgramsFundingAllocation]
				   ,NULL [FundsTransferAmount]
				   ,NULL [SchoolImprovementAllocation]
				   ,NULL [LeaTransferabilityOfFunds]
				   ,NULL [RefLeaFundsTransferTypeId]
				   ,NULL [SchoolImprovementReservedPercent]
				   ,NULL [SesPerPupilExpenditure]
				   ,NULL [NumberOfImmigrantProgramSubgrants]
				   ,NULL [RefReapAlternativeFundingStatusId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,@RecordEndDate [RecordEndDateTime]
		FROM Staging.OrganizationFederalFunding orgff
		JOIN ODS.OrganizationIdentifier orgid 
			ON orgff.OrganizationIdentifier = orgid.Identifier
		JOIN ODS.OrganizationCalendar orgc 
			ON orgid.OrganizationId = orgc.OrganizationId
		JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgc.OrganizationCalendarId = orgcs.OrganizationCalendarId
		JOIN ODS.RefOrganizationType rot 
			ON orgff.OrganizationType = rot.RefOrganizationTypeId
		JOIN ODS.RefOrganizationIdentificationSystem rois 
			ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		WHERE rot.Code = 'LEA'
		AND rois.Code = 'SEA'	
		AND orgff.FederalProgramCode IS NOT NULL
		AND orgff.FederalProgramsFundingAllocation IS NOT NULL
		AND orgff.ParentalInvolvementReservationFunds IS NOT NULL			

		--------------------------------------
		--Insert Cheif State School Officer --
		--------------------------------------

		CREATE TABLE #PersonIdtoPersonIdentifier 
			(PersonID INT
			,Identifier VARCHAR(50))

		MERGE INTO [ODS].[Person] as tgt
		USING Staging.StateDetail as nisl
		ON 1 = 2  --guarantees no matches
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (PersonMasterId)
		  VALUES(NULL)
		  OUTPUT INSERTED.PersonID, nisl.SeaContact_Identifier INTO #PersonIdtoPersonIdentifier;

		UPDATE Staging.StateDetail
		SET PersonId = pt.PersonID
		FROM Staging.StateDetail nisl
		JOIN #PersonIdtoPersonIdentifier pt ON nisl.SeaContact_Identifier = pt.Identifier

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


		INSERT INTO [ODS].[PersonTelephone]
				   ([PersonId]
				   ,[TelephoneNumber]
				   ,[PrimaryTelephoneNumberIndicator]
				   ,[RefPersonTelephoneNumberTypeId])
		SELECT DISTINCT
				    PersonId [PersonId]
				   ,SeaContact_PhoneNumber [TelephoneNumber]
				   ,1 [PrimaryTelephoneNumberIndicator]
				   ,(SELECT RefTelephoneNumberTypeId FROM ODS.RefTelephoneNumberType WHERE Code = 'Work') [RefPersonTelephoneNumberTypeId]
		FROM Staging.StateDetail
		WHERE SeaContact_PhoneNumber IS NOT NULL
		AND SeaContact_PhoneNumber <> ''

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


		--Drop all temporary tables--
		DROP TABLE #existing_organizationlocation
		DROP TABLE #PersonIdtoPersonIdentifier



		set nocount off;


	END TRY
	BEGIN CATCH

		declare @msg as nvarchar(max)
		set @msg = ERROR_MESSAGE()

		declare @sev as int
		set @sev = ERROR_SEVERITY()

		RAISERROR(@msg, @sev, 1)

	END CATCH; 

END


