-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE generate
GO

----------------------------------------------------
----Remove ETL Steps from App.DataMigrationTasks----
----------------------------------------------------

DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_%'


---------------------------------------
----Create DataMigrationTasks----------
---------------------------------------


INSERT INTO [App].[DataMigrationTasks]
           ([DataMigrationTypeId]
           ,[IsActive]
           ,[RunAfterGenerateMigration]
           ,[RunBeforeGenerateMigration]
           ,[StoredProcedureName]
           ,[TaskSequence])
VALUES
('1', '1', '0', '1', '[App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]', '1')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization]', '2')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd]', '3')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_CharterSchoolManagementOrganization]', '4')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_A_CharterSchoolManagementOrganization_MetaEd]', '5')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person]', '6')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace]', '7')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus]', '8')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_PersonStatus_MetaEd]', '9')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Enrollment]', '10')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationSpecialEducation]', '11')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Migrant]', '12')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_A_Migrant_MetaEd]', '13')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_ProgramParticipationTitleI]', '14')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_ProgramParticipationCte]', '15')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_A_ProgramParticipationCte_MetaEd]', '16')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_ProgramParticipationNorD]', '17')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_A_ProgramParticipationNorD_MetaEd]', '18')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP12_ProgramParticipationTitleIII]', '19')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_Discipline]', '20')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_A_Discipline_MetaEd]', '21')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_StudentCourse]', '22')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_Assessment]', '23')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_A_Assessment_MetaEd]', '24')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_StaffAssignment]', '25')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_A_StaffAssignment_MetaEd]', '26')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP17_StateDefinedCustomIndicator]', '27')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode]', '28')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_CharterSchoolManagementOrganization_EncapsulatedCode]', '29')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Person_EncapsulatedCode]', '30')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_PersonRace_EncapsulatedCode]', '31')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_PersonStatus_EncapsulatedCode]', '32')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Enrollment_EncapsulatedCode]', '33')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationSpecialEducation_EncapsulatedCode]', '34')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Migrant_EncapsulatedCode]', '35')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_ProgramParticipationTitleI_EncapsulatedCode]', '36')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_ProgramParticipationCte_EncapsulatedCode]', '37')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_ProgramParticipationNorD_EncapsulatedCode]', '38')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP12_ProgramParticipationTitleIII_EncapsulatedCode]', '39')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_Discipline_EncapsulatedCode]', '40')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_StudentCourse_EncapsulatedCode]', '41')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_Assessment_EncapsulatedCode]', '42')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_StaffAssignment_EncapsulatedCode]', '43')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP17_StateDefinedCustomIndicator_EncapsulatedCode]', '44')
