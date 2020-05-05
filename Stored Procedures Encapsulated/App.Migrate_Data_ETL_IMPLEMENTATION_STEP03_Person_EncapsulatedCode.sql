USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person_EncapsulatedCode]
END

GO


---It would be good to just go ahead and include Staff in this process as well to maintain unique staff ID's
---Inform the process for when/if ID's change - how will that be addressed, perhaps not now, but in the future.
-------will the use of PersonMaster come into play?
-------Note: id's can change so long as the end result - report outcome would be the same?


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person_EncapsulatedCode]
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
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person_EncapsulatedCode] 2018;
    
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
		DECLARE @eStoredProc			varchar(100) = 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person_EncapsulatedCode'

        ---------------------------------------------------
        --- Declare Temporary Variables                ----
        ---------------------------------------------------
        DECLARE
			 @RecordStartDate DATETIME

		SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear)


		 --set the year to pull by using GETYEAR - a certain number so that it looks back in time but not so far back
		 --that pulling the data gets too large.  This will keep it dynamic.  So declare a variable and use the date.

		
		------------------------------------------------------------
        --- Insert Person Records                                ---
        ------------------------------------------------------------
        /*
		  Grab the existing PersonId for people that already exist.
		*/ 

		BEGIN TRY
			UPDATE Staging.Person
			SET PersonId = pid.PersonId
			FROM Staging.Person sp
			JOIN ods.PersonIdentifier pid
				ON sp.Identifier = pid.Identifier
			WHERE ((sp.[Role] = 'K12 Student'
					AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075' /* Student Identification System */))
				OR (sp.[Role] = 'K12 Personnel'
					AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001074' /* Staff Member Identification System */)))
		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Person', 'PersonId', 'S03EC100' 
		END CATCH

		/*
          Insert one row for each distinct student
          identifier value (could be many records for
          one student). 
          
          Use the MERGE and OUTPUT statements so that we 
          can insert and also get back the values we 
          want for our crosswalk table. The MERGE statement
          will only perform INSERTs due to the 'ON 1 = 0' clause.
        */
		
        DECLARE
          @student_person_xwalk TABLE (
              PersonId INT
			, SourceId INT
          );

		BEGIN TRY
			MERGE INTO ODS.Person TARGET
			USING Staging.Person AS distinctIDs
				ON TARGET.PersonId = distinctIDs.PersonId
			WHEN NOT MATCHED THEN 
				INSERT (PersonMasterId)
				VALUES (NULL)
			OUTPUT INSERTED.PersonId
				  ,distinctIDs.Id AS SourceId
			INTO @student_person_xwalk (PersonId, SourceId);
		END TRY 

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.Person', NULL, 'S03EC110' 
		END CATCH

		BEGIN TRY

		UPDATE Staging.Person
			SET PersonId = xwalk.PersonId
			FROM Staging.Person p
			JOIN @student_person_xwalk xwalk
				ON p.Id = xwalk.SourceId
				UPDATE Staging.Person
				SET PersonId = xwalk.PersonId
				FROM Staging.Person p
				JOIN @student_person_xwalk xwalk
					ON p.Id = xwalk.SourceId
		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.Person', 'PersonId', 'S03EC120' 
		END CATCH

        ------------------------------------------------------------
        --- Insert PersonIdentifier Records -- Students         ----
        ------------------------------------------------------------
		DECLARE @PersonIdentificationSystemId INT
		DECLARE @PersonalInformationVerificationId INT

		SET @PersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075' /* Student Identification System */)
		SET @PersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')

		BEGIN TRY    
			INSERT ODS.PersonIdentifier
			  (PersonId, Identifier, RefPersonIdentificationSystemId, RefPersonalInformationVerificationId)
			  SELECT DISTINCT
				PersonId = p.PersonId
			   ,Identifier = p.Identifier
			   ,RefPersonIdentificationSystemId = @PersonIdentificationSystemId
			   ,RefPersonalInformationVerificationId = @PersonalInformationVerificationId
			  FROM
				Staging.Person p
			  LEFT JOIN ODS.PersonIdentifier pid 
				ON pid.PersonId = p.PersonId AND pid.Identifier = p.Identifier
				AND pid.RefPersonIdentificationSystemId = @PersonIdentificationSystemId
				AND PID.RefPersonalInformationVerificationId = @PersonalInformationVerificationId
			  WHERE [Role] = 'K12 Student'
			   AND  pid.PersonId IS NULL
		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.PersonIdentifier', NULL, 'S03EC130' 
		END CATCH

		  
        ------------------------------------------------------------
        --- Insert PersonIdentifier Records -- Personnel        ----
        ------------------------------------------------------------
		BEGIN TRY
			SET @PersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001074' /* Staff Member Identification System */)
			INSERT ODS.PersonIdentifier
			  (PersonId, Identifier, RefPersonIdentificationSystemId, RefPersonalInformationVerificationId)
			  SELECT DISTINCT
				PersonId = p.PersonId
			   ,Identifier = p.Identifier
			   ,RefPersonIdentificationSystemId = @PersonIdentificationSystemId
			   ,RefPersonalInformationVerificationId = @PersonalInformationVerificationId
			  FROM
				Staging.Person p
			  LEFT JOIN ODS.PersonIdentifier pid 
				ON pid.PersonId = p.PersonId AND pid.Identifier = p.Identifier
				AND pid.RefPersonIdentificationSystemId = @PersonIdentificationSystemId
				AND PID.RefPersonalInformationVerificationId = @PersonalInformationVerificationId
			  WHERE [Role] = 'K12 Personnel'
			   AND  pid.PersonId IS NULL
		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.PersonIdentifier', NULL, 'S03EC140' 
		END CATCH


        ------------------------------------------------------------
        --- Merge Person Details					        ----
        ------------------------------------------------------------
		DECLARE @PersonalIdVerificationId INT
		SET @PersonalIdVerificationId = App.GetRefPersonalInformationVerificationId('01011')


		BEGIN TRY
			INSERT INTO ODS.PersonDetail 
			SELECT 
				  sp.PersonId
				, LEFT(sp.FirstName, 35)
				, LEFT(sp.MiddleName, 35)
				, LEFT(sp.LastName, 35)
				, NULL
				, NULL
				, sp.Birthdate
				, NULL
				, ISNULL(sp.HispanicLatinoEthnicity, 0)
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, @PersonalIdVerificationId 
				, NULL
				, NULL
				, @RecordStartDate
				, null
			FROM Staging.Person sp
			LEFT JOIN ODS.PersonDetail pd
				ON sp.PersonId = pd.PersonId
			WHERE pd.PersonId IS NULL
			  
		  UPDATE ODS.PersonDetail
		  SET RefSexId = s.RefSexId
		  FROM Staging.Person p
		  JOIN ODS.PersonDetail pd
				ON p.PersonId = pd.PersonId
		  JOIN ODS.SourceSystemReferenceData ref
				ON p.Sex = ref.InputCode
				AND ref.TableName = 'RefSex'
				AND ref.SchoolYear = @SchoolYear
		  JOIN ODS.RefSex s
				ON ref.OutputCode = s.Code
		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'ODS.PersonDetail', NULL, 'S03EC150' 
		END CATCH
 

    END;