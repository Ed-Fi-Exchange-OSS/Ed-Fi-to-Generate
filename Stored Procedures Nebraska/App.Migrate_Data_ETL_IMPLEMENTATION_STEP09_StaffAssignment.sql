USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]
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
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment];
    
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

		TRUNCATE TABLE Staging.StaffAssignment

		INSERT INTO Staging.StaffAssignment
			(	 
				  Personnel_Identifier_State 
				, School_Identifier_State 
				, FullTimeEquivalency 
				, SpecialEducationStaffCategory 
				, K12StaffClassification 
				, TitleIProgramStaffCategory 
				, CredentialType 
				, CredentialIssuanceDate 
				, CredentialExpirationDate 
				, ParaprofessionalQualification 
				, SpecialEducationAgeGroupTaught 
				, HighlyQualifiedTeacherIndicator
				, AssignmentStartDate
				, AssignmentEndDate
				, RunDateTime
			)
		SELECT 
			  s.StaffUniqueId
			, eo.StateOrganizationId
			, ea.FullTimeEquivalency
			, NULL
			, scd.CodeValue
			, NULL
			, ct.CodeValue
			, sc.CredentialIssuanceDate
			, sc.CredentialExpirationDate
			, para.CodeValue 
			, NULL
			, s.HighlyQualifiedTeacher [HighlyQualifiedTeacherIndicator]
			, aa.BeginDate
			, aa.EndDate
			, NULL RunDateTime
		FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Staff s
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StaffCredential sc
			ON s.StaffUSI = sc.StaffUSI
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].CredentialType ct
			ON sc.CredentialTypeId = ct.CredentialTypeId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StaffEducationOrganizationAssignmentAssociation aa
			ON s.StaffUSI = aa.StaffUSI
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].EducationOrganization eo
			ON aa.EducationOrganizationId = eo.EducationOrganizationId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor scd
			ON aa.StaffClassificationDescriptorId = scd.DescriptorId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StaffEducationOrganizationEmploymentAssociation ea
			ON s.StaffUSI = ea.StaffUSI
			AND aa.EducationOrganizationId = ea.EducationOrganizationId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StaffSchoolAssociation ssa
			ON s.StaffUSI = ssa.StaffUSI
			AND aa.EducationOrganizationId = ssa.SchoolId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor para ON sc.TeachingCredentialDescriptorId = para.DescriptorId
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor pad
			ON ssa.ProgramAssignmentDescriptorId = pad.DescriptorId
		WHERE pad.ShortDescription = 'Special Education'


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.StaffAssignment SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.StaffAssignment) > 0

		----Validate Staging.StaffAssignment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment', 'Staging.StaffAssignment'

		SET NOCOUNT OFF;

	END
