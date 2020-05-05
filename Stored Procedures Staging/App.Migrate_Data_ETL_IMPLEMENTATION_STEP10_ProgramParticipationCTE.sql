USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_ProgramParticipationCTE') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_ProgramParticipationCTE]
END

GO
CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_ProgramParticipationCTE]
	@SchoolYear SMALLINT = NULL
	AS
	BEGIN

		--  [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_ProgramParticipationCTE] 2018

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

			TRUNCATE TABLE Staging.ProgramParticipationCTE

	-------------------------------------Begin CTE Student Specific Information Section----------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
	----created to work with the data standardized in this location. Do not make any changes to table names or column----
	----names or to any of the code after this section.  The only information that should be modified is the source  ----
	----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

			INSERT INTO Staging.ProgramParticipationCTE
				(
				 RecordId
				,Student_Identifier_State
				,School_Identifier_State
				,ProgramParticipationBeginDate
				,ProgramParticipationEndDate
				,[DiplomaCredentialType]
				,[DiplomaCredentialType_2]
				,[DiplomaCredentialAwardDate]
				,[CteParticipant]
				,[CteConcentrator]
				,[CteCompleter]
				,[SingleParentIndicator]
				,[SingleParent_StatusStartDate]
				,[SingleParent_StatusEndDate]
				,[DisplacedHomeMakerIndicator]
				,[DisplacedHomeMaker_StatusStartDate]
				,[DisplacedHomeMaker_StatusEndDate]
				,[AdvancedTrainingEnrollmentDate]
				,[PlacementType]
				,[TechnicalSkillsAssessmentType]
				,[NonTraditionalGenderStatus]
				,PersonID
				,OrganizationID_School
				,OrganizationPersonRoleID_School
				,PersonProgramParticipationID
				,CteExitReason
				,RunDateTime
				)
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,sch.SchoolId School_Identifier_State
				,cte.BeginDate ProgramParticipationBeginDate
				,NULL ProgramParticipationEndDate
				,CASE 
					WHEN std.CodeValue = 'Regular diploma' OR std.CodeValue = 'Other diploma' OR std.CodeValue = 'General Educational Development (GED) credential' THEN std.CodeValue
					ELSE NULL 
				END DiplomaCredentialType
				,std.CodeValue DiplomaCredentialType_2				
				,sard.DiplomaAwardDate DiplomaCredentialAwardDate
				,NULL												[CteParticipant]
				,NULL												[CteConcentrator]
				,ctecte.CTEProgramCompletionIndicator								[CteCompleter]
				,CASE 
					WHEN sp.BeginDate IS NOT NULL THEN '1'
					ELSE NULL 
				END [SingleParentIndicator]
				,sp.BeginDate [SingleParent_StatusStartDate]
				,sp.EndDate [SingleParent_StatusEndDate]
			   	,CASE 
					WHEN dh.BeginDate IS NOT NULL THEN '1'
					ELSE NULL 
				END [DisplacedHomeMakerIndicator]
			    ,dh.BeginDate [DisplacedHomeMaker_StatusStartDate]
			    ,dh.EndDate [DisplacedHomeMaker_StatusEndDate]
				, 
				NULL [AdvancedTrainingEnrollmentDate]
				,NULL [PlacementType]
				--CASE 
				--	WHEN pseD.DescriptorId IS NOT NULL THEN 'POSTSEC'
				--	ELSE dispd.CodeValue
				-- END [PlacementType]
				,d.CodeValue TechnicalSkillsAssessmentType
				,cte.NonTraditionalGenderStatus NonTraditionalGenderStatus
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL OrganizationPersonRoleID_School
				,NULL PersonProgramParticipationID
				,ed.CodeValue
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation] cte 
				ON s.StudentUSI = cte.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pt 
				ON cte.ProgramTypeDescriptorId = pt.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg 
				ON cte.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] seaCode 
				ON seaCode.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] seaD 
				ON seaD.DescriptorId = seaCode.EducationOrganizationIdentificationSystemDescriptorId 
				AND seaD.CodeValue = 'SEA'
			-- SchoolId
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] sta
				ON sta.StudentUSI = s.StudentUSI 
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] sch
				ON sch.SchoolId = sta.SchoolId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
				ON  cte.TechnicalSkillsAssessmentDescriptorId = d.DescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociationCTEProgram] ctecte 
				ON cte.StudentUSI = ctecte.StudentUSI 
				AND cte.EducationOrganizationId = ctecte.EducationOrganizationId 
				AND cte.ProgramEducationOrganizationId = ctecte.ProgramEducationOrganizationId
				AND cte.ProgramName = ctecte.ProgramName 
				AND cte.BeginDate = ctecte.BeginDate 
				AND cte.ProgramTypeDescriptorId = ctecte.ProgramTypeDescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAcademicRecordDiploma] sard 
				ON sard.StudentUSI = s.StudentUSI 
				AND sard.EducationOrganizationId = cte.EducationOrganizationId 
				AND sard.SchoolYear = @SchoolYear
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] std 
				ON std.DescriptorId = sard.DiplomaTypeDescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[PostSecondaryEvent] postSecEvent 
				ON postSecEvent.StudentUSI = s.StudentUSI
				AND postSecEvent.EventDate <= App.GetFiscalYearEndDate(@SchoolYear)
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] pseD 
				ON pseD.DescriptorId = postSecEvent.PostSecondaryEventCategoryDescriptorId
				AND (pseD.CodeValue = 'College Enrollment' OR pseD.CodeValue ='College Acceptance')

			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] studentassess 
				ON studentassess.StudentUSI = s.StudentUSI 
				AND studentassess.SchoolYear = @SchoolYear
			-- Single Parent
			LEFT JOIN (
				SELECT singleparent.StudentUSI, singleparentchar.BeginDate, singleparentchar.EndDate
				FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristic singleparent  
				LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod singleparentchar 
					ON singleparentchar.StudentUSI= singleparent.StudentUSI
					AND singleparentchar.EducationOrganizationId = singleparent.EducationOrganizationId
					AND singleparentchar.StudentCharacteristicDescriptorId = singleparent.StudentCharacteristicDescriptorId
				LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor singleparentdesc 
					ON singleparentdesc.DescriptorId = singleparentchar.StudentCharacteristicDescriptorId
				WHERE singleparentdesc.CodeValue = 'Single Parent' OR singleparentdesc.CodeValue = 'Pregnant'
			) sp ON sp.StudentUSI=s.StudentUSI
				AND isnull(sp.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND sp.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
			-- Displaced Homemaker
			LEFT JOIN (
				select homemaker.StudentUSI, homemakerchar.BeginDate, homemakerchar.EndDate
				from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristic homemaker  
				LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod homemakerchar 
					ON homemakerchar.StudentUSI= homemaker.StudentUSI
					AND homemakerchar.EducationOrganizationId = homemaker.EducationOrganizationId
					AND homemakerchar.StudentCharacteristicDescriptorId = homemaker.StudentCharacteristicDescriptorId
				LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor homelessdesc 
					ON homelessdesc.DescriptorId= homemakerchar.StudentCharacteristicDescriptorId
				WHERE homelessdesc.CodeValue='Displaced Homemaker'
			) dh ON dh.StudentUSI=s.StudentUSI
				AND isnull(dh.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND dh.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] gspa 
				ON gspa.[StudentUSI] = cte.[StudentUSI]
				AND gspa.[EducationOrganizationId] = cte.EducationOrganizationId
				AND gspa.[ProgramName] = cte.ProgramName
				AND gspa.[ProgramEducationOrganizationId] = cte.ProgramEducationOrganizationId
				AND gspa.[BeginDate] = cte.BeginDate
				AND gspa.[ProgramTypeDescriptorId] = cte.ProgramTypeDescriptorId
				AND isnull(gspa.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND gspa.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
			LEFT JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor ed 
				ON ed.DescriptorId = gspa.ReasonExitedDescriptorId
			WHERE pt.CodeValue = 'Career and Technical Education'


			-- CTE Assessment skills
			DECLARE @BeginDateMin date, @BeginDateMax date

			SELECT @BeginDateMin = Min(gspa.BeginDate), @BeginDateMax = Max(gspa.BeginDate)
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation] a
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pt 
					ON a.ProgramTypeDescriptorId = pt.DescriptorId
			JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor d on d.DescriptorId = a.TechnicalSkillsAssessmentDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] gspa 
				ON gspa.[StudentUSI] = a.[StudentUSI]
				AND gspa.[EducationOrganizationId] = a.EducationOrganizationId
				AND gspa.[ProgramName] = a.ProgramName
				AND gspa.[ProgramEducationOrganizationId] = a.ProgramEducationOrganizationId
				AND gspa.[BeginDate] = a.BeginDate
				AND gspa.[ProgramTypeDescriptorId] = a.ProgramTypeDescriptorId
				AND isnull(gspa.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND gspa.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
			WHERE pt.CodeValue = 'Career and Technical Education' AND d.CodeValue <> 'Did Not Take'

			INSERT INTO [Staging].[Assessment]
				   ([AssessmentTitle]
				   ,[AssessmentShortName]
				   ,[AssessmentAcademicSubject]
				   ,[AssessmentPurpose]
				   ,[AssessmentType]
				   ,[AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,[AssessmentFamilyTitle]
				   ,[AssessmentFamilyShortName]
				   ,[AssessmentAdministrationStartDate]
				   ,[AssessmentAdministrationFinishDate]
				   ,[AssessmentPerformanceLevelIdentifier]
				   ,[AssessmentPerformanceLevelLabel])
			VALUES
				   ('CTE Technical Assessment' -- Or whatever it's called in the file spec
				   ,'Technical Skills'
				   ,'Career and Technical Education' -- You need a value in ods.SourceSystemReferenceData that links this value to '73065' in ods.RefAcademicSubject
				   ,'Technical Skills File Specifications'
				   , 'Achievement test'					-- [AssessmentType]
				   ,'REGASSWOACC'								-- [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,'Career and Technical Education'		-- [AssessmentFamilyTitle]
				   ,'CTE'				-- [AssessmentFamilyShortName]
				   ,@BeginDateMin		-- GeneralStudentProgramAssociation	BeginDate Min
				   ,@BeginDateMax		-- GeneralStudentProgramAssociation BeginDate Max
				   ,'L1' -- include records for 2 and 3 as well		Pass, didn't pass	matching descriptor select descid from desc where codevalue = 'fail'
				   ,'PSD')
 
			INSERT INTO [Staging].[Assessment]
				   ([AssessmentTitle]
				   ,[AssessmentShortName]
				   ,[AssessmentAcademicSubject]
				   ,[AssessmentPurpose]
				   ,[AssessmentType]
				   ,[AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,[AssessmentFamilyTitle]
				   ,[AssessmentFamilyShortName]
				   ,[AssessmentAdministrationStartDate]
				   ,[AssessmentAdministrationFinishDate]
				   ,[AssessmentPerformanceLevelIdentifier]
				   ,[AssessmentPerformanceLevelLabel])
			VALUES
				   ('CTE Technical Assessment' -- Or whatever it's called in the file spec
				   ,'Technical Skills'
				   ,'Career and Technical Education' -- You need a value in ods.SourceSystemReferenceData that links this value to '73065' in ods.RefAcademicSubject
				   ,'Technical Skills File Specifications'
				   ,'Achievement test'					-- [AssessmentType]
				   ,'REGASSWOACC'								-- [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,'Career and Technical Education'		-- [AssessmentFamilyTitle]
				   ,'CTE'				-- [AssessmentFamilyShortName]
				   ,@BeginDateMin		--GeneralStudentProgramAssociation	BeginDate Min
				   ,@BeginDateMax		-- GeneralStudentProgramAssociation	BeginDate Max
				   ,'L2' -- include records for 2 and 3 as well		Pass, didn't pass (select descid from desc where codevalue = 'pass')
				   ,'DN')



			--===============================================

			INSERT INTO [Staging].[AssessmentResult]
				   ([Student_Identifier_State]
				   ,[LEA_Identifier_State]
				   ,[School_Identifier_State]
				   ,[AssessmentTitle]
				   ,[AssessmentAcademicSubject]
				   ,[AssessmentPurpose]
				   ,[AssessmentType]
				   ,[AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,[AssessmentAdministrationStartDate]
				   ,[AssessmentAdministrationFinishDate]
				   ,[AssessmentRegistrationParticipationIndicator]
				   ,[GradeLevelWhenAssessed]
				   ,[StateFullAcademicYear]
				   ,[LEAFullAcademicYear]
				   ,[SchoolFullAcademicYear]
				   ,[AssessmentRegistrationReasonNotCompleting]
				   ,[AssessmentPerformanceLevelIdentifier]
				   ,[AssessmentPerformanceLevelLabel]
				   ,[AssessmentRegistrationId]
				   ,[AssessmentId]
				   ,[AssessmentAdministrationId]
				   ,[PersonId]
				   ,[AssessmentFormId]
				   ,[AssessmentSubtestId]
				   ,[AssessmentPerformanceLevelId]
				   ,[AssessmentResultId]
				   ,[AssessmentResult_PerformanceLevelId]
				   ,[OrganizationID_School]
				   ,[OrganizationPersonRoleId_School]
				   ,[RunDateTime]
				   )
			SELECT DISTINCT
				    REPLACE(s.StudentUniqueId, ' ', '') [Student_Identifier_State]
				   ,a.EducationOrganizationId LEA_Identifier_State
				   ,sch.SchoolId [School_Identifier_State]
				   ,'CTE Technical Assessment' [AssessmentTitle] -- should match exactly with the assessment title above
				   ,'Career and Technical Education' -- You need a value in ods.SourceSystemReferenceData that links this value to '73065' in ods.RefAcademicSubject [AssessmentAcademicSubject]
				   ,'Technical Skills File Specifications' [AssessmentPurpose]
				   ,'REGASSWOACC' [AssessmentType]
				   ,NULL [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,gspa.BeginDate [AssessmentAdministrationStartDate]		-- GeneralStudentProgramAssociation.BeginDate 
				   ,gspa.BeginDate [AssessmentAdministrationFinishDate]		-- GeneralStudentProgramAssociation	BeginDate
				   ,'1' [AssessmentRegistrationParticipationIndicator]
				   ,NULL [GradeLevelWhenAssessed]
				   ,NULL [StateFullAcademicYear]
				   ,NULL [LEAFullAcademicYear]
				   ,NULL [SchoolFullAcademicYear]
				   ,NULL [AssessmentRegistrationReasonNotCompleting]
				   ,case 
						when d.CodeValue = 'Not Passed' then 'L1'  -- this is what the student scored as it relates to performance level/proficiency - should match with what was put into the Assessment table above
						when d.CodeValue = 'Passed' then 'L2'
					end -- as [AssessmentPerformanceLevelIdentifier]
				   ,case 
						when d.CodeValue = 'Not Passed' then 'DN'  -- this is what the student scored as it relates to performance level/proficiency - should match with what was put into the Assessment table above
						when d.CodeValue = 'Passed' then 'PSD'
					end  -- this is what the student scored as it relates to performance level/proficiency - should match with what was put into the Assessment table above
				   ,NULL [AssessmentRegistrationId]
				   ,NULL [AssessmentId]
				   ,NULL [AssessmentAdministrationId]
				   ,NULL [PersonId]
				   ,NULL [AssessmentFormId]
				   ,NULL [AssessmentSubtestId]
				   ,NULL [AssessmentPerformanceLevelId]
				   ,NULL [AssessmentResultId]
				   ,NULL [AssessmentResult_PerformanceLevelId]
				   ,NULL [OrganizationID_School]
				   ,NULL [OrganizationPersonRoleId_School]
				   ,NULL [RunDateTime]
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation] a
				ON s.StudentUSI = s.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pt 
					ON a.ProgramTypeDescriptorId = pt.DescriptorId
			JOIN EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor d on d.DescriptorId = a.TechnicalSkillsAssessmentDescriptorId

			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg 
					ON a.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] seaCode 
				ON seaCode.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] seaD 
				ON seaD.DescriptorId = seaCode.EducationOrganizationIdentificationSystemDescriptorId 
				AND seaD.CodeValue = 'SEA'
			-- SchoolId
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] sta
				ON sta.StudentUSI = a.StudentUSI 
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] sch
				ON sch.SchoolId = sta.SchoolId and sch.LocalEducationAgencyId = a.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] gspa 
				ON gspa.[StudentUSI] = a.[StudentUSI]
				AND gspa.[EducationOrganizationId] = a.EducationOrganizationId
				AND gspa.[ProgramName] = a.ProgramName
				AND gspa.[ProgramEducationOrganizationId] = a.ProgramEducationOrganizationId
				AND gspa.[BeginDate] = a.BeginDate
				AND gspa.[ProgramTypeDescriptorId] = a.ProgramTypeDescriptorId
				AND isnull(gspa.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND gspa.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
			WHERE pt.CodeValue = 'Career and Technical Education' AND d.CodeValue <> 'Did Not Take'

	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------


		UPDATE Staging.ProgramParticipationCTE SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.ProgramParticipationCTE) > 0

		----Validate Staging.ProgramParticipationCTE----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_ProgramParticipationCTE', 'ProgramParticipationCTE', @SchoolYear

		set nocount off;
	END




