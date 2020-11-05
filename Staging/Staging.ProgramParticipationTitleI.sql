-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON



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
