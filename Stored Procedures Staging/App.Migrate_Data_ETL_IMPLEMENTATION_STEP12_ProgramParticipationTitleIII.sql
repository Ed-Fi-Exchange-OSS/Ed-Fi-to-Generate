USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP12_ProgramParticipationTitleIII') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP12_ProgramParticipationTitleIII]
END

GO
CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP12_ProgramParticipationTitleIII]
	@SchoolYear SMALLINT = NULL
	AS
	BEGIN

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

			TRUNCATE TABLE Staging.ProgramParticipationTitleIII

	-------------------------------------Begin CTE Student Specific Information Section----------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
	----created to work with the data standardized in this location. Do not make any changes to table names or column----
	----names or to any of the code after this section.  The only information that should be modified is the source  ----
	----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

			INSERT INTO Staging.ProgramParticipationTitleIII
				(
				 RecordId
				,Student_Identifier_State
				,School_Identifier_State
				,ProgramParticipationBeginDate
				,ProgramParticipationEndDate
				,Participation_TitleIII
				,Proficiency_TitleIII
				,Progress_TitleIII
				,EnglishLearnerParticipation
				,TitleIiiImmigrantStatus
				,LanguageInstructionProgramServiceType
				,TitleIiiImmigrantStatus_StartDate
				,TitleIiiImmigrantStatus_EndDate
				,PersonID
				,OrganizationID_School
				,OrganizationID_TitleIIIProgram
				,PersonProgramParticipationID
				,ImmigrationPersonStatusId
				,RunDateTime
				)
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,sch.SchoolId School_Identifier_State
				,titleIII.BeginDate ProgramParticipationBeginDate
				,NULL ProgramParticipationEndDate
				,parti.CodeValue Participation_TitleIII
				,profc.CodeValue Proficiency_TitleIII
				,prog.CodeValue Progress_TitleIII 
				,titleIII.EnglishLearnerParticipation EnglishLearnerParticipation
				,0			TitleIiiImmigrantStatus			-- by default student is not immigrant
				,langc.CodeValue LanguageInstructionProgramServiceType
				,NULL		TitleIiiImmigrantStatus_StartDate
				,NULL		TitleIiiImmigrantStatus_EndDate
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL OrganizationID_TitleIIIProgram -- titleIII.ProgramEducationOrganizationId
				,NULL PersonProgramParticipationID
				,NULL ImmigrationPersonStatusId		-- will be populated as required in Encapsulated SP
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation] cte 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation] titleIII 
				ON s.StudentUSI = titleIII.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pt 
				ON titleIII.ProgramTypeDescriptorId = pt.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg 
				ON titleIII.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] seaCode 
				ON seaCode.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] seaD 
				ON seaD.DescriptorId = seaCode.EducationOrganizationIdentificationSystemDescriptorId 
				AND seaD.CodeValue = 'SEA'
			-- SchoolId
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] sta
				ON sta.StudentUSI = s.StudentUSI 
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] sch
				ON sch.SchoolId = sta.SchoolId and sch.LocalEducationAgencyId = titleIII.EducationOrganizationId

			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment] asses
				ON titleIII.StudentUSI = asses.StudentUSI 
				AND titleIII.EducationOrganizationId = asses.EducationOrganizationId 
				AND titleIII.ProgramEducationOrganizationId = asses.ProgramEducationOrganizationId
				AND titleIII.ProgramName = asses.ProgramName 
				AND titleIII.BeginDate = asses.BeginDate 
				AND titleIII.ProgramTypeDescriptorId = asses.ProgramTypeDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor profc 
				ON asses.ProficiencyDescriptorId = profc.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor parti 
				ON asses.ParticipationDescriptorId = parti.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor prog 
				ON asses.ProgressDescriptorId = prog.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService] serv
				ON titleIII.StudentUSI = serv.StudentUSI 
				AND titleIII.EducationOrganizationId = serv.EducationOrganizationId 
				AND titleIII.ProgramEducationOrganizationId = serv.ProgramEducationOrganizationId
				AND titleIII.ProgramName = serv.ProgramName 
				AND titleIII.BeginDate = serv.BeginDate 
				AND titleIII.ProgramTypeDescriptorId = serv.ProgramTypeDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor langc 
				ON serv.LanguageInstructionProgramServiceDescriptorId = langc.DescriptorId

			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] studentassess 
				ON studentassess.StudentUSI = s.StudentUSI 
				AND studentassess.SchoolYear = @SchoolYear

			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] gspa 
				ON gspa.[StudentUSI] = titleIII.[StudentUSI]
				AND gspa.[EducationOrganizationId] = titleIII.EducationOrganizationId
				AND gspa.[ProgramName] = titleIII.ProgramName
				AND gspa.[ProgramEducationOrganizationId] = titleIII.ProgramEducationOrganizationId
				AND gspa.[BeginDate] = titleIII.BeginDate
				AND gspa.[ProgramTypeDescriptorId] = titleIII.ProgramTypeDescriptorId
				AND isnull(gspa.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND gspa.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
		--	WHERE titleIII = 'Career and Technical Education'

	---------------------------------------------------------------------------------------------------------------------
	-- StudentImmigrant FS045
	UPDATE titleIII
	SET 
		 TitleIiiImmigrantStatus = 1
		,TitleIiiImmigrantStatus_StartDate = immcharperiod.BeginDate
		,TitleIiiImmigrantStatus_EndDate = immcharperiod.EndDate
	FROM Staging.ProgramParticipationTitleIII titleIII
	JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] immchar ON 
		immchar.StudentUSI = titleIII.RecordId
	JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod immcharperiod ON 
		immcharperiod.StudentUSI = immchar.StudentUSI
		AND immcharperiod.StudentCharacteristicDescriptorId = immchar.StudentCharacteristicDescriptorId
		AND immcharperiod.EducationOrganizationId = immchar.EducationOrganizationId
	JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor immdesc ON 
		immdesc.DescriptorId = immcharperiod.StudentCharacteristicDescriptorId
	WHERE immdesc.CodeValue='Immigrant'
	----- end FS045------------------------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------


		UPDATE Staging.ProgramParticipationTitleIII SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.ProgramParticipationTitleIII) > 0

		----Validate Staging.ProgramParticipationCTE----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP14_ProgramParticipationTitleIII', 'ProgramParticipationTitleIII', @SchoolYear

		set nocount off;
	END




