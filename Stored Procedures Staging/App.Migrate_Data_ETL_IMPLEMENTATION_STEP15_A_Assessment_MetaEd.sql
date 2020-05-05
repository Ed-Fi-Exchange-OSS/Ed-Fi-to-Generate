USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP15_A_Assessment_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_A_Assessment_MetaEd]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_A_Assessment_MetaEd]
	@SchoolYear SMALLINT = NULL
	AS
   /*************************************************************************************************************
    Created by:    Andy Tsovma | andriy.tsovma@aemcorp.com 
    Date Created:  9/26/2019

    Purpose:
        

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  Data Warehouse: edfi.extension.CedsStudentAssessment

    Data Targets:  Generate Database:   Generate.ODS.AssessmentRegistration


    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP15_A_Assessment_MetaEd] 2018;
    
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

			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------Begin State Specific Information Section----------------------------------------
			---------------------------------------------------------------------------------------------------------------------
			----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
			----created to work with the data standardized in this location. Do not make any changes to table names or column----
			----names or to any of the code after this section.  The only information that should be modified is the source  ----
			----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
			---------------------------------------------------------------------------------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		-- step 1 
		UPDATE Staging.AssessmentResult
		SET StateFullAcademicYear = csa.StateFullAcademicYear
			,LEAFullAcademicYear = csa.LEAFullAcademicYear
			,SchoolFullAcademicYear = csa.SchoolFullAcademicYear
		FROM Staging.AssessmentResult sa
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s ON s.StudentUniqueId=sa.Student_Identifier_State
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsStudentAssessment csa
			ON csa.StudentUSI = s.StudentUSI
		--WHERE csa.RecordEndDateTime IS NOT NULL

		-- step 2
		--UPDATE Staging.AssessmentResult
		--SET StateFullAcademicYear = csa.StateFullAcademicYear
		--	,LEAFullAcademicYear = csa.LEAFullAcademicYear
		--	,SchoolFullAcademicYear = csa.SchoolFullAcademicYear
		--FROM Staging.AssessmentResult sa
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s ON s.StudentUniqueId=sa.Student_Identifier_State
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsStudentAssessment csa
		--	ON csa.StudentUSI = s.StudentUSI
		--WHERE csa.RecordEndDateTime IS NULL

		

			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.AssessmentResult SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.AssessmentResult) > 0

		----Validate Staging.StaffAssignment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP15_A_Assessment_MetaEd', 'AssessmentResult', @SchoolYear

		SET NOCOUNT OFF;

	END
