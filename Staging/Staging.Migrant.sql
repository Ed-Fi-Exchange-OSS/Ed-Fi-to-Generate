USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


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
