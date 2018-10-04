USE [generate]
GO

-------------------------------------------------------------------------------------------------
----Install the Fuctions
-------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRoleId') BEGIN
	DROP FUNCTION [App].[GetRoleId]
END

GO

CREATE FUNCTION App.GetRoleId (@RoleName VARCHAR(30))
RETURNS INT
AS BEGIN
	DECLARE @RoleId INT
	
          SELECT @RoleId = RoleID
          FROM ods.[Role]
          WHERE [Name] = @RoleName
		  
	RETURN (@RoleId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefStateId') BEGIN
	DROP FUNCTION [App].[GetRefStateId]
END

GO


CREATE FUNCTION App.GetRefStateId (@StateAbbreviation CHAR(2))
RETURNS INT
AS BEGIN
	DECLARE @RefStateId INT
	
	SELECT @RefStateId = RefStateId FROM ODS.RefState WHERE Code = @StateAbbreviation

	RETURN @RefStateId
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefStateAnsiCode') BEGIN
	DROP FUNCTION [App].[GetRefStateAnsiCode]
END

GO

CREATE FUNCTION App.GetRefStateAnsiCode (@StateName VARCHAR(30))
RETURNS CHAR(2)
AS BEGIN
	DECLARE @RefStateAnsiCode CHAR(2)
	
	SELECT @RefStateAnsiCode = Code FROM ODS.RefStateAnsiCode WHERE StateName = @StateName

	RETURN @RefStateAnsiCode 
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefPersonalInformationVerificationId') BEGIN
	DROP FUNCTION [App].[GetRefPersonalInformationVerificationId]
END

GO


CREATE FUNCTION App.GetRefPersonalInformationVerificationId (@PersonalInformationVerificationCode VARCHAR(20))
RETURNS INT
AS BEGIN
	DECLARE @PersonalInformationVerificationId INT
	
	SELECT @PersonalInformationVerificationId = r.RefPersonalInformationVerificationId 
	FROM ODS.RefPersonalInformationVerification r 
	WHERE Code = @PersonalInformationVerificationCode

	RETURN (@PersonalInformationVerificationId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefInstitutionTelephoneType') BEGIN
	DROP FUNCTION [App].[GetRefInstitutionTelephoneType]
END

GO


CREATE FUNCTION App.GetRefInstitutionTelephoneType (@TelephoneTypeCode CHAR(2))
RETURNS INT
AS BEGIN
	DECLARE @RefInstitutionTelephoneTypeId INT
	
	SELECT @RefInstitutionTelephoneTypeId = RefInstitutionTelephoneTypeId FROM ODS.RefInstitutionTelephoneType WHERE Code = @TelephoneTypeCode

	RETURN @RefInstitutionTelephoneTypeId
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefIDEAEducationalEnvironmentSchoolAgeId') BEGIN
	DROP FUNCTION [App].[GetRefIDEAEducationalEnvironmentSchoolAgeId]
END

GO


CREATE FUNCTION App.GetRefIDEAEducationalEnvironmentSchoolAgeId (@EducationalEnvironmentCode VARCHAR(50))
RETURNS INT
AS BEGIN
	DECLARE @EducationalEnvironmentId INT

	SELECT @EducationalEnvironmentId = RefIDESEducationalEnvironmentSchoolAge
    FROM [ODS].[RefIDEAEducationalEnvironmentSchoolAge]
	WHERE Code = @EducationalEnvironmentCode

	RETURN (@EducationalEnvironmentId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefIDEAEducationalEnvironmentECId') BEGIN
	DROP FUNCTION [App].[GetRefIDEAEducationalEnvironmentECId]
END

GO


CREATE FUNCTION App.GetRefIDEAEducationalEnvironmentECId (@EducationalEnvironmentCode VARCHAR(50))
RETURNS INT
AS BEGIN
	DECLARE @EducationalEnvironmentId INT

	SELECT @EducationalEnvironmentId = RefIDEAEducationalEnvironmentECId
    FROM [ODS].[RefIDEAEducationalEnvironmentEC]
	WHERE Code = @EducationalEnvironmentCode

	RETURN (@EducationalEnvironmentId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetProgramTypeId') BEGIN
	DROP FUNCTION [App].[GetProgramTypeId]
END

GO


CREATE FUNCTION App.GetProgramTypeId (@ProgramTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @ProgramTypeId INT
	
	SELECT @ProgramTypeId = rpt.RefProgramTypeId
	FROM ODS.RefProgramType rpt
	WHERE rpt.Code = @ProgramTypeCode

	RETURN (@ProgramTypeId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetPersonIdentifierTypeId') BEGIN
	DROP FUNCTION [App].[GetPersonIdentifierTypeId]
END

GO


CREATE FUNCTION App.GetPersonIdentifierTypeId (@PersonIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefPersonIdentifierTypeId INT
	
	SELECT @RefPersonIdentifierTypeId = rpit.RefPersonIdentifierTypeId
    FROM ODS.RefPersonIdentifierType rpit
    WHERE rpit.Code = @PersonIdentifierTypeCode -- 'State Agency Identification System'

	RETURN (@RefPersonIdentifierTypeId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetPersonIdentifierSystemId') BEGIN
	DROP FUNCTION [App].[GetPersonIdentifierSystemId]
END

GO


CREATE FUNCTION App.GetPersonIdentifierSystemId (@PersonIdentifierSystemCode VARCHAR(6), @PersonIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefPersonIdentifierSystemId INT
	
          SELECT @RefPersonIdentifierSystemId = rpis.RefPersonIdentificationSystemId
          FROM ODS.RefPersonIdentificationSystem rpis
		  JOIN ODS.RefPersonIdentifierType rpit	
			ON rpis.RefPersonIdentifierTypeId = rpit.RefPersonIdentifierTypeId
          WHERE rpis.Code = @PersonIdentifierSystemCode
			AND rpit.Code = @PersonIdentifierTypeCode

	RETURN (@RefPersonIdentifierSystemId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefPersonIdentificationSystemId') BEGIN
	DROP FUNCTION [App].[GetRefPersonIdentificationSystemId]
END

GO


CREATE FUNCTION App.GetRefPersonIdentificationSystemId (@PersonIdentificationSystemCode VARCHAR(20), @PersonIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @PersonIdentificationSystemId INT
	
	SELECT @PersonIdentificationSystemId = r.RefPersonIdentificationSystemId 
	FROM ODS.RefPersonIdentificationSystem r 
	JOIN ODS.RefPersonIdentifierType rpt 
		ON r.RefPersonIdentifierTypeId = rpt.RefPersonIdentifierTypeId 
	WHERE r.Code = @PersonIdentificationSystemCode 
		AND rpt.Code = @PersonIdentifierTypeCode

	RETURN (@PersonIdentificationSystemId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetOrganizationTypeId') BEGIN
	DROP FUNCTION [App].[GetOrganizationTypeId]
END

GO


CREATE FUNCTION App.GetOrganizationTypeId (@OrganizationTypeCode VARCHAR(10), @OrganizationElementTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationTypeId INT

	SELECT @RefOrganizationTypeId = rot.RefOrganizationTypeId
    FROM ODS.RefOrganizationType rot
    JOIN ODS.RefOrganizationElementType roet 
		ON rot.RefOrganizationElementTypeId = roet.RefOrganizationElementTypeId
	WHERE rot.Code = @OrganizationTypeCode
      AND roet.Code = @OrganizationElementTypeCode

	RETURN (@RefOrganizationTypeId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetOrganizationIdentifierTypeId') BEGIN
	DROP FUNCTION [App].[GetOrganizationIdentifierTypeId]
END

GO


CREATE FUNCTION App.GetOrganizationIdentifierTypeId (@OrganizationIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationIdentifierTypeId INT
	
	SELECT @RefOrganizationIdentifierTypeId = roit.RefOrganizationIdentifierTypeId
    FROM ODS.RefOrganizationIdentifierType roit
    WHERE roit.Code = @OrganizationIdentifierTypeCode -- 'State Agency Identification System'

	RETURN (@RefOrganizationIdentifierTypeId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetOrganizationIdentifierSystemId') BEGIN
	DROP FUNCTION [App].[GetOrganizationIdentifierSystemId]
END

GO


CREATE FUNCTION App.GetOrganizationIdentifierSystemId (@OrganizationIdentifierSystemCode VARCHAR(100), @OrganizationIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationIdentifierSystemId INT
	
          SELECT @RefOrganizationIdentifierSystemId = rois.RefOrganizationIdentificationSystemId
          FROM ODS.RefOrganizationIdentificationSystem rois
		  JOIN ODS.RefOrganizationIdentifierType roit
			ON rois.RefOrganizationIdentifierTypeId = roit.RefOrganizationIdentifierTypeId
          WHERE rois.Code = @OrganizationIdentifierSystemCode
			AND roit.Code = @OrganizationIdentifierTypeCode

	RETURN (@RefOrganizationIdentifierSystemId)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetFiscalYearStartDate') BEGIN
	DROP FUNCTION [App].[GetFiscalYearStartDate]
END

GO

CREATE FUNCTION App.GetFiscalYearStartDate(@SchoolYear SMALLINT)
RETURNS DATE
AS BEGIN
	RETURN CAST(CAST(@SchoolYear - 1 AS VARCHAR) + '-07-01' AS DATE)
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetFiscalYearEndDate') BEGIN
	DROP FUNCTION [App].[GetFiscalYearEndDate]
END

GO

CREATE FUNCTION App.GetFiscalYearEndDate(@SchoolYear SMALLINT)
RETURNS DATE
AS BEGIN
	RETURN CAST(CAST(@SchoolYear AS VARCHAR) + '-06-30' AS DATE)
END




-------------------------------------------------------------------------------------------------
----Install the Staging Schema and Tables
-------------------------------------------------------------------------------------------------

GO

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging') BEGIN
	EXEC ('CREATE SCHEMA Staging;');
END

GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ValidationErrors') BEGIN
	DROP TABLE [Staging].[ValidationErrors]
END

GO


CREATE TABLE Staging.ValidationErrors
    ( Id INT IDENTITY(1, 1) PRIMARY KEY
	, ETLName VARCHAR(100)
	, StagingTableName VARCHAR(100)
	, ElementName VARCHAR(100)
	, ErrorDescription VARCHAR(500)
	, Identifier VARCHAR(100)
	, CreateDate DATETIME
	)



IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'StateDetail') BEGIN
	DROP TABLE [Staging].[StateDetail]
END

GO


--This will house the all state data, including SEA contact, which is the Cheif Information Officer for Reporting FS029
CREATE TABLE Staging.StateDetail (
	  OrganizationId INT NULL
	, StateName VARCHAR(30)
	, StateCode CHAR(2)
	, SeaName VARCHAR(250)
	, SeaShortName VARCHAR(20)
	, SeaStateIdentifier VARCHAR(7)
	, Sea_WebSiteAddress VARCHAR(300)
	, SeaContact_FirstName VARCHAR(100)
	, SeaContact_LastOrSurname VARCHAR(100)
	, SeaContact_PersonalTitleOrPrefix VARCHAR(100)
	, SeaContact_ElectronicMailAddress VARCHAR(100)
	, SeaContact_PhoneNumber VARCHAR(100)
	, SeaContact_Identifier VARCHAR(100)
	, PersonId INT
	, RunDateTime DATETIME
)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'StateName' 	
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'StateCode' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefState', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'StateCode' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'SeaName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'SeaShortName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'SeaStateIdentifier' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefStateANSICode', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'SeaStateIdentifier' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'Sea_WebSiteAddress' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'SeaContact_FirstName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'SeaContact_LastOrSurname' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'SeaContact_ElectronicMailAddress' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'SeaContact_PhoneNumber' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StateDetail', @level2type = N'Column', @level2name = 'SeaContact_Identifier' 


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'StaffAssignment') BEGIN
	DROP TABLE [Staging].[StaffAssignment]
END




CREATE TABLE Staging.StaffAssignment (
	  ID INT IDENTITY(1, 1) Primary Key
	, Personnel_Identifier_State VARCHAR(100)
	, School_Identifier_State VARCHAR(100)
	, FullTimeEquivalency DECIMAL(5, 4) NULL
	, SpecialEducationStaffCategory VARCHAR(100) NULL
	, K12StaffClassification VARCHAR(100) NULL
	, TitleIProgramStaffCategory VARCHAR(100) NULL
	, CredentialType VARCHAR(100) NULL
	, CredentialIssuanceDate DATE NULL
	, CredentialExpirationDate DATE NULL
	, ParaprofessionalQualification VARCHAR(100) NULL 
	, SpecialEducationAgeGroupTaught VARCHAR(100) NULL
	, HighlyQualifiedTeacherIndicator BIT NULL
	, AssignmentStartDate DATE
	, AssignmentEndDate DATE NULL
	, PersonId INT NULL
	, OrganizationId INT NULL
	, OrganizationPersonRoleId INT NULL
	, RunDateTime DATETIME
	)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'Personnel_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'School_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'FullTimeEquivalency' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'SpecialEducationStaffCategory ' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefSpecialEducationStaffCategory', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'SpecialEducationStaffCategory ' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'K12StaffClassification' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefK12StaffClassification', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'K12StaffClassification' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'TitleIProgramStaffCategory' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefTitleIProgramStaffCategory', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'TitleIProgramStaffCategory' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'CredentialType' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefTitleIProgramStaffCategory', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'CredentialType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'CredentialExpirationDate' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'ParaprofessionalQualification' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefParaprofessionalQualification', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'ParaprofessionalQualification' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'SpecialEducationAgeGroupTaught' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefSpecialEducationAgeGroupTaught', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'SpecialEducationAgeGroupTaught' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'HighlyQualifiedTeacherIndicator' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'AssignmentStartDate' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StaffAssignment', @level2type = N'Column', @level2name = 'AssignmentEndDate' 			


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ProgramParticipationTitleI') BEGIN
	DROP TABLE [Staging].[ProgramParticipationTitleI]
END




CREATE TABLE Staging.ProgramParticipationTitleI (
	 ID INT IDENTITY(1, 1) Primary Key
	,RecordId VARCHAR(100)
	,School_Identifier_State VARCHAR(100)
	,Student_Identifier_State VARCHAR(100)
	,TitleIIndicator VARCHAR(100)
	,PersonID INT
	,OrganizationID_School INT
	,OrganizationPersonRoleID_TitleIProgram INT
	,OrganizationID_TitleIProgram INT
	,PersonProgramParticipationId INT
	,RefTitleIIndicatorId INT
	,RunDateTime DATETIME
    );

CREATE NONCLUSTERED INDEX IX_Staging_ProgramParticipationTitleI_RecordId
    ON Staging.ProgramParticipationTitleI (RecordId);   
  

CREATE NONCLUSTERED INDEX IX_Staging_ProgramParticipationTitleI_PersonSchool
    ON Staging.ProgramParticipationTitleI (PersonID, OrganizationID_TitleIProgram);   
  

CREATE NONCLUSTERED INDEX IX_Staging_ProgramParticipationTitleI_PersonTitleI
    ON Staging.ProgramParticipationTitleI (OrganizationPersonRoleID_TitleIProgram);   
  

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationTitleI', @level2type = N'Column', @level2name = 'RecordId' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationTitleI', @level2type = N'Column', @level2name = 'School_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationTitleI', @level2type = N'Column', @level2name = 'Student_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationTitleI', @level2type = N'Column', @level2name = 'TitleIIndicator' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefTitleIIndicator', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationTitleI', @level2type = N'Column', @level2name = 'TitleIIndicator' 


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ProgramParticipationSpecialEducation') BEGIN
	DROP TABLE [Staging].[ProgramParticipationSpecialEducation]
END

GO


CREATE TABLE Staging.ProgramParticipationSpecialEducation (
			 ID INT IDENTITY(1, 1) Primary Key
			,RecordId VARCHAR(100)
			,Student_Identifier_State VARCHAR(100)
			,School_Identifier_State VARCHAR(100)
			,ProgramParticipationBeginDate DATE
			,ProgramParticipationEndDate DATE NULL
			,SpecialEducationExitReason VARCHAR(100) NULL
			,IDEAEducationalEnvironmentForEarlyChildhood VARCHAR(100)
			,IDEAEducationalEnvironmentForSchoolAge VARCHAR(100)
			,PersonID INT
			,OrganizationID_School INT
			,OrganizationID_Program INT
			,OrganizationPersonRoleId_Program INT
			,PersonProgramParticipationID INT
			,RunDateTime DATETIME
		  );

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'RecordId' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'Student_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'School_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'ProgramParticipationBeginDate' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'ProgramParticipationEndDate' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'SpecialEducationExitReason' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefSpecialEducationExitReason', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'SpecialEducationExitReason' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'IDEAEducationalEnvironmentForEarlyChildhood' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefIDEAEducationalEnvironmentEC', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'IDEAEducationalEnvironmentForEarlyChildhood' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'IDEAEducationalEnvironmentForSchoolAge' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefIDEAEducationalEnvironmentSchoolAge', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'IDEAEducationalEnvironmentForSchoolAge' 



IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'PrimaryDisability') BEGIN
	DROP TABLE [Staging].[PrimaryDisability]
END

GO


CREATE TABLE Staging.PrimaryDisability (
	 Student_Identifier_State VARCHAR(100)
	,DisabilityType VARCHAR(100)
	,RunDateTime DATETIME
	)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PrimaryDisability', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PrimaryDisability', @level2type = N'Column', @level2name = 'DisabilityType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefDisabilityType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PrimaryDisability', @level2type = N'Column', @level2name = 'DisabilityType' 


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'PersonStatus') BEGIN
	DROP TABLE [Staging].[PersonStatus]
END

GO


CREATE TABLE Staging.PersonStatus (
	 Student_Identifier_State VARCHAR(100)
	,School_Identifier_State VARCHAR(100)
	,HomelessnessStatus BIT
	,Homelessness_StatusStartDate DATE
	,Homelessness_StatusEndDate DATE
	,EconomicDisadvantageStatus BIT
	,EconomicDisadvantage_StatusStartDate DATE
	,EconomicDisadvantage_StatusEndDate DATE
	,MigrantStatus BIT
	,Migrant_StatusStartDate DATE
	,Migrant_StatusEndDate DATE
	,MilitaryConnectedStudentIndicator VARCHAR(100)
	,MilitaryConnected_StatusStartDate DATE
	,MilitaryConnected_StatusEndDate DATE
	,ProgramType_FosterCare BIT
	,FosterCare_ProgramParticipationStartDate DATE
	,FosterCare_ProgramParticipationEndDate DATE
	,EnglishLearnerStatus BIT
	,EnglishLearner_StatusStartDate DATE
	,EnglishLearner_StatusEndDate DATE
	,IDEAIndicator BIT
	,IDEA_StatusStartDate DATE
	,IDEA_StatusEndDate DATE
	,PrimaryDisabilityType VARCHAR(100)
	,PersonId INT
	,OrganizationID_School INT
	,OrganizationID_Program_Foster INT
	,OrganizationPersonRoleID_School INT
	,PersonStatusId_Homeless INT
	,PersonStatusId_EconomicDisadvantage INT
	,PersonStatusId_IDEA INT
	,PersonStatusId_EnglishLearner INT
	,PersonStatusId_Migrant INT
	,PersonMilitaryId INT
	,OrganizationPersonRoleID_Program_Foster INT
	,RunDateTime DATETIME
	);

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'School_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'HomelessnessStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'Homelessness_StatusStartDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'Homelessness_StatusEndDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'EconomicDisadvantageStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'EconomicDisadvantage_StatusStartDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'EconomicDisadvantage_StatusEndDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'MigrantStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'Migrant_StatusStartDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'MilitaryConnectedStudentIndicator' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'Migrant_StatusEndDate' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefMilitaryConnectedStudentIndicator', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'MilitaryConnectedStudentIndicator' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'ProgramType_FosterCare' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'FosterCare_ProgramParticipationStartDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'FosterCare_ProgramParticipationEndDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'EnglishLearnerStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'EnglishLearner_StatusStartDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'EnglishLearner_StatusEndDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'IDEAIndicator' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'IDEA_StatusStartDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'IDEA_StatusEndDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'PrimaryDisabilityType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefDisabilityType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonStatus', @level2type = N'Column', @level2name = 'PrimaryDisabilityType' 



IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Person') BEGIN
	DROP TABLE [Staging].[Person]
END

GO


CREATE TABLE Staging.Person (
	 Id INT IDENTITY(1, 1) Primary Key
	,Identifier VARCHAR(100)
	,FirstName VARCHAR(100)
	,LastName VARCHAR(100)
	,MiddleName VARCHAR(100)
	,Birthdate DATE
	,[Role] VARCHAR(30)
	,PersonId INT NULL
	,RunDateTime DATETIME
	);

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'Identifier' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'FirstName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'LastName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'Birthdate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'Role' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'Role', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'Role' 




IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationPhone') BEGIN
	DROP TABLE [Staging].[OrganizationPhone]
END

GO


--This will be used to house telephone number data for all three organization types (SEA, LEA, and K12 School)
CREATE TABLE Staging.OrganizationPhone (
	 Id INT IDENTITY(1, 1) Primary Key
	,OrganizationIdentifier VARCHAR(100)
	,OrganizationType VARCHAR(100)
	,InstitutionTelephoneNumberType VARCHAR(100)
	,TelephoneNumber VARCHAR(100)
	,OrganizationId VARCHAR(100)
	,LEA_OrganizationTelephoneId INT
	,School_OrganizationTelephoneId INT
	,RunDateTime DATETIME
	)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationPhone', @level2type = N'Column', @level2name = 'OrganizationIdentifier' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationPhone', @level2type = N'Column', @level2name = 'OrganizationType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefOrganizationType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationPhone', @level2type = N'Column', @level2name = 'OrganizationType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationPhone', @level2type = N'Column', @level2name = 'InstitutionTelephoneNumberType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefInstitutionTelephoneType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationPhone', @level2type = N'Column', @level2name = 'InstitutionTelephoneNumberType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationPhone', @level2type = N'Column', @level2name = 'TelephoneNumber' 



IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationGradeOffered') BEGIN
	DROP TABLE [Staging].[OrganizationGradeOffered]
END

GO


--This will house the grades offered at the School level
CREATE TABLE Staging.OrganizationGradeOffered (
	 Id INT IDENTITY(1, 1) Primary Key
	,OrganizationIdentifier VARCHAR(100)
	,GradeOffered VARCHAR(100)
	,OrganizationId VARCHAR(100)
	,K12SchoolGradeOfferedId INT
	,RunDateTime DATETIME
	)

CREATE NONCLUSTERED INDEX IX_Staging_OrganizationGradesOffered_OrganizationId
    ON Staging.OrganizationGradeOffered (OrganizationId);   
GO

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationGradeOffered', @level2type = N'Column', @level2name = 'OrganizationIdentifier' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationGradeOffered', @level2type = N'Column', @level2name = 'GradeOffered' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefStateANSICode', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationGradeOffered', @level2type = N'Column', @level2name = 'GradeOffered' 
exec sp_addextendedproperty @name = N'TableFilter', @value = N'000100', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationGradeOffered', @level2type = N'Column', @level2name = 'GradeOffered' 


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationFederalFunding') BEGIN
	DROP TABLE [Staging].[OrganizationFederalFunding]
END

GO

CREATE TABLE Staging.OrganizationFederalFunding (
	 Id INT IDENTITY(1, 1) Primary Key
	,OrganizationIdentifier VARCHAR(60)
	,OrganizationType VARCHAR(100)
	,FederalProgramCode VARCHAR(10)
	,FederalProgramsFundingAllocation NUMERIC(12,2)
	,ParentalInvolvementReservationFunds NUMERIC(12,2)
	,RunDateTime DATETIME
	)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationFederalFunding', @level2type = N'Column', @level2name = 'OrganizationIdentifier' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationFederalFunding', @level2type = N'Column', @level2name = 'OrganizationType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefOrganizationType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationFederalFunding', @level2type = N'Column', @level2name = 'OrganizationType' 
exec sp_addextendedproperty @name = N'TableFilter', @value = N'001156', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationFederalFunding', @level2type = N'Column', @level2name = 'OrganizationType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationFederalFunding', @level2type = N'Column', @level2name = 'FederalProgramCode' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationFederalFunding', @level2type = N'Column', @level2name = 'FederalProgramsFundingAllocation' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationFederalFunding', @level2type = N'Column', @level2name = 'ParentalInvolvementReservationFunds' 


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationAddress') BEGIN
	DROP TABLE [Staging].[OrganizationAddress]
END

GO

CREATE TABLE Staging.OrganizationAddress (
	 Id INT IDENTITY(1, 1) Primary Key
	,OrganizationIdentifier VARCHAR(60)
	,OrganizationType VARCHAR(100)
	,AddressTypeForOrganization VARCHAR(50)
	,AddressStreetNumberAndName VARCHAR(150)
	,AddressApartmentRoomOrSuite VARCHAR(50)
	,AddressCity VARCHAR(30)
	,RefStateId VARCHAR(100)
	,AddressStateANSICode VARCHAR(100)
	,AddressPostalCode VARCHAR(17)
	,OrganizationId VARCHAR(100)
	,LocationId VARCHAR(100)
	,RunDateTime DATETIME
	)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'OrganizationIdentifier' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'OrganizationType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefOrganizationType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'OrganizationType' 
exec sp_addextendedproperty @name = N'TableFilter', @value = N'001156', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'OrganizationType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'AddressTypeForOrganization' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefOrganizationLocationType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'AddressTypeForOrganization' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'AddressStreetNumberAndName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'AddressCity' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'RefStateId' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefState', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'RefStateId' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'AddressStateANSICode' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefStateANSICode', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'AddressStateANSICode' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'OrganizationAddress', @level2type = N'Column', @level2name = 'AddressPostalCode' 


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


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Migrant') BEGIN
	DROP TABLE [Staging].[Migrant]
END

GO

CREATE TABLE Staging.Migrant (
	 Id INT IDENTITY(1, 1) Primary Key
	,RecordId VARCHAR(100)
	,SchoolYear VARCHAR(4)
	,School_Identifier_State VARCHAR(100)
	,Student_Identifier_State VARCHAR(100)
	,MigrantStatus VARCHAR(100)
	,MigrantEducationProgramEnrollmentType VARCHAR(100)
	,MigrantEducationProgramServicesType VARCHAR(100)
	,MigrantEducationProgramContinuationOfServicesStatus BIT
	,ContinuationOfServicesReason VARCHAR(100)
	,MigrantStudentQualifyingArrivalDate DATE
	,LastQualifyingMoveDate DATE
	,MigrantPrioritizedForServices BIT
	,ProgramParticipationStartDate DATE
	,ProgramParticipationExitDate DATE
	,PersonID INT
	,OrganizationID_School INT
	,OrganizationPersonRoleID_MigrantProgram INT
	,OrganizationID_MigrantProgram INT
	,PersonProgramParticipationId INT
	,ProgramParticipationMigrantId INT
	,RunDateTime DATETIME
	);

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'RecordId' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'SchoolYear' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'School_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'MigrantStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'MigrantEducationProgramEnrollmentType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefMepEnrollmentType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'MigrantEducationProgramEnrollmentType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'MigrantEducationProgramServicesType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefMepServiceType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'MigrantEducationProgramServicesType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'MigrantEducationProgramContinuationOfServicesStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'ContinuationOfServicesReason' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefContinuationOfServices', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'ContinuationOfServicesReason' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'MigrantStudentQualifyingArrivalDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'LastQualifyingMoveDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'MigrantPrioritizedForServices' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'ProgramParticipationStartDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Migrant', @level2type = N'Column', @level2name = 'ProgramParticipationExitDate' 


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'MembershipRace') BEGIN
	DROP TABLE [Staging].[MembershipRace]
END

GO


CREATE TABLE Staging.MembershipRace (
	 Student_Identifier_State VARCHAR(100)
	,RaceType VARCHAR(100)
	,PersonDemographicRaceId INT
	,RunDateTime DATETIME
	)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipRace', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipRace', @level2type = N'Column', @level2name = 'RaceType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefRace', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipRace', @level2type = N'Column', @level2name = 'RaceType' 



IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'MembershipChildCount') BEGIN
	DROP TABLE [Staging].[MembershipChildCount]
END

GO

CREATE TABLE Staging.MembershipChildCount (
	 ID INT IDENTITY(1, 1) Primary Key
	,RecordId VARCHAR(100)
	,School_Identifier_State VARCHAR(100)
	,Student_Identifier_State VARCHAR(100)
	,LastName VARCHAR(100)
	,FirstName VARCHAR(100)
	,Birthdate DATE
	,PrimaryDisability VARCHAR(100)
	,RaceEthnicityQuestion_Hispanic BIT
	,Sex VARCHAR(100)
	,EnglishLearnerStatus BIT
	,IDEAStatus BIT
	,ISO_639_2_NativeLanguage VARCHAR(100)
	,EligibilityStatusForSchoolFoodServicePrograms VARCHAR(100)
	,NationalSchoolLunchProgramDirectCertificationIndicator BIT
	,PersonID INT
	,PersonDetailID INT
	,PersonDisabilityId INT
	,PersonLanguageId INT
	,PersonStatusId_IDEA INT
	,PersonStatusId_LEP INT
	,OrganizationID_School INT
	,OrganizationPersonRoleID_School INT
	,OrganizationID_SpecialEducationProgram INT
	,RunDateTime DATETIME
    );

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'RecordId' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'School_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'LastName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'FirstName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'Birthdate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'PrimaryDisability' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefStateANSICode', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'PrimaryDisability' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'RaceEthnicityQuestion_Hispanic' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'Sex' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefStateANSICode', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'Sex' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'EnglishLearnerStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'IDEAStatus' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'ISO_639_2_NativeLanguage' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefISO6392Language', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'ISO_639_2_NativeLanguage' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'EligibilityStatusForSchoolFoodServicePrograms' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefNSLPStatus', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'EligibilityStatusForSchoolFoodServicePrograms' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipChildCount', @level2type = N'Column', @level2name = 'NationalSchoolLunchProgramDirectCertificationIndicator' 



IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Enrollment') BEGIN
	DROP TABLE [Staging].[Enrollment]
END

GO


CREATE TABLE Staging.Enrollment (
	  Id INT IDENTITY(1, 1) Primary Key
	, Student_Identifier_State VARCHAR(100)
	, School_Identifier_State VARCHAR(100)
	, EnrollmentEntryDate DATE
	, EnrollmentExitDate DATE
	, ExitWithdrawType VARCHAR(100) NULL
	, GradeLevel VARCHAR(100)
	, CohortYear NCHAR(4) NULL
	, CohortGraduationYear NCHAR(4) NULL
	, HighSchoolDiplomaType VARCHAR(100) NULL
	, PersonId INT NULL
	, OrganizationID_School INT NULL
	, OrganizationPersonRoleId_School INT NULL
	, RunDateTime DATETIME
	);


exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'School_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'EnrollmentEntryDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'EnrollmentExitDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'ExitWithdrawType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefExitOrWithdrawalType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'ExitWithdrawType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'GradeLevel' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefGradeLevel', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'GradeLevel' 
exec sp_addextendedproperty @name = N'TableFilter', @value = N'000100', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'GradeLevel' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'CohortYear' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'CohortGraduationYear' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'HighSchoolDiplomaType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefHighSchoolDiplomaType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Enrollment', @level2type = N'Column', @level2name = 'HighSchoolDiplomaType' 


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Discipline') BEGIN
	DROP TABLE [Staging].[Discipline]
END

GO


CREATE TABLE Staging.Discipline
    ( Id INT IDENTITY(1, 1) PRIMARY KEY
	, Student_Identifier_State VARCHAR(100)
	, School_Identifier_State VARCHAR(100)
	, IncidentIdentifier VARCHAR(40) NULL
	, DisciplinaryActionTaken VARCHAR(100)
	, DisciplineReason VARCHAR(100) 
    , DisciplinaryActionStartDate VARCHAR(100)
    , DisciplinaryActionEndDate VARCHAR(100)
    , DurationOfDisciplinaryAction VARCHAR(100)
    , IdeaInterimRemoval VARCHAR(100)
    , IdeaInterimRemovalReason VARCHAR(100)
	, EducationalServicesAfterRemoval BIT
    , DisciplineMethodOfCwd VARCHAR(100)
	, PersonId INT NULL
	, OrganizationID_School INT NULL
	, OrganizationPersonRoleId_School INT NULL 
	, IncidentId INT NULL
	, RunDateTime DATETIME
	)


exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'School_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'IncidentIdentifier' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'DisciplinaryActionTaken' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefDisciplinaryActionTaken', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'DisciplinaryActionTaken' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'DisciplineReason' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefDisciplineReason', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'DisciplineReason' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'DisciplinaryActionStartDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'DisciplinaryActionEndDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'DurationOfDisciplinaryAction' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'IdeaInterimRemoval' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefIdeaInterimRemoval', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'IdeaInterimRemoval' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'IdeaInterimRemovalReason' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefIDEAInterimRemovalReason', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'IdeaInterimRemovalReason' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'EducationalServicesAfterRemoval' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'DisciplineMethodOfCwd' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefDisciplineMethodOfCwd', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Discipline', @level2type = N'Column', @level2name = 'DisciplineMethodOfCwd' 


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'AssessmentResult') BEGIN
	DROP TABLE [Staging].[AssessmentResult]
END

GO

CREATE TABLE Staging.AssessmentResult (
	 ID INT IDENTITY(1, 1) Primary Key
	,Student_Identifier_State VARCHAR(100)
	,School_Identifier_State VARCHAR(100)
	,AssessmentTitle VARCHAR(100)
	,AssessmentAcademicSubject VARCHAR(100)
	,AssessmentPurpose VARCHAR(100)
	,AssessmentType VARCHAR(100)
	,AssessmentTypeAdministeredToChildrenWithDisabilities VARCHAR(100)
	,AssessmentAdministrationStartDate DATE
	,AssessmentAdministrationFinishDate DATE
	,AssessmentRegistrationParticipationIndicator BIT 
	,GradeLevelWhenAssessed VARCHAR(100)
	,StateFullAcademicYear VARCHAR(100)
	,LEAFullAcademicYear VARCHAR(100)
	,SchoolFullAcademicYear VARCHAR(100)
	,AssessmentRegistrationReasonNotCompleting VARCHAR(100)
	,AssessmentPerformanceLevelIdentifier VARCHAR(100)
	,AssessmentPerformanceLevelLabel VARCHAR(100)
	,AssessmentRegistrationId INT
	,AssessmentId INT
	,AssessmentAdministrationId INT
	,PersonId INT
	,AssessmentFormId INT
	,AssessmentSubtestId INT
	,AssessmentPerformanceLevelId INT
	,AssessmentResultId INT
	,AssessmentResult_PerformanceLevelId INT
	,OrganizationID_School INT
	,OrganizationPersonRoleId_School INT
	,RunDateTime DATETIME
);

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'School_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentTitle' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentAcademicSubject' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefAcademicSubject', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentAcademicSubject' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentPurpose' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefAssessmentPurpose', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentPurpose' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefAssessmentType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentTypeAdministeredToChildrenWithDisabilities' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefAssessmentTypeChildrenWithDisabilities', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentTypeAdministeredToChildrenWithDisabilities' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentAdministrationStartDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentAdministrationFinishDate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentRegistrationParticipationIndicator' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'GradeLevelWhenAssessed' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefGradeLevel', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'GradeLevelWhenAssessed' 
exec sp_addextendedproperty @name = N'TableFilter', @value = N'000126', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'GradeLevelWhenAssessed' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'StateFullAcademicYear' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'LEAFullAcademicYear' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'SchoolFullAcademicYear' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentRegistrationReasonNotCompleting' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefAssessmentReasonNotCompleting', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentRegistrationReasonNotCompleting' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentPerformanceLevelIdentifier' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'AssessmentResult', @level2type = N'Column', @level2name = 'AssessmentPerformanceLevelLabel' 


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Assessment') BEGIN
	DROP TABLE [Staging].[Assessment]
END

GO


CREATE TABLE Staging.Assessment (
	 ID INT IDENTITY(1, 1) Primary Key
	,AssessmentTitle VARCHAR(100)
	,AssessmentShortName VARCHAR(100)
	,AssessmentAcademicSubject VARCHAR(100)
	,AssessmentPurpose VARCHAR(100)
	,AssessmentType VARCHAR(100)
	,AssessmentTypeAdministeredToChildrenWithDisabilities VARCHAR(100)
	,AssessmentFamilyTitle VARCHAR(100)
	,AssessmentFamilyShortName VARCHAR(100)
	,AssessmentAdministrationStartDate DATE
	,AssessmentAdministrationFinishDate DATE
	,AssessmentPerformanceLevelIdentifier VARCHAR(100)
	,AssessmentPerformanceLevelLabel VARCHAR(100)
	,AssessmentId INT
	,AssessmentAdministrationId INT
	,AssessmentSubtestId INT
	,AssessmentFormId INT
	,AssessmentPerformanceLevelId INT
	,RunDateTime DATETIME
	);

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentTitle'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentShortName'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentAcademicSubject'
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefAcademicSubject', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentAcademicSubject'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentPurpose'
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefAssessmentPurpose', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentPurpose'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentType'
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefAssessmentType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentType'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentTypeAdministeredToChildrenWithDisabilities'
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefAssessmentTypeChildrenWithDisabilities', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentTypeAdministeredToChildrenWithDisabilities'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentFamilyTitle'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentFamilyShortName'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentAdministrationStartDate'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentAdministrationFinishDate'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentPerformanceLevelIdentifier'
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Assessment', @level2type = N'Column', @level2name = 'AssessmentPerformanceLevelLabel'

 



-------------------------------------------------------------------------------------------------
----Install Source System Reference Data for Enumeration Mapping
-------------------------------------------------------------------------------------------------


IF NOT EXISTS(SELECT 1 FROM sys.Objects 
    WHERE  Object_id = OBJECT_ID(N'[ODS].[SourceSystemReferenceData]') AND Type = N'U')
begin

	CREATE TABLE [ODS].[SourceSystemReferenceData](
		[SourceSystemReferenceDataId] int IDENTITY NOT NULL,
		[SchoolYear] [smallint] NOT NULL,
		[TableName] [varchar](100) NOT NULL,
		[TableFilter] [varchar](100) NULL,
		[InputCode] [nvarchar](200) NULL,
		[OutputCode] [nvarchar](200) NULL
	CONSTRAINT [PK_SourceSystemReferenceData] PRIMARY KEY CLUSTERED 
	(
		[SourceSystemReferenceDataId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE UNIQUE INDEX [IX_SourceSystemReferenceData_Unique] ON [ODS].[SourceSystemReferenceData]
	(
		[SchoolYear] DESC,
		[TableName] ASC,
		[TableFilter] ASC,
		[InputCode] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

end




-- Populate ODS.SourceSystemReferenceData
--------------------------------------

-- RefOperationalStatus - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOperationalStatus' and TableFilter = 'LEA')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Active', 'Open')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Added', 'Added')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Changed', 'ChangedBoundary')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Closed', 'Closed')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Continuing', 'Open')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Future', 'FutureAgency')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Inactive', 'Inactive')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'New', 'New')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Reopened', 'Reopened')

end

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOperationalStatus' and TableFilter = 'K12School')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Active', 'Open')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Added', 'Added')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Changed', 'ChangedAgency')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Closed', 'Closed')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Continuing', 'Open')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Future', 'FutureSchool')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Inactive', 'Inactive')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'New', 'New')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Reopened', 'Reopened')

end


if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOperationalStatus' and TableFilter = 'Organization')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'Organization', 'Active', 'Active')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'Organization', 'Inactive', 'Inactive')

end


-- RefOrganizationLocationType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationLocationType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationLocationType', null, 'Physical', 'Physical')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationLocationType', null, 'Mailing', 'Mailing')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationLocationType', null, 'Shipping', 'Shipping')
end


-- RefOrganizationIdentificationSystem - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationIdentificationSystem' and TableFilter = 'SEA')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'SEA', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'SEA', 'SEA', 'State')
end

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationIdentificationSystem' and TableFilter = 'LEA')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'ACT', 'ACT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'DUNS', 'DUNS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'NCES', 'NCES')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'Other Federal', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'SEA', 'SEA')

end


if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationIdentificationSystem' and TableFilter = 'K12School')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'ACT', 'ACT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'DUNS', 'DUNS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'LEA', 'LEA')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'NCES', 'NCES')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'Other Federal', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'School', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'SEA', 'SEA')

end


if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationIdentificationSystem' and TableFilter = 'Organization')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'ACT', 'ACT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'DUNS', 'DUNS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'LEA', 'LEA')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'NCES', 'NCES')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'Other Federal', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'School', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'SEA', 'SEA')

end


-- RefSchoolType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSchoolType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolType', null, 'Alternative', 'Alternative')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolType', null, 'Career and Technical Education', 'CareerAndTechnical')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolType', null, 'Regular', 'Regular')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolType', null, 'Special Education', 'Special')
end


-- RefCharterSchoolType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCharterSchoolType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolType', null, 'College / University Charter', 'CollegeUniversity')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolType', null, 'Open Enrollment', 'NA')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolType', null, 'School Charter', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolType', null, 'Not a Charter School', 'NA')
end


-- RefCharterSchoolApprovalAgencyType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCharterSchoolApprovalAgencyType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolApprovalAgencyType', null, 'State board of education', 'State')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolApprovalAgencyType', null, 'Public charter school board', 'PublicCharterBoard')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolApprovalAgencyType', null, 'University', 'University')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolApprovalAgencyType', null, 'Other', 'Other')
end


-- RefInternetAccess - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefInternetAccess')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInternetAccess', null, 'High Speed', 'HighSpeed')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInternetAccess', null, 'Less Than High Speed', 'LessThanHighSpeed')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInternetAccess', null, 'None', null)
end



-- RefTitleIschoolStatus - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefTitleIschoolStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Not designated as a Title I Part A school', 'NOTTITLE1ELIG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I Part A Schoolwide Assistance Program School', 'SWELIGSWPROG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I Part A Targeted Assistance School', 'TGELGBTGPROG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I school wide eligible - Title I targeted program', 'SWELIGTGPROG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I school wide eligible school - no program', 'SWELIGNOPROG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I targeted eligible school - no program', 'TGELGBNOPROG')

end


-- RefMagnetSpecialProgram - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMagnetSpecialProgram')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMagnetSpecialProgram', null, 'All students participate', 'All')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMagnetSpecialProgram', null, 'No students participate', 'None')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMagnetSpecialProgram', null, 'Some, but not all, students participate', 'Some')
end


-- RefAdministrativeFundingControl - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAdministrativeFundingControl')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAdministrativeFundingControl', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAdministrativeFundingControl', null, 'Private School', 'Private')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAdministrativeFundingControl', null, 'Public School', 'Public')
end


-- RefInstitutionTelephoneType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefInstitutionTelephoneType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Administrative', 'Administrative')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Attendance', 'Attendance')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Fax', 'Fax')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Food Service', 'FoodServices')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Health Clinic', 'HealthClinic')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Main', 'Main')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Other', 'Other')

end


-- RefGunFreeSchoolsActReportingStatus - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefGunFreeSchoolsActReportingStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGunFreeSchoolsActReportingStatus', null, 'Yes, with reporting of one or more students for an offense', 'YesReportingOffenses')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGunFreeSchoolsActReportingStatus', null, 'Yes, with no reported offenses', 'YesNoReportedOffenses')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGunFreeSchoolsActReportingStatus', null, 'No', 'No')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGunFreeSchoolsActReportingStatus', null, 'Not applicable', 'NA')
end


-- RefPublicSchoolChoiceStatus - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPublicSchoolChoiceStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolChoiceStatus', null, 'Implemented at all grade levels', 'ImplementedAllGrades')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolChoiceStatus', null, 'Implemented at some but not all grade levels', 'ImplementedSomeGrades')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolChoiceStatus', null, 'Unable to implement at any grades levels', 'UnableToImplement')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolChoiceStatus', null, 'Not required to implement public school choice', 'NotRequiredToImplement')
end


-- RefGradeLevel - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefGradeLevel')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Adult Education', 'ABE')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Early Education', 'PR')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Eighth grade', '08')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Eleventh grade', '11')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Fifth grade', '05')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'First grade', '01')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Fourth grade', '04')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Grade 13', '13')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Infant/toddler', 'IT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Kindergarten', 'KG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Ninth grade', '09')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Postsecondary', 'PS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Preschool/Prekindergarten', 'PK')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Second grade', '02')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Seventh grade', '07')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Sixth grade', '06')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Tenth grade', '10')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Third grade', '03')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Twelfth grade', '12')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Ungraded', 'UG')


	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Adult Education', 'ABE')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Early Education', 'PR')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Eighth grade', '08')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Eleventh grade', '11')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Fifth grade', '05')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'First grade', '01')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Fourth grade', '04')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Grade 13', '13')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Infant/toddler', 'IT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Kindergarten', 'KG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Ninth grade', '09')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Postsecondary', 'PS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Preschool/Prekindergarten', 'PK')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Second grade', '02')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Seventh grade', '07')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Sixth grade', '06')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Tenth grade', '10')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Third grade', '03')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Twelfth grade', '12')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Ungraded', 'UG')

end



-- RefSchoolLevel - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSchoolLevel')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Adult School', '00013')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'All Levels', '01302')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Elementary School', '01304')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'High School', '02402')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Infant/toddler School', '00787')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Intermediate School', '02399')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Junior High School', '02602')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Middle School', '02400')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Preschool/early childhood', '01981')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Primary School', '02397')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Secondary School', '02403')

end


-- RefCalendarEventType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCalendarEventType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Emergency day', 'EmergencyDay')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Holiday', 'Holiday')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Instructional day', 'InstructionalDay')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Make-up day', 'MakeupDay')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Strike', 'Strike')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Student late arrival/early dismissal', 'LateArrivalEarlyDismissal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Teacher only day', 'TeacherOnlyDay')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Weather day', 'WeatherDay')

end



-- RefSessionType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSessionType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'MiniTerm', 'MiniTerm')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Quarter', 'Quarter')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Semester', 'Semester')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Trimester', 'Trimester')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Year Round', 'FullSchoolYear')
end


-- Staff reference tables

-- RefSex - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSex')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSex', null, 'Female', 'Female')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSex', null, 'Male', 'Male')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSex', null, 'Not Selected', 'NotSelected')

end



-- RefUscitizenshipStatus - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefUscitizenshipStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'Non-resident alien', 'NonResidentAlien')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'Permanent resident', 'PermanentResident')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'Refugee', 'Refugee')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'Resident alien', 'ResidentAlien')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'US Citizen', 'USCitizen')
end


-- RefEducationLevel - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefEducationLevel')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Associate''s Degree (two years or more)', '01050')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Bachelor''s', '01051')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Did Not Graduate High School', '01043')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Doctorate', '01057')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'High School Diploma', '01044')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Master''s', '01054')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Some College No Degree', '01049')
end


-- RefRace - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefRace')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'American Indian - Alaskan Native', 'AmericanIndianorAlaskaNative')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'Asian', 'Asian')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'Black - African American', 'BlackorAfricanAmerican')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'Native Hawaiian - Pacific Islander', 'NativeHawaiianorOtherPacificIslander')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'White', 'White')

end


-- RefPersonLocationType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPersonLocationType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Billing', 'Billing')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Doubled - up (i.e., living with another family)', 'Doubled - up (i.e., living with another family)')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Father Address', 'Father Address')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Guardian Address', 'Guardian Address')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Home', 'Home')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Hotels/Motels', 'Hotels/Motels')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', '', 'Mailing', 'Mailing')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Mother Address', 'Mother Address')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Physical', 'Physical')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Shelters, Transitional housing, Awaiting Foster Care', 'Shelters, Transitional housing, Awaiting Foster Care')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Shipping', 'Shipping')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Temporary', 'Temporary')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Unsheltered (e.g. cars, parks, campgrounds, temporary trailers including FEMA trailers, or abandoned buildings)', 'Unsheltered (e.g. cars, parks, campgrounds, temporary trailers including FEMA trailers, or abandoned buildings)')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Work', 'Employment')

end



-- RefCredentialType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCredentialType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Certification', 'Certification')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Endorsement', 'Endorsement')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Licensure', 'Licensure')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Registration', 'Registration')

end


-- RefOtherNameType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOtherNameType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOtherNameType', null, 'Alias', 'Alias')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOtherNameType', null, 'Nickname', 'Nickname')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOtherNameType', null, 'Other Name', 'OtherName')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOtherNameType', null, 'Previous Legal Name', 'PreviousLegalName')
end


-- RefEmailType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefEmailType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmailType', null, 'Home/Personal', 'Home')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmailType', null, 'Organization', 'Organizational')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmailType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmailType', null, 'Work', 'Work')
end


-- RefLanguageUseType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefLanguageUseType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Correspondence language', 'Correspondence')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Dominant language', 'Dominant')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Home language', 'Home')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Native language', 'Native')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Other language proficiency', 'OtherLanguageProficiency')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Spoken language', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Written language', 'Other')
end


-- RefPersonTelephoneNumberType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPersonTelephoneNumberType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Emergency 1', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Emergency 2', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Fax', 'Fax')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Home', 'Home')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Mobile', 'Mobile')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Unlisted', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Work', 'Work')
end


-- RefLanguage - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefLanguage')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguage', null, 'English', 'eng')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguage', null, 'Spanish', 'spa')
end



-- RefOperationalStatus - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPersonIdentificationSystem' and TableFilter = '001571')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Canadian SIN', 'CanadianSIN')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'District', 'District')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Drivers License', 'DriversLicense')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Health Record', 'HealthRecord')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Medicaid', 'Medicaid')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Other Federal', 'OtherFederal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'PIN', 'PIN')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Professional Certificate', 'ProfessionalCertificate')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'School', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Selective Service', 'SelectiveService')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'SSN', 'SSN')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'State', 'State')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'US Visa', 'USVisa')
end



-- RefProgramType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefProgramType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Adult/Continuing Education', '73056')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Alternative Education', '04961')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Athletics', '04932')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Bilingual', '04923')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Bilingual Summer', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Career and Technical Education', '04906')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Cocurricular Programs', '04931')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'College Preparatory', '04958')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Community Service Program', '04945')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Community/Junior College Education Program', '04944')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Compensatory Services for Disadvantaged Students', '04922')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Counseling Services', '04956')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'District-Funded GED', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Early Head Start', '14609')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Early Intervention Services Part C', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'English as a Second Language (ESL)', '04928')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Even Start', '04919')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Expelled Education', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Extended Day/Child Care Services', '04955')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Fee For Service', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Foreign Exchange', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Gifted and Talented', '04930')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Head Start', '04918')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Health Services Program', '04963')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'High School Equivalency Program (HSEP)', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Home Visiting', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'IDEA', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Immigrant Education', '04957')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Independent Study', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Indian Education', '04921')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'International Baccalaureate', '04959')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Kindergarten - Extended Day', '')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Kindergarten - Full Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Kindergarten - Half Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Library/Media Services Program', '04962')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Magnet/Special Program Emphasis', '04960')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Migrant Education', '04920')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Neglected and Delinquent Program', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Optional Flexible School Day Program (OFSDP)', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Prekindergarten - Extended Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Prekindergarten - Full Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Prekindergarten - Half Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Preschool Special Education', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Public Preschool', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Regular Education', '04887')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Remedial Education', '04964')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Section 504 Placement', '04967')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Service Learning', '04966')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Special Education', '04888')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Student Retention/Dropout Prevention', '04954')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Substance Abuse Education/Prevention', '04953')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Teacher Professional Development/Mentoring', '04968')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Technical Preparatory', '04917')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Title I Part A', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Title I Part D Subpart 1', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Title I Part D Subpart 2', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Vocational Education', '09999')
end


-- RefOrganizationRelationship - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationRelationship')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Business', 'Business')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Education organization network', 'Education organization network')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Education Service Center', 'Education Service Center')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Federal government', 'Federal government')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Local Education Agency', 'Local Education Agency')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Non-profit organization', 'Non-profit organization')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Postsecondary institution', 'Postsecondary institution')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Private organization', 'Private organization')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Religious organization', 'Religious organization')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'School', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'State Education Agency', 'State Education Agency')
end




-- RefActivityRecognitionType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefActivityRecognitionType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Athletic awards', '00737')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Awarding of units of value', '00738')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Certificate', '00742')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Citizenship award/recognition', '00740')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Completion of requirement, but no units of value awarded', '00741')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Honor award', '00743')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Letter of commendation', '02048')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Medals', '00745')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Monogram/letter', '00746')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Points', '00747')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Promotion or advancement', '00748')

end



-- RefAcademicHonorType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAcademicHonorType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Attendance award', '08692')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Awarding of units of value', '00738')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Certificate', '00742')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Citizenship award/recognition', '00740')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Completion of requirement, but no units of value awarded', '00741')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honor award', '02047')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honor roll', '01985')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honor society', '01986')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honorable mention', '01987')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honors program', '01988')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Letter of student commendation', '00744')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Medals', '00745')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'National Merit Scholar', '08693')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Points', '00747')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Prize awards', '01989')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Promotion or advancement', '00748')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Scholarships', '01991')
end



-- RefHighSchoolDiplomaDistinctionType AKA DiplomaLevel - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefHighSchoolDiplomaDistinctionType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Distinguished', 'Distinguished')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Magna cum laude', 'MagnaCumLaude')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Minimum', 'Minimum')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Open Enrollment', 'OpenEnrollment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Recommended', 'Recommended')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Summa cum laude', 'SummaCumLaude')
end


-- RefHighSchoolDiplomaType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefHighSchoolDiplomaType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Alternative credential', '00812')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Apprenticeship Certificate', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Career and Technical Education certificate', '00819')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Certificate of attendance', '00813')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Certificate of completion', '00814')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Endorsed/advanced diploma', '00807')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'General Educational Development (GED) credential', '00816')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'High school equivalency credential, other than GED', '00815')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Industry-recognized Certification', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'International Baccalaureate', '00809')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Modified diploma', '00810')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Occupational License', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Other diploma', '00811')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Post graduate certificate (grade 13)', '00818')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Regents diploma', '00808')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Regular diploma', '00806')

end



-- RefExitOrWithdrawalType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefExitOrWithdrawalType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Completed', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Died or is permanently incapacitated', '01923')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Dropout', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'End of school year', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Enrolled in a high school diploma program', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Expelled', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Graduated', '01921')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Incarcerated', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Invalid enrollment', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Involuntarily Removed', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'No show', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Reached maximum age', '03504')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Transferred', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Withdrawn', '09999')
end



-- RefPromotionReason - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPromotionReason')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Accelerated promotion', 'AcceleratedPromotion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Continuous promotion', 'ContinuousPromotion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Probationary promotion', 'ProbationaryPromotion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Regular promotion', 'RegularPromotion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Variable progress', 'VariableProgress')
end



-- RefNonPromotionReason - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefNonPromotionReason')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Failed to meet testing requirements', 'FailedTestingRequirements')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Illness', 'Illness')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Immaturity', 'Immaturity')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Inadequate performance', 'InadequatePerformance')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Insufficient credits', 'InsufficientCredits')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Prolonged absence', 'ProlongedAbsence')
end



-- RefEntryType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefEntryType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'New to education system', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'Next year school', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'Re-entry', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'Transfer', '09999')
end


-- RefPublicSchoolResidence - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPublicSchoolResidence')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of administrative unit and usual school attendance area', '01652')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of administrative unit, but of other school attendance area', '01653')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of an administrative unit that crosses state boundaries', '01655')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of another state', '01656')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of this state, but not of this administrative unit', '01654')
end


-- RefSpecialEducationExitReason - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSpecialEducationExitReason')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Died or is permanently incapacitated', 'Died')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Dropout', 'DroppedOut')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Reached maximum age', 'ReachedMaximumAge')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Transferred', 'Transferred')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Withdrawn', 'WithdrawalByParent')
end



-- RefIdeaEducationalEnvironmentSchoolAge - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIdeaeducationalEnvironmentSchoolAge')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Correctional Facilities', 'CF')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Homebound/Hospital', 'HH')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Inside regular class 80% or more of the day', 'RC80')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Inside regular class less than 40% of the day', 'RC39')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Inside regular class no more than 79% of day and no less than 40% of the day', 'RC79TO40')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Parentally-placed in Private Schools', 'PPPS')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Residential Facility', 'RF')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Separate School', 'SS')
end


-- RefIDEAEducationalEnvironmentEC - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIDEAEducationalEnvironmentEC')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'REC09YOTHLOC', 'REC09YOTHLOC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'REC10YOTHLOC', 'REC10YOTHLOC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'REC09YSVCS', 'REC09YSVCS')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'REC10YSVCS', 'REC10YSVCS')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'SC', 'SC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'SS', 'SS')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'RF', 'RF')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'H', 'H')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'SPL', 'SPL')
end


-- RefAcademicSubject - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAcademicSubject')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Career and Technical Education', '73065')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Composite', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Critical Reading', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English', '13372')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English Language Arts', '13373')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Fine and Performing Arts', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Foreign Language and Literature', '00546')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Life and Physical Sciences', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Mathematics', '01166')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Military Science', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Physical, Health, and Safety Education', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Reading', '00560')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Religious Education and Theology', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Science', '00562')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Social Sciences and History', '13374')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Social Studies', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Writing', '01287')
end


-- RefIncidentBehavior - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIncidentBehavior')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentBehavior', null, 'School Violation', '04704')
end


-- RefIncidentLocation - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIncidentLocation')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Administrative offices area', '03012')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Athletic field or playground', '03022')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Auditorium', '03020')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Bus stop', '03027')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Cafeteria area', '03013')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Classroom', '03014')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Computer lab', '03019')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Hallway or stairs', '03015')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Library/media center', '03018')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Locker room or gym areas', '03016')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off campus', '03026')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off-campus at a school sponsored activity', '13773')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off-campus at another location unrelated to school', '13774')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off-campus at other school', '03030')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off-campus at other school district facility', '03031')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'On campus', '03011')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'On-campus other inside area', '03021')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'On-campus other outside area', '03025')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Online', '03413')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Parking lot', '03024')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Restroom', '03017')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'School bus', '03028')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Stadium', '03023')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Unknown', '09997')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Walking to or from school', '03029')
end



-- RefWeaponType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefWeaponType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Handgun', 'Handgun')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Knife', 'Knife')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Other Firearm', 'OtherFirearm')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Other Object', 'OtherObject')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Other Sharp Objects', 'OtherSharpObject')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Substance Used as Weapon', 'Substance')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Unknown', 'Unknown')
end


-- RefIncidentReporterType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIncidentReporterType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Law enforcement officer', '03054')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Non-school personnel', '03059')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Parent/guardian', '00850')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Staff', '03422')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Student', '00126')
end


-- RefEmploymentStatus - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefEmploymentStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Contractual', '01379')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Employed or affiliated with outside agency part-time', '06071')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Employed or affiliated with outside organization', '01383')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Employed part-time', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Non-contractual', '01385')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Probationary', '01378')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Substitute/temporary', '01380')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Tenured or permanent', '01381')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Volunteer/no contract', '01382')
end


-- RefK12staffClassification  - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefK12staffClassification ')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Counselor', 'SchoolCounselors')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Instructional Coordinator', 'InstructionalCoordinators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Librarians/Media Specialists', 'LibraryMediaSpecialists')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'School Administrator', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Support Services Staff', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Instructional Aide', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Assistant Principal', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Principal', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Teacher', 'ElementaryTeachers') -- Need more granularity to this for the EDFacts report
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Substitute Teacher', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Operational Support', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Superintendent', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'School Leader', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Assistant Superintendent', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Other', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'LEA Specialist', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'LEA Administrator', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'School Specialist', 'StudentSupportServicesStaff')
end


	-- RefIncidentPersonRoleType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIncidentPersonRoleType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentPersonRoleType', null, 'Perpetrator', 'Perpetrator')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentPersonRoleType', null, 'Reporter', 'Reporter')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentPersonRoleType', null, 'Victim', 'Victim')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentPersonRoleType', null, 'Witness', 'Witness')
end


-- RefDisabilityType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'Serious Emotional Disability', 'EMN')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'DB', 'DB')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'HI', 'HI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'MD', 'MD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'OI', 'OI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'OHI', 'OHI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'SLD', 'SLD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'SLI', 'SLI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'VI', 'VI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'AUT', 'AUT')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'TBI', 'TBI')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, '', 'DD') -- No default Developmental Delay code inn Ed-Fi
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'ID', 'ID')

	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'ITD', '') --edfi "Infant/Toddler with a Disability"
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Other', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'PSD', '') -- edfi "Preschooler with a Disability"
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Motor impairment', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Medical condition', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Mental impairment', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Physical Disability', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Sensory impairment', '')
end

-- RefMepEnrollmentType - Source = edfi
--Cannot find these values in edfi, put the CEDS description as a placeholder for now
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMepEnrollmentType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '01', '01') --Basic School Program
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '02', '02') --Regular Term MEP-Funded Project
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '03', '03') --Summer/Intersession MEP-Funded Project
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '04', '04') --Year Round MEP-Funded Project
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '05', '05') --Basic School Program and Regular-Term MEP-Funded Project
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '06', '06') --Residency Only (none of the above)

end

-- RefMepServiceType - Source = edfi
-- Cannot find these values in edfi, put the CEDS code as a placeholder for now
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMepServiceType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'CounselingServices', 'CounselingServices')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'HighSchoolAccrual', 'HighSchoolAccrual')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'InstructionalServices', 'InstructionalServices')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'MathematicsInstruction', 'MathematicsInstruction')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'ReadingInstruction', 'ReadingInstruction')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'ReferralServices', 'ReferralServices')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'SupportServices', 'SupportServices')

end

-- RefContinuationOfServices - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefContinuationOfServices')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefContinuationOfServices', null, 'Ceased to be migratory during school term', '01')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefContinuationOfServices', null, 'Ceased to be migratory during prev term and no com', '02')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefContinuationOfServices', null, 'Prev migratory scndry student continuing scndry sc', '03')

end


-- RefAssessmentParticipationIndicator - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentParticipationIndicator')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentParticipationIndicator', null, '1', 'Participated')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentParticipationIndicator', null, '0', 'DidNotParticipate')

end

-- AssessmentPerformanceLevel_Identifier - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'AssessmentPerformanceLevel_Identifier')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'AssessmentPerformanceLevel_Identifier', null, 'Unsatisfactory', 'L1')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'AssessmentPerformanceLevel_Identifier', null, 'Proficient', 'L2')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'AssessmentPerformanceLevel_Identifier', null, 'Advanced', 'L3')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'AssessmentPerformanceLevel_Identifier', null, '', 'L4')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'AssessmentPerformanceLevel_Identifier', null, '', 'L5')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'AssessmentPerformanceLevel_Identifier', null, '', 'L6')

end

-- RefAssessmentReasonNotCompleting - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentReasonNotCompleting')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Refusal by parent', 'ParentsOptOut')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Parental waiver', 'ParentsOptOut')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Absent', 'Absent')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'LEP postponement', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Not appropriate (ARD decision)', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Not tested (ARD decision)', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Alternate assessment administered', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Foreign exchange student waiver', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Refusal by student', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Disruptive behavior', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Previously passed the examination', 'Other')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentReasonNotCompleting', null, '', 'OutOfLevelTest')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentReasonNotCompleting', null, '', 'NoValidScore')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Medical waiver', 'Medical')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentReasonNotCompleting', null, '', 'Moved')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentReasonNotCompleting', null, '', 'LeftProgram')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'LEP exempt', 'PARTELP')

end


-- RefAssessmentTypeChildrenWithDisabilities - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentTypeChildrenWithDisabilities')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State assessment', 'REGASSWOACC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State summative assessment 3-8 general', 'REGASSWOACC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'REGASSWACC', 'REGASSWACC')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'ALTASSGRADELVL')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'ALTASSMODACH')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State alternative assessment/grade-level standards', 'ALTASSALTACH')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State alternative assessment/modified standards', 'ALTASSALTACH')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'AgeLevelWithoutAccommodations')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'AgeLevelWithAccommodations')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'BelowAgeLevelWithoutAccommodations')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'BelowAgeLevelWithAccommodations')

end


-- RefAssessmentPurpose - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentPurpose')
begin
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00050') --Admission
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00051') --Assessment of student's progress
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, 'College entrance exam', '73055') --College Readiness
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00063') --Course credit
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00064') --Course requirement
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73069') --Diagnosis	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '03459') --Federal accountability
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73068') --Inform local or state policy
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00055') --Instructional decision
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '03457') --Local accountability
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '02404') --Local graduation requirement
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73042') --Obtain a state- or industry-recognized certificate or license
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73043') --Obtain postsecondary credit for the course
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73067') --Program eligibility
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00057') --Program evaluation
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00058') --Program placement 
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00062') --Promotion to or retention in a grade or program
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00061') --Screening
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '09999') --Other
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00054') --State graduation requirement
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State assessment', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State high school course assessment', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State high school subject assessment', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State summative assessment 3-8 general', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State alternative assessment/grade-level standards', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State alternative assessment/modified standards', '03458') --State accountability

--These are additional Ed-Fi Assessment Category Descriptors that are not included in the above mapping, but may need to be in the future--
--they don't appear to be state assessment which is what we need for Ed-Fi

--Language proficiency test
--State alternate assessment/ELL
--Alternate assessment/ELL
--Advanced Placement
--Class quiz
--Psychomotor test
--Early Learning - Physical well-being and motor dev
--Early Learning - Social and emotional development
--Manual dexterity test
--Reading readiness test
--State English proficiency test
--Achievement test
--Class test
--Early Learning - Language and literacy development
--Psychological test
--International Baccalaureate
--Developmental observation
--Alternative assessment/modified standards
--Foreign language proficiency test
--Performance assessment
--Aptitude test
--Diagnostic
--Formative
--Personality test
--Benchmark test
--Early Learning - Cognition and general knowledge
--Interim
--Prekindergarten Readiness
--Attitudinal test
--Early Learning - Approaches toward learning
--Interest inventory
--Portfolio assessment
--Alternate assessment/grade-level standards
--Cognitive and perceptual skills test
--English proficiency screening test
--Mental ability (intelligence) test
--Other

end

-- RefAcademicSubject - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAcademicSubject')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Fine and Performing Arts', '13371') --Arts
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Career and Technical Education', '73065') --Career and Technical Education
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English', '13372') --English
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '00256') --English as a second language (ESL)
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Foreign Language and Literature', '00546') --Foreign Languages
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '73088') --History Government - US
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '73089') --History Government - World
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English Language Arts', '00554') --Language arts
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Mathematics', '01166') --Mathematics
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Reading', '00560') --Reading
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Critical Reading', '00560') --Reading
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English Language Arts', '13373') --Reading/Language Arts
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Science', '00562') --Science
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Life and Physical Sciences', '73086') --Science - Life
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '73087') --Science - Physical
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Social Sciences and History', '13374') --Social Sciences (History, Geography, Economics, Civics and Government)
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '02043') --Special education
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Writing', '01287') --Writing
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Other', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Composite', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Social Studies', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Physical, Health, and Safety Education', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Religious Education and Theology', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Military Science', '09999') --Other
end


-- RefAssessmentType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Achievement test', 'AchievementTest')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Advanced Placement', 'AdvancedPlacementTest')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Alternate assessment/ELL', 'AlternateAssessmentELL')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Alternate assessment/grade-level standards', 'AlternateAssessmentGradeLevelStandards')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Alternative assessment/modified standards', 'AlternativeAssessmentModifiedStandards')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Aptitude test', 'AptitudeTest')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Benchmark test', 'Benchmark')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Cognitive and perceptual skills test', 'CognitiveAndPerceptualSkills')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'ComputerAdaptiveTest')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Developmental observation', 'DevelopmentalObservation')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Diagnostic', 'Diagnostic')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'DirectAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Formative', 'Formative')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'GrowthMeasure')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Interim', 'Interim')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'KindergartenReadiness')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Language proficiency test', 'LanguageProficiency')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Mental ability (intelligence) test', 'MentalAbility')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'Observation')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'ParentReport')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Performance assessment', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State assessment', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State summative assessment 3-8 general', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State alternative assessment/grade-level standards', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State alternative assessment/modified standards', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State high school subject assessment', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State high school course assessment', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Portfolio assessment', 'PortfolioAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Prekindergarten Readiness', 'PrekindergartenReadiness')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Reading readiness test', 'ReadingReadiness')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'Screening')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'TeacherReport')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Attitudinal test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Class test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Class quiz', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'College entrance exam', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Approaches toward learning', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Cognition and general knowledge', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Language and literacy development', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Physical well-being and motor dev', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Social and emotional development', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'English proficiency screening test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Foreign language proficiency test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Interest inventory', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'International Baccalaureate', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Manual dexterity test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Personality test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Psychological test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State English proficiency test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State alternate assessment/ELL', 'Other')

end

 --RefFoodServiceEligibility - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefFoodServiceEligibility')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'FullPrice', 'FullPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Free', 'Free')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'ReducedPrice', 'ReducedPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Other', 'Other')

end

 --RefLeaType - Source = edfi (Note: This had to be extended in Ed-Fi and CEDS Valules were used as enumerations)
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefLeaType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'RegularNotInSupervisoryUnion', 'RegularNotInSupervisoryUnion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'RegularInSupervisoryUnion', 'RegularInSupervisoryUnion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'SupervisoryUnion', 'SupervisoryUnion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'SpecializedPublicSchoolDistrict', 'SpecializedPublicSchoolDistrict')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'ServiceAgency', 'ServiceAgency')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'StateOperatedAgency', 'StateOperatedAgency')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'FederalOperatedAgency', 'FederalOperatedAgency')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'Other', 'Other')

end


-- RefMilitaryConnectedStudentIndicator - Source = edfi
--if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMilitaryConnectedStudentIndicator')
--begin
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'NotMilitaryConnected')
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'ActiveDuty')
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'NationalGuardOrReserve')
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'Unknown')

--end


-- RefDisciplinaryReason- Source = edfi
-- Includes Extended Codes
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisciplineReason')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'DrugRelated', 'DrugRelated') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'AlcoholRelated', 'AlcoholRelated') 	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'WeaponsPossession', 'WeaponsPossession') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'WithPhysicalInjury', 'WithPhysicalInjury')  
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'WithoutPhysiclInjury', 'WithoutPhysiclInjury') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '01', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '02', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '03', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '04', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '09', 'DrugRelated')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '21', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '46', 'Other')

end

-- RefDisciplineMethodofCWD - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisciplineMethodOfCwd')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'Expulsion with Services', 'OutOfSchool') -- Out of School suspensions/Expulsions
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'Expulsion', 'OutOfSchool') -- Out of School suspensions/Expulsions
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'Out-Of-School Suspension', 'OutOfSchool') -- Out of School suspensions/Expulsions
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'Out of School Suspension', 'OutOfSchool') -- Out of School suspensions/Expulsions
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'In School Suspension', 'InSchool') --In School Suspensions 	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'In-School Suspension', 'InSchool') --In School Suspensions 	
end

-- RefDisciplinaryActionTaken - Source = edfi
-- Includes extended codes
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisciplinaryActionTaken')
begin
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03071') --Bus Suspension
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03072') --Change of placement (long-term)	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03073') --Change of placement (reassignment), pending an expulsion hearing
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03074') --Change of placement (reassignment), resulting from an expulsion hearing
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03075') --Change of placement (reassignment), temporary
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Community Service', '03076') --Community service
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03077') --Conference with and warning to student	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03078') --Conference with and warning to student and parent/guardian
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03079') --Confiscation of contraband
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03080') --Conflict resolution or anger management services mandated	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03081') --Corporal punishment
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03082') --Counseling mandated	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03083') --Demerit
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03084') --Detention
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03085') --expulsion recommendation
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Expulsion with Services', '03086') --Expulsion with services
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Expulsion', '03087') --Expulsion without services
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03088') --Juvenile justice referral
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03089') --Law enforcement referral
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03090') --letter of apology
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03091') --Loss of privileges
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '13357') --Mechanical Restraint
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03105') --No action
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'No action for incident', '09998') --None
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Other', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Partial Day Out-Of-School Suspension', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Removal from Classroom', '09999') --Other
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03092') --Physical activity
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '13358') --Physical Restraint
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03158') --Removal by a hearing officer
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03093') --Reprimand
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03094') --Restitution
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03095') --Saturday school
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03096') --School probation
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '13359') --Seclusion
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03097') --Substance abuse counseling mandated
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03098') --Substance abuse treatment mandated
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03099') --Suspension after school
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'In School Suspension', '03100') --Suspension, in-school
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'In-School Suspension', '03100') --Suspension, in-school
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03154') --Suspension, out of school, greater than 10 consecutive school days
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03155') --Suspension, out of school, spearate days cumulating to more than 10 school days
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Out-Of-School Suspension', '03101') --Suspension, out of school with services
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Out of School Suspension', '03101') --Suspension, out of school with services
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03102') --Supension, out of school, without services
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'InterimRemovalDrugs', '03157') --Unilateral removal - drug incident
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'InterimRemovalWeapons', '03156') --Unilateral removal - weapon incident
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '09997') --Unknown
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03103') --Unsatisfactory behavior grade
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03104') --Work detail
end

 --RefIDEAInterimRemoval - Source = edfi
 --Includes extended codes
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIDEAInterimRemoval')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, Outputcode) values
	(2018, 'RefIDEAInterimRemoval', null, 'InterimRemovalDrugs', 'REMDW') --Removal for drugs, weapons, or serious bodily injury
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, Outputcode) values
	(2018, 'RefIDEAInterimRemoval', null, 'InterimRemovalWeapons', 'REMDW') --Removal for drugs, weapons, or serious bodily injury
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, Outputcode) values
	(2018, 'RefIDEAInterimRemoval', null, 'InterimRemovalSeriousBodilyInjury', 'REMDW') --Removal for drugs, weapons, or serious bodily injury
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAInterimRemoval', null, 'InterimRemovalHearingOfficer', 'REMHO') --Removed based on a Hearing Officer finding
end

 --RefIDEAInterimRemovalReason - Source = edfi
 --Includes extended codes
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'IDEAInterimRemovalReason')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'IDEAInterimRemovalReason', null, 'InterimRemovalDrugs', 'Drugs')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'IDEAInterimRemovalReason', null, 'InterimRemovalWeapons', 'Weapons') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'IDEAInterimRemovalReason', null, 'InterimRemovalSeriousBodilyInjury', 'SeriousBodilyInjury')
end


 --RefPersonStatusType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPersonStatusType')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonStatusType', null, 'Homeless', 'HomelessUnaccompaniedYouth') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonStatusType', null, 'Migrant', 'Migrant') 
end


 --RefSharedTimeIndicator - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSharedTimeIndicator')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSharedTimeIndicator', null, 'Yes', 'Yes') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSharedTimeIndicator', null, 'No', 'No') 
end

 --RefNSLPStatus - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefNSLPStatus')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPWOPRO', 'NSLPWOPRO') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPPRO1', 'NSLPPRO1')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPPRO2', 'NSLPPRO2') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPPRO3', 'NSLPPRO3') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPCEO', 'NSLPCEO') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPNO', 'NSLPNO') 
end

 --RefReconstitutedStatus - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefReconstitutedStatus')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefReconstitutedStatus', null, 'Yes', 'Yes') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefReconstitutedStatus', null, 'No', 'No') 
end

 --RefVirtualSchoolStatus - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefVirtualSchoolStatus')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefVirtualSchoolStatus', null, 'FaceVirtual', 'FaceVirtual') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefVirtualSchoolStatus', null, 'FullVirtual', 'FullVirtual')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefVirtualSchoolStatus', null, 'NotVirtual', 'NotVirtual') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefVirtualSchoolStatus', null, 'SupplementalVirtual', 'SupplementalVirtual') 
end

 --RefTitleIProgramStaffCategory - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefTitleIProgramStaffCategory')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleITeacher', 'TitleITeacher') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleIParaprofessional', 'TitleIParaprofessional') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleISupportStaff', 'TitleISupportStaff') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleIAdministrator', 'TitleIAdministrator') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleIOtherParaprofessional', 'TitleIOtherParaprofessional') 
end

 --RefSpecialEducationAgeGroupTaught - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSpecialEducationAgeGroupTaught')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationAgeGroupTaught', null, '3TO5', '3TO5') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationAgeGroupTaught', null, '6TO21', '6TO21') 
end

 --RefParaprofessionalQualification - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefParaprofessionalQualification')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Certification', 'Qualified')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Endorsement', 'NotQualified')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Licensure', 'NotQualified')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Other', 'NotQualified')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Registration', 'NotQualified')

end

 --RefSpecialEducationStaffCategory - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSpecialEducationStaffCategory')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'PSYCH', 'PSYCH') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'SOCIALWORK', 'SOCIALWORK')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'OCCTHERAP', 'OCCTHERAP') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'AUDIO', 'AUDIO') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'PEANDREC', 'PEANDREC') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'PHYSTHERAP', 'PHYSTHERAP') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'SPEECHPATH', 'SPEECHPATH') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'INTERPRET', 'INTERPRET') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'COUNSELOR', 'COUNSELOR') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'ORIENTMOBIL', 'ORIENTMOBIL') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'MEDNURSE', 'MEDNURSE') 
end


 --RefTitleIIndicator - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefTitleIIndicator')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Local Neglected Program', '04') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Public Schoolwide Program', '02') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Public Targeted Assistance Program', '01') 
end




-------------------------------------------------------------------------------------------------
----Install the Stored Procedures
-------------------------------------------------------------------------------------------------


----Migrate_Data_Validation

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_Validation]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_Validation') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_Validation]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_Validation]
	  @ETLName VARCHAR(100)
	, @StagingTableName VARCHAR(100)
	, @SchoolYear SMALLINT
AS

/*************************************************************************************************************
Date Created:  2/12/2018

Purpose:
    This stored procedure contains all of the validation rules for the Staging tables and populates the Staging.ValidationErorrs table

Assumptions:
        

Account executed under: LOGIN

Approximate run time:  ~ 5 seconds

Data Sources:  Staging tables in the generate database

Data Targets:  Generate Database:   Staging.ValidationErrors

Return Values:
    	0	= Success
    All Errors are Thrown via Try/Catch Block	
  
Example Usage: 
    EXEC App.[Migrate_Data_Validation];
    
Modification Log:
    #	  Date		    Developer	  Issue#	 Description
    --  ----------  ----------  -------  --------------------------------------------------------------------
    01		  	 
*************************************************************************************************************/
BEGIN

	--Delete records from the previous run for this ETL & Table Name
	DELETE FROM Staging.ValidationErrors 
	WHERE ETLName = @ETLName 
	AND StagingTableName = @StagingTableName


	DECLARE @ColumnName VARCHAR(100), @SQL VARCHAR(MAX), @PrimaryKeyField VARCHAR(100)
		
	SELECT @PrimaryKeyField = Col.Column_Name 
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS Tab
	JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE Col 
		ON Col.Constraint_Name = Tab.Constraint_Name
	WHERE Col.Table_Name = Tab.Table_Name
		AND Constraint_Type = 'PRIMARY KEY'
		AND Col.TABLE_SCHEMA = 'Staging'
		AND Col.Table_Name = @StagingTableName

		
	SET @SQL = 'IF (SELECT COUNT(*) FROM Staging.' + @StagingTableName + ') = 0 BEGIN INSERT INTO Staging.ValidationErrors VALUES (''' + @ETLName + ''', ''' + @StagingTableName + ''', NULL, ''"' + @StagingTableName + '" table did not populate'', NULL, NULL) END'

	EXECUTE(@SQL)

	DECLARE SourceColumnList CURSOR FOR
	SELECT DISTINCT C.Name 
	FROM sys.extended_properties EP
	LEFT JOIN sys.all_objects O ON ep.major_id = O.object_id 
	LEFT JOIN sys.schemas S on O.schema_id = S.schema_id
	LEFT JOIN sys.columns AS c ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
	WHERE S.Name = 'Staging' 
		AND O.Name = @StagingTableName
		AND (ep.Name = 'Lookup'
			OR ep.Name = 'Required')

	OPEN SourceColumnList

	FETCH NEXT FROM SourceColumnList
	INTO @ColumnName

	WHILE @@FETCH_STATUS = 0  
	BEGIN	
		--Table contains data, but element is empty
		SET @SQL = 'INSERT INTO Staging.ValidationErrors SELECT ''' + @ETLName + ''', ''' + @StagingTableName + ''', ''' + @ColumnName + ''', ''' + @ColumnName + ' is required, but a record was found without a value'', ' + @PrimaryKeyField + ', NULL FROM Staging.' + @StagingTableName + ' WHERE ' + @ColumnName + ' IS NULL'

		EXECUTE(@SQL)


		-- Validate that all lookup values have a corresponding value in ODS.SourceSystemReferenceData
		DECLARE @LookupTable VARCHAR(100), @TableFilter VARCHAR(100)
		SET @LookupTable = null
		SET @TableFilter = NULL

		SELECT @LookupTable = CONVERT(VARCHAR(100), ep.Value)
		FROM sys.extended_properties EP
		JOIN sys.all_objects O ON ep.major_id = O.object_id 
		JOIN sys.schemas S on O.schema_id = S.schema_id
		JOIN sys.columns AS c ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
		WHERE S.Name = 'Staging' 
			AND O.Name = @StagingTableName 
			AND C.Name = @ColumnName 
			AND ep.Name = 'Lookup'

		SELECT @TableFilter = CONVERT(VARCHAR(100), ep.Value)
		FROM sys.extended_properties EP
		JOIN sys.all_objects O ON ep.major_id = O.object_id 
		JOIN sys.schemas S on O.schema_id = S.schema_id
		JOIN sys.columns AS c ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
		WHERE S.Name = 'Staging' 
			AND O.Name = @StagingTableName 
			AND C.Name = @ColumnName 
			AND ep.Name = 'TableFilter'

		IF (@LookupTable IS NOT NULL AND @LookupTable <> '') BEGIN
			SET @SQL = 'INSERT INTO Staging.ValidationErrors '
			SET @SQL = @SQL + 'SELECT ''' + @ETLName + ''', ''' + @StagingTableName + ''', ''' + @ColumnName + ''', ''No match for lookup value "'' + stg.' + @ColumnName + ' + ''" in ODS.SourceSystemReferenceData for Staging.' + @StagingTableName + '.' + @ColumnName + ''', ' + @PrimaryKeyField + ', NULL '
			SET @SQL = @SQL + 'FROM Staging.' + @StagingTableName + ' stg '
			SET @SQL = @SQL + 'LEFT JOIN ODS.SourceSystemReferenceData ref ON ref.TableName = ''' + @LookupTable + ''' AND InputCode = stg.' + @ColumnName + ' '
			IF (@TableFIlter IS NOT NULL) BEGIN
				SET @SQL = @SQL + ' AND ref.TableFilter = ''' + @TableFilter + ''' '
			END
			SET @SQL = @SQL + 'WHERE stg.' + @ColumnName + ' IS NOT NULL AND ref.OutputCode IS NULL'

			EXECUTE(@SQL)
		END

		
		FETCH NEXT FROM SourceColumnList
		INTO @ColumnName
	END 

	DEALLOCATE SourceColumnList
			
	--Apply the same getdate/time to every record recorded for this ETL & Table Name
	UPDATE Staging.ValidationErrors
	SET CreateDate = GETDATE()
	WHERE ETLName = @ETLName
	AND StagingTableName = @StagingTableName

END



----Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]    Script Date: 5/31/2018 2:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]
AS
BEGIN

	BEGIN TRY
	
		set nocount on;

    /*************************************************************************************************************
    Created by:    Duane Brown | duane.brown@aemcorp.com | CIID (https://ciidta.grads360.org/#program)
    Date Created:  12/19/2017

    Purpose:
        The purpose of this ETL is to clean the Generate ODS data store in preparation for
        a new run of the ETL process to populate the Generate ODS. After removing records,
        all tables will be reseeded.

    Assumptions:
        None

    Account executed under: LOGIN

    Approximate run time:  ~ 45 seconds

    Data Sources:  N/A

    Data Targets:  Generate Database: Generate

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_STEP01_CompletelyClearDataFromODS];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/


        /* REMOVE ALL DATA FROM THE ODS */
          -----------------------------

		  
		TRUNCATE TABLE ODS.K12StudentDiscipline
		TRUNCATE TABLE ODS.ProgramParticipationSpecialEducation
		TRUNCATE TABLE ODS.ProgramParticipationTitleIIILEp
		TRUNCATE TABLE ODS.ProgramParticipationMigrant
		TRUNCATE TABLE ODS.ProgramParticipationCte
		TRUNCATE TABLE ODS.ProgramParticipationTitleI
		TRUNCATE TABLE ODS.PersonLanguage
		TRUNCATE TABLE ODS.PersonStatus
		TRUNCATE TABLE ODS.PersonIdentifier
		TRUNCATE TABLE ODS.PersonDisability
		TRUNCATE TABLE ODS.PersonDemographicRace
		TRUNCATE TABLE ODS.OrganizationRelationship
		TRUNCATE TABLE ODS.OrganizationProgramType
		TRUNCATE TABLE ODS.PersonDetail
		TRUNCATE TABLE ODS.StaffCredential
		TRUNCATE TABLE ODS.K12StudentEnrollment
		TRUNCATE TABLE ODS.AssessmentResult_PerformanceLevel
		TRUNCATE TABLE ODS.AssessmentAdministration_Organization
		TRUNCATE TABLE ODS.K12LeaTitleISupportService
		TRUNCATE TABLE ODS.K12OrganizationStudentResponsibility
		TRUNCATE TABLE ODS.K12StudentCohort
		TRUNCATE TABLE ODS.AeStaff
		TRUNCATE TABLE ODS.PersonEmailAddress
		TRUNCATE TABLE ODS.PersonTelephone
		TRUNCATE TABLE ODS.LocationAddress
		TRUNCATE TABLE ODS.OrganizationLocation
		TRUNCATE TABLE ODS.OrganizationTelephone
		TRUNCATE TABLE ODS.OrganizationWebsite
		TRUNCATE TABLE ODS.OrganizationIndicator
		TRUNCATE TABLE ODS.OrganizationOperationalStatus
		TRUNCATE TABLE ODS.K12ProgramOrService
		TRUNCATE TABLE ODS.K12SchoolStatus
		TRUNCATE TABLE ODS.K12SchoolGradeOffered
		TRUNCATE TABLE ODS.OrganizationFederalAccountability
		TRUNCATE TABLE ODS.K12LEAFederalFunds
		TRUNCATE TABLE ODS.K12FederalFundAllocation
		TRUNCATE TABLE ODS.K12SchoolImprovement
		TRUNCATE TABLE ODS.WorkforceProgramParticipation
		TRUNCATE TABLE ODS.WorkforceEmploymentQuarterlyData
		TRUNCATE TABLE ODS.K12TitleIIILanguageInstruction

		DELETE FROM ODS.K12CharterSchoolApprovalAgency
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.K12CharterSchoolApprovalAgency'', RESEED, 1);'
		DELETE FROM ODS.K12CharterSchoolManagementOrganization
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.K12CharterSchoolManagementOrganization'', RESEED, 1);'
		DELETE FROM ODS.OrganizationDetail WHERE OrganizationId <> 0 
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.OrganizationDetail'', RESEED, 1);'
		DELETE FROM ODS.OrganizationCalendarSession --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.OrganizationCalendar --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.K12School --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.Incident --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.StaffEmployment --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.PersonProgramParticipation --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonProgramParticipation'', RESEED, 1);'
		DELETE FROM ODS.AssessmentResult
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentResult'', RESEED, 1);'
		DELETE FROM ODS.AssessmentPerformanceLevel
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentPerformanceLevel'', RESEED, 1);'
		DELETE FROM ODS.AssessmentRegistration
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentRegistration'', RESEED, 1);'
		DELETE FROM ODS.AssessmentAdministration
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentAdministration'', RESEED, 1);'
		DELETE FROM ODS.AssessmentSubtest
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentSubtest'', RESEED, 1);'
		DELETE FROM ODS.AssessmentForm
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.AssessmentForm'', RESEED, 1);'
		DELETE FROM ODS.Assessment
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.Assessment'', RESEED, 1);'
		DELETE FROM  ODS.OrganizationPersonRole --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.OrganizationPersonRole'', RESEED, 1);'
		DELETE FROM  ODS.K12StaffAssignment --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.K12StaffAssignment'', RESEED, 1);'
		DELETE FROM  ODS.PersonCredential --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.PersonCredential'', RESEED, 1);'
		TRUNCATE TABLE ODS.OrganizationIdentifier
		DELETE FROM ODS.Person --Cannot truncate; referenced by foreign key constraint
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.Person'', RESEED, 1);'
		DELETE FROM ODS.Organization WHERE OrganizationId NOT IN (0, 1) --Cannot trucnate and add record back int because it is referenced by a foreign Key constraint.
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.Organization'', RESEED, 1);'
		DELETE FROM ODS.[Location] --Cannot trucnate and add record back int because it is referenced by a foreign Key constraint.
		EXEC sp_executesql N'DBCC CHECKIDENT(''ODS.Location'', RESEED, 1);'

		RETURN 0;

		set nocount off;


	END TRY
	BEGIN CATCH

		declare @msg as nvarchar(max)
		set @msg = ERROR_MESSAGE()

		declare @sev as int
		set @sev = ERROR_SEVERITY()

		RAISERROR(@msg, @sev, 1)

	END CATCH; 

END














----Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization]
	@SchoolYear SMALLINT
	AS 
	BEGIN


		-- Clean out the staging data from the last run.
		TRUNCATE TABLE Staging.StateDetail
		TRUNCATE TABLE Staging.Organization
		TRUNCATE TABLE Staging.OrganizationAddress
		TRUNCATE TABLE Staging.OrganizationGradeOffered
		TRUNCATE TABLE Staging.OrganizationPhone
		TRUNCATE TABLE Staging.OrganizationFederalFunding


		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------Begin State Specific Information Section----------------------------------------
		---------------------------------------------------------------------------------------------------------------------
		----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
		----created to work with the data standardized in this location. Do not make any changes to table names or column----
		----names or to any of the code after this section.  The only information that should be modified is the source  ----
		----of this information.  Codeset mapping is configured in ODS.EdFiReferenceData. -----------------------------------
		---------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------------------------------------------------------------------


		/* Build Up Staging tables with all organization data
		-------------------------------------------
		In this section, the staging tables will be loaded with state specific
		data. Any adjustment or customizations to this data specific to the state
		will be run immediately following the population of these tables.  All other
		processes following those customizations will be standard across generate
		states and do not require any further adjustment unless something in generate
		or CEDS is modified.
		
		*/


		--Insert SEA Details--
		INSERT INTO Staging.StateDetail
		SELECT DISTINCT
			  NULL OrganizationId
			, 'Nebraska' StateName
			, sat.CodeValue StateCode
			, edorg.NameOfInstitution SeaName
			, edorg.ShortNameOfInstitution SeaShortName
			, StateOrganizationId SeaStateIdentifier
			, edorg.WebSite Sea_WebSiteAddress
			, 'John' SeaContact_FirstName
			, 'Doe' SeaContact_LastOrSurname
			, 'Mr.' SeaContact_PersonalTitleOrPrefix
			, 'John.Doe@txdoe.edu' SeaContact_ElectronicMailAddress
			, '5554127389' SeaContact_PhoneNumber
			,  NEWID() SeaContact_Identifier
			, NULL PersonId
			, NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateEducationAgency sea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg
			ON sea.StateEducationAgencyId = edorg.EducationOrganizationID
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationAddress edorgadd
			ON edorg.EducationOrganizationId = edorgadd.EducationOrganizationid
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].AddressType aty
			ON edorgadd.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateAbbreviationType sat
			ON edorgadd.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
		WHERE aty.CodeValue = 'Physical'
		

		--Insert Organization Information--
		INSERT Staging.Organization
		SELECT DISTINCT
			 edorglea.StateOrganizationId LEA_Identifier_State
			,leancesid.IdentificationCode AS LEA_Identifier_NCES
			,NULL LEA_SupervisoryUnionIdentificationNumber
			,edorglea.NameOfInstitution LEA_Name
			,edorglea.WebSite LEA_WebSiteAddress
			,ostlea.CodeValue LEA_OperationalStatus
			,App.GetFiscalYearStartDate(@SchoolYear) AS LEA_OperationalStatusEffectiveDate
			,leacst.CodeValue LEA_CharterSchoolIndicator
			,NULL LEA_Type
			,edorgschool.StateOrganizationId School_Identifier_State
			,schncesid.IdentificationCode AS School_Identifier_NCES
			,edorgschool.NameOfInstitution School_Name
			,edorgschool.WebSite School_WebSiteAddress
			,ostschool.CodeValue School_OperationalStatus
			,App.GetFiscalYearStartDate(@SchoolYear) School_OperationalStatusEffectiveDate
			,st.CodeValue School_Type
			,NULL School_MagnetOrSpecialProgramEmphasisSchool
			,NULL School_SharedTimeIndicator
			,NULL School_VirtualSchoolStatus
			,NULL School_NationalSchoolLunchProgramStatus
			,NULL School_ReconstitutedStatus
			,NULL School_CharterSchoolApprovalAgencyType
			,schcst.CodeValue School_CharterSchoolIndicator
			,@SchoolYear AS SchoolYear
			,NULL LEAOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SEAOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SpecialEducationProgramOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL TitleIProgramOrganizationId
			,NULL MigrantProgramOrganizationId
			,NULL FosterProgramOrganizationId
			,0 NewLEA -- Leave this value 0, the Code below will populate as necessary
			,0 NewSchool -- Leave this value 0, the Code below will populate as necessary
			,0 NewSpecialEducationProgram -- Leave this value 0, the Code below will populate as necessary
			,0 NewTitleIProgram
			,0 NewMigrantProgram
			,0 NewFosterProgram
			,0 LEA_Identifier_State_ChangedIdentifier -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_Identifier_State_Identifier_Old -- Only populate if an LEA State Identifier has changed, otherwise NULL
			,0 School_Identifier_State_ChangedIdentifier -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_Identifier_State_Identifier_Old -- Only populate if a School State Identifier has changed, otherwise NULL
			,NULL SEAToLEA_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEAToSchool_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolToSpecialEducationProgram_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolToTitleIProgram_OrganizationRelationshipId
			,NULL SchoolToMigrantProgram_OrganizationRelationshipId
			,NULL SchoolToFosterProgram_OrganizationRelationshipId
			,NULL LEA_OrganizationWebsiteId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationWebsiteId -- Leave this value NULL, the Code below will populate as necessary
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SchoolType st ON sch.SchoolTypeId = st.SchoolTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].OperationalStatusType ostlea ON edorglea.OperationalStatusTypeId = ostlea.OperationalStatusTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].OperationalStatusType ostschool ON edorgschool.OperationalStatusTypeId = ostschool.OperationalStatusTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].CharterStatusType leacst ON lea.CharterStatusTypeId = leacst.CharterStatusTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].CharterStatusType schcst ON sch.CharterStatusTypeId = schcst.CharterStatusTypeId
		-- LEA NCES IDs
		LEFT JOIN (
			SELECT 
				  edorgidcodelea.EducationOrganizationId
				, edorgidcodelea.IdentificationCode
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgidcodelea 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemDescriptor edorgidsdlea ON edorgidcodelea.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdlea.EducationOrganizationIdentificationSystemDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemType edorgidstlea ON edorgidsdlea.EducationOrganizationIdentificationSystemTypeId = edorgidstlea.EducationOrganizationIdentificationSystemTypeId 
				AND edorgidstlea.CodeValue = 'NCES'
		) leancesid ON edorglea.EducationOrganizationId = leancesid.EducationOrganizationId
		-- School NCES IDs
		LEFT JOIN (
			SELECT 
				  edorgidcodesch.EducationOrganizationId
				, edorgidcodesch.IdentificationCode
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgidcodesch 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemDescriptor edorgidsdsch ON edorgidcodesch.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdsch.EducationOrganizationIdentificationSystemDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationSystemType edorgidstsch ON edorgidsdsch.EducationOrganizationIdentificationSystemTypeId = edorgidstsch.EducationOrganizationIdentificationSystemTypeId
				AND edorgidstsch.CodeValue = 'NCES'
		) schncesid ON edorgschool.EducationOrganizationId = schncesid.EducationOrganizationId

	  


		--Note if it requires multiple inserts/updates to populate this table, do that in this location.
		--Every LEA and school that will be reported on directory (FS029) should be included in this table including those
		--schools/LEAs that will be reported as closed.

		--The purpose of the _ChangedIdentifier and _Identifier_Old is for when a state modifies the LEA or School identifier from one year to the next
		--but the entity will remain the same.  Example - the school's state identifer last year was AB123, but the state has decided to change their
		--identification system to numbers only.  So instead of AB123, this same schools state identifer is now just 99123. The bit value will indicate 
		--true (1) that an identifier has changed from last year to this year and the _Identifier_Old will indicate what the identifier was previously
		--Generate will treat this as an identifier change, but will leave the entity as a single organization.  Without this, Generate would treat this
		--as an entirly new organization.  Note: there is a process just below the state specific information section that uses the NCES ID to discover
		--these changes as well in case the source system is unable to supply the old identifier.


		--SEA  Address--
		INSERT INTO Staging.OrganizationAddress
		SELECT DISTINCT
			 edorgsea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('SEA', '001156') AS OrganizationType
			,aty.CodeValue AddressTypeForOrganization
			,edorgaddress.StreetNumberName AddressStreetNumberAndName
			,edorgaddress.ApartmentRoomSuiteNumber AddressApartmentRoomOrSuite
			,edorgaddress.City AddressCity
			,App.GetRefStateID(sat.CodeValue) RefStateId
			,App.GetRefStateAnsiCode(sd.Description) AddressStateANSICode
			,edorgaddress.PostalCode AddressPostalCode
			,NULL OrganizationId
			,NULL LocationId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateEducationAgency sea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgsea ON sea.StateEducationAgencyId = edorgsea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationAddress edorgaddress ON edorgsea.EducationOrganizationId = edorgaddress.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].AddressType aty ON edorgaddress.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateAbbreviationType sat ON edorgaddress.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
		JOIN ODS.RefState sd ON sat.CodeValue = sd.Code
		WHERE edorgaddress.StreetNumberName IS NOT NULL
		AND edorgaddress.StreetNumberName <> ''
		AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')

	
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current address information - if it is different from previous years address information, the ETL code below will end date the
		--address for this address type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they will be end
		--dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--LEA Address--
		INSERT INTO Staging.OrganizationAddress
		SELECT DISTINCT
				edorglea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('LEA', '001156') OrganizationType
			,aty.CodeValue AddressTypeForOrganization
			,edorgaddress.StreetNumberName AddressStreetNumberAndName
			,edorgaddress.ApartmentRoomSuiteNumber AddressApartmentRoomOrSuite
			,edorgaddress.City AddressCity
			,App.GetRefStateID(sat.CodeValue) RefStateId
			,App.GetRefStateAnsiCode(sd.Description) AddressStateANSICode
			,edorgaddress.PostalCode AddressPostalCode
			,NULL OrganizationId
			,NULL LocationId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationAddress edorgaddress ON edorglea.EducationOrganizationId = edorgaddress.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].AddressType aty ON edorgaddress.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateAbbreviationType sat ON edorgaddress.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
		JOIN ODS.RefState sd ON sat.CodeValue = sd.Code
		WHERE edorgaddress.StreetNumberName IS NOT NULL
		AND edorgaddress.StreetNumberName <> ''
		AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current address information - if it is different from previous years address information, the ETL code below will end date the
		--address for this address type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they will be end
		--dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--School Address--
		INSERT INTO Staging.OrganizationAddress
		SELECT DISTINCT
				edorgschool.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('K12School', '001156') OrganizationType
			,aty.CodeValue AddressTypeForOrganization
			,edorgaddress.StreetNumberName AddressStreetNumberAndName
			,edorgaddress.ApartmentRoomSuiteNumber AddressApartmentRoomOrSuite
			,edorgaddress.City AddressCity
			,App.GetRefStateID(sat.CodeValue) RefStateId
			,App.GetRefStateAnsiCode(sd.Description) AddressStateANSICode
			,edorgaddress.PostalCode AddressPostalCode
			,NULL OrganizationId
			,NULL LocationId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationAddress edorgaddress ON edorgschool.EducationOrganizationId = edorgaddress.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].AddressType aty ON edorgaddress.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateAbbreviationType sat ON edorgaddress.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
		JOIN ODS.RefState sd ON sat.CodeValue = sd.Code
		WHERE edorgaddress.StreetNumberName IS NOT NULL
		AND edorgaddress.StreetNumberName <> ''
		AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current address information - if it is different from previous years address information, the ETL code below will end date the
		--address for this address type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they will be end
		--dated on June 30, xxxx and the new record will begin July 1, xxxx.



		--Insert Telephone Information--

		--SEA Telephone--
		INSERT INTO Staging.OrganizationPhone
		SELECT DISTINCT
				edorgsea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('SEA', '001156') AS OrganizationType
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StateEducationAgency sea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgsea ON sea.StateEducationAgencyId = edorgsea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorgsea.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].InstitutionTelephoneNumberType itnt ON edorgphone.InstitutionTelephoneNumberTypeId = itnt.InstitutionTelephoneNumberTypeId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeId IS NOT NULL
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current phone information - if it is different from previous years telephone information, the ETL code below will end date the
		--telephone for this telephone number type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--LEA Telephone--
		INSERT INTO Staging.OrganizationPhone
		SELECT DISTINCT
				edorglea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('LEA', '001156') OrganizationType
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorglea.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].InstitutionTelephoneNumberType itnt ON edorgphone.InstitutionTelephoneNumberTypeId = itnt.InstitutionTelephoneNumberTypeId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeId IS NOT NULL
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current phone information - if it is different from previous years telephone information, the ETL code below will end date the
		--telephone for this telephone number type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.

		--School Telephone--
		INSERT INTO Staging.OrganizationPhone
		SELECT DISTINCT
				edorgschool.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('K12School', '001156') OrganizationType
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorgschool.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].InstitutionTelephoneNumberType itnt ON edorgphone.InstitutionTelephoneNumberTypeId = itnt.InstitutionTelephoneNumberTypeId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeId IS NOT NULL
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current phone information - if it is different from previous years telephone information, the ETL code below will end date the
		--telephone for this telephone number type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.

		INSERT INTO Staging.OrganizationGradeOffered
		SELECT DISTINCT
				edorgschool.StateOrganizationId OrganizationIdentifier
			,glt.CodeValue GradeOffered
			,NULL OrganizationId -- Leave this value NULL, the code below will populatee as necessary
			,NULL K12SchoolGradeOfferedId -- Leave this value NULL, the code below will populate as necessary
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SchoolGradeLevel sgl ON sch.SchoolId = sgl.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].GradeLevelDescriptor gld ON sgl.GradeLevelDescriptorId = gld.GradeLevelDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].GradeLevelType glt ON gld.GradeLevelTypeId = glt.GradeLevelTypeId
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current Grade offered information - if it is different from previous years Grade offered information, the ETL code below will end date the
		--Grade offered for this organization and start a new record.  The start/end dates will fall on the fiscal year.  So they 
		--will be end dated on June 30, xxxx and the new record will begin July 1, xxxx.


		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.StateDetail SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.StateDetail) > 0
		UPDATE Staging.Organization SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Organization) > 0
		UPDATE Staging.OrganizationAddress SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationAddress) > 0
		UPDATE Staging.OrganizationGradeOffered SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationGradeOffered) > 0
		UPDATE Staging.OrganizationPhone SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationPhone) > 0
		UPDATE Staging.OrganizationFederalFunding SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationFederalFunding) > 0


		-------------------------------------------------------------------------------------------------------------------------
		-------- Begin Validation of Staging Tables included in this ETL --------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------

		----Validate Staging.StateDetail----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'StateDetail', @SchoolYear

		--Validate Staging.Organization
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'Organization', @SchoolYear

		--Validate Staging.OrganizationAddress
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'OrganizationAddress', @SchoolYear

		--Validate Staging.OrganizationGradeOffered
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'OrganizationGradeOffered', @SchoolYear

		--Validate Staging.OrganizationPhone
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'OrganizationPhone', @SchoolYear

		--Validate Staging.OrganizationFederalFunding
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization', 'OrganizationFederalFunding', @SchoolYear


	END



----Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person


GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person]
END

GO

---It would be good to just go ahead and include Staff in this process as well to maintain unique staff ID's
---Inform the process for when/if ID's change - how will that be addressed, perhaps not now, but in the future.
-------will the use of PersonMaster come into play?
-------Note: id's can change so long as the end result - report outcome would be the same?


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person]
	@SchoolYear SMALLINT
	AS

    /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to maintain the unique list of Student & Staff Identifiers assigned by the state
		in the ODS.

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  Ed-Fi ODS: edfi.Student
							  edfi.Staff

    Data Targets:  Generate Database:   Generate.ODS.Person
										Generate.ODS.PersonIdentifier

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;

-------------------------------------Begin State Specific Information Section----------------------------------------
---------------------------------------------------------------------------------------------------------------------
----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
----created to work with the data standardized in this location. Do not make any changes to table names or column----
----names or to any of the code after this section.  The only information that should be modified is the source  ----
----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		TRUNCATE TABLE Staging.Person

		--------------------------------------------------------------------------
        --Pull Student Unique ID's -----------------------------------------------                         
        --------------------------------------------------------------------------
        /*
			Use a location that contains every unique state student identifier available
        */
 
		INSERT INTO Staging.Person
			( Identifier
			, FirstName
			, LastName
			, MiddleName
			, Birthdate
			, [Role]
			, RunDateTime
			)
        SELECT DISTINCT
              REPLACE(StudentUniqueId, ' ', '')
			, FirstName
			, LastSurname
			, MiddleName
			, Birthdate
			, 'K12 Student'
			, NULL RunDateTime
        FROM
			[EdFi_Sample_ODS_Data_For_Generate].[edfi].[Student] 
		WHERE StudentUniqueId IS NOT NULL

		--------------------------------------------------------------------------
        --Pull Staff Unique ID's -----------------------------------------------                         
        --------------------------------------------------------------------------
        /*
			Use a location that contains every unique state staff identifier available
        */

 
		INSERT INTO Staging.Person
			( Identifier
			, FirstName
			, LastName
			, MiddleName
			, Birthdate
			, [Role]
			, RunDateTime
			)
        SELECT DISTINCT
              Identifier = REPLACE(StaffUniqueId, ' ', '')
			, FirstName
			, LastSurname
			, MiddleName
			, Birthdate
			, 'K12 Personnel'
			, NULL RunDateTime
        FROM
			[EdFi_Sample_ODS_Data_For_Generate].[edfi].Staff
		WHERE StaffUniqueId IS NOT NULL

		

---------------------------------------------------------------------------------------------------------------------
-------------------------------------End State Specific Information Section------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Person SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Person) > 0

		----Validate Staging.Person----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person', 'Person', @SchoolYear



    END;







----Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment

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
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor etd ON ssa.ExitWithdrawTypeDescriptorId = etd.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d ON ssa.EntryGradeLevelDescriptorId = d.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentAcademicRecordDiploma sard ON s.StudentUSI = sard.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DiplomaType dt ON sard.DiplomaTypeID = dt.DiplomaTypeId
		WHERE ssa.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
		AND (ssa.EntryDate IS NULL OR ssa.EntryDate <= App.GetFiscalYearEndDate(@SchoolYear))
	
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
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment', 'Enrollment', @SchoolYear

	END








----Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipation

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipation]    Script Date: 6/5/2018 3:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation]
	@SchoolYear SMALLINT
	AS
	BEGIN

			set nocount on;
	
			TRUNCATE TABLE Staging.ProgramParticipationSpecialEducation

	-------------------------------------Begin State Specific Information Section----------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
	----created to work with the data standardized in this location. Do not make any changes to table names or column----
	----names or to any of the code after this section.  The only information that should be modified is the source  ----
	----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

			INSERT INTO Staging.ProgramParticipationSpecialEducation
				(RecordId
				,Student_Identifier_State
				,School_Identifier_State
				,ProgramParticipationBeginDate
				,ProgramParticipationEndDate
				,SpecialEducationExitReason
				,IDEAEducationalEnvironmentForEarlyChildhood
				,IDEAEducationalEnvironmentForSchoolAge
				,PersonID
				,OrganizationID_School
				,OrganizationID_Program
				,OrganizationPersonRoleId_Program
				,PersonProgramParticipationID
				,RunDateTime
				)
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,edorg.StateOrganizationId School_Identifier_State	
				,spa.BeginDate ProgramParticipationBeginDate
				,spa.EndDate ProgramParticipationEndDate
				,d.CodeValue SpecialEducationExitReason
				,NULL IDEAEducationalEnvironmentForEarlyChildhood
				,NULL IDEAEducationalEnvironmentForSchoolAge
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL OrganizationID_Program
				,NULL OrganizationPersonRoleId_Program
				,NULL PersonProgramParticipationID
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentProgramAssociation spa ON s.StudentUSI = spa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].ProgramType pt ON spa.ProgramTypeId = pt.ProgramTypeId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d ON spa.ReasonExitedDescriptorId = d.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSpecialEducationProgramAssociation sepa ON s.StudentUSI = sepa.StudentUSI and spa.BeginDate = sepa.BeginDate
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON sepa.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON edorg.EducationOrganizationId = sch.SchoolId
			WHERE pt.CodeValue = 'Special Education'
			--Add School Age Educational Environment--

			UPDATE Staging.ProgramParticipationSpecialEducation
			SET IDEAEducationalEnvironmentForSchoolAge = spt.CodeValue
			FROM Staging.ProgramParticipationSpecialEducation ppse
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSpecialEducationProgramAssociation sppa ON ppse.RecordId = sppa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SpecialEducationSettingDescriptor spd ON sppa.SpecialEducationSettingDescriptorId = spd.SpecialEducationSettingDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SpecialEducationSettingType spt ON spd.SpecialEducationSettingTypeId = spt.SpecialEducationSettingTypeId
			--Long Term - Need to establish the age of the student since RF and SS can be overlapped.  Right now not an issue because Early Childhood environment only exists in the Descriptor
			--table in Nebraska, but when it becomes native to the SpecialEducationSettingDescriptor, the age will be a factor. Will have to join to the Student, grab the birthdate, and then
			--compare that with the child count date in ToggleResponses to establis the age of the student.
		
			--Add Early Childhood Education Environment--
			----Note: These option set values are not in Ed-Fi Natively. This is using the edfi.Descriptor table to pull these values.

			UPDATE Staging.ProgramParticipationSpecialEducation
			SET IDEAEducationalEnvironmentForEarlyChildhood = d.CodeValue
			FROM Staging.ProgramParticipationSpecialEducation ppse
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSpecialEducationProgramAssociation sppa ON ppse.RecordId = sppa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d ON sppa.SpecialEducationSettingDescriptorId = d.DescriptorId
			--Long Term - Need to establish the age of the student since RF and SS can be overlapped.  Right now not an issue because Early Childhood environment only exists in the Descriptor
			--table in Nebraska, but when it becomes native to the SpecialEducationSettingDescriptor, the age will be a factor. Will have to join to the Student, grab the birthdate, and then
			--compare that with the child count date in ToggleResponses to establis the age of the student.



	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.ProgramParticipationSpecialEducation SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.ProgramParticipationSpecialEducation) > 0

		----Validate Staging.ProgramParticipationSpecialEducation----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation', 'ProgramParticipationSpecialEducation', @SchoolYear


			set nocount off;
	END



----Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount]    Script Date: 6/6/2018 3:19:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount]
END

GO


--Notes --
--Set this up in such a way as to handle when child count and membership occur on different days - note: the dates don't matter, just load the enrollments.
--For Ed-Fi, do we take into account multiple enrollment records and begin storing that way?
--Do we set it up to capture each day and if no changes, continue the NULL end date forward until a change occurs
--with the one above, what if it's a correction - no that should be handled directly in the ODS, not through the ETL
--let the ETL handle the movement of data, not the correction of invalid data in the past.  When they migrate, they are looking for what
--has changed since the last time.  Perhaps there needs to be two methodoligies here
--1. Do not change anything in history, but end date records as of today
--2. Change history based on the picture we have today in the Ed-Fi ODS
--3. Possibly a hybrid of those - change history unless it affects the following dates (e.g. October 1st - do not change that history)
--4. Change only certain items (turn them on/off based on the state methodology?)
--5. Preset the items that can/cannot change?

--This entire thing needs comparison language to update instead of insert and enddate items that have changed i.e. the methodology above



CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load the data for membership (C052) and Special Education Child Count
			(C002, C089).

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;

	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------Begin State Specific Information Section----------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
	----created to work with the data standardized in this location. Do not make any changes to table names or column----
	----names or to any of the code after this section.  The only information that should be modified is the source  ----
	----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

			TRUNCATE TABLE Staging.MembershipChildCount
			TRUNCATE TABLE Staging.MembershipRace
			TRUNCATE TABLE Staging.PrimaryDisability
			
			-----------------------------------------------------
			----Populate Temporary table                      ---
			-----------------------------------------------------

			INSERT INTO Staging.MembershipChildCount
						 (RecordId
						,School_Identifier_State
						,Student_Identifier_State
						,LastName
						,FirstName 
						,Birthdate
						,PrimaryDisability
						,RaceEthnicityQuestion_Hispanic
						,Sex
						,EnglishLearnerStatus
						,IDEAStatus
						,ISO_639_2_NativeLanguage
						,EligibilityStatusForSchoolFoodServicePrograms
						,NationalSchoolLunchProgramDirectCertificationIndicator
						,PersonID
						,PersonDetailID
						,PersonDisabilityId
						,PersonLanguageId
						,PersonStatusId_IDEA
						,PersonStatusId_LEP
						,OrganizationID_School
						,OrganizationPersonRoleID_School
						,OrganizationID_SpecialEducationProgram
						,RunDateTime
						)
			SELECT DISTINCT
						 s.StudentUSI RecordId
						,edorgschool.StateOrganizationId School_Identifier_State 
						,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
						,s.LastSurName LastName
						,s.FirstName FirstName 
						,s.BirthDate Birthdate
						,NULL PrimaryDisability
						,s.HispanicLatinoEthnicity RaceEthnicityQuestion_Hispanic
						,st.CodeValue Sex
						,CASE 
							WHEN spa.ProgramName IS NOT NULL THEN 1
							ELSE 0
						 END  EnglishLearnerStatus
						,0 IDEAStatus
						,ld.CodeValue ISO_639_2_NativeLanguage
						,fse.CodeValue EligibilityStatusForSchoolFoodServicePrograms
						,NULL NationalSchoolLunchProgramDirectCertificationIndicator
						,NULL PersonID
						,NULL PersonDetailID
						,NULL PersonDisabilityId
						,NULL PersonLanguageId
						,NULL PersonStatusId_IDEA
						,NULL PersonStatusId_LEP
						,NULL OrganizationID_School
						,NULL OrganizationPersonRoleID_School
						,NULL OrganizationID_SpecialEducationProgram
						,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SexType st ON s.SexTypeId = st.SexTypeId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentLanguageUse slu ON s.StudentUSI = slu.StudentUSI
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor ld ON slu.LanguageDescriptorId = ld.DescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LanguageUseType lut ON slu.LanguageUseTypeId = lut.LanguageUseTypeId
				AND lut.CodeValue IN ('Native Language', 'Home Language')
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor fse ON s.SchoolFoodServicesEligibilityDescriptorId = fse.DescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentProgramAssociation spa ON s.StudentUSI = spa.StudentUSI
				AND spa.ProgramName = 'English as a Second Language (ESL)'
			--WHERE mem.fy = @FiscalYear -- Need to set up a process for pointing to the correct ODS for each year

			--Note - the reason for building the additional temporary tables first and then updating from those is to increase performance

			--Add Student's Race to the Tempoary Table --
			INSERT INTO Staging.MembershipRace
				(Student_Identifier_State
				,RaceType
				,PersonDemographicRaceId
				,RunDateTime
				)
			SELECT DISTINCT
				 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,rt.CodeValue
				,NULL PersonDemographicRaceId
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentRace sr ON s.StudentUSI = sr.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].RaceType rt ON sr.RaceTypeId = rt.RaceTypeId
			order by REPLACE(s.StudentUniqueId, ' ', '')


			--Add in Disabilility

			INSERT INTO Staging.PrimaryDisability
				(Student_Identifier_State
				,DisabilityType
				,RunDateTime
				)
			SELECT DISTINCT
				 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,d.CodeValue
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentDisability sd ON s.StudentUSI = sd.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
				ON sd.DisabilityDescriptorId = d.DescriptorId

			UPDATE Staging.MembershipChildCount
			SET PrimaryDisability = pd.DisabilityType
			FROM Staging.MembershipChildCount mcc
			JOIN Staging.PrimaryDisability pd 
				ON mcc.Student_Identifier_State = pd.Student_Identifier_State

			UPDATE Staging.MembershipChildCount
			SET IDEAStatus = 1
			WHERE PrimaryDisability IS NOT NULL
				AND PrimaryDisability <> ''
			

	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.MembershipChildCount) > 0
		UPDATE Staging.MembershipRace SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.MembershipRace) > 0
		UPDATE Staging.PrimaryDisability SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PrimaryDisability) > 0


		----Validate Staging.MembershipChildCount----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount', 'MembershipChildCount', @SchoolYear

		----Validate Staging.MembershipRace----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount', 'MembershipRace', @SchoolYear

		----Validate Staging.PrimaryDisability----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount', 'PrimaryDisability', @SchoolYear


	
			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END



----Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant

GO

/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant]    Script Date: 6/25/2018 3:40:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load Migrant indicators about students for EDFacts reports that apply to the full year.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------Begin State Specific Information Section----------------------------------------
			---------------------------------------------------------------------------------------------------------------------
			----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
			----created to work with the data standardized in this location. Do not make any changes to table names or column----
			----names or to any of the code after this section.  The only information that should be modified is the source  ----
			----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
			---------------------------------------------------------------------------------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

			TRUNCATE TABLE Staging.Migrant
			
			INSERT INTO Staging.Migrant
				(RecordId
				,SchoolYear
				,School_Identifier_State
				,Student_Identifier_State
				,MigrantStatus
				,MigrantEducationProgramEnrollmentType
				,MigrantEducationProgramServicesType
				,MigrantEducationProgramContinuationOfServicesStatus
				,ContinuationOfServicesReason
				,MigrantStudentQualifyingArrivalDate
				,LastQualifyingMoveDate 
				,MigrantPrioritizedForServices
				,ProgramParticipationStartDate
				,ProgramParticipationExitDate
				,PersonID
				,OrganizationID_School
				,OrganizationPersonRoleID_MigrantProgram
				,OrganizationID_MigrantProgram
				,PersonProgramParticipationId
				,ProgramParticipationMigrantId
				,RunDateTime
				)
			SELECT DISTINCT
				 pa.StudentUSI RecordId
				,NULL SchoolYear
				,edorg.StateOrganizationId School_Identifier_State
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,1 MigrantStatus --defaulted based on join to migrant
				,NULL MigrantEducationProgramEnrollmentType --this element is not available in Ed-Fi part of MetaEd Extension
				,NULL MigrantEducationProgramServicesType -- This element is not avaialble in Ed-Fi part of MetaEd Extension
				,CASE ISNULL(dc.CodeValue, 'xx')
					WHEN 'xx' THEN '0'
					ELSE 1 END MigrantEducationProgramContinuationOfServicesStatus -- This should be a bit value -- if Continuation of Services is true, then 1, else 0
				,dc.CodeValue ContinuationOfServicesReason
				,NULL MigrantStudentQualifyingArrivalDate --this element is not available in Ed-Fi part of MetaEd Extension
				,pa.LastQualifyingMove LastQualifyingMoveDate 
				,pa.PriorityForServices MigrantPrioritizedForServices --this is a bit value 1 = true, 0 = false
				,pa.BeginDate ProgramParticipationStartDate
				,NULL ProgramParticipationExitDate
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL OrganizationPersonRoleID_MigrantProgram
				,NULL OrganizationID_MigrantProgram
				,NULL PersonProgramParticipationId
				,NULL ProgramParticipationMigrantId
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentMigrantEducationProgramAssociation pa ON s.StudentUSI = pa.StudentUSI
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dc ON pa.ContinuationOfServicesReasonDescriptorId = dc.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].ProgramType pt ON pa.ProgramTypeId = pt.ProgramTypeId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON pa.EducationOrganizationId = edorg.EducationOrganizationId
			WHERE pa.BeginDate >= App.GetFiscalYearStartDate(@SchoolYear)
			AND pa.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Migrant SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Migrant) > 0

		----Validate Staging.Migrant----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant', 'Migrant', @SchoolYear

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END



----Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI]    Script Date: 6/14/2018 4:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load Title 1 indicators about students for EDFacts reports that apply to the full year.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;

			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------Begin State Specific Information Section----------------------------------------
			---------------------------------------------------------------------------------------------------------------------
			----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
			----created to work with the data standardized in this location. Do not make any changes to table names or column----
			----names or to any of the code after this section.  The only information that should be modified is the source  ----
			----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
			---------------------------------------------------------------------------------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

			TRUNCATE TABLE Staging.ProgramParticipationTitleI

			INSERT INTO Staging.ProgramParticipationTitleI
						 (RecordId
						,School_Identifier_State
						,Student_Identifier_State
						,TitleIIndicator
						,PersonID
						,OrganizationID_School
						,OrganizationPersonRoleID_TitleIProgram
						,OrganizationID_TitleIProgram
						,PersonProgramParticipationId
						,RefTitleIIndicatorId
						,RunDateTime
						)
			SELECT DISTINCT
						 pa.StudentUSI RecordId
						,edorg.StateOrganizationId School_Identifier_State 
						,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
						,par.CodeValue Title1Indicator
						,NULL PersonID
						,NULL OrganizationID_School
						,NULL OrganizationPersonRoleID_TitleIProgram
						,NULL OrganizationID_TitleIProgram
						,NULL PersonProgramParticipationId
						,NULL RefTitleIIndicatorId
						,NULL RunDateTime
			--This is not the right "From" selection, just leaving it here so to load the Stored Procedure, need to go back and fill that in correctly to get
			--the title I information
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentTitleIPartAProgramAssociation pa ON s.StudentUSI = pa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].ProgramType pt ON pa.ProgramTypeId = pt.ProgramTypeId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].TitleIPartAParticipantType par ON pa.TitleIPartAParticipantTypeId = par.TitleIPartAParticipantTypeId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON pa.EducationOrganizationId = edorg.EducationOrganizationId

			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.ProgramParticipationTitleI SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.ProgramParticipationTitleI) > 0

		----Validate Staging.ProgramParticipationTitleI----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI', 'ProgramParticipationTitleI', @SchoolYear

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END







----Migrate_Data_ETL_STEP02_Discipline

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_STEP02_Discipline]    Script Date: 10/20/2017 10:45:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline]
	@SchoolYear SMALLINT
	AS
	BEGIN

		BEGIN TRY
	
			set nocount on;


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------Begin State Specific Information Section----------------------------------------
			---------------------------------------------------------------------------------------------------------------------
			----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
			----created to work with the data standardized in this location. Do not make any changes to table names or column----
			----names or to any of the code after this section.  The only information that should be modified is the source  ----
			----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
			---------------------------------------------------------------------------------------------------------------------
			---------------------------------------------------------------------------------------------------------------------


			TRUNCATE TABLE Staging.Discipline

			INSERT INTO [Staging].[Discipline]
			   ([Student_Identifier_State]
			   ,[School_Identifier_State]
			   ,[IncidentIdentifier]
			   ,[DisciplinaryActionTaken]
			   ,[DisciplineReason]
			   ,[DisciplinaryActionStartDate]
			   ,[DisciplinaryActionEndDate]
			   ,[DurationOfDisciplinaryAction]
			   ,[IdeaInterimRemoval]
			   ,[IdeaInterimRemovalReason]
			   ,[EducationalServicesAfterRemoval]
			   ,[DisciplineMethodOfCwd]
			   ,[PersonId]
			   ,[OrganizationID_School]
			   ,[OrganizationPersonRoleId_School]
			   ,[IncidentId]
			   ,[RunDateTime]
			   )
			SELECT DISTINCT 
				  s.StudentUniqueId [Student_Identifier_State]
				, eo.StateOrganizationId [School_Identifier_State]
				, di.IncidentIdentifier [IncidentIdentifier]
				, dd.CodeValue [DisciplinaryActionTaken]
				, bd.CodeValue [DisciplineReason]
				, da.DisciplineDate [DisciplinaryActionStartDate]
				, NULL [DisciplinaryActionEndDate]
				, da.DisciplineActionLength [DurationOfDisciplinaryAction]
				, dd.CodeValue [IdeaInterimRemoval]
				, dd.CodeValue [IdeaInterimRemovalReason]
				, NULL [EducationalServicesAfterRemoval]
				, dd.CodeValue [DisciplineMethodOfCwd]
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineIncident di
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineActionDisciplineIncident dadi
				ON di.IncidentIdentifier = dadi.IncidentIdentifier
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineAction da
				ON dadi.DisciplineActionIdentifier = da.DisciplineActionIdentifier
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
				ON da.StudentUSI = s.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization eo
				ON di.SchoolId = eo.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineActionDiscipline dad
				ON da.DisciplineActionIdentifier = dad.DisciplineActionIdentifier
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dd
				ON dad.DisciplineDescriptorId = dd.DescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineIncidentBehavior dib
				ON di.IncidentIdentifier = dib.IncidentIdentifier
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor bd
				ON dib.BehaviorDescriptorId = bd.DescriptorId


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Discipline SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Discipline) > 0

		----Validate Staging.Discipline----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline', 'Discipline', @SchoolYear


			
			set nocount off;


		END TRY
		BEGIN CATCH

			declare @msg as nvarchar(max)
			set @msg = ERROR_MESSAGE()

			declare @sev as int
			set @sev = ERROR_SEVERITY()

			RAISERROR(@msg, @sev, 1)

		END CATCH; 

	END





----Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]
	@SchoolYear SMALLINT
	AS
   /*************************************************************************************************************
    Created by:    Nathan Clinton | nathan.clinton@aemcorp.com | CIID (https://ciidta.grads360.org/#program)
    Date Created:  6/28/2018

    Purpose:
        The purpose of this ETL is to load the list of K12 staff into Generate.

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  Data Warehouse: db_ECSUID.dbo.ECSUID

    Data Targets:  Generate Database:   Generate.ODS.Person
										Generate.ODS.PersonIdentifier

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------Begin State Specific Information Section----------------------------------------
			---------------------------------------------------------------------------------------------------------------------
			----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
			----created to work with the data standardized in this location. Do not make any changes to table names or column----
			----names or to any of the code after this section.  The only information that should be modified is the source  ----
			----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
			---------------------------------------------------------------------------------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		TRUNCATE TABLE Staging.StaffAssignment

		INSERT INTO Staging.StaffAssignment
			(	 
				  Personnel_Identifier_State 
				, School_Identifier_State 
				, FullTimeEquivalency 
				, SpecialEducationStaffCategory 
				, K12StaffClassification 
				, TitleIProgramStaffCategory 
				, CredentialType 
				, CredentialIssuanceDate 
				, CredentialExpirationDate 
				, ParaprofessionalQualification 
				, SpecialEducationAgeGroupTaught 
				, HighlyQualifiedTeacherIndicator
				, AssignmentStartDate
				, AssignmentEndDate
				, RunDateTime
			)
		SELECT 
			  s.StaffUniqueId
			, eo.StateOrganizationId
			, ea.FullTimeEquivalency
			, NULL
			, scd.CodeValue
			, NULL
			, ct.CodeValue
			, sc.CredentialIssuanceDate
			, sc.CredentialExpirationDate
			, para.CodeValue 
			, NULL
			, s.HighlyQualifiedTeacher [HighlyQualifiedTeacherIndicator]
			, aa.BeginDate
			, aa.EndDate
			, NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Staff s
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffCredential sc
			ON s.StaffUSI = sc.StaffUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].CredentialType ct
			ON sc.CredentialTypeId = ct.CredentialTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffEducationOrganizationAssignmentAssociation aa
			ON s.StaffUSI = aa.StaffUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization eo
			ON aa.EducationOrganizationId = eo.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor scd
			ON aa.StaffClassificationDescriptorId = scd.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffEducationOrganizationEmploymentAssociation ea
			ON s.StaffUSI = ea.StaffUSI
			AND aa.EducationOrganizationId = ea.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffSchoolAssociation ssa
			ON s.StaffUSI = ssa.StaffUSI
			AND aa.EducationOrganizationId = ssa.SchoolId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor para ON sc.TeachingCredentialDescriptorId = para.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pad
			ON ssa.ProgramAssignmentDescriptorId = pad.DescriptorId
		WHERE pad.ShortDescription = 'Special Education'


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.StaffAssignment SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.StaffAssignment) > 0

		----Validate Staging.StaffAssignment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment', 'StaffAssignment', @SchoolYear

		SET NOCOUNT OFF;

	END




----Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments]
	@SchoolYear SMALLINT
  AS
    /*************************************************************************************************************
   Date Created:  7/2/2018

    Purpose:
        The purpose of this ETL is to load Assessment data for EDFacts reporting.

    Assumptions:
        
    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources: 

    Data Targets:  Generate Database:   Generate

    Return Values:
    	 0	= Success
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;


-------------------------------------Begin State Specific Information Section----------------------------------------
---------------------------------------------------------------------------------------------------------------------
----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
----created to work with the data standardized in this location. Do not make any changes to table names or column----
----names or to any of the code after this section.  The only information that should be modified is the source  ----
----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

		TRUNCATE TABLE Staging.Assessment
		TRUNCATE TABLE Staging.AssessmentResult



		------------------------------------------------
		---Metadata about the Assessment ---------------
		------------------------------------------------

		INSERT INTO [Staging].[Assessment]
				   ([AssessmentTitle]
				   ,[AssessmentShortName]
				   ,[AssessmentAcademicSubject]
				   ,[AssessmentPurpose]
				   ,[AssessmentType]
				   ,[AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,[AssessmentFamilyTitle]
				   ,[AssessmentFamilyShortName]
				   ,[AssessmentAdministrationStartDate]
				   ,[AssessmentAdministrationFinishDate]
				   ,[AssessmentPerformanceLevelIdentifier]
				   ,[AssessmentPerformanceLevelLabel]
				   ,[AssessmentId]
				   ,[AssessmentAdministrationId]
				   ,[AssessmentSubtestId]
				   ,[AssessmentFormId]
				   ,[AssessmentPerformanceLevelId]
				   ,[RunDateTime]
				   )
		SELECT DISTINCT
				    a.AssessmentTitle [AssessmentTitle] -- break down the assessment by subject area so if it's end of instruction, this should be End of Instruction English Language Arts not just End of Instruction.
										--is this the title that has to match toggle exactly so that it can find it?
				   ,a.AssessmentTitle [AssessmentShortName]
				   ,asubject.CodeValue [AssessmentAcademicSubject]
				   ,atype.CodeValue [AssessmentPurpose]
				   ,atype.CodeValue [AssessmentType]
				   ,atype.CodeValue [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,CASE ISNULL(a.AssessmentFamilyTitle, a.AssessmentTitle)
						WHEN a.AssessmentTitle THEN a.AssessmentTitle
						ELSE a.AssessmentFamilyTitle END [AssessmentFamilyTitle]
				   ,a.AssessmentFamilyTitle [AssessmentFamilyShortName]
				   ,NULL [AssessmentAdministrationStartDate]
				   ,NULL [AssessmentAdministrationFinishDate]
				   ,aperformance.CodeValue [AssessmentPerformanceLevelIdentifier] -- example L1, L2, L3, L4
				   ,aperformance.Description [AssessmentPerformanceLevelLabel] -- example Unsatisfactory, Proficient, Advanced, etc. which align with the AssessmentPerformanceLevelIdentifier
				   ,NULL [AssessmentId]
				   ,NULL [AssessmentAdministrationId]
				   ,NULL [AssessmentSubtestId]
				   ,NULL [AssessmentFormId]
				   ,NULL [AssessmentPerformanceLevelId]
				   ,NULL [RunDateTime]
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment] a
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] asubject 
			ON a.AcademicSubjectDescriptorId = asubject.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] atype 
			ON a.AssessmentCategoryDescriptorId = atype.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[AssessmentPerformanceLevel] apl
			ON a.AssessmentTitle = apl.AssessmentTitle
			AND a.AcademicSubjectDescriptorId = apl.AcademicSubjectDescriptorId
			AND a.AssessedGradeLevelDescriptorId = apl.AssessedGradeLevelDescriptorId
			AND a.Version = apl.Version
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aperformance
			ON apl.PerformanceLevelDescriptorId = aperformance.DescriptorId
		WHERE atype.CodeValue NOT IN ('Benchmark test', 'Advanced Placement', 'College Entrance Exam')

		--Update AssessmentAdministrationStartDate and AssessmentAdministrationEndDate by joining to edfi.StudentAssessment

		UPDATE Staging.Assessment
		SET AssessmentAdministrationStartDate = sa.AdministrationDate, AssessmentAdministrationFinishDate = sa.AdministrationDate
		FROM Staging.Assessment stage
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment] a
			ON stage.AssessmentTitle = a.AssessmentTitle
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] asubject 
			ON a.AcademicSubjectDescriptorId = asubject.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] atype 
			ON a.AssessmentCategoryDescriptorId = atype.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] sa 
			ON a.AssessmentTitle = sa.AssessmentTitle
			AND a.AcademicSubjectDescriptorId = sa.AcademicSubjectDescriptorId
			AND a.AssessedGradeLevelDescriptorId = sa.AssessedGradeLevelDescriptorId
		WHERE stage.AssessmentAcademicSubject = asubject.CodeValue
		AND stage.AssessmentType = atype.CodeValue		
		
		--Ed-Fi does not have a specific value to indicate a regular assessment with accommodations separate from the student receiving accommodations
		--This extra insert will replicate each regular assessment without accommodations to have an identical one with accommodations.

		INSERT INTO [Staging].[Assessment]
				   ([AssessmentTitle]
				   ,[AssessmentShortName]
				   ,[AssessmentAcademicSubject]
				   ,[AssessmentPurpose]
				   ,[AssessmentType]
				   ,[AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,[AssessmentFamilyTitle]
				   ,[AssessmentFamilyShortName]
				   ,[AssessmentAdministrationStartDate]
				   ,[AssessmentAdministrationFinishDate]
				   ,[AssessmentPerformanceLevelIdentifier]
				   ,[AssessmentPerformanceLevelLabel]
				   ,[AssessmentId]
				   ,[AssessmentAdministrationId]
				   ,[AssessmentSubtestId]
				   ,[AssessmentFormId]
				   ,[AssessmentPerformanceLevelId]
				   ,[RunDateTime]
				   )
		SELECT DISTINCT
				    [AssessmentTitle]
				   ,[AssessmentShortName]
				   ,[AssessmentAcademicSubject]
				   ,[AssessmentPurpose]
				   ,[AssessmentType]
				   ,'REGASSWACC' [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,[AssessmentFamilyTitle]
				   ,[AssessmentFamilyShortName]
				   ,[AssessmentAdministrationStartDate]
				   ,[AssessmentAdministrationFinishDate]
				   ,[AssessmentPerformanceLevelIdentifier]
				   ,[AssessmentPerformanceLevelLabel]
				   ,[AssessmentId]
				   ,[AssessmentAdministrationId]
				   ,[AssessmentSubtestId]
				   ,[AssessmentFormId]
				   ,[AssessmentPerformanceLevelId]
				   ,NULL [RunDateTime]
		FROM Staging.Assessment


		-----------------------------------------------------------------------------------------------------------------------
		----Data about the Students who participated or did not participate in the assessment and their performance levels ----
		-----------------------------------------------------------------------------------------------------------------------


		INSERT INTO [Staging].[AssessmentResult]
				   ([Student_Identifier_State]
				   ,[School_Identifier_State]
				   ,[AssessmentTitle]
				   ,[AssessmentAcademicSubject]
				   ,[AssessmentPurpose]
				   ,[AssessmentType]
				   ,[AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,[AssessmentAdministrationStartDate]
				   ,[AssessmentAdministrationFinishDate]
				   ,[AssessmentRegistrationParticipationIndicator]
				   ,[GradeLevelWhenAssessed]
				   ,[StateFullAcademicYear]
				   ,[LEAFullAcademicYear]
				   ,[SchoolFullAcademicYear]
				   ,[AssessmentRegistrationReasonNotCompleting]
				   ,[AssessmentPerformanceLevelIdentifier]
				   ,[AssessmentPerformanceLevelLabel]
				   ,[AssessmentRegistrationId]
				   ,[AssessmentId]
				   ,[AssessmentAdministrationId]
				   ,[PersonId]
				   ,[AssessmentFormId]
				   ,[AssessmentSubtestId]
				   ,[AssessmentPerformanceLevelId]
				   ,[AssessmentResultId]
				   ,[AssessmentResult_PerformanceLevelId]
				   ,[OrganizationID_School]
				   ,[OrganizationPersonRoleId_School]
				   ,[RunDateTime]
				   )
		SELECT DISTINCT
				    s.StudentUniqueId [Student_Identifier_State]
				   ,edorg.StateOrganizationId [School_Identifier_State]
				   ,a.AssessmentTitle [AssessmentTitle] -- should match exactly with the assessment title above
				   ,asubject.CodeValue [AssessmentAcademicSubject]
				   ,atype.CodeValue [AssessmentPurpose]
				   ,atype.CodeValue [AssessmentType]
				   ,atype.CodeValue [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,sa.AdministrationDate [AssessmentAdministrationStartDate]
				   ,sa.AdministrationDate [AssessmentAdministrationFinishDate]
				   ,CASE ISNULL(sa.ReasonNotTestedTypeId, '99')
						WHEN '99' THEN '1'
						ELSE 0 END [AssessmentRegistrationParticipationIndicator]
				   ,agradelevel.CodeValue [GradeLevelWhenAssessed]
				   ,NULL [StateFullAcademicYear]
				   ,NULL [LEAFullAcademicYear]
				   ,NULL [SchoolFullAcademicYear]
				   ,rntt.CodeValue [AssessmentRegistrationReasonNotCompleting]
				   ,aperformance.CodeValue [AssessmentPerformanceLevelIdentifier] -- this is what the student scored as it relates to performance level/proficiency - should match with what was put into the Assessment table above
				   ,aperformance.Description [AssessmentPerformanceLevelLabel] -- this is what the student scored as it relates to performance level/proficiency - should match with what was put into the Assessment table above
				   ,NULL [AssessmentRegistrationId]
				   ,NULL [AssessmentId]
				   ,NULL [AssessmentAdministrationId]
				   ,NULL [PersonId]
				   ,NULL [AssessmentFormId]
				   ,NULL [AssessmentSubtestId]
				   ,NULL [AssessmentPerformanceLevelId]
				   ,NULL [AssessmentResultId]
				   ,NULL [AssessmentResult_PerformanceLevelId]
				   ,NULL [OrganizationID_School]
				   ,NULL [OrganizationPersonRoleId_School]
				   ,NULL [RunDateTime]
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment] a
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] asubject 
			ON a.AcademicSubjectDescriptorId = asubject.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] atype 
			ON a.AssessmentCategoryDescriptorId = atype.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] sa 
			ON a.AssessmentTitle = sa.AssessmentTitle
			AND a.AcademicSubjectDescriptorId = sa.AcademicSubjectDescriptorId
			AND a.AssessedGradeLevelDescriptorId = sa.AssessedGradeLevelDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessmentPerformanceLevel] sapl
			ON sa.AssessmentTitle = sapl.AssessmentTitle
			AND sa.StudentUSI = sapl.StudentUSI
			AND sa.AcademicSubjectDescriptorId = sapl.AcademicSubjectDescriptorId
			AND sa.AdministrationDate = sapl.AdministrationDate
			AND sa.AssessedGradeLevelDescriptorId = sapl.AssessedGradeLevelDescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aperformance 
			ON sapl.PerformanceLevelDescriptorId = aperformance.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] agradelevel
			ON sapl.AssessedGradeLevelDescriptorId = agradelevel.DescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Student] s 
			ON sa.StudentUSI = s.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa 
			ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganization] edorg 
			ON ssa.SchoolId = edorg.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] sch 
			ON edorg.EducationOrganizationId = sch.SchoolId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[ReasonNotTestedType] rntt 
			ON sa.ReasonNotTestedTypeId = rntt.ReasonNotTestedTypeId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessmentAccommodation] saa
			ON sa.StudentUSI = saa.StudentUSI
			AND sa.AssessmentTitle = saa.AssessmentTitle
			AND sa.AcademicSubjectDescriptorId = saa.AcademicSubjectDescriptorId
			AND sa.AssessedGradeLevelDescriptorId = saa.AssessedGradeLevelDescriptorId
			AND sa.AdministrationDate = saa.AdministrationDate
			AND sa.Version = saa.Version
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] aaccom
			ON saa.AccommodationDescriptorId = aaccom.DescriptorId
		WHERE ssa.EntryDate <= sa.AdministrationDate
		AND (ssa.ExitWithdrawDate IS NULL OR ssa.ExitWithdrawDate >= sa.AdministrationDate)
		AND atype.CodeValue NOT IN ('Benchmark test', 'Advanced Placement', 'College Entrance Exam')



		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Assessment SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Assessment) > 0
		UPDATE Staging.AssessmentResult SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.AssessmentResult) > 0

		----Validate Staging.Assessment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments', 'Assessment', @SchoolYear
		
		----Validate Staging.AssessmentResult----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments', 'AssessmentResult', @SchoolYear



			set nocount off;



END








----Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus]    Script Date: 6/6/2018 3:19:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus]
	 @SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load the data for end of year Statuses for Persons.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;

		DECLARE @Homeless VARCHAR(100)
		DECLARE @EconomicDisadvantage VARCHAR(100)
		DECLARE @Migrant VARCHAR(100)
		DECLARE @MilitaryConnected VARCHAR(100)
		DECLARE @Foster VARCHAR(100)
		DECLARE @EnglishLearner VARCHAR(100)
		DECLARE @IDEA VARCHAR(100)

		SET @Homeless = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'HomelessUnaccompaniedYouth')
		SET @EconomicDisadvantage = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'EconomicDisadvantage')
		SET @Migrant = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'Migrant')
		SET @EnglishLearner = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'LEP')
		SET @IDEA = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'IDEA')
		SET @MilitaryConnected = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'Parent in Military')
		SET @Foster = (SELECT InputCode FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefPersonStatusType' AND SchoolYear = @SchoolYear AND OutputCode = 'Foster Care')

		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------Begin State Specific Information Section----------------------------------------
		---------------------------------------------------------------------------------------------------------------------
		----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
		----created to work with the data standardized in this location. Do not make any changes to table names or column----
		----names or to any of the code after this section.  The only information that should be modified is the source  ----
		----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
		---------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		TRUNCATE TABLE Staging.PersonStatus
		TRUNCATE TABLE Staging.PrimaryDisability


		INSERT INTO [Staging].[PersonStatus]
			   ([Student_Identifier_State]
			   ,[School_Identifier_State]
			   ,[HomelessnessStatus]
			   ,[Homelessness_StatusStartDate]
			   ,[Homelessness_StatusEndDate]
			   ,[EconomicDisadvantageStatus]
			   ,[EconomicDisadvantage_StatusStartDate]
			   ,[EconomicDisadvantage_StatusEndDate]
			   ,[MigrantStatus]
			   ,[Migrant_StatusStartDate]
			   ,[Migrant_StatusEndDate]
			   ,[MilitaryConnectedStudentIndicator]
			   ,[MilitaryConnected_StatusStartDate]
			   ,[MilitaryConnected_StatusEndDate]
			   ,[ProgramType_FosterCare]
			   ,[FosterCare_ProgramParticipationStartDate]
			   ,[FosterCare_ProgramParticipationEndDate]
			   ,[EnglishLearnerStatus]
			   ,[EnglishLearner_StatusStartDate]
			   ,[EnglishLearner_StatusEndDate]
			   ,[IDEAIndicator]
			   ,[IDEA_StatusStartDate]
			   ,[IDEA_StatusEndDate]
			   ,[PrimaryDisabilityType]
			   ,[PersonId]
			   ,[OrganizationID_School]
			   ,[OrganizationID_Program_Foster]
			   ,[OrganizationPersonRoleID_School]
			   ,[PersonStatusId_Homeless]
			   ,[PersonStatusId_EconomicDisadvantage]
			   ,[PersonStatusId_IDEA]
			   ,[PersonStatusId_EnglishLearner]
			   ,[PersonStatusId_Migrant]
			   ,[PersonMilitaryId]
			   ,[OrganizationPersonRoleID_Program_Foster]
			   ,[RunDateTime]
			   )
		SELECT DISTINCT
			    s.StudentUniqueId [Student_Identifier_State]
			   ,edorg.StateOrganizationId [School_Identifier_State]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Homeless THEN '1'
					ELSE NULL END [HomelessnessStatus]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Homeless THEN sc.BeginDate
					ELSE NULL END [Homelessness_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Homeless THEN sc.EndDate
					ELSE NULL END [Homelessness_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EconomicDisadvantage THEN '1'
					ELSE NULL END [EconomicDisadvantageStatus]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EconomicDisadvantage THEN sc.BeginDate
					ELSE NULL END [EconomicDisadvantage_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EconomicDisadvantage THEN sc.EndDate
					ELSE NULL END [EconomicDisadvantage_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Migrant THEN '1'
					ELSE NULL END [MigrantStatus]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Migrant THEN sc.BeginDate
					ELSE NULL END [Migrant_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Migrant THEN sc.EndDate
					ELSE NULL END [Migrant_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @MilitaryConnected THEN '1'
					ELSE NULL END [MilitaryConnectedStudentIndicator]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @MilitaryConnected THEN sc.BeginDate
					ELSE NULL END [MilitaryConnected_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @MilitaryConnected THEN sc.EndDate
					ELSE NULL END [MilitaryConnected_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Foster THEN '1'
					ELSE NULL END [ProgramType_FosterCare]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Foster THEN sc.BeginDate
					ELSE NULL END [FosterCare_ProgramParticipationStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @Foster THEN sc.EndDate
					ELSE NULL END [FosterCare_ProgramParticipationEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EnglishLearner THEN '1'
					ELSE NULL END [EnglishLearnerStatus]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EnglishLearner THEN sc.BeginDate
					ELSE NULL END [EnglishLearner_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @EnglishLearner THEN sc.EndDate
					ELSE NULL END [EnglishLearner_StatusEndDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @IDEA THEN '1'
					ELSE NULL END [IDEAIndicator]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @IDEA THEN sc.BeginDate
					ELSE NULL END [IDEA_StatusStartDate]
			   ,CASE ISNULL(d.CodeValue, 'xx')
					WHEN @IDEA THEN sc.EndDate
					ELSE NULL END [IDEA_StatusEndDate]
			   ,NULL [PrimaryDisabilityType]
			   ,NULL [PersonId]
			   ,NULL [OrganizationID_School]
			   ,NULL [OrganizationID_Program_Foster]
			   ,NULL [OrganizationPersonRoleID_School]
			   ,NULL [PersonStatusId_Homeless]
			   ,NULL [PersonStatusId_EconomicDisadvantage]
			   ,NULL [PersonStatusId_IDEA]
			   ,NULL [PersonStatusId_EnglishLearner]
			   ,NULL [PersonStatusId_Migrant]
			   ,NULL [PersonMilitaryId]
			   ,NULL [OrganizationPersonRoleID_Program_Foster]
			   ,NULL [RunDateTime]
		FROM [EdFi_Sample_ODS_Data_For_Generate].edfi.Student s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.StudentSchoolAssociation ssa 
			ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.School sch 
			ON ssa.SchoolId = ssa.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.EducationOrganization edorg 
			ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.StudentCharacteristic sc 
			ON s.StudentUSI = sc.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].edfi.Descriptor d 
			ON sc.StudentCharacteristicDescriptorId = d.DescriptorId
		WHERE (sc.EndDate IS NULL
			OR sc.EndDate > App.GetFiscalYearStartDate(@SchoolYear))

		-- Insert Staging.PrimmaryDisability Here

			INSERT INTO Staging.PrimaryDisability
				(Student_Identifier_State
				,DisabilityType
				,RunDateTime
				)
			SELECT DISTINCT
				 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,d.CodeValue
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentDisability sd ON s.StudentUSI = sd.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
				ON sd.DisabilityDescriptorId = d.DescriptorId

			UPDATE Staging.PersonStatus
			SET PrimaryDisabilityType = pd.DisabilityType
			FROM Staging.PersonStatus ps
			JOIN Staging.PrimaryDisability pd 
				ON ps.Student_Identifier_State = pd.Student_Identifier_State

				

		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.PersonStatus SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PersonStatus) > 0
		UPDATE Staging.PrimaryDisability SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PrimaryDisability) > 0

		----Validate Staging.PersonStatus----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus', 'PersonStatus', @SchoolYear

		----Validate Staging.PrimaryDisability----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus', 'PrimaryDisability', @SchoolYear


			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END



----Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode]    Script Date: 5/21/2018 2:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode]
	@SchoolYear SMALLINT
AS


--    /*************************************************************************************************************
--    Date Created:  5/21/2018

--    Purpose:
--        The purpose of this ETL is to manage the State Education Agency (SEA), Local Education Agency (LEA),
--        and School organization information in the Generate ODS.  This ETL is run each time the
--        the ODS is populated and retrieves data from the states source system that houses information
--        related to the school's and LEA's operational status (e.g., Open, Closed, etc.). It will update
--		based on information found in the source data related to SEAs, LEAs and Schools.

--    Assumptions:
--        This procedure assumes that the source tables are ready for consumption. 

--    Account executed under: LOGIN

--    Approximate run time:  ~ 10 seconds

--    Data Sources:  Ed-Fi ODS

--    Data Targets:  Generate Database

--    Return Values:
--    	 0	= Success
  
--    Example Usage: 
--      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization];
--	  Note that this script is called by Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization and is meant to hide
--	  all non-changing, backend code from the person managing Generate.  
    
--    Modification Log:
--      #	  Date		  Issue#   Description
--      --  ----------  -------  --------------------------------------------------------------------
--      01  05/21/2018           First Release		  	 
--    *************************************************************************************************************/


BEGIN

	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	----All code below this point should not be adjusted. It is created to use the staging tables to load the------------
	----the CEDS Operational Data Store.---------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------


	BEGIN TRY
	
		set nocount on;

		--------------------------------------------------------------
		--- Optimize indexes on Staging tables --- 
		--------------------------------------------------------------
		ALTER INDEX ALL ON Staging.Organization
		REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);

		ALTER INDEX ALL ON Staging.OrganizationAddress
		REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);

		ALTER INDEX ALL ON Staging.OrganizationGradeOffered
		REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);

		ALTER INDEX ALL ON Staging.OrganizationPhone
		REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);


		/* Define all local variables */
        -------------------------------
        DECLARE @LEA_OrganizationId INT
               ,@SCHOOL_OrganizationId INT
			   ,@LocationId INT
               ,@SpecialEducationProgram_OrganizationId INT
               ,@LEA_Identifier_State VARCHAR(100)
               ,@LEA_Identifier_NCES VARCHAR(100)
               ,@RecordStartDate DATETIME
			   ,@RecordEndDate DATETIME
			   ,@UpdateDateTime DATETIME
			   ,@ID INT

		SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear);
			
		SET @RecordEndDate = App.GetFiscalYearEndDate(@SchoolYear);

		SET @UpdateDateTime = GETDATE()



		---Begin Housekeeping items on the temp table---

		--This section ensures that if state identifers change for the LEA or School and the source data does not contain the old identifier, the change is still
		--picked up by using the NCES ID as the crosswalk between the old and the new.

		--This update statement looks for a new state LEA Identifier using the NCES Id as the crosswalk between the temporary table Identifier and the Identifier
		--already stored in the ODS.OrganizationIdentifier table.  If they are different and the LEA_Identifier_State_Identifier_Old column in the staging table
		--is NULL, it will mark it with the Identifier stored in the ODS and will later end date that identifier and replace it with the new one.
		UPDATE Staging.Organization
		SET LEA_Identifier_State_Identifier_Old = orgid2.Identifier
		FROM ODS.OrganizationIdentifier orgid1
		JOIN ODS.OrganizationIdentifier orgid2 ON orgid1.OrganizationId = orgid2.OrganizationId
		JOIN Staging.Organization tod ON orgid1.Identifier = tod.LEA_Identifier_NCES
		WHERE orgid1.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('NCES', '001072') -- Local Education Agency Identification System'
		AND orgid2.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
		AND orgid1.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid2.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid2.Identifier <> tod.LEA_Identifier_State
		AND tod.LEA_Identifier_State_Identifier_Old IS NOT NULL

		--This update statement looks for a new state School Identifier using the NCES Id as the crosswalk between the temporary table Identifier and the Identifier
		--already stored in the ODS.OrganizationIdentifier table.  If they are different and the School_Identifier_State_Identifier_Old column in the temp table
		--is NULL, it will mark it with the Identifier stored in the ODS and will later enddate that identifier and replace it with the new one.
		UPDATE Staging.Organization
		SET School_Identifier_State_Identifier_Old = orgid2.Identifier
		FROM ODS.OrganizationIdentifier orgid1
		JOIN ODS.OrganizationIdentifier orgid2 ON orgid1.OrganizationId = orgid2.OrganizationId
		JOIN Staging.Organization tod ON orgid1.Identifier = tod.School_Identifier_NCES
		WHERE orgid1.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('NCES', '001073')
		AND orgid2.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
		AND orgid1.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
		AND orgid2.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
		AND orgid2.Identifier <> tod.School_Identifier_State
		AND tod.School_Identifier_State_Identifier_Old IS NOT NULL

		--Update the Bit value to indicate that an identifier has changed.
		UPDATE Staging.Organization SET LEA_Identifier_State_ChangedIdentifier = 1 WHERE LEA_Identifier_State_Identifier_Old IS NOT NULL
		UPDATE Staging.Organization SET School_Identifier_State_ChangedIdentifier = 1 WHERE School_Identifier_State_Identifier_Old IS NOT NULL



        /* Load the Department of Education SEA Specific Information
		--------------------------------------------------------------
		This infomration is specific to the SEA only and normally does not
		change. It is set up to load once and then with an IF/THEN statement
		is ignored from thereon so long as the data exist in the ODS
		
		*/

		-------------------------------------------------------------------
		----Create SEA Organization Data ----------------------------------
		-------------------------------------------------------------------

		IF (SELECT COUNT(*) FROM ODS.OrganizationDetail od join Staging.StateDetail sd on od.Name = sd.SeaName) < 1 BEGIN

			INSERT INTO [ODS].[Organization] DEFAULT VALUES
			UPDATE Staging.StateDetail SET OrganizationId = SCOPE_IDENTITY();

			INSERT INTO [ODS].[OrganizationDetail]
						([OrganizationId]
						,[Name]
						,[RefOrganizationTypeId]
						,[ShortName]
						,[RecordStartDateTime]
						,[RecordEndDateTime])
			SELECT TOP 1
						OrganizationId [OrganizationId]
						,SeaName [Name]
						,App.GetOrganizationTypeId('SEA', '001156') [RefOrganizationTypeId] --CEDS code that represents "State Education Agency (SEA)"--
						,SeaShortName [ShortName]
						,'1900-01-01' [RecordStartDateTime]
						,NULL [RecordEndDateTime]
			FROM Staging.StateDetail

			--Insert StateANSICode into ODS.OrganizationIdentifier
			INSERT INTO [ODS].[OrganizationIdentifier]
						([Identifier]
						,[RefOrganizationIdentificationSystemId]
						,[OrganizationId]
						,[RefOrganizationIdentifierTypeId])
			SELECT DISTINCT
						rsa.Code [Identifier] --StateANSICode from RefStateANSICode table--
						,[App].[GetOrganizationIdentifierSystemId]('Federal', '001491') [RefOrganizationIdentificationSystemId] --Federal identification from the RefOrganizationIdentificationSystem table--
						,sd.OrganizationId [OrganizationId]
						,[App].[GetOrganizationIdentifierTypeId]('001491') [RefOrganizationIdentifierTypeId] --State Agency Identification System from the RefOrganizationIdentifierType table --
			FROM Staging.StateDetail sd
			JOIN ODS.RefStateANSICode rsa
				ON rsa.StateName = sd.StateName

		-- The SEA Organization already exists,
		-- so grab the org ID.
		END ELSE BEGIN 
			UPDATE Staging.StateDetail 
			SET OrganizationId = od.OrganizationId
			FROM ODS.OrganizationDetail od 
			JOIN Staging.StateDetail sd 
				ON od.[Name] = sd.SeaName
		END

		UPDATE Staging.Organization 
		SET SEAOrganizationId = sd.OrganizationId 
		FROM Staging.StateDetail sd
		
		-------------------------------------------------------------------
		----Create LEA and School Organization Data -----------------------
		-------------------------------------------------------------------

		/* Insert LEA/K12 School/Special Education Program into ODS.Organization
		------------------------------------------------------------------------
		In this section, the LEA, School and Speical Education Programs are created
		as Organizations in the ODS.  And the relationships betweeen the Organizations
		are also created.
		
		*/


		--MERGE LEA data into ODS.Organization


		--First check to see if the LEA already exists so that it is not created a second time.

		UPDATE Staging.Organization
		SET LEAOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.LEA_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
		AND tod.LEA_Identifier_State_ChangedIdentifier = 0

		UPDATE Staging.Organization
		SET LEAOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.LEA_Identifier_State_Identifier_Old = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('LEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
		AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
		AND tod.LEA_Identifier_State_ChangedIdentifier = 1

		--Insert new LEAs--
		--Get a distinct list of LEA IDs that need to be inserted 
		--so that we can use a MERGE properly.		
		DECLARE @DistinctNewLeas TABLE (
			  LEA_Identifier_State VARCHAR(100)
			, LEA_Identifier_NCES VARCHAR(100)
			, LEA_Name VARCHAR(100)
			, OrganizationId INT NULL
		)

		INSERT INTO @DistinctNewLeas
		SELECT DISTINCT 
			  LEA_Identifier_State
			, LEA_Identifier_NCES
			, LEA_Name
			, NULL
		FROM Staging.Organization
		WHERE LeaOrganizationId IS NULL

		--This table captures the Staging.LEA_Identifier_State 
		--and the new OrganizationId from ODS.Organization 
		--so that we can create the child records.
		DECLARE @NewLeaOrganization TABLE (
			  OrganizationId INT
			, LEA_Identifier_State VARCHAR(100)
		)

		MERGE ODS.Organization AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON 1 = 0 -- always insert 
		WHEN NOT MATCHED THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.LEA_Identifier_State
		INTO @NewLeaOrganization;

		UPDATE Staging.Organization
		SET   LeaOrganizationId = norg.OrganizationId
			, NewLea = 1
		FROM Staging.Organization o
		JOIN @NewLeaOrganization norg
			ON o.LEA_Identifier_State = norg.LEA_Identifier_State

		UPDATE @DistinctNewLeas
		SET OrganizationId = o.LeaOrganizationId
		FROM Staging.Organization o
		JOIN @DistinctNewLeas norg
			ON o.Lea_Identifier_State = norg.Lea_Identifier_State


		--Update LEA names by end dating the 
		--current OrganizationDetail record and creating a new one
		UPDATE ods.OrganizationDetail
		SET RecordEndDateTime = @UpdateDateTime
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.LeaOrganizationId = od.OrganizationId
			AND o.Lea_Name <> od.[Name]
			AND od.RecordEndDateTime IS NULL

		INSERT INTO ods.OrganizationDetail
		SELECT 
			  o.LeaOrganizationId
 			, LEFT(o.LEA_Name, 60)
			, App.GetOrganizationTypeId('LEA', '001156')
			, NULL
			, @UpdateDateTime
			, NULL
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.LeaOrganizationId = od.OrganizationId
			AND o.Lea_Name <> od.[Name]
			AND od.RecordEndDateTime = @UpdateDateTime

		MERGE ODS.OrganizationDetail AS TARGET
		USING @DistinctNewLeas AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.OrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table

		WHEN NOT MATCHED BY TARGET THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  SOURCE.OrganizationId
				, LEFT(SOURCE.LEA_Name, 60)
				, App.GetOrganizationTypeId('LEA', '001156')
				, @RecordStartDate);

		

 /* Cannot uncomment this until we have the RecordStartDateTime and RecordEndDateTime in the OrganizationIdentifier table
		--Update LEAs that have changed State Identifiers
		IF (SELECT COUNT(*) FROM Staging.Organization WHERE LEA_Identifier_State_ChangedIdentifier = 1) > 0
			BEGIN
			--Only need to end date Identifiers here. The new identifier is added further below.

				UPDATE ODS.OrganizationIdentifier
				SET RecordEndDateTime = DATEADD(yy, -1, @RecordEndDate)
				FROM ODS.Identifier id
				JOIN Staging.Organization tod ON id.Identifier = tod.LEA_Identifier_State_Identifier_Old
				WHERE id.RefOrganizationIdentificationSystemId = @[App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
				AND id.RefOrganizationIdentifierTypeId = @[App].[GetOrganizationIdentifierTypeId]('001072')
				AND tod.LEA_Identifier_State_ChangedIdentifier = 1

				INSERT INTO [ODS].[OrganizationIdentifier]
						   ([Identifier]
						   ,[RefOrganizationIdentificationSystemId]
						   ,[OrganizationId]
						   ,[RefOrganizationIdentifierTypeId])
						   ---Need the RecordStartDateTime added
				SELECT DISTINCT
							tod.LEA_Identifier_State [Identifier]
						   ,@[App].[GetOrganizationIdentifierSystemId]('SEA', '001072') AS [RefOrganizationIdentificationSystemId]
						   ,orgd.OrganizationId [OrganizationId]
						   ,@[App].[GetOrganizationIdentifierTypeId]('001072') as [RefOrganizationIdentifierTypeId]
				FROM ODS.OrganizationDetail orgd
				JOIN Staging.Organization tod ON orgd.OrganizationId = tod.LEAOrganizationId
				WHERE tod.LEA_Identifier_State_ChangedIdentifier = 1

			END

			---Add in if the Identifer (School or LEA) does not exist in the source data anymore, then end date it. but need to figure out which one is the new identifier.  Use the NCES ID to do this.
			---Last year compared to this year -- put in - difference between closed and identifier change -- consider this --- cause Ed-Fi supplies closed.

*/



		--Insert K12 Schools into ODS.Organization--
		DECLARE @NewOrganization TABLE (
			  OrganizationId INT
			, SourceId INT
		)


		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.SchoolOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET SchoolOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		
		--Update School names by end dating the 
		--current OrganizationDetail record and creating a new one
		UPDATE ods.OrganizationDetail
		SET RecordEndDateTime = @UpdateDateTime
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.SchoolOrganizationId = od.OrganizationId
			AND o.School_Name <> od.[Name]
			AND od.RecordEndDateTime IS NULL

		INSERT INTO ods.OrganizationDetail
		SELECT 
 			  o.SchoolOrganizationId
 			, LEFT(o.School_Name, 60)
			, App.GetOrganizationTypeId('K12School', '001156')
			, NULL
			, @UpdateDateTime
			, NULL
		FROM Staging.Organization o
		JOIN ods.OrganizationDetail od
			ON o.LeaOrganizationId = od.OrganizationId
			AND o.Lea_Name <> od.[Name]
			AND od.RecordEndDateTime = @UpdateDateTime

		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.SchoolOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  SOURCE.SchoolOrganizationId
				, LEFT(SOURCE.School_Name, 60)
				, App.GetOrganizationTypeId('K12School', '001156')
				, @RecordStartDate);

		--Schools that have not changed State Identifiers
		UPDATE Staging.Organization
		SET SchoolOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND tod.School_Identifier_State_ChangedIdentifier = 0

		--Schools that have changed State Identifiers
		UPDATE Staging.Organization
		SET SchoolOrganizationId = orgd.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State_Identifier_Old = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND tod.School_Identifier_State_ChangedIdentifier = 1
		
		--Update Schools that have changed State Identifiers

/* Cannot uncomment this until the RecordStartDateTime and RecordEndDateTime have been added to the ODS
		IF (SELECT COUNT(*) FROM Staging.Organization WHERE School_Identifier_State_ChangedIdentifier = 1) > 0
			BEGIN

			--Only need to end date Identifiers here. The new identifier is added further below.

				UPDATE ODS.OrganizationIdentifier
				SET RecordEndDateTime = DATEADD(yy, -1, @RecordEndDate)
				FROM ODS.Identifier id
				JOIN Staging.Organization tod ON id.Identifier = tod.School_Identifier_State_Identifier_Old
				WHERE id.RefOrganizationIdentificationSystemId = @[App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
				AND id.RefOrganizationIdentifierTypeId = @[App].[GetOrganizationIdentifierTypeId]('001073')
				AND tod.School_Identifier_State_ChangedIdentifier = 1

				INSERT INTO [ODS].[OrganizationIdentifier]
						   ([Identifier]
						   ,[RefOrganizationIdentificationSystemId]
						   ,[OrganizationId]
						   ,[RefOrganizationIdentifierTypeId])
						   ---Need the RecordStartDateTime added
				SELECT DISTINCT
							tod.School_Identifier_State [Identifier]
						   ,@[App].[GetOrganizationIdentifierSystemId]('SEA', '001073') AS [RefOrganizationIdentificationSystemId]
						   ,orgd.OrganizationId [OrganizationId]
						   ,@[App].[GetOrganizationIdentifierTypeId]('001073') AS [RefOrganizationIdentifierTypeId]
				FROM ODS.OrganizationDetail orgd
				JOIN Staging.Organization tod ON orgd.OrganizationId = tod.SchoolOrganizationId
				WHERE tod.School_Identifier_State_ChangedIdentifier = 1


			END
*/




		--Create a Special Education Program for each ODS.Organization (School)---------

		--First check to see if Special Education Program already exists so that it is not created a second time--

		UPDATE Staging.Organization
		SET SpecialEducationProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Special Education Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')

		--Insert new Special Education Programs--

		DELETE FROM @NewOrganization;

		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.SpecialEducationProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET SpecialEducationProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.SpecialEducationProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.SpecialEducationProgramOrganizationId
				, 'Special Education Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
				  
		UPDATE Staging.Organization
		SET   SpecialEducationProgramOrganizationId = norg.OrganizationId
			, NewSpecialEducationProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId


		--Create a Title I Program for each ODS.Organization (School)---------

		--First check to see if Title I Program already exists so that it is not created a second time--

		UPDATE Staging.Organization
		SET TitleIProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Title I Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')

		--Insert new Title I Programs--

		DELETE FROM @NewOrganization;

		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.TitleIProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET TitleIProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.TitleIProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.TitleIProgramOrganizationId
				, 'Title I Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
				  
		UPDATE Staging.Organization
		SET   TitleIProgramOrganizationId = norg.OrganizationId
			, NewTitleIProgram= 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId


		--Create a Migrant Program for each ODS.Organization (School)---------

		--First check to see if Migrant Program already exists so that it is not created a second time--

		UPDATE Staging.Organization
		SET MigrantProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Migrant Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')

		--Insert new Migrant Programs--

		DELETE FROM @NewOrganization;

		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.MigrantProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET MigrantProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.MigrantProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.MigrantProgramOrganizationId
				, 'Migrant Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
				  
		UPDATE Staging.Organization
		SET   MigrantProgramOrganizationId = norg.OrganizationId
			, NewMigrantProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId


		--Create a Foster Program for each ODS.Organization (School)---------

		--First check to see if Foster Program already exists so that it is not created a second time--

		UPDATE Staging.Organization
		SET FosterProgramOrganizationId = orgd2.OrganizationId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.School_Identifier_State = orgid.Identifier
		JOIN ODS.OrganizationDetail orgd ON orgid.OrganizationId = orgd.OrganizationID
		JOIN ODS.OrganizationRelationship orgr ON orgd.OrganizationId = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd2 ON orgr.OrganizationId = orgd2.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgd2.Name = 'Foster Program'
			AND orgd2.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')

		--Insert new Foster Programs--

		DELETE FROM @NewOrganization;

		MERGE ODS.Organization AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.FosterProgramOrganizationId
		--When no records are matched, insert
		--the incoming records from source
		--table to target table
		WHEN NOT MATCHED BY TARGET THEN 
			INSERT DEFAULT VALUES
		OUTPUT 
			  INSERTED.OrganizationId AS OrganizationId
			, SOURCE.Id
		INTO @NewOrganization;

		-- Update organization IDs in the staging table
		UPDATE Staging.Organization 
		SET FosterProgramOrganizationId = norg.OrganizationId
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId

		MERGE ODS.OrganizationDetail AS TARGET
		USING Staging.Organization AS SOURCE 
			ON TARGET.OrganizationId = SOURCE.FosterProgramOrganizationId
		WHEN NOT MATCHED THEN 
			INSERT (OrganizationId, [Name], RefOrganizationTypeId,RecordStartDateTime) 
			VALUES (
				  Source.FosterProgramOrganizationId
				, 'Foster Program'
				, App.GetOrganizationTypeId('Program', '001156')
				, @RecordStartDate);
				  
		UPDATE Staging.Organization
		SET   FosterProgramOrganizationId = norg.OrganizationId
			, NewFosterProgram = 1
		FROM Staging.Organization o
		JOIN @NewOrganization norg
			ON o.Id = norg.SourceId



		----------------------------------------------------------------------
		--INSERT State/LEA/K12 School into ODS.OrganizationIdentifier---------
		----------------------------------------------------------------------

		--Insert LEA NCES ID into ODS.OrganizationIdentifier--
		INSERT INTO [ODS].[OrganizationIdentifier]
				   ([Identifier]
				   ,[RefOrganizationIdentificationSystemId]
				   ,[OrganizationId]
				   ,[RefOrganizationIdentifierTypeId])
				   --Here we will want to add the RecordStartDateTime and make it the beginning of the fiscal year each time
				   --It will only add it if it doesn't already exist, so it will be done yearly
		SELECT DISTINCT
					tod.LEA_Identifier_NCES [Identifier]
				   ,[App].[GetOrganizationIdentifierSystemId]('NCES', '001072') AS [RefOrganizationIdentificationSystemId] 
				   ,tod.LEAOrganizationId [OrganizationId]
				   ,[App].[GetOrganizationIdentifierTypeId]('001072') AS [RefOrganizationIdentifierTypeId] 
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier orgid
			ON tod.LEA_Identifier_NCES = orgid.Identifier
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('NCES', '001072')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.OrganizationId = tod.LEAOrganizationId
		WHERE tod.LEA_Identifier_NCES <> ''
			AND tod.LEA_Identifier_NCES IS NOT NULL
			AND orgid.OrganizationId IS NULL

		--Insert K12 School NCES ID into ODS.OrganizationIdentifier--
		INSERT INTO [ODS].[OrganizationIdentifier]
				   ([Identifier]
				   ,[RefOrganizationIdentificationSystemId]
				   ,[OrganizationId]
				   ,[RefOrganizationIdentifierTypeId])
		SELECT DISTINCT
					tod.School_Identifier_NCES [Identifier]
				   ,[App].[GetOrganizationIdentifierSystemId]('NCES', '001073') AS [RefOrganizationIdentificationSystemId]
				   ,tod.SchoolOrganizationId [OrganizationId]
				   ,[App].[GetOrganizationIdentifierTypeId]('001073') AS [RefOrganizationIdentifierTypeId]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier orgid
			ON tod.School_Identifier_NCES = orgid.Identifier
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('NCES', '001073')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.OrganizationId = tod.SchoolOrganizationId
		WHERE tod.School_Identifier_NCES <> ''
			AND tod.School_Identifier_NCES IS NOT NULL
			AND orgid.OrganizationId IS NULL

		--Insert LEA State ID into ODS.OrganizationIdentifier--
		INSERT INTO [ODS].[OrganizationIdentifier]
				   ([Identifier]
				   ,[RefOrganizationIdentificationSystemId]
				   ,[OrganizationId]
				   ,[RefOrganizationIdentifierTypeId])
		SELECT DISTINCT
					tod.LEA_Identifier_State [Identifier]
				   ,[App].[GetOrganizationIdentifierSystemId]('SEA', '001072') AS [RefOrganizationIdentificationSystemId]
				   ,tod.LEAOrganizationId [OrganizationId]
				   ,[App].[GetOrganizationIdentifierTypeId]('001072') AS [RefOrganizationIdentifierTypeId]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier orgid
			ON tod.LEA_Identifier_State = orgid.Identifier
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001072')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')
			AND orgid.OrganizationId = tod.LEAOrganizationId
		WHERE tod.LEA_Identifier_State IS NOT NULL
		AND tod.LEA_Identifier_State <> ''
		AND orgid.OrganizationId IS NULL

		--Insert K12 School State ID into ODS.OrganizationIdentifier--
		INSERT INTO [ODS].[OrganizationIdentifier]
				   ([Identifier]
				   ,[RefOrganizationIdentificationSystemId]
				   ,[OrganizationId]
				   ,[RefOrganizationIdentifierTypeId])
		SELECT DISTINCT
					tod.School_Identifier_State [Identifier]
				   ,[App].[GetOrganizationIdentifierSystemId]('SEA', '001073') AS [RefOrganizationIdentificationSystemId]
				   ,tod.SchoolOrganizationId [OrganizationId]
				   ,[App].[GetOrganizationIdentifierTypeId]('001073') AS [RefOrganizationIdentifierTypeId]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationIdentifier orgid
			ON tod.School_Identifier_State = orgid.Identifier
			AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
			AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND orgid.OrganizationId = tod.SchoolOrganizationId
		WHERE tod.School_Identifier_State IS NOT NULL
		AND tod.School_Identifier_State <> ''
		AND orgid.OrganizationId IS NULL


		--Insert LEA/K12/SEA relationships into ODS.OrganizationRelationiship---------

		--First check to see if the relationship already exists and put the OrganizationRelationshipId back into the temp table
		UPDATE Staging.Organization
		SET SEAToLEA_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEAOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET LEAToSchool_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SchoolOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET SchoolToSpecialEducationProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SpecialEducationProgramOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET SchoolToTitleIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.TitleIProgramOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET SchoolToMigrantProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.MigrantProgramOrganizationId = orgr.OrganizationId

		UPDATE Staging.Organization
		SET SchoolToFosterProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.FosterProgramOrganizationId = orgr.OrganizationId


		--Create relationship between SEA and LEA--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					sd.OrganizationId [Parent_OrganizationId]
				   ,tod.LEAOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		CROSS JOIN Staging.StateDetail sd
		WHERE tod.SEAToLEA_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET SEAToLEA_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.LEAOrganizationId = orgr.OrganizationId
		AND tod.SEAToLEA_OrganizationRelationshipId IS NULL

		--Create relationship between LEA and K12 School--

		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.LEAOrganizationId [Parent_OrganizationId]
				   ,tod.SchoolOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.LEAToSchool_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET LEAToSchool_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.LEAOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SchoolOrganizationId = orgr.OrganizationId
		AND tod.LEAToSchool_OrganizationRelationshipId IS NULL


		--Create relationship between K12 School and Special Education Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.SpecialEducationProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToSpecialEducationProgram_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET SchoolToSpecialEducationProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.SpecialEducationProgramOrganizationId = orgr.OrganizationId

		--Create relationship between K12 School and Title I Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.TitleIProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToTitleIProgram_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET SchoolToTitleIProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.TitleIProgramOrganizationId = orgr.OrganizationId

		--Create relationship between K12 School and Migrant Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.MigrantProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToMigrantProgram_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET SchoolToMigrantProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.MigrantProgramOrganizationId = orgr.OrganizationId

		--Create relationship between K12 School and Foster Program--
		INSERT INTO [ODS].[OrganizationRelationship]
				   ([Parent_OrganizationId]
				   ,[OrganizationId]
				   ,[RefOrganizationRelationshipId])
		SELECT DISTINCT
					tod.SchoolOrganizationId [Parent_OrganizationId]
				   ,tod.FosterProgramOrganizationId [OrganizationId]
				   ,NULL [RefOrganizationRelationshipId]
		FROM Staging.Organization tod
		WHERE tod.SchoolToFosterProgram_OrganizationRelationshipId IS NULL

		UPDATE Staging.Organization
		SET SchoolToFosterProgram_OrganizationRelationshipId = orgr.OrganizationRelationshipId
		FROM Staging.Organization tod
		JOIN ODS.OrganizationRelationship orgr ON tod.SchoolOrganizationId = orgr.Parent_OrganizationId
		WHERE tod.FosterProgramOrganizationId = orgr.OrganizationId

		-----------------------------------------------------------------------------------
		----Create SpecialEducationOrganizationProgramType --------------------------------
		-----------------------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('04888') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('04888')
		WHERE orgd.Name = 'Special Education Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL


		-----------------------------------------------------------------------------------
		----Create TitleIOrganizationProgramType ------------------------------------------
		-----------------------------------------------------------------------------------

		----Need to modify the 09999 code to match the Title I Program code when the Title I
		----program code is added to the RefProgramType table.

		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('09999') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('09999')
		WHERE orgd.Name = 'Title I Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL


		-----------------------------------------------------------------------------------
		----Create MigrantOrganizationProgramType -----------------------------------------
		-----------------------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('04920') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('04920')
		WHERE orgd.Name = 'Migrant Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL


		-----------------------------------------------------------------------------------
		----Create FosterOrganizationProgramType -----------------------------------------
		-----------------------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationProgramType]
				   ([OrganizationId]
				   ,[RefProgramTypeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,App.GetProgramTypeId('75000') AS [RefProgramTypeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM ODS.OrganizationDetail orgd
		LEFT JOIN ODS.OrganizationProgramType orgp 
			ON orgd.OrganizationId = orgp.OrganizationId
			AND orgp.RefProgramTypeId = App.GetProgramTypeId('75000')
		WHERE orgd.Name = 'Foster Program'
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156')
		AND orgp.OrganizationId IS NULL


		--Update the smaller temporary tables to contain the OrganizationId
		--Need to move this down below where we add the school or they won't have IDs yet.
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = oi.OrganizationId
		FROM Staging.StateDetail oi
		JOIN Staging.OrganizationAddress toda ON oi.SeaStateIdentifier = toda.OrganizationIdentifier
		WHERE toda.OrganizationType = App.GetOrganizationTypeId('SEA', '001156')

		UPDATE Staging.OrganizationAddress
		SET OrganizationId = tod.LEAOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationAddress toda ON tod.LEA_Identifier_State = toda.OrganizationIdentifier
		WHERE toda.OrganizationType = App.GetOrganizationTypeId('LEA', '001156')

		UPDATE Staging.OrganizationAddress
		SET OrganizationId = tod.SchoolOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationAddress toda ON tod.School_Identifier_State = toda.OrganizationIdentifier
		WHERE toda.OrganizationType = App.GetOrganizationTypeId('K12School', '001156')

		UPDATE Staging.OrganizationPhone
		SET OrganizationId = sd.OrganizationId
		FROM Staging.StateDetail sd
		JOIN Staging.OrganizationPhone todp ON sd.SeaStateIdentifier = todp.OrganizationIdentifier
		WHERE todp.OrganizationType = App.GetOrganizationTypeId('SEA', '001156')

		UPDATE Staging.OrganizationPhone
		SET OrganizationId = tod.LEAOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationPhone todp ON tod.LEA_Identifier_State = todp.OrganizationIdentifier
		WHERE todp.OrganizationType = App.GetOrganizationTypeId('LEA', '001156')

		UPDATE Staging.OrganizationPhone
		SET OrganizationId = tod.SchoolOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationPhone todp ON tod.School_Identifier_State = todp.OrganizationIdentifier
		WHERE todp.OrganizationType = App.GetOrganizationTypeId('K12School', '001156')

		UPDATE Staging.OrganizationGradeOffered
		SET OrganizationId = tod.SchoolOrganizationId
		FROM Staging.Organization tod
		JOIN Staging.OrganizationGradeOffered todgo ON tod.School_Identifier_State = todgo.OrganizationIdentifier

		-------------------------------------------------------------------
		----Create OrganizationWebsite ------------------------------------
		-------------------------------------------------------------------

		--Organizaton Website needs its own Primary Key and RecordStartDateTime and RecordEndDateTime

		--SEA Website

		INSERT INTO [ODS].[OrganizationWebsite]
					([OrganizationId]
					,[Website])
		SELECT DISTINCT
					sd.OrganizationId [OrganizationId]
					,sd.Sea_WebSiteAddress [Website]
		FROM Staging.StateDetail sd
		LEFT JOIN ODS.OrganizationWebsite orgw 
			ON sd.OrganizationId = orgw.OrganizationId
			AND sd.Sea_WebSiteAddress = orgw.Website
		WHERE sd.Sea_WebSiteAddress IS NOT NULL
			AND sd.Sea_WebSiteAddress <> ''
			AND orgw.OrganizationId IS NULL

		--LEA Website
		INSERT INTO [ODS].[OrganizationWebsite]
					([OrganizationId]
					,[Website])
		SELECT DISTINCT
					tod.LEAOrganizationId [OrganizationId]
					,tod.LEA_WebSiteAddress [Website]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationWebsite orgw 
			ON tod.LEAOrganizationId = orgw.OrganizationId
			AND tod.LEA_WebSiteAddress = orgw.Website
		WHERE tod.LEA_WebSiteAddress IS NOT NULL
			AND tod.LEA_WebSiteAddress <> ''
			AND orgw.OrganizationId IS NULL

/* -- Need the OrganizationWebsiteId and RecordStart/EndDateTime
		UPDATE Staging.Organization
		SET LEA_OrganizationWebsiteId = orgw.OrganizationWebsiteId
		FROM Staging.Organization tod
		WHERE tod.LEA_WebSiteAddress IS NOT NULL
		AND tod.LEA_WebSiteAddress <> ''
		JOIN ODS.OrganizationWebsite orgw ON tod.LEAOrganizationId = orgw.OrganizationId
		WHERE tod.LEA_WebSiteAddress = orgw.Website

		UPDATE ODS.OrganizationWebsite
		SET RecordEndDateTime = @RecordStartDate
		FROM ODS.OrganizationWebsite orgw
		JOIN ODS.OrganizationDetail orgd ON orgw.OrganizationId = orgd.OrganizationId
		WHERE orgd.RefOrganizationTypeId = @RefOrganizationTypeId_LEA
		AND RecordEndDateTime IS NOT NULL
		AND NOT EXISTS (SELECT 'x' FROM Staging.Organization tod 
							WHERE orgw.OrganizationWebsiteId = tod.LEA_OrganizationWebsiteId)
*/						

		--School Website
		INSERT INTO [ODS].[OrganizationWebsite]
					([OrganizationId]
					,[Website])
		SELECT DISTINCT
					tod.SchoolOrganizationId [OrganizationId]
					,tod.School_WebSiteAddress [Website]
		FROM Staging.Organization tod
		LEFT JOIN ODS.OrganizationWebsite orgw 
			ON tod.SchoolOrganizationId = orgw.OrganizationId
			AND tod.School_WebSiteAddress = orgw.Website
		WHERE tod.School_WebSiteAddress IS NOT NULL
			AND tod.School_WebSiteAddress <> ''
			AND orgw.OrganizationId IS NULL

/* -- Need the OrganizationWebsiteId and RecordStart/EndDateTime
		UPDATE Staging.Organization
		SET School_OrganizationWebsiteId = orgw.OrganizationWebsiteId
		FROM Staging.Organization tod
		WHERE tod.School_WebSiteAddress IS NOT NULL
		AND tod.School_WebSiteAddress <> ''
		JOIN ODS.OrganizationWebsite orgw ON tod.SchoolOrganizationId = orgw.OrganizationId
		WHERE tod.School_WebSiteAddress = orgw.Website

		UPDATE ODS.OrganizationWebsite
		SET RecordEndDateTime = @RecordStartDate
		FROM ODS.OrganizationWebsite orgw
		JOIN ODS.OrganizationDetail orgd ON orgw.OrganizationId = orgd.OrganizationId
		WHERE orgd.RefOrganizationTypeId = @GetOrganizationTypeId('K12School', '001156')
		AND RecordEndDateTime IS NOT NULL
		AND NOT EXISTS (SELECT 'x' FROM Staging.Organization tod 
							WHERE orgw.OrganizationWebsiteId = tod.School_OrganizationWebsiteId)
*/	


		--End Date any out of date website addresses once the RecordStartDateTime and RecordEndDateTime has been added to Generate

		-------------------------------------------------------------------
		----Create OrganizationTelephone ----------------------------------
		-------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationTelephone]
					([OrganizationId]
					,[TelephoneNumber]
					,[PrimaryTelephoneNumberIndicator]
					,[RefInstitutionTelephoneTypeId])
		SELECT DISTINCT 
					 tod.OrganizationId [OrganizationId]
					,tod.TelephoneNumber [TelephoneNumber]
					,0 [PrimaryTelephoneNumberIndicator]
					,ritt.RefInstitutionTelephoneTypeId [RefInstitutionTelephoneTypeId]
		FROM Staging.OrganizationPhone tod
		JOIN ODS.SourceSystemReferenceData ittss
			ON tod.InstitutionTelephoneNumberType = ittss.InputCode
			AND ittss.TableName = 'RefInstitutionTelephoneType'
			AND ittss.SchoolYear = @SchoolYear
		JOIN ODS.RefInstitutionTelephoneType ritt
			ON ittss.OutputCode = ritt.Code
		LEFT JOIN ODS.OrganizationTelephone orgt 
			ON tod.OrganizationId = orgt.organizationId
			AND ritt.RefInstitutionTelephoneTypeId = orgt.RefInstitutionTelephoneTypeId
		WHERE orgt.RefInstitutionTelephoneTypeId IS NULL
			AND tod.TelephoneNumber IS NOT NULL
			AND tod.TelephoneNumber <> ''
			AND tod.OrganizationId IS NOT NULL
		--End Date and out of date phone numbers once the RecordStartDateTime and RecordEndDateTime has been added to Generate

		-------------------------------------------------------------------
		----Create OrganizationOperationalStatus --------------------------
		-------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationOperationalStatus]
					([OrganizationId]
					,[RefOperationalStatusId]
					,[OperationalStatusEffectiveDate])
		SELECT DISTINCT
					 tod.LEAOrganizationId [OrganizationId]
					,ros.RefOperationalStatusId [RefOperationalStatusId]
					,tod.LEA_OperationalStatusEffectiveDate [OperationalStatusEffectiveDate]
		FROM Staging.Organization tod
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.LEA_OperationalStatus = osss.InputCode
			AND osss.TableName = 'RefOperationalStatus'
			AND osss.SchoolYear = @SchoolYear
		JOIN ods.RefOperationalStatus ros
			ON osss.OutputCode = ros.Code
		LEFT JOIN ODS.OrganizationOperationalStatus orgs 
			ON tod.LEAOrganizationId = orgs.OrganizationId
			AND ros.RefOperationalStatusId = orgs.RefOperationalStatusId
			AND tod.LEA_OperationalStatusEffectiveDate = orgs.OperationalStatusEffectiveDate
		WHERE tod.LEA_OperationalStatus IS NOT NULL
			AND tod.LEA_OperationalStatus <> ''
			AND orgs.OrganizationId IS NULL

		INSERT INTO [ODS].[OrganizationOperationalStatus]
					([OrganizationId]
					,[RefOperationalStatusId]
					,[OperationalStatusEffectiveDate])
		SELECT DISTINCT
					 tod.SchoolOrganizationId [OrganizationId]
					,ros.RefOperationalStatusId [RefOperationalStatusId]
					,tod.School_OperationalStatusEffectiveDate [OperationalStatusEffectiveDate]
		FROM Staging.Organization tod
		JOIN ODS.SourceSystemReferenceData osss
			ON tod.School_OperationalStatus = osss.InputCode
			AND osss.TableName = 'RefOperationalStatus'
			AND osss.SchoolYear = @SchoolYear
		JOIN ods.RefOperationalStatus ros
			ON osss.OutputCode = ros.Code
		LEFT JOIN ODS.OrganizationOperationalStatus orgs 
			ON tod.SchoolOrganizationId = orgs.OrganizationId
			AND ros.RefOperationalStatusId = orgs.RefOperationalStatusId
			AND tod.School_OperationalStatusEffectiveDate = orgs.OperationalStatusEffectiveDate
		WHERE tod.School_OperationalStatus IS NOT NULL
			AND tod.School_OperationalStatus <> ''
			AND orgs.OrganizationId IS NULL


		-------------------------------------------------------------------
		----Create K12LEA and K12School -----------------------------------
		-------------------------------------------------------------------
					   
		INSERT INTO [ODS].[K12Lea]
					([OrganizationId]
					,[RefLeaTypeId]
					,[SupervisoryUnionIdentificationNumber]
					,[RefLEAImprovementStatusId]
					,[RefPublicSchoolChoiceStatusId]
					,[CharterSchoolIndicator])
		SELECT DISTINCT
					 tod.LEAOrganizationId [OrganizationId]
					,rlt.RefLeaTypeId [RefLeaTypeId]
					,tod.LEA_SupervisoryUnionIdentificationNumber [SupervisoryUnionIdentificationNumber]
					,NULL [RefLEAImprovementStatusId]
					,NULL [RefPublicSchoolChoiceStatusId]
				    ,CASE tod.LEA_CharterSchoolIndicator
						WHEN 'College/University Charter' THEN 1
						WHEN 'Not a Charter School' THEN 0
						WHEN 'Open Enrollment' THEN 1
						WHEN 'School Charter' THEN 1
 				     END AS [CharterSchoolIndicator]
		FROM Staging.Organization tod
		LEFT JOIN ODS.SourceSystemReferenceData ltss
			ON tod.LEA_Type = ltss.InputCode
			AND ltss.TableName = 'RefLeaType'
			AND ltss.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefLeaType rlt
			ON ltss.OutputCode = rlt.Code
		LEFT JOIN ODS.K12Lea kl 
			ON tod.LEAOrganizationId = kl.OrganizationId
		WHERE tod.LEA_Type IS NOT NULL
			AND kl.OrganizationId IS NULL

		--Need to Add RecordStartDate and RecordEndDateTime to the K12Lea table--
		--AND NOT EXISTS (SELECT 'X' FROM ODS.K12Lea kl WHERE tod.LEAOrganizationId = kl.OrganizationId
		--												AND kl.RecordStartDateTime = @RecordStartDate
		--												AND kl.RecordEndDateTime = @RecordEndDate)	 

		INSERT INTO [ODS].[K12School]
				   ([OrganizationId]
				   ,[RefSchoolTypeId]
				   ,[RefSchoolLevelId]
				   ,[RefAdministrativeFundingControlId]
				   ,[CharterSchoolIndicator]
				   ,[RefCharterSchoolTypeId]
				   ,[RefIncreasedLearningTimeTypeId]
				   ,[RefStatePovertyDesignationId]
				   ,[CharterSchoolApprovalYear]
				   ,[K12CharterSchoolApprovalAgencyId]
				   ,[AccreditationAgencyName]
				   ,[CharterSchoolOpenEnrollmentIndicator]
				   ,[CharterSchoolContractApprovalDate]
				   ,[CharterSchoolContractIdNumber]
				   ,[CharterSchoolContractRenewalDate]
				   ,[K12CharterSchoolManagementOrganizationId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime]
				   )
		SELECT DISTINCT
				    tod.SchoolOrganizationId [OrganizationId]
				   ,rst.RefSchoolTypeId [RefSchoolTypeId]
				   ,NULL [RefSchoolLevelId] --Do we need this?
				   ,NULL [RefAdministrativeFundingControlId]
				   ,CASE School_CharterSchoolIndicator
						WHEN 'College/University Charter' THEN 1
						WHEN 'Not a Charter School' THEN 0
						WHEN 'Open Enrollment' THEN 1
						WHEN 'School Charter' THEN 1
 				    END AS [CharterSchoolIndicator]
				   ,NULL [RefCharterSchoolTypeId]
				   ,NULL [RefIncreasedLearningTimeTypeId]
				   ,NULL [RefStatePovertyDesignationId]
				   ,NULL [CharterSchoolApprovalYear]
				   ,NULL [K12CharterSchoolApprovalAgencyId]
				   ,NULL [AccreditationAgencyName]
				   ,NULL [CharterSchoolOpenEnrollmentIndicator]
				   ,NULL [CharterSchoolContractApprovalDate]
				   ,NULL [CharterSchoolContractIdNumber]
				   ,NULL [CharterSchoolContractRenewalDate]
				   ,NULL [K12CharterSchoolManagementOrganizationId]
				   ,@RecordStartDate
				   ,@RecordEndDate
		FROM Staging.Organization tod
		LEFT JOIN ODS.SourceSystemReferenceData stss
			ON tod.School_Type = stss.InputCode
			AND stss.TableName = 'RefSchoolType'
			AND stss.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefSchoolType rst
			ON stss.OutputCode = rst.Code
		LEFT JOIN ODS.K12School ks 
			ON tod.SchoolOrganizationId = ks.OrganizationId
			AND ks.RecordEndDateTime = @RecordStartDate
			AND ks.RecordEndDateTime = @RecordEndDate
		WHERE ks.K12SchoolId IS NULL


		-------------------------------------------------------------------
		----Create Grades Offered -----
		-------------------------------------------------------------------
		INSERT INTO ODS.K12SchoolGradeOffered
		SELECT 
			  sch.K12SchoolId
			, rgl.RefGradeLevelId
		FROM Staging.OrganizationGradeOffered tod
		JOIN ODS.K12School sch 
			ON tod.OrganizationId = sch.OrganizationId
		JOIN ODS.SourceSystemReferenceData grd
			ON tod.GradeOffered = grd.InputCode
			AND grd.TableName = 'RefGradeLevel'
			AND grd.SchoolYear = @SchoolYear
		JOIN ODS.RefGradeLevel rgl 
			ON grd.OutputCode = rgl.Code
		JOIN ODS.RefGradeLevelType rglt 
			ON rgl.RefGradeLevelTypeId = rglt.RefGradeLevelTypeId 
			AND rglt.Code = '000131'
			

		-------------------------------------------------------------------
		----Create Location, OrganizationLocation and LocationAddress -----
		-------------------------------------------------------------------


		-------Check for existing address first--------

		---Update the OrganizationId on the temporary table
		UPDATE Staging.OrganizationAddress
		SET OrganizationId = orgid.OrganizationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.OrganizationIdentifier = orgid.Identifier
		WHERE tod.OrganizationType = App.GetOrganizationTypeId('SEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001491')

		UPDATE Staging.OrganizationAddress
		SET OrganizationId = orgid.OrganizationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.OrganizationIdentifier = orgid.Identifier
		WHERE tod.OrganizationType = App.GetOrganizationTypeId('LEA', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001072')

		UPDATE Staging.OrganizationAddress
		SET OrganizationId = orgid.OrganizationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.OrganizationIdentifier orgid ON tod.OrganizationIdentifier = orgid.Identifier
		WHERE tod.OrganizationType = App.GetOrganizationTypeId('K12School', '001156')
		AND orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')

		---Update the location ID where the address is identical
		UPDATE Staging.OrganizationAddress
		SET LocationId = la.LocationId
		FROM Staging.OrganizationAddress tod
		JOIN ODS.SourceSystemReferenceData oltss
			ON tod.AddressTypeForOrganization = oltss.InputCode
			AND oltss.TableName = 'RefOrganizationLocationType'
			AND oltss.SchoolYear = @SchoolYear
		JOIN ODS.OrganizationLocation orgl ON tod.OrganizationId = orgl.OrganizationId
		JOIN ODS.RefOrganizationLocationType rolt
			ON oltss.OutputCode = rolt.Code
			AND orgl.RefOrganizationLocationTypeId = rolt.RefOrganizationLocationTypeId
		JOIN ODS.LocationAddress la ON orgl.LocationId = la.LocationId
		WHERE tod.AddressStreetNumberAndName = la.StreetNumberAndName
			AND tod.AddressApartmentRoomOrSuite = la.ApartmentRoomOrSuiteNumber
			AND tod.AddressCity = la.City
			AND tod.AddressPostalCode = la.PostalCode
			AND tod.RefStateId = la.RefStateId

		--still need to address where the address exists but doesn't match and we have no way to end date it or start date it--
		--This cannot be done until the ODS is updated with the RecordStartDateTime and RecordEndDateTime on OrganizationLocation--
		--Until that is addressed, we will drop all non matching records with the same AddressTypeForOrganization that we are trying
		--to add new below--

		CREATE TABLE #existing_organizationlocation (
			 OrganizationId VARCHAR(100)
			,LocationId VARCHAR(100)
			,RefOrganizationLocationTypeId VARCHAR(100)
			,MarkForDeletion BIT)
		INSERT INTO #existing_organizationlocation
			(OrganizationId
			,LocationId
			,RefOrganizationLocationTypeId
			,MarkForDeletion)
		SELECT DISTINCT
			 orgl.OrganizationId OrganizationId
			,orgl.LocationId LocationId
			,orgl.RefOrganizationLocationTypeId RefOrganizationLocationTypeId
			,0 MarkForDeletion
		FROM ODS.OrganizationLocation orgl
		WHERE orgl.LocationId NOT IN (SELECT tod.LocationId FROM Staging.OrganizationAddress tod WHERE tod.LocationId IS NOT NULL)

		UPDATE #existing_organizationlocation
		SET MarkForDeletion = 1
		WHERE LocationId IN
		(SELECT orgl.LocationId
		FROM ODS.OrganizationLocation orgl
		JOIN Staging.OrganizationAddress tod 
			ON orgl.OrganizationId = tod.OrganizationId
		JOIN ODS.SourceSystemReferenceData oltss
			ON tod.AddressTypeForOrganization = oltss.InputCode
			AND oltss.TableName = 'RefOrganizationLocationType'
			AND oltss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationLocationType rolt
			ON oltss.OutputCode = rolt.Code
		WHERE orgl.RefOrganizationLocationTypeId = rolt.RefOrganizationLocationTypeId)

		DELETE FROM ODS.LocationAddress WHERE LocationId IN (SELECT LocationId FROM #existing_organizationlocation WHERE MarkForDeletion = 1)
		DELETE FROM ODS.OrganizationLocation WHERE LocationId IN (SELECT LocationId FROM #existing_organizationlocation WHERE MarkForDeletion = 1)
		DELETE FROM ODS.Location WHERE LocationId IN (SELECT LocationId FROM #existing_organizationlocation WHERE MarkForDeletion = 1)

		WHILE (SELECT COUNT(*) FROM Staging.OrganizationAddress WHERE LocationId IS NULL) > 0
			BEGIN

				SET @ID = (SELECT TOP 1 ID FROM Staging.OrganizationAddress WHERE LocationId IS NULL)
				
				INSERT INTO [ODS].[Location] DEFAULT VALUES
				SET @LocationId = SCOPE_IDENTITY();

				UPDATE Staging.OrganizationAddress SET LocationId = @LocationId WHERE ID = @ID

			END

		INSERT INTO [ODS].[OrganizationLocation]
					([OrganizationId]
					,[LocationId]
					,[RefOrganizationLocationTypeId])
		SELECT DISTINCT
					tod.OrganizationId [OrganizationId]
					,tod.LocationId [LocationId]
					,rolt.RefOrganizationLocationTypeId [RefOrganizationLocationTypeId]
		FROM Staging.OrganizationAddress tod
		JOIN ODS.SourceSystemReferenceData oltss
			ON tod.AddressTypeForOrganization = oltss.InputCode
			AND oltss.TableName = 'RefOrganizationLocationType'
			AND oltss.SchoolYear = @SchoolYear
		JOIN ODS.RefOrganizationLocationType rolt
			ON oltss.OutputCode = rolt.Code
		LEFT JOIN ods.OrganizationLocation ol
			ON ol.OrganizationId = tod.OrganizationId
			AND ol.LocationId = tod.locationId
		WHERE tod.OrganizationId IS NOT NULL
			AND tod.LocationId IS NOT NULL
			AND ol.OrganizationId IS NULL

		INSERT INTO [ODS].[LocationAddress]
					([LocationId]
					,[StreetNumberAndName]
					,[ApartmentRoomOrSuiteNumber]
					,[BuildingSiteNumber]
					,[City]
					,[RefStateId]
					,[PostalCode]
					,[CountyName]
					,[RefCountyId]
					,[RefCountryId]
					,[Latitude]
					,[Longitude]
					,[RefERSRuralUrbanContinuumCodeId])
		SELECT DISTINCT
					tod.LocationId [LocationId]
					,tod.AddressStreetNumberAndName [StreetNumberAndName]
					,tod.AddressApartmentRoomOrSuite [ApartmentRoomOrSuiteNumber]
					,NULL [BuildingSiteNumber]
					,tod.AddressCity [City]
					,tod.RefStateId [RefStateId]
					,tod.AddressPostalCode [PostalCode]
					,NULL [CountyName]
					,NULL [RefCountyId]
					,NULL [RefCountryId]
					,NULL [Latitude]
					,NULL [Longitude]
					,NULL [RefERSRuralUrbanContinuumCodeId]
		FROM Staging.OrganizationAddress tod
		LEFT JOIN [ODS].[LocationAddress] la
			on tod.locationid = la.locationid 
		WHERE la.LocationId IS NULL

		-------------------------------------------------------------------
		----Create OrganizationCalendar and OrganizationCalendarSession----
		-------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationCalendar]
				   ([OrganizationId]
				   ,[CalendarCode]
				   ,[CalendarDescription]
				   ,[CalendarYear])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,orgid.Identifier [CalendarCode]
				   ,orgid.Identifier [CalendarDescription]
				   ,@SchoolYear AS [CalendarYear]
		FROM ODS.OrganizationDetail orgd
		JOIN ODS.OrganizationIdentifier orgid ON orgd.OrganizationId = orgid.OrganizationId
		JOIN ODS.RefOrganizationType rot ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
		JOIN ODS.RefOrganizationIdentificationSystem rois ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		LEFT JOIN ODS.OrganizationCalendar orgc 
			ON orgd.OrganizationId = orgc.OrganizationId
			AND orgc.CalendarYear = @SchoolYear
		WHERE rot.Code = 'K12School'
		AND rois.Code = 'SEA'
		AND orgc.OrganizationCalendarId IS NULL

		INSERT INTO [ODS].[OrganizationCalendar]
				   ([OrganizationId]
				   ,[CalendarCode]
				   ,[CalendarDescription]
				   ,[CalendarYear])
		SELECT DISTINCT
					orgd.OrganizationId [OrganizationId]
				   ,orgid.Identifier [CalendarCode]
				   ,orgid.Identifier [CalendarDescription]
				   ,@SchoolYear AS [CalendarYear]
		FROM ODS.OrganizationDetail orgd
		JOIN ODS.OrganizationIdentifier orgid ON orgd.OrganizationId = orgid.OrganizationId
		JOIN ODS.RefOrganizationType rot ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
		JOIN ODS.RefOrganizationIdentificationSystem rois ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		LEFT JOIN ODS.OrganizationCalendar orgc 
			ON orgd.OrganizationId = orgc.OrganizationId
			AND orgc.CalendarYear = @SchoolYear
		WHERE rot.Code = 'LEA'
		AND rois.Code = 'SEA'
		AND orgc.OrganizationCalendarId IS NULL

		INSERT INTO [ODS].[OrganizationCalendarSession]
				   ([Designator]
				   ,[BeginDate]
				   ,[EndDate]
				   ,[RefSessionTypeId]
				   ,[InstructionalMinutes]
				   ,[Code]
				   ,[Description]
				   ,[MarkingTermIndicator]
				   ,[SchedulingTermIndicator]
				   ,[AttendanceTermIndicator]
				   ,[OrganizationCalendarId]
				   ,[DaysInSession]
				   ,[FirstInstructionDate]
				   ,[LastInstructionDate]
				   ,[MinutesPerDay]
				   ,[SessionStartTime]
				   ,[SessionEndTime])
		SELECT DISTINCT 
					NULL [Designator]
				   ,@RecordStartDate [BeginDate]
				   ,@RecordEndDate [EndDate]
				   ,NULL [RefSessionTypeId]
				   ,NULL [InstructionalMinutes]
				   ,NULL [Code]
				   ,NULL [Description]
				   ,NULL [MarkingTermIndicator]
				   ,NULL [SchedulingTermIndicator]
				   ,NULL [AttendanceTermIndicator]
				   ,orgc.OrganizationCalendarId [OrganizationCalendarId]
				   ,NULL [DaysInSession]
				   ,NULL [FirstInstructionDate]
				   ,NULL [LastInstructionDate]
				   ,NULL [MinutesPerDay]
				   ,NULL [SessionStartTime]
				   ,NULL [SessionEndTime]
		FROM ODS.OrganizationCalendar orgc
		LEFT JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgc.OrganizationCalendarId = orgcs.OrganizationCalendarId 
			AND orgc.CalendarYear = @SchoolYear
		WHERE orgc.CalendarYear = @SchoolYear
			AND orgcs.OrganizationCalendarId IS NULL

		-------------------------------------------------------------------
		----Move Organization Financial Data Into Appropriate Tables ------
		-------------------------------------------------------------------

		INSERT INTO [ODS].[K12LeaFederalFunds]
           ([OrganizationCalendarSessionId]
           ,[InnovativeProgramsFundsReceived]
           ,[InnovativeDollarsSpent]
           ,[InnovativeDollarsSpentOnStrategicPriorities]
           ,[PublicSchoolChoiceFundsSpent]
           ,[SesFundsSpent]
           ,[SesSchoolChoice20PercentObligation]
           ,[RefRlisProgramUseId]
           ,[ParentalInvolvementReservationFunds]
           ,[RecordStartDateTime]
           ,[RecordEndDateTime])
		SELECT DISTINCT
           orgcs.OrganizationCalendarSessionId [OrganizationCalendarSessionId] 
           ,NULL [InnovativeProgramsFundsReceived]
           ,NULL [InnovativeDollarsSpent]
           ,NULL [InnovativeDollarsSpentOnStrategicPriorities]
           ,NULL [PublicSchoolChoiceFundsSpent]
           ,NULL [SesFundsSpent]
           ,NULL [SesSchoolChoice20PercentObligation]
           ,NULL [RefRlisProgramUseId]
           ,orgff.ParentalInvolvementReservationFunds [ParentalInvolvementReservationFunds]
           ,@RecordStartDate [RecordStartDateTime]
           ,@RecordEndDate [RecordEndDateTime]	
		FROM Staging.OrganizationFederalFunding orgff
		JOIN ODS.OrganizationIdentifier orgid 
			ON orgff.OrganizationIdentifier = orgid.Identifier
		JOIN ODS.OrganizationCalendar orgc 
			ON orgid.OrganizationId = orgc.OrganizationId
		JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgc.OrganizationCalendarId = orgcs.OrganizationCalendarId
		JOIN ODS.RefOrganizationType rot 
			ON orgff.OrganizationType = rot.RefOrganizationTypeId
		JOIN ODS.RefOrganizationIdentificationSystem rois 
			ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		WHERE rot.Code = 'LEA'
		AND rois.Code = 'SEA'


		INSERT INTO [ODS].[K12FederalFundAllocation]
				   ([OrganizationCalendarSessionId]
				   ,[FederalProgramCode]
				   ,[RefFederalProgramFundingAllocationTypeId]
				   ,[FederalProgramsFundingAllocation]
				   ,[FundsTransferAmount]
				   ,[SchoolImprovementAllocation]
				   ,[LeaTransferabilityOfFunds]
				   ,[RefLeaFundsTransferTypeId]
				   ,[SchoolImprovementReservedPercent]
				   ,[SesPerPupilExpenditure]
				   ,[NumberOfImmigrantProgramSubgrants]
				   ,[RefReapAlternativeFundingStatusId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
				    orgcs.OrganizationCalendarSessionId [OrganizationCalendarSessionId]
				   ,orgff.FederalProgramCode [FederalProgramCode]
				   ,NULL [RefFederalProgramFundingAllocationTypeId]
				   ,orgff.FederalProgramsFundingAllocation [FederalProgramsFundingAllocation]
				   ,NULL [FundsTransferAmount]
				   ,NULL [SchoolImprovementAllocation]
				   ,NULL [LeaTransferabilityOfFunds]
				   ,NULL [RefLeaFundsTransferTypeId]
				   ,NULL [SchoolImprovementReservedPercent]
				   ,NULL [SesPerPupilExpenditure]
				   ,NULL [NumberOfImmigrantProgramSubgrants]
				   ,NULL [RefReapAlternativeFundingStatusId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,@RecordEndDate [RecordEndDateTime]
		FROM Staging.OrganizationFederalFunding orgff
		JOIN ODS.OrganizationIdentifier orgid 
			ON orgff.OrganizationIdentifier = orgid.Identifier
		JOIN ODS.OrganizationCalendar orgc 
			ON orgid.OrganizationId = orgc.OrganizationId
		JOIN ODS.OrganizationCalendarSession orgcs 
			ON orgc.OrganizationCalendarId = orgcs.OrganizationCalendarId
		JOIN ODS.RefOrganizationType rot 
			ON orgff.OrganizationType = rot.RefOrganizationTypeId
		JOIN ODS.RefOrganizationIdentificationSystem rois 
			ON orgid.RefOrganizationIdentificationSystemId = rois.RefOrganizationIdentificationSystemId
		WHERE rot.Code = 'LEA'
		AND rois.Code = 'SEA'	
		AND orgff.FederalProgramCode IS NOT NULL
		AND orgff.FederalProgramsFundingAllocation IS NOT NULL
		AND orgff.ParentalInvolvementReservationFunds IS NOT NULL			

		--------------------------------------
		--Insert Cheif State School Officer --
		--------------------------------------

		CREATE TABLE #PersonIdtoPersonIdentifier 
			(PersonID INT
			,Identifier VARCHAR(50))

		MERGE INTO [ODS].[Person] as tgt
		USING Staging.StateDetail as nisl
		ON 1 = 2  --guarantees no matches
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (PersonMasterId)
		  VALUES(NULL)
		  OUTPUT INSERTED.PersonID, nisl.SeaContact_Identifier INTO #PersonIdtoPersonIdentifier;

		UPDATE Staging.StateDetail
		SET PersonId = pt.PersonID
		FROM Staging.StateDetail nisl
		JOIN #PersonIdtoPersonIdentifier pt ON nisl.SeaContact_Identifier = pt.Identifier

		INSERT INTO [ODS].[PersonDetail]
				   ([PersonId]
				   ,[FirstName]
				   ,[MiddleName]
				   ,[LastName]
				   ,[GenerationCode]
				   ,[Prefix]
				   ,[Birthdate]
				   ,[RefSexId]
				   ,[HispanicLatinoEthnicity]
				   ,[RefUSCitizenshipStatusId]
				   ,[RefVisaTypeId]
				   ,[RefStateOfResidenceId]
				   ,[RefProofOfResidencyTypeId]
				   ,[RefHighestEducationLevelCompletedId]
				   ,[RefPersonalInformationVerificationId]
				   ,[BirthdateVerification]
				   ,[RefTribalAffiliationId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
				    PersonId [PersonId]
				   ,SeaContact_FirstName [FirstName]
				   ,NULL [MiddleName]
				   ,SeaContact_LastOrSurname [LastName]
				   ,NULL [GenerationCode]
				   ,SeaContact_PersonalTitleOrPrefix [Prefix]
				   ,NULL [Birthdate]
				   ,NULL [RefSexId]
				   ,NULL [HispanicLatinoEthnicity]
				   ,NULL [RefUSCitizenshipStatusId]
				   ,NULL [RefVisaTypeId]
				   ,NULL [RefStateOfResidenceId]
				   ,NULL [RefProofOfResidencyTypeId]
				   ,NULL [RefHighestEducationLevelCompletedId]
				   ,NULL [RefPersonalInformationVerificationId]
				   ,NULL [BirthdateVerification]
				   ,NULL [RefTribalAffiliationId]
				   ,App.GetFiscalYearStartDate(@SchoolYear) [RecordStartDateTime]
				   ,App.GetFiscalYearEndDate(@SchoolYear) [RecordEndDateTime]
		FROM Staging.StateDetail
		WHERE SeaContact_FirstName IS NOT NULL
		AND SeaContact_FirstName <> ''
		AND SeaContact_LastOrSurname IS NOT NULL
		AND SeaContact_LastOrSurname <> ''

		INSERT INTO [ODS].[PersonEmailAddress]
				   ([PersonId]
				   ,[EmailAddress]
				   ,[RefEmailTypeId])
		SELECT DISTINCT
				    PersonId [PersonId]
				   ,SeaContact_ElectronicMailAddress [EmailAddress]
				   ,(SELECT RefEmailTypeId FROM ODS.RefEmailType WHERE Code = 'Work') [RefEmailTypeId]
		FROM Staging.StateDetail
		WHERE SeaContact_ElectronicMailAddress IS NOT NULL
		AND SeaContact_ElectronicMailAddress <> ''


		INSERT INTO [ODS].[PersonTelephone]
				   ([PersonId]
				   ,[TelephoneNumber]
				   ,[PrimaryTelephoneNumberIndicator]
				   ,[RefPersonTelephoneNumberTypeId])
		SELECT DISTINCT
				    PersonId [PersonId]
				   ,SeaContact_PhoneNumber [TelephoneNumber]
				   ,1 [PrimaryTelephoneNumberIndicator]
				   ,(SELECT RefTelephoneNumberTypeId FROM ODS.RefTelephoneNumberType WHERE Code = 'Work') [RefPersonTelephoneNumberTypeId]
		FROM Staging.StateDetail
		WHERE SeaContact_PhoneNumber IS NOT NULL
		AND SeaContact_PhoneNumber <> ''

		INSERT INTO [ODS].[OrganizationPersonRole]
				   ([OrganizationId]
				   ,[PersonId]
				   ,[RoleId]
				   ,[EntryDate]
				   ,[ExitDate])
		SELECT DISTINCT
				    orgd.OrganizationId [OrganizationId]
				   ,sd.PersonId [PersonId]
				   ,(SELECT RoleId FROM ODS.Role WHERE Name = 'Chief State School Officer') [RoleId]
				   ,App.GetFiscalYearStartDate(@SchoolYear) [EntryDate]
				   ,App.GetFiscalYearEndDate(@SchoolYear) [ExitDate]
		FROM Staging.StateDetail sd
		JOIN ODS.OrganizationDetail orgd ON sd.SeaName = orgd.Name
		JOIN ODS.RefOrganizationType rot ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
		WHERE Code = 'SEA'
		AND sd.PersonId IS NOT NULL

		INSERT INTO [ODS].[PersonIdentifier]
				   ([PersonId]
				   ,[Identifier]
				   ,[RefPersonIdentificationSystemId]
				   ,[RefPersonalInformationVerificationId])
		SELECT DISTINCT
					PersonId [PersonId]
				   ,SeaContact_Identifier [Identifier]
				   ,(SELECT ris.RefPersonIdentificationSystemId 
					 FROM ODS.RefPersonIdentificationSystem ris JOIN ODS.RefPersonIdentifierType rit 
						ON ris.RefPersonIdentifierTypeId = rit.RefPersonIdentifierTypeId 
					 WHERE ris.Code = 'State' 
						AND rit.Code = '001074') [RefPersonIdentificationSystemId]
				   ,(SELECT RefPersonalInformationVerificationId FROM ODS.RefPersonalInformationVerification WHERE Code = '01011') [RefPersonalInformationVerificationId]
		FROM Staging.StateDetail
		WHERE PersonId IS NOT NULL
		AND SeaContact_Identifier IS NOT NULL
		AND SeaContact_Identifier <> ''


		--Drop all temporary tables--
		DROP TABLE #existing_organizationlocation
		DROP TABLE #PersonIdtoPersonIdentifier



		set nocount off;


	END TRY
	BEGIN CATCH

		declare @msg as nvarchar(max)
		set @msg = ERROR_MESSAGE()

		declare @sev as int
		set @sev = ERROR_SEVERITY()

		RAISERROR(@msg, @sev, 1)

	END CATCH; 

END









----Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person


GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode]
END

GO


---It would be good to just go ahead and include Staff in this process as well to maintain unique staff ID's
---Inform the process for when/if ID's change - how will that be addressed, perhaps not now, but in the future.
-------will the use of PersonMaster come into play?
-------Note: id's can change so long as the end result - report outcome would be the same?


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode]
	@SchoolYear SMALLINT
	AS
    /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to maintain the unique list of Student & Staff Identifiers assigned by the state
		in the ODS.

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  Ed-Fi ODS: edfi.Student
							  edfi.Staff

    Data Targets:  Generate Database:   Generate.ODS.Person
										Generate.ODS.PersonIdentifier

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

      BEGIN TRY
        SET NOCOUNT ON;

        ---------------------------------------------------
        --- Declare Temporary Variables                ----
        ---------------------------------------------------
        DECLARE
			 @RecordStartDate DATETIME

		SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear)


		 --set the year to pull by using GETYEAR - a certain number so that it looks back in time but no so far back
		 --that pulling the data gets too large.  This will keep it dynamic.  So declare a variable and use the date.

		
		------------------------------------------------------------
        --- Insert Person Records                                ---
        ------------------------------------------------------------
        /*
		  Grab the existing PersonId for people that already exist.
		*/ 

		UPDATE Staging.Person
		SET PersonId = pid.PersonId
		FROM Staging.Person sp
		JOIN ods.PersonIdentifier pid
			ON sp.Identifier = pid.Identifier
		WHERE ((sp.[Role] = 'K12 Student'
				AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075' /* Student Identification System */))
			OR (sp.[Role] = 'K12 Personnel'
				AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001074' /* Staff Member Identification System */)))


		/*
          Insert one row for each distinct student
          identifier value (could be many records for
          one student). 
          
          Use the MERGE and OUTPUT statements so that we 
          can insert and also get back the values we 
          want for our crosswalk table. The MERGE statement
          will only perform INSERTs due to the 'ON 1 = 0' clause.
        */
		
        DECLARE
          @student_person_xwalk TABLE (
              PersonId INT
			, SourceId INT
          );

        MERGE INTO ODS.Person TARGET
        USING Staging.Person AS distinctIDs
			ON TARGET.PersonId = distinctIDs.PersonId
        WHEN NOT MATCHED THEN 
			INSERT (PersonMasterId)
            VALUES (NULL)
        OUTPUT INSERTED.PersonId
              ,distinctIDs.Id AS SourceId
        INTO @student_person_xwalk (PersonId, SourceId);


		UPDATE Staging.Person
		SET PersonId = xwalk.PersonId
		FROM Staging.Person p
		JOIN @student_person_xwalk xwalk
			ON p.Id = xwalk.SourceId

        ------------------------------------------------------------
        --- Insert PersonIdentifier Records -- Students         ----
        ------------------------------------------------------------
        INSERT ODS.PersonIdentifier
          (PersonId, Identifier, RefPersonIdentificationSystemId, RefPersonalInformationVerificationId)
          SELECT DISTINCT
            PersonId = p.PersonId
           ,Identifier = p.Identifier
           ,RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075' /* Student Identification System */)
           ,RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
          FROM
            Staging.Person p
		  WHERE [Role] = 'K12 Student'


		  
        ------------------------------------------------------------
        --- Insert PersonIdentifier Records -- Personnel        ----
        ------------------------------------------------------------
        INSERT ODS.PersonIdentifier
          (PersonId, Identifier, RefPersonIdentificationSystemId, RefPersonalInformationVerificationId)
          SELECT DISTINCT
            PersonId = p.PersonId
           ,Identifier = p.Identifier
           ,RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001074' /* Staff Member Identification System */)
           ,RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
          FROM
            Staging.Person p
		  WHERE [Role] = 'K12 Personnel'


        ------------------------------------------------------------
        --- Merge K12 Personnel Details					        ----
        ------------------------------------------------------------

		MERGE INTO ODS.PersonDetail TARGET
		USING Staging.Person SOURCE
			ON TARGET.PersonId = SOURCE.PersonId 
		WHEN NOT MATCHED 
			AND [Role] = 'K12 Personnel'
			THEN
			INSERT VALUES (
			  SOURCE.PersonId
			, SOURCE.FirstName
			, SOURCE.MiddleName
			, SOURCE.LastName
			, NULL
			, NULL
			, SOURCE.Birthdate
			, NULL
			, NULL
			, NULL
			, NULL
			, NULL
			, NULL
			, NULL
			, App.GetRefPersonalInformationVerificationId('01011')
			, NULL
			, NULL
			, @RecordStartDate
			, null
			);
		  
 
      END TRY
      BEGIN CATCH



      END CATCH;

    END;


----Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment


GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment]    Script Date: 6/1/2018 11:58:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode]
	@SchoolYear SMALLINT
AS
BEGIN

	BEGIN TRY
	
		set nocount on;




---Additional Items to add in the future - exit/withdraw reason--


		-------------------------------------------------------
		---Associate the PersonId with the temporary table ----
		-------------------------------------------------------

		UPDATE Staging.Enrollment
		SET PersonId = pid.PersonId
		FROM Staging.Enrollment e
		JOIN ODS.PersonIdentifier pid ON e.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
		AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')
		--------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.Enrollment
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.Enrollment e
		JOIN ODS.OrganizationIdentifier orgid ON e.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
		AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		--------------------------------------------------------------------
		---Manage the OrganizationPersonRole Records for each Student ------
		--------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationPersonRole]
				   ([OrganizationId]
				   ,[PersonId]
				   ,[RoleId]
				   ,[EntryDate]
				   ,[ExitDate])
		SELECT DISTINCT
					e.OrganizationID_School [OrganizationId]
				   ,e.PersonID [PersonId]
				   ,App.GetRoleId('K12 Student') [RoleId]
				   ,EnrollmentEntryDate [EntryDate]
				   ,EnrollmentExitDate [ExitDate]
		FROM Staging.Enrollment e
		LEFT JOIN ODS.OrganizationPersonRole opr 
			ON e.PersonID = opr.PersonId
			AND e.EnrollmentEntryDate = opr.EntryDate
			AND ISNULL(e.EnrollmentExitDate, '1900-01-01') = ISNULL(opr.ExitDate, '1900-01-01')
			AND e.OrganizationID_School = opr.OrganizationId
			AND opr.RoleId = App.GetRoleId('K12 Student')
		WHERE opr.PersonId IS NULL
			AND e.OrganizationID_School IS NOT NULL
			AND e.PersonID IS NOT NULL
			AND e.EnrollmentEntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
			AND (e.EnrollmentExitDate IS NULL OR e.EnrollmentExitDate <= App.GetFiscalYearEndDate(@SchoolYear))
			
		UPDATE Staging.Enrollment
		SET OrganizationPersonRoleId_School = opr.OrganizationPersonRoleId
		FROM Staging.Enrollment e
		JOIN ODS.OrganizationPersonRole opr 
			ON e.PersonID = opr.PersonId 
		WHERE e.OrganizationID_School = opr.OrganizationId
			AND opr.RoleId = App.GetRoleId('K12 Student')
			AND EntryDate = e.EnrollmentEntryDate


		----------------------------------------------------------------------------------
		---Delete any OrganizationPersonRole Records not found in the staging table ------
		----------------------------------------------------------------------------------

		CREATE TABLE #RecordsToDelete_OrganizationPersonRole
			(OrganizationPersonRoleId INT)


		INSERT INTO #RecordsToDelete_OrganizationPersonRole
			(OrganizationPersonRoleId)
		SELECT DISTINCT OrganizationPersonRoleId 
		FROM ODS.OrganizationPersonRole opr
		JOIN ODS.OrganizationDetail orgd 
			ON opr.OrganizationId = orgd.OrganizationId
		INNER JOIN Staging.Enrollment e 
			ON opr.OrganizationPersonRoleId = e.OrganizationPersonRoleId_School
		WHERE e.Id IS NULL
			AND opr.RoleId = App.GetRoleId('K12 Student')
			AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('K12School', '001156')
			AND opr.EntryDate IS NOT NULL
			AND opr.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)


		--Verify this is in the Program ETL and then delete
		--CREATE TABLE #RecordsToDelete_PersonProgramParticipation
		--	(PersonProgramParticipationId INT)


		--INSERT INTO #RecordsToDelete_PersonProgramParticipation
		--	(PersonProgramParticipationId)
		--SELECT DISTINCT PersonProgramParticipationId
		--FROM ODS.PersonProgramParticipation ppp
		--JOIN #RecordsToDelete_OrganizationPersonRole rtdopr 
		--	ON ppp.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId


		---------------------------------------------------------------------------
		--Remove any records that are not in the Current ODS for this School Year--
		---------------------------------------------------------------------------
		DELETE opr FROM ODS.K12StudentDiscipline opr JOIN #RecordsToDelete_OrganizationPersonRole rtdopr ON opr.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId
		DELETE opr FROM ODS.K12StudentEnrollment opr JOIN #RecordsToDelete_OrganizationPersonRole rtdopr ON opr.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId
		DELETE opr FROM ODS.OrganizationPersonRole opr Join #RecordsToDelete_OrganizationPersonRole rtdopr ON opr.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId



		---------------------------------------------------------------------------
		----Create K12StudentEnrollment Record for Each Student for Grade Level----
		---------------------------------------------------------------------------

		INSERT INTO [ODS].[K12StudentEnrollment]
				   ([OrganizationPersonRoleId]
				   ,[RefEntryGradeLevelId]
				   ,[RefPublicSchoolResidence]
				   ,[RefEnrollmentStatusId]
				   ,[RefEntryType]
				   ,[RefExitGradeLevel]
				   ,[RefExitOrWithdrawalStatusId]
				   ,[RefExitOrWithdrawalTypeId]
				   ,[DisplacedStudentStatus]
				   ,[RefEndOfTermStatusId]
				   ,[RefPromotionReasonId]
				   ,[RefNonPromotionReasonId]
				   ,[RefFoodServiceEligibilityId]
				   ,[FirstEntryDateIntoUSSchool]
				   ,[RefDirectoryInformationBlockStatusId]
				   ,[NSLPDirectCertificationIndicator]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					OrganizationPersonRoleId_School [OrganizationPersonRoleId]
				   ,gl.RefGradeLevelID [RefEntryGradeLevelId]
				   ,NULL [RefPublicSchoolResidence]
				   ,NULL [RefEnrollmentStatusId]
				   ,NULL [RefEntryType]
				   ,CASE 
						WHEN e.ExitWithdrawType IS NOT NULL THEN gl.RefGradeLevelId
						ELSE NULL
					END [RefExitGradeLevel]
				   ,NULL [RefExitOrWithdrawalStatusId]
				   ,ewt.RefExitOrWithdrawalTypeId [RefExitOrWithdrawalTypeId]
				   ,NULL [DisplacedStudentStatus]
				   ,NULL [RefEndOfTermStatusId]
				   ,NULL [RefPromotionReasonId]
				   ,NULL [RefNonPromotionReasonId]
				   ,NULL [RefFoodServiceEligibilityId]
				   ,NULL [FirstEntryDateIntoUSSchool]
				   ,NULL [RefDirectoryInformationBlockStatusId]
				   ,NULL [NSLPDirectCertificationIndicator]
				   ,EnrollmentEntryDate [RecordStartDateTime]
				   ,EnrollmentExitDate [RecordEndDateTime]
		FROM Staging.Enrollment e
		JOIN ODS.SourceSystemReferenceData rdg
			ON e.GradeLevel = rdg.InputCode
			AND rdg.TableName = 'RefGradeLevel'
			AND rdg.SchoolYear = @SchoolYear
		JOIN ODS.RefGradeLevel gl
			ON rdg.OutputCode = gl.Code
		JOIN ODS.RefGradeLevelType glt
			ON gl.RefGradeLevelTypeId = glt.RefGradeLevelTypeId
		LEFT JOIN ODS.SourceSystemReferenceData rdewt
			ON e.ExitWithdrawType = rdewt.InputCode
			AND rdewt.TableName = 'RefExitOrWithdrawalType'
			AND rdewt.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefExitOrWithdrawalType ewt
			ON rdewt.OutputCode = ewt.Code
		WHERE OrganizationPersonRoleId_School IS NOT NULL
			AND glt.Code = '000100'

		---------------------------------------------------------------------------
		----Create K12StudentEnrollment Record for Each Student for Grade Level----
		---------------------------------------------------------------------------


		DROP TABLE #RecordsToDelete_OrganizationPersonRole;
		--Delete when the sesction above is deleted
		--DROP TABLE #RecordsToDelete_PersonProgramParticipation;

		set nocount off;


	END TRY
	BEGIN CATCH

		declare @msg as nvarchar(max)
		set @msg = ERROR_MESSAGE()

		declare @sev as int
		set @sev = ERROR_SEVERITY()

		RAISERROR(@msg, @sev, 1)


	END CATCH; 

END



----Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipation_EncapsulatedCode

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipation_EncapsulatedCode]    Script Date: 6/5/2018 3:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode]
	@SchoolYear SMALLINT
	AS
	BEGIN

	BEGIN TRY
	
		set nocount on;




---Additional Items to add in the future - exit/withdraw reason--
--Need to add ProgramParticipationSpecialEducation into this stored procedure - grab from membership child count
--Need to add PersonProgramParticipation into this stored procedure - grab grom membership child count

			
		-------------------------------------------------------
		---Associate the PersonId with the temporary table ----
		-------------------------------------------------------

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET PersonID = pid.PersonId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.PersonIdentifier pid ON ppse.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075') 
		AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011') 
		--------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.OrganizationIdentifier orgid ON ppse.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
		AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073') 
		
		---------------------------------------------------------------------------------------
		---Associate the Special Education Program OrganizationId with the temporary table ----
		---------------------------------------------------------------------------------------

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET OrganizationID_Program = orgd.OrganizationId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.OrganizationRelationship ord ON ppse.OrganizationID_School = ord.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd ON ord.OrganizationId = orgd.OrganizationId
		WHERE orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156') 
		AND orgd.Name = 'Special Education Program'

		----------------------------------------------------------------------------------------------
		---Manage the Special Education Program OrganizationPersonRole Records for each Student ------
		----------------------------------------------------------------------------------------------

		INSERT INTO [ODS].[OrganizationPersonRole]
				   ([OrganizationId]
				   ,[PersonId]
				   ,[RoleId]
				   ,[EntryDate]
				   ,[ExitDate])
		SELECT DISTINCT
					ppse.OrganizationID_Program [OrganizationId]
				   ,ppse.PersonID [PersonId]
				   ,App.GetRoleId('K12 Student')  [RoleId]
				   ,ProgramParticipationBeginDate [EntryDate]
				   ,ProgramParticipationEndDate [ExitDate]
		FROM Staging.ProgramParticipationSpecialEducation ppse
		LEFT JOIN ODS.OrganizationPersonRole opr 
			ON ppse.PersonID = opr.PersonId
			AND ppse.ProgramParticipationBeginDate = opr.EntryDate
			AND ISNULL(ppse.ProgramParticipationEndDate, '1900-01-01') = ISNULL(opr.ExitDate, '1900-01-01')
			AND ppse.OrganizationID_Program = opr.OrganizationId
			AND opr.RoleId = App.GetRoleId('K12 Student')
		WHERE opr.PersonId IS NULL
			AND ppse.OrganizationID_Program IS NOT NULL
			AND ppse.PersonID IS NOT NULL

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET OrganizationPersonRoleId_Program = opr.OrganizationPersonRoleId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.OrganizationPersonRole opr 
			ON ppse.PersonID = opr.PersonId 
		WHERE ppse.OrganizationID_Program = opr.OrganizationId
			AND opr.RoleId = App.GetRoleId('K12 Student') 
			AND EntryDate = ppse.ProgramParticipationBeginDate

		-------------------------------------------------------------------------------
		---Delete any OrganizationPersonRole Records not found in the temp table ------
		-------------------------------------------------------------------------------

		CREATE TABLE #RecordsToDelete_OrganizationPersonRole
			(OrganizationPersonRoleId INT)
		INSERT INTO #RecordsToDelete_OrganizationPersonRole
			(OrganizationPersonRoleId)
		SELECT DISTINCT OrganizationPersonRoleId 
		FROM ODS.OrganizationPersonRole opr
		JOIN ODS.OrganizationDetail orgd 
			ON opr.OrganizationId = orgd.OrganizationId
		LEFT JOIN Staging.ProgramParticipationSpecialEducation e 
			ON opr.OrganizationPersonRoleId = e.OrganizationPersonRoleId_Program
		WHERE e.PersonId IS NULL
		AND opr.RoleId = App.GetRoleId('K12 Student') 
		AND orgd.RefOrganizationTypeId = App.GetOrganizationTypeId('Program', '001156') 
		AND opr.EntryDate IS NOT NULL
		AND opr.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear) 
		AND orgd.Name = 'Special Education Program'

		CREATE TABLE #RecordsToDelete_PersonProgramParticipation
			(PersonProgramParticipationId INT)
		INSERT INTO #RecordsToDelete_PersonProgramParticipation
			(PersonProgramParticipationId)
		SELECT DISTINCT PersonProgramParticipationId
		FROM ODS.PersonProgramParticipation ppp
		JOIN #RecordsToDelete_OrganizationPersonRole rtdopr 
			ON ppp.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId


		---------------------------------------------------------------------------
		--Remove any records that are not in the Current ODS for this School Year--
		---------------------------------------------------------------------------

		DELETE ppp 
		FROM ODS.ProgramParticipationCte ppp 
		JOIN #RecordsToDelete_PersonProgramParticipation rtdppp 
			ON ppp.PersonProgramParticipationId = rtdppp.PersonProgramParticipationId
		
		DELETE ppp 
		FROM ODS.ProgramParticipationMigrant ppp 
		JOIN #RecordsToDelete_PersonProgramParticipation rtdppp 
			ON ppp.PersonProgramParticipationId = rtdppp.PersonProgramParticipationId

		DELETE ppp 
		FROM ODS.ProgramParticipationTitleIIILEp ppp 
		JOIN #RecordsToDelete_PersonProgramParticipation rtdppp 
			ON ppp.PersonProgramParticipationId = rtdppp.PersonProgramParticipationId
		
		DELETE ppp 
		FROM ODS.ProgramParticipationSpecialEducation ppp 
		JOIN #RecordsToDelete_PersonProgramParticipation rtdppp
			ON ppp.PersonProgramParticipationId = rtdppp.PersonProgramParticipationId
		
		DELETE opr 
		FROM ODS.PersonProgramParticipation opr 
		JOIN #RecordsToDelete_OrganizationPersonRole rtdopr 
			ON opr.OrganizationPersonRoleId = rtdopr.OrganizationPersonRoleId


		---------------------------------------------------------------------------
		--Create PersonProgramParticipation and ProgramParticipationSpecialEd -----
		---------------------------------------------------------------------------

		INSERT INTO [ODS].[PersonProgramParticipation]
				   ([OrganizationPersonRoleId]
				   ,[RefParticipationTypeId]
				   ,[RefProgramExitReasonId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT
					ppse.OrganizationPersonRoleId_Program [OrganizationPersonRoleId]
				   ,NULL [RefParticipationTypeId]
				   ,NULL [RefProgramExitReasonId]
				   ,ProgramParticipationBeginDate [RecordStartDateTime]
				   ,ProgramParticipationEndDate [RecordEndDateTime]
		FROM Staging.ProgramParticipationSpecialEducation ppse
		WHERE ppse.OrganizationPersonRoleId_Program IS NOT NULL

		UPDATE Staging.ProgramParticipationSpecialEducation
		SET PersonProgramParticipationID = ppp.PersonProgramParticipationId
		FROM Staging.ProgramParticipationSpecialEducation ppse
		JOIN ODS.PersonProgramParticipation ppp 
			ON ppse.OrganizationPersonRoleId_Program = ppp.OrganizationPersonRoleId
		
		INSERT INTO [ODS].[ProgramParticipationSpecialEducation]
				   ([PersonProgramParticipationId]
				   ,[AwaitingInitialIDEAEvaluationStatus]
				   ,[RefIDEAEducationalEnvironmentECId]
				   ,[RefIDEAEdEnvironmentSchoolAgeId]
				   ,[SpecialEducationFTE]
				   ,[RefSpecialEducationExitReasonId]
				   ,[SpecialEducationServicesExitDate]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT 
					ppse.PersonProgramParticipationID [PersonProgramParticipationId]
				   ,NULL [AwaitingInitialIDEAEvaluationStatus]
				   ,eeec.[RefIDEAEducationalEnvironmentECId] [RefIDEAEducationalEnvironmentECId]
				   ,eesa.[RefIDESEducationalEnvironmentSchoolAge] [RefIDEAEdEnvironmentSchoolAgeId]
				   ,NULL [SpecialEducationFTE]
				   ,seer.RefSpecialEducationExitReasonId [RefSpecialEducationExitReasonId]
				   ,NULL [SpecialEducationServicesExitDate]
				   ,ProgramParticipationBeginDate [RecordStartDateTime]
				   ,ProgramParticipationEndDate [RecordEndDateTime]
		FROM Staging.ProgramParticipationSpecialEducation ppse
		LEFT JOIN ODS.SourceSystemReferenceData rdec
			ON ppse.IDEAEducationalEnvironmentForEarlyChildhood = rdec.InputCode
			AND rdec.TableName = 'RefIDEAEducationalEnvironmentEC'
			AND rdec.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefIDEAEducationalEnvironmentEC eeec
			ON rdec.OutputCode = eeec.Code
		LEFT JOIN ODS.SourceSystemReferenceData rdsa
			ON ppse.IDEAEducationalEnvironmentForSchoolAge = rdsa.InputCode
			AND rdsa.TableName = 'RefIDEAEducationalEnvironmentSchoolAge'
			AND rdsa.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefIDEAEducationalEnvironmentSchoolAge eesa
			ON rdsa.OutputCode = eesa.Code
		LEFT JOIN ODS.SourceSystemReferenceData ersa
			ON ppse.SpecialEducationExitReason = ersa.InputCode
			AND ersa.TableName = 'RefSpecialEducationExitReason'
			AND ersa.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationExitReason seer
			ON ersa.OutputCode = seer.Code
		WHERE PersonProgramParticipationID IS NOT NULL



		----Error table logging will be inserted here.  Not only errors with the ETL itself, but with the data. The temporary tables will be checked
		----for erroneous or missing data and that information will be logged in a table that will eventually be displayed through the Generate UI



		DROP TABLE #RecordsToDelete_OrganizationPersonRole
		DROP TABLE #RecordsToDelete_PersonProgramParticipation



		set nocount off;


	END TRY
	BEGIN CATCH



	END CATCH; 

END



----Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode



GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode]    Script Date: 6/6/2018 3:19:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode]
END

GO


--Notes --
--Set this up in such a way as to handle when child count and membership occur on different days - note: the dates don't matter, just load the enrollments.
--Do we set it up to capture each day and if no changes, continue the NULL end date forward until a change occurs
--with the one above, what if it's a correction - no that should be handled directly in the ODS, not through the ETL
--let the ETL handle the movement of data, not the correction of invalid data in the past.  When they migrate, they are looking for what
--has changed since the last time.  Perhaps there needs to be two methodoligies here
--1. Do not change anything in history, but end date records as of today
--2. Change history based on the picture we have today in the Ed-Fi ODS
--3. Possibly a hybrid of those - change history unless it affects the following dates (e.g. October 1st - do not change that history)
--4. Change only certain items (turn them on/off based on the state methodology?)
--5. Preset the items that can/cannot change?



CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode]
	@SchoolYear SMALLINT
AS

    /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to load the data for membership (C052) and Special Education Child Count
		(C002, C089).

    Assumptions:
        
    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources: 

    Data Targets:  Generate Database:   Generate

    Return Values:
    	 0	= Success
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount_EncapsulatedCode];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/

BEGIN

	BEGIN TRY
	
		set nocount on;

------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------

        ---------------------------------------------------
        --- Declare Temporary Variables                ----
        ---------------------------------------------------
        DECLARE
			 @RecordStartDate DATETIME
			,@RecordEndDate DATETIME
			,@MembershipDate DATE
			,@ChildCountDate DATE
			,@RefPersonStatusType_IDEA INT
			,@RefPersonStatusType_LEP INT
			,@RefLanguageUseType_HomeLanguage INT


        ------------------------------------------------------------
        --- Populate temp code table lookup variables           ----
        ------------------------------------------------------------

			SET @RecordStartDate = App.GetFiscalYearStartDate(@SchoolYear)
			
			SET @RecordEndDate = App.GetFiscalYearEndDate(@SchoolYear)

			SET @MembershipDate = ISNULL(
			(
				SELECT CONVERT(DATE, (LEFT(tr.ResponseValue, 5) + '/' + CAST(2018 - 1 AS VARCHAR))) 
				FROM App.ToggleQuestions tq
				JOIN App.ToggleResponses tr ON tq.ToggleQuestionId = tr.ToggleQuestionId
				WHERE EmapsQuestionAbbrv = 'CHDCTDTE' 
			), 'XX');


			SET @ChildCountDate = ISNULL(
			(
				SELECT CONVERT(DATE, (LEFT(tr.ResponseValue, 5) + '/' + CAST(@SchoolYear - 1 AS VARCHAR)))
				FROM App.ToggleQuestions tq
				JOIN App.ToggleResponses tr ON tq.ToggleQuestionId = tr.ToggleQuestionId
				WHERE EmapsQuestionAbbrv = 'CHDCTDTE'
			), 'XX');

		-------------------------------------------------------
		---Associate the PersonId with the temporary table ----
		-------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonID = pid.PersonId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonIdentifier pid 
			ON mcc.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
			AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')

		-------------------------------------------------------------
		---Associate the PersonDetailId with the temporary table ----
		-------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonDetailID = pd.PersonDetailId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonDetail pd
			ON mcc.PersonID = pd.PersonId
			AND mcc.FirstName = pd.FirstName
			AND mcc.LastName = pd.LastName
			AND mcc.Birthdate = pd.Birthdate
			AND mcc.RaceEthnicityQuestion_Hispanic = pd.HispanicLatinoEthnicity
		JOIN ods.SourceSystemReferenceData edfisex
			ON mcc.Sex = edfisex.InputCode
			AND edfisex.TableName = 'RefSex'
			AND edfisex.SchoolYear = @SchoolYear
		JOIN ods.RefSex sex
			ON edfisex.OutputCode = sex.Code
		WHERE mcc.PersonID IS NOT NULL
			AND pd.RecordEndDateTime IS NULL
			AND sex.RefSexId = pd.RefSexId
	
		----------------------------------------------------------------------
		---Associate the PersonDemographicRaceId with the temporary table ----
		----------------------------------------------------------------------

		UPDATE Staging.MembershipRace
		SET PersonDemographicRaceId = pdr.PersonDemographicRaceId
		FROM Staging.MembershipChildCount mcc
		JOIN Staging.MembershipRace mr 
			ON mcc.Student_Identifier_State = mr.Student_Identifier_State
		JOIN ODS.PersonDemographicRace pdr 
			ON mcc.PersonID = pdr.PersonId
		JOIN ODS.SourceSystemReferenceData rd
			ON mr.RaceType = rd.InputCode
			AND rd.TableName = 'RefRace'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefRace r 
			ON rd.OutputCode = r.Code
		WHERE mcc.PersonID IS NOT NULL
			AND	r.RefRaceId = pdr.RefRaceId
			AND pdr.RecordEndDateTime IS NULL

		-----------------------------------------------------------------
		---Associate the PersonDisabilityId with the temporary table ----
		-----------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonDisabilityId = pd.PersonDisabilityId
		FROM Staging.MembershipChildCount mcc
		JOIN Staging.PrimaryDisability spd
			ON mcc.Student_Identifier_State = spd.Student_Identifier_State
		JOIN ODS.PersonDisability pd 
			ON mcc.PersonID = pd.PersonId
		JOIN ods.SourceSystemReferenceData rd
			ON spd.DisabilityType = rd.InputCode
			AND rd.TableName = 'RefDisabilityType'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefDisabilityType dt ON rd.OutputCode = dt.Code
		WHERE mcc.PersonID IS NOT NULL
			AND dt.RefDisabilityTypeId = pd.PrimaryDisabilityTypeId
			AND pd.RecordEndDateTime IS NULL

		---------------------------------------------------------------
		---Associate the PersonLanguageId with the temporary table ----
		---------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonLanguageId = pl.PersonLanguageId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonLanguage pl 
			ON mcc.PersonID = pl.PersonId
		JOIN ODS.SourceSystemReferenceData rd
			ON mcc.ISO_639_2_NativeLanguage = rd.InputCode
			AND rd.TableName = 'RefLanguage'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefLanguage rl
			ON rd.OutputCode = rl.Code
		JOIN ODS.RefLanguageUseType rlut 
			ON rlut.Code = 'Native'
		WHERE mcc.PersonID IS NOT NULL
			AND rl.RefLanguageId = pl.PersonLanguageId
			--AND pl.RecordEndDateTime IS NULL --This requires a Generate update to include the RecordStart/End in this table

		--------------------------------------------------------------------
		---Associate the PersonStatusId (IDEA) with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonStatusId_IDEA = ps.PersonStatusId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonStatus ps 
			ON mcc.PersonID = ps.PersonId
		JOIN ODS.RefPersonStatusType pst 
			ON ps.RefPersonStatusTypeId = pst.RefPersonStatusTypeId
		WHERE pst.Code = 'IDEA'
			AND ps.StatusEndDate IS NULL
			AND mcc.PersonID IS NOT NULL
			AND mcc.IDEAStatus = ps.StatusValue

		--------------------------------------------------------------------
		---Associate the PersonStatusId (LEP) with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET PersonStatusId_LEP = ps.PersonStatusId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonStatus ps 
			ON mcc.PersonID = ps.PersonId
		JOIN ODS.RefPersonStatusType pst 
			ON ps.RefPersonStatusTypeId = pst.RefPersonStatusTypeId
		WHERE pst.Code = 'LEP'
			AND ps.StatusEndDate IS NULL
			AND mcc.PersonID IS NOT NULL
			AND mcc.EnglishLearnerStatus = ps.StatusValue

		--------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.OrganizationIdentifier orgid 
			ON mcc.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
			AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		-----------------------------------------------------------------------------------------------------
		---Associate the OrganizationPersonRoleId related to the MembershipDate with the temporary table ----
		-----------------------------------------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount
		SET OrganizationPersonRoleID_School = opr.OrganizationPersonRoleId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.OrganizationPersonRole opr 
			ON mcc.PersonID = opr.PersonId
		WHERE mcc.OrganizationID_School = opr.OrganizationId
			AND opr.EntryDate <= @MembershipDate
			AND (opr.ExitDate IS NULL OR opr.ExitDate >= @MembershipDate)

		----------------------------------------------------
		---Insert/Update students into ODS.PersonDetail ----
		----------------------------------------------------

		--End date PersonDetail records that have changed since the previous year
		UPDATE ODS.PersonDetail
		SET RecordEndDateTime = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonDetail pd
			ON mcc.PersonID = pd.PersonId
		WHERE pd.RecordEndDateTime IS NULL
			AND mcc.PersonDetailID IS NULL


		--Insert new PersonDetail records that do not yet exist or that have changed since the previous year
		INSERT INTO [ODS].[PersonDetail]
				   ([PersonId]
				   ,[FirstName]
				   ,[MiddleName]
				   ,[LastName]
				   ,[GenerationCode]
				   ,[Prefix]
				   ,[Birthdate]
				   ,[RefSexId]
				   ,[HispanicLatinoEthnicity]
				   ,[RefUSCitizenshipStatusId]
				   ,[RefVisaTypeId]
				   ,[RefStateOfResidenceId]
				   ,[RefProofOfResidencyTypeId]
				   ,[RefHighestEducationLevelCompletedId]
				   ,[RefPersonalInformationVerificationId]
				   ,[BirthdateVerification]
				   ,[RefTribalAffiliationId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					mcc.PersonID [PersonId]
				   ,mcc.FirstName [FirstName]
				   ,NULL [MiddleName]
				   ,mcc.LastName [LastName]
				   ,NULL [GenerationCode]
				   ,NULL [Prefix]
				   ,mcc.Birthdate [Birthdate]
				   ,sex.RefSexId [RefSexId]
				   ,mcc.RaceEthnicityQuestion_Hispanic [HispanicLatinoEthnicity]
				   ,NULL [RefUSCitizenshipStatusId]
				   ,NULL [RefVisaTypeId]
				   ,NULL [RefStateOfResidenceId]
				   ,NULL [RefProofOfResidencyTypeId]
				   ,NULL [RefHighestEducationLevelCompletedId]
				   ,NULL [RefPersonalInformationVerificationId]
				   ,NULL [BirthdateVerification]
				   ,NULL [RefTribalAffiliationId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM Staging.MembershipChildCount mcc
		JOIN ods.SourceSystemReferenceData edfisex
			ON mcc.Sex = edfisex.InputCode
			AND edfisex.TableName = 'RefSex'
			AND edfisex.SchoolYear = @SchoolYear
		JOIN ods.RefSex sex
			ON edfisex.OutputCode = sex.Code
		WHERE mcc.PersonDetailID IS NULL

		--Update Staging Table with PersonDetail Id--
		UPDATE Staging.MembershipChildCount
		SET PersonDetailID = pd.PersonDetailId
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonDetail pd ON mcc.PersonID = pd.PersonId
		JOIN ODS.SourceSystemReferenceData sourcesex ON mcc.Sex = sourcesex.InputCode
		JOIN ODS.RefSex rs ON sourcesex.OutputCode = rs.Code
		WHERE mcc.FirstName = pd.FirstName
		AND mcc.LastName = pd.LastName
		AND mcc.Birthdate = pd.Birthdate
		AND mcc.RaceEthnicityQuestion_Hispanic = pd.HispanicLatinoEthnicity
		AND rs.RefSexId = pd.RefSexId
		AND sourcesex.TableName = 'RefSex'
		AND sourcesex.SchoolYear = @SchoolYear

		------------------------------------------------------------
		---Insert Student's Race into ODS.PersonDemographicRace ----
		------------------------------------------------------------

		--End date PersonDeomgraphicRace records that have changed since the previous year
		UPDATE ODS.PersonDemographicRace
		SET RecordEndDateTime = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM Staging.MembershipChildCount mcc
		JOIN Staging.MembershipRace mr 
			ON mcc.Student_Identifier_State = mr.Student_Identifier_State
		JOIN ODS.PersonDemographicRace pdr
			ON mcc.PersonID = pdr.PersonId
		WHERE pdr.RecordEndDateTime IS NULL
			AND mr.PersonDemographicRaceId IS NULL
		
		
		INSERT INTO [ODS].[PersonDemographicRace]
				   ([PersonId]
				   ,[RefRaceId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					 mcc.PersonId [PersonId]
					,r.RefRaceID
					,@RecordStartDate [RecordStartDateTime]
					,NULL [RecordEndDateTime]
		FROM Staging.MembershipRace mr
		JOIN Staging.MembershipChildCount mcc	
			ON mr.Student_Identifier_State = mcc.Student_Identifier_State
		JOIN ODS.SourceSystemReferenceData rd
			ON mr.RaceType = rd.InputCode
			AND rd.TableName = 'RefRace'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefRace r 
			ON rd.OutputCode = r.Code
		WHERE mr.PersonDemographicRaceId IS NULL

		---------------------------------------------------
		---Insert Disability into ODS.PersonDisability ----
		---------------------------------------------------

		UPDATE ODS.PersonDisability
		SET RecordEndDateTime = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.PersonDisability pd 
			ON mcc.PersonID = pd.PersonId
		WHERE pd.RecordEndDateTime IS NULL
		AND mcc.PersonDisabilityId IS NULL

		INSERT INTO [ODS].[PersonDisability]
				   ([PersonId]
				   ,[PrimaryDisabilityTypeId]
				   ,[DisabilityStatus]
				   ,[RefAccommodationsNeededTypeId]
				   ,[RefDisabilityConditionTypeId]
				   ,[RefDisabilityDeterminationSourceTypeId]
				   ,[RefDisabilityConditionStatusCodeId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime])
		SELECT DISTINCT
					mcc.PersonID [PersonId]
				   ,dt.RefDisabilityTypeId [PrimaryDisabilityTypeId]
				   ,1 [DisabilityStatus]
				   ,NULL [RefAccommodationsNeededTypeId]
				   ,NULL [RefDisabilityConditionTypeId]
				   ,NULL [RefDisabilityDeterminationSourceTypeId]
				   ,NULL [RefDisabilityConditionStatusCodeId]
				   ,@RecordStartDate [RecordStartDateTime]
				   ,NULL [RecordEndDateTime]
		FROM Staging.MembershipChildCount mcc
		JOIN Staging.PrimaryDisability md
			ON mcc.Student_Identifier_State = md.Student_Identifier_State
		JOIN ODS.SourceSystemReferenceData rd
			ON md.DisabilityType = rd.InputCode
			AND rd.TableName = 'RefDisabilityType'
			AND rd.SchoolYear = @SchoolYear
		JOIN ods.RefDisabilityType dt 
			ON rd.OutputCode = dt.Code
		WHERE PrimaryDisability IS NOT NULL
		AND PrimaryDisability <> ''
		AND mcc.PersonDisabilityId IS NULL

		---------------------------------------------------
		---Insert Language into ODS.PersonLanguage ----
		---------------------------------------------------

		--This can be uncommented when the RecordEndDateTime has been added to the PersonLanguage table
		--UPDATE ODS.PersonLanguage
		--SET RecordEndDateTime = App.GetFiscalYearEndDate(@SchoolYear-1)
		--FROM Staging.MembershipChildCount mcc
		--JOIN ODS.PersonLanguage pl 
		--	ON mcc.PersonID = pl.PersonId
		--WHERE pl.RecordEndDateTime IS NULL
		--AND mcc.PersonLanguageId IS NULL


		--Need to add the RecordStart/EndDateTime into this when it is added into Generate.
		INSERT INTO [ODS].[PersonLanguage]
           ([PersonId]
           ,[RefLanguageId]
           ,[RefLanguageUseTypeId])
		SELECT
            PersonID [PersonId]
           ,rl.RefLanguageId [RefLanguageId]
           ,rlut.RefLanguageUseTypeId [RefLanguageUseTypeId]
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.SourceSystemReferenceData rd
			ON mcc.ISO_639_2_NativeLanguage = rd.InputCode
			AND rd.TableName = 'RefLanguage'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefLanguage rl
			ON rd.OutputCode = rl.Code
		JOIN ODS.RefLanguageUseType rlut 
			ON rlut.Code = 'Native'
		WHERE mcc.ISO_639_2_NativeLanguage IS NOT NULL

		-----------------------------------------------------
		----Create Person Status for IDEA -------------------
		-----------------------------------------------------

		UPDATE ODS.PersonStatus
		SET StatusEndDate = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM ODS.PersonStatus ps
		JOIN Staging.MembershipChildCount mcc 
			ON ps.PersonId = mcc.PersonID
		JOIN ODS.RefPersonStatusType pst 
			ON ps.RefPersonStatusTypeId = pst.RefPersonStatusTypeId
		WHERE pst.Code = 'IDEA'
			AND ps.StatusEndDate IS NULL
			AND mcc.PersonStatusId_IDEA IS NULL

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
					mcc.PersonID [PersonId]
				   ,pst.RefPersonStatusTypeId [RefPersonStatusTypeId]
				   ,IDEAStatus [StatusValue]
				   ,@RecordStartDate [StatusStartDate]
				   ,NULL [StatusEndDate]
		FROM Staging.MembershipChildCount mcc
		JOIN ODS.RefPersonStatusType pst 
			ON pst.Code = 'IDEA'
		WHERE mcc.PrimaryDisability <> ''
			AND mcc.PersonStatusId_IDEA IS NULL
		
		------------------------------------------------------------------
		----Create Person Status for Limited English Proficiency (LEP)----
		------------------------------------------------------------------

		UPDATE ODS.PersonStatus
		SET StatusEndDate = App.GetFiscalYearEndDate(@SchoolYear-1)
		FROM ODS.PersonStatus ps
		JOIN Staging.MembershipChildCount mcc 
			ON ps.PersonId = mcc.PersonID
		JOIN ODS.RefPersonStatusType pst 
			ON ps.RefPersonStatusTypeId = pst.RefPersonStatusTypeId
		WHERE pst.Code = 'LEP'
			AND ps.StatusEndDate IS NULL
			AND mcc.PersonStatusId_LEP IS NULL

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
					mcc.PersonID [PersonId]
				   ,pst.RefPersonStatusTypeId [RefPersonStatusTypeId]
				   ,EnglishLearnerStatus [StatusValue]
				   ,@RecordStartDate [StatusStartDate]
				   ,NULL [StatusEndDate]
		FROM Staging.MembershipChildCount mcc
		JOIN ods.RefPersonStatusType pst 
			ON pst.Code = 'LEP'
		WHERE mcc.PersonStatusId_LEP IS NULL

		---------------------------------------------------------------------------------------------------------
		----Add Eligibility Status for School Food Service Programs to K12StudentEnrollment for Membership Date--
		---------------------------------------------------------------------------------------------------------

		UPDATE ODS.K12StudentEnrollment
		SET RefFoodServiceEligibilityId = rfse.RefFoodServiceEligibilityId
		FROM ODS.K12StudentEnrollment kse
		JOIN Staging.MembershipChildCount mcc ON kse.OrganizationPersonRoleId = mcc.OrganizationPersonRoleID_School
		JOIN ods.SourceSystemReferenceData rd 
			ON mcc.EligibilityStatusForSchoolFoodServicePrograms = rd.InputCode
			AND rd.TableName = 'RefFoodServiceEligibility'
			AND rd.SchoolYear = @SchoolYear
		JOIN ODS.RefFoodServiceEligibility rfse ON rd.OutputCode = rfse.Code
		WHERE kse.RecordStartDateTime <= @MembershipDate
			AND (kse.RecordEndDateTime IS NULL 
				OR kse.RecordEndDateTime >= @MembershipDate)
			AND mcc.EligibilityStatusForSchoolFoodServicePrograms IS NOT NULL

		------------------------------------------------------------------------------------------------------------
		----Add NationalSchoolLunchProgramDirectCertificationIndicator to K12StudentEnrollment for Membership Date--
		------------------------------------------------------------------------------------------------------------

		--Do not yet know the location of this field in Ed-Fi or Nebraska

		set nocount off;


	END TRY
	BEGIN CATCH



	END CATCH; 

END




----Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode

GO

/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode]    Script Date: 6/25/2018 3:41:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode]
	@SchoolYear SMALLINT
AS

    /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to load Migrant indicators about students for EDFacts reports that apply to the full year.

    Assumptions:
        
    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources: 

    Data Targets:  Generate Database:   Generate

    Return Values:
    	 0	= Success
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/

BEGIN

	BEGIN TRY
	
		set nocount on;



---------------------------------------------------------------------------------------------------------------------
-------------------------------------Create table for end of year reporting------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	IF OBJECT_ID('tempdb..#EndOfSchoolYearReporting_Migrant') IS NOT NULL DROP TABLE #EndOfSchoolYearReporting_Migrant;
		CREATE TABLE #EndOfSchoolYearReporting_Migrant (
			 ID INT IDENTITY(1, 1) Primary Key
			,RecordId VARCHAR(100)
			,SchoolYear VARCHAR(4)
			,School_Identifier_State VARCHAR(100)
			,Student_Identifier_State VARCHAR(100)
			,MigrantStatus VARCHAR(100)
			,MigrantEducationProgramEnrollmentType VARCHAR(100)
			,MigrantEducationProgramServicesType VARCHAR(100)
			,MigrantEducationProgramContinuationOfServicesStatus BIT
			,ContinuationOfServicesReason VARCHAR(100)
			,MigrantStudentQualifyingArrivalDate DATE
			,LastQualifyingMoveDate DATE
			,MigrantPrioritizedForServices BIT
			,ProgramParticipationStartDate DATE
			,ProgramParticipationExitDate DATE
			,PersonID INT
			,OrganizationID_School INT
			,OrganizationPersonRoleID_MigrantProgram INT
			,OrganizationID_MigrantProgram INT
			,PersonProgramParticipationId INT
			,ProgramParticipationMigrantId INT
		);

		INSERT INTO #EndOfSchoolYearReporting_Migrant
			(RecordId
			,SchoolYear
			,School_Identifier_State
			,Student_Identifier_State
			,MigrantStatus
			,MigrantEducationProgramEnrollmentType
			,MigrantEducationProgramServicesType
			,MigrantEducationProgramContinuationOfServicesStatus
			,ContinuationOfServicesReason
			,MigrantStudentQualifyingArrivalDate
			,LastQualifyingMoveDate 
			,MigrantPrioritizedForServices
			,ProgramParticipationStartDate
			,ProgramParticipationExitDate
			,PersonID
			,OrganizationID_School
			,OrganizationPersonRoleID_MigrantProgram
			,OrganizationID_MigrantProgram
			,PersonProgramParticipationId
			,ProgramParticipationMigrantId)
		SELECT DISTINCT
			 RecordId
			,SchoolYear
			,School_Identifier_State
			,Student_Identifier_State
			,MigrantStatus
			,MigrantEducationProgramEnrollmentType
			,MigrantEducationProgramServicesType
			,MigrantEducationProgramContinuationOfServicesStatus
			,ContinuationOfServicesReason
			,MigrantStudentQualifyingArrivalDate -- What if there is more than one?
			,LastQualifyingMoveDate  -- what if there is more than one?
			,MigrantPrioritizedForServices
			,App.GetFiscalYearStartDate(@SchoolYear) ProgramParticipationStartDate
			,App.GetFiscalYearEndDate(@SchoolYear) ProgramParticipationExitDate
			,NULL PersonID
			,NULL OrganizationID_School
			,NULL OrganizationPersonRoleID_MigrantProgram
			,NULL OrganizationID_MigrantProgram
			,NULL PersonProgramParticipationId
			,NULL ProgramParticipationMigrantId
		FROM Staging.Migrant

		--need to eliminate the records that are duplicate and only take the most recent.


		--------------------------------------------------------
		---Associate the PersonId with the temporary tables ----
		--------------------------------------------------------

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET PersonID = pid.PersonId
		FROM Staging.Migrant mcc
		JOIN ODS.PersonIdentifier pid ON mcc.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
		AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011') 

		--#EndOfSchoolYearReporting_Migrant
		UPDATE #EndOfSchoolYearReporting_Migrant
		SET PersonID = pid.PersonId
		FROM #EndOfSchoolYearReporting_Migrant mcc
		JOIN ODS.PersonIdentifier pid ON mcc.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
		AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011') 

		---------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary tables ----
		---------------------------------------------------------------------
		
		--Staging.Migrant
		UPDATE Staging.Migrant
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.Migrant mcc
		JOIN ODS.OrganizationIdentifier orgid ON mcc.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
		AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		--#EndOfSchoolYearReporting_Migrant
		UPDATE #EndOfSchoolYearReporting_Migrant
		SET OrganizationID_School = orgid.OrganizationId
		FROM #EndOfSchoolYearReporting_Migrant mcc
		JOIN ODS.OrganizationIdentifier orgid ON mcc.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
		AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')


		------------------------------------------------------------------------------
		---Associate the Migrant Program OrganizationId with the temporary tables ----
		------------------------------------------------------------------------------

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET OrganizationID_MigrantProgram = orgd.OrganizationId
		FROM Staging.Migrant tp
		JOIN ODS.OrganizationRelationship orgr ON tp.OrganizationID_School = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd ON orgr.OrganizationId = orgd.OrganizationId
		JOIN ODS.OrganizationProgramType orgpt ON orgd.OrganizationId = orgpt.OrganizationId
		JOIN ODS.RefProgramType rpt ON orgpt.RefProgramTypeId = rpt.RefProgramTypeId
		WHERE orgd.Name = 'Migrant Program'
		AND rpt.Code = '04920'

		--#EndOfSchoolYearReporting_Migrant
		UPDATE #EndOfSchoolYearReporting_Migrant
		SET OrganizationID_MigrantProgram = orgd.OrganizationId
		FROM #EndOfSchoolYearReporting_Migrant tp
		JOIN ODS.OrganizationRelationship orgr ON tp.OrganizationID_School = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationDetail orgd ON orgr.OrganizationId = orgd.OrganizationId
		JOIN ODS.OrganizationProgramType orgpt ON orgd.OrganizationId = orgpt.OrganizationId
		JOIN ODS.RefProgramType rpt ON orgpt.RefProgramTypeId = rpt.RefProgramTypeId
		WHERE orgd.Name = 'Migrant Program'
		AND rpt.Code = '04920'



		-----------------------------------------------------------------------------
		----Create an OrganizationPersonRole Migrant Status for the Student --------
		-----------------------------------------------------------------------------

		--Check for Migrant Records that already exist--

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET OrganizationPersonRoleID_MigrantProgram = opr.OrganizationPersonRoleId
		FROM Staging.Migrant tp
		JOIN ODS.OrganizationPersonRole opr ON tp.PersonID = opr.PersonId
		WHERE tp.OrganizationID_MigrantProgram = opr.OrganizationId
		AND opr.RoleId = App.GetRoleId('K12 Student')
		AND opr.EntryDate = ISNULL(tp.ProgramParticipationStartDate, '1900-01-01')
		AND opr.ExitDate = ISNULL(tp.ProgramParticipationExitDate, '1900-01-01')

		--#EndOfSchoolYearReporting_Migrant
		UPDATE #EndOfSchoolYearReporting_Migrant
		SET OrganizationPersonRoleID_MigrantProgram = opr.OrganizationPersonRoleId
		FROM #EndOfSchoolYearReporting_Migrant tp
		JOIN ODS.OrganizationPersonRole opr ON tp.PersonID = opr.PersonId
		WHERE tp.OrganizationID_MigrantProgram = opr.OrganizationId
		AND opr.RoleId = App.GetRoleId('K12 Student')
		AND opr.EntryDate = App.GetFiscalYearStartDate(@SchoolYear)
		AND opr.ExitDate = App.GetFiscalYearEndDate(@SchoolYear)


		--Create an OrganizationPersonRole (Enrollment) into the Migrant Program if the ProgramParticipationStartDate and ProgramParticipationEndDates are supplied

		INSERT INTO [ODS].[OrganizationPersonRole]
           ([OrganizationId]
           ,[PersonId]
           ,[RoleId]
           ,[EntryDate]
           ,[ExitDate])
		SELECT DISTINCT
            tp.OrganizationID_MigrantProgram [OrganizationId]
           ,tp.PersonID [PersonId]
           ,App.GetRoleId('K12 Student') [RoleId]
           ,tp.ProgramParticipationStartDate [EntryDate]
           ,tp.ProgramParticipationExitDate [ExitDate] 
		FROM Staging.Migrant tp
		WHERE tp.OrganizationPersonRoleID_MigrantProgram IS NULL
		AND tp.OrganizationID_MigrantProgram IS NOT NULL
		AND tp.PersonID IS NOT NULL
		AND tp.ProgramParticipationStartDate IS NOT NULL
		AND tp.ProgramParticipationExitDate IS NOT NULL

		--Create an OrganizationPersonRole (Enrollment) into the Migrant Program for the last day of the year --

		INSERT INTO [ODS].[OrganizationPersonRole]
           ([OrganizationId]
           ,[PersonId]
           ,[RoleId]
           ,[EntryDate]
           ,[ExitDate])
		SELECT DISTINCT
            tp.OrganizationID_MigrantProgram [OrganizationId]
           ,tp.PersonID [PersonId]
           ,App.GetRoleId('K12 Student') [RoleId]
           ,tp.ProgramParticipationStartDate [EntryDate]
           ,tp.ProgramParticipationExitDate [ExitDate] 
		FROM #EndOfSchoolYearReporting_Migrant tp
		WHERE tp.OrganizationPersonRoleID_MigrantProgram IS NULL
		AND tp.OrganizationID_MigrantProgram IS NOT NULL
		AND tp.PersonID IS NOT NULL

		--Update the temporary table with the Migrant Program OrganizationPersonRoleId

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET OrganizationPersonRoleID_MigrantProgram = opr.OrganizationPersonRoleId
		FROM Staging.Migrant tp
		JOIN ODS.OrganizationPersonRole opr ON tp.PersonID = opr.PersonId
		WHERE tp.OrganizationID_MigrantProgram = opr.OrganizationId
		AND opr.RoleId = App.GetRoleId('K12 Student')
		AND opr.EntryDate = ISNULL(tp.ProgramParticipationStartDate, '1900-01-01')
		AND opr.ExitDate = ISNULL(tp.ProgramParticipationExitDate, '1900-01-01')

		--#EndOfSchoolYearReporting_Migrant
		UPDATE #EndOfSchoolYearReporting_Migrant
		SET OrganizationPersonRoleID_MigrantProgram = opr.OrganizationPersonRoleId
		FROM #EndOfSchoolYearReporting_Migrant tp
		JOIN ODS.OrganizationPersonRole opr ON tp.PersonID = opr.PersonId
		WHERE tp.OrganizationID_MigrantProgram = opr.OrganizationId
		AND opr.RoleId = App.GetRoleId('K12 Student')
		AND opr.EntryDate = App.GetFiscalYearEndDate(@SchoolYear)
		AND opr.ExitDate = App.GetFiscalYearEndDate(@SchoolYear)


		-------------------------------------------------------------------------------
		----Create a PersonProgramParticipation Migrant Status for the Student --------
		-------------------------------------------------------------------------------

		--Check to see if a PersonProgramParticipation already exists for the Migrant Program--

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET PersonProgramParticipationId = ppp.PersonProgramParticipationId
		FROM Staging.Migrant tp
		JOIN ODS.PersonProgramParticipation ppp ON tp.OrganizationPersonRoleID_MigrantProgram = ppp.OrganizationPersonRoleId
		WHERE ppp.RecordStartDateTime = ISNULL(tp.ProgramParticipationStartDate, '1900-01-01')
		AND ppp.RecordEndDateTime = ISNULL(tp.ProgramParticipationExitDate, '1900-01-01')

		--#EndOfSchoolYearReporting_Migrant
		UPDATE #EndOfSchoolYearReporting_Migrant
		SET PersonProgramParticipationId = ppp.PersonProgramParticipationId
		FROM #EndOfSchoolYearReporting_Migrant tp
		JOIN ODS.PersonProgramParticipation ppp ON tp.OrganizationPersonRoleID_MigrantProgram = ppp.OrganizationPersonRoleId
		WHERE ppp.RecordStartDateTime = ProgramParticipationStartDate
		AND ppp.RecordEndDateTime = ProgramParticipationExitDate

		--Create a PersonProgramParticipation for each OrganizationPersonRole

		--Staging.Migrant
		INSERT INTO [ODS].[PersonProgramParticipation]
           ([OrganizationPersonRoleId]
           ,[RefParticipationTypeId]
           ,[RefProgramExitReasonId]
           ,[RecordStartDateTime]
           ,[RecordEndDateTime])
		SELECT DISTINCT
		    tp.OrganizationPersonRoleID_MigrantProgram [OrganizationPersonRoleId]
           ,NULL [RefParticipationTypeId]
           ,NULL [RefProgramExitReasonId]
           ,tp.ProgramParticipationStartDate [RecordStartDateTime]
           ,tp.ProgramParticipationExitDate [RecordEndDateTime]
		FROM Staging.Migrant tp
		WHERE tp.PersonProgramParticipationId IS NULL
		AND tp.OrganizationPersonRoleID_MigrantProgram IS NOT NULL
		AND tp.ProgramParticipationStartDate IS NOT NULL
		AND tp.ProgramParticipationExitDate IS NOT NULL

		--#EndOfSchoolYearReporting_Migrant
		INSERT INTO [ODS].[PersonProgramParticipation]
           ([OrganizationPersonRoleId]
           ,[RefParticipationTypeId]
           ,[RefProgramExitReasonId]
           ,[RecordStartDateTime]
           ,[RecordEndDateTime])
		SELECT DISTINCT
		    tp.OrganizationPersonRoleID_MigrantProgram [OrganizationPersonRoleId]
           ,NULL [RefParticipationTypeId]
           ,NULL [RefProgramExitReasonId]
           ,tp.ProgramParticipationStartDate [RecordStartDateTime]
           ,tp.ProgramParticipationExitDate [RecordEndDateTime]
		FROM #EndOfSchoolYearReporting_Migrant tp
		WHERE tp.PersonProgramParticipationId IS NULL
		AND tp.OrganizationPersonRoleID_MigrantProgram IS NOT NULL
		AND tp.ProgramParticipationStartDate IS NOT NULL
		AND tp.ProgramParticipationExitDate IS NOT NULL

		--Update the temporary table with the Migrant Program PersonProgramParticipationId--

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET PersonProgramParticipationId = ppp.PersonProgramParticipationId
		FROM Staging.Migrant tp
		JOIN ODS.PersonProgramParticipation ppp ON tp.OrganizationPersonRoleID_MigrantProgram = ppp.OrganizationPersonRoleId
		WHERE ppp.RecordStartDateTime = ISNULL(tp.ProgramParticipationStartDate, '1900-01-01')
		AND ppp.RecordEndDateTime = ISNULL(tp.ProgramParticipationExitDate, '1900-01-01')

		--#EndOfSchoolYearReporting_Migrant
		UPDATE #EndOfSchoolYearReporting_Migrant
		SET PersonProgramParticipationId = ppp.PersonProgramParticipationId
		FROM #EndOfSchoolYearReporting_Migrant tp
		JOIN ODS.PersonProgramParticipation ppp ON tp.OrganizationPersonRoleID_MigrantProgram = ppp.OrganizationPersonRoleId
		WHERE ppp.RecordStartDateTime = ProgramParticipationStartDate
		AND ppp.RecordEndDateTime = ProgramParticipationExitDate

		-------------------------------------------------------------------------------
		----Create ProgramParticipationMigrant records for the Student ----------------
		-------------------------------------------------------------------------------

		--Create a ProgramParticipationMigrant for each PersonProgramParticipation--

		--Check to see if ProgramParticipationMigrant already exists

		--Staging.Migrant
		UPDATE Staging.Migrant
		SET ProgramParticipationMigrantId = ppm.ProgramParticipationMigrantId
		FROM Staging.Migrant mp
		JOIN ODS.PersonProgramParticipation pp ON mp.PersonProgramParticipationId = pp.PersonProgramParticipationId
		JOIN ODS.ProgramParticipationMigrant ppm ON pp.PersonProgramParticipationId = ppm.PersonProgramParticipationId
		WHERE ISNULL(ppm.RecordStartDateTime, '1900-01-01') = mp.ProgramParticipationStartDate
		AND ISNULL(ppm.RecordEndDateTime, '1900-01-01') = mp.ProgramParticipationExitDate
		
		--#EndOfSchoolYearReporting_Migrant
		UPDATE #EndOfSchoolYearReporting_Migrant
		SET ProgramParticipationMigrantId = ppm.ProgramParticipationMigrantId
		FROM #EndOfSchoolYearReporting_Migrant mp
		JOIN ODS.PersonProgramParticipation pp ON mp.PersonProgramParticipationId = pp.PersonProgramParticipationId
		JOIN ODS.ProgramParticipationMigrant ppm ON pp.PersonProgramParticipationId = ppm.PersonProgramParticipationId
		WHERE ISNULL(ppm.RecordStartDateTime, '1900-01-01') = mp.ProgramParticipationStartDate
		AND ISNULL(ppm.RecordEndDateTime, '1900-01-01') = mp.ProgramParticipationExitDate


		--Also need to go back and touch the Title 1 scripts to do the same thing because that's not in there.

		--Staging.Migrant
		INSERT INTO [ODS].[ProgramParticipationMigrant]
				   ([PersonProgramParticipationId]
				   ,[RefMepEnrollmentTypeId]
				   ,[RefMepProjectBasedId]
				   ,[RefMepServiceTypeId]
				   ,[MepEligibilityExpirationDate]
				   ,[ContinuationOfServicesStatus]
				   ,[RefContinuationOfServicesReasonId]
				   ,[BirthdateVerification]
				   ,[ImmunizationRecordFlag]
				   ,[MigrantStudentQualifyingArrivalDate]
				   ,[LastQualifyingMoveDate]
				   ,[QualifyingMoveFromCity]
				   ,[RefQualifyingMoveFromStateId]
				   ,[RefQualifyingMoveFromCountryId]
				   ,[DesignatedGraduationSchoolId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime]
				   ,[PrioritizedForServices])
		SELECT DISTINCT
					mp.PersonProgramParticipationId [PersonProgramParticipationId]
				   ,mepe.RefMepEnrollmentTypeId [RefMepEnrollmentTypeId]
				   ,NULL [RefMepProjectBasedId]
				   ,mepst.RefMepServiceTypeId [RefMepServiceTypeId]
				   ,NULL [MepEligibilityExpirationDate]
				   ,mp.MigrantEducationProgramContinuationOfServicesStatus [ContinuationOfServicesStatus]
				   ,conser.RefContinuationOfServicesReasonId [RefContinuationOfServicesReasonId]
				   ,NULL [BirthdateVerification]
				   ,NULL [ImmunizationRecordFlag]
				   ,mp.MigrantStudentQualifyingArrivalDate [MigrantStudentQualifyingArrivalDate]
				   ,mp.LastQualifyingMoveDate [LastQualifyingMoveDate]
				   ,NULL [QualifyingMoveFromCity]
				   ,NULL [RefQualifyingMoveFromStateId]
				   ,NULL [RefQualifyingMoveFromCountryId]
				   ,NULL [DesignatedGraduationSchoolId]
				   ,ProgramParticipationStartDate [RecordStartDateTime]
				   ,ProgramParticipationStartDate [RecordEndDateTime]
				   ,MigrantPrioritizedForServices [PrioritizedForServices]
		FROM Staging.Migrant mp
		JOIN ODS.SourceSystemReferenceData mepenrollment 
			ON mp.MigrantEducationProgramEnrollmentType = mepenrollment.InputCode
			AND mepenrollment.TableName = 'RefMepEnrollmentType'
			AND mepenrollment.SchoolYear = @SchoolYear
		JOIN ODS.RefMepEnrollmentType mepe 
			ON mepenrollment.OutputCode = mepe.Code
		JOIN ODS.SourceSystemReferenceData mepservice 
			ON mp.MigrantEducationProgramServicesType = mepservice.InputCode
			AND mepservice.TableName = 'RefMepServiceType'
			AND mepservice.SchoolYear = @SchoolYear
		JOIN ODS.RefMepServiceType mepst 
			ON mepservice.OutputCode = mepst.Code
		LEFT JOIN ODS.SourceSystemReferenceData ContinuationOfServices
			ON mp.ContinuationOfServicesReason = ContinuationOfServices.InputCode
			AND ContinuationOfServices.TableName = 'RefContinuationOfServices'
			AND ContinuationOfServices.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefContinuationOfServices conser 
			ON ContinuationOfServices.OutputCode = conser.Code
		WHERE mp.PersonProgramParticipationId IS NOT NULL
		AND mp.ProgramParticipationMigrantId IS NULL

		--#EndOfSchoolYearReporting_Migrant
		INSERT INTO [ODS].[ProgramParticipationMigrant]
				   ([PersonProgramParticipationId]
				   ,[RefMepEnrollmentTypeId]
				   ,[RefMepProjectBasedId]
				   ,[RefMepServiceTypeId]
				   ,[MepEligibilityExpirationDate]
				   ,[ContinuationOfServicesStatus]
				   ,[RefContinuationOfServicesReasonId]
				   ,[BirthdateVerification]
				   ,[ImmunizationRecordFlag]
				   ,[MigrantStudentQualifyingArrivalDate]
				   ,[LastQualifyingMoveDate]
				   ,[QualifyingMoveFromCity]
				   ,[RefQualifyingMoveFromStateId]
				   ,[RefQualifyingMoveFromCountryId]
				   ,[DesignatedGraduationSchoolId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime]
				   ,[PrioritizedForServices])
		SELECT DISTINCT
					mp.PersonProgramParticipationId [PersonProgramParticipationId]
				   ,mepe.RefMepEnrollmentTypeId [RefMepEnrollmentTypeId]
				   ,NULL [RefMepProjectBasedId]
				   ,mepst.RefMepServiceTypeId [RefMepServiceTypeId]
				   ,NULL [MepEligibilityExpirationDate]
				   ,mp.MigrantEducationProgramContinuationOfServicesStatus [ContinuationOfServicesStatus]
				   ,conser.RefContinuationOfServicesReasonId [RefContinuationOfServicesReasonId]
				   ,NULL [BirthdateVerification]
				   ,NULL [ImmunizationRecordFlag]
				   ,mp.MigrantStudentQualifyingArrivalDate [MigrantStudentQualifyingArrivalDate]
				   ,mp.LastQualifyingMoveDate [LastQualifyingMoveDate]
				   ,NULL [QualifyingMoveFromCity]
				   ,NULL [RefQualifyingMoveFromStateId]
				   ,NULL [RefQualifyingMoveFromCountryId]
				   ,NULL [DesignatedGraduationSchoolId]
				   ,ProgramParticipationStartDate [RecordStartDateTime]
				   ,ProgramParticipationStartDate [RecordEndDateTime]
				   ,MigrantPrioritizedForServices [PrioritizedForServices]
		FROM #EndOfSchoolYearReporting_Migrant mp
		JOIN ODS.SourceSystemReferenceData mepenrollment 
			ON mp.MigrantEducationProgramEnrollmentType = mepenrollment.InputCode
			AND mepenrollment.TableName = 'RefMepEnrollmentType'
			AND mepenrollment.SchoolYear = @SchoolYear
		JOIN ODS.RefMepEnrollmentType mepe 
			ON mepenrollment.OutputCode = mepe.Code
		JOIN ODS.SourceSystemReferenceData mepservice 
			ON mp.MigrantEducationProgramServicesType = mepservice.InputCode
			AND mepservice.TableName = 'RefMepServiceType'
			AND mepservice.SchoolYear = @SchoolYear
		JOIN ODS.RefMepServiceType mepst 
			ON mepservice.OutputCode = mepst.Code
		LEFT JOIN ODS.SourceSystemReferenceData ContinuationOfServices
			ON mp.ContinuationOfServicesReason = ContinuationOfServices.InputCode
			AND ContinuationOfServices.TableName = 'RefContinuationOfServices'
			AND ContinuationOfServices.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefContinuationOfServices conser 
			ON ContinuationOfServices.OutputCode = conser.Code
		WHERE mp.PersonProgramParticipationId IS NOT NULL
		AND mp.ProgramParticipationMigrantId IS NULL



		DROP TABLE #EndOfSchoolYearReporting_Migrant

		set nocount off;


	END TRY
	BEGIN CATCH



	END CATCH; 

END



----Migrate_Data_ETL_IMPLEMENTATION_STEP07_TitleIParticipation

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_TitleIParticipation]    Script Date: 6/14/2018 4:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load Title 1 indicators about students for EDFacts reports that apply to the full year.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP07_TitleIParticipation];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;


			--------------------------------------------------------------
			--- Optimize indexes on Staging.ProgramParticipationTitleI --- 
			--------------------------------------------------------------
			ALTER INDEX ALL ON Staging.ProgramParticipationTitleI
			REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);

			-------------------------------------------------------
			---Update the RefTitleIIndicatorId --------------------
			-------------------------------------------------------

			--Need to add RefTitleIIndicator to the ODS.EdFiReferenceData table


			-------------------------------------------------------
			---Associate the PersonId with the staging table ----
			-------------------------------------------------------

			UPDATE Staging.ProgramParticipationTitleI
			SET PersonID = pid.PersonId
			FROM Staging.ProgramParticipationTitleI mcc
			JOIN ODS.PersonIdentifier pid ON mcc.Student_Identifier_State = pid.Identifier
			WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
				AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')

			--------------------------------------------------------------------
			---Associate the School OrganizationId with the staging table ----
			--------------------------------------------------------------------

			UPDATE Staging.ProgramParticipationTitleI
			SET OrganizationID_School = orgid.OrganizationId
			FROM Staging.ProgramParticipationTitleI mcc
			JOIN ODS.OrganizationIdentifier orgid ON mcc.School_Identifier_State = orgid.Identifier
			WHERE orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
				AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')


			-----------------------------------------------------------------------------
			---Associate the Title I Program OrganizationId with the staging table ----
			-----------------------------------------------------------------------------

			UPDATE Staging.ProgramParticipationTitleI
			SET OrganizationID_TitleIProgram = orgd.OrganizationId
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.OrganizationRelationship orgr ON tp.OrganizationID_School = orgr.Parent_OrganizationId
			JOIN ODS.OrganizationDetail orgd ON orgr.OrganizationId = orgd.OrganizationId
			JOIN ODS.OrganizationProgramType orgpt ON orgd.OrganizationId = orgpt.OrganizationId
			JOIN ODS.RefProgramType rpt ON orgpt.RefProgramTypeId = rpt.RefProgramTypeId
			WHERE orgd.Name = 'Title I Program'
				AND rpt.Code = '09999'

			--Note: Need to change 09999 to the ID that represents Title I Programs when that is created ---

			--------------------------------------------------
			----Create Title I Indicator for the Student -----
			--------------------------------------------------

			--Check for Title I Records that already exist--
			UPDATE Staging.ProgramParticipationTitleI
			SET OrganizationPersonRoleID_TitleIProgram = opr.OrganizationPersonRoleId
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.OrganizationPersonRole opr ON tp.PersonID = opr.PersonId
			WHERE tp.OrganizationID_TitleIProgram = opr.OrganizationId
				AND opr.RoleId = App.GetRoleId('K12 Student')
				AND opr.EntryDate = [App].[GetFiscalYearStartDate](@SchoolYear)
				AND opr.ExitDate = [App].[GetFiscalYearEndDate](@SchoolYear)

			--Create an OrganizationPersonRole (Enrollment) into the Title I Program for the last day of the year --

			INSERT INTO [ODS].[OrganizationPersonRole]
			   ([OrganizationId]
			   ,[PersonId]
			   ,[RoleId]
			   ,[EntryDate]
			   ,[ExitDate])
			SELECT DISTINCT
				tp.OrganizationID_TitleIProgram [OrganizationId]
			   ,tp.PersonID [PersonId]
			   ,App.GetRoleId('K12 Student') [RoleId]
			   ,[App].[GetFiscalYearStartDate](@SchoolYear) [EntryDate]
			   ,[App].[GetFiscalYearEndDate](@SchoolYear) [ExitDate] 
			FROM Staging.ProgramParticipationTitleI tp
			WHERE tp.OrganizationPersonRoleID_TitleIProgram IS NULL
				AND tp.OrganizationID_TitleIProgram IS NOT NULL
				AND tp.PersonID IS NOT NULL

			--Update the staging table with the Title I Program OrganizationPersonRoleId

			UPDATE Staging.ProgramParticipationTitleI
			SET OrganizationPersonRoleID_TitleIProgram = opr.OrganizationPersonRoleId
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.OrganizationPersonRole opr 
				ON tp.PersonID = opr.PersonId
				AND tp.OrganizationID_TitleIProgram = opr.OrganizationId
			WHERE opr.RoleId = App.GetRoleId('K12 Student')
				AND opr.EntryDate = [App].[GetFiscalYearStartDate](@SchoolYear)
				AND opr.ExitDate = [App].[GetFiscalYearEndDate](@SchoolYear)

			--Check to see if a PersonProgramParticipation already exists for the Title I Program--

			UPDATE Staging.ProgramParticipationTitleI
			SET PersonProgramParticipationId = ppp.PersonProgramParticipationId
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.PersonProgramParticipation ppp 
				ON tp.OrganizationPersonRoleID_TitleIProgram = ppp.OrganizationPersonRoleId
			JOIN ODS.ProgramParticipationTitleI pp 
				ON ppp.PersonProgramParticipationId = pp.PersonProgramParticipationId
				AND pp.RefTitleIIndicatorId = tp.RefTitleIIndicatorId
			WHERE ppp.RecordStartDateTime = [App].[GetFiscalYearStartDate](@SchoolYear)
				AND ppp.RecordEndDateTime = [App].[GetFiscalYearEndDate](@SchoolYear)
			

			--Create a PersonProgramParticipation for each OrganizationPersonRole
			DECLARE @NewPersonProgramParticipationTitleI TABLE (
				  PersonProgramParticipationId INT
				, SourceId INT
			);

			MERGE [ODS].[PersonProgramParticipation] AS TARGET
			USING Staging.ProgramParticipationTitleI AS SOURCE
				ON SOURCE.PersonProgramParticipationId = TARGET.PersonProgramParticipationId
			WHEN NOT MATCHED AND SOURCE.OrganizationPersonRoleID_TitleIProgram IS NOT NULL THEN 
				INSERT 
			   ([OrganizationPersonRoleId]
			   ,[RefParticipationTypeId]
			   ,[RefProgramExitReasonId]
			   ,[RecordStartDateTime]
			   ,[RecordEndDateTime])
			VALUES
			   (OrganizationPersonRoleID_TitleIProgram 
			   ,NULL 
			   ,NULL 
			   ,[App].[GetFiscalYearStartDate](@SchoolYear) 
			   ,[App].[GetFiscalYearEndDate](@SchoolYear))
			OUTPUT
				  INSERTED.PersonProgramParticipationId 
				, SOURCE.ID
			INTO @NewPersonProgramParticipationTitleI;

			--Update the staging table with the new PersonProgramParticipationId
			UPDATE Staging.ProgramParticipationTitleI 
			SET PersonProgramParticipationId = nppp.PersonProgramParticipationId
			FROM Staging.ProgramParticipationTitleI ppi
			JOIN @NewPersonProgramParticipationTitleI nppp
				ON ppi.ID = nppp.SourceId

			--Create a ProgramParticipationTitleI for each PersonProgramParticipation--

			INSERT INTO [ODS].[ProgramParticipationTitleI]
			   ([PersonProgramParticipationId]
			   ,[RefTitleIIndicatorId])
			SELECT DISTINCT
				tp.PersonProgramParticipationId [PersonProgramParticipationId]
			   ,rti.RefTitleIIndicatorId [RefTitleIIndicatorId]
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.SourceSystemReferenceData rd 
				ON tp.TitleIIndicator = rd.InputCode
				AND rd.TableName = 'RefTitleIIndicator'
				AND rd.SchoolYear = @SchoolYear
			JOIN ODS.RefTitleIIndicator rti 
				ON rd.OutputCode = rti.Code
			WHERE tp.PersonProgramParticipationId IS NOT NULL
				AND rti.RefTitleIIndicatorId IS NOT NULL	


			---Add in validation and error checking in this location --

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END


----Migrate_Data_ETL_STEP02_Discipline

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_STEP02_Discipline]    Script Date: 10/20/2017 10:45:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode] 
	@SchoolYear SMALLINT
AS 
  /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to load the data for membership (C052) and Special Education Child Count
		(C002, C089).

    Assumptions:
        
    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources: 

    Data Targets:  Generate Database:   Generate

    Return Values:
    	 0	= Success
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/

BEGIN

	BEGIN TRY
	
		set nocount on;

		-------------------------------------------------------
		----Grab the student person and enrollment records ----
		-------------------------------------------------------

		UPDATE Staging.Discipline 
		SET   PersonId = pid.PersonId
			, OrganizationPersonRoleId_School = opr.OrganizationPersonRoleId
			, OrganizationId_School = oid.OrganizationId
		FROM Staging.Discipline d 
		JOIN ODS.PersonIdentifier pid 
			ON pid.Identifier = d.Student_Identifier_State
		JOIN ODS.OrganizationIdentifier oid 
			ON oid.Identifier = d.School_Identifier_State
		JOIN ODS.OrganizationPersonRole opr 
			ON pid.PersonId = opr.PersonId
			AND oid.OrganizationId = opr.OrganizationId
			AND d.DisciplinaryActionStartDate BETWEEN opr.EntryDate AND ISNULL(opr.ExitDate, GETDATE())
		
		-------------------------------------------------------------------------------------------------
		----Merge Incident records so that we don't create duplicate discipline entries accidentally ----
		-------------------------------------------------------------------------------------------------

		DECLARE @NewIncidents TABLE (
			  IncidentId INT
			, IncidentIdentifier VARCHAR(40)
			, OrganizationPersonRoleId INT
		)

		MERGE ODS.Incident AS TARGET
		USING Staging.Discipline AS SOURCE 
			ON TARGET.IncidentIdentifier = SOURCE.IncidentIdentifier
		WHEN NOT MATCHED THEN 
			INSERT VALUES (
				  SOURCE.IncidentIdentifier
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, SOURCE.OrganizationPersonRoleId_School
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
			)
		OUTPUT 
			  INSERTED.IncidentId
			, SOURCE.IncidentIdentifier
			, SOURCE.OrganizationPersonRoleId_School
		INTO @NewIncidents;


		-------------------------------------------
		----Merge K12StudentDiscipline records ----
		-------------------------------------------
		-- We cannot update the records in K12StudentDiscipline without K12StudentDisciplineId, so we have to kill & fill the table 
		DELETE FROM [ODS].[K12StudentDiscipline]
		FROM [ODS].[K12StudentDiscipline] sd
		JOIN Staging.Discipline d
			ON sd.IncidentId = d.IncidentId
			AND sd.OrganizationPersonRoleId = d.OrganizationPersonRoleId_School

		INSERT INTO [ODS].[K12StudentDiscipline]
           ([OrganizationPersonRoleId]
           ,[RefDisciplineReasonId]
           ,[RefDisciplinaryActionTakenId]
           ,[DisciplinaryActionStartDate]
           ,[DisciplinaryActionEndDate]
           ,[DurationOfDisciplinaryAction]
           ,[RefDisciplineLengthDifferenceReasonId]
           ,[FullYearExpulsion]
           ,[ShortenedExpulsion]
           ,[EducationalServicesAfterRemoval]
           ,[RefIdeaInterimRemovalId]
           ,[RefIdeaInterimRemovalReasonId]
           ,[RelatedToZeroTolerancePolicy]
           ,[IncidentId]
           ,[IEPPlacementMeetingIndicator]
           ,[RefDisciplineMethodFirearmsId]
           ,[RefDisciplineMethodOfCwdId]
           ,[RefIDEADisciplineMethodFirearmId])
		SELECT DISTINCT
            d.OrganizationPersonRoleId_School [OrganizationPersonRoleId]
           ,dr.RefDisciplineReasonId [RefDisciplineReasonId]
           ,dat.RefDisciplinaryActionTakenId [RefDisciplinaryActionTakenId]
           ,d.DisciplinaryActionStartDate [DisciplinaryActionStartDate]
           ,CASE WHEN d.DisciplinaryActionEndDate IS NULL THEN DisciplinaryActionStartDate
				ELSE d.DisciplinaryActionEndDate END [DisciplinaryActionEndDate]
           ,d.DurationOfDisciplinaryAction [DurationOfDisciplinaryAction]
           ,NULL [RefDisciplineLengthDifferenceReasonId]
           ,NULL [FullYearExpulsion]
           ,NULL [ShortenedExpulsion]
           ,d.EducationalServicesAfterRemoval [EducationalServicesAfterRemoval]
           ,iir.RefIdeaInterimRemovalId [RefIdeaInterimRemovalId]
           ,iirr.RefIdeaInterimRemovalReasonId [RefIdeaInterimRemovalReasonId]
           ,NULL [RelatedToZeroTolerancePolicy]
           ,i.IncidentId [IncidentId]
           ,NULL [IEPPlacementMeetingIndicator]
           ,NULL [RefDisciplineMethodFirearmsId]
           ,dm.RefDisciplineMethodOfCwdId [RefDisciplineMethodOfCwdId]
           ,NULL [RefIDEADisciplineMethodFirearmId]
		FROM ODS.Person p
		JOIN ODS.PersonIdentifier pid ON p.PersonID = pid.PersonId
		JOIN Staging.Discipline d ON pid.Identifier = d.Student_Identifier_State
		JOIN @NewIncidents i ON d.IncidentIdentifier = i.IncidentIdentifier
			AND d.OrganizationPersonRoleId_School = i.OrganizationPersonRoleId
		LEFT JOIN ods.SourceSystemReferenceData rddr
			ON d.DisciplineReason = rddr.InputCode
			AND rddr.TableName = 'RefDisciplineReason'
			AND rddr.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefDisciplineReason dr
			ON rddr.OutputCode = dr.Code
		LEFT JOIN ods.SourceSystemReferenceData rdda
			ON d.DisciplinaryActionTaken = rdda.InputCode
			AND rdda.TableName = 'RefDisciplinaryActionTaken'
			AND rdda.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefDisciplinaryActionTaken dat
			ON rdda.OutputCode = dat.Code
		LEFT JOIN ods.SourceSystemReferenceData rdiir
			ON d.IdeaInterimRemoval = rdiir.InputCode
			AND rdiir.TableName = 'RefIdeaInterimRemoval'
			AND rdiir.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefIdeaInterimRemoval iir
			ON rdiir.OutputCode = iir.Code
		LEFT JOIN ods.SourceSystemReferenceData rdiirr
			ON d.IdeaInterimRemovalReason = rdiirr.InputCode
			AND rdiirr.TableName = 'RefIdeaInterimRemovalReason'
			AND rdiirr.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefIdeaInterimRemovalReason iirr
			ON rdiirr.OutputCode = iirr.Code
		LEFT JOIN ods.SourceSystemReferenceData rdidm
			ON d.DisciplineMethodOfCwd = rdidm.InputCode
			AND rdidm.TableName = 'RefDisciplineMethodOfCwd'
			AND rdidm.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefDisciplineMethodOfCwd dm
			ON rdidm.OutputCode = dm.Code
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
			AND d.OrganizationPersonRoleId_School IS NOT NULL


		--------------------------------------------------------------------------------------------------
		---- Update Educational Services After Removal based on Disciplinary Action Taken If NULL Value --
		--------------------------------------------------------------------------------------------------

		UPDATE ODS.K12StudentDiscipline
		SET EducationalServicesAfterRemoval = 1
		FROM ODS.K12StudentDiscipline ksd
		JOIN ODS.RefDisciplinaryActionTaken dat ON ksd.RefDisciplinaryActionTakenId = dat.RefDisciplinaryActionTakenId
		WHERE dat.Code IN ('03086', '03101')
		AND ksd.EducationalServicesAfterRemoval IS NULL

		UPDATE ODS.K12StudentDiscipline SET EducationalServicesAfterRemoval = 0 WHERE EducationalServicesAfterRemoval IS NULL



		set nocount off;

	END TRY
	BEGIN CATCH

		declare @msg as nvarchar(max)
		set @msg = ERROR_MESSAGE()

		declare @sev as int
		set @sev = ERROR_SEVERITY()

		RAISERROR(@msg, @sev, 1)

	END CATCH; 

END


----Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode


GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode]
	@SchoolYear SMALLINT
	AS
   /*************************************************************************************************************
    Created by:    Nathan Clinton | nathan.clinton@aemcorp.com | CIID (https://ciidta.grads360.org/#program)
    Date Created:  6/28/2018

    Purpose:
        The purpose of this ETL is to maintain the unique list of Student Identifiers assigned by the state
		in the ODS.

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  Data Warehouse: db_ECSUID.dbo.ECSUID

    Data Targets:  Generate Database:   Generate.ODS.Person
										Generate.ODS.PersonIdentifier

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;

		DECLARE @RecordStartDate DATETIME

		SET @RecordStartDate = App.GetFiscalYearEndDate(@SchoolYear)

		-- Grab the PersonID for all personnel records
		UPDATE Staging.StaffAssignment
		SET PersonId = pid.PersonId
		FROM Staging.StaffAssignment sa
		JOIN ODS.PersonIdentifier pid
			ON sa.Personnel_Identifier_State = pid.Identifier
			AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001074')

		-- Grab the OrganizationID for all personnel records
		UPDATE Staging.StaffAssignment
		SET OrganizationId = oid.OrganizationId
		FROM Staging.StaffAssignment sa
		JOIN ODS.OrganizationIdentifier oid
			ON sa.School_Identifier_State = oid.Identifier
			AND oid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND oid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')

		
		
		-- Create base OrganizationPersonRole to link the personnel to the schools to which they are assigned
		INSERT INTO ODS.OrganizationPersonRole 
		SELECT 
			  oid.OrganizationId
			, sa.PersonId
			, r.RoleId
			, sa.AssignmentStartDate
			, sa.AssignmentEndDate
		FROM Staging.StaffAssignment sa
		JOIN ODS.OrganizationIdentifier oid
			ON sa.School_Identifier_State = oid.Identifier
			AND oid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND oid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
		JOIN ODS.[Role] r
			ON [Name] = 'K12 Personnel'
		LEFT JOIN ODS.OrganizationPersonRole opr
			ON sa.PersonId = opr.PersonId
			AND oid.OrganizationId = opr.OrganizationId
			AND r.RoleId = opr.RoleId
			AND sa.AssignmentStartDate = opr.EntryDate
		WHERE opr.OrganizationPersonRoleId IS NULL

		-- Update Assignment End Dates as necessary
		UPDATE ODS.OrganizationPersonRole
		SET ExitDate = sa.AssignmentEndDate
		FROM Staging.StaffAssignment sa
		JOIN ODS.[Role] r
			ON [Name] = 'K12 Personnel'
		JOIN ODS.OrganizationPersonRole opr
			ON sa.OrganizationId = opr.OrganizationId
			AND sa.PersonId = opr.PersonId
			AND sa.AssignmentStartDate = opr.EntryDate
			AND opr.ExitDate IS NULL
			AND sa.AssignmentEndDate IS NOT NULL

		-- Grab the OrganizationPersonRoleIds for all StaffAssignment records
		UPDATE Staging.StaffAssignment
		SET OrganizationPersonRoleId = opr.OrganizationPersonRoleId
		FROM Staging.StaffAssignment sa
		JOIN ODS.OrganizationPersonRole opr
			ON sa.OrganizationId = opr.OrganizationId
			AND sa.PersonId = opr.PersonId
			AND sa.AssignmentStartDate = opr.EntryDate

		-- Updte existing K12StaffAssignment records
		UPDATE ODS.K12StaffAssignment
		SET   RefK12StaffClassificationId = sc.RefEducationStaffClassificationId
			, FullTimeEquivalency = ksa.FullTimeEquivalency
			, HighlyQualifiedTeacherIndicator = ksa.HighlyQualifiedTeacherIndicator
			, SpecialEducationTeacher = CASE WHEN sc.Code = 'SpecialEducationTeachers' THEN 1 ELSE 0 END
			, RefSpecialEducationStaffCategoryId = sesc.RefSpecialEducationStaffCategoryId
			, RefSpecialEducationAgeGroupTaughtId = seagt.RefSpecialEducationAgeGroupTaughtId
			, RefTitleIProgramStaffCategoryId = tipsc.RefTitleIProgramStaffCategoryId
			, RecordEndDateTime = sa.AssignmentEndDate
		FROM Staging.StaffAssignment sa
		LEFT JOIN ODS.SourceSystemReferenceData scss
			ON sa.K12StaffClassification = scss.InputCode
			AND scss.TableName = 'RefK12StaffClassification'
			AND scss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefK12StaffClassification sc
			ON scss.OutputCode = sc.Code
		LEFT JOIN ODS.SourceSystemReferenceData sescss
			ON sa.SpecialEducationStaffCategory = sescss.InputCode
			AND sescss.TableName = 'RefSpecialEducationStaffCategory'
			AND sescss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationStaffCategory sesc
			ON sescss.OutputCode = sesc.Code
		LEFT JOIN ODS.SourceSystemReferenceData seagtss
			ON sa.SpecialEducationAgeGroupTaught = seagtss.InputCode
			AND seagtss.TableName = 'RefSpecialEducationAgeGroupTaught'
			AND seagtss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationAgeGroupTaught seagt
			ON seagtss.OutputCode = seagt.Code
		LEFT JOIN ODS.SourceSystemReferenceData tipscss
			ON sa.TitleIProgramStaffCategory = tipscss.InputCode
			AND tipscss.TableName = 'RefTitleIProgramStaffCategory'
			AND tipscss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefTitleIProgramStaffCategory tipsc
			ON tipscss.OutputCode = tipsc.code
		JOIN ODS.K12StaffAssignment ksa
			ON sa.OrganizationPersonRoleId = ksa.OrganizationPersonRoleId

		-- Create new K12StaffAssignment records 
		INSERT INTO ODS.K12StaffAssignment
		SELECT 
			  sa.OrganizationPersonRoleId
			, sc.RefEducationStaffClassificationId
			, NULL
			, NULL
			, NULL
			, NULL
			, NULL
			, sa.FullTimeEquivalency
			, NULL
			, NULL
			, sa.HighlyQualifiedTeacherIndicator
			, CASE WHEN sc.Code = 'SpecialEducationTeachers' THEN 1 ELSE 0 END
			, sesc.RefSpecialEducationStaffCategoryId
			, NULL
			, NULL
			, seagt.RefSpecialEducationAgeGroupTaughtId
			, NULL
			, tipsc.RefTitleIProgramStaffCategoryId
			, sa.AssignmentStartDate
			, sa.AssignmentEndDate
		FROM Staging.StaffAssignment sa
		LEFT JOIN ODS.SourceSystemReferenceData scss
			ON sa.K12StaffClassification = scss.InputCode
			AND scss.TableName = 'RefK12StaffClassification'
			AND scss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefK12StaffClassification sc
			ON scss.OutputCode = sc.Code
		LEFT JOIN ODS.SourceSystemReferenceData sescss
			ON sa.SpecialEducationStaffCategory = sescss.InputCode
			AND sescss.TableName = 'RefSpecialEducationStaffCategory'
			AND sescss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationStaffCategory sesc
			ON sescss.OutputCode = sesc.Code
		LEFT JOIN ODS.SourceSystemReferenceData seagtss
			ON sa.SpecialEducationAgeGroupTaught = seagtss.InputCode
			AND seagtss.TableName = 'RefSpecialEducationAgeGroupTaught'
			AND seagtss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationAgeGroupTaught seagt
			ON seagtss.OutputCode = seagt.Code
		LEFT JOIN ODS.SourceSystemReferenceData tipscss
			ON sa.TitleIProgramStaffCategory = tipscss.InputCode
			AND tipscss.TableName = 'RefTitleIProgramStaffCategory'
			AND tipscss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefTitleIProgramStaffCategory tipsc
			ON tipscss.OutputCode = tipsc.code
		LEFT JOIN ODS.K12StaffAssignment ksa
			ON sa.OrganizationPersonRoleId = ksa.OrganizationPersonRoleId
		WHERE ksa.K12StaffAssignmentId IS NULL


		-- Create missing PersonCredential records
		INSERT INTO ODS.PersonCredential
		SELECT 
			  sa.PersonId
			, NULL
			, ct.RefCredentialTypeId
			, sa.CredentialIssuanceDate
			, sa.CredentialExpirationDate
			, NULL
			, NULL
			, NULL
		FROM Staging.StaffAssignment sa
		LEFT JOIN ODS.SourceSystemReferenceData ctss
			ON sa.CredentialType = ctss.InputCode
			AND ctss.TableName = 'RefCredentialType'
			AND ctss.SchoolYear = @SchoolYear
		JOIN ODS.RefCredentialType ct
			ON ctss.OutputCode = ct.Code
		LEFT JOIN ods.PersonCredential pc
			ON sa.PersonId = pc.PersonId
		WHERE pc.PersonCredentialId IS NULL

		-- Create missing StaffCredential records
		INSERT INTO ODS.StaffCredential
		SELECT
			  NULL
			, NULL
			, NULL
			, pq.RefParaprofessionalQualificationId
			, NULL
			, NULL
			, NULL
			, NULL
			, pc.PersonCredentialId
			, sa.CredentialIssuanceDate
			, sa.CredentialExpirationDate
		FROM Staging.StaffAssignment sa
		JOIN ODS.PersonCredential pc
			ON sa.PersonId = pc.PersonId
		LEFT JOIN ODS.SourceSystemReferenceData pqss
			ON sa.CredentialType = pqss.InputCode
			AND pqss.TableName = 'RefParaprofessionalQualification'
			AND pqss.SchoolYear = @SchoolYear
		JOIN ODS.RefParaprofessionalQualification pq
			ON pqss.OutputCode = pq.Code

		SET NOCOUNT OFF;
  END


  

----Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode

GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode]   Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode]
	@SchoolYear SMALLINT


  AS
    /*************************************************************************************************************
   Date Created:  7/2/2018

    Purpose:
        The purpose of this ETL is to load Assessment data for EDFacts reporting.

    Assumptions:
        
    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources: 

    Data Targets:  Generate Database:   Generate

    Return Values:
    	 0	= Success
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;

			BEGIN TRY


		-------------------------------------------------------------------------
		----Create the Assessment -----------------------------------------------
		-------------------------------------------------------------------------

		--First need to determine if the Assessment already exists so that it is not added again
		
		UPDATE Staging.Assessment
		SET AssessmentId = a.AssessmentId
		FROM Staging.Assessment sa 
		JOIN ODS.Assessment a ON sa.AssessmentTitle = a.Title
		JOIN ODS.SourceSystemReferenceData osrd_subject 
			ON sa.AssessmentAcademicSubject = osrd_subject.InputCode
			AND osrd_subject.TableName = 'RefAcademicSubject'
			AND osrd_subject.SchoolYear = '2018'
		JOIN ODS.RefAcademicSubject ras ON osrd_subject.OutputCode = ras.Code
		JOIN ODS.SourceSystemReferenceData osrd_purpose
			ON sa.AssessmentPurpose = osrd_purpose.InputCode
			AND osrd_purpose.TableName = 'RefAssessmentPurpose'
			AND osrd_purpose.SchoolYear = '2018'
		JOIN ODS.RefAssessmentPurpose rap ON osrd_purpose.OutputCode = rap.Code
		JOIN ODS.SourceSystemReferenceData osrd_type
			ON sa.AssessmentType = osrd_type.InputCode
			AND osrd_type.TableName = 'RefAssessmentType'
			AND osrd_type.SchoolYear = '2018'
		JOIN ODS.RefAssessmentType rat ON osrd_type.OutputCode = rat.Code
		JOIN ODS.SourceSystemReferenceData osrd_typeCWD
			ON sa.AssessmentTypeAdministeredToChildrenWithDisabilities = osrd_typeCWD.InputCode
			AND osrd_typeCWD.TableName = 'RefAssessmentTypeChildrenWithDisabilities'
			AND osrd_typeCWD.SchoolYear = '2018'
		JOIN ODS.RefAssessmentTypeChildrenWithDisabilities rac ON osrd_typeCWD.OutputCode = rac.Code
		WHERE sa.AssessmentShortName = a.ShortName
		AND a.RefAcademicSubjectId = ras.RefAcademicSubjectId
		AND a.RefAssessmentPurposeId = rap.RefAssessmentPurposeId
		AND a.RefAssessmentTypeId = rat.RefAssessmentTypeId
		AND a.RefAssessmentTypeChildrenWithDisabilitiesId = rac.RefAssessmentTypeChildrenWithDisabilitiesId
		AND sa.AssessmentId IS NULL

		--Create the Assessment

		INSERT INTO [ODS].[Assessment]
				   ([Identifier]
				   ,[IdentificationSystem]
				   ,[GUID]
				   ,[Title]
				   ,[ShortName]
				   ,[RefAcademicSubjectId]
				   ,[Objective]
				   ,[Provider]
				   ,[RefAssessmentPurposeId]
				   ,[RefAssessmentTypeId]
				   ,[RefAssessmentTypeChildrenWithDisabilitiesId]
				   ,[AssessmentRevisionDate]
				   ,[AssessmentFamilyTitle]
				   ,[AssessmentFamilyShortName])
		SELECT DISTINCT 
				    NULL [Identifier]
				   ,NULL [IdentificationSystem]
				   ,NULL [GUID]
				   ,sa.AssessmentTitle [Title]
				   ,sa.AssessmentShortName [ShortName]
				   ,ras.RefAcademicSubjectId [RefAcademicSubjectId]
				   ,NULL [Objective]
				   ,NULL [Provider]
				   ,rap.RefAssessmentPurposeId [RefAssessmentPurposeId]
				   ,rat.RefAssessmentTypeId [RefAssessmentTypeId]
				   ,rac.RefAssessmentTypeChildrenWithDisabilitiesId [RefAssessmentTypeChildrenWithDisabilitiesId]
				   ,NULL [AssessmentRevisionDate]
				   ,sa.AssessmentFamilyTitle [AssessmentFamilyTitle]
				   ,sa.AssessmentFamilyShortName [AssessmentFamilyShortName]
		FROM Staging.Assessment sa
		JOIN ODS.SourceSystemReferenceData osrd_subject 
			ON sa.AssessmentAcademicSubject = osrd_subject.InputCode
			AND osrd_subject.TableName = 'RefAcademicSubject'
			AND osrd_subject.SchoolYear = @SchoolYear
		JOIN ODS.RefAcademicSubject ras ON osrd_subject.OutputCode = ras.Code
		JOIN ODS.SourceSystemReferenceData osrd_purpose
			ON sa.AssessmentPurpose = osrd_purpose.InputCode
			AND osrd_purpose.TableName = 'RefAssessmentPurpose'
			AND osrd_purpose.SchoolYear = @SchoolYear
		JOIN ODS.RefAssessmentPurpose rap ON osrd_purpose.OutputCode = rap.Code
		JOIN ODS.SourceSystemReferenceData osrd_type
			ON sa.AssessmentType = osrd_type.InputCode
			AND osrd_type.TableName = 'RefAssessmentType'
			AND osrd_type.SchoolYear = @SchoolYear
		JOIN ODS.RefAssessmentType rat ON osrd_type.OutputCode = rat.Code
		JOIN ODS.SourceSystemReferenceData osrd_typeCWD
			ON sa.AssessmentTypeAdministeredToChildrenWithDisabilities = osrd_typeCWD.InputCode
			AND osrd_typeCWD.TableName = 'RefAssessmentTypeChildrenWithDisabilities'
			AND osrd_typeCWD.SchoolYear = @SchoolYear
		JOIN ODS.RefAssessmentTypeChildrenWithDisabilities rac ON osrd_typeCWD.OutputCode = rac.Code
		WHERE AssessmentId IS NULL

		--Add the AssessmentId to the staging table

		UPDATE Staging.Assessment
		SET AssessmentId = a.AssessmentId
		FROM Staging.Assessment sa 
		JOIN ODS.Assessment a ON sa.AssessmentTitle = a.Title
		JOIN ODS.SourceSystemReferenceData osrd_subject 
			ON sa.AssessmentAcademicSubject = osrd_subject.InputCode
			AND osrd_subject.TableName = 'RefAcademicSubject'
			AND osrd_subject.SchoolYear = '2018'
		JOIN ODS.RefAcademicSubject ras ON osrd_subject.OutputCode = ras.Code
		JOIN ODS.SourceSystemReferenceData osrd_purpose
			ON sa.AssessmentPurpose = osrd_purpose.InputCode
			AND osrd_purpose.TableName = 'RefAssessmentPurpose'
			AND osrd_purpose.SchoolYear = '2018'
		JOIN ODS.RefAssessmentPurpose rap ON osrd_purpose.OutputCode = rap.Code
		JOIN ODS.SourceSystemReferenceData osrd_type
			ON sa.AssessmentType = osrd_type.InputCode
			AND osrd_type.TableName = 'RefAssessmentType'
			AND osrd_type.SchoolYear = '2018'
		JOIN ODS.RefAssessmentType rat ON osrd_type.OutputCode = rat.Code
		JOIN ODS.SourceSystemReferenceData osrd_typeCWD
			ON sa.AssessmentTypeAdministeredToChildrenWithDisabilities = osrd_typeCWD.InputCode
			AND osrd_typeCWD.TableName = 'RefAssessmentTypeChildrenWithDisabilities'
			AND osrd_typeCWD.SchoolYear = '2018'
		JOIN ODS.RefAssessmentTypeChildrenWithDisabilities rac ON osrd_typeCWD.OutputCode = rac.Code
		WHERE sa.AssessmentShortName = a.ShortName
		AND a.RefAcademicSubjectId = ras.RefAcademicSubjectId
		AND a.RefAssessmentPurposeId = rap.RefAssessmentPurposeId
		AND a.RefAssessmentTypeId = rat.RefAssessmentTypeId
		AND a.RefAssessmentTypeChildrenWithDisabilitiesId = rac.RefAssessmentTypeChildrenWithDisabilitiesId
		AND sa.AssessmentId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentAdministration----------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentAdministration already exists so that it is not added again

		UPDATE Staging.Assessment
		SET AssessmentAdministrationId = aa.AssessmentAdministrationId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentAdministration aa 
			ON a.AssessmentId = aa.AssessmentAdministrationId
		WHERE aa.StartDate = sa.AssessmentAdministrationStartDate
		AND aa.FinishDate = sa.AssessmentAdministrationFinishDate
		AND sa.AssessmentAdministrationId IS NULL

		--Create the AssessmentAdministration

		INSERT INTO [ODS].[AssessmentAdministration]
           ([AssessmentId]
           ,[Name]
           ,[Code]
           ,[StartDate]
           ,[StartTime]
           ,[FinishDate]
           ,[FinishTime]
           ,[RefAssessmentReportingMethodId]
           ,[AssessmentSecureIndicator]
           ,[AssessmentAdministrationPeriodDescription])
		SELECT DISTINCT
            sa.[AssessmentId]
           ,NULL [Name]
           ,NULL [Code]
           ,sa.AssessmentAdministrationStartDate [StartDate]
           ,NULL [StartTime]
           ,sa.AssessmentAdministrationFinishDate [FinishDate]
           ,NULL [FinishTime]
           ,NULL [RefAssessmentReportingMethodId]
           ,NULL [AssessmentSecureIndicator]
           ,NULL [AssessmentAdministrationPeriodDescription]
		FROM Staging.Assessment sa
		WHERE sa.AssessmentAdministrationId IS NULL
		AND sa.AssessmentId IS NOT NULL

		--Add the AssessmentAdministrationId to the Staging table

		UPDATE Staging.Assessment
		SET AssessmentAdministrationId = aa.AssessmentAdministrationId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentAdministration aa 
			ON a.AssessmentId = aa.AssessmentAdministrationId
		WHERE aa.StartDate = sa.AssessmentAdministrationStartDate
		AND aa.FinishDate = sa.AssessmentAdministrationFinishDate
		AND sa.AssessmentAdministrationId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentForm -------------------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentForm already exists so that it is not added again

		UPDATE Staging.Assessment
		SET AssessmentFormId = af.AssessmentFormId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		WHERE sa.AssessmentFormId IS NULL
		AND af.Name = sa.AssessmentTitle

		--Create the AssessmentForm

		INSERT INTO [ODS].[AssessmentForm]
           ([AssessmentId]
           ,[FormNumber]
           ,[Name]
           ,[Version]
           ,[PublishedDate]
           ,[AccommodationList]
           ,[IntendedAdministrationStartDate]
           ,[IntendedAdministrationEndDate]
           ,[AssessmentItemBankIdentifier]
           ,[AssessmentItemBankName]
           ,[PlatformsSupported]
           ,[RefAssessmentLanguageId]
           ,[AssessmentSecureIndicator]
           ,[LearningResourceId]
           ,[AssessmentFormAdaptiveIndicator]
           ,[AssessmentFormAlgorithmIdentifier]
           ,[AssessmentFormAlgorithmVersion]
           ,[AssessmentFormGUID])
		SELECT DISTINCT
            sa.AssessmentId [AssessmentId]
           ,NULL [FormNumber]
           ,sa.AssessmentTitle [Name]
           ,NULL [Version]
           ,NULL [PublishedDate]
           ,NULL [AccommodationList]
           ,NULL [IntendedAdministrationStartDate]
           ,NULL [IntendedAdministrationEndDate]
           ,NULL [AssessmentItemBankIdentifier]
           ,NULL [AssessmentItemBankName]
           ,NULL [PlatformsSupported]
           ,NULL [RefAssessmentLanguageId]
           ,NULL [AssessmentSecureIndicator]
           ,NULL [LearningResourceId]
           ,NULL [AssessmentFormAdaptiveIndicator]
           ,NULL [AssessmentFormAlgorithmIdentifier]
           ,NULL [AssessmentFormAlgorithmVersion]
           ,NULL [AssessmentFormGUID]
		FROM Staging.Assessment sa
		WHERE sa.AssessmentFormId IS NULL
		AND sa.AssessmentId IS NOT NULL

		--Add the AssessmentFormId to the Staging table

		UPDATE Staging.Assessment
		SET AssessmentFormId = af.AssessmentFormId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		WHERE sa.AssessmentFormId IS NULL
		AND af.Name = sa.AssessmentTitle

		-------------------------------------------------------------------------
		----Create the AssessmentSubtest ----------------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentSubtest already exists so that it is not added again

		UPDATE Staging.Assessment
		SET AssessmentSubtestId = sub.AssessmentSubtestId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		JOIN ODS.AssessmentSubtest sub 
			ON af.AssessmentFormId = sub.AssessmentFormId
		WHERE sa.AssessmentTitle = sub.Title
		AND sa.AssessmentFormId = sub.AssessmentFormId
		AND sa.AssessmentSubtestId IS NULL

		--Create the AssessmentSubtest

		INSERT INTO [ODS].[AssessmentSubtest]
           ([Identifier]
           ,[RefAssessmentSubtestIdentifierTypeId]
           ,[Title]
           ,[Version]
           ,[PublishedDate]
           ,[Abbreviation]
           ,[RefScoreMetricTypeId]
           ,[MinimumValue]
           ,[MaximumValue]
           ,[OptimalValue]
           ,[Tier]
           ,[ContainerOnly]
           ,[RefAssessmentPurposeId]
           ,[Description]
           ,[Rules]
           ,[RefContentStandardTypeId]
           ,[RefAcademicSubjectId]
           ,[ChildOf_AssessmentSubtestId]
           ,[AssessmentFormId])
		SELECT DISTINCT
            NULL [Identifier]
           ,NULL [RefAssessmentSubtestIdentifierTypeId]
           ,sa.AssessmentTitle [Title]
           ,NULL [Version]
           ,NULL [PublishedDate]
           ,NULL [Abbreviation]
           ,NULL [RefScoreMetricTypeId]
           ,NULL [MinimumValue]
           ,NULL [MaximumValue]
           ,NULL [OptimalValue]
           ,NULL [Tier]
           ,NULL [ContainerOnly]
           ,NULL [RefAssessmentPurposeId]
           ,NULL [Description]
           ,NULL [Rules]
           ,NULL [RefContentStandardTypeId]
           ,NULL [RefAcademicSubjectId]
           ,NULL [ChildOf_AssessmentSubtestId]
           ,sa.AssessmentFormId [AssessmentFormId]
		FROM Staging.Assessment sa
		WHERE sa.AssessmentSubtestId IS NULL
		AND sa.AssessmentFormId IS NOT NULL
		
		--Add the AssessmentSubestId to the Staging table

		UPDATE Staging.Assessment
		SET AssessmentSubtestId = sub.AssessmentSubtestId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		JOIN ODS.AssessmentSubtest sub 
			ON af.AssessmentFormId = sub.AssessmentFormId
		WHERE sa.AssessmentTitle = sub.Title
		AND sa.AssessmentFormId = sub.AssessmentFormId
		AND sa.AssessmentSubtestId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentPerformanceLevel--------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentPerformanceLevel already exists so that it is not added again

		UPDATE Staging.Assessment
		SET AssessmentPerformanceLevelId = apl.AssessmentPerformanceLevelId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		JOIN ODS.AssessmentSubtest sub 
			ON af.AssessmentFormId = sub.AssessmentFormId
		JOIN ODS.AssessmentPerformanceLevel apl 
			ON sub.AssessmentSubtestId = apl.AssessmentSubtestId
		JOIN ODS.SourceSystemReferenceData osrd_performance
			ON apl.Label = osrd_performance.InputCode
			AND osrd_performance.TableName = 'AssessmentPerformanceLevel_Identifier'
			AND osrd_performance.SchoolYear = @SchoolYear
		WHERE sa.AssessmentPerformanceLevelId IS NULL
		AND sa.AssessmentPerformanceLevelIdentifier = osrd_performance.InputCode
		AND sa.AssessmentPerformanceLevelLabel = apl.Label

		--Create the AssessmentPerformanceLevels

		INSERT INTO [ODS].[AssessmentPerformanceLevel]
           ([Identifier]
           ,[AssessmentSubtestId]
           ,[ScoreMetric]
           ,[Label]
           ,[LowerCutScore]
           ,[UpperCutScore]
           ,[DescriptiveFeedback])
		SELECT DISTINCT
            osrd_performance.OutputCode [Identifier]
           ,sa.AssessmentSubtestId [AssessmentSubtestId]
           ,NULL [ScoreMetric]
           ,sa.AssessmentPerformanceLevelLabel [Label]
           ,NULL [LowerCutScore]
           ,NULL [UpperCutScore]
           ,NULL [DescriptiveFeedback]
		FROM Staging.Assessment sa
		JOIN ODS.SourceSystemReferenceData osrd_performance
			ON sa.AssessmentPerformanceLevelIdentifier = osrd_performance.InputCode
			AND osrd_performance.TableName = 'AssessmentPerformanceLevel_Identifier'
			AND osrd_performance.SchoolYear = @SchoolYear
		WHERE sa.AssessmentPerformanceLevelId IS NULL
		AND sa.AssessmentSubtestId IS NOT NULL

		--Add the AssessmentPerformanceLevelId to the Staging table

		UPDATE Staging.Assessment
		SET AssessmentPerformanceLevelId = apl.AssessmentPerformanceLevelId
		FROM Staging.Assessment sa
		JOIN ODS.Assessment a 
			ON sa.AssessmentId = a.AssessmentId
		JOIN ODS.AssessmentForm af 
			ON a.AssessmentId = af.AssessmentId
		JOIN ODS.AssessmentSubtest sub 
			ON af.AssessmentFormId = sub.AssessmentFormId
		JOIN ODS.AssessmentPerformanceLevel apl 
			ON sub.AssessmentSubtestId = apl.AssessmentSubtestId
		JOIN ODS.SourceSystemReferenceData osrd_performance
			ON apl.Label = osrd_performance.InputCode
			AND osrd_performance.TableName = 'AssessmentPerformanceLevel_Identifier'
			AND osrd_performance.SchoolYear = @SchoolYear
		WHERE sa.AssessmentPerformanceLevelId IS NULL
		AND sa.AssessmentPerformanceLevelIdentifier = osrd_performance.InputCode
		AND sa.AssessmentPerformanceLevelLabel = apl.Label


		-------------------------------------------------------
		---Associate the PersonId with the staging table ------
		-------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET PersonID = pid.PersonId
		FROM Staging.AssessmentResult sar
		JOIN ODS.PersonIdentifier pid 
			ON sar.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
			AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')

		--------------------------------------------------------------------
		---Associate the School OrganizationId with the staging table ------
		--------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.AssessmentResult sar
		JOIN ODS.OrganizationIdentifier orgid 
			ON sar.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
			AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		----------------------------------------------------------------------------------------------------------------------
		---Associate the OrganizationPersonRoleId related to the AssessmentAdministrationStartDate with the staging table ----
		----------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET OrganizationPersonRoleID_School = opr.OrganizationPersonRoleId
		FROM Staging.AssessmentResult sar
		JOIN ODS.OrganizationPersonRole opr 
			ON sar.PersonID = opr.PersonId
		JOIN Staging.Assessment sa 
			ON sar.AssessmentTitle = sa.AssessmentTitle
			AND sar.AssessmentAcademicSubject = sa.AssessmentAcademicSubject
			AND sar.AssessmentTypeAdministeredToChildrenWithDisabilities = sa.AssessmentTypeAdministeredToChildrenWithDisabilities
			AND sar.AssessmentPurpose = sa.AssessmentPurpose
			AND sar.AssessmentType = sa.AssessmentType
		WHERE sar.OrganizationID_School = opr.OrganizationId
			AND opr.EntryDate <= sa.AssessmentAdministrationStartDate
			AND (opr.ExitDate IS NULL OR opr.ExitDate >= sa.AssessmentAdministrationStartDate)

		--Create an OrganizationPersonRole here where none exists

		----------------------------------------------------------------------
		---Associate the AssessmentId with the staging table -----------------
		----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult 
		SET AssessmentId = sa.AssessmentId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa
			ON ar.AssessmentTitle = sa.AssessmentTitle
			AND ar.AssessmentAcademicSubject = sa.AssessmentAcademicSubject
			AND ar.AssessmentPurpose = sa.AssessmentPurpose
			AND ar.AssessmentType = sa.AssessmentType
			AND ar.AssessmentTypeAdministeredToChildrenWithDisabilities = sa.AssessmentTypeAdministeredToChildrenWithDisabilities
		WHERE ar.AssessmentId IS NULL

		-----------------------------------------------------------------------
		---Associate the AssessmentAdministrationId with the staging table ----
		-----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET AssessmentAdministrationId = sa.AssessmentAdministrationId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa 
			ON ar.AssessmentId = sa.AssessmentId
			AND ar.AssessmentAdministrationStartDate = sa.AssessmentAdministrationStartDate
			AND ar.AssessmentAdministrationFinishDate = sa.AssessmentAdministrationFinishDate
		WHERE ar.AssessmentAdministrationId IS NULL

		-----------------------------------------------------------------------
		---Associate the AssessmentFormId with the staging table --------------
		-----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET AssessmentFormId = sa.AssessmentFormId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa 
			ON ar.AssessmentId = sa.AssessmentId
		WHERE ar.AssessmentFormId IS NULL

		-----------------------------------------------------------------------
		---Associate the AssessmentSubtestId with the staging table -----------
		-----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET AssessmentSubtestId = sa.AssessmentSubtestId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa 
			ON ar.AssessmentId = sa.AssessmentId
			AND ar.AssessmentFormId = sa.AssessmentFormId
		WHERE ar.AssessmentSubtestId IS NULL

		-----------------------------------------------------------------------
		---Associate the AssessmentPerformanceLevelId with the staging table --
		-----------------------------------------------------------------------

		UPDATE Staging.AssessmentResult
		SET AssessmentPerformanceLevelId = sa.AssessmentPerformanceLevelId
		FROM Staging.AssessmentResult ar
		JOIN Staging.Assessment sa 
			ON ar.AssessmentId = sa.AssessmentId
			AND ar.AssessmentFormId = sa.AssessmentFormId
			AND ar.AssessmentSubtestId = sa.AssessmentSubtestId
			AND ar.AssessmentPerformanceLevelIdentifier = sa.AssessmentPerformanceLevelIdentifier
			AND ar.AssessmentPerformanceLevelLabel = sa.AssessmentPerformanceLevelLabel
		WHERE ar.AssessmentPerformanceLevelId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentRegistration -----------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentRegistration already exists so that it is not added again

		UPDATE Staging.AssessmentResult
		SET AssessmentRegistrationId = areg.AssessmentRegistrationId
		FROM Staging.AssessmentResult ar
		JOIN ODS.AssessmentRegistration areg
			ON ar.AssessmentFormId = areg.AssessmentFormId
			AND ar.AssessmentAdministrationId = areg.AssessmentAdministrationId
			AND ar.PersonId = areg.PersonId
			AND ar.OrganizationID_School = areg.SchoolOrganizationId
		WHERE ar.AssessmentRegistrationId IS NULL

		--Create the AssessmentRegistration

		INSERT INTO [ODS].[AssessmentRegistration]
				   ([CreationDate]
				   ,[DaysOfInstructionPriorToAssessment]
				   ,[ScorePublishDate]
				   ,[TestAttemptIdentifier]
				   ,[RetestIndicator]
				   ,[CourseSectionOrganizationId]
				   ,[RefAssessmentParticipationIndicatorId]
				   ,[TestingIndicator]
				   ,[RefAssessmentPurposeId]
				   ,[RefAssessmentReasonNotTestedId]
				   ,[RefAssessmentReasonNotCompletingId]
				   ,[RefGradeLevelToBeAssessedId]
				   ,[RefGradeLevelWhenAssessedId]
				   ,[PersonId]
				   ,[AssessmentFormId]
				   ,[OrganizationId]
				   ,[SchoolOrganizationId]
				   ,[LeaOrganizationId]
				   ,[AssessmentAdministrationId]
				   ,[AssignedByPersonId]
				   ,[AssessmentRegistrationCompletionStatusDateTime]
				   ,[RefAssessmentRegistrationCompletionStatusId]
				   ,[StateFullAcademicYear]
				   ,[LEAFullAcademicYear]
				   ,[SchoolFullAcademicYear])
		SELECT DISTINCT
				    NULL [CreationDate]
				   ,NULL [DaysOfInstructionPriorToAssessment]
				   ,NULL [ScorePublishDate]
				   ,NULL [TestAttemptIdentifier]
				   ,NULL [RetestIndicator]
				   ,NULL [CourseSectionOrganizationId]
				   ,pid.RefAssessmentParticipationIndicatorId [RefAssessmentParticipationIndicatorId]
				   ,NULL [TestingIndicator]
				   ,NULL [RefAssessmentPurposeId]
				   ,NULL [RefAssessmentReasonNotTestedId]
				   ,rarnc.RefAssessmentReasonNotCompletingId [RefAssessmentReasonNotCompletingId]
				   ,NULL [RefGradeLevelToBeAssessedId]
				   ,rgl.RefGradeLevelId [RefGradeLevelWhenAssessedId]
				   ,ar.PersonId [PersonId]
				   ,ar.AssessmentFormId [AssessmentFormId]
				   ,NULL [OrganizationId]
				   ,ar.OrganizationID_School [SchoolOrganizationId]
				   ,NULL [LeaOrganizationId]
				   ,ar.AssessmentAdministrationId [AssessmentAdministrationId]
				   ,NULL [AssignedByPersonId]
				   ,NULL [AssessmentRegistrationCompletionStatusDateTime]
				   ,NULL [RefAssessmentRegistrationCompletionStatusId]
				   ,ar.StateFullAcademicYear [StateFullAcademicYear]
				   ,ar.LEAFullAcademicYear [LEAFullAcademicYear]
				   ,ar.SchoolFullAcademicYear [SchoolFullAcademicYear]
		FROM Staging.AssessmentResult ar
		JOIN ODS.SourceSystemReferenceData osrd_participation
			ON ar.AssessmentRegistrationParticipationIndicator = osrd_participation.InputCode
			AND osrd_participation.TableName = 'RefAssessmentParticipationIndicator'
			AND osrd_participation.SchoolYear = @SchoolYear
		JOIN ODS.RefAssessmentParticipationIndicator pid 
			ON osrd_participation.OutputCode = pid.Code
		JOIN ODS.SourceSystemReferenceData osrd_gradelevel
			ON ar.GradeLevelWhenAssessed = osrd_gradelevel.InputCode
			AND osrd_gradelevel.TableName = 'RefGradeLevel'
			AND osrd_gradelevel.TableFilter = '000126'
			AND osrd_gradelevel.SchoolYear = @SchoolYear
		JOIN ODS.RefGradeLevel rgl 
			ON osrd_gradelevel.OutputCode = rgl.Code
		JOIN ODS.RefGradeLevelType rglt 
			ON osrd_gradelevel.TableFilter = rglt.Code
		LEFT JOIN ODS.SourceSystemReferenceData osrd_reasonnotcompleting
			ON ar.AssessmentRegistrationReasonNotCompleting = osrd_reasonnotcompleting.InputCode
			AND osrd_reasonnotcompleting.TableName = 'RefAssessmentReasonNotCompleting'
			AND osrd_reasonnotcompleting.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefAssessmentReasonNotCompleting rarnc 
			ON osrd_reasonnotcompleting.OutputCode = rarnc.Code
		WHERE ar.AssessmentRegistrationId IS NULL
		AND ar.PersonId IS NOT NULL
		AND ar.AssessmentFormId IS NOT NULL
		AND ar.OrganizationID_School IS NOT NULL
		AND ar.AssessmentAdministrationId IS NOT NULL

		--Add AssessmentRegistrationId to the staging table

		UPDATE Staging.AssessmentResult
		SET AssessmentRegistrationId = areg.AssessmentRegistrationId
		FROM Staging.AssessmentResult ar
		JOIN ODS.AssessmentRegistration areg
			ON ar.AssessmentFormId = areg.AssessmentFormId
			AND ar.AssessmentAdministrationId = areg.AssessmentAdministrationId
			AND ar.PersonId = areg.PersonId
			AND ar.OrganizationID_School = areg.SchoolOrganizationId
		WHERE ar.AssessmentRegistrationId IS NULL


		-------------------------------------------------------------------------
		----Create the AssessmentResult -----------------------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentResult already exists so that it is not added again

		UPDATE Staging.AssessmentResult
		SET AssessmentResultId = ares.AssessmentResultId
		FROM Staging.AssessmentResult sa
		JOIN ODS.AssessmentResult ares 
			ON sa.AssessmentRegistrationId = ares.AssessmentRegistrationId
			AND sa.AssessmentSubtestId = ares.AssessmentSubtestId
		WHERE sa.AssessmentResultId IS NULL


		--Create the AssessmentResult

		INSERT INTO [ODS].[AssessmentResult]
				   ([ScoreValue]
				   ,[RefScoreMetricTypeId]
				   ,[PreliminaryIndicator]
				   ,[RefAssessmentPretestOutcomeId]
				   ,[NumberOfResponses]
				   ,[DiagnosticStatement]
				   ,[DiagnosticStatementSource]
				   ,[DescriptiveFeedback]
				   ,[DescriptiveFeedbackSource]
				   ,[InstructionalRecommendation]
				   ,[IncludedInAypCalculation]
				   ,[DateUpdated]
				   ,[DateCreated]
				   ,[AssessmentSubtestId]
				   ,[AssessmentRegistrationId]
				   ,[RefELOutcomeMeasurementLevelId]
				   ,[RefOutcomeTimePointId]
				   ,[AssessmentResultDescriptiveFeedbackDateTime]
				   ,[AssessmentResultScoreStandardError]
				   ,[RefAssessmentResultDataTypeId]
				   ,[RefAssessmentResultScoreTypeId])
		SELECT DISTINCT
				    NULL [ScoreValue]
				   ,NULL [RefScoreMetricTypeId]
				   ,NULL [PreliminaryIndicator]
				   ,NULL [RefAssessmentPretestOutcomeId]
				   ,NULL [NumberOfResponses]
				   ,NULL [DiagnosticStatement]
				   ,NULL [DiagnosticStatementSource]
				   ,NULL [DescriptiveFeedback]
				   ,NULL [DescriptiveFeedbackSource]
				   ,NULL [InstructionalRecommendation]
				   ,NULL [IncludedInAypCalculation]
				   ,NULL [DateUpdated]
				   ,NULL [DateCreated]
				   ,sa.AssessmentSubtestId [AssessmentSubtestId]
				   ,sa.AssessmentRegistrationId [AssessmentRegistrationId]
				   ,NULL [RefELOutcomeMeasurementLevelId]
				   ,NULL [RefOutcomeTimePointId]
				   ,NULL [AssessmentResultDescriptiveFeedbackDateTime]
				   ,NULL [AssessmentResultScoreStandardError]
				   ,NULL [RefAssessmentResultDataTypeId]
				   ,NULL [RefAssessmentResultScoreTypeId]
		FROM Staging.AssessmentResult sa
		WHERE AssessmentResultId IS NULL
		AND sa.AssessmentSubtestId IS NOT NULL
		AND sa.AssessmentRegistrationId IS NOT NULL

		--Add AssessmentResultId to the staging table

		UPDATE Staging.AssessmentResult
		SET AssessmentResultId = ares.AssessmentResultId
		FROM Staging.AssessmentResult sa
		JOIN ODS.AssessmentResult ares 
			ON sa.AssessmentRegistrationId = ares.AssessmentRegistrationId
			AND sa.AssessmentSubtestId = ares.AssessmentSubtestId
		WHERE sa.AssessmentResultId IS NULL

		-------------------------------------------------------------------------
		----Create the AssessmentResult_PerformanceLevel ------------------------
		-------------------------------------------------------------------------

		--Determine if the AssessmentResult already exists so that it is not added again

		UPDATE Staging.AssessmentResult
		SET AssessmentResult_PerformanceLevelId = arpl.AssessmentResult_PerformanceLevelId
		FROM Staging.AssessmentResult sa
		JOIN ODS.AssessmentResult_PerformanceLevel arpl
			ON sa.AssessmentResultId = arpl.AssessmentResultId
			AND sa.AssessmentPerformanceLevelId = arpl.AssessmentPerformanceLevelId
		WHERE sa.AssessmentResult_PerformanceLevelId IS NULL

		--Create the AssessmentResult_PerformanceLevel

		INSERT INTO [ODS].[AssessmentResult_PerformanceLevel]
				   ([AssessmentResultId]
				   ,[AssessmentPerformanceLevelId])
		SELECT DISTINCT
				    sa.AssessmentResultId [AssessmentResultId]
				   ,sa.AssessmentPerformanceLevelId [AssessmentPerformanceLevelId] 
		FROM Staging.AssessmentResult sa
		WHERE AssessmentResult_PerformanceLevelId IS NULL
		AND sa.AssessmentResultId IS NOT NULL
		AND sa.AssessmentPerformanceLevelId IS NOT NULL


		--Add AssessmentResult_PerformanceLevelId to the staging table

		UPDATE Staging.AssessmentResult
		SET AssessmentResult_PerformanceLevelId = arpl.AssessmentResult_PerformanceLevelId
		FROM Staging.AssessmentResult sa
		JOIN ODS.AssessmentResult_PerformanceLevel arpl
			ON sa.AssessmentResultId = arpl.AssessmentResultId
			AND sa.AssessmentPerformanceLevelId = arpl.AssessmentPerformanceLevelId
		WHERE sa.AssessmentResult_PerformanceLevelId IS NULL





			set nocount off;


	END TRY
	BEGIN CATCH

		declare @msg as nvarchar(max)
		set @msg = ERROR_MESSAGE()

		declare @sev as int
		set @sev = ERROR_SEVERITY()

		RAISERROR(@msg, @sev, 1)

	END CATCH; 

END




----Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  7/9/2018

		Purpose:
			The purpose of this ETL is to load the data for end of year Statuses for Persons

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;


		---Need to consider what to do when/if the dates are not populated for the status - do we default those.  Those are built into the queries below looking for matches
		--If assessments, we could pull from the assessment administration start date.  Otherwise, they will need to fill those dates in for appropriate reporting.

		-------------------------------------------------------
		---Default start and end dates if not provided --------
		-------------------------------------------------------

		UPDATE Staging.PersonStatus SET EconomicDisadvantage_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), EconomicDisadvantage_StatusEndDate = NULL WHERE EconomicDisadvantage_StatusStartDate IS NULL AND EconomicDisadvantageStatus IS NOT NULL
		UPDATE Staging.PersonStatus SET FosterCare_ProgramParticipationStartDate = App.GetFiscalYearStartDate(@SchoolYear), FosterCare_ProgramParticipationEndDate = NULL WHERE FosterCare_ProgramParticipationStartDate IS NULL AND ProgramType_FosterCare IS NOT NULL
		UPDATE Staging.PersonStatus SET Homelessness_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), Homelessness_StatusEndDate = NULL WHERE Homelessness_StatusStartDate IS NULL AND HomelessnessStatus IS NOT NULL
		UPDATE Staging.PersonStatus SET Migrant_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), Migrant_StatusEndDate = NULL WHERE Migrant_StatusStartDate IS NULL AND MigrantStatus IS NOT NULL
		UPDATE Staging.PersonStatus SET EnglishLearner_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), EnglishLearner_StatusEndDate = NULL WHERE EnglishLearner_StatusStartDate IS NULL AND EnglishLearnerStatus IS NOT NULL
		UPDATE Staging.PersonStatus SET IDEA_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), IDEA_StatusEndDate = NULL WHERE IDEA_StatusStartDate IS NULL AND IDEAIndicator IS NOT NULL
		UPDATE Staging.PersonStatus SET MilitaryConnected_StatusStartDate = App.GetFiscalYearStartDate(@SchoolYear), MilitaryConnected_StatusEndDate = NULL WHERE MilitaryConnected_StatusStartDate IS NULL AND MilitaryConnectedStudentIndicator IS NOT NULL
		
		-------------------------------------------------------
		---Associate the PersonId with the temporary table ----
		-------------------------------------------------------

		UPDATE Staging.PersonStatus
		SET PersonID = pid.PersonId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonIdentifier pid 
			ON ps.Student_Identifier_State = pid.Identifier
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
			AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')

		--------------------------------------------------------------------
		---Associate the School OrganizationId with the temporary table ----
		--------------------------------------------------------------------

		UPDATE Staging.PersonStatus
		SET OrganizationID_School = orgid.OrganizationId
		FROM Staging.PersonStatus ps
		JOIN ODS.OrganizationIdentifier orgid 
			ON ps.School_Identifier_State = orgid.Identifier
		WHERE orgid.RefOrganizationIdentifierTypeId = App.GetOrganizationIdentifierTypeId('001073')
			AND orgid.RefOrganizationIdentificationSystemId = App.GetOrganizationIdentifierSystemId('SEA', '001073')

		----------------------------------------------------------------------------
		---Associate the Foster Program OrganizationId with the temporary table ----
		----------------------------------------------------------------------------

		UPDATE Staging.PersonStatus
		SET OrganizationID_Program_Foster = orgr.OrganizationId
		FROM Staging.PersonStatus ps
		JOIN ODS.OrganizationRelationship orgr ON ps.OrganizationID_School = orgr.Parent_OrganizationId
		JOIN ODS.OrganizationProgramType orgpt ON orgr.OrganizationId = orgpt.OrganizationId
		WHERE orgpt.RefProgramTypeId = App.GetProgramTypeId('75000')

		-----------------------------------------------------
		----PersonStatus EconomicDisadvantage ---------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- EconomicDisadvantage exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_EconomicDisadvantage = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.EconomicDisadvantage_StatusStartDate
			AND pers.StatusEndDate = ps.EconomicDisadvantage_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'EconomicDisadvantage')
		WHERE ps.PersonStatusId_EconomicDisadvantage IS NULL	

		----Create PersonStatus -- EconomicDisadvantage

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'EconomicDisadvantage') [RefPersonStatusTypeId]
				   ,ps.EconomicDisadvantageStatus [StatusValue]
				   ,ps.EconomicDisadvantage_StatusStartDate [StatusStartDate]
				   ,ps.EconomicDisadvantage_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_EconomicDisadvantage IS NULL
		AND ps.EconomicDisadvantageStatus IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- EconomicDisadvantage ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_EconomicDisadvantage = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.EconomicDisadvantage_StatusStartDate
			AND pers.StatusEndDate = ps.EconomicDisadvantage_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'EconomicDisadvantage')
		WHERE ps.PersonStatusId_EconomicDisadvantage IS NULL	



		-----------------------------------------------------
		----PersonStatus Homeless -------------------------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- Homeless exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_Homeless = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.Homelessness_StatusStartDate
			AND pers.StatusEndDate = ps.Homelessness_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'HomelessUnaccompaniedYouth')
		WHERE ps.PersonStatusId_Homeless IS NULL	

		----Create PersonStatus -- Homeless

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'HomelessUnaccompaniedYouth') [RefPersonStatusTypeId]
				   ,ps.HomelessnessStatus [StatusValue]
				   ,ps.Homelessness_StatusStartDate [StatusStartDate]
				   ,ps.Homelessness_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_Homeless IS NULL
		AND ps.HomelessnessStatus IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- Homeless ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_Homeless = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.Homelessness_StatusStartDate
			AND pers.StatusEndDate = ps.Homelessness_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'HomelessUnaccompaniedYouth')
		WHERE ps.PersonStatusId_Homeless IS NULL	

		-----------------------------------------------------
		----PersonStatus Migrant -------------------------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- Migrant exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_Migrant = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.Migrant_StatusStartDate
			AND pers.StatusEndDate = ps.Migrant_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'Migrant')
		WHERE ps.PersonStatusId_Migrant IS NULL	

		----Create PersonStatus -- Migrant

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'Migrant') [RefPersonStatusTypeId]
				   ,ps.MigrantStatus [StatusValue]
				   ,ps.Migrant_StatusStartDate [StatusStartDate]
				   ,ps.Migrant_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_Migrant IS NULL
		AND ps.MigrantStatus IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- Migrant ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_Migrant = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.Migrant_StatusStartDate
			AND pers.StatusEndDate = ps.Migrant_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'Migrant')
		WHERE ps.PersonStatusId_Migrant IS NULL	

		-----------------------------------------------------
		----PersonStatus EnglishLearnerStatus -------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- EnglishLearnerStatus exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_EnglishLearner = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.EnglishLearner_StatusStartDate
			AND pers.StatusEndDate = ps.EnglishLearner_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'LEP')
		WHERE ps.PersonStatusId_EnglishLearner IS NULL	

		----Create PersonStatus -- EnglishLearnerStatus

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'LEP') [RefPersonStatusTypeId]
				   ,ps.EnglishLearnerStatus [StatusValue]
				   ,ps.EnglishLearner_StatusStartDate [StatusStartDate]
				   ,ps.EnglishLearner_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_EnglishLearner IS NULL
		AND ps.EnglishLearnerStatus IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- EnglishLearnerStatus ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_EnglishLearner = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.EnglishLearner_StatusStartDate
			AND pers.StatusEndDate = ps.EnglishLearner_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'LEP')
		WHERE ps.PersonStatusId_EnglishLearner IS NULL	


		-----------------------------------------------------
		----PersonStatus IDEA -------------------------------
		-----------------------------------------------------

		----First check to see if PersonStatusId -- IDEA exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET PersonStatusId_IDEA = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.IDEA_StatusStartDate
			AND pers.StatusEndDate = ps.IDEA_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'IDEA')
		WHERE ps.PersonStatusId_IDEA IS NULL	

		----Create PersonStatus -- IDEA

		INSERT INTO [ODS].[PersonStatus]
				   ([PersonId]
				   ,[RefPersonStatusTypeId]
				   ,[StatusValue]
				   ,[StatusStartDate]
				   ,[StatusEndDate])
		SELECT DISTINCT
				    ps.PersonId [PersonId]
				   ,(SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'IDEA') [RefPersonStatusTypeId]
				   ,ps.IDEAIndicator [StatusValue]
				   ,ps.IDEA_StatusStartDate [StatusStartDate]
				   ,ps.IDEA_StatusEndDate [StatusEndDate]
		FROM Staging.PersonStatus ps
		WHERE ps.PersonStatusId_IDEA IS NULL
		AND ps.IDEAIndicator IS NOT NULL
		AND ps.PersonId IS NOT NULL

		----Update the Staging table with the PersonStatus -- IDEA ID

		UPDATE Staging.PersonStatus
		SET PersonStatusId_IDEA = pers.PersonStatusId
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonStatus pers 
			ON ps.PersonId = pers.PersonId
			AND pers.StatusStartDate = ps.IDEA_StatusStartDate
			AND pers.StatusEndDate = ps.IDEA_StatusEndDate
			AND pers.RefPersonStatusTypeId = (SELECT RefPersonStatusTypeId FROM ODS.RefPersonStatusType WHERE Code = 'IDEA')
		WHERE ps.PersonStatusId_IDEA IS NULL	


		-----------------------------------------------------
		----Military Connected Studennt ---------------------
		-----------------------------------------------------

		--First check to see if PersonMilitary exists so that it is not created again

		--Generate needs and update to include PersonMilitaryId, when this is complete, remove the other code and uncomment this code

		--UPDATE Staging.PersonStatus
		--SET PersonMilitaryId = pm.PersonMilitaryId
		--FROM Staging.PersonStatus ps
		--JOIN ODS.PersonMilitary pm 
			--ON ps.PersonId = pm.PersonId
		--JOIN ODS.SourceSystemReferenceData military 
			--ON ps.MilitaryConnectedStudentIndicator = military.InputCode
		--	AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
		--	AND military.SchoolYear = @SchoolYear
		--WHERE pm.RecordStartDateTime <= ps.MilitaryConnected_StatusStartDate
		--AND (pm.RecordEndDateTime IS NULL OR pm.RecordEndDateTime >= ps.MilitaryConnected_StatusStartDate)
		--AND ps.PersonMilitaryId IS NULL

		UPDATE Staging.PersonStatus
		SET PersonMilitaryId = '0'
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonMilitary pm 
			ON ps.PersonId = pm.PersonId
		JOIN ODS.SourceSystemReferenceData military 
			ON ps.MilitaryConnectedStudentIndicator = military.InputCode
			AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
			AND military.SchoolYear = @SchoolYear
		WHERE ps.PersonMilitaryId IS NULL

		--Create PersonMilitary

		INSERT INTO [ODS].[PersonMilitary]
           ([PersonId]
           ,[RefMilitaryActiveStudentIndicatorId]
           ,[RefMilitaryConnectedStudentIndicatorId]
           ,[RefMilitaryVeteranStudentIndicatorId]
           ,[RefMilitaryBranchId])
		SELECT DISTINCT
            ps.PersonId [PersonId]
           ,NULL [RefMilitaryActiveStudentIndicatorId]
           ,mcsi.RefMilitaryConnectedStudentIndicatorId [RefMilitaryConnectedStudentIndicatorId]
           ,NULL [RefMilitaryVeteranStudentIndicatorId]
           ,NULL [RefMilitaryBranchId]
		   --,ps.MilitaryConnected_StatusStartDate [RecordStartDateTime] -- uncomment when elements added to Generate
		   --,ps.MilitaryConnected_StatusEndDate [RecordEndDateTime] -- uncomment when elements added to Generate
		FROM Staging.PersonStatus ps
		JOIN ODS.SourceSystemReferenceData military
			ON ps.MilitaryConnectedStudentIndicator = military.InputCode
			AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
			AND military.SchoolYear = @SchoolYear
		JOIN ODS.RefMilitaryConnectedStudentIndicator mcsi 
			ON military.OutputCode = mcsi.Code
		WHERE ps.PersonMilitaryId IS NULL
		AND ps.MilitaryConnectedStudentIndicator IS NOT NULL
		AND ps.PersonId IS NOT NULL

		--Update the Staging table with the PersonMilitaryId

		--Generate needs and update to include PersonMilitaryId, when this is complete, remove the other code and uncomment this code

		--UPDATE Staging.PersonStatus
		--SET PersonMilitaryId = pm.PersonMilitaryId
		--FROM Staging.PersonStatus ps
		--JOIN ODS.PersonMilitary pm 
			--ON ps.PersonId = pm.PersonId
		--JOIN ODS.SourceSystemReferenceData military 
			--ON ps.MilitaryConnectedStudentIndicator = military.InputCode
		--	AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
		--	AND military.SchoolYear = @SchoolYear
		--WHERE pm.RecordStartDateTime <= ps.MilitaryConnected_StatusStartDate
		--AND (pm.RecordEndDateTime IS NULL OR pm.RecordEndDateTime >= ps.MilitaryConnected_StatusStartDate)
		--AND ps.PersonMilitaryId IS NULL

		UPDATE Staging.PersonStatus
		SET PersonMilitaryId = '0'
		FROM Staging.PersonStatus ps
		JOIN ODS.PersonMilitary pm 
			ON ps.PersonId = pm.PersonId
		JOIN ODS.SourceSystemReferenceData military 
			ON ps.MilitaryConnectedStudentIndicator = military.InputCode
			AND military.TableName = 'RefMilitaryConnectedStudentIndicator'
			AND military.SchoolYear = @SchoolYear
		WHERE ps.PersonMilitaryId IS NULL

		-----------------------------------------------------
		----Foster Care Program Participation----------------
		-----------------------------------------------------
		
		--First check to see if foster care program exists so that it is not created again

		UPDATE Staging.PersonStatus
		SET OrganizationPersonRoleID_Program_Foster = ps.OrganizationPersonRoleID_Program_Foster
		FROM Staging.PersonStatus ps
		JOIN ODS.OrganizationPersonRole opr 
			ON ps.PersonId = opr.PersonId
			AND ps.OrganizationID_Program_Foster = opr.OrganizationId
		WHERE opr.EntryDate <= ps.FosterCare_ProgramParticipationStartDate
		AND (opr.ExitDate IS NULL OR opr.ExitDate >= ps.FosterCare_ProgramParticipationStartDate)
		AND ps.OrganizationPersonRoleID_Program_Foster IS NULL
		
		--Create Foster Care Program

		INSERT INTO [ODS].[OrganizationPersonRole]
           ([OrganizationId]
           ,[PersonId]
           ,[RoleId]
           ,[EntryDate]
           ,[ExitDate])
		SELECT DISTINCT
            ps.OrganizationID_Program_Foster [OrganizationId]
           ,ps.PersonId [PersonId]
           ,App.GetRoleId('K12 Student') [RoleId]
           ,ps.FosterCare_ProgramParticipationStartDate [EntryDate]
           ,ps.FosterCare_ProgramParticipationEndDate [ExitDate] 
		FROM Staging.PersonStatus ps
		WHERE ps.OrganizationPersonRoleID_Program_Foster IS NULL
		AND ps.ProgramType_FosterCare IS NOT NULL
		AND ps.PersonId IS NOT NULL

		--Update staging table to include foster care
		
		UPDATE Staging.PersonStatus
		SET OrganizationPersonRoleID_Program_Foster = ps.OrganizationPersonRoleID_Program_Foster
		FROM Staging.PersonStatus ps
		JOIN ODS.OrganizationPersonRole opr 
			ON ps.PersonId = opr.PersonId
			AND ps.OrganizationID_Program_Foster = opr.OrganizationId
		WHERE opr.EntryDate <= ps.FosterCare_ProgramParticipationStartDate
		AND (opr.ExitDate IS NULL OR opr.ExitDate >= ps.FosterCare_ProgramParticipationStartDate)
		AND ps.OrganizationPersonRoleID_Program_Foster IS NULL



			set nocount off;

	
	END TRY
	BEGIN CATCH



	END CATCH; 

END





-------------------------------------------------------------------------------------------------
----Set up the App.DataMigratonTasks to include the newly installed Stored Procedures
-------------------------------------------------------------------------------------------------


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
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode] ''2018''', '17')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment] ''2018''', '18')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode] ''2018''', '19')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments] ''2018''', '20')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode] ''2018''', '21')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus] ''2018''', '22')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode] ''2018''', '23')



---------------------------------------------------------------
----Temporarily Turn Off Generate Beta Custom Reports----------
---------------------------------------------------------------

	UPDATE App.DataMigrationTasks
	SET IsActive = 0
		WHERE StoredProcedureName IN
		(
		'rds.Empty_RDS ''childcount'''
		,'rds.Migrate_StudentCounts ''childcount'', 0'
		,'rds.Empty_RDS ''specedexit'''
		,'rds.Migrate_StudentCounts ''specedexit'', 0'
		,'rds.Empty_RDS ''cte'''
		,'rds.Migrate_StudentCounts ''cte'', 0'
		)




