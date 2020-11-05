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
