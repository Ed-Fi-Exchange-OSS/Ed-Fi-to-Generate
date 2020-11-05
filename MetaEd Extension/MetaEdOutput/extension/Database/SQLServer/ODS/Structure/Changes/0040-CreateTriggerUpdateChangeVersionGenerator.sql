-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TRIGGER [extension].[extension_CedsLocalEducationAgency_TR_UpdateChangeVersion] ON [extension].[CedsLocalEducationAgency] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsLocalEducationAgency]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsLocalEducationAgency] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsSchool_TR_UpdateChangeVersion] ON [extension].[CedsSchool] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsSchool]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsSchool] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsSchoolAccountability_TR_UpdateChangeVersion] ON [extension].[CedsSchoolAccountability] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsSchoolAccountability]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsSchoolAccountability] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsSchoolComprehensiveAndTargetedSupport_TR_UpdateChangeVersion] ON [extension].[CedsSchoolComprehensiveAndTargetedSupport] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsSchoolComprehensiveAndTargetedSupport]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsSchoolComprehensiveAndTargetedSupport] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsSchoolCustomIndicatorStatusType_TR_UpdateChangeVersion] ON [extension].[CedsSchoolCustomIndicatorStatusType] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsSchoolCustomIndicatorStatusType]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsSchoolCustomIndicatorStatusType] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsSchoolIndicatorStatus_TR_UpdateChangeVersion] ON [extension].[CedsSchoolIndicatorStatus] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsSchoolIndicatorStatus]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsSchoolIndicatorStatus] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsSchoolStatus_TR_UpdateChangeVersion] ON [extension].[CedsSchoolStatus] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsSchoolStatus]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsSchoolStatus] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsSpecialEducationStaffCategory_TR_UpdateChangeVersion] ON [extension].[CedsSpecialEducationStaffCategory] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsSpecialEducationStaffCategory]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsSpecialEducationStaffCategory] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsStudentAssessment_TR_UpdateChangeVersion] ON [extension].[CedsStudentAssessment] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsStudentAssessment]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsStudentAssessment] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsStudentCTEProgramAssociation_TR_UpdateChangeVersion] ON [extension].[CedsStudentCTEProgramAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsStudentCTEProgramAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsStudentCTEProgramAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsStudentHomelessProgramAssociation_TR_UpdateChangeVersion] ON [extension].[CedsStudentHomelessProgramAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsStudentHomelessProgramAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsStudentHomelessProgramAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CedsStudentNoDProgramAssociation_TR_UpdateChangeVersion] ON [extension].[CedsStudentNoDProgramAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CedsStudentNoDProgramAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CedsStudentNoDProgramAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CharterContract_TR_UpdateChangeVersion] ON [extension].[CharterContract] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CharterContract]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CharterContract] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_CharterSchoolApprovalAgency_TR_UpdateChangeVersion] ON [extension].[CharterSchoolApprovalAgency] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[CharterSchoolApprovalAgency]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[CharterSchoolApprovalAgency] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_DisciplineActionDiscipline_TR_UpdateChangeVersion] ON [extension].[DisciplineActionDiscipline] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[DisciplineActionDiscipline]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[DisciplineActionDiscipline] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_SchoolFederalFunds_TR_UpdateChangeVersion] ON [extension].[SchoolFederalFunds] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[SchoolFederalFunds]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[SchoolFederalFunds] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_StateDefinedCustomIndicator_TR_UpdateChangeVersion] ON [extension].[StateDefinedCustomIndicator] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[StateDefinedCustomIndicator]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[StateDefinedCustomIndicator] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [extension].[extension_StateDefinedIndicator_TR_UpdateChangeVersion] ON [extension].[StateDefinedIndicator] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [extension].[StateDefinedIndicator]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [extension].[StateDefinedIndicator] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

