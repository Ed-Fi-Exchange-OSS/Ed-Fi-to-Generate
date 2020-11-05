-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use generate
DECLARE @SchoolYear INT
SET @SchoolYear = 2018

-- Required to run everytime
EXEC [App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS] @SchoolYear


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode] 2018
-- End of the required to run

-- Only for the Special Education
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode] 2018

-- Only for the Migrant
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant] @SchoolYear

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode]

-- Only for the Title I
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI] @SchoolYear

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode] @SchoolYear

-- Only for Discipline
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline] @SchoolYear

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_A_Discipline_MetaEd] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode] @SchoolYear


-- Only for the Staff
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment] @SchoolYear

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode] @SchoolYear

-- Required to run everytime since some file specs require the assessment 
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode] 2018

-- Required to run everytime
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode] 2018

-- Required to run everytime
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP12_PersonRace] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP12_PersonRace_EncapsulatedCode] 2018

-- Only for the Charter School
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_CharterSchoolManagementOrganization] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_A_CharterSchoolManagementOrganization_MetaEd] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_CharterSchoolManagementOrganization_EncapsulatedCode] 2018

-- Only for the CTE
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_ProgramParticipationCTE] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_A_ProgramParticipationCTE_MetaEd] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_ProgramParticipationCTE_EncapsulatedCode] @SchoolYear

-- Only for the Title III
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_ProgramParticipationTitleIII] @SchoolYear

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_ProgramParticipationTitleIII_EncapsulatedCode] @SchoolYear

-- Only for the NoD
EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_ProgramParticipationNoD] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_A_ProgramParticipationNoD_MetaEd] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_ProgramParticipationNoD_EncapsulatedCode] 2018

-- I don't use the StudentCourse
--EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP17_StudentCourse] @SchoolYear

--EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP17_StudentCourse_EncapsulatedCode] @SchoolYear

