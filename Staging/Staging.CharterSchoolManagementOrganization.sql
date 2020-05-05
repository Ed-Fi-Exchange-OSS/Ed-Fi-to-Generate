USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'CharterSchoolManagementOrganization') BEGIN
	DROP TABLE [Staging].[CharterSchoolManagementOrganization]
END

GO

CREATE TABLE Staging.CharterSchoolManagementOrganization (
	  Id INT IDENTITY(1, 1) Primary Key
	, CharterSchoolManagementOrganization_Identifier_EIN VARCHAR(100)
	, CharterSchoolManagementOrganization_Name VARCHAR(100)
	, CharterSchoolManagementOrganization_Type VARCHAR(100)		--CMO, EMO, Other
	-- The fields below are populated and used by the ETL scripts.  
	, OrganizationIdentifier VARCHAR(100)
	, CharterSchoolManagementOrganizationId INT
	, CharterSchoolId INT
	, RunDateTime DATETIME
	);

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'CharterSchoolManagementOrganization', @level2type = N'Column', @level2name = 'CharterSchoolManagementOrganization_Identifier_EIN' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'CharterSchoolManagementOrganization', @level2type = N'Column', @level2name = 'CharterSchoolManagementOrganization_Name' 

