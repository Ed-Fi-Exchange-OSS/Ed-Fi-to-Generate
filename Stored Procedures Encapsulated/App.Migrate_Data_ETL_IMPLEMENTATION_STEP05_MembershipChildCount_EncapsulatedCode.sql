﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode]    Script Date: 6/6/2018 3:19:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode]
END

GO


--Notes --
--Set this up in such a way as to handle when child count and membership occur on different days - note: the dates don't matter, just load the enrollments.
--Do we set it up to capture each day and if no changes, continue the NULL end date forward until a change occurs
--with the one above, what if it's a correction - no that should be handled directly in the ODS, not through the ETL
--let the ETL handle the movement of data, not the correction of invalid data in the past.  When they migrate, they are looking for what
--has changed since the last time.  Perhaps there needs to be two methodoligies here
--1. Do not change anything in history, but end date records as of today
--2. Change history based on the picture we have today in the Ed-Fi ODS
--3. Possibly a hybrid of those - change history unless it affects the following dates (e.g. October 1st - do not change that history)
--4. Change only certain items (turn them on/off based on the state methodology?)
--5. Preset the items that can/cannot change?



CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode]
	@SchoolYear SMALLINT
AS

    /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to load the data for membership (C052) and Special Education Child Count
		(C002, C089).

    Assumptions:
        
    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources: 

    Data Targets:  Generate Database:   Generate

    Return Values:
    	 0	= Success
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount_EncapsulatedCode];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/

BEGIN

	BEGIN TRY
	
		set nocount on;

