-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  7/9/2018

		Purpose:
			The purpose of this ETL is to load the data for end of year Statuses for Persons

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;


		---Need to consider what to do when/if the dates are not populated for the status - do we default those.  Those are built into the queries below looking for matches
		--If assessments, we could pull from the assessment administration start date.  Otherwise, they will need to fill those dates in for appropriate reporting.

		-------------------------------------------------------
		---Default start and end dates if not provided --------
		-------------------------------------------------------

		UPDATE Staging.PersonStatus SET EconomicDisadvantage_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), EconomicDisadvantage_StatusEndDate = NULL WHERE EconomicDisadvantage_StatusStartDate IS NULL AND EconomicDisadvantageStatus IS NOT NULL
		UPDATE Staging.PersonStatus SET FosterCare_ProgramParticipationStartDate = App.GetFiscalYearStartDate(@SchoolYear), FosterCare_ProgramParticipationEndDate = NULL WHERE FosterCare_ProgramParticipationStartDate IS NULL AND ProgramType_FosterCare IS NOT NULL
		UPDATE Staging.PersonStatus SET Homelessness_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), Homelessness_StatusEndDate = NULL WHERE Homelessness_StatusStartDate IS NULL AND HomelessnessStatus IS NOT NULL
		UPDATE Staging.PersonStatus SET Migrant_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), Migrant_StatusEndDate = NULL WHERE Migrant_StatusStartDate IS NULL AND MigrantStatus IS NOT NULL
		UPDATE Staging.PersonStatus SET EnglishLearner_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), EnglishLearner_StatusEndDate = NULL WHERE EnglishLearner_StatusStartDate IS NULL AND EnglishLearnerStatus IS NOT NULL
		UPDATE Staging.PersonStatus SET IDEA_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), IDEA_StatusEndDate = NULL WHERE IDEA_StatusStartDate IS NULL AND IDEAIndicator IS NOT NULL
		UPDATE Staging.PersonStatus SET MilitaryConnected_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), MilitaryConnected_StatusEndDate = NULL WHERE MilitaryConnected_StatusStartDate IS NULL AND MilitaryConnectedStudentIndicator IS NOT NULL
		
		-------------------------------------------------------
		---Associate the PersonId with the temporary table ----
		-------------------------------------------------------

		UPDATE Staging.PersonStatus
		SET PersonID = pid.PersonId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonIdentifier pid 
			ON ps.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
			AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')

		--------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.PersonStatus
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.PersonStatus ps
		JOIN ODS.OrganizationIdentifier orgid 
			ON ps.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
			AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		----------------------------------------------------------------------------
		---Associate the Foster Program OrganizationId with the temporary table ----
		----------------------------------------------------------------------------

		UPDATE Staging.PersonStatus
		SET OrganizationID_Program_Foster = orgr.OrganizationId
		FROM Staging.PersonStatus ps
		JOIN ODS.OrganizationRelationship orgr ON ps.OrganizationID_School = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationProgramType orgpt ON orgr.OrganizationId = orgpt.OrganizationId
		WHERE orgpt.RefProgramTypeId = App.GetProgramTypeId('75000')

		-----------------------------------------------------
		----PersonStatus EconomicDisadvantage ---------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- EconomicDisadvantage exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_EconomicDisadvantage = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.EconomicDisadvantage_StatusStartDate
			AND pers.StatusEndDate = ps.EconomicDisadvantage_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'EconomicDisadvantage')
		WHERE ps.PersonStatusId_EconomicDisadvantage IS NULL	

		----Create PersonStatus -- EconomicDisadvantage

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'EconomicDisadvantage') [RefPersonStatusTypeId]
				   ,ps.EconomicDisadvantageStatus [StatusValue]
				   ,ps.EconomicDisadvantage_StatusStartDate [StatusStartDate]
				   ,ps.EconomicDisadvantage_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_EconomicDisadvantage IS NULL
		AND ps.EconomicDisadvantageStatus IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- EconomicDisadvantage ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_EconomicDisadvantage = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.EconomicDisadvantage_StatusStartDate
			AND pers.StatusEndDate = ps.EconomicDisadvantage_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'EconomicDisadvantage')
		WHERE ps.PersonStatusId_EconomicDisadvantage IS NULL	



		-----------------------------------------------------
		----PersonStatus Homeless -------------------------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- Homeless exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_Homeless = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.Homelessness_StatusStartDate
			AND pers.StatusEndDate = ps.Homelessness_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'HomelessUnaccompaniedYouth')
		WHERE ps.PersonStatusId_Homeless IS NULL	

		----Create PersonStatus -- Homeless

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'HomelessUnaccompaniedYouth') [RefPersonStatusTypeId]
				   ,ps.HomelessnessStatus [StatusValue]
				   ,ps.Homelessness_StatusStartDate [StatusStartDate]
				   ,ps.Homelessness_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_Homeless IS NULL
		AND ps.HomelessnessStatus IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- Homeless ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_Homeless = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.Homelessness_StatusStartDate
			AND pers.StatusEndDate = ps.Homelessness_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'HomelessUnaccompaniedYouth')
		WHERE ps.PersonStatusId_Homeless IS NULL	

		-----------------------------------------------------
		----PersonStatus Migrant -------------------------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- Migrant exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_Migrant = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.Migrant_StatusStartDate
			AND pers.StatusEndDate = ps.Migrant_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'Migrant')
		WHERE ps.PersonStatusId_Migrant IS NULL	

		----Create PersonStatus -- Migrant

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'Migrant') [RefPersonStatusTypeId]
				   ,ps.MigrantStatus [StatusValue]
				   ,ps.Migrant_StatusStartDate [StatusStartDate]
				   ,ps.Migrant_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_Migrant IS NULL
		AND ps.MigrantStatus IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- Migrant ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_Migrant = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.Migrant_StatusStartDate
			AND pers.StatusEndDate = ps.Migrant_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'Migrant')
		WHERE ps.PersonStatusId_Migrant IS NULL	

		-----------------------------------------------------
		----PersonStatus EnglishLearnerStatus -------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- EnglishLearnerStatus exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_EnglishLearner = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.EnglishLearner_StatusStartDate
			AND pers.StatusEndDate = ps.EnglishLearner_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'LEP')
		WHERE ps.PersonStatusId_EnglishLearner IS NULL	

		----Create PersonStatus -- EnglishLearnerStatus

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'LEP') [RefPersonStatusTypeId]
				   ,ps.EnglishLearnerStatus [StatusValue]
				   ,ps.EnglishLearner_StatusStartDate [StatusStartDate]
				   ,ps.EnglishLearner_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_EnglishLearner IS NULL
		AND ps.EnglishLearnerStatus IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- EnglishLearnerStatus ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_EnglishLearner = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.EnglishLearner_StatusStartDate
			AND pers.StatusEndDate = ps.EnglishLearner_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'LEP')
		WHERE ps.PersonStatusId_EnglishLearner IS NULL	


		-----------------------------------------------------
		----PersonStatus IDEA -------------------------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- IDEA exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_IDEA = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.IDEA_StatusStartDate
			AND pers.StatusEndDate = ps.IDEA_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'IDEA')
		WHERE ps.PersonStatusId_IDEA IS NULL	

		----Create PersonStatus -- IDEA

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'IDEA') [RefPersonStatusTypeId]
				   ,ps.IDEAIndicator [StatusValue]
				   ,ps.IDEA_StatusStartDate [StatusStartDate]
				   ,ps.IDEA_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_IDEA IS NULL
		AND ps.IDEAIndicator IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- IDEA ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_IDEA = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.IDEA_StatusStartDate
			AND pers.StatusEndDate = ps.IDEA_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'IDEA')
		WHERE ps.PersonStatusId_IDEA IS NULL	


		-----------------------------------------------------
		----Military Connected Studennt ---------------------
		-----------------------------------------------------

		--First check to see if PersonMilitary exists so that it is not created again

		--Generate needs and update to include PersonMilitaryId, when this is complete, remove the other code and uncomment this code

		--UPDATE Staging.PersonStatus
		--SET PersonMilitaryId = pm.PersonMilitaryId
		--FROM Staging.PersonStatus ps
		--JOIN ODS.PersonMilitary pm 
			--ON ps.PersonId = pm.PersonId
		--JOIN ODS.SourceSystemReferenceData military 
			--ON ps.MilitaryConnectedStudentIndicator = military.InputCode
		--	AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
		--	AND military.SchoolYear = @SchoolYear
		--WHERE pm.RecordStartDateTime <= ps.MilitaryConnected_StatusStartDate
		--AND (pm.RecordEndDateTime IS NULL OR pm.RecordEndDateTime >= ps.MilitaryConnected_StatusStartDate)
		--AND ps.PersonMilitaryId IS NULL

		UPDATE Staging.PersonStatus
		SET PersonMilitaryId = '0'
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonMilitary pm 
			ON ps.PersonId = pm.PersonId
		JOIN ODS.SourceSystemReferenceData military 
			ON ps.MilitaryConnectedStudentIndicator = military.InputCode
			AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
			AND military.SchoolYear = @SchoolYear
		WHERE ps.PersonMilitaryId IS NULL

		--Create PersonMilitary

		INSERT INTO [ODS].[PersonMilitary]
           ([PersonId]
           ,[RefMilitaryActiveStudentIndicatorId]
           ,[RefMilitaryConnectedStudentIndicatorId]
           ,[RefMilitaryVeteranStudentIndicatorId]
           ,[RefMilitaryBranchId])
		SELECT DISTINCT
            ps.PersonId [PersonId]
           ,NULL [RefMilitaryActiveStudentIndicatorId]
           ,mcsi.RefMilitaryConnectedStudentIndicatorId [RefMilitaryConnectedStudentIndicatorId]
           ,NULL [RefMilitaryVeteranStudentIndicatorId]
           ,NULL [RefMilitaryBranchId]
		   --,ps.MilitaryConnected_StatusStartDate [RecordStartDateTime] -- uncomment when elements added to Generate
		   --,ps.MilitaryConnected_StatusEndDate [RecordEndDateTime] -- uncomment when elements added to Generate
		FROM Staging.PersonStatus ps
		JOIN ODS.SourceSystemReferenceData military
			ON ps.MilitaryConnectedStudentIndicator = military.InputCode
			AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
			AND military.SchoolYear = @SchoolYear
		JOIN ODS.RefMilitaryConnectedStudentIndicator mcsi 
			ON military.OutputCode = mcsi.Code
		WHERE ps.PersonMilitaryId IS NULL
		AND ps.MilitaryConnectedStudentIndicator IS NOT NULL
		AND ps.PersonId IS NOT NULL

		--Update the Staging table with the PersonMilitaryId

		--Generate needs and update to include PersonMilitaryId, when this is complete, remove the other code and uncomment this code

		--UPDATE Staging.PersonStatus
		--SET PersonMilitaryId = pm.PersonMilitaryId
		--FROM Staging.PersonStatus ps
		--JOIN ODS.PersonMilitary pm 
			--ON ps.PersonId = pm.PersonId
		--JOIN ODS.SourceSystemReferenceData military 
			--ON ps.MilitaryConnectedStudentIndicator = military.InputCode
		--	AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
		--	AND military.SchoolYear = @SchoolYear
		--WHERE pm.RecordStartDateTime <= ps.MilitaryConnected_StatusStartDate
		--AND (pm.RecordEndDateTime IS NULL OR pm.RecordEndDateTime >= ps.MilitaryConnected_StatusStartDate)
		--AND ps.PersonMilitaryId IS NULL

		UPDATE Staging.PersonStatus
		SET PersonMilitaryId = '0'
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonMilitary pm 
			ON ps.PersonId = pm.PersonId
		JOIN ODS.SourceSystemReferenceData military 
			ON ps.MilitaryConnectedStudentIndicator = military.InputCode
			AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
			AND military.SchoolYear = @SchoolYear
		WHERE ps.PersonMilitaryId IS NULL

		-----------------------------------------------------
		----Foster Care Program Participation----------------
		-----------------------------------------------------
		
		--First check to see if foster care program exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET OrganizationPersonRoleID_Program_Foster = ps.OrganizationPersonRoleID_Program_Foster
		FROM Staging.PersonStatus ps
		JOIN ODS.OrganizationPersonRole opr 
			ON ps.PersonId = opr.PersonId
			AND ps.OrganizationID_Program_Foster = opr.OrganizationId
		WHERE opr.EntryDate <= ps.FosterCare_ProgramParticipationStartDate
		AND (opr.ExitDate IS NULL OR opr.ExitDate >= ps.FosterCare_ProgramParticipationStartDate)
		AND ps.OrganizationPersonRoleID_Program_Foster IS NULL
		
		--Create Foster Care Program

		INSERT INTO [ODS].[OrganizationPersonRole]
           ([OrganizationId]
           ,[PersonId]
           ,[RoleId]
           ,[EntryDate]
           ,[ExitDate])
		SELECT DISTINCT
            ps.OrganizationID_Program_Foster [OrganizationId]
           ,ps.PersonId [PersonId]
           ,App.GetRoleId('K12 Student') [RoleId]
           ,ps.FosterCare_ProgramParticipationStartDate [EntryDate]
           ,ps.FosterCare_ProgramParticipationEndDate [ExitDate] 
		FROM Staging.PersonStatus ps
		WHERE ps.OrganizationPersonRoleID_Program_Foster IS NULL
		AND ps.ProgramType_FosterCare IS NOT NULL
		AND ps.PersonId IS NOT NULL

		--Update staging table to include foster care
		
		UPDATE Staging.PersonStatus
		SET OrganizationPersonRoleID_Program_Foster = ps.OrganizationPersonRoleID_Program_Foster
		FROM Staging.PersonStatus ps
		JOIN ODS.OrganizationPersonRole opr 
			ON ps.PersonId = opr.PersonId
			AND ps.OrganizationID_Program_Foster = opr.OrganizationId
		WHERE opr.EntryDate <= ps.FosterCare_ProgramParticipationStartDate
		AND (opr.ExitDate IS NULL OR opr.ExitDate >= ps.FosterCare_ProgramParticipationStartDate)
		AND ps.OrganizationPersonRoleID_Program_Foster IS NULL



			set nocount off;

	
	END TRY
	BEGIN CATCH



	END CATCH; 

END
