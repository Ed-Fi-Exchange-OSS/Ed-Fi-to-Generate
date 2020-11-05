﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode]   Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode]
	@SchoolYear SMALLINT


  AS
    /*************************************************************************************************************
   Date Created:  7/2/2018

    Purpose:
        The purpose of this ETL is to load Assessment data for EDFacts reporting.

    Assumptions:
        
    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources: 

    Data Targets:  Generate Database:   Generate

    Return Values:
    	 0	= Success
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;

			BEGIN TRY


		-------------------------------------------------------------------------
		----Create the Assessment -----------------------------------------------
		-------------------------------------------------------------------------

		--First need to determine if the Assessment already exists so that it is not added again
		
		UPDATE Staging.Assessment
		SET AssessmentId = a.AssessmentId
		FROM Staging.Assessment sa 
		JOIN ODS.Assessment a ON sa.AssessmentTitle = a.Title
		JOIN ODS.SourceSystemReferenceData osrd_subject 
			ON sa.AssessmentAcademicSubject = osrd_subject.InputCode
			AND osrd_subject.TableName = 'RefAcademicSubject'
			AND osrd_subject.SchoolYear = '2018'
		JOIN ODS.RefAcademicSubject ras ON osrd_subject.OutputCode = ras.Code
		JOIN ODS.SourceSystemReferenceData osrd_purpose
			ON sa.AssessmentPurpose = osrd_purpose.InputCode
			AND osrd_purpose.TableName = 'RefAssessmentPurpose'
			AND osrd_purpose.SchoolYear = '2018'
		JOIN ODS.RefAssessmentPurpose rap ON osrd_purpose.OutputCode = rap.Code
		JOIN ODS.SourceSystemReferenceData osrd_type
			ON sa.AssessmentType = osrd_type.InputCode
			AND osrd_type.TableName = 'RefAssessmentType'
			AND osrd_type.SchoolYear = '2018'
		JOIN ODS.RefAssessmentType rat ON osrd_type.OutputCode = rat.Code
		JOIN ODS.SourceSystemReferenceData osrd_typeCWD
			ON sa.AssessmentTypeAdministeredToChildrenWithDisabilities = osrd_typeCWD.InputCode
			AND osrd_typeCWD.TableName = 'RefAssessmentTypeChildrenWithDisabilities'
			AND osrd_typeCWD.SchoolYear = '2018'
		JOIN ODS.RefAssessmentTypeChildrenWithDisabilities rac ON osrd_typeCWD.OutputCode = rac.Code
		WHERE sa.AssessmentShortName = a.ShortName
		AND a.RefAcademicSubjectId = ras.RefAcademicSubjectId
		AND a.RefAssessmentPurposeId = rap.RefAssessmentPurposeId
		AND a.RefAssessmentTypeId = rat.RefAssessmentTypeId
		AND a.RefAssessmentTypeChildrenWithDisabilitiesId = rac.RefAssessmentTypeChildrenWithDisabilitiesId
		AND sa.AssessmentId IS NULL

		--Create the Assessment

		INSERT INTO [ODS].[Assessment]
				   ([Identifier]
				   ,[IdentificationSystem]
				   ,[GUID]
				   ,[Title]
				   ,[ShortName]
				   ,[RefAcademicSubjectId]
				   ,[Objective]
				   ,[Provider]
				   ,[RefAssessmentPurposeId]
				   ,[RefAssessmentTypeId]
				   ,[RefAssessmentTypeChildrenWithDisabilitiesId]
				   ,[AssessmentRevisionDate]
				   ,[AssessmentFamilyTitle]
				   ,[AssessmentFamilyShortName])
		SELECT DISTINCT 
				    NULL [Identifier]
				   ,NULL [IdentificationSystem]
				   ,NULL [GUID]
				   ,sa.AssessmentTitle [Title]
				   ,sa.AssessmentShortName [ShortName]
				   ,ras.RefAcademicSubjectId [RefAcademicSubjectId]
				   ,NULL [Objective]
				   ,NULL [Provider]
				   ,rap.RefAssessmentPurposeId [RefAssessmentPurposeId]
				   ,rat.RefAssessmentTypeId [RefAssessmentTypeId]
				   ,rac.RefAssessmentTypeChildrenWithDisabilitiesId [RefAssessmentTypeChildrenWithDisabilitiesId]
				   ,NULL [AssessmentRevisionDate]
				   ,sa.AssessmentFamilyTitle [AssessmentFamilyTitle]
				   ,sa.AssessmentFamilyShortName [AssessmentFamilyShortName]
		FROM Staging.Assessment sa
		JOIN ODS.SourceSystemReferenceData osrd_subject 
			ON sa.AssessmentAcademicSubject = osrd_subject.InputCode
			AND osrd_subject.TableName = 'RefAcademicSubject'
			AND osrd_subject.SchoolYear = @SchoolYear
		JOIN ODS.RefAcademicSubject ras ON osrd_subject.OutputCode = ras.Code
		JOIN ODS.SourceSystemReferenceData osrd_purpose
			ON sa.AssessmentPurpose = osrd_purpose.InputCode
			AND osrd_purpose.TableName = 'RefAssessmentPurpose'
			AND osrd_purpose.SchoolYear = @SchoolYear
		JOIN ODS.RefAssessmentPurpose rap ON osrd_purpose.OutputCode = rap.Code
		JOIN ODS.SourceSystemReferenceData osrd_type
			ON sa.AssessmentType = osrd_type.InputCode
			AND osrd_type.TableName = 'RefAssessmentType'
			AND osrd_type.SchoolYear = @SchoolYear
		JOIN ODS.RefAssessmentType rat ON osrd_type.OutputCode = rat.Code
		JOIN ODS.SourceSystemReferenceData osrd_typeCWD
			ON sa.AssessmentTypeAdministeredToChildrenWithDisabilities = osrd_typeCWD.InputCode
			AND osrd_typeCWD.TableName = 'RefAssessmentTypeChildrenWithDisabilities'
			AND osrd_typeCWD.SchoolYear = @SchoolYear
		JOIN ODS.RefAssessmentTypeChildrenWithDisabilities rac ON osrd_typeCWD.OutputCode = rac.Code
		WHERE AssessmentId IS NULL

		--Add the AssessmentId to the staging table

		UPDATE Staging.Assessment
		SET AssessmentId = a.AssessmentId
		FROM Staging.Assessment sa 
		JOIN ODS.Assessment a ON sa.AssessmentTitle = a.Title
		JOIN ODS.SourceSystemReferenceData osrd_subject 
			ON sa.AssessmentAcademicSubject = osrd_subject.InputCode
			AND osrd_subject.TableName = 'RefAcademicSubject'
			AND osrd_subject.SchoolYear = '2018'
		JOIN ODS.RefAcademicSubject ras ON osrd_subject.OutputCode = ras.Code
		JOIN ODS.SourceSystemReferenceData osrd_purpose
			ON sa.AssessmentPurpose = osrd_purpose.InputCode
			AND osrd_purpose.TableName = 'RefAssessmentPurpose'
			AND osrd_purpose.SchoolYear = '2018'
		JOIN ODS.RefAssessmentPurpose rap ON osrd_purpose.OutputCode = rap.Code
		JOIN ODS.SourceSystemReferenceData osrd_type
			ON sa.AssessmentType = osrd_type.InputCode
			AND osrd_type.TableName = 'RefAssessmentType'
			AND osrd_type.SchoolYear = '2018'
		JOIN ODS.RefAssessmentType rat ON osrd_type.OutputCode = rat.Code
		JOIN ODS.SourceSystemReferenceData osrd_typeCWD
			ON sa.AssessmentTypeAdministeredToChildrenWithDisabilities = osrd_typeCWD.InputCode
			AND osrd_typeCWD.TableName = 'RefAssessmentTypeChildrenWithDisabilities'
			AND osrd_typeCWD.SchoolYear = '2018'
		JOIN ODS.RefAssessmentTypeChildrenWithDisabilities rac ON osrd_typeCWD.OutputCode = rac.Code
		WHERE sa.AssessmentShortName = a.ShortName
		AND a.RefAcademicSubjectId = ras.RefAcademicSubjectId
		AND a.RefAssessmentPurposeId = rap.RefAssessmentPurposeId
		AND a.RefAssessmentTypeId = rat.RefAssessmentTypeId
		AND a.RefAssessmentTypeChildrenWithDisabilitiesId = rac.RefAssessmentTypeChildrenWithDisabilitiesId
		AND sa.AssessmentId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentAdministration----------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentAdministration already exists so that it is not added again

		UPDATE Staging.Assessment
		SET AssessmentAdministrationId = aa.AssessmentAdministrationId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentAdministration aa 
			ON a.AssessmentId = aa.AssessmentAdministrationId
		WHERE aa.StartDate = sa.AssessmentAdministrationStartDate
		AND aa.FinishDate = sa.AssessmentAdministrationFinishDate
		AND sa.AssessmentAdministrationId IS NULL

		--Create the AssessmentAdministration

		INSERT INTO [ODS].[AssessmentAdministration]
           ([AssessmentId]
           ,[Name]
           ,[Code]
           ,[StartDate]
           ,[StartTime]
           ,[FinishDate]
           ,[FinishTime]
           ,[RefAssessmentReportingMethodId]
           ,[AssessmentSecureIndicator]
           ,[AssessmentAdministrationPeriodDescription])
		SELECT DISTINCT
            sa.[AssessmentId]
           ,NULL [Name]
           ,NULL [Code]
           ,sa.AssessmentAdministrationStartDate [StartDate]
           ,NULL [StartTime]
           ,sa.AssessmentAdministrationFinishDate [FinishDate]
           ,NULL [FinishTime]
           ,NULL [RefAssessmentReportingMethodId]
           ,NULL [AssessmentSecureIndicator]
           ,NULL [AssessmentAdministrationPeriodDescription]
		FROM Staging.Assessment sa
		WHERE sa.AssessmentAdministrationId IS NULL
		AND sa.AssessmentId IS NOT NULL

		--Add the AssessmentAdministrationId to the Staging table

		UPDATE Staging.Assessment
		SET AssessmentAdministrationId = aa.AssessmentAdministrationId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentAdministration aa 
			ON a.AssessmentId = aa.AssessmentAdministrationId
		WHERE aa.StartDate = sa.AssessmentAdministrationStartDate
		AND aa.FinishDate = sa.AssessmentAdministrationFinishDate
		AND sa.AssessmentAdministrationId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentForm -------------------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentForm already exists so that it is not added again

		UPDATE Staging.Assessment
		SET AssessmentFormId = af.AssessmentFormId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		WHERE sa.AssessmentFormId IS NULL
		AND af.Name = sa.AssessmentTitle

		--Create the AssessmentForm

		INSERT INTO [ODS].[AssessmentForm]
           ([AssessmentId]
           ,[FormNumber]
           ,[Name]
           ,[Version]
           ,[PublishedDate]
           ,[AccommodationList]
           ,[IntendedAdministrationStartDate]
           ,[IntendedAdministrationEndDate]
           ,[AssessmentItemBankIdentifier]
           ,[AssessmentItemBankName]
           ,[PlatformsSupported]
           ,[RefAssessmentLanguageId]
           ,[AssessmentSecureIndicator]
           ,[LearningResourceId]
           ,[AssessmentFormAdaptiveIndicator]
           ,[AssessmentFormAlgorithmIdentifier]
           ,[AssessmentFormAlgorithmVersion]
           ,[AssessmentFormGUID])
		SELECT DISTINCT
            sa.AssessmentId [AssessmentId]
           ,NULL [FormNumber]
           ,sa.AssessmentTitle [Name]
           ,NULL [Version]
           ,NULL [PublishedDate]
           ,NULL [AccommodationList]
           ,NULL [IntendedAdministrationStartDate]
           ,NULL [IntendedAdministrationEndDate]
           ,NULL [AssessmentItemBankIdentifier]
           ,NULL [AssessmentItemBankName]
           ,NULL [PlatformsSupported]
           ,NULL [RefAssessmentLanguageId]
           ,NULL [AssessmentSecureIndicator]
           ,NULL [LearningResourceId]
           ,NULL [AssessmentFormAdaptiveIndicator]
           ,NULL [AssessmentFormAlgorithmIdentifier]
           ,NULL [AssessmentFormAlgorithmVersion]
           ,NULL [AssessmentFormGUID]
		FROM Staging.Assessment sa
		WHERE sa.AssessmentFormId IS NULL
		AND sa.AssessmentId IS NOT NULL

		--Add the AssessmentFormId to the Staging table

		UPDATE Staging.Assessment
		SET AssessmentFormId = af.AssessmentFormId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		WHERE sa.AssessmentFormId IS NULL
		AND af.Name = sa.AssessmentTitle

		-------------------------------------------------------------------------
		----Create the AssessmentSubtest ----------------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentSubtest already exists so that it is not added again

		UPDATE Staging.Assessment
		SET AssessmentSubtestId = sub.AssessmentSubtestId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		JOIN ODS.AssessmentSubtest sub 
			ON af.AssessmentFormId = sub.AssessmentFormId
		WHERE sa.AssessmentTitle = sub.Title
		AND sa.AssessmentFormId = sub.AssessmentFormId
		AND sa.AssessmentSubtestId IS NULL

		--Create the AssessmentSubtest

		INSERT INTO [ODS].[AssessmentSubtest]
           ([Identifier]
           ,[RefAssessmentSubtestIdentifierTypeId]
           ,[Title]
           ,[Version]
           ,[PublishedDate]
           ,[Abbreviation]
           ,[RefScoreMetricTypeId]
           ,[MinimumValue]
           ,[MaximumValue]
           ,[OptimalValue]
           ,[Tier]
           ,[ContainerOnly]
           ,[RefAssessmentPurposeId]
           ,[Description]
           ,[Rules]
           ,[RefContentStandardTypeId]
           ,[RefAcademicSubjectId]
           ,[ChildOf_AssessmentSubtestId]
           ,[AssessmentFormId])
		SELECT DISTINCT
            NULL [Identifier]
           ,NULL [RefAssessmentSubtestIdentifierTypeId]
           ,sa.AssessmentTitle [Title]
           ,NULL [Version]
           ,NULL [PublishedDate]
           ,NULL [Abbreviation]
           ,NULL [RefScoreMetricTypeId]
           ,NULL [MinimumValue]
           ,NULL [MaximumValue]
           ,NULL [OptimalValue]
           ,NULL [Tier]
           ,NULL [ContainerOnly]
           ,NULL [RefAssessmentPurposeId]
           ,NULL [Description]
           ,NULL [Rules]
           ,NULL [RefContentStandardTypeId]
           ,NULL [RefAcademicSubjectId]
           ,NULL [ChildOf_AssessmentSubtestId]
           ,sa.AssessmentFormId [AssessmentFormId]
		FROM Staging.Assessment sa
		WHERE sa.AssessmentSubtestId IS NULL
		AND sa.AssessmentFormId IS NOT NULL
		
		--Add the AssessmentSubestId to the Staging table

		UPDATE Staging.Assessment
		SET AssessmentSubtestId = sub.AssessmentSubtestId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		JOIN ODS.AssessmentSubtest sub 
			ON af.AssessmentFormId = sub.AssessmentFormId
		WHERE sa.AssessmentTitle = sub.Title
		AND sa.AssessmentFormId = sub.AssessmentFormId
		AND sa.AssessmentSubtestId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentPerformanceLevel--------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentPerformanceLevel already exists so that it is not added again

		UPDATE Staging.Assessment
		SET AssessmentPerformanceLevelId = apl.AssessmentPerformanceLevelId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		JOIN ODS.AssessmentSubtest sub 
			ON af.AssessmentFormId = sub.AssessmentFormId
		JOIN ODS.AssessmentPerformanceLevel apl 
			ON sub.AssessmentSubtestId = apl.AssessmentSubtestId
		JOIN ODS.SourceSystemReferenceData osrd_performance
			ON apl.Label = osrd_performance.InputCode
			AND osrd_performance.TableName = 'AssessmentPerformanceLevel_Identifier'
			AND osrd_performance.SchoolYear = @SchoolYear
		WHERE sa.AssessmentPerformanceLevelId IS NULL
		AND sa.AssessmentPerformanceLevelIdentifier = osrd_performance.InputCode
		AND sa.AssessmentPerformanceLevelLabel = apl.Label

		--Create the AssessmentPerformanceLevels

		INSERT INTO [ODS].[AssessmentPerformanceLevel]
           ([Identifier]
           ,[AssessmentSubtestId]
           ,[ScoreMetric]
           ,[Label]
           ,[LowerCutScore]
           ,[UpperCutScore]
           ,[DescriptiveFeedback])
		SELECT DISTINCT
            osrd_performance.OutputCode [Identifier]
           ,sa.AssessmentSubtestId [AssessmentSubtestId]
           ,NULL [ScoreMetric]
           ,sa.AssessmentPerformanceLevelLabel [Label]
           ,NULL [LowerCutScore]
           ,NULL [UpperCutScore]
           ,NULL [DescriptiveFeedback]
		FROM Staging.Assessment sa
		JOIN ODS.SourceSystemReferenceData osrd_performance
			ON sa.AssessmentPerformanceLevelIdentifier = osrd_performance.InputCode
			AND osrd_performance.TableName = 'AssessmentPerformanceLevel_Identifier'
			AND osrd_performance.SchoolYear = @SchoolYear
		WHERE sa.AssessmentPerformanceLevelId IS NULL
		AND sa.AssessmentSubtestId IS NOT NULL

		--Add the AssessmentPerformanceLevelId to the Staging table

		UPDATE Staging.Assessment
		SET AssessmentPerformanceLevelId = apl.AssessmentPerformanceLevelId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		JOIN ODS.AssessmentSubtest sub 
			ON af.AssessmentFormId = sub.AssessmentFormId
		JOIN ODS.AssessmentPerformanceLevel apl 
			ON sub.AssessmentSubtestId = apl.AssessmentSubtestId
		JOIN ODS.SourceSystemReferenceData osrd_performance
			ON apl.Label = osrd_performance.InputCode
			AND osrd_performance.TableName = 'AssessmentPerformanceLevel_Identifier'
			AND osrd_performance.SchoolYear = @SchoolYear
		WHERE sa.AssessmentPerformanceLevelId IS NULL
		AND sa.AssessmentPerformanceLevelIdentifier = osrd_performance.InputCode
		AND sa.AssessmentPerformanceLevelLabel = apl.Label


		-------------------------------------------------------
		---Associate the PersonId with the staging table ------
		-------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET PersonID = pid.PersonId
		FROM Staging.AssessmentResult sar
		JOIN ODS.PersonIdentifier pid 
			ON sar.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
			AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')

		--------------------------------------------------------------------
		---Associate the School OrganizationId with the staging table ------
		--------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.AssessmentResult sar
		JOIN ODS.OrganizationIdentifier orgid 
			ON sar.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
			AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		----------------------------------------------------------------------------------------------------------------------
		---Associate the OrganizationPersonRoleId related to the AssessmentAdministrationStartDate with the staging table ----
		----------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET OrganizationPersonRoleID_School = opr.OrganizationPersonRoleId
		FROM Staging.AssessmentResult sar
		JOIN ODS.OrganizationPersonRole opr 
			ON sar.PersonID = opr.PersonId
		JOIN Staging.Assessment sa 
			ON sar.AssessmentTitle = sa.AssessmentTitle
			AND sar.AssessmentAcademicSubject = sa.AssessmentAcademicSubject
			AND sar.AssessmentTypeAdministeredToChildrenWithDisabilities = sa.AssessmentTypeAdministeredToChildrenWithDisabilities
			AND sar.AssessmentPurpose = sa.AssessmentPurpose
			AND sar.AssessmentType = sa.AssessmentType
		WHERE sar.OrganizationID_School = opr.OrganizationId
			AND opr.EntryDate <= sa.AssessmentAdministrationStartDate
			AND (opr.ExitDate IS NULL OR opr.ExitDate >= sa.AssessmentAdministrationStartDate)

		--Create an OrganizationPersonRole here where none exists

		----------------------------------------------------------------------
		---Associate the AssessmentId with the staging table -----------------
		----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult 
		SET AssessmentId = sa.AssessmentId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa
			ON ar.AssessmentTitle = sa.AssessmentTitle
			AND ar.AssessmentAcademicSubject = sa.AssessmentAcademicSubject
			AND ar.AssessmentPurpose = sa.AssessmentPurpose
			AND ar.AssessmentType = sa.AssessmentType
			AND ar.AssessmentTypeAdministeredToChildrenWithDisabilities = sa.AssessmentTypeAdministeredToChildrenWithDisabilities
		WHERE ar.AssessmentId IS NULL

		-----------------------------------------------------------------------
		---Associate the AssessmentAdministrationId with the staging table ----
		-----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET AssessmentAdministrationId = sa.AssessmentAdministrationId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa 
			ON ar.AssessmentId = sa.AssessmentId
			AND ar.AssessmentAdministrationStartDate = sa.AssessmentAdministrationStartDate
			AND ar.AssessmentAdministrationFinishDate = sa.AssessmentAdministrationFinishDate
		WHERE ar.AssessmentAdministrationId IS NULL

		-----------------------------------------------------------------------
		---Associate the AssessmentFormId with the staging table --------------
		-----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET AssessmentFormId = sa.AssessmentFormId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa 
			ON ar.AssessmentId = sa.AssessmentId
		WHERE ar.AssessmentFormId IS NULL

		-----------------------------------------------------------------------
		---Associate the AssessmentSubtestId with the staging table -----------
		-----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET AssessmentSubtestId = sa.AssessmentSubtestId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa 
			ON ar.AssessmentId = sa.AssessmentId
			AND ar.AssessmentFormId = sa.AssessmentFormId
		WHERE ar.AssessmentSubtestId IS NULL

		-----------------------------------------------------------------------
		---Associate the AssessmentPerformanceLevelId with the staging table --
		-----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET AssessmentPerformanceLevelId = sa.AssessmentPerformanceLevelId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa 
			ON ar.AssessmentId = sa.AssessmentId
			AND ar.AssessmentFormId = sa.AssessmentFormId
			AND ar.AssessmentSubtestId = sa.AssessmentSubtestId
			AND ar.AssessmentPerformanceLevelIdentifier = sa.AssessmentPerformanceLevelIdentifier
			AND ar.AssessmentPerformanceLevelLabel = sa.AssessmentPerformanceLevelLabel
		WHERE ar.AssessmentPerformanceLevelId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentRegistration -----------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentRegistration already exists so that it is not added again

		UPDATE Staging.AssessmentResult
		SET AssessmentRegistrationId = areg.AssessmentRegistrationId
		FROM Staging.AssessmentResult ar
		JOIN ODS.AssessmentRegistration areg
			ON ar.AssessmentFormId = areg.AssessmentFormId
			AND ar.AssessmentAdministrationId = areg.AssessmentAdministrationId
			AND ar.PersonId = areg.PersonId
			AND ar.OrganizationID_School = areg.SchoolOrganizationId
		WHERE ar.AssessmentRegistrationId IS NULL

		--Create the AssessmentRegistration

		INSERT INTO [ODS].[AssessmentRegistration]
				   ([CreationDate]
				   ,[DaysOfInstructionPriorToAssessment]
				   ,[ScorePublishDate]
				   ,[TestAttemptIdentifier]
				   ,[RetestIndicator]
				   ,[CourseSectionOrganizationId]
				   ,[RefAssessmentParticipationIndicatorId]
				   ,[TestingIndicator]
				   ,[RefAssessmentPurposeId]
				   ,[RefAssessmentReasonNotTestedId]
				   ,[RefAssessmentReasonNotCompletingId]
				   ,[RefGradeLevelToBeAssessedId]
				   ,[RefGradeLevelWhenAssessedId]
				   ,[PersonId]
				   ,[AssessmentFormId]
				   ,[OrganizationId]
				   ,[SchoolOrganizationId]
				   ,[LeaOrganizationId]
				   ,[AssessmentAdministrationId]
				   ,[AssignedByPersonId]
				   ,[AssessmentRegistrationCompletionStatusDateTime]
				   ,[RefAssessmentRegistrationCompletionStatusId]
				   ,[StateFullAcademicYear]
				   ,[LEAFullAcademicYear]
				   ,[SchoolFullAcademicYear])
		SELECT DISTINCT
				    NULL [CreationDate]
				   ,NULL [DaysOfInstructionPriorToAssessment]
				   ,NULL [ScorePublishDate]
				   ,NULL [TestAttemptIdentifier]
				   ,NULL [RetestIndicator]
				   ,NULL [CourseSectionOrganizationId]
				   ,pid.RefAssessmentParticipationIndicatorId [RefAssessmentParticipationIndicatorId]
				   ,NULL [TestingIndicator]
				   ,NULL [RefAssessmentPurposeId]
				   ,NULL [RefAssessmentReasonNotTestedId]
				   ,rarnc.RefAssessmentReasonNotCompletingId [RefAssessmentReasonNotCompletingId]
				   ,NULL [RefGradeLevelToBeAssessedId]
				   ,rgl.RefGradeLevelId [RefGradeLevelWhenAssessedId]
				   ,ar.PersonId [PersonId]
				   ,ar.AssessmentFormId [AssessmentFormId]
				   ,NULL [OrganizationId]
				   ,ar.OrganizationID_School [SchoolOrganizationId]
				   ,NULL [LeaOrganizationId]
				   ,ar.AssessmentAdministrationId [AssessmentAdministrationId]
				   ,NULL [AssignedByPersonId]
				   ,NULL [AssessmentRegistrationCompletionStatusDateTime]
				   ,NULL [RefAssessmentRegistrationCompletionStatusId]
				   ,ar.StateFullAcademicYear [StateFullAcademicYear]
				   ,ar.LEAFullAcademicYear [LEAFullAcademicYear]
				   ,ar.SchoolFullAcademicYear [SchoolFullAcademicYear]
		FROM Staging.AssessmentResult ar
		JOIN ODS.SourceSystemReferenceData osrd_participation
			ON ar.AssessmentRegistrationParticipationIndicator = osrd_participation.InputCode
			AND osrd_participation.TableName = 'RefAssessmentParticipationIndicator'
			AND osrd_participation.SchoolYear = @SchoolYear
		JOIN ODS.RefAssessmentParticipationIndicator pid 
			ON osrd_participation.OutputCode = pid.Code
		JOIN ODS.SourceSystemReferenceData osrd_gradelevel
			ON ar.GradeLevelWhenAssessed = osrd_gradelevel.InputCode
			AND osrd_gradelevel.TableName = 'RefGradeLevel'
			AND osrd_gradelevel.TableFilter = '000126'
			AND osrd_gradelevel.SchoolYear = @SchoolYear
		JOIN ODS.RefGradeLevel rgl 
			ON osrd_gradelevel.OutputCode = rgl.Code
		JOIN ODS.RefGradeLevelType rglt 
			ON osrd_gradelevel.TableFilter = rglt.Code
		LEFT JOIN ODS.SourceSystemReferenceData osrd_reasonnotcompleting
			ON ar.AssessmentRegistrationReasonNotCompleting = osrd_reasonnotcompleting.InputCode
			AND osrd_reasonnotcompleting.TableName = 'RefAssessmentReasonNotCompleting'
			AND osrd_reasonnotcompleting.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefAssessmentReasonNotCompleting rarnc 
			ON osrd_reasonnotcompleting.OutputCode = rarnc.Code
		WHERE ar.AssessmentRegistrationId IS NULL
		AND ar.PersonId IS NOT NULL
		AND ar.AssessmentFormId IS NOT NULL
		AND ar.OrganizationID_School IS NOT NULL
		AND ar.AssessmentAdministrationId IS NOT NULL

		--Add AssessmentRegistrationId to the staging table

		UPDATE Staging.AssessmentResult
		SET AssessmentRegistrationId = areg.AssessmentRegistrationId
		FROM Staging.AssessmentResult ar
		JOIN ODS.AssessmentRegistration areg
			ON ar.AssessmentFormId = areg.AssessmentFormId
			AND ar.AssessmentAdministrationId = areg.AssessmentAdministrationId
			AND ar.PersonId = areg.PersonId
			AND ar.OrganizationID_School = areg.SchoolOrganizationId
		WHERE ar.AssessmentRegistrationId IS NULL


		-------------------------------------------------------------------------
		----Create the AssessmentResult -----------------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentResult already exists so that it is not added again

		UPDATE Staging.AssessmentResult
		SET AssessmentResultId = ares.AssessmentResultId
		FROM Staging.AssessmentResult sa
		JOIN ODS.AssessmentResult ares 
			ON sa.AssessmentRegistrationId = ares.AssessmentRegistrationId
			AND sa.AssessmentSubtestId = ares.AssessmentSubtestId
		WHERE sa.AssessmentResultId IS NULL


		--Create the AssessmentResult

		INSERT INTO [ODS].[AssessmentResult]
				   ([ScoreValue]
				   ,[RefScoreMetricTypeId]
				   ,[PreliminaryIndicator]
				   ,[RefAssessmentPretestOutcomeId]
				   ,[NumberOfResponses]
				   ,[DiagnosticStatement]
				   ,[DiagnosticStatementSource]
				   ,[DescriptiveFeedback]
				   ,[DescriptiveFeedbackSource]
				   ,[InstructionalRecommendation]
				   ,[IncludedInAypCalculation]
				   ,[DateUpdated]
				   ,[DateCreated]
				   ,[AssessmentSubtestId]
				   ,[AssessmentRegistrationId]
				   ,[RefELOutcomeMeasurementLevelId]
				   ,[RefOutcomeTimePointId]
				   ,[AssessmentResultDescriptiveFeedbackDateTime]
				   ,[AssessmentResultScoreStandardError]
				   ,[RefAssessmentResultDataTypeId]
				   ,[RefAssessmentResultScoreTypeId])
		SELECT DISTINCT
				    NULL [ScoreValue]
				   ,NULL [RefScoreMetricTypeId]
				   ,NULL [PreliminaryIndicator]
				   ,NULL [RefAssessmentPretestOutcomeId]
				   ,NULL [NumberOfResponses]
				   ,NULL [DiagnosticStatement]
				   ,NULL [DiagnosticStatementSource]
				   ,NULL [DescriptiveFeedback]
				   ,NULL [DescriptiveFeedbackSource]
				   ,NULL [InstructionalRecommendation]
				   ,NULL [IncludedInAypCalculation]
				   ,NULL [DateUpdated]
				   ,NULL [DateCreated]
				   ,sa.AssessmentSubtestId [AssessmentSubtestId]
				   ,sa.AssessmentRegistrationId [AssessmentRegistrationId]
				   ,NULL [RefELOutcomeMeasurementLevelId]
				   ,NULL [RefOutcomeTimePointId]
				   ,NULL [AssessmentResultDescriptiveFeedbackDateTime]
				   ,NULL [AssessmentResultScoreStandardError]
				   ,NULL [RefAssessmentResultDataTypeId]
				   ,NULL [RefAssessmentResultScoreTypeId]
		FROM Staging.AssessmentResult sa
		WHERE AssessmentResultId IS NULL
		AND sa.AssessmentSubtestId IS NOT NULL
		AND sa.AssessmentRegistrationId IS NOT NULL

		--Add AssessmentResultId to the staging table

		UPDATE Staging.AssessmentResult
		SET AssessmentResultId = ares.AssessmentResultId
		FROM Staging.AssessmentResult sa
		JOIN ODS.AssessmentResult ares 
			ON sa.AssessmentRegistrationId = ares.AssessmentRegistrationId
			AND sa.AssessmentSubtestId = ares.AssessmentSubtestId
		WHERE sa.AssessmentResultId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentResult_PerformanceLevel ------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentResult already exists so that it is not added again

		UPDATE Staging.AssessmentResult
		SET AssessmentResult_PerformanceLevelId = arpl.AssessmentResult_PerformanceLevelId
		FROM Staging.AssessmentResult sa
		JOIN ODS.AssessmentResult_PerformanceLevel arpl
			ON sa.AssessmentResultId = arpl.AssessmentResultId
			AND sa.AssessmentPerformanceLevelId = arpl.AssessmentPerformanceLevelId
		WHERE sa.AssessmentResult_PerformanceLevelId IS NULL

		--Create the AssessmentResult_PerformanceLevel

		INSERT INTO [ODS].[AssessmentResult_PerformanceLevel]
				   ([AssessmentResultId]
				   ,[AssessmentPerformanceLevelId])
		SELECT DISTINCT
				    sa.AssessmentResultId [AssessmentResultId]
				   ,sa.AssessmentPerformanceLevelId [AssessmentPerformanceLevelId] 
		FROM Staging.AssessmentResult sa
		WHERE AssessmentResult_PerformanceLevelId IS NULL
		AND sa.AssessmentResultId IS NOT NULL
		AND sa.AssessmentPerformanceLevelId IS NOT NULL


		--Add AssessmentResult_PerformanceLevelId to the staging table

		UPDATE Staging.AssessmentResult
		SET AssessmentResult_PerformanceLevelId = arpl.AssessmentResult_PerformanceLevelId
		FROM Staging.AssessmentResult sa
		JOIN ODS.AssessmentResult_PerformanceLevel arpl
			ON sa.AssessmentResultId = arpl.AssessmentResultId
			AND sa.AssessmentPerformanceLevelId = arpl.AssessmentPerformanceLevelId
		WHERE sa.AssessmentResult_PerformanceLevelId IS NULL





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





