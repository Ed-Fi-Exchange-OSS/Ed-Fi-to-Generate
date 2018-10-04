USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipation_EncapsulatedCode]    Script Date: 6/5/2018 3:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode]
	@SchoolYear SMALLINT
	AS
	BEGIN

	BEGIN TRY
	
		set nocount on;




---Additional Items to add in the future - exit/withdraw reason--
--Need to add ProgramParticipationSpecialEducation into this stored procedure - grab from membership child count
--Need to add PersonProgramParticipation into this stored procedure - grab grom membership child count

			
		-------------------------------------------------------
		---Associate the PersonId with the temporary table ----
		-------------------------------------------------------

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET PersonID = pid.PersonId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.PersonIdentifier pid ON ppse.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075') 
		AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011') 
		--------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.OrganizationIdentifier orgid ON ppse.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
		AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073') 
		
		---------------------------------------------------------------------------------------
		---Associate the Special Education Program OrganizationId with the temporary table ----
		---------------------------------------------------------------------------------------

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET OrganizationID_Program = orgd.OrganizationId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.OrganizationRelationship ord ON ppse.OrganizationID_School = ord.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd ON ord.OrganizationId = orgd.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156') 
		AND orgd.Name = 'Special Education Program'

		----------------------------------------------------------------------------------------------
		---Manage the Special Education Program OrganizationPersonRole Records for each Student ------
		----------------------------------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationPersonRole]
				   ([OrganizationId]
				   ,[PersonId]
				   ,[RoleId]
				   ,[EntryDate]
				   ,[ExitDate])
		SELECT DISTINCT
					ppse.OrganizationID_Program [OrganizationId]
				   ,ppse.PersonID [PersonId]
				   ,App.GetRoleId('K12 Student')  [RoleId]
				   ,ProgramParticipationBeginDate [EntryDate]
				   ,ProgramParticipationEndDate [ExitDate]
		FROM Staging.ProgramParticipationSpecialEducation ppse
		LEFT JOIN ODS.OrganizationPersonRole opr 
			ON ppse.PersonID = opr.PersonId
			AND ppse.ProgramParticipationBeginDate = opr.EntryDate
			AND ISNULL(ppse.ProgramParticipationEndDate, '1900-01-01') = ISNULL(opr.ExitDate, '1900-01-01')
			AND ppse.OrganizationID_Program = opr.OrganizationId
			AND opr.RoleId = App.GetRoleId('K12 Student')
		WHERE opr.PersonId IS NULL
			AND ppse.OrganizationID_Program IS NOT NULL
			AND ppse.PersonID IS NOT NULL

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET OrganizationPersonRoleId_Program = opr.OrganizationPersonRoleId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.OrganizationPersonRole opr 
			ON ppse.PersonID = opr.PersonId 
		WHERE ppse.OrganizationID_Program = opr.OrganizationId
			AND opr.RoleId = App.GetRoleId('K12 Student') 
			AND EntryDate = ppse.ProgramParticipationBeginDate

		-------------------------------------------------------------------------------
		---Delete any OrganizationPersonRole Records not found in the temp table ------
		-------------------------------------------------------------------------------

		CREATE TABLE #RecordsToDelete_OrganizationPersonRole
			(OrganizationPersonRoleId INT)
		INSERT INTO #RecordsToDelete_OrganizationPersonRole
			(OrganizationPersonRoleId)
		SELECT DISTINCT OrganizationPersonRoleId 
		FROM ODS.OrganizationPersonRole opr
		JOIN ODS.OrganizationDetail orgd 
			ON opr.OrganizationId = orgd.OrganizationId
		LEFT JOIN Staging.ProgramParticipationSpecialEducation e 
			ON opr.OrganizationPersonRoleId = e.OrganizationPersonRoleId_Program
		WHERE e.PersonId IS NULL
		AND opr.RoleId = App.GetRoleId('K12 Student') 
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156') 
		AND opr.EntryDate IS NOT NULL
		AND opr.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear) 
		AND orgd.Name = 'Special Education Program'

		CREATE TABLE #RecordsToDelete_PersonProgramParticipation
			(PersonProgramParticipationId INT)
		INSERT INTO #RecordsToDelete_PersonProgramParticipation
			(PersonProgramParticipationId)
		SELECT DISTINCT PersonProgramParticipationId
		FROM ODS.PersonProgramParticipation ppp
		JOIN #RecordsToDelete_OrganizationPersonRole rtdopr 
			ON ppp.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId


		---------------------------------------------------------------------------
		--Remove any records that are not in the Current ODS for this School Year--
		---------------------------------------------------------------------------

		DELETE ppp 
		FROM ODS.ProgramParticipationCte ppp 
		JOIN #RecordsToDelete_PersonProgramParticipation rtdppp 
			ON ppp.PersonProgramParticipationId = rtdppp.PersonProgramParticipationId
		
		DELETE ppp 
		FROM ODS.ProgramParticipationMigrant ppp 
		JOIN #RecordsToDelete_PersonProgramParticipation rtdppp 
			ON ppp.PersonProgramParticipationId = rtdppp.PersonProgramParticipationId

		DELETE ppp 
		FROM ODS.ProgramParticipationTitleIIILEp ppp 
		JOIN #RecordsToDelete_PersonProgramParticipation rtdppp 
			ON ppp.PersonProgramParticipationId = rtdppp.PersonProgramParticipationId
		
		DELETE ppp 
		FROM ODS.ProgramParticipationSpecialEducation ppp 
		JOIN #RecordsToDelete_PersonProgramParticipation rtdppp
			ON ppp.PersonProgramParticipationId = rtdppp.PersonProgramParticipationId
		
		DELETE opr 
		FROM ODS.PersonProgramParticipation opr 
		JOIN #RecordsToDelete_OrganizationPersonRole rtdopr 
			ON opr.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId


		---------------------------------------------------------------------------
		--Create PersonProgramParticipation and ProgramParticipationSpecialEd -----
		---------------------------------------------------------------------------

		INSERT INTO [ODS].[PersonProgramParticipation]
				   ([OrganizationPersonRoleId]
				   ,[RefParticipationTypeId]
				   ,[RefProgramExitReasonId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT
					ppse.OrganizationPersonRoleId_Program [OrganizationPersonRoleId]
				   ,NULL [RefParticipationTypeId]
				   ,NULL [RefProgramExitReasonId]
				   ,ProgramParticipationBeginDate [RecordStartDateTime]
				   ,ProgramParticipationEndDate [RecordEndDateTime]
		FROM Staging.ProgramParticipationSpecialEducation ppse
		WHERE ppse.OrganizationPersonRoleId_Program IS NOT NULL

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET PersonProgramParticipationID = ppp.PersonProgramParticipationId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.PersonProgramParticipation ppp 
			ON ppse.OrganizationPersonRoleId_Program = ppp.OrganizationPersonRoleId
		
		INSERT INTO [ODS].[ProgramParticipationSpecialEducation]
				   ([PersonProgramParticipationId]
				   ,[AwaitingInitialIDEAEvaluationStatus]
				   ,[RefIDEAEducationalEnvironmentECId]
				   ,[RefIDEAEdEnvironmentSchoolAgeId]
				   ,[SpecialEducationFTE]
				   ,[RefSpecialEducationExitReasonId]
				   ,[SpecialEducationServicesExitDate]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT 
					ppse.PersonProgramParticipationID [PersonProgramParticipationId]
				   ,NULL [AwaitingInitialIDEAEvaluationStatus]
				   ,eeec.[RefIDEAEducationalEnvironmentECId] [RefIDEAEducationalEnvironmentECId]
				   ,eesa.[RefIDESEducationalEnvironmentSchoolAge] [RefIDEAEdEnvironmentSchoolAgeId]
				   ,NULL [SpecialEducationFTE]
				   ,seer.RefSpecialEducationExitReasonId [RefSpecialEducationExitReasonId]
				   ,NULL [SpecialEducationServicesExitDate]
				   ,ProgramParticipationBeginDate [RecordStartDateTime]
				   ,ProgramParticipationEndDate [RecordEndDateTime]
		FROM Staging.ProgramParticipationSpecialEducation ppse
		LEFT JOIN ODS.SourceSystemReferenceData rdec
			ON ppse.IDEAEducationalEnvironmentForEarlyChildhood = rdec.InputCode
			AND rdec.TableName = 'RefIDEAEducationalEnvironmentEC'
			AND rdec.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefIDEAEducationalEnvironmentEC eeec
			ON rdec.OutputCode = eeec.Code
		LEFT JOIN ODS.SourceSystemReferenceData rdsa
			ON ppse.IDEAEducationalEnvironmentForSchoolAge = rdsa.InputCode
			AND rdsa.TableName = 'RefIDEAEducationalEnvironmentSchoolAge'
			AND rdsa.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefIDEAEducationalEnvironmentSchoolAge eesa
			ON rdsa.OutputCode = eesa.Code
		LEFT JOIN ODS.SourceSystemReferenceData ersa
			ON ppse.SpecialEducationExitReason = ersa.InputCode
			AND ersa.TableName = 'RefSpecialEducationExitReason'
			AND ersa.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationExitReason seer
			ON ersa.OutputCode = seer.Code
		WHERE PersonProgramParticipationID IS NOT NULL



		----Error table logging will be inserted here.  Not only errors with the ETL itself, but with the data. The temporary tables will be checked
		----for erroneous or missing data and that information will be logged in a table that will eventually be displayed through the Generate UI



		DROP TABLE #RecordsToDelete_OrganizationPersonRole
		DROP TABLE #RecordsToDelete_PersonProgramParticipation



		set nocount off;


	END TRY
	BEGIN CATCH



	END CATCH; 

END

