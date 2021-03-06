﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment]    Script Date: 6/1/2018 11:58:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment]
	@SchoolYear SMALLINT
	AS
	BEGIN

		set nocount on;

		

	-------------------------------------Begin State Specific Information Section----------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
	----created to work with the data standardized in this location. Do not make any changes to table names or column----
	----names or to any of the code after this section.  The only information that should be modified is the source  ----
	----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------


		TRUNCATE TABLE Staging.Enrollment


		INSERT INTO Staging.Enrollment
			(Student_Identifier_State
			,School_Identifier_State
			,EnrollmentEntryDate
			,EnrollmentExitDate
			,ExitWithdrawType
			,GradeLevel
			,CohortYear
			,CohortGraduationYear
			,HighSchoolDiplomaType
			,PersonID
			,OrganizationID_School
			,OrganizationPersonRoleId_School
			,RunDateTime
			)
		SELECT DISTINCT
			 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
			,edorg.StateOrganizationId School_Identifier_State	
			,ssa.EntryDate EnrollmentEntryDate
			,ssa.ExitWithdrawDate EnrollmentExitDate
			,etd.CodeValue ExitWithdrawType
			,d.CodeValue GradeLevel
			,ssa.ClassOfSchoolYear
			,ssa.GraduationSchoolYear
			,dt.CodeValue [HighSchoolDiplomaType]
			,NULL PersonID
			,NULL OrganizationID_School
			,NULL OrganizationPersonRoleId_School
			,NULL RunDateTime
		FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].student s
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor etd ON ssa.ExitWithdrawTypeDescriptorId = etd.DescriptorId
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor d ON ssa.EntryGradeLevelDescriptorId = d.DescriptorId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentAcademicRecordDiploma sard ON s.StudentUSI = sard.StudentUSI
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].DiplomaType dt ON sard.DiplomaTypeID = dt.DiplomaTypeId
		WHERE ssa.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
		AND (ssa.EntryDate IS NULL OR ssa.EntryDate <= App.GetFiscalYearEndDate(@SchoolYear))
	
		--Create End of Year Enrollment Record For End of Year Reporting with the last known grade level--
		--Pull the max grade level if there is a record conflict
		INSERT INTO Staging.Enrollment
			(Student_Identifier_State
			,School_Identifier_State
			,EnrollmentEntryDate
			,EnrollmentExitDate
			,ExitWithdrawType
			,GradeLevel
			,CohortYear
			,CohortGraduationYear
			,HighSchoolDiplomaType
			,PersonID
			,OrganizationID_School
			,OrganizationPersonRoleId_School
			,RunDateTime
			)
		SELECT DISTINCT
			REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
			,edorg.StateOrganizationId School_Identifier_State	
			,App.GetFiscalYearEndDate(@SchoolYear) EnrollmentEntryDate
			,App.GetFiscalYearEndDate(@SchoolYear) EnrollmentExitDate
			,ewt.CodeValue ExitWithdrawType
			,MAX(d.CodeValue) GradeLevel
			,ssa.ClassOfSchoolYear
			,ssa.GraduationSchoolYear
			,dt.CodeValue [HighSchoolDiplomaType]
			,NULL PersonID
			,NULL OrganizationID_School
			,NULL OrganizationPersonRoleId_School
			,NULL RunDateTime
		FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].student s
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].ExitWithdrawTypeDescriptor ewtd ON ssa.ExitWithdrawTypeDescriptorId = ewtd.ExitWithdrawTypeDescriptorId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].ExitWithdrawType ewt ON ewtd.ExitWithdrawTypeId = ewt.ExitWithdrawTypeId
		JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor d ON ssa.EntryGradeLevelDescriptorId = d.DescriptorId
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentAcademicRecordDiploma sard ON s.StudentUSI = sard.StudentUSI
		LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].DiplomaType dt ON sard.DiplomaTypeID = dt.DiplomaTypeId
		WHERE ssa.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
		AND (ssa.EntryDate IS NULL OR ssa.EntryDate <= App.GetFiscalYearEndDate(@SchoolYear))
		GROUP BY s.StudentUniqueId
			,edorg.StateOrganizationId 
			,ewt.CodeValue 
			,ssa.ClassOfSchoolYear
			,ssa.GraduationSchoolYear
			,dt.CodeValue
			,ssa.EntryDate
		HAVING ssa.EntryDate = MAX(ssa.EntryDate)

	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Enrollment SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Enrollment) > 0

		----Validate Staging.Enrollment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment', 'Staging.Enrollment'

	END
