USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Organization') BEGIN
	DROP TABLE [Staging].[Organization]
END

GO

CREATE TABLE Staging.Organization (
	  Id INT IDENTITY(1, 1) Primary Key
	, LEA_Identifier_State VARCHAR(100)
	, LEA_Identifier_NCES VARCHAR(100)
	, LEA_SupervisoryUnionIdentificationNumber VARCHAR(100)
	, LEA_Name VARCHAR(100)
	, LEA_WebSiteAddress VARCHAR(300)
	, LEA_OperationalStatus VARCHAR(100)
	, LEA_OperationalStatusEffectiveDate VARCHAR(100)
	, LEA_CharterSchoolIndicator VARCHAR(100)
	, LEA_Type VARCHAR(100)
	, School_Identifier_State VARCHAR(100)
	, School_Identifier_NCES VARCHAR(100)
	, School_Name VARCHAR(100)
	, School_WebSiteAddress VARCHAR(300)
	, School_OperationalStatus VARCHAR(100)
	, School_OperationalStatusEffectiveDate VARCHAR(100)
	, School_Type VARCHAR(100)
	, School_MagnetOrSpecialProgramEmphasisSchool VARCHAR(100)
	, School_SharedTimeIndicator VARCHAR(100)
	, School_VirtualSchoolStatus VARCHAR(100)
	, School_NationalSchoolLunchProgramStatus VARCHAR(100)
	, School_ReconstitutedStatus VARCHAR(100)
	, School_CharterSchoolApprovalAgencyType VARCHAR(100)
	, School_CharterSchoolIndicator VARCHAR(100)
	, SchoolYear VARCHAR(100)
	-- The fields below are populated and used by the ETL scripts.  
	, LEAOrganizationId INT
	, SchoolOrganizationId INT
	, SEAOrganizationId INT
	, SpecialEducationProgramOrganizationId INT
	, TitleIProgramOrganizationId INT
	, MigrantProgramOrganizationId INT
	, FosterProgramOrganizationId INT
	, NewLEA BIT
	, NewSchool BIT
	, NewSpecialEducationProgram BIT
	, NewTitleIProgram BIT
	, NewMigrantProgram BIT
	, NewFosterProgram BIT
	, LEA_Identifier_State_ChangedIdentifier BIT
	, LEA_Identifier_State_Identifier_Old VARCHAR(100)
	, School_Identifier_State_ChangedIdentifier BIT
	, School_Identifier_State_Identifier_Old VARCHAR(100)
	, SEAToLEA_OrganizationRelationshipId INT
	, LEAToSchool_OrganizationRelationshipId INT
	, SchoolToSpecialEducationProgram_OrganizationRelationshipId INT
	, SchoolToTitleIProgram_OrganizationRelationshipId INT
	, SchoolToMigrantProgram_OrganizationRelationshipId INT
	, SchoolToFosterProgram_OrganizationRelationshipId INT
	, LEA_OrganizationWebsiteId INT
	, School_OrganizationWebsiteId INT
	, RunDateTime DATETIME
	);

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_Identifier_NCES' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_SupervisoryUnionIdentificationNumber' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_Name' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_WebSiteAddress' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_OperationalStatus' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefOperationalStatus', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_OperationalStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_OperationalStatusEffectiveDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_CharterSchoolIndicator' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_Type' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefLeaType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'LEA_Type' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_Identifier_NCES' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_Name' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_WebSiteAddress' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_OperationalStatus' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefOperationalStatus', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_OperationalStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_OperationalStatusEffectiveDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_Type' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefSchoolType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_Type' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_MagnetOrSpecialProgramEmphasisSchool' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_SharedTimeIndicator' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_VirtualSchoolStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_NationalSchoolLunchProgramStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_ReconstitutedStatus' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefReconstitutedStatus', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_ReconstitutedStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_CharterSchoolApprovalAgencyType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefCharterSchoolApprovalAgencyType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_CharterSchoolApprovalAgencyType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'School_CharterSchoolIndicator' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Organization', @level2type = N'Column', @level2name = 'SchoolYear' 
