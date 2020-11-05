-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment]    Script Date: 6/1/2018 11:58:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode]
	@SchoolYear SMALLINT
AS
BEGIN

	BEGIN TRY
	
		set nocount on;




---Additional Items to add in the future - exit/withdraw reason--


		-------------------------------------------------------
		---Associate the PersonId with the temporary table ----
		-------------------------------------------------------

		UPDATE Staging.Enrollment
		SET PersonId = pid.PersonId
		FROM Staging.Enrollment e
		JOIN ODS.PersonIdentifier pid ON e.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
		AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
		--------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.Enrollment
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.Enrollment e
		JOIN ODS.OrganizationIdentifier orgid ON e.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
		AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		--------------------------------------------------------------------
		---Manage the OrganizationPersonRole Records for each Student ------
		--------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationPersonRole]
				   ([OrganizationId]
				   ,[PersonId]
				   ,[RoleId]
				   ,[EntryDate]
				   ,[ExitDate])
		SELECT DISTINCT
					e.OrganizationID_School [OrganizationId]
				   ,e.PersonID [PersonId]
				   ,App.GetRoleId('K12 Student') [RoleId]
				   ,EnrollmentEntryDate [EntryDate]
				   ,EnrollmentExitDate [ExitDate]
		FROM Staging.Enrollment e
		LEFT JOIN ODS.OrganizationPersonRole opr 
			ON e.PersonID = opr.PersonId
			AND e.EnrollmentEntryDate = opr.EntryDate
			AND ISNULL(e.EnrollmentExitDate, '1900-01-01') = ISNULL(opr.ExitDate, '1900-01-01')
			AND e.OrganizationID_School = opr.OrganizationId
			AND opr.RoleId = App.GetRoleId('K12 Student')
		WHERE opr.PersonId IS NULL
			AND e.OrganizationID_School IS NOT NULL
			AND e.PersonID IS NOT NULL
			AND e.EnrollmentEntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
			AND (e.EnrollmentExitDate IS NULL OR e.EnrollmentExitDate <= App.GetFiscalYearEndDate(@SchoolYear))
			
		UPDATE Staging.Enrollment
		SET OrganizationPersonRoleId_School = opr.OrganizationPersonRoleId
		FROM Staging.Enrollment e
		JOIN ODS.OrganizationPersonRole opr 
			ON e.PersonID = opr.PersonId 
		WHERE e.OrganizationID_School = opr.OrganizationId
			AND opr.RoleId = App.GetRoleId('K12 Student')
			AND EntryDate = e.EnrollmentEntryDate


		----------------------------------------------------------------------------------
		---Delete any OrganizationPersonRole Records not found in the staging table ------
		----------------------------------------------------------------------------------

		CREATE TABLE #RecordsToDelete_OrganizationPersonRole
			(OrganizationPersonRoleId INT)


		INSERT INTO #RecordsToDelete_OrganizationPersonRole
			(OrganizationPersonRoleId)
		SELECT DISTINCT OrganizationPersonRoleId 
		FROM ODS.OrganizationPersonRole opr
		JOIN ODS.OrganizationDetail orgd 
			ON opr.OrganizationId = orgd.OrganizationId
		INNER JOIN Staging.Enrollment e 
			ON opr.OrganizationPersonRoleId = e.OrganizationPersonRoleId_School
		WHERE e.Id IS NULL
			AND opr.RoleId = App.GetRoleId('K12 Student')
			AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND opr.EntryDate IS NOT NULL
			AND opr.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)


		--Verify this is in the Program ETL and then delete
		--CREATE TABLE #RecordsToDelete_PersonProgramParticipation
		--	(PersonProgramParticipationId INT)


		--INSERT INTO #RecordsToDelete_PersonProgramParticipation
		--	(PersonProgramParticipationId)
		--SELECT DISTINCT PersonProgramParticipationId
		--FROM ODS.PersonProgramParticipation ppp
		--JOIN #RecordsToDelete_OrganizationPersonRole rtdopr 
		--	ON ppp.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId


		---------------------------------------------------------------------------
		--Remove any records that are not in the Current ODS for this School Year--
		---------------------------------------------------------------------------
		DELETE opr FROM ODS.K12StudentDiscipline opr JOIN #RecordsToDelete_OrganizationPersonRole rtdopr ON opr.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId
		DELETE opr FROM ODS.K12StudentEnrollment opr JOIN #RecordsToDelete_OrganizationPersonRole rtdopr ON opr.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId
		DELETE opr FROM ODS.OrganizationPersonRole opr Join #RecordsToDelete_OrganizationPersonRole rtdopr ON opr.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId



		---------------------------------------------------------------------------
		----Create K12StudentEnrollment Record for Each Student for Grade Level----
		---------------------------------------------------------------------------

		INSERT INTO [ODS].[K12StudentEnrollment]
				   ([OrganizationPersonRoleId]
				   ,[RefEntryGradeLevelId]
				   ,[RefPublicSchoolResidence]
				   ,[RefEnrollmentStatusId]
				   ,[RefEntryType]
				   ,[RefExitGradeLevel]
				   ,[RefExitOrWithdrawalStatusId]
				   ,[RefExitOrWithdrawalTypeId]
				   ,[DisplacedStudentStatus]
				   ,[RefEndOfTermStatusId]
				   ,[RefPromotionReasonId]
				   ,[RefNonPromotionReasonId]
				   ,[RefFoodServiceEligibilityId]
				   ,[FirstEntryDateIntoUSSchool]
				   ,[RefDirectoryInformationBlockStatusId]
				   ,[NSLPDirectCertificationIndicator]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					OrganizationPersonRoleId_School [OrganizationPersonRoleId]
				   ,gl.RefGradeLevelID [RefEntryGradeLevelId]
				   ,NULL [RefPublicSchoolResidence]
				   ,NULL [RefEnrollmentStatusId]
				   ,NULL [RefEntryType]
				   ,CASE 
						WHEN e.ExitWithdrawType IS NOT NULL THEN gl.RefGradeLevelId
						ELSE NULL
					END [RefExitGradeLevel]
				   ,NULL [RefExitOrWithdrawalStatusId]
				   ,ewt.RefExitOrWithdrawalTypeId [RefExitOrWithdrawalTypeId]
				   ,NULL [DisplacedStudentStatus]
				   ,NULL [RefEndOfTermStatusId]
				   ,NULL [RefPromotionReasonId]
				   ,NULL [RefNonPromotionReasonId]
				   ,NULL [RefFoodServiceEligibilityId]
				   ,NULL [FirstEntryDateIntoUSSchool]
				   ,NULL [RefDirectoryInformationBlockStatusId]
				   ,NULL [NSLPDirectCertificationIndicator]
				   ,EnrollmentEntryDate [RecordStartDateTime]
				   ,EnrollmentExitDate [RecordEndDateTime]
		FROM Staging.Enrollment e
		JOIN ODS.SourceSystemReferenceData rdg
			ON e.GradeLevel = rdg.InputCode
			AND rdg.TableName = 'RefGradeLevel'
			AND rdg.SchoolYear = @SchoolYear
		JOIN ODS.RefGradeLevel gl
			ON rdg.OutputCode = gl.Code
		JOIN ODS.RefGradeLevelType glt
			ON gl.RefGradeLevelTypeId = glt.RefGradeLevelTypeId
		LEFT JOIN ODS.SourceSystemReferenceData rdewt
			ON e.ExitWithdrawType = rdewt.InputCode
			AND rdewt.TableName = 'RefExitOrWithdrawalType'
			AND rdewt.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefExitOrWithdrawalType ewt
			ON rdewt.OutputCode = ewt.Code
		WHERE OrganizationPersonRoleId_School IS NOT NULL
			AND glt.Code = '000100'

		---------------------------------------------------------------------------
		----Create K12StudentEnrollment Record for Each Student for Grade Level----
		---------------------------------------------------------------------------


		DROP TABLE #RecordsToDelete_OrganizationPersonRole;
		--Delete when the sesction above is deleted
		--DROP TABLE #RecordsToDelete_PersonProgramParticipation;

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
