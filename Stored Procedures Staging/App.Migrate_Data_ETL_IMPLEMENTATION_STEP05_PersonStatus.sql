-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus]    Script Date: 6/6/2018 3:19:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus] 
	 @SchoolYear SMALLINT = NULL
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
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus] 2018;
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

BEGIN

	--begin transaction

		BEGIN TRY
	
			set nocount on;
			
		IF @SchoolYear IS NULL BEGIN
			SELECT @SchoolYear = d.Year + 1
			FROM rds.DimDateDataMigrationTypes dd 
			JOIN rds.DimDates d 
				ON dd.DimDateId = d.DimDateId 
			JOIN rds.DimDataMigrationTypes b 
				ON b.DimDataMigrationTypesId = dd.DataMigrationTypeId 
			WHERE dd.IsSelected = 1 
				AND DataMigrationTypeCode = 'ODS'
		END 

		DECLARE @Homeless VARCHAR(100)
		DECLARE @EconomicDisadvantage VARCHAR(100)
		DECLARE @Migrant VARCHAR(100)
		DECLARE @MilitaryConnected VARCHAR(100)
		DECLARE @Foster VARCHAR(100)
		DECLARE @EnglishLearner VARCHAR(100)
		DECLARE @IDEA VARCHAR(100)

		SET @Homeless = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'HomelessUnaccompaniedYouth')
		SET @EconomicDisadvantage = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'EconomicDisadvantage')
		SET @Migrant = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'Migrant')
		SET @EnglishLearner = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'LEP')
		SET @IDEA = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'IDEA')
		SET @MilitaryConnected = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'Parent in Military')
		SET @Foster = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'Foster Care')

		DECLARE @SYStartDate DATE = generate.App.GetFiscalYearStartDate(@SchoolYear)
		DECLARE @SYEndDate DATE  = generate.App.GetFiscalYearEndDate(@SchoolYear)

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
			   ,[LEA_Identifier_State]
			   ,[School_Identifier_State]
			   ,[HomelessnessStatus]
			   ,[Homelessness_StatusStartDate]
			   ,[Homelessness_StatusEndDate]
			   ,[HomelessNightTimeResidence]
			   ,[HomelessNightTimeResidence_StartDate]
			   ,[HomelessNightTimeResidence_EndDate]
			   ,[HomelessUnaccompaniedYouth]
			   ,[HomelessServicedIndicator]
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
			   ,[ProgramType_Section504]
			   ,[Section504_ProgramParticipationStartDate]
			   ,[Section504_ProgramParticipationEndDate]
			   ,[ProgramType_Immigrant]
			   ,[Immigrant_ProgramParticipationStartDate]
			   ,[Immigrant_ProgramParticipationEndDate]
			   ,[EnglishLearnerStatus]
			   ,[EnglishLearner_StatusStartDate]
			   ,[EnglishLearner_StatusEndDate]
			   ,[ISO_639_2_NativeLanguage]
			   ,[IDEAIndicator]
			   ,[IDEA_StatusStartDate]
			   ,[IDEA_StatusEndDate]
			   ,[PrimaryDisabilityType]
			   ,[EligibilityStatusForSchoolFoodServicePrograms]
			   ,[NationalSchoolLunchProgramDirectCertificationIndicator]
			   ,[PersonId]
			   ,[OrganizationID_LEA]
			   ,[OrganizationID_School]
			   ,[OrganizationID_Program_Foster]
			   ,[OrganizationPersonRoleID_School]
			   ,[PersonStatusId_Homeless]
			   ,[PersonStatusId_EconomicDisadvantage]
			   ,[PersonStatusId_IDEA]
			   ,[PersonStatusId_EnglishLearner]
			   ,[PersonStatusId_Migrant]
			   ,[PersonMilitaryId]
			   ,[PersonHomelessnessId]
			   ,[OrganizationPersonRoleID_Program_Foster]
			   ,[RunDateTime]
			   )
		SELECT DISTINCT
			    s.StudentUniqueId														[Student_Identifier_State]
			   ,lea.LocalEducationAgencyId												[LEA_Identifier_State]	
			   ,REPLACE(edorgcode.IdentificationCode, ' ', '')							[School_Identifier_State]

			   ,CASE 
					WHEN hl.BeginDate is not null THEN '1'
					ELSE NULL END														[HomelessnessStatus]
			   , hl.BeginDate															[Homelessness_StatusStartDate]
			   , hl.EndDate																[Homelessness_StatusEndDate]

			   -- primary nighttime residence
			   ,NULL																	[HomelessNightTimeResidence]
			   ,NULL																	[HomelessNightTimeResidence_StartDate]
			   ,NULL																	[HomelessNightTimeResidence_EndDate]
			   ,NULL																	[HomelessUnaccompaniedYouth]
			   ,CASE 
					WHEN hl.BeginDate is not null THEN '1'
					ELSE NULL END																	[HomelessServicedIndicator]
			   ,CASE 
					WHEN food.BeginDate is not null THEN '1'
					ELSE NULL END														[EconomicDisadvantageStatus]
			   , food.BeginDate															[EconomicDisadvantage_StatusStartDate]
			   , food.EndDate															[EconomicDisadvantage_StatusEndDate]

			   ,CASE 
					WHEN migrant.BeginDate is not null THEN '1'
					ELSE NULL END														[MigrantStatus]
			   , migrant.BeginDate														[Migrant_StatusStartDate]
			   , migrant.EndDate														[Migrant_StatusEndDate]

			   ,CASE 
					WHEN mc.BeginDate is not null THEN '1'
					ELSE NULL END														[MilitaryConnectedStudentIndicator]
			   , mc.BeginDate															[MilitaryConnected_StatusStartDate]
			   , mc.EndDate																[MilitaryConnected_StatusEndDate]

			   ,CASE 
					WHEN foster.BeginDate is not null THEN '1'
					ELSE NULL END [ProgramType_FosterCare]
			   ,foster.BeginDate														[FosterCare_ProgramParticipationStartDate]
			   ,foster.EndDate															[FosterCare_ProgramParticipationEndDate]

			   ,CASE 
					WHEN sec504.BeginDate is not null THEN '1'
					ELSE NULL END [ProgramType_Section504]
			   ,sec504.BeginDate														[Section504_ProgramParticipationStartDate]
			   ,sec504.EndDate															[Section504_ProgramParticipationEndDate]

			   ,CASE 
					WHEN immigrant.BeginDate is not null THEN '1'
					ELSE NULL END [ProgramType_Immigrant]
			   ,immigrant.BeginDate														[Immigrant_ProgramParticipationStartDate]
			   ,immigrant.EndDate														[Immigrant_ProgramParticipationEndDate]

			   , NULL																	[EnglishLearnerStatus]
			   , NULL																	[EnglishLearner_StatusStartDate]
			   , NULL																	[EnglishLearner_StatusEndDate]
			   ,langd.CodeValue															[ISO_639_2_NativeLanguage]
			   ,CASE 
					WHEN idea.StudentUSI is not null THEN '1'
					ELSE NULL END														[IDEAIndicator]
			   , idea.BeginDate															[IDEA_StatusStartDate]
			   , idea.EndDate															[IDEA_StatusEndDate]
			   , idea.IDEAStatus														[PrimaryDisabilityType]
			   , foodd.CodeValue														[EligibilityStatusForSchoolFoodServicePrograms]
			   , foodasso.DirectCertification											NationalSchoolLunchProgramDirectCertificationIndicator
			   ,NULL																	[PersonId]
			   ,NULL																	[OrganizationID_LEA]
			   ,NULL																	[OrganizationID_School]
			   ,NULL																	[OrganizationID_Program_Foster]
			   ,NULL																	[OrganizationPersonRoleID_School]
			   ,NULL																	[PersonStatusId_Homeless]
			   ,NULL																	[PersonStatusId_EconomicDisadvantage]
			   ,NULL																	[PersonStatusId_IDEA]
			   ,NULL																	[PersonStatusId_EnglishLearner]
			   ,NULL																	[PersonStatusId_Migrant]
			   ,NULL																	[PersonMilitaryId]
			   ,NULL																	[PersonHomelessnessId]
			   ,NULL																	[OrganizationPersonRoleID_Program_Foster]
			   ,NULL																	[RunDateTime]
		FROM [EdFi_Sample_ODS_Data_For_Generate].edfi.Student s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.StudentSchoolAssociation ssa 
			ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.School sch 
			ON sch.SchoolId = ssa.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.EducationOrganization edorg 
			ON sch.SchoolId = edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.LocalEducationAgency lea 
			ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcode 
			ON edorgcode.EducationOrganizationId=edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor ed 
			ON ed.DescriptorId=edorgcode.EducationOrganizationIdentificationSystemDescriptorId

		-- military connected
		left join (
			select mil.StudentUSI, milchar.BeginDate, milchar.EndDate
			from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristic mil  
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod milchar on 
				milchar.StudentUSI=mil.StudentUSI AND mil.EducationOrganizationId = milchar.EducationOrganizationId
				AND mil.StudentCharacteristicDescriptorId = milchar.StudentCharacteristicDescriptorId
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor mildesc on mildesc.DescriptorId=milchar.StudentCharacteristicDescriptorId
			where mildesc.CodeValue='Parent in Military'
		) mc on mc.StudentUSI=s.StudentUSI
		and isnull(mc.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
		AND mc.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)

		-- homelessness
		left join (
			select homeless.StudentUSI, homelesschar.BeginDate, homelesschar.EndDate
			from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristic homeless  
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod homelesschar on 
				homelesschar.StudentUSI=homeless.StudentUSI AND homeless.EducationOrganizationId = homelesschar.EducationOrganizationId
				AND homeless.StudentCharacteristicDescriptorId = homelesschar.StudentCharacteristicDescriptorId
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor homelessdesc on homelessdesc.DescriptorId=homelesschar.StudentCharacteristicDescriptorId
			where homelessdesc.CodeValue='Homeless'
		) hl on hl.StudentUSI=s.StudentUSI
		and isnull(hl.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
		AND hl.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)

		-- migrant
		left join (
			select mig.StudentUSI, migchar.BeginDate, migchar.EndDate
			from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristic mig  
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod migchar on 
				migchar.StudentUSI=mig.StudentUSI AND mig.EducationOrganizationId = migchar.EducationOrganizationId
				AND mig.StudentCharacteristicDescriptorId = migchar.StudentCharacteristicDescriptorId
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor migdesc on migdesc.DescriptorId=migchar.StudentCharacteristicDescriptorId
			where migdesc.CodeValue='Migrant'
		) migrant on migrant.StudentUSI=s.StudentUSI
		and isnull(migrant.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
		AND migrant.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
		
		-- language
		--left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociationLanguageUse] langUse 
		--	on langUse.StudentUSI = s.StudentUSI
  --      left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor langd 
		--		ON langd.DescriptorId = langUse.LanguageDescriptorId
		
		-- IDEA
		LEFT JOIN (
			select disa.StudentUSI, ga.BeginDate, ga.EndDate, d.CodeValue as IDEAStatus
			from [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociationDisability] disa  
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d On d.DescriptorId = disa.DisabilityDescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] ga 
				ON ga.StudentUSI = disa.StudentUSI AND ga.EducationOrganizationId = disa.EducationOrganizationId
		) idea on idea.StudentUSI=s.StudentUSI
		AND isnull(idea.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
		AND idea.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)

		-- EconomicDisadvantage
		LEFT JOIN (
			select foo.StudentUSI, foochar.BeginDate, foochar.EndDate
			from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristic foo  
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod foochar on 
				foochar.StudentUSI=foo.StudentUSI AND foo.EducationOrganizationId = foochar.EducationOrganizationId
				AND foo.StudentCharacteristicDescriptorId = foochar.StudentCharacteristicDescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor foodesc on foodesc.DescriptorId=foochar.StudentCharacteristicDescriptorId
			where foodesc.CodeValue='Economic Disadvantaged'
		) food on food.StudentUSI=s.StudentUSI
		AND isnull(food.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
		AND food.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)

		-- foster care
		LEFT JOIN (
			select fost.StudentUSI, fostchar.BeginDate, fostchar.EndDate
			from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristic fost  
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod fostchar on 
				fostchar.StudentUSI=fost.StudentUSI AND fost.EducationOrganizationId = fostchar.EducationOrganizationId
				AND fost.StudentCharacteristicDescriptorId = fostchar.StudentCharacteristicDescriptorId
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor fostdesc on fostdesc.DescriptorId=fostchar.StudentCharacteristicDescriptorId
			where fostdesc.CodeValue='Foster Care'
		) foster on foster.StudentUSI=s.StudentUSI
		AND isnull(foster.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
		AND foster.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)

		-- Section 504 Placement
		LEFT JOIN (
			select s504.StudentUSI, s504char.BeginDate, s504char.EndDate
			from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristic s504  
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod s504char on 
				s504char.StudentUSI=s504.StudentUSI AND s504.EducationOrganizationId = s504char.EducationOrganizationId
				AND s504.StudentCharacteristicDescriptorId = s504char.StudentCharacteristicDescriptorId
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor s504desc on s504desc.DescriptorId=s504char.StudentCharacteristicDescriptorId
			where s504desc.CodeValue='Section 504 Handicapped'
		) sec504 on sec504.StudentUSI=s.StudentUSI
		AND isnull(sec504.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
		AND sec504.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)

		-- Immigrant
		LEFT JOIN (
			select immi.StudentUSI, immichar.BeginDate, immichar.EndDate
			from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristic immi  
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod immichar on 
				immichar.StudentUSI=immi.StudentUSI AND immi.EducationOrganizationId = immichar.EducationOrganizationId
				AND immi.StudentCharacteristicDescriptorId = immichar.StudentCharacteristicDescriptorId
			left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor s504desc on s504desc.DescriptorId=immichar.StudentCharacteristicDescriptorId
			where s504desc.CodeValue='Immigrant'
		) immigrant on immigrant.StudentUSI=s.StudentUSI
		AND isnull(immigrant.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
		AND immigrant.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)

		-- Student native Language
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociationLanguageUse] langUse 
			ON langUse.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor langd 
			ON langd.DescriptorId =langUse.LanguageDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor langused 
			ON langused.DescriptorId =langUse.LanguageUseDescriptorId
		AND langused.CodeValue IN ('Native Language', 'Home Language')

		-- Lunch 
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolFoodServiceProgramAssociation] foodasso 
			on foodasso.StudentUSI = s.StudentUSI AND sch.SchoolId = foodasso.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService] foodPram 
			on foodPram.StudentUSI = s.StudentUSI AND sch.SchoolId = foodPram.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor foodd ON foodd.DescriptorId = foodPram.SchoolFoodServiceProgramServiceDescriptorId

		WHERE ed.CodeValue = 'SEA'


		-- Update IDEA for Special EducATION
		UPDATE st
		SET [IDEAIndicator] = idea.IdeaEligibility
			,[IDEA_StatusStartDate] = ga.BeginDate
			,[IDEA_StatusEndDate] = ga.EndDate
		FROM [Staging].[PersonStatus] st
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.Student s
			ON s.StudentUniqueId = st.Student_Identifier_State
		JOIN  [EdFi_Sample_ODS_Data_For_Generate].edfi.StudentSpecialEducationProgramAssociation idea 
			ON idea.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] ga 
			ON ga.StudentUSI = idea.StudentUSI AND ga.EducationOrganizationId = idea.EducationOrganizationId
		WHERE idea.IdeaEligibility IS NOT NULL

		/*
			[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus] 2018
		*/

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
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentDisability sd ON s.StudentUSI = sd.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationDisability sd on
			sd.StudentUSI=s.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
			ON sd.DisabilityDescriptorId = d.DescriptorId

		UPDATE Staging.PersonStatus
		SET PrimaryDisabilityType = pd.DisabilityType
		FROM Staging.PersonStatus ps
		JOIN Staging.PrimaryDisability pd 
			ON ps.Student_Identifier_State = pd.Student_Identifier_State

		-- homeless nighttime residence	
		DECLARE @homelessnighttime AS TABLE (		
			Student_Identifier_State VARCHAR(100),
			HomelessNightTimeResidence VARCHAR(100),
			HomelessUnaccompaniedYouth BIT,
			BeginDate DATE
		)
		INSERT INTO @homelessnighttime (
			Student_Identifier_State
			,HomelessNightTimeResidence
			,HomelessUnaccompaniedYouth
			,BeginDate
		)
		SELECT DISTINCT
			REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
			,Min(shpdesc.CodeValue) AS CodeValue
			,shpa.HomelessUnaccompaniedYouth
			,gspa.BeginDate
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentHomelessProgramAssociation] shpa ON
			shpa.StudentUSI=s.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].GeneralStudentProgramAssociation gspa ON
			gspa.StudentUSI = shpa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor shpdesc 
			ON shpdesc.DescriptorId=shpa.HomelessPrimaryNighttimeResidenceDescriptorId
		WHERE isnull(gspa.EndDate, GETDATE()) >= @SYStartDate
		AND gspa.BeginDate <= @SYEndDate
		AND gspa.ProgramName = 'homeless'
		GROUP BY s.StudentUniqueId, gspa.BeginDate, shpa.HomelessUnaccompaniedYouth
		HAVING (gspa.BeginDate = Min(gspa.BeginDate))

		/*
			[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus] 2018
		*/

		UPDATE Staging.PersonStatus
		SET 
			HomelessNightTimeResidence = hnt.HomelessNightTimeResidence,
			HomelessNightTimeResidence_StartDate = hnt.BeginDate,
			HomelessNightTimeResidence_EndDate = hnt.BeginDate,
			HomelessUnaccompaniedYouth = hnt.HomelessUnaccompaniedYouth
		FROM Staging.PersonStatus ps
		JOIN @homelessnighttime hnt ON hnt.Student_Identifier_State=ps.Student_Identifier_State



		-- English Learner status
		/*
		 I have not heard definitively from Sayee - she was going to check with states to see which one they use, 
		 but she gave her thoughts about how to do it and I say we go with what she has, but it may involve adding in an IF/THEN.  
		 The first place to look is the StudentLanguageInstructionProgramAssocation.englishLearnerParticipation (this is a true/false) - 
		 utilize the serviceBeginDate and serviceEndDate.  For the IF/THEN, Do a "SELECT COUNT(*)  - Where englishLearnerParticipation = 1.  
		 If there are no records, then utilize the limitedEnglsihProficiencyDescriptorId in the StudentEducationOrganizationAssocation 
		 instead and for that use the MembershipDate in Generate's Toggle (App.ToggleResponses) for the Start and End Date - 
		 this will normally be October 1st and use the @SchoolYear - 1 that get's' passed into the stored procedure.  
		 So to recap, we want to see first if the state is using the StudentLanguageInstructionProgramAssocation.englishLearnerParticipation 
		 by doing an IF/THEN and getting a count. If that count is greater than 0, then we use that field.  
		 If it's less than 1, then we instead use the limitedEnglsihProficiencyDescriptorId and we get the begin/end dates 
		 by using App.ToggleResponses to get the membership date for that school year 
		 (typically october 1, but it can move around) and we get the school year by taking @Schoolyear and subtracting 1 from it.  
		 So App.ToggleReponses indicates October 2 and the @SchoolYear  = 2019 so our begin/end date will be 10-2-2018 and 10-2-2018.
		*/
		-- step 1 calculate usage for StudentLanguageInstructionProgramAssociation table
		DECLARE @ESLProgram INT
		DECLARE @NotLEP INT
		DECLARE @Count INT
		SELECT @Count = Count('c') FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentLanguageInstructionProgramAssociation
		WHERE EnglishLearnerParticipation = 1

		SELECT @ESLProgram = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
		WHERE Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue = 'English as a Second Language (ESL)'

		SELECT @NotLEP = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
		WHERE Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor' AND CodeValue = 'NotLimited'

		-- step 2
		-- detect if the state is using the StudentLanguageInstructionProgramAssocation.englishLearnerParticipation bit field
		IF @Count > 1 
			BEGIN
				UPDATE Staging.PersonStatus
				SET [EnglishLearnerStatus] = 1
					,[EnglishLearner_StatusStartDate] = slipas.ServiceBeginDate
					,[EnglishLearner_StatusEndDate] = slipas.ServiceEndDate
				FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentLanguageInstructionProgramAssociation slipa
				JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.Student s ON s.StudentUSI=slipa.StudentUSI
				JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService slipas
					ON slipas.BeginDate = slipa.BeginDate
					AND slipas.EducationOrganizationId = slipa.EducationOrganizationId
					AND slipas.ProgramEducationOrganizationId = slipa.ProgramEducationOrganizationId
					AND slipas.ProgramName = slipa.ProgramName
					AND slipas.ProgramTypeDescriptorId = slipa.ProgramTypeDescriptorId
				WHERE slipa.ProgramTypeDescriptorId = @ESLProgram
				AND slipa.EnglishLearnerParticipation = 1
			END
		ELSE
			BEGIN
				PRINT 'use StudentEducationOrganizationAssociation'
				DECLARE @customFactTypeDate AS VARCHAR(10)
				DECLARE @cutOffMonth VARCHAR(2)
				DECLARE @cutOffDay VARCHAR(2)

				SET @customFactTypeDate = NULL
				SELECT @customFactTypeDate = r.ResponseValue
				FROM app.ToggleResponses r
				JOIN app.ToggleQuestions q ON r.ToggleQuestionId = q.ToggleQuestionId
				WHERE q.EmapsQuestionAbbrv = 'MEMBERDTE'
				SET @cutOffMonth = 10
				SET @cutOffDay = 1
				IF NOT @customFactTypeDate is null
					BEGIN
						IF CHARINDEX('/', @customFactTypeDate) > 0
						BEGIN
							SELECT @cutOffMonth = SUBSTRING(@customFactTypeDate, 0, CHARINDEX('/', @customFactTypeDate))
							SELECT @cutOffDay = SUBSTRING(@customFactTypeDate, CHARINDEX('/', @customFactTypeDate) + 1, len(@customFactTypeDate))
						END			
					END
				--DATEFROMPARTS(@SchoolYear, @cutOffMonth, @cutOffDay) as DateValue,

				UPDATE Staging.PersonStatus
				SET [EnglishLearnerStatus] = 1
					,[EnglishLearner_StatusStartDate] = DATEFROMPARTS(@SchoolYear - 1, @cutOffMonth, @cutOffDay)
					,[EnglishLearner_StatusEndDate] = NULL
				FROM Staging.PersonStatus ps
				JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.Student s
					ON s.StudentUniqueId = ps.Student_Identifier_State
				JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociation seoa 
					ON seoa.StudentUSI=s.StudentUSI

				WHERE seoa.LimitedEnglishProficiencyDescriptorId  IS NOT NULL
					AND seoa.LimitedEnglishProficiencyDescriptorId <> @NotLEP
			END

		/*
			[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus] 2018
		*/

		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.PersonStatus SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PersonStatus) > 0
		UPDATE Staging.PrimaryDisability SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PrimaryDisability) > 0

		----Validate Staging.PersonStatus----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus', 'PersonStatus', @SchoolYear

		----Validate Staging.PrimaryDisability----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus', 'PrimaryDisability', @SchoolYear


			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 
	--rollback
END
