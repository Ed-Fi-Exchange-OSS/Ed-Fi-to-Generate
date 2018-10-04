--------------------------------------------
----Drop MetaEd Extension ------------------
--------------------------------------------

USE EdFi_Sample_ODS_Data_For_Generate
GO


EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'BehaviorTypeDescriptor') BEGIN
	DROP TABLE [extension].[BehaviorTypeDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'CedsLocalEducationAgency') BEGIN
	DROP TABLE [extension].[CedsLocalEducationAgency]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'CedsSchool') BEGIN
	DROP TABLE [extension].[CedsSchool]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'CEDSStudentMigrantEducationProgramAssociation') BEGIN
	DROP TABLE [extension].[CEDSStudentMigrantEducationProgramAssociation]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'DisciplineTypeDescriptor') BEGIN
	DROP TABLE [extension].[DisciplineTypeDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'EducationOrganizationFederalFunding') BEGIN
	DROP TABLE [extension].[EducationOrganizationFederalFunding]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'LocalEducationAgencyTypeDescriptor') BEGIN
	DROP TABLE [extension].[LocalEducationAgencyTypeDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'MigrantEducationProgramEnrollmentTypeDescriptor') BEGIN
	DROP TABLE [extension].[MigrantEducationProgramEnrollmentTypeDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'MigrantEducationProgramServicesTypeDescriptor') BEGIN
	DROP TABLE [extension].[MigrantEducationProgramServicesTypeDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'StudentExtension') BEGIN
	DROP TABLE [extension].[StudentExtension]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor') BEGIN
	DROP TABLE [extension].[NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'NationalSchoolLunchProgramStatusDescriptor') BEGIN
	DROP TABLE [extension].[NationalSchoolLunchProgramStatusDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'ReconstitutedStatusDescriptor') BEGIN
	DROP TABLE [extension].[ReconstitutedStatusDescriptor]

END
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'SharedTimeIndicatorDescriptor') BEGIN
	DROP TABLE [extension].[SharedTimeIndicatorDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'StaffEducationOrganizationAssignmentAssociationExtension') BEGIN
	DROP TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'SpecialEducationAgeGroupTaughtDescriptor') BEGIN
	DROP TABLE [extension].[SpecialEducationAgeGroupTaughtDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'SpecialEducationSupportServicesCategoryDescriptor') BEGIN
	DROP TABLE [extension].[SpecialEducationSupportServicesCategoryDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'TitleIProgramStaffCategoryDescriptor') BEGIN
	DROP TABLE [extension].[TitleIProgramStaffCategoryDescriptor]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'extension' AND TABLE_NAME = 'VirtualSchoolStatusDescriptor') BEGIN
	DROP TABLE [extension].[VirtualSchoolStatusDescriptor]
END

GO

EXEC sp_MSforeachtable @command1="print '?'", @command2="ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"
