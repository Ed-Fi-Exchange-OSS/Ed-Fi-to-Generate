------------------------------------------------
----Uninstall the Ed-Fi to Generate Plug In-----
------------------------------------------------

USE [generate]
GO

----Drop Functions--

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRoleId') BEGIN
	DROP FUNCTION [App].[GetRoleId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefStateId') BEGIN
	DROP FUNCTION [App].[GetRefStateId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefStateAnsiCode') BEGIN
	DROP FUNCTION [App].[GetRefStateAnsiCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefPersonalInformationVerificationId') BEGIN
	DROP FUNCTION [App].[GetRefPersonalInformationVerificationId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefInstitutionTelephoneType') BEGIN
	DROP FUNCTION [App].[GetRefInstitutionTelephoneType]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefIDEAEducationalEnvironmentSchoolAgeId') BEGIN
	DROP FUNCTION [App].[GetRefIDEAEducationalEnvironmentSchoolAgeId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefIDEAEducationalEnvironmentECId') BEGIN
	DROP FUNCTION [App].[GetRefIDEAEducationalEnvironmentECId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetProgramTypeId') BEGIN
	DROP FUNCTION [App].[GetProgramTypeId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetPersonIdentifierTypeId') BEGIN
	DROP FUNCTION [App].[GetPersonIdentifierTypeId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetPersonIdentifierSystemId') BEGIN
	DROP FUNCTION [App].[GetPersonIdentifierSystemId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefPersonIdentificationSystemId') BEGIN
	DROP FUNCTION [App].[GetRefPersonIdentificationSystemId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetOrganizationTypeId') BEGIN
	DROP FUNCTION [App].[GetOrganizationTypeId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetOrganizationIdentifierTypeId') BEGIN
	DROP FUNCTION [App].[GetOrganizationIdentifierTypeId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetOrganizationIdentifierSystemId') BEGIN
	DROP FUNCTION [App].[GetOrganizationIdentifierSystemId]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetFiscalYearStartDate') BEGIN
	DROP FUNCTION [App].[GetFiscalYearStartDate]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetFiscalYearEndDate') BEGIN
	DROP FUNCTION [App].[GetFiscalYearEndDate]
END


----Drop Staging tables

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ValidationErrors') BEGIN
	DROP TABLE [Staging].[ValidationErrors]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'StateDetail') BEGIN
	DROP TABLE [Staging].[StateDetail]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'StaffAssignment') BEGIN
	DROP TABLE [Staging].[StaffAssignment]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ProgramParticipationTitleI') BEGIN
	DROP TABLE [Staging].[ProgramParticipationTitleI]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ProgramParticipationSpecialEducation') BEGIN
	DROP TABLE [Staging].[ProgramParticipationSpecialEducation]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'PrimaryDisability') BEGIN
	DROP TABLE [Staging].[PrimaryDisability]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'PersonStatus') BEGIN
	DROP TABLE [Staging].[PersonStatus]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Person') BEGIN
	DROP TABLE [Staging].[Person]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationPhone') BEGIN
	DROP TABLE [Staging].[OrganizationPhone]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationGradeOffered') BEGIN
	DROP TABLE [Staging].[OrganizationGradeOffered]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationFederalFunding') BEGIN
	DROP TABLE [Staging].[OrganizationFederalFunding]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationAddress') BEGIN
	DROP TABLE [Staging].[OrganizationAddress]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Organization') BEGIN
	DROP TABLE [Staging].[Organization]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Migrant') BEGIN
	DROP TABLE [Staging].[Migrant]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'MembershipRace') BEGIN
	DROP TABLE [Staging].[MembershipRace]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'MembershipChildCount') BEGIN
	DROP TABLE [Staging].[MembershipChildCount]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Enrollment') BEGIN
	DROP TABLE [Staging].[Enrollment]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Discipline') BEGIN
	DROP TABLE [Staging].[Discipline]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'AssessmentResult') BEGIN
	DROP TABLE [Staging].[AssessmentResult]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Assessment') BEGIN
	DROP TABLE [Staging].[Assessment]
END


DROP SCHEMA Staging;



----DROP SourceSystemReferenceData table--

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ODS' AND TABLE_NAME = 'SourceSystemReferenceData') BEGIN
	DROP TABLE [ODS].[SourceSystemReferenceData]
END


----Drop the Stored Procedures --

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_Validation') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_Validation]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode]
END

----Delete Stored Procedures from the App.DataMigrationTask list

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