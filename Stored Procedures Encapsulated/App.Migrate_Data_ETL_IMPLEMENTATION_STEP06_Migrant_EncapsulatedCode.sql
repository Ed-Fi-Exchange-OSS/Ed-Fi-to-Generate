USE [generate]
GO

/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode]    Script Date: 6/25/2018 3:41:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode]
	@SchoolYear SMALLINT
AS

    /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to load Migrant indicators about students for EDFacts reports that apply to the full year.

    Assumptions:
        
    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources: 

    Data Targets:  Generate Database:   Generate

    Return Values:
    	 0	= Success
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/

BEGIN

	BEGIN TRY
	
		set nocount on;


		--------------------------------------------------------
		---Associate the PersonId with the temporary tables ----
		--------------------------------------------------------

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET PersonID = pid.PersonId
		FROM Staging.Migrant mcc
		JOIN ODS.PersonIdentifier pid ON mcc.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
		AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011') 

		---------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary tables ----
		---------------------------------------------------------------------
		
		--Staging.Migrant
		UPDATE Staging.Migrant
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.Migrant mcc
		JOIN ODS.OrganizationIdentifier orgid ON mcc.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
		AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		------------------------------------------------------------------------------
		---Associate the Migrant Program OrganizationId with the temporary tables ----
		------------------------------------------------------------------------------

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET OrganizationID_MigrantProgram = orgd.OrganizationId
		FROM Staging.Migrant tp
		JOIN ODS.OrganizationRelationship orgr ON tp.OrganizationID_School = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd ON orgr.OrganizationId = orgd.OrganizationId
		JOIN ODS.OrganizationProgramType orgpt ON orgd.OrganizationId = orgpt.OrganizationId
		JOIN ODS.RefProgramType rpt ON orgpt.RefProgramTypeId = rpt.RefProgramTypeId
		WHERE orgd.Name = 'Migrant Program'
		AND rpt.Code = '04920'

		-----------------------------------------------------------------------------
		----Create an OrganizationPersonRole Migrant Status for the Student --------
		-----------------------------------------------------------------------------

		--Check for Migrant Records that already exist--

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET OrganizationPersonRoleID_MigrantProgram = opr.OrganizationPersonRoleId
		FROM Staging.Migrant tp
		JOIN ODS.OrganizationPersonRole opr ON tp.PersonID = opr.PersonId
		WHERE tp.OrganizationID_MigrantProgram = opr.OrganizationId
		AND opr.RoleId = App.GetRoleId('K12 Student')
		AND opr.EntryDate = ISNULL(tp.ProgramParticipationStartDate, App.GetFiscalYearStartDate(@SchoolYear))
		AND (opr.ExitDate IS NULL OR opr.ExitDate = ISNULL(tp.ProgramParticipationExitDate, App.GetFiscalYearEndDate(@SchoolYear)))

		--Create an OrganizationPersonRole (Enrollment) into the Migrant Program if the ProgramParticipationStartDate and ProgramParticipationEndDates are supplied

		INSERT INTO [ODS].[OrganizationPersonRole]
           ([OrganizationId]
           ,[PersonId]
           ,[RoleId]
           ,[EntryDate]
           ,[ExitDate])
		SELECT DISTINCT
            tp.OrganizationID_MigrantProgram [OrganizationId]
           ,tp.PersonID [PersonId]
           ,App.GetRoleId('K12 Student') [RoleId]
           ,ISNULL(tp.ProgramParticipationStartDate, App.GetFiscalYearStartDate(@SchoolYear)) [EntryDate]
           ,ISNULL(tp.ProgramParticipationExitDate, App.GetFiscalYearEndDate(@SchoolYear)) [ExitDate] 
		FROM Staging.Migrant tp
		WHERE tp.OrganizationPersonRoleID_MigrantProgram IS NULL
		AND tp.OrganizationID_MigrantProgram IS NOT NULL
		AND tp.PersonID IS NOT NULL

		--Update the temporary table with the Migrant Program OrganizationPersonRoleId

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET OrganizationPersonRoleID_MigrantProgram = opr.OrganizationPersonRoleId
		FROM Staging.Migrant tp
		JOIN ODS.OrganizationPersonRole opr ON tp.PersonID = opr.PersonId
		WHERE tp.OrganizationID_MigrantProgram = opr.OrganizationId
		AND opr.RoleId = App.GetRoleId('K12 Student')
		AND opr.EntryDate = ISNULL(tp.ProgramParticipationStartDate, App.GetFiscalYearStartDate(@SchoolYear))
		AND opr.ExitDate = ISNULL(tp.ProgramParticipationExitDate, App.GetFiscalYearEndDate(@SchoolYear))

		-------------------------------------------------------------------------------
		----Create a PersonProgramParticipation Migrant Status for the Student --------
		-------------------------------------------------------------------------------

		--Check to see if a PersonProgramParticipation already exists for the Migrant Program--

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET PersonProgramParticipationId = ppp.PersonProgramParticipationId
		FROM Staging.Migrant tp
		JOIN ODS.PersonProgramParticipation ppp ON tp.OrganizationPersonRoleID_MigrantProgram = ppp.OrganizationPersonRoleId
		WHERE ppp.RecordStartDateTime = ISNULL(tp.ProgramParticipationStartDate, App.GetFiscalYearStartDate(@SchoolYear))
		AND ppp.RecordEndDateTime = ISNULL(tp.ProgramParticipationExitDate, App.GetFiscalYearEndDate(@SchoolYear))

		--Create a PersonProgramParticipation for each OrganizationPersonRole

		--Staging.Migrant
		INSERT INTO [ODS].[PersonProgramParticipation]
           ([OrganizationPersonRoleId]
           ,[RefParticipationTypeId]
           ,[RefProgramExitReasonId]
           ,[RecordStartDateTime]
           ,[RecordEndDateTime])
		SELECT DISTINCT
		    tp.OrganizationPersonRoleID_MigrantProgram [OrganizationPersonRoleId]
           ,NULL [RefParticipationTypeId]
           ,NULL [RefProgramExitReasonId]
           ,ISNULL(tp.ProgramParticipationStartDate, App.GetFiscalYearStartDate(@SchoolYear)) [RecordStartDateTime]
           ,ISNULL(tp.ProgramParticipationExitDate, App.GetFiscalYearEndDate(@SchoolYear)) [RecordEndDateTime]
		FROM Staging.Migrant tp
		WHERE tp.PersonProgramParticipationId IS NULL
		AND tp.OrganizationPersonRoleID_MigrantProgram IS NOT NULL
		AND tp.ProgramParticipationStartDate IS NOT NULL

		--Update the temporary table with the Migrant Program PersonProgramParticipationId--

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET PersonProgramParticipationId = ppp.PersonProgramParticipationId
		FROM Staging.Migrant tp
		JOIN ODS.PersonProgramParticipation ppp ON tp.OrganizationPersonRoleID_MigrantProgram = ppp.OrganizationPersonRoleId
		WHERE ppp.RecordStartDateTime = ISNULL(tp.ProgramParticipationStartDate, App.GetFiscalYearStartDate(@SchoolYear))
		AND ppp.RecordEndDateTime = ISNULL(tp.ProgramParticipationExitDate, App.GetFiscalYearEndDate(@SchoolYear))

		-------------------------------------------------------------------------------
		----Create ProgramParticipationMigrant records for the Student ----------------
		-------------------------------------------------------------------------------

		--Create a ProgramParticipationMigrant for each PersonProgramParticipation--

		--Check to see if ProgramParticipationMigrant already exists

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET ProgramParticipationMigrantId = ppm.ProgramParticipationMigrantId
		FROM Staging.Migrant mp
		JOIN ODS.PersonProgramParticipation pp ON mp.PersonProgramParticipationId = pp.PersonProgramParticipationId
		JOIN ODS.ProgramParticipationMigrant ppm ON pp.PersonProgramParticipationId = ppm.PersonProgramParticipationId
		WHERE ISNULL(ppm.RecordStartDateTime, App.GetFiscalYearStartDate(@SchoolYear)) = ISNULL(mp.ProgramParticipationStartDate, App.GetFiscalYearStartDate(@SchoolYear))
		AND ISNULL(ppm.RecordEndDateTime, App.GetFiscalYearEndDate(@SchoolYear)) = ISNULL(mp.ProgramParticipationExitDate, App.GetFiscalYearEndDate(@SchoolYear))
		
		--Staging.Migrant
		INSERT INTO [ODS].[ProgramParticipationMigrant]
				   ([PersonProgramParticipationId]
				   ,[RefMepEnrollmentTypeId]
				   ,[RefMepProjectBasedId]
				   ,[RefMepServiceTypeId]
				   ,[MepEligibilityExpirationDate]
				   ,[ContinuationOfServicesStatus]
				   ,[RefContinuationOfServicesReasonId]
				   ,[BirthdateVerification]
				   ,[ImmunizationRecordFlag]
				   ,[MigrantStudentQualifyingArrivalDate]
				   ,[LastQualifyingMoveDate]
				   ,[QualifyingMoveFromCity]
				   ,[RefQualifyingMoveFromStateId]
				   ,[RefQualifyingMoveFromCountryId]
				   ,[DesignatedGraduationSchoolId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime]
				   ,[PrioritizedForServices])
		SELECT DISTINCT
					mp.PersonProgramParticipationId [PersonProgramParticipationId]
				   ,mepe.RefMepEnrollmentTypeId [RefMepEnrollmentTypeId]
				   ,NULL [RefMepProjectBasedId]
				   ,mepst.RefMepServiceTypeId [RefMepServiceTypeId]
				   ,NULL [MepEligibilityExpirationDate]
				   ,mp.MigrantEducationProgramContinuationOfServicesStatus [ContinuationOfServicesStatus]
				   ,conser.RefContinuationOfServicesReasonId [RefContinuationOfServicesReasonId]
				   ,NULL [BirthdateVerification]
				   ,NULL [ImmunizationRecordFlag]
				   ,mp.MigrantStudentQualifyingArrivalDate [MigrantStudentQualifyingArrivalDate]
				   ,mp.LastQualifyingMoveDate [LastQualifyingMoveDate]
				   ,NULL [QualifyingMoveFromCity]
				   ,NULL [RefQualifyingMoveFromStateId]
				   ,NULL [RefQualifyingMoveFromCountryId]
				   ,NULL [DesignatedGraduationSchoolId]
				   ,ISNULL(ProgramParticipationStartDate, App.GetFiscalYearStartDate(@SchoolYear)) [RecordStartDateTime]
				   ,ISNULL(ProgramParticipationStartDate, App.GetFiscalYearEndDate(@SchoolYear)) [RecordEndDateTime]
				   ,MigrantPrioritizedForServices [PrioritizedForServices]
		FROM Staging.Migrant mp
		JOIN ODS.SourceSystemReferenceData mepenrollment 
			ON mp.MigrantEducationProgramEnrollmentType = mepenrollment.InputCode
			AND mepenrollment.TableName = 'RefMepEnrollmentType'
			AND mepenrollment.SchoolYear = @SchoolYear
		JOIN ODS.RefMepEnrollmentType mepe 
			ON mepenrollment.OutputCode = mepe.Code
		JOIN ODS.SourceSystemReferenceData mepservice 
			ON mp.MigrantEducationProgramServicesType = mepservice.InputCode
			AND mepservice.TableName = 'RefMepServiceType'
			AND mepservice.SchoolYear = @SchoolYear
		JOIN ODS.RefMepServiceType mepst 
			ON mepservice.OutputCode = mepst.Code
		LEFT JOIN ODS.SourceSystemReferenceData ContinuationOfServices
			ON mp.ContinuationOfServicesReason = ContinuationOfServices.InputCode
			AND ContinuationOfServices.TableName = 'RefContinuationOfServices'
			AND ContinuationOfServices.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefContinuationOfServices conser 
			ON ContinuationOfServices.OutputCode = conser.Code
		WHERE mp.PersonProgramParticipationId IS NOT NULL
		AND mp.ProgramParticipationMigrantId IS NULL

		--Update ProgramParticipationMigrantId in the staging table--

		UPDATE Staging.Migrant
		SET ProgramParticipationMigrantId = ppm.ProgramParticipationMigrantId
		FROM Staging.Migrant mp
		JOIN ODS.PersonProgramParticipation pp ON mp.PersonProgramParticipationId = pp.PersonProgramParticipationId
		JOIN ODS.ProgramParticipationMigrant ppm ON pp.PersonProgramParticipationId = ppm.PersonProgramParticipationId
		WHERE ISNULL(ppm.RecordStartDateTime, App.GetFiscalYearStartDate(@SchoolYear)) = ISNULL(mp.ProgramParticipationStartDate, App.GetFiscalYearStartDate(@SchoolYear))
		AND ISNULL(ppm.RecordEndDateTime, App.GetFiscalYearEndDate(@SchoolYear)) = ISNULL(mp.ProgramParticipationExitDate, App.GetFiscalYearEndDate(@SchoolYear))
		


		set nocount off;


	END TRY
	BEGIN CATCH



	END CATCH; 

END





GO


