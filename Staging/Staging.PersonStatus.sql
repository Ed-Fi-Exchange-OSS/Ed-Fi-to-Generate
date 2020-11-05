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