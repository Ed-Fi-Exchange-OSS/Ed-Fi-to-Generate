﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

------------------------------------------------
----Uninstall the Ed-Fi to Generate Plug In-----
------------------------------------------------

USE [generate]
GO


----Drop the Stored Procedures --

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd]
END



----Delete Stored Procedures from the App.DataMigrationTask list and recreate without the MetaEd Stored Procedures

----Remove ETL Steps from App.DataMigrationTasks----

DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus%'

DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCoded%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode%'

DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaE%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd%'


----Create DataMigrationTasks----------


INSERT INTO [App].[DataMigrationTasks]
           ([DataMigrationTypeId]
           ,[IsActive]
           ,[RunAfterGenerateMigration]
           ,[RunBeforeGenerateMigration]
           ,[StoredProcedureName]
           ,[TaskSequence])
VALUES
('1', '1', '0', '1', '[App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]', '1')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization] ''2018''', '2')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] ''2018''', '3')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person] ''2018''', '4')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode] ''2018''', '5')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment] ''2018''', '6')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode] ''2018''', '7')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation] ''2018''', '8')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode] ''2018''', '9')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount] ''2018''', '10')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode] ''2018''', '11')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant] ''2018''', '12')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode] ''2018''', '13')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI] ''2018''', '14')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode] ''2018''', '15')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline] ''2018''', '16')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode], ''2018''', '17')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment] ''2018''', '18')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode] ''2018''', '19')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments] ''2018''', '20')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode] ''2018''', '21')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus] ''2018''', '22')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode] ''2018''', '23')


