CREATE TRIGGER [extension].[extension_BehaviorTypeDescriptor_TR_DeleteTracking] ON [extension].[BehaviorTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_BehaviorTypeDescriptor_TrackedDelete](BehaviorTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.BehaviorTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BehaviorTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[BehaviorTypeDescriptor] ENABLE TRIGGER [extension_BehaviorTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsLocalEducationAgency_TR_DeleteTracking] ON [extension].[CedsLocalEducationAgency] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsLocalEducationAgency_TrackedDelete](CedsLocalEducationAgencyId, Id, ChangeVersion)
    SELECT  CedsLocalEducationAgencyId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsLocalEducationAgency] ENABLE TRIGGER [extension_CedsLocalEducationAgency_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsSchoolAccountability_TR_DeleteTracking] ON [extension].[CedsSchoolAccountability] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsSchoolAccountability_TrackedDelete](SchoolId, Id, ChangeVersion)
    SELECT  SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsSchoolAccountability] ENABLE TRIGGER [extension_CedsSchoolAccountability_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsSchoolComprehensiveAndTargetedSupport_TR_DeleteTracking] ON [extension].[CedsSchoolComprehensiveAndTargetedSupport] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsSchoolComprehensiveAndTargetedSupport_TrackedDelete](SchoolId, Id, ChangeVersion)
    SELECT  SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsSchoolComprehensiveAndTargetedSupport] ENABLE TRIGGER [extension_CedsSchoolComprehensiveAndTargetedSupport_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsSchoolCustomIndicatorStatusType_TR_DeleteTracking] ON [extension].[CedsSchoolCustomIndicatorStatusType] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsSchoolCustomIndicatorStatusType_TrackedDelete](IndicatorStatusDescriptorId, IndicatorStatusSubgroupDescriptorId, IndicatorStatusSubgroupTypeDescriptorId, IndicatorStatusTypeDescriptorId, SchoolId, StatedDefinedCustomIndicatorStatusType, StatedDefinedIndicatorStatus, Id, ChangeVersion)
    SELECT  IndicatorStatusDescriptorId, IndicatorStatusSubgroupDescriptorId, IndicatorStatusSubgroupTypeDescriptorId, IndicatorStatusTypeDescriptorId, SchoolId, StatedDefinedCustomIndicatorStatusType, StatedDefinedIndicatorStatus, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsSchoolCustomIndicatorStatusType] ENABLE TRIGGER [extension_CedsSchoolCustomIndicatorStatusType_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsSchoolIndicatorStatus_TR_DeleteTracking] ON [extension].[CedsSchoolIndicatorStatus] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsSchoolIndicatorStatus_TrackedDelete](IndicatorStatusDescriptorId, IndicatorStatusSubgroupDescriptorId, IndicatorStatusSubgroupTypeDescriptorId, IndicatorStatusTypeDescriptorId, SchoolId, Id, ChangeVersion)
    SELECT  IndicatorStatusDescriptorId, IndicatorStatusSubgroupDescriptorId, IndicatorStatusSubgroupTypeDescriptorId, IndicatorStatusTypeDescriptorId, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsSchoolIndicatorStatus] ENABLE TRIGGER [extension_CedsSchoolIndicatorStatus_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsSchoolStatus_TR_DeleteTracking] ON [extension].[CedsSchoolStatus] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsSchoolStatus_TrackedDelete](SchoolId, Id, ChangeVersion)
    SELECT  SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsSchoolStatus] ENABLE TRIGGER [extension_CedsSchoolStatus_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsSchool_TR_DeleteTracking] ON [extension].[CedsSchool] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsSchool_TrackedDelete](CedsSchoolId, Id, ChangeVersion)
    SELECT  CedsSchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsSchool] ENABLE TRIGGER [extension_CedsSchool_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsSpecialEducationStaffCategory_TR_DeleteTracking] ON [extension].[CedsSpecialEducationStaffCategory] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsSpecialEducationStaffCategory_TrackedDelete](SchoolId, StaffUSI, Id, ChangeVersion)
    SELECT  SchoolId, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsSpecialEducationStaffCategory] ENABLE TRIGGER [extension_CedsSpecialEducationStaffCategory_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsStudentAssessment_TR_DeleteTracking] ON [extension].[CedsStudentAssessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsStudentAssessment_TrackedDelete](AcademicSubjectDescriptorId, AdministrationDate, AssessedGradeLevelDescriptorId, CedsAssessmentTitle, CedsAssessmentVersion, StudentUSI, Id, ChangeVersion)
    SELECT  AcademicSubjectDescriptorId, AdministrationDate, AssessedGradeLevelDescriptorId, CedsAssessmentTitle, CedsAssessmentVersion, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsStudentAssessment] ENABLE TRIGGER [extension_CedsStudentAssessment_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsStudentCTEProgramAssociation_TR_DeleteTracking] ON [extension].[CedsStudentCTEProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsStudentCTEProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsStudentCTEProgramAssociation] ENABLE TRIGGER [extension_CedsStudentCTEProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsStudentHomelessProgramAssociation_TR_DeleteTracking] ON [extension].[CedsStudentHomelessProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsStudentHomelessProgramAssociation_TrackedDelete](BeginDate, CedsProgramName, EducationOrganizationId, ProgramEducationOrganizationId, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, CedsProgramName, EducationOrganizationId, ProgramEducationOrganizationId, ProgramTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsStudentHomelessProgramAssociation] ENABLE TRIGGER [extension_CedsStudentHomelessProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsStudentMigrantEducationProgramAssociation_TR_DeleteTracking] ON [extension].[CedsStudentMigrantEducationProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsStudentMigrantEducationProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [extension].[CedsStudentMigrantEducationProgramAssociation] ENABLE TRIGGER [extension_CedsStudentMigrantEducationProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CedsStudentNoDProgramAssociation_TR_DeleteTracking] ON [extension].[CedsStudentNoDProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CedsStudentNoDProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CedsStudentNoDProgramAssociation] ENABLE TRIGGER [extension_CedsStudentNoDProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CharterContract_TR_DeleteTracking] ON [extension].[CharterContract] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CharterContract_TrackedDelete](ContractIdentifier, Id, ChangeVersion)
    SELECT  ContractIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CharterContract] ENABLE TRIGGER [extension_CharterContract_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CharterSchoolApprovalAgency_TR_DeleteTracking] ON [extension].[CharterSchoolApprovalAgency] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CharterSchoolApprovalAgency_TrackedDelete](CharterSchoolApprovalAgencyId, Id, ChangeVersion)
    SELECT  CharterSchoolApprovalAgencyId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[CharterSchoolApprovalAgency] ENABLE TRIGGER [extension_CharterSchoolApprovalAgency_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_CharterSchoolManagementOrganizationTypeDescriptor_TR_DeleteTracking] ON [extension].[CharterSchoolManagementOrganizationTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_CharterSchoolManagementOrganizationTypeDescriptor_TrackedDelete](CharterSchoolManagementOrganizationTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CharterSchoolManagementOrganizationTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CharterSchoolManagementOrganizationTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[CharterSchoolManagementOrganizationTypeDescriptor] ENABLE TRIGGER [extension_CharterSchoolManagementOrganizationTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_ComprehensiveAndTargetedSupportDescriptor_TR_DeleteTracking] ON [extension].[ComprehensiveAndTargetedSupportDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_ComprehensiveAndTargetedSupportDescriptor_TrackedDelete](ComprehensiveAndTargetedSupportDescriptorId, Id, ChangeVersion)
    SELECT  d.ComprehensiveAndTargetedSupportDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ComprehensiveAndTargetedSupportDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[ComprehensiveAndTargetedSupportDescriptor] ENABLE TRIGGER [extension_ComprehensiveAndTargetedSupportDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_ComprehensiveSupportDescriptor_TR_DeleteTracking] ON [extension].[ComprehensiveSupportDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_ComprehensiveSupportDescriptor_TrackedDelete](ComprehensiveSupportDescriptorId, Id, ChangeVersion)
    SELECT  d.ComprehensiveSupportDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ComprehensiveSupportDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[ComprehensiveSupportDescriptor] ENABLE TRIGGER [extension_ComprehensiveSupportDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_DisciplineActionDiscipline_TR_DeleteTracking] ON [extension].[DisciplineActionDiscipline] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_DisciplineActionDiscipline_TrackedDelete](CedsDisciplineActionIdentifier, DisciplineDate, DisciplineDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  CedsDisciplineActionIdentifier, DisciplineDate, DisciplineDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[DisciplineActionDiscipline] ENABLE TRIGGER [extension_DisciplineActionDiscipline_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_DisciplineMethodFirearmDescriptor_TR_DeleteTracking] ON [extension].[DisciplineMethodFirearmDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_DisciplineMethodFirearmDescriptor_TrackedDelete](DisciplineMethodFirearmDescriptorId, Id, ChangeVersion)
    SELECT  d.DisciplineMethodFirearmDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisciplineMethodFirearmDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[DisciplineMethodFirearmDescriptor] ENABLE TRIGGER [extension_DisciplineMethodFirearmDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_DisciplineTypeDescriptor_TR_DeleteTracking] ON [extension].[DisciplineTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_DisciplineTypeDescriptor_TrackedDelete](DisciplineTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.DisciplineTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisciplineTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[DisciplineTypeDescriptor] ENABLE TRIGGER [extension_DisciplineTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_DisplacementTypeDescriptor_TR_DeleteTracking] ON [extension].[DisplacementTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_DisplacementTypeDescriptor_TrackedDelete](DisplacementTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.DisplacementTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisplacementTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[DisplacementTypeDescriptor] ENABLE TRIGGER [extension_DisplacementTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_EducationOrganizationFederalFunding_TR_DeleteTracking] ON [extension].[EducationOrganizationFederalFunding] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_EducationOrganizationFederalFunding_TrackedDelete](EducationOrganizationId, Id, ChangeVersion)
    SELECT  d.EducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.EducationOrganizationId = b.EducationOrganizationId
END
GO

ALTER TABLE [extension].[EducationOrganizationFederalFunding] ENABLE TRIGGER [extension_EducationOrganizationFederalFunding_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_EmergencyorProvisionalCredentialStatusDescriptor_TR_DeleteTracking] ON [extension].[EmergencyorProvisionalCredentialStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_EmergencyorProvisionalCredentialStatusDescriptor_TrackedDelete](EmergencyorProvisionalCredentialStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.EmergencyorProvisionalCredentialStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EmergencyorProvisionalCredentialStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[EmergencyorProvisionalCredentialStatusDescriptor] ENABLE TRIGGER [extension_EmergencyorProvisionalCredentialStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_FederalProgramFundingAllocationTypeDescriptor_TR_DeleteTracking] ON [extension].[FederalProgramFundingAllocationTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_FederalProgramFundingAllocationTypeDescriptor_TrackedDelete](FederalProgramFundingAllocationTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.FederalProgramFundingAllocationTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FederalProgramFundingAllocationTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[FederalProgramFundingAllocationTypeDescriptor] ENABLE TRIGGER [extension_FederalProgramFundingAllocationTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_IDEADisciplineMethodFirearmDescriptor_TR_DeleteTracking] ON [extension].[IDEADisciplineMethodFirearmDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_IDEADisciplineMethodFirearmDescriptor_TrackedDelete](IDEADisciplineMethodFirearmDescriptorId, Id, ChangeVersion)
    SELECT  d.IDEADisciplineMethodFirearmDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IDEADisciplineMethodFirearmDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[IDEADisciplineMethodFirearmDescriptor] ENABLE TRIGGER [extension_IDEADisciplineMethodFirearmDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_IdeaInterimRemovalReasonDescriptor_TR_DeleteTracking] ON [extension].[IdeaInterimRemovalReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_IdeaInterimRemovalReasonDescriptor_TrackedDelete](IdeaInterimRemovalReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.IdeaInterimRemovalReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IdeaInterimRemovalReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[IdeaInterimRemovalReasonDescriptor] ENABLE TRIGGER [extension_IdeaInterimRemovalReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_IdeaInterimRemovalTypeDescriptor_TR_DeleteTracking] ON [extension].[IdeaInterimRemovalTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_IdeaInterimRemovalTypeDescriptor_TrackedDelete](IdeaInterimRemovalTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.IdeaInterimRemovalTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IdeaInterimRemovalTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[IdeaInterimRemovalTypeDescriptor] ENABLE TRIGGER [extension_IdeaInterimRemovalTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_IndicatorStatusDescriptor_TR_DeleteTracking] ON [extension].[IndicatorStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_IndicatorStatusDescriptor_TrackedDelete](IndicatorStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.IndicatorStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IndicatorStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[IndicatorStatusDescriptor] ENABLE TRIGGER [extension_IndicatorStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_IndicatorStatusSubgroupDescriptor_TR_DeleteTracking] ON [extension].[IndicatorStatusSubgroupDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_IndicatorStatusSubgroupDescriptor_TrackedDelete](IndicatorStatusSubgroupDescriptorId, Id, ChangeVersion)
    SELECT  d.IndicatorStatusSubgroupDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IndicatorStatusSubgroupDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[IndicatorStatusSubgroupDescriptor] ENABLE TRIGGER [extension_IndicatorStatusSubgroupDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_IndicatorStatusSubgroupTypeDescriptor_TR_DeleteTracking] ON [extension].[IndicatorStatusSubgroupTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_IndicatorStatusSubgroupTypeDescriptor_TrackedDelete](IndicatorStatusSubgroupTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.IndicatorStatusSubgroupTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IndicatorStatusSubgroupTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[IndicatorStatusSubgroupTypeDescriptor] ENABLE TRIGGER [extension_IndicatorStatusSubgroupTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_IndicatorStatusTypeDescriptor_TR_DeleteTracking] ON [extension].[IndicatorStatusTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_IndicatorStatusTypeDescriptor_TrackedDelete](IndicatorStatusTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.IndicatorStatusTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IndicatorStatusTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[IndicatorStatusTypeDescriptor] ENABLE TRIGGER [extension_IndicatorStatusTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_InexperiencedStatusDescriptor_TR_DeleteTracking] ON [extension].[InexperiencedStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_InexperiencedStatusDescriptor_TrackedDelete](InexperiencedStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.InexperiencedStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InexperiencedStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[InexperiencedStatusDescriptor] ENABLE TRIGGER [extension_InexperiencedStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_K12LeaTitleISupportServiceDescriptor_TR_DeleteTracking] ON [extension].[K12LeaTitleISupportServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_K12LeaTitleISupportServiceDescriptor_TrackedDelete](K12LeaTitleISupportServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.K12LeaTitleISupportServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.K12LeaTitleISupportServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[K12LeaTitleISupportServiceDescriptor] ENABLE TRIGGER [extension_K12LeaTitleISupportServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_LocalEducationAgencyTypeDescriptor_TR_DeleteTracking] ON [extension].[LocalEducationAgencyTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_LocalEducationAgencyTypeDescriptor_TrackedDelete](LocalEducationAgencyTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.LocalEducationAgencyTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LocalEducationAgencyTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[LocalEducationAgencyTypeDescriptor] ENABLE TRIGGER [extension_LocalEducationAgencyTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_MepProjectTypeDescriptor_TR_DeleteTracking] ON [extension].[MepProjectTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_MepProjectTypeDescriptor_TrackedDelete](MepProjectTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.MepProjectTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MepProjectTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[MepProjectTypeDescriptor] ENABLE TRIGGER [extension_MepProjectTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_MigrantEducationProgramEnrollmentTypeDescriptor_TR_DeleteTracking] ON [extension].[MigrantEducationProgramEnrollmentTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_MigrantEducationProgramEnrollmentTypeDescriptor_TrackedDelete](MigrantEducationProgramEnrollmentTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.MigrantEducationProgramEnrollmentTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MigrantEducationProgramEnrollmentTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[MigrantEducationProgramEnrollmentTypeDescriptor] ENABLE TRIGGER [extension_MigrantEducationProgramEnrollmentTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_MigrantEducationProgramServicesTypeDescriptor_TR_DeleteTracking] ON [extension].[MigrantEducationProgramServicesTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_MigrantEducationProgramServicesTypeDescriptor_TrackedDelete](MigrantEducationProgramServicesTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.MigrantEducationProgramServicesTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MigrantEducationProgramServicesTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[MigrantEducationProgramServicesTypeDescriptor] ENABLE TRIGGER [extension_MigrantEducationProgramServicesTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor_TR_DeleteTracking] ON [extension].[NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor_TrackedDelete](NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId, Id, ChangeVersion)
    SELECT  d.NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor] ENABLE TRIGGER [extension_NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_NationalSchoolLunchProgramStatusDescriptor_TR_DeleteTracking] ON [extension].[NationalSchoolLunchProgramStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_NationalSchoolLunchProgramStatusDescriptor_TrackedDelete](NationalSchoolLunchProgramStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.NationalSchoolLunchProgramStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NationalSchoolLunchProgramStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[NationalSchoolLunchProgramStatusDescriptor] ENABLE TRIGGER [extension_NationalSchoolLunchProgramStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_OutOfFieldStatusDescriptor_TR_DeleteTracking] ON [extension].[OutOfFieldStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_OutOfFieldStatusDescriptor_TrackedDelete](OutOfFieldStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.OutOfFieldStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OutOfFieldStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[OutOfFieldStatusDescriptor] ENABLE TRIGGER [extension_OutOfFieldStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_ParaprofessionalQualificationDescriptor_TR_DeleteTracking] ON [extension].[ParaprofessionalQualificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_ParaprofessionalQualificationDescriptor_TrackedDelete](ParaprofessionalQualificationDescriptorId, Id, ChangeVersion)
    SELECT  d.ParaprofessionalQualificationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ParaprofessionalQualificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[ParaprofessionalQualificationDescriptor] ENABLE TRIGGER [extension_ParaprofessionalQualificationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_PerkinsLEPStatusDescriptor_TR_DeleteTracking] ON [extension].[PerkinsLEPStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_PerkinsLEPStatusDescriptor_TrackedDelete](PerkinsLEPStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.PerkinsLEPStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PerkinsLEPStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[PerkinsLEPStatusDescriptor] ENABLE TRIGGER [extension_PerkinsLEPStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor_TR_DeleteTracking] ON [extension].[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor_TrackedDelete](ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor] ENABLE TRIGGER [extension_ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_REAPAlternativeFundingStatusDescriptor_TR_DeleteTracking] ON [extension].[REAPAlternativeFundingStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_REAPAlternativeFundingStatusDescriptor_TrackedDelete](REAPAlternativeFundingStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.REAPAlternativeFundingStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.REAPAlternativeFundingStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[REAPAlternativeFundingStatusDescriptor] ENABLE TRIGGER [extension_REAPAlternativeFundingStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_ReconstitutedStatusDescriptor_TR_DeleteTracking] ON [extension].[ReconstitutedStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_ReconstitutedStatusDescriptor_TrackedDelete](ReconstitutedStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.ReconstitutedStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReconstitutedStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[ReconstitutedStatusDescriptor] ENABLE TRIGGER [extension_ReconstitutedStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_SchoolDangerousStatusDescriptor_TR_DeleteTracking] ON [extension].[SchoolDangerousStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_SchoolDangerousStatusDescriptor_TrackedDelete](SchoolDangerousStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolDangerousStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolDangerousStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[SchoolDangerousStatusDescriptor] ENABLE TRIGGER [extension_SchoolDangerousStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_SchoolFederalFunds_TR_DeleteTracking] ON [extension].[SchoolFederalFunds] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_SchoolFederalFunds_TrackedDelete](FiscalYear, SchoolId, Id, ChangeVersion)
    SELECT  FiscalYear, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[SchoolFederalFunds] ENABLE TRIGGER [extension_SchoolFederalFunds_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_SharedTimeIndicatorDescriptor_TR_DeleteTracking] ON [extension].[SharedTimeIndicatorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_SharedTimeIndicatorDescriptor_TrackedDelete](SharedTimeIndicatorDescriptorId, Id, ChangeVersion)
    SELECT  d.SharedTimeIndicatorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SharedTimeIndicatorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[SharedTimeIndicatorDescriptor] ENABLE TRIGGER [extension_SharedTimeIndicatorDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_SpecialEducationAgeGroupTaughtDescriptor_TR_DeleteTracking] ON [extension].[SpecialEducationAgeGroupTaughtDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_SpecialEducationAgeGroupTaughtDescriptor_TrackedDelete](SpecialEducationAgeGroupTaughtDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationAgeGroupTaughtDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationAgeGroupTaughtDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[SpecialEducationAgeGroupTaughtDescriptor] ENABLE TRIGGER [extension_SpecialEducationAgeGroupTaughtDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_SpecialEducationSupportServicesCategoryDescriptor_TR_DeleteTracking] ON [extension].[SpecialEducationSupportServicesCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_SpecialEducationSupportServicesCategoryDescriptor_TrackedDelete](SpecialEducationSupportServicesCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationSupportServicesCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationSupportServicesCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[SpecialEducationSupportServicesCategoryDescriptor] ENABLE TRIGGER [extension_SpecialEducationSupportServicesCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_StateDefinedCustomIndicatorStatusTypeDescriptor_TR_DeleteTracking] ON [extension].[StateDefinedCustomIndicatorStatusTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_StateDefinedCustomIndicatorStatusTypeDescriptor_TrackedDelete](StateDefinedCustomIndicatorStatusTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.StateDefinedCustomIndicatorStatusTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StateDefinedCustomIndicatorStatusTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[StateDefinedCustomIndicatorStatusTypeDescriptor] ENABLE TRIGGER [extension_StateDefinedCustomIndicatorStatusTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_StateDefinedCustomIndicator_TR_DeleteTracking] ON [extension].[StateDefinedCustomIndicator] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_StateDefinedCustomIndicator_TrackedDelete](SchoolYear, StatedDefinedCustomIndicatorId, Id, ChangeVersion)
    SELECT  SchoolYear, StatedDefinedCustomIndicatorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[StateDefinedCustomIndicator] ENABLE TRIGGER [extension_StateDefinedCustomIndicator_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_StateDefinedIndicator_TR_DeleteTracking] ON [extension].[StateDefinedIndicator] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_StateDefinedIndicator_TrackedDelete](SchoolYear, StatedDefinedCustomIndicatorId, Id, ChangeVersion)
    SELECT  SchoolYear, StatedDefinedCustomIndicatorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [extension].[StateDefinedIndicator] ENABLE TRIGGER [extension_StateDefinedIndicator_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_StatePovertyDesignationDescriptor_TR_DeleteTracking] ON [extension].[StatePovertyDesignationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_StatePovertyDesignationDescriptor_TrackedDelete](StatePovertyDesignationDescriptorId, Id, ChangeVersion)
    SELECT  d.StatePovertyDesignationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StatePovertyDesignationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[StatePovertyDesignationDescriptor] ENABLE TRIGGER [extension_StatePovertyDesignationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_TargetedSupportDescriptor_TR_DeleteTracking] ON [extension].[TargetedSupportDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_TargetedSupportDescriptor_TrackedDelete](TargetedSupportDescriptorId, Id, ChangeVersion)
    SELECT  d.TargetedSupportDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TargetedSupportDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[TargetedSupportDescriptor] ENABLE TRIGGER [extension_TargetedSupportDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_TitleIProgramStaffCategoryDescriptor_TR_DeleteTracking] ON [extension].[TitleIProgramStaffCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_TitleIProgramStaffCategoryDescriptor_TrackedDelete](TitleIProgramStaffCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.TitleIProgramStaffCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TitleIProgramStaffCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[TitleIProgramStaffCategoryDescriptor] ENABLE TRIGGER [extension_TitleIProgramStaffCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_TitleIProgramTypeDescriptor_TR_DeleteTracking] ON [extension].[TitleIProgramTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_TitleIProgramTypeDescriptor_TrackedDelete](TitleIProgramTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.TitleIProgramTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TitleIProgramTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[TitleIProgramTypeDescriptor] ENABLE TRIGGER [extension_TitleIProgramTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_TitleIinstructionalServiceDescriptor_TR_DeleteTracking] ON [extension].[TitleIinstructionalServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_TitleIinstructionalServiceDescriptor_TrackedDelete](TitleIinstructionalServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.TitleIinstructionalServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TitleIinstructionalServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[TitleIinstructionalServiceDescriptor] ENABLE TRIGGER [extension_TitleIinstructionalServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [extension].[extension_VirtualSchoolStatusDescriptor_TR_DeleteTracking] ON [extension].[VirtualSchoolStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[extension_VirtualSchoolStatusDescriptor_TrackedDelete](VirtualSchoolStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.VirtualSchoolStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VirtualSchoolStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [extension].[VirtualSchoolStatusDescriptor] ENABLE TRIGGER [extension_VirtualSchoolStatusDescriptor_TR_DeleteTracking]
GO


