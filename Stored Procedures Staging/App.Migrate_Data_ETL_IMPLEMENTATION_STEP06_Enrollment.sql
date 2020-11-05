-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Enrollment]    Script Date: 6/1/2018 11:58:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Enrollment') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Enrollment]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Enrollment] 
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
	/*
		[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Enrollment]  2018
	*/


		TRUNCATE TABLE Staging.Enrollment

		INSERT INTO Staging.Enrollment (
			 Student_Identifier_State
			,LEA_Identifier_State
			,School_Identifier_State
			,EnrollmentEntryDate
			,EnrollmentExitDate
			,ExitOrWithdrawalType
			,GradeLevel
			,CohortYear
			,CohortGraduationYear
			,CohortDescription
			,HighSchoolDiplomaType
			,PersonID
			,OrganizationID_School
			,OrganizationPersonRoleId_School
			,RunDateTime
			,SchoolYear
			,NumberOfSchoolDays
			,NumberOfDaysAbsent
			,AttendanceRate
			,PostSecondaryEnrollment
			,DiplomaOrCredentialAwardDate
			,FoodServiceEligibility
			)
		SELECT DISTINCT
			 REPLACE(s.StudentUniqueId, ' ', '')									Student_Identifier_State
			,lea.LocalEducationAgencyId												LEA_Identifier_State
			,edorg.EducationOrganizationId											School_Identifier_State	
			,ssa.EntryDate															EnrollmentEntryDate
			,ssa.ExitWithdrawDate													EnrollmentExitDate
			,etd.CodeValue															ExitOrWithdrawalType
			,d.CodeValue															GradeLevel
			,NULL																	ClassOfSchoolYear
			,NULL																	GraduationSchoolYear
			,NULL																	CohortDescription
			,diptyD.CodeValue														[HighSchoolDiplomaType]
			,NULL																	PersonID
			,NULL																	OrganizationID_School
			,NULL																	OrganizationPersonRoleId_School
			,NULL																	RunDateTime
			,@SchoolYear															SchoolYear
			,NULL																	NumberOfDaysInAttendance
			,NULL																	NumberOfDaysAbsent
			,NULL																	AttendanceRate
			,NULL																	PostSecondaryEnrollment
			,sard.DiplomaAwardDate													DiplomaOrCredentialAwardDate
			,NULL																	FoodServiceEligibility
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency LEA ON sch.LocalEducationAgencyId = LEA.LocalEducationAgencyId
		--v3.0
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] seaCode 
			ON seaCode.EducationOrganizationId = edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] seaD 
			ON seaD.DescriptorId = seaCode.EducationOrganizationIdentificationSystemDescriptorId and seaD.CodeValue = 'SEA'

		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor etd 
			ON ssa.ExitWithdrawTypeDescriptorId = etd.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
			ON ssa.EntryGradeLevelDescriptorId = d.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentAcademicRecordDiploma sard 
			ON s.StudentUSI = sard.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] diptyD 
			ON diptyD.DescriptorId = sard.DiplomaTypeDescriptorId
		-- food service
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolFoodServiceProgramAssociation ssfood 
			ON s.StudentUSI = ssfood.StudentUSI

		WHERE ssa.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
			AND (ssa.EntryDate IS NULL OR ssa.EntryDate <= App.GetFiscalYearEndDate(@SchoolYear))

		--------------------------------------------------------
		-- Update FoodServiceEligibility
		--------------------------------------------------------
		UPDATE en
		SET en.FoodServiceEligibility = d.CodeValue
		FROM Staging.Enrollment en
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s ON s.StudentUniqueId = en.Student_Identifier_State
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolFoodServiceProgramAssociation ssfood 
			ON s.StudentUSI = ssfood.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService ssfoodsrv
			ON ssfoodsrv.StudentUSI = ssfood.StudentUSI 
			AND ssfoodsrv.BeginDate = ssfood.BeginDate
			AND ssfoodsrv.EducationOrganizationId = ssfood.EducationOrganizationId
			AND ssfoodsrv.ProgramEducationOrganizationId = ssfood.ProgramEducationOrganizationId
			AND ssfoodsrv.ProgramName = ssfood.ProgramName
			AND ssfoodsrv.ProgramTypeDescriptorId = ssfood.ProgramTypeDescriptorId
		INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d 
			ON d.DescriptorId = ssfoodsrv.SchoolFoodServiceProgramServiceDescriptorId

		--------------------------------------------------------
		-- Update Attendance & Absent Days
		--------------------------------------------------------
		UPDATE en
		SET [NumberOfDaysAbsent] = AbsentDays
		FROM Staging.Enrollment en 
		INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s ON s.StudentUniqueId = en.Student_Identifier_State
		INNER JOIN (
			SELECT SchoolId, SchoolYear, StudentUSI, SUM(AbsentDays) AbsentDays
			FROM (
				SELECT SchoolId, SchoolYear, StudentUSI, EventDate 
				, CASE
					WHEN SUM([EventDuration]) >= 0.5 THEN 1
					ELSE 0
				END AbsentDays
				FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAttendanceEvent] stSchAtt 
				INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d ON d.DescriptorId = stSchAtt.AttendanceEventCategoryDescriptorId
				WHERE d.CodeValue <> 'In Attendance'
					GROUP BY SchoolId, SchoolYear, StudentUSI, EventDate
				) d --Check if absent for a day
			GROUP BY SchoolId, SchoolYear, StudentUSI -- Sum up the absent days for the entire school year
		) abDays ON abDays.SchoolId = en.School_Identifier_State AND abDays.SchoolYear = @SchoolYear AND abDays.StudentUSI = s.StudentUSI

		--------------------------------------------------------
		-- Update School Days
		--------------------------------------------------------
		UPDATE en
		SET NumberOfSchoolDays = calDays.schoolDays
		FROM Staging.Enrollment en 
		INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s ON s.StudentUniqueId = en.Student_Identifier_State
		INNER JOIN (
		  SELECT DISTINCT schoolid, SchoolYear, COUNT(Date) schoolDays
		  FROM  [EdFi_Sample_ODS_Data_For_Generate].[edfi].[CalendarDateCalendarEvent] calEvent
		  INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d ON d.DescriptorId = calEvent.CalendarEventDescriptorId 
		  WHERE  calEvent.[SchoolYear] = @SchoolYear
		  and (d.CodeValue = 'Instructional day' OR d.CodeValue = 'Make-up day' OR d.CodeValue = 'Student late arrival/early dismissal')
		  group by schoolid, SchoolYear
		) calDays ON calDays.SchoolId = en.School_Identifier_State AND calDays.SchoolYear = en.SchoolYear

		--------------------------------------------------------
		-- Update Attendance Rate
		--------------------------------------------------------
		Update en
		SET AttendanceRate = 1 - CAST(NumberOfDaysAbsent/NumberOfSchoolDays AS decimal(5,4))
		FROM Staging.Enrollment en 
		where NumberOfDaysAbsent IS NOT NULL 
			AND (NumberOfSchoolDays IS NOT NULL AND NumberOfSchoolDays <> 0)

		--------------------------------------------------------
		-- Update Post Secondary Enrollment
		--------------------------------------------------------
		Update en
		SET PostSecondaryEnrollment = 
			CASE 
				WHEN pseCatD.CodeValue = 'College Enrollment' THEN 1
				ELSE 0
			END
		FROM Staging.Enrollment en 
		INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s 
			ON s.StudentUniqueId = en.Student_Identifier_State
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].PostSecondaryEvent pse
			ON pse.[StudentUSI] = s.[StudentUSI]
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pseCatD 
			ON pseCatD.DescriptorID = pse.PostSecondaryEventCategoryDescriptorId
		WHERE  Namespace = 'uri://ed-fi.org/PostSecondaryEventCategoryDescriptor'

		--------------------------------------------------------
		-- Update Cohort
		--------------------------------------------------------
		UPDATE en
		SET  CohortYear = YEAR(ssa.EntryDate)
			,CohortGraduationYear = ssa.GraduationSchoolYear
			,CohortDescription = 
				 CASE 
					WHEN stch.EndDate IS NOT NULL THEN 'Alternate Diploma - Removed' --Removed from the cohort
					ELSE diptyD.CodeValue
				 END 
		FROM Staging.Enrollment en 
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s ON s.StudentUniqueId = en.Student_Identifier_State
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentAcademicRecordDiploma sard ON s.StudentUSI = sard.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] diptyD on diptyD.DescriptorId = sard.DiplomaTypeDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCohortAssociation] stch 
			ON stch.StudentUSI = ssa.StudentUSI AND stch.EducationOrganizationId = ssa.EducationOrganizationId
				AND ssa.EntryDate = stch.BeginDate
		WHERE  ssa.EntryDate IS NOT NULL
		AND ssa.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
		AND ssa.EntryDate <= App.GetFiscalYearEndDate(@SchoolYear)
		AND (ssa.GraduationSchoolYear IS NOT NULL AND YEAR(ssa.EntryDate) < ssa.GraduationSchoolYear)
		--AND sard.DiplomaTypeDescriptorId is not null

		--Create End of Year Enrollment Record For End of Year Reporting with the last known grade level--
		--Pull the max grade level if there is a record conflict
		--INSERT INTO Staging.Enrollment
		--	(Student_Identifier_State
		--	,School_Identifier_State
		--	,EnrollmentEntryDate
		--	,EnrollmentExitDate
		--	,ExitWithdrawType
		--	,GradeLevel
		--	,CohortYear
		--	,CohortGraduationYear
		--	,HighSchoolDiplomaType
		--	,PersonID
		--	,OrganizationID_School
		--	,OrganizationPersonRoleId_School
		--	,RunDateTime
		--	)
		--SELECT DISTINCT
		--	REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
		--	,edorg.StateOrganizationId School_Identifier_State	
		--	,App.GetFiscalYearEndDate(@SchoolYear) EnrollmentEntryDate
		--	,App.GetFiscalYearEndDate(@SchoolYear) EnrollmentExitDate
		--	,ewt.CodeValue ExitWithdrawType
		--	,MAX(d.CodeValue) GradeLevel
		--	,ssa.ClassOfSchoolYear
		--	,ssa.GraduationSchoolYear
		--	,dt.CodeValue [HighSchoolDiplomaType]
		--	,NULL PersonID
		--	,NULL OrganizationID_School
		--	,NULL OrganizationPersonRoleId_School
		--	,NULL RunDateTime
		--FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].ExitWithdrawTypeDescriptor ewtd ON ssa.ExitWithdrawTypeDescriptorId = ewtd.ExitWithdrawTypeDescriptorId
		--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].ExitWithdrawType ewt ON ewtd.ExitWithdrawTypeId = ewt.ExitWithdrawTypeId
		--JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d ON ssa.EntryGradeLevelDescriptorId = d.DescriptorId
		--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentAcademicRecordDiploma sard ON s.StudentUSI = sard.StudentUSI
		--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DiplomaType dt ON sard.DiplomaTypeID = dt.DiplomaTypeId
		--WHERE ssa.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
		--AND (ssa.EntryDate IS NULL OR ssa.EntryDate <= App.GetFiscalYearEndDate(@SchoolYear))
		--GROUP BY s.StudentUniqueId
		--	,edorg.StateOrganizationId 
		--	,ewt.CodeValue 
		--	,ssa.ClassOfSchoolYear
		--	,ssa.GraduationSchoolYear
		--	,dt.CodeValue
		--	,ssa.EntryDate
		--HAVING ssa.EntryDate = MAX(ssa.EntryDate)

	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Enrollment SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Enrollment) > 0

		----Validate Staging.Enrollment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Enrollment', 'Enrollment', @SchoolYear

	END
