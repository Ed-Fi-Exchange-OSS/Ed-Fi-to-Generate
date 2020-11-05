-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


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
