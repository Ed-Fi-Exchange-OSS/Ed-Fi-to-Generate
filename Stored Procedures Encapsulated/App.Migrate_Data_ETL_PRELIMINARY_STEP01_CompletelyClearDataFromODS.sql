USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]    Script Date: 5/31/2018 2:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]
AS
BEGIN

	BEGIN TRY
	
		set nocount on;

    /*************************************************************************************************************
    Created by:    Duane Brown | duane.brown@aemcorp.com | CIID (https://ciidta.grads360.org/#program)
    Date Created:  12/19/2017

    Purpose:
        The purpose of this ETL is to clean the Generate ODS data store in preparation for
        a new run of the ETL process to populate the Generate ODS. After removing records,
        all tables will be reseeded.

    Assumptions:
        None

    Account executed under: LOGIN

    Approximate run time:  ~ 45 seconds

    Data Sources:  N/A

    Data Targets:  Generate Database: Generate

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_STEP01_CompletelyClearDataFromODS];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/


        /* REMOVE ALL DATA FROM THE ODS */
          -----------------------------

		  
		TRUNCATE TABLE ODS.K12StudentDiscipline
		TRUNCATE TABLE ODS.ProgramParticipationSpecialEducation
		TRUNCATE TABLE ODS.ProgramParticipationTitleIIILEp
		TRUNCATE TABLE ODS.ProgramParticipationMigrant
		TRUNCATE TABLE ODS.ProgramParticipationCte
		TRUNCATE TABLE ODS.ProgramParticipationTitleI
		TRUNCATE TABLE ODS.PersonLanguage
		TRUNCATE TABLE ODS.PersonStatus
		TRUNCATE TABLE ODS.PersonIdentifier
		TRUNCATE TABLE ODS.PersonDisability
		TRUNCATE TABLE ODS.PersonDemographicRace
		TRUNCATE TABLE ODS.OrganizationRelationship
		TRUNCATE TABLE ODS.OrganizationProgramType
		TRUNCATE TABLE ODS.PersonDetail
		TRUNCATE TABLE ODS.StaffCredential
		TRUNCATE TABLE ODS.K12StudentEnrollment
		TRUNCATE TABLE ODS.AssessmentResult_PerformanceLevel
		TRUNCATE TABLE ODS.AssessmentAdministration_Organization
		TRUNCATE TABLE ODS.K12LeaTitleISupportService
		TRUNCATE TABLE ODS.K12OrganizationStudentResponsibility
		TRUNCATE TABLE ODS.K12StudentCohort
		TRUNCATE TABLE ODS.AeStaff
		TRUNCATE TABLE ODS.PersonEmailAddress
		TRUNCATE TABLE ODS.PersonTelephone
		TRUNCATE TABLE ODS.LocationAddress
		TRUNCATE TABLE ODS.OrganizationLocation
		TRUNCATE TABLE ODS.OrganizationTelephone
		TRUNCATE TABLE ODS.OrganizationWebsite
		TRUNCATE TABLE ODS.OrganizationIndicator
		TRUNCATE TABLE ODS.OrganizationOperationalStatus
		TRUNCATE TABLE ODS.K12ProgramOrService
		TRUNCATE TABLE ODS.K12SchoolStatus
		TRUNCATE TABLE ODS.K12SchoolGradeOffered
		TRUNCATE TABLE ODS.OrganizationFederalAccountability
		TRUNCATE TABLE ODS.K12LEAFederalFunds
		TRUNCATE TABLE ODS.K12FederalFundAllocation
		TRUNCATE TABLE ODS.K12SchoolImprovement
		TRUNCATE TABLE ODS.WorkforceProgramParticipation
		TRUNCATE TABLE ODS.WorkforceEmploymentQuarterlyData
		TRUNCATE TABLE ODS.K12TitleIIILanguageInstruction

		DELETE FROM ODS.K12CharterSchoolApprovalAgency
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.K12CharterSchoolApprovalAgency'', RESEED, 1);'
		DELETE FROM ODS.K12CharterSchoolManagementOrganization
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.K12CharterSchoolManagementOrganization'', RESEED, 1);'
		DELETE FROM ODS.OrganizationDetail WHERE OrganizationId <> 0 
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.OrganizationDetail'', RESEED, 1);'
		DELETE FROM ODS.OrganizationCalendarSession --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.OrganizationCalendar --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.K12School --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.Incident --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.StaffEmployment --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.PersonProgramParticipation --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.AssessmentResult
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentResult'', RESEED, 1);'
		DELETE FROM ODS.AssessmentPerformanceLevel
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentPerformanceLevel'', RESEED, 1);'
		DELETE FROM ODS.AssessmentRegistration
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentRegistration'', RESEED, 1);'
		DELETE FROM ODS.AssessmentAdministration
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentAdministration'', RESEED, 1);'
		DELETE FROM ODS.AssessmentSubtest
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentSubtest'', RESEED, 1);'
		DELETE FROM ODS.AssessmentForm
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentForm'', RESEED, 1);'
		DELETE FROM ODS.Assessment
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.Assessment'', RESEED, 1);'
		DELETE FROM  ODS.OrganizationPersonRole --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.OrganizationPersonRole'', RESEED, 1);'
		DELETE FROM  ODS.K12StaffAssignment --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.K12StaffAssignment'', RESEED, 1);'
		DELETE FROM  ODS.PersonCredential --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonCredential'', RESEED, 1);'
		TRUNCATE TABLE ODS.OrganizationIdentifier
		DELETE FROM ODS.Person --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.Person'', RESEED, 1);'
		DELETE FROM ODS.Organization WHERE OrganizationId NOT IN (0, 1) --Cannot trucnate and add record back int because it is referenced by a foreign Key constraint.
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.Organization'', RESEED, 1);'
		DELETE FROM ODS.[Location] --Cannot trucnate and add record back int because it is referenced by a foreign Key constraint.
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.Location'', RESEED, 1);'

		RETURN 0;

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



