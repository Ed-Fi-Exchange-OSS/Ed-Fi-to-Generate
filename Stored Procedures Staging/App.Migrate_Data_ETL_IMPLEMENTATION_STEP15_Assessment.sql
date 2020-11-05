-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_Assessment]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP15_Assessment') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_Assessment]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_Assessment]
	@SchoolYear SMALLINT = NULL
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
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP15_Assessment];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;
		
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


-------------------------------------Begin State Specific Information Section----------------------------------------
---------------------------------------------------------------------------------------------------------------------
----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
----created to work with the data standardized in this location. Do not make any changes to table names or column----
----names or to any of the code after this section.  The only information that should be modified is the source  ----
----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		TRUNCATE TABLE Staging.Assessment
		TRUNCATE TABLE Staging.AssessmentResult



		------------------------------------------------
		---Metadata about the Assessment ---------------
		------------------------------------------------

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
				   ,[AssessmentPerformanceLevelLabel]
				   ,[AssessmentId]
				   ,[AssessmentAdministrationId]
				   ,[AssessmentSubtestId]
				   ,[AssessmentFormId]
				   ,[AssessmentPerformanceLevelId]
				   ,[RunDateTime]
				   )
		SELECT DISTINCT
				    a.AssessmentTitle [AssessmentTitle] -- break down the assessment by subject area so if it's end of instruction, this should be End of Instruction English Language Arts not just End of Instruction.
										--is this the title that has to match toggle exactly so that it can find it?
				   ,a.AssessmentTitle [AssessmentShortName]
				   ,asubject.CodeValue [AssessmentAcademicSubject]
				   ,atype.CodeValue [AssessmentPurpose]
				   ,atype.CodeValue [AssessmentType]
				   ,atype.CodeValue [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,CASE ISNULL(a.AssessmentFamily, a.AssessmentTitle)
						WHEN a.AssessmentTitle THEN a.AssessmentTitle
						ELSE a.AssessmentFamily END [AssessmentFamilyTitle]
				   ,a.AssessmentFamily [AssessmentFamilyShortName]
				   ,NULL [AssessmentAdministrationStartDate]
				   ,NULL [AssessmentAdministrationFinishDate]
				   ,aperformance.CodeValue [AssessmentPerformanceLevelIdentifier] -- example L1, L2, L3, L4
				   ,aperformance.Description [AssessmentPerformanceLevelLabel] -- example Unsatisfactory, Proficient, Advanced, etc. which align with the AssessmentPerformanceLevelIdentifier
				   ,NULL [AssessmentId]
				   ,NULL [AssessmentAdministrationId]
				   ,NULL [AssessmentSubtestId]
				   ,NULL [AssessmentFormId]
				   ,NULL [AssessmentPerformanceLevelId]
				   ,NULL [RunDateTime]
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment] a
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] asubject 
			ON a.AcademicSubjectDescriptorId = asubject.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] atype 
			ON a.AssessmentCategoryDescriptorId = atype.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[AssessmentPerformanceLevel] apl
			ON a.AssessmentTitle = apl.AssessmentTitle
			AND a.AcademicSubjectDescriptorId = apl.AcademicSubjectDescriptorId
			AND a.AssessedGradeLevelDescriptorId = apl.AssessedGradeLevelDescriptorId
			AND a.AssessmentVersion = apl.AssessmentVersion
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aperformance
			ON apl.PerformanceLevelDescriptorId = aperformance.DescriptorId
		WHERE atype.CodeValue NOT IN ('Benchmark test', 'Advanced Placement', 'College Entrance Exam', 'Language proficiency test')

		--Update AssessmentAdministrationStartDate and AssessmentAdministrationEndDate by joining to edfi.StudentAssessment

		UPDATE Staging.Assessment
		SET AssessmentAdministrationStartDate = ap.BeginDate, AssessmentAdministrationFinishDate = ap.EndDate
		FROM Staging.Assessment stage
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment] a
			ON stage.AssessmentTitle = a.AssessmentTitle
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[AssessmentPeriod] ap
			ON a.AssessmentIdentifier = ap.AssessmentIdentifier 

		
		--Ed-Fi does not have a specific value to indicate a regular assessment with accommodations separate from the student receiving accommodations
		--This extra insert will replicate each regular assessment without accommodations to have an identical one with accommodations.

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
				   ,[AssessmentPerformanceLevelLabel]
				   ,[AssessmentId]
				   ,[AssessmentAdministrationId]
				   ,[AssessmentSubtestId]
				   ,[AssessmentFormId]
				   ,[AssessmentPerformanceLevelId]
				   ,[RunDateTime]
				   )
		SELECT DISTINCT
				    [AssessmentTitle]
				   ,[AssessmentShortName]
				   ,[AssessmentAcademicSubject]
				   ,[AssessmentPurpose]
				   ,[AssessmentType]
				   ,'REGASSWACC' [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,[AssessmentFamilyTitle]
				   ,[AssessmentFamilyShortName]
				   ,[AssessmentAdministrationStartDate]
				   ,[AssessmentAdministrationFinishDate]
				   ,[AssessmentPerformanceLevelIdentifier]
				   ,[AssessmentPerformanceLevelLabel]
				   ,[AssessmentId]
				   ,[AssessmentAdministrationId]
				   ,[AssessmentSubtestId]
				   ,[AssessmentFormId]
				   ,[AssessmentPerformanceLevelId]
				   ,NULL [RunDateTime]
		FROM Staging.Assessment


		-----------------------------------------------------------------------------------------------------------------------
		----Data about the Students who participated or did not participate in the assessment and their performance levels ----
		-----------------------------------------------------------------------------------------------------------------------


		INSERT INTO [Staging].[AssessmentResult]
				   ([Student_Identifier_State]
				   ,[School_Identifier_State]
				   ,[LEA_Identifier_State]
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
				    s.StudentUniqueId [Student_Identifier_State]
				   ,REPLACE(edorgcode.IdentificationCode, ' ', '') [School_Identifier_State]
				   ,edorglea.EducationOrganizationId LEA_Identifier_State
				   ,a.AssessmentTitle [AssessmentTitle] -- should match exactly with the assessment title above
				   ,asubject.CodeValue [AssessmentAcademicSubject]
				   ,atype.CodeValue [AssessmentPurpose]
				   ,atype.CodeValue [AssessmentType]
				   ,atype.CodeValue [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,ap.BeginDate [AssessmentAdministrationStartDate]
				   ,ap.EndDate [AssessmentAdministrationFinishDate]
				   ,CASE ISNULL(rntt.CodeValue, '99')			-- need clarification
						WHEN '99' THEN '1'
						ELSE 0 END [AssessmentRegistrationParticipationIndicator]
				   ,agradelevel.CodeValue [GradeLevelWhenAssessed]
				   ,NULL											[StateFullAcademicYear]
				   ,NULL											[LEAFullAcademicYear]
				   ,NULL											[SchoolFullAcademicYear]
				   ,rntt.CodeValue [AssessmentRegistrationReasonNotCompleting]
				   ,aperformance.CodeValue [AssessmentPerformanceLevelIdentifier] -- this is what the student scored as it relates to performance level/proficiency - should match with what was put into the Assessment table above
				   ,aperformance.Description [AssessmentPerformanceLevelLabel] -- this is what the student scored as it relates to performance level/proficiency - should match with what was put into the Assessment table above
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
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment] a
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] asubject 
			ON a.AcademicSubjectDescriptorId = asubject.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] atype 
			ON a.AssessmentCategoryDescriptorId = atype.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] sa 
			ON a.AssessmentTitle = sa.AssessmentTitle
			AND a.AcademicSubjectDescriptorId = sa.AcademicSubjectDescriptorId
			AND a.AssessedGradeLevelDescriptorId = sa.AssessedGradeLevelDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[AssessmentPeriod] ap
			ON a.AssessmentIdentifier = ap.AssessmentIdentifier 
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessmentPerformanceLevel] sapl
			ON sa.AssessmentTitle = sapl.AssessmentTitle
			AND sa.StudentUSI = sapl.StudentUSI
			AND sa.AcademicSubjectDescriptorId = sapl.AcademicSubjectDescriptorId
			AND sa.AdministrationDate = sapl.AdministrationDate
			AND sa.AssessedGradeLevelDescriptorId = sapl.AssessedGradeLevelDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aperformance 
			ON sapl.PerformanceLevelDescriptorId = aperformance.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] agradelevel
			ON sapl.AssessedGradeLevelDescriptorId = agradelevel.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Student] s 
			ON sa.StudentUSI = s.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa 
			ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganization] edorg 
			ON ssa.SchoolId = edorg.EducationOrganizationId
		join [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcode on edorgcode.EducationOrganizationId=edorg.EducationOrganizationId
		join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d on d.DescriptorId=edorgcode.EducationOrganizationIdentificationSystemDescriptorId
			
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] sch 
			ON edorg.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId

		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor rntt 
			ON sa.ReasonNotTestedDescriptorId = rntt.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessmentAccommodation] saa
			ON sa.StudentUSI = saa.StudentUSI
			AND sa.AssessmentTitle = saa.AssessmentTitle
			AND sa.AcademicSubjectDescriptorId = saa.AcademicSubjectDescriptorId
			AND sa.AssessedGradeLevelDescriptorId = saa.AssessedGradeLevelDescriptorId
			AND sa.AdministrationDate = saa.AdministrationDate
			AND sa.AssessmentVersion = saa.AssessmentVersion
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aaccom
			ON saa.AccommodationDescriptorId = aaccom.DescriptorId
		WHERE ssa.EntryDate <= sa.AdministrationDate
		AND (ssa.ExitWithdrawDate IS NULL OR ssa.ExitWithdrawDate >= sa.AdministrationDate)
		AND atype.CodeValue NOT IN ('Benchmark test', 'Advanced Placement', 'College Entrance Exam')
		and d.CodeValue = 'SEA'



		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Assessment SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Assessment) > 0
		UPDATE Staging.AssessmentResult SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.AssessmentResult) > 0

		----Validate Staging.Assessment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP15_Assessment', 'Assessment', @SchoolYear
		
		----Validate Staging.AssessmentResult----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP15_Assessment', 'AssessmentResult', @SchoolYear



			set nocount off;



END