------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------

        ---------------------------------------------------
        --- Declare Temporary Variables                ----
        ---------------------------------------------------
        DECLARE
			 @RecordStartDate DATETIME
			,@RecordEndDate DATETIME
			,@MembershipDate DATE
			,@ChildCountDate DATE
			,@RefPersonStatusType_IDEA INT
			,@RefPersonStatusType_LEP INT
			,@RefLanguageUseType_HomeLanguage INT


        ------------------------------------------------------------
        --- Populate temp code table lookup variables           ----
        ------------------------------------------------------------

			SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear)
			
			SET @RecordEndDate = App.GetFiscalYearEndDate(@SchoolYear)

			SET @MembershipDate = ISNULL(
			(
				SELECT CONVERT(DATE, (LEFT(tr.ResponseValue, 5) + '/' + CAST(2018 - 1 AS VARCHAR))) 
				FROM App.ToggleQuestions tq
				JOIN App.ToggleResponses tr ON tq.ToggleQuestionId = tr.ToggleQuestionId
				WHERE EmapsQuestionAbbrv = 'CHDCTDTE' 
			), 'XX');


			SET @ChildCountDate = ISNULL(
			(
				SELECT CONVERT(DATE, (LEFT(tr.ResponseValue, 5) + '/' + CAST(@SchoolYear - 1 AS VARCHAR)))
				FROM App.ToggleQuestions tq
				JOIN App.ToggleResponses tr ON tq.ToggleQuestionId = tr.ToggleQuestionId
				WHERE EmapsQuestionAbbrv = 'CHDCTDTE'
			), 'XX');

		-------------------------------------------------------
		---Associate the PersonId with the temporary table ----
		-------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonID = pid.PersonId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonIdentifier pid 
			ON mcc.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
			AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')

		-------------------------------------------------------------
		---Associate the PersonDetailId with the temporary table ----
		-------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonDetailID = pd.PersonDetailId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonDetail pd
			ON mcc.PersonID = pd.PersonId
			AND mcc.FirstName = pd.FirstName
			AND mcc.LastName = pd.LastName
			AND mcc.Birthdate = pd.Birthdate
			AND mcc.RaceEthnicityQuestion_Hispanic = pd.HispanicLatinoEthnicity
		JOIN ods.SourceSystemReferenceData edfisex
			ON mcc.Sex = edfisex.InputCode
			AND edfisex.TableName = 'RefSex'
			AND edfisex.SchoolYear = @SchoolYear
		JOIN ods.RefSex sex
			ON edfisex.OutputCode = sex.Code
		WHERE mcc.PersonID IS NOT NULL
			AND pd.RecordEndDateTime IS NULL
			AND sex.RefSexId = pd.RefSexId
	
		----------------------------------------------------------------------
		---Associate the PersonDemographicRaceId with the temporary table ----
		----------------------------------------------------------------------

		UPDATE Staging.MembershipRace
		SET PersonDemographicRaceId = pdr.PersonDemographicRaceId
		FROM Staging.MembershipChildCount mcc
		JOIN Staging.MembershipRace mr 
			ON mcc.Student_Identifier_State = mr.Student_Identifier_State
		JOIN ODS.PersonDemographicRace pdr 
			ON mcc.PersonID = pdr.PersonId
		JOIN ODS.SourceSystemReferenceData rd
			ON mr.RaceType = rd.InputCode
			AND rd.TableName = 'RefRace'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefRace r 
			ON rd.OutputCode = r.Code
		WHERE mcc.PersonID IS NOT NULL
			AND	r.RefRaceId = pdr.RefRaceId
			AND pdr.RecordEndDateTime IS NULL

		-----------------------------------------------------------------
		---Associate the PersonDisabilityId with the temporary table ----
		-----------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonDisabilityId = pd.PersonDisabilityId
		FROM Staging.MembershipChildCount mcc
		JOIN Staging.PrimaryDisability spd
			ON mcc.Student_Identifier_State = spd.Student_Identifier_State
		JOIN ODS.PersonDisability pd 
			ON mcc.PersonID = pd.PersonId
		JOIN ods.SourceSystemReferenceData rd
			ON spd.DisabilityType = rd.InputCode
			AND rd.TableName = 'RefDisabilityType'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefDisabilityType dt ON rd.OutputCode = dt.Code
		WHERE mcc.PersonID IS NOT NULL
			AND dt.RefDisabilityTypeId = pd.PrimaryDisabilityTypeId
			AND pd.RecordEndDateTime IS NULL

		---------------------------------------------------------------
		---Associate the PersonLanguageId with the temporary table ----
		---------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonLanguageId = pl.PersonLanguageId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonLanguage pl 
			ON mcc.PersonID = pl.PersonId
		JOIN ODS.SourceSystemReferenceData rd
			ON mcc.ISO_639_2_NativeLanguage = rd.InputCode
			AND rd.TableName = 'RefLanguage'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefLanguage rl
			ON rd.OutputCode = rl.Code
		JOIN ODS.RefLanguageUseType rlut 
			ON rlut.Code = 'Native'
		WHERE mcc.PersonID IS NOT NULL
			AND rl.RefLanguageId = pl.PersonLanguageId
			--AND pl.RecordEndDateTime IS NULL --This requires a Generate update to include the RecordStart/End in this table

		--------------------------------------------------------------------
		---Associate the PersonStatusId (IDEA) with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonStatusId_IDEA = ps.PersonStatusId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonStatus ps 
			ON mcc.PersonID = ps.PersonId
		JOIN ODS.RefPersonStatusType pst 
			ON ps.RefPersonStatusTypeId = pst.RefPersonStatusTypeId
		WHERE pst.Code = 'IDEA'
			AND ps.StatusEndDate IS NULL
			AND mcc.PersonID IS NOT NULL
			AND mcc.IDEAStatus = ps.StatusValue

		--------------------------------------------------------------------
		---Associate the PersonStatusId (LEP) with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonStatusId_LEP = ps.PersonStatusId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonStatus ps 
			ON mcc.PersonID = ps.PersonId
		JOIN ODS.RefPersonStatusType pst 
			ON ps.RefPersonStatusTypeId = pst.RefPersonStatusTypeId
		WHERE pst.Code = 'LEP'
			AND ps.StatusEndDate IS NULL
			AND mcc.PersonID IS NOT NULL
			AND mcc.EnglishLearnerStatus = ps.StatusValue

		--------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.OrganizationIdentifier orgid 
			ON mcc.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
			AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		-----------------------------------------------------------------------------------------------------
		---Associate the OrganizationPersonRoleId related to the MembershipDate with the temporary table ----
		-----------------------------------------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET OrganizationPersonRoleID_School = opr.OrganizationPersonRoleId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.OrganizationPersonRole opr 
			ON mcc.PersonID = opr.PersonId
		WHERE mcc.OrganizationID_School = opr.OrganizationId
			AND opr.EntryDate <= @MembershipDate
			AND (opr.ExitDate IS NULL OR opr.ExitDate >= @MembershipDate)

		----------------------------------------------------
		---Insert/Update students into ODS.PersonDetail ----
		----------------------------------------------------

		--End date PersonDetail records that have changed since the previous year
		UPDATE ODS.PersonDetail
		SET RecordEndDateTime = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonDetail pd
			ON mcc.PersonID = pd.PersonId
		WHERE pd.RecordEndDateTime IS NULL
			AND mcc.PersonDetailID IS NULL


		--Insert new PersonDetail records that do not yet exist or that have changed since the previous year
		INSERT INTO [ODS].[PersonDetail]
				   ([PersonId]
				   ,[FirstName]
				   ,[MiddleName]
				   ,[LastName]
				   ,[GenerationCode]
				   ,[Prefix]
				   ,[Birthdate]
				   ,[RefSexId]
				   ,[HispanicLatinoEthnicity]
				   ,[RefUSCitizenshipStatusId]
				   ,[RefVisaTypeId]
				   ,[RefStateOfResidenceId]
				   ,[RefProofOfResidencyTypeId]
				   ,[RefHighestEducationLevelCompletedId]
				   ,[RefPersonalInformationVerificationId]
				   ,[BirthdateVerification]
				   ,[RefTribalAffiliationId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					mcc.PersonID [PersonId]
				   ,mcc.FirstName [FirstName]
				   ,NULL [MiddleName]
				   ,mcc.LastName [LastName]
				   ,NULL [GenerationCode]
				   ,NULL [Prefix]
				   ,mcc.Birthdate [Birthdate]
				   ,sex.RefSexId [RefSexId]
				   ,mcc.RaceEthnicityQuestion_Hispanic [HispanicLatinoEthnicity]
				   ,NULL [RefUSCitizenshipStatusId]
				   ,NULL [RefVisaTypeId]
				   ,NULL [RefStateOfResidenceId]
				   ,NULL [RefProofOfResidencyTypeId]
				   ,NULL [RefHighestEducationLevelCompletedId]
				   ,NULL [RefPersonalInformationVerificationId]
				   ,NULL [BirthdateVerification]
				   ,NULL [RefTribalAffiliationId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM Staging.MembershipChildCount mcc
		JOIN ods.SourceSystemReferenceData edfisex
			ON mcc.Sex = edfisex.InputCode
			AND edfisex.TableName = 'RefSex'
			AND edfisex.SchoolYear = @SchoolYear
		JOIN ods.RefSex sex
			ON edfisex.OutputCode = sex.Code
		WHERE mcc.PersonDetailID IS NULL

		--Update Staging Table with PersonDetail Id--
		UPDATE Staging.MembershipChildCount
		SET PersonDetailID = pd.PersonDetailId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonDetail pd ON mcc.PersonID = pd.PersonId
		JOIN ODS.SourceSystemReferenceData sourcesex ON mcc.Sex = sourcesex.InputCode
		JOIN ODS.RefSex rs ON sourcesex.OutputCode = rs.Code
		WHERE mcc.FirstName = pd.FirstName
		AND mcc.LastName = pd.LastName
		AND mcc.Birthdate = pd.Birthdate
		AND mcc.RaceEthnicityQuestion_Hispanic = pd.HispanicLatinoEthnicity
		AND rs.RefSexId = pd.RefSexId
		AND sourcesex.TableName = 'RefSex'
		AND sourcesex.SchoolYear = @SchoolYear

		------------------------------------------------------------
		---Insert Student's Race into ODS.PersonDemographicRace ----
		------------------------------------------------------------

		--End date PersonDeomgraphicRace records that have changed since the previous year
		UPDATE ODS.PersonDemographicRace
		SET RecordEndDateTime = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM Staging.MembershipChildCount mcc
		JOIN Staging.MembershipRace mr 
			ON mcc.Student_Identifier_State = mr.Student_Identifier_State
		JOIN ODS.PersonDemographicRace pdr
			ON mcc.PersonID = pdr.PersonId
		WHERE pdr.RecordEndDateTime IS NULL
			AND mr.PersonDemographicRaceId IS NULL
		
		
		INSERT INTO [ODS].[PersonDemographicRace]
				   ([PersonId]
				   ,[RefRaceId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					 mcc.PersonId [PersonId]
					,r.RefRaceID
					,@RecordStartDate [RecordStartDateTime]
					,NULL [RecordEndDateTime]
		FROM Staging.MembershipRace mr
		JOIN Staging.MembershipChildCount mcc	
			ON mr.Student_Identifier_State = mcc.Student_Identifier_State
		JOIN ODS.SourceSystemReferenceData rd
			ON mr.RaceType = rd.InputCode
			AND rd.TableName = 'RefRace'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefRace r 
			ON rd.OutputCode = r.Code
		WHERE mr.PersonDemographicRaceId IS NULL

		---------------------------------------------------
		---Insert Disability into ODS.PersonDisability ----
		---------------------------------------------------

		UPDATE ODS.PersonDisability
		SET RecordEndDateTime = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonDisability pd 
			ON mcc.PersonID = pd.PersonId
		WHERE pd.RecordEndDateTime IS NULL
		AND mcc.PersonDisabilityId IS NULL

		INSERT INTO [ODS].[PersonDisability]
				   ([PersonId]
				   ,[PrimaryDisabilityTypeId]
				   ,[DisabilityStatus]
				   ,[RefAccommodationsNeededTypeId]
				   ,[RefDisabilityConditionTypeId]
				   ,[RefDisabilityDeterminationSourceTypeId]
				   ,[RefDisabilityConditionStatusCodeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					mcc.PersonID [PersonId]
				   ,dt.RefDisabilityTypeId [PrimaryDisabilityTypeId]
				   ,1 [DisabilityStatus]
				   ,NULL [RefAccommodationsNeededTypeId]
				   ,NULL [RefDisabilityConditionTypeId]
				   ,NULL [RefDisabilityDeterminationSourceTypeId]
				   ,NULL [RefDisabilityConditionStatusCodeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM Staging.MembershipChildCount mcc
		JOIN Staging.PrimaryDisability md
			ON mcc.Student_Identifier_State = md.Student_Identifier_State
		JOIN ODS.SourceSystemReferenceData rd
			ON md.DisabilityType = rd.InputCode
			AND rd.TableName = 'RefDisabilityType'
			AND rd.SchoolYear = @SchoolYear
		JOIN ods.RefDisabilityType dt 
			ON rd.OutputCode = dt.Code
		WHERE PrimaryDisability IS NOT NULL
		AND PrimaryDisability <> ''
		AND mcc.PersonDisabilityId IS NULL

		---------------------------------------------------
		---Insert Language into ODS.PersonLanguage ----
		---------------------------------------------------

		--This can be uncommented when the RecordEndDateTime has been added to the PersonLanguage table
		--UPDATE ODS.PersonLanguage
		--SET RecordEndDateTime = App.GetFiscalYearEndDate(@SchoolYear-1)
		--FROM Staging.MembershipChildCount mcc
		--JOIN ODS.PersonLanguage pl 
		--	ON mcc.PersonID = pl.PersonId
		--WHERE pl.RecordEndDateTime IS NULL
		--AND mcc.PersonLanguageId IS NULL


		--Need to add the RecordStart/EndDateTime into this when it is added into Generate.
		INSERT INTO [ODS].[PersonLanguage]
           ([PersonId]
           ,[RefLanguageId]
           ,[RefLanguageUseTypeId])
		SELECT
            PersonID [PersonId]
           ,rl.RefLanguageId [RefLanguageId]
           ,rlut.RefLanguageUseTypeId [RefLanguageUseTypeId]
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.SourceSystemReferenceData rd
			ON mcc.ISO_639_2_NativeLanguage = rd.InputCode
			AND rd.TableName = 'RefLanguage'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefLanguage rl
			ON rd.OutputCode = rl.Code
		JOIN ODS.RefLanguageUseType rlut 
			ON rlut.Code = 'Native'
		WHERE mcc.ISO_639_2_NativeLanguage IS NOT NULL

		-----------------------------------------------------
		----Create Person Status for IDEA -------------------
		-----------------------------------------------------

		UPDATE ODS.PersonStatus
		SET StatusEndDate = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM ODS.PersonStatus ps
		JOIN Staging.MembershipChildCount mcc 
			ON ps.PersonId = mcc.PersonID
		JOIN ODS.RefPersonStatusType pst 
			ON ps.RefPersonStatusTypeId = pst.RefPersonStatusTypeId
		WHERE pst.Code = 'IDEA'
			AND ps.StatusEndDate IS NULL
			AND mcc.PersonStatusId_IDEA IS NULL

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
					mcc.PersonID [PersonId]
				   ,pst.RefPersonStatusTypeId [RefPersonStatusTypeId]
				   ,IDEAStatus [StatusValue]
				   ,@RecordStartDate [StatusStartDate]
				   ,NULL [StatusEndDate]
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.RefPersonStatusType pst 
			ON pst.Code = 'IDEA'
		WHERE mcc.PrimaryDisability <> ''
			AND mcc.PersonStatusId_IDEA IS NULL
		
		------------------------------------------------------------------
		----Create Person Status for Limited English Proficiency (LEP)----
		------------------------------------------------------------------

		UPDATE ODS.PersonStatus
		SET StatusEndDate = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM ODS.PersonStatus ps
		JOIN Staging.MembershipChildCount mcc 
			ON ps.PersonId = mcc.PersonID
		JOIN ODS.RefPersonStatusType pst 
			ON ps.RefPersonStatusTypeId = pst.RefPersonStatusTypeId
		WHERE pst.Code = 'LEP'
			AND ps.StatusEndDate IS NULL
			AND mcc.PersonStatusId_LEP IS NULL

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
					mcc.PersonID [PersonId]
				   ,pst.RefPersonStatusTypeId [RefPersonStatusTypeId]
				   ,EnglishLearnerStatus [StatusValue]
				   ,@RecordStartDate [StatusStartDate]
				   ,NULL [StatusEndDate]
		FROM Staging.MembershipChildCount mcc
		JOIN ods.RefPersonStatusType pst 
			ON pst.Code = 'LEP'
		WHERE mcc.PersonStatusId_LEP IS NULL

		---------------------------------------------------------------------------------------------------------
		----Add Eligibility Status for School Food Service Programs to K12StudentEnrollment for Membership Date--
		---------------------------------------------------------------------------------------------------------

		UPDATE ODS.K12StudentEnrollment
		SET RefFoodServiceEligibilityId = rfse.RefFoodServiceEligibilityId
		FROM ODS.K12StudentEnrollment kse
		JOIN Staging.MembershipChildCount mcc ON kse.OrganizationPersonRoleId = mcc.OrganizationPersonRoleID_School
		JOIN ods.SourceSystemReferenceData rd 
			ON mcc.EligibilityStatusForSchoolFoodServicePrograms = rd.InputCode
			AND rd.TableName = 'RefFoodServiceEligibility'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefFoodServiceEligibility rfse ON rd.OutputCode = rfse.Code
		WHERE kse.RecordStartDateTime <= @MembershipDate
			AND (kse.RecordEndDateTime IS NULL 
				OR kse.RecordEndDateTime >= @MembershipDate)
			AND mcc.EligibilityStatusForSchoolFoodServicePrograms IS NOT NULL

		------------------------------------------------------------------------------------------------------------
		----Add NationalSchoolLunchProgramDirectCertificationIndicator to K12StudentEnrollment for Membership Date--
		------------------------------------------------------------------------------------------------------------

		--Do not yet know the location of this field in Ed-Fi or Nebraska

		set nocount off;


	END TRY
	BEGIN CATCH



	END CATCH; 

END
