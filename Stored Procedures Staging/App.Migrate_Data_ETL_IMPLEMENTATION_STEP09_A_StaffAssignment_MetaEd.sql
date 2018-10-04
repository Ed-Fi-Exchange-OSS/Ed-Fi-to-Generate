USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd]
	@SchoolYear SMALLINT
	AS
   /*************************************************************************************************************
    Created by:    Nathan Clinton | nathan.clinton@aemcorp.com | CIID (https://ciidta.grads360.org/#program)
    Date Created:  6/28/2018

    Purpose:
        The purpose of this ETL is to load the list of K12 staff into Generate.

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  Data Warehouse: db_ECSUID.dbo.ECSUID

    Data Targets:  Generate Database:   Generate.ODS.Person
										Generate.ODS.PersonIdentifier

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------Begin State Specific Information Section----------------------------------------
			---------------------------------------------------------------------------------------------------------------------
			----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
			----created to work with the data standardized in this location. Do not make any changes to table names or column----
			----names or to any of the code after this section.  The only information that should be modified is the source  ----
			----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
			---------------------------------------------------------------------------------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		
		UPDATE Staging.StaffAssignment
		SET TitleIProgramStaffCategory = title.CodeValue
			,SpecialEducationAgeGroupTaught = agegroup.CodeValue
			,SpecialEducationStaffCategory = staff.CodeValue
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Staff s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffEducationOrganizationAssignmentAssociation aa
			ON s.StaffUSI = aa.StaffUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].StaffEducationOrganizationAssignmentAssociationExtension aae
			ON aa.StaffUSI = aae.StaffUSI
			AND aa.EducationOrganizationId = aae.EducationOrganizationId
			AND aa.StaffClassificationDescriptorId = aae.StaffClassificationDescriptorId
			AND aa.BeginDate = aae.BeginDate
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor title ON aae.TitleIProgramStaffCategoryDescriptorId = title.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor agegroup ON aae.SpecialEducationAgeGroupTaughtDescriptorId = agegroup.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor staff ON aae.SpecialEducationSupportServicesCategoryDescriptorId = staff.DescriptorId



			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.StaffAssignment SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.StaffAssignment) > 0

		----Validate Staging.StaffAssignment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd', 'StaffAssignment', @SchoolYear

		SET NOCOUNT OFF;

	END
