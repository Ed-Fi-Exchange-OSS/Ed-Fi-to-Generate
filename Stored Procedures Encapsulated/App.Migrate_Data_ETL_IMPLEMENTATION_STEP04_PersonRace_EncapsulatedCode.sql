USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace_EncapsulatedCode]
END

GO


---It would be good to just go ahead and include Staff in this process as well to maintain unique staff ID's
---Inform the process for when/if ID's change - how will that be addressed, perhaps not now, but in the future.
-------will the use of PersonMaster come into play?
-------Note: id's can change so long as the end result - report outcome would be the same?


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace_EncapsulatedCode]
	@SchoolYear SMALLINT = NULL
	AS
    /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to maintain the unique list of Student & Staff Identifiers assigned by the state
		in the ODS.

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  Ed-Fi ODS: edfi.Student
							  edfi.Staff

    Data Targets:  Generate Database:   Generate.ODS.Person
										Generate.ODS.PersonIdentifier

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN


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
		DECLARE @eStoredProc			varchar(100) = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace_EncapsulatedCode'

        ---------------------------------------------------
        --- Declare Temporary Variables                ----
        ---------------------------------------------------
        DECLARE
			 @RecordStartDate DATETIME

		SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear)


		 --set the year to pull by using GETYEAR - a certain number so that it looks back in time but no so far back
		 --that pulling the data gets too large.  This will keep it dynamic.  So declare a variable and use the date.

		
		------------------------------------------------------------
        --- Insert PersonDemographicRace Records                                ---
        ------------------------------------------------------------
		----------------------------------------------------------------------
		---Associate the PersonDemographicRaceId with the temporary table ----
		----------------------------------------------------------------------
		BEGIN TRY
			UPDATE Staging.PersonRace
			SET PersonDemographicRaceId = pdr.PersonDemographicRaceId
			FROM Staging.PersonRace mr 
			JOIN ODS.PersonIdentifier pid 
				ON pid.Identifier = mr.Student_Identifier_State
				AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
				AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
			JOIN ODS.PersonDemographicRace pdr 
				ON pid.PersonID = pdr.PersonId
			JOIN ODS.SourceSystemReferenceData rd
				ON mr.RaceType = rd.InputCode
				AND rd.TableName = 'RefRace'
				AND rd.SchoolYear = @SchoolYear
			JOIN ODS.RefRace r 
				ON rd.OutputCode = r.Code
			WHERE pid.PersonID IS NOT NULL
				AND	r.RefRaceId = pdr.RefRaceId
				AND pdr.RecordStartDateTime = mr.RecordStartDateTime
		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.PersonRace', 'PersonDemographicRaceId', 'S04EC100' 
		END CATCH

		------------------------------------------------------------
		---Insert Student's Race into ODS.PersonDemographicRace ----
		------------------------------------------------------------

		BEGIN TRY
			--Update PersonDeomgraphicRace records that have changed
			UPDATE ODS.PersonDemographicRace
			SET RecordEndDateTime = mr.RecordEndDateTime
			FROM Staging.PersonRace mr 
			JOIN ODS.PersonIdentifier pid 
				ON pid.Identifier = mr.Student_Identifier_State
				AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
				AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
			JOIN ODS.PersonDemographicRace pdr
				ON pid.PersonID = pdr.PersonId
			WHERE pdr.RecordEndDateTime IS NULL
				AND pdr.RecordStartDateTime = mr.RecordStartDateTime
				AND mr.PersonDemographicRaceId IS NULL
		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.PersonDemographicRace', 'RecordEndDateTime', 'S04EC110' 
		END CATCH

		BEGIN TRY
			INSERT INTO [ODS].[PersonDemographicRace]
					   ([PersonId]
					   ,[RefRaceId]
					   ,[RecordStartDateTime]
					   ,[RecordEndDateTime])
			SELECT DISTINCT
						 pid.PersonId [PersonId]
						,r.RefRaceID
						,mr.RecordStartDateTime [RecordStartDateTime]
						,mr.RecordEndDateTime [RecordEndDateTime]
			FROM Staging.PersonRace mr
			JOIN ODS.PersonIdentifier pid 
				ON pid.Identifier = mr.Student_Identifier_State
				AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
				AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
			JOIN ODS.SourceSystemReferenceData rd
				ON mr.RaceType = rd.InputCode
				AND rd.TableName = 'RefRace'
				AND rd.SchoolYear = @SchoolYear
			JOIN ODS.RefRace r 
				ON rd.OutputCode = r.Code
			WHERE mr.PersonDemographicRaceId IS NULL
		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.PersonDemographicRace', NULL, 'S04EC120' 
		END CATCH

 		-----------------------------------------------------------------------------------------------------
		---Capture the ID of new PersonDemographicRace records created and put them in the staging table ----
		-----------------------------------------------------------------------------------------------------
		BEGIN TRY
			UPDATE Staging.PersonRace
			SET PersonDemographicRaceId = pdr.PersonDemographicRaceId
			FROM Staging.PersonRace mr 
			JOIN ODS.PersonIdentifier pid 
				ON pid.Identifier = mr.Student_Identifier_State
				AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
				AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
			JOIN ODS.PersonDemographicRace pdr 
				ON pid.PersonID = pdr.PersonId
			JOIN ODS.SourceSystemReferenceData rd
				ON mr.RaceType = rd.InputCode
				AND rd.TableName = 'RefRace'
				AND rd.SchoolYear = @SchoolYear
			JOIN ODS.RefRace r 
				ON rd.OutputCode = r.Code
			WHERE pid.PersonID IS NOT NULL
				AND	r.RefRaceId = pdr.RefRaceId
				AND pdr.RecordStartDateTime = mr.RecordStartDateTime
		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.PersonRace', 'PersonDemographicRaceId', 'S04EC100' 
		END CATCH

    END;