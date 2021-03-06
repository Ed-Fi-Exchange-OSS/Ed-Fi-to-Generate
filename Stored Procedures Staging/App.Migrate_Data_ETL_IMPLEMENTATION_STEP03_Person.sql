﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person]
END

GO

---It would be good to just go ahead and include Staff in this process as well to maintain unique staff ID's
---Inform the process for when/if ID's change - how will that be addressed, perhaps not now, but in the future.
-------will the use of PersonMaster come into play?
-------Note: id's can change so long as the end result - report outcome would be the same?


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person]
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
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person] 2018;
    
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

-------------------------------------Begin State Specific Information Section----------------------------------------
---------------------------------------------------------------------------------------------------------------------
----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
----created to work with the data standardized in this location. Do not make any changes to table names or column----
----names or to any of the code after this section.  The only information that should be modified is the source  ----
----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		TRUNCATE TABLE Staging.Person

		--------------------------------------------------------------------------
        --Pull Student Unique ID's -----------------------------------------------                         
        --------------------------------------------------------------------------
        /*
			Use a location that contains every unique state student identifier available
        */
 
		INSERT INTO Staging.Person
			( Identifier
			, FirstName
			, LastName
			, MiddleName
			, Birthdate
			, Sex
			, HispanicLatinoEthnicity
			, [Role]
			, RunDateTime
			)
        SELECT DISTINCT
              REPLACE(StudentUniqueId, ' ', '')
			, FirstName
			, LastSurname
			, MiddleName
			, Birthdate
			, d.CodeValue
			, seoa.HispanicLatinoEthnicity
			, 'K12 Student'
			, NULL RunDateTime
        FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Student] s 
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociation seoa 
			ON s.StudentUSI = seoa.StudentUSI 
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
			ON seoa.SexDescriptorId = d.DescriptorId
		WHERE StudentUniqueId IS NOT NULL

		--------------------------------------------------------------------------
        --Pull Staff Unique ID's -----------------------------------------------                         
        --------------------------------------------------------------------------
        /*
			Use a location that contains every unique state staff identifier available
        */

 
		INSERT INTO Staging.Person
			( Identifier
			, FirstName
			, LastName
			, MiddleName
			, Birthdate
			, Sex
			, HispanicLatinoEthnicity
			, [Role]
			, RunDateTime
			)
        SELECT DISTINCT
              Identifier = REPLACE(StaffUniqueId, ' ', '')
			, FirstName
			, LastSurname
			, MiddleName
			, Birthdate
			, d.CodeValue 
			, staff.HispanicLatinoEthnicity
			, 'K12 Personnel'
			, NULL RunDateTime
        FROM
			[EdFi_Sample_ODS_Data_For_Generate].[edfi].Staff
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
			ON Staff.SexDescriptorId = d.DescriptorId
		WHERE StaffUniqueId IS NOT NULL

		

---------------------------------------------------------------------------------------------------------------------
-------------------------------------End State Specific Information Section------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Person SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Person) > 0

		----Validate Staging.Person----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person', 'Person', @SchoolYear



    END;

