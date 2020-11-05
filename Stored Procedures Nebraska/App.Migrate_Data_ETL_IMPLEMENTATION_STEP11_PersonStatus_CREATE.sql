-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus]    Script Date: 6/6/2018 3:19:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus]
	  @RefPersonStatusType_Source VARCHAR(100)
	, @SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load the data for end of year Statuses for Persons.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;

		DECLARE @Homeless VARCHAR(100)
		DECLARE @EconomicDisadvantage VARCHAR(100)
		DECLARE @Migrant VARCHAR(100)
		DECLARE @MilitaryConnected VARCHAR(100)
		DECLARE @Foster VARCHAR(100)
		DECLARE @EnglishLearner VARCHAR(100)
		DECLARE @IDEA VARCHAR(100)

		SET @Homeless = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND DataSource = @RefPersonStatusType_Source AND SchoolYear = @SchoolYear AND OutputCode = 'HomelessUnaccompaniedYouth')
		SET @EconomicDisadvantage = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND DataSource = @RefPersonStatusType_Source AND SchoolYear = @SchoolYear AND OutputCode = 'EconomicDisadvantage')
		SET @Migrant = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND DataSource = @RefPersonStatusType_Source AND SchoolYear = @SchoolYear AND OutputCode = 'Migrant')
		SET @EnglishLearner = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND DataSource = @RefPersonStatusType_Source AND SchoolYear = @SchoolYear AND OutputCode = 'LEP')
		SET @IDEA = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND DataSource = @RefPersonStatusType_Source AND SchoolYear = @SchoolYear AND OutputCode = 'IDEA')
		SET @MilitaryConnected = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND DataSource = @RefPersonStatusType_Source AND SchoolYear = @SchoolYear AND OutputCode = 'Parent in Military')
		SET @Foster = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND DataSource = @RefPersonStatusType_Source AND SchoolYear = @SchoolYear AND OutputCode = 'Foster Care')

		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------Begin State Specific Information Section----------------------------------------
		---------------------------------------------------------------------------------------------------------------------
		----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
		----created to work with the data standardized in this location. Do not make any changes to table names or column----
		----names or to any of the code after this section.  The only information that should be modified is the source  ----
		----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
		---------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		TRUNCATE TABLE Staging.PersonStatus
		TRUNCATE TABLE Staging.PrimaryDisability


		INSERT INTO [Staging].[PersonStatus]
			   ([Student_Identifier_State]
			   ,[School_Identifier_State]
			   ,[HomelessnessStatus]
			   ,[Homelessness_StatusStartDate]
			   ,[Homelessness_StatusEndDate]
			   ,[EconomicDisadvantageStatus]
			   ,[EconomicDisadvantage_StatusStartDate]
			   ,[EconomicDisadvantage_StatusEndDate]
			   ,[MigrantStatus]
			   ,[Migrant_StatusStartDate]
			   ,[Migrant_StatusEndDate]
			   ,[MilitaryConnectedStudentIndicator]
			   ,[MilitaryConnected_StatusStartDate]
			   ,[MilitaryConnected_StatusEndDate]
			   ,[ProgramType_FosterCare]
			   ,[FosterCare_ProgramParticipationStartDate]
			   ,[FosterCare_ProgramParticipationEndDate]
			   ,[EnglishLearnerStatus]
			   ,[EnglishLearner_StatusStartDate]
			   ,[EnglishLearner_StatusEndDate]
			   ,[IDEAIndicator]
			   ,[IDEA_StatusStartDate]
			   ,[IDEA_StatusEndDate]
			   ,[PrimaryDisabilityType]
			   ,[PersonId]
			   ,[OrganizationID_School]
			   ,[OrganizationID_Program_Foster]
			   ,[OrganizationPersonRoleID_School]
			   ,[PersonStatusId_Homeless]
			   ,[PersonStatusId_EconomicDisadvantage]
			   ,[PersonStatusId_IDEA]
			   ,[PersonStatusId_EnglishLearner]
			   ,[PersonStatusId_Migrant]
			   ,[PersonMilitaryId]
			   ,[OrganizationPersonRoleID_Program_Foster]
			   ,[RunDateTime]
			   )
		SELECT DISTINCT
			    s.StudentUniqueId [Student_Identifier_State]
			   ,edorg.StateOrganizationId [School_Identifier_State]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Homeless THEN '1'
					ELSE NULL END [HomelessnessStatus]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Homeless THEN sc.BeginDate
					ELSE NULL END [Homelessness_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Homeless THEN sc.EndDate
					ELSE NULL END [Homelessness_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EconomicDisadvantage THEN '1'
					ELSE NULL END [EconomicDisadvantageStatus]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EconomicDisadvantage THEN sc.BeginDate
					ELSE NULL END [EconomicDisadvantage_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EconomicDisadvantage THEN sc.EndDate
					ELSE NULL END [EconomicDisadvantage_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Migrant THEN '1'
					ELSE NULL END [MigrantStatus]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Migrant THEN sc.BeginDate
					ELSE NULL END [Migrant_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Migrant THEN sc.EndDate
					ELSE NULL END [Migrant_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @MilitaryConnected THEN '1'
					ELSE NULL END [MilitaryConnectedStudentIndicator]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @MilitaryConnected THEN sc.BeginDate
					ELSE NULL END [MilitaryConnected_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @MilitaryConnected THEN sc.EndDate
					ELSE NULL END [MilitaryConnected_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Foster THEN '1'
					ELSE NULL END [ProgramType_FosterCare]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Foster THEN sc.BeginDate
					ELSE NULL END [FosterCare_ProgramParticipationStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Foster THEN sc.EndDate
					ELSE NULL END [FosterCare_ProgramParticipationEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EnglishLearner THEN '1'
					ELSE NULL END [EnglishLearnerStatus]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EnglishLearner THEN sc.BeginDate
					ELSE NULL END [EnglishLearner_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EnglishLearner THEN sc.EndDate
					ELSE NULL END [EnglishLearner_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @IDEA THEN '1'
					ELSE NULL END [IDEAIndicator]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @IDEA THEN sc.BeginDate
					ELSE NULL END [IDEA_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @IDEA THEN sc.EndDate
					ELSE NULL END [IDEA_StatusEndDate]
			   ,NULL [PrimaryDisabilityType]
			   ,NULL [PersonId]
			   ,NULL [OrganizationID_School]
			   ,NULL [OrganizationID_Program_Foster]
			   ,NULL [OrganizationPersonRoleID_School]
			   ,NULL [PersonStatusId_Homeless]
			   ,NULL [PersonStatusId_EconomicDisadvantage]
			   ,NULL [PersonStatusId_IDEA]
			   ,NULL [PersonStatusId_EnglishLearner]
			   ,NULL [PersonStatusId_Migrant]
			   ,NULL [PersonMilitaryId]
			   ,NULL [OrganizationPersonRoleID_Program_Foster]
			   ,NULL [RunDateTime]
		FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].edfi.Student s
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].edfi.StudentSchoolAssociation ssa 
			ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].edfi.School sch 
			ON ssa.SchoolId = ssa.SchoolId
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].edfi.EducationOrganization edorg 
			ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].edfi.StudentCharacteristic sc 
			ON s.StudentUSI = sc.StudentUSI
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].edfi.Descriptor d 
			ON sc.StudentCharacteristicDescriptorId = d.DescriptorId
		WHERE (sc.EndDate IS NULL
			OR sc.EndDate > App.GetFiscalYearStartDate(@SchoolYear))

		-- Insert Staging.PrimmaryDisability Here

			INSERT INTO Staging.PrimaryDisability
				(Student_Identifier_State
				,DisabilityType
				,RunDateTime
				)
			SELECT DISTINCT
				 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,d.CodeValue
				,NULL RunDateTime
			FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Student s
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentDisability sd ON s.StudentUSI = sd.StudentUSI
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor d 
				ON sd.DisabilityDescriptorId = d.DescriptorId

			UPDATE Staging.PersonStatus
			SET PrimaryDisabilityType = pd.DisabilityType
			FROM Staging.PersonStatus ps
			JOIN Staging.PrimaryDisability pd 
				ON ps.Student_Identifier_State = pd.Student_Identifier_State

				

		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.PersonStatus SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PersonStatus) > 0
		UPDATE Staging.PrimaryDisability SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PrimaryDisability) > 0

		----Validate Staging.PersonStatus----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus', 'Staging.PersonStatus'

		----Validate Staging.PrimaryDisability----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus', 'Staging.PrimaryDisability'


			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END
