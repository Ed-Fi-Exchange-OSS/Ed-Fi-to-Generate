USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP17_StateDefinedCustomIndicator') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP17_StateDefinedCustomIndicator]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP17_StateDefinedCustomIndicator]
	@SchoolYear SMALLINT = NULL
AS

    /*************************************************************************************************************
    Date Created:  9/22/2019

    Purpose:
        The purpose of this ETL is to populate the Custom Indicators data from source into staging.

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  [Document the Source table(s) here for easy reference]

    Data Targets:  Generate Database:   Generate.ODS.RefIndicatorStatusCustomType

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP17_StateDefinedCustomIndicator] 2018;
    
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
		DECLARE @eStoredProc	varchar(100) = 'Migrate_Data_ETL_IMPLEMENTATION_STEP17_StateDefinedCustomIndicator'

		-- Clean out the staging data from the last run
		TRUNCATE TABLE Staging.StateDefinedCustomIndicator

-------------------------------------Begin State Specific Information Section----------------------------------------
---------------------------------------------------------------------------------------------------------------------
----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
----created to work with the data standardized in this location. Do not make any changes to table names or column----
----names or to any of the code after this section.  The only information that should be modified is the source  ----
----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		-------------------------------------------------------------------
        -- -----------------------------------------------                         
        -------------------------------------------------------------------
		BEGIN TRY
 
			INSERT INTO Staging.StateDefinedCustomIndicator ( 
				Code
				,Description
				,Definition
			)
			SELECT
				ci.Code						Code
				,ci.Definition				Definition
				,ci.Definition				Description
			FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[StateDefinedCustomIndicator] ci

		END TRY

		BEGIN CATCH 
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.StateDefinedCustomIndicator', NULL, 'S12SI100' 
		END CATCH

---------------------------------------------------------------------------------------------------------------------
-------------------------------------End State Specific Information Section------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		BEGIN TRY
	
			UPDATE Staging.StateDefinedCustomIndicator SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.StateDefinedCustomIndicator) > 0

--			PRINT 'Update successful for RunDateTime on Staging.IndicatorStatusCustomType records'

		END TRY

		BEGIN CATCH
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.StateDefinedCustomIndicator', NULL, 'S12SI150' 
		END CATCH

		-------------------------------------------------------------------------------------------------------------------------
		-------- Begin Validation of Staging Tables included in this ETL --------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------
		BEGIN TRY

			----Validate Staging.Person----
			EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP17_StateDefinedCustomIndicator', 'StateDefinedCustomIndicator', @SchoolYear

--			PRINT 'Execution of validation procedures successful for PersonRace Staging tables'

		END TRY

		BEGIN CATCH
			EXEC App.Migrate_Data_Validation_Logging @eStoredProc, 'Staging.ValidationErrors', NULL, 'S12SI160' 
		END CATCH

    END;


