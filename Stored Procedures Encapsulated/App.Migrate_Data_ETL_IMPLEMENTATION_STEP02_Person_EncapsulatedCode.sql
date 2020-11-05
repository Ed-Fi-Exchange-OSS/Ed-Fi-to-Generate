-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode]
END

GO


---It would be good to just go ahead and include Staff in this process as well to maintain unique staff ID's
---Inform the process for when/if ID's change - how will that be addressed, perhaps not now, but in the future.
-------will the use of PersonMaster come into play?
-------Note: id's can change so long as the end result - report outcome would be the same?


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode]
	@SchoolYear SMALLINT
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
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

      BEGIN TRY
        SET NOCOUNT ON;

        ---------------------------------------------------
        --- Declare Temporary Variables                ----
        ---------------------------------------------------
        DECLARE
			 @RecordStartDate DATETIME

		SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear)


		 --set the year to pull by using GETYEAR - a certain number so that it looks back in time but no so far back
		 --that pulling the data gets too large.  This will keep it dynamic.  So declare a variable and use the date.

		
		------------------------------------------------------------
        --- Insert Person Records                                ---
        ------------------------------------------------------------
        /*
		  Grab the existing PersonId for people that already exist.
		*/ 

		UPDATE Staging.Person
		SET PersonId = pid.PersonId
		FROM Staging.Person sp
		JOIN ods.PersonIdentifier pid
			ON sp.Identifier = pid.Identifier
		WHERE ((sp.[Role] = 'K12 Student'
				AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075' /* Student Identification System */))
			OR (sp.[Role] = 'K12 Personnel'
				AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001074' /* Staff Member Identification System */)))


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

        MERGE INTO ODS.Person TARGET
        USING Staging.Person AS distinctIDs
			ON TARGET.PersonId = distinctIDs.PersonId
        WHEN NOT MATCHED THEN 
			INSERT (PersonMasterId)
            VALUES (NULL)
        OUTPUT INSERTED.PersonId
              ,distinctIDs.Id AS SourceId
        INTO @student_person_xwalk (PersonId, SourceId);


		UPDATE Staging.Person
		SET PersonId = xwalk.PersonId
		FROM Staging.Person p
		JOIN @student_person_xwalk xwalk
			ON p.Id = xwalk.SourceId

        ------------------------------------------------------------
        --- Insert PersonIdentifier Records -- Students         ----
        ------------------------------------------------------------
        INSERT ODS.PersonIdentifier
          (PersonId, Identifier, RefPersonIdentificationSystemId, RefPersonalInformationVerificationId)
          SELECT DISTINCT
            PersonId = p.PersonId
           ,Identifier = p.Identifier
           ,RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075' /* Student Identification System */)
           ,RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
          FROM
            Staging.Person p
		  WHERE [Role] = 'K12 Student'


		  
        ------------------------------------------------------------
        --- Insert PersonIdentifier Records -- Personnel        ----
        ------------------------------------------------------------
        INSERT ODS.PersonIdentifier
          (PersonId, Identifier, RefPersonIdentificationSystemId, RefPersonalInformationVerificationId)
          SELECT DISTINCT
            PersonId = p.PersonId
           ,Identifier = p.Identifier
           ,RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001074' /* Staff Member Identification System */)
           ,RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
          FROM
            Staging.Person p
		  WHERE [Role] = 'K12 Personnel'


        ------------------------------------------------------------
        --- Merge K12 Personnel Details					        ----
        ------------------------------------------------------------

		MERGE INTO ODS.PersonDetail TARGET
		USING Staging.Person SOURCE
			ON TARGET.PersonId = SOURCE.PersonId 
		WHEN NOT MATCHED 
			AND [Role] = 'K12 Personnel'
			THEN
			INSERT VALUES (
			  SOURCE.PersonId
			, SOURCE.FirstName
			, SOURCE.MiddleName
			, SOURCE.LastName
			, NULL
			, NULL
			, SOURCE.Birthdate
			, NULL
			, NULL
			, NULL
			, NULL
			, NULL
			, NULL
			, NULL
			, App.GetRefPersonalInformationVerificationId('01011')
			, NULL
			, NULL
			, @RecordStartDate
			, null
			);
		  
 
      END TRY
      BEGIN CATCH



      END CATCH;

    END;