USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment]    Script Date: 6/1/2018 11:58:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP14_StudentCourse') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_StudentCourse]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_StudentCourse] 
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

	-------------------------------------Begin State Specific Information Section----------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
	----created to work with the data standardized in this location. Do not make any changes to table names or column----
	----names or to any of the code after this section.  The only information that should be modified is the source  ----
	----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	--
	--	 EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_StudentCourse] @SchoolYear=2018;
	--

		TRUNCATE TABLE Staging.StudentCourse


		INSERT INTO Staging.StudentCourse (
			 Student_Identifier_State
			,LEA_Identifier_State
			,School_Identifier_State
			,SchoolYear
			,CourseCode
			,CourseGradeLevel
			,PersonID
			,OrganizationID_LEA
			,OrganizationPersonRoleId_LEA
			,OrganizationID_School
			,OrganizationPersonRoleId_School
			,OrganizationID_Course
			,OrganizationPersonRoleId_Course
			,RunDateTime
		)
		SELECT DISTINCT
			 REPLACE(s.StudentUniqueId, ' ', '')	Student_Identifier_State
			,lea_edorg.EducationOrganizationId		LEA_Identifier_State
			,edorg.EducationOrganizationId			School_Identifier_State	
			,@SchoolYear							SchoolYear
			,ct.CourseCode							CourseCode
			,coD.CodeValue							CourseGradeLevel
			,NULL									PersonID
			,NULL									OrganizationID_LEA
			,NULl									OrganizationPersonRoleId_LEA
			,NULL									OrganizationID_School
			,NULL									OrganizationPersonRoleId_School
			,NULL									OrganizationID_Course
			,NULL									OrganizationPersonRoleId_Course
			,NULL									RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		-- school identifier
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] seaCode 
			ON seaCode.EducationOrganizationId = edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] seaD 
			ON seaD.DescriptorId = seaCode.EducationOrganizationIdentificationSystemDescriptorId 
			and seaD.CodeValue = 'SEA'
		-- lea identifier
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization lea_edorg ON lea_edorg.EducationOrganizationId = lea.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] lea_seaCode 
			ON lea_seaCode.EducationOrganizationId = lea_edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] lea_seaD 
			ON lea_seaD.DescriptorId = lea_seaCode.EducationOrganizationIdentificationSystemDescriptorId 
			and lea_seaD.CodeValue = 'SEA'


		-- course specific data - pull courses specific to high school students and earned credits > 0
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[CourseTranscript] ct 
			ON ct.StudentUSI = s.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[CourseOfferedGradeLevel] co 
			ON co.CourseCode=ct.CourseCode
			AND co.EducationOrganizationId=ct.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] coD 
			ON coD.DescriptorId = co.GradeLevelDescriptorId

		WHERE ssa.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
		AND (ssa.EntryDate IS NULL OR ssa.EntryDate <= App.GetFiscalYearEndDate(@SchoolYear))
		-- include only high school courses
		AND (coD.CodeValue = 'Ninth grade' OR coD.CodeValue = 'Tenth grade' OR coD.CodeValue = 'Eleventh grade' OR coD.CodeValue = 'Twelfth grade')
		AND ct.EarnedCredits > 0
	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.StudentCourse SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.StudentCourse) > 0

		----Validate Staging.StudentCourse----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP14_StudentCourse', 'StudentCourse', @SchoolYear

	END
