-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table [extension].[BehaviorTypeDescriptor] --
CREATE TABLE [extension].[BehaviorTypeDescriptor] (
    [BehaviorTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [BehaviorTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [BehaviorTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[CedsLocalEducationAgency] --
CREATE TABLE [extension].[CedsLocalEducationAgency] (
    [CedsLocalEducationAgencyId] [INT] NOT NULL,
    [LocalEducationAgencyCategoryDescriptorId] [INT] NULL,
    [LocalEducationAgencyId] [INT] NOT NULL,
    [TitleIinstructionalServiceDescriptorId] [INT] NULL,
    [TitleIProgramTypeDescriptorId] [INT] NULL,
    [K12LeaTitleISupportServiceDescriptorId] [INT] NULL,
    [MepProjectTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsLocalEducationAgency_PK] PRIMARY KEY CLUSTERED (
        [CedsLocalEducationAgencyId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsLocalEducationAgency] ADD CONSTRAINT [CedsLocalEducationAgency_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsLocalEducationAgency] ADD CONSTRAINT [CedsLocalEducationAgency_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsLocalEducationAgency] ADD CONSTRAINT [CedsLocalEducationAgency_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsSchool] --
CREATE TABLE [extension].[CedsSchool] (
    [CedsSchoolId] [INT] NOT NULL,
    [CharterSchoolApprovalAgencyId] [INT] NULL,
    [EducationOrgabizationNetworkId] [INT] NULL,
    [NationalSchoolLunchProgramStatusDescriptorId] [INT] NULL,
    [ReconstitutedStatusDescriptorId] [INT] NULL,
    [SharedTimeIndicatorDescriptorId] [INT] NULL,
    [VirtualSchoolStatusDescriptorId] [INT] NULL,
    [ContractIdentifier] [NVARCHAR](20) NULL,
    [StatePovertyDesignationDescriptorId] [INT] NULL,
    [MepProjectTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsSchool_PK] PRIMARY KEY CLUSTERED (
        [CedsSchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsSchool] ADD CONSTRAINT [CedsSchool_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsSchool] ADD CONSTRAINT [CedsSchool_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsSchool] ADD CONSTRAINT [CedsSchool_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsSchoolAccountability] --
CREATE TABLE [extension].[CedsSchoolAccountability] (
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [INT] NOT NULL,
    [GunFreeSchoolsActReportingStatusDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsSchoolAccountability_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsSchoolAccountability] ADD CONSTRAINT [CedsSchoolAccountability_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsSchoolAccountability] ADD CONSTRAINT [CedsSchoolAccountability_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsSchoolAccountability] ADD CONSTRAINT [CedsSchoolAccountability_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsSchoolComprehensiveAndTargetedSupport] --
CREATE TABLE [extension].[CedsSchoolComprehensiveAndTargetedSupport] (
    [SchoolId] [INT] NOT NULL,
    [ComprehensiveAndTargetedSupportDescriptorId] [INT] NULL,
    [ComprehensiveSupportDescriptorId] [INT] NULL,
    [TargetedSupportDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsSchoolComprehensiveAndTargetedSupport_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsSchoolComprehensiveAndTargetedSupport] ADD CONSTRAINT [CedsSchoolComprehensiveAndTargetedSupport_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsSchoolComprehensiveAndTargetedSupport] ADD CONSTRAINT [CedsSchoolComprehensiveAndTargetedSupport_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsSchoolComprehensiveAndTargetedSupport] ADD CONSTRAINT [CedsSchoolComprehensiveAndTargetedSupport_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsSchoolCustomIndicatorStatusType] --
CREATE TABLE [extension].[CedsSchoolCustomIndicatorStatusType] (
    [IndicatorStatusDescriptorId] [INT] NOT NULL,
    [IndicatorStatusSubgroupDescriptorId] [INT] NOT NULL,
    [IndicatorStatusSubgroupTypeDescriptorId] [INT] NOT NULL,
    [IndicatorStatusTypeDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StatedDefinedCustomIndicatorStatusType] [NVARCHAR](100) NOT NULL,
    [StatedDefinedIndicatorStatus] [NVARCHAR](100) NOT NULL,
    [RecordStartDateTime] [DATE] NULL,
    [RecordEndDateTime] [DATE] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsSchoolCustomIndicatorStatusType_PK] PRIMARY KEY CLUSTERED (
        [IndicatorStatusDescriptorId] ASC,
        [IndicatorStatusSubgroupDescriptorId] ASC,
        [IndicatorStatusSubgroupTypeDescriptorId] ASC,
        [IndicatorStatusTypeDescriptorId] ASC,
        [SchoolId] ASC,
        [StatedDefinedCustomIndicatorStatusType] ASC,
        [StatedDefinedIndicatorStatus] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsSchoolCustomIndicatorStatusType] ADD CONSTRAINT [CedsSchoolCustomIndicatorStatusType_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsSchoolCustomIndicatorStatusType] ADD CONSTRAINT [CedsSchoolCustomIndicatorStatusType_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsSchoolCustomIndicatorStatusType] ADD CONSTRAINT [CedsSchoolCustomIndicatorStatusType_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsSchoolIndicatorStatus] --
CREATE TABLE [extension].[CedsSchoolIndicatorStatus] (
    [IndicatorStatusDescriptorId] [INT] NOT NULL,
    [IndicatorStatusSubgroupDescriptorId] [INT] NOT NULL,
    [IndicatorStatusSubgroupTypeDescriptorId] [INT] NOT NULL,
    [IndicatorStatusTypeDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StatedDefinedIndicatorStatus] [NVARCHAR](100) NULL,
    [RecordStartDateTime] [DATE] NULL,
    [RecordEndDateTime] [DATE] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsSchoolIndicatorStatus_PK] PRIMARY KEY CLUSTERED (
        [IndicatorStatusDescriptorId] ASC,
        [IndicatorStatusSubgroupDescriptorId] ASC,
        [IndicatorStatusSubgroupTypeDescriptorId] ASC,
        [IndicatorStatusTypeDescriptorId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsSchoolIndicatorStatus] ADD CONSTRAINT [CedsSchoolIndicatorStatus_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsSchoolIndicatorStatus] ADD CONSTRAINT [CedsSchoolIndicatorStatus_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsSchoolIndicatorStatus] ADD CONSTRAINT [CedsSchoolIndicatorStatus_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsSchoolStatus] --
CREATE TABLE [extension].[CedsSchoolStatus] (
    [SchoolId] [INT] NOT NULL,
    [ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId] [INT] NULL,
    [SchoolDangerousStatusDescriptorId] [INT] NULL,
    [ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus] [NVARCHAR](50) NULL,
    [ConsolidatedMepFundsStatus] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsSchoolStatus_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsSchoolStatus] ADD CONSTRAINT [CedsSchoolStatus_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsSchoolStatus] ADD CONSTRAINT [CedsSchoolStatus_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsSchoolStatus] ADD CONSTRAINT [CedsSchoolStatus_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsSpecialEducationStaffCategory] --
CREATE TABLE [extension].[CedsSpecialEducationStaffCategory] (
    [SchoolId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [SpecialEducationProgramServiceDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsSpecialEducationStaffCategory_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsSpecialEducationStaffCategory] ADD CONSTRAINT [CedsSpecialEducationStaffCategory_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsSpecialEducationStaffCategory] ADD CONSTRAINT [CedsSpecialEducationStaffCategory_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsSpecialEducationStaffCategory] ADD CONSTRAINT [CedsSpecialEducationStaffCategory_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsStudentAssessment] --
CREATE TABLE [extension].[CedsStudentAssessment] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [AdministrationDate] [DATE] NOT NULL,
    [AssessedGradeLevelDescriptorId] [INT] NOT NULL,
    [CedsAssessmentTitle] [NVARCHAR](60) NOT NULL,
    [CedsAssessmentVersion] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [StateFullAcademicYear] [BIT] NULL,
    [LEAFullAcademicYear] [BIT] NULL,
    [SchoolFullAcademicYear] [BIT] NULL,
    [RecordStartDateTime] [DATE] NOT NULL,
    [RecordEndDateTime] [DATE] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsStudentAssessment_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [AdministrationDate] ASC,
        [AssessedGradeLevelDescriptorId] ASC,
        [CedsAssessmentTitle] ASC,
        [CedsAssessmentVersion] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsStudentAssessment] ADD CONSTRAINT [CedsStudentAssessment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsStudentAssessment] ADD CONSTRAINT [CedsStudentAssessment_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsStudentAssessment] ADD CONSTRAINT [CedsStudentAssessment_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsStudentCTEProgramAssociation] --
CREATE TABLE [extension].[CedsStudentCTEProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DisplacementTypeDescriptorId] [INT] NULL,
    [PerkinsLEPStatusDescriptorId] [INT] NULL,
    [AdvancedTrainingEnrollmentDate] [DATETIME2](7) NULL,
    [CteParticipant] [BIT] NULL,
    [CteConcentrator] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsStudentCTEProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsStudentCTEProgramAssociation] ADD CONSTRAINT [CedsStudentCTEProgramAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsStudentCTEProgramAssociation] ADD CONSTRAINT [CedsStudentCTEProgramAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsStudentCTEProgramAssociation] ADD CONSTRAINT [CedsStudentCTEProgramAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsStudentHomelessProgramAssociation] --
CREATE TABLE [extension].[CedsStudentHomelessProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [CedsProgramName] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [HomelessServicedIndicator] [BIT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsStudentHomelessProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [CedsProgramName] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsStudentHomelessProgramAssociation] ADD CONSTRAINT [CedsStudentHomelessProgramAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsStudentHomelessProgramAssociation] ADD CONSTRAINT [CedsStudentHomelessProgramAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsStudentHomelessProgramAssociation] ADD CONSTRAINT [CedsStudentHomelessProgramAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CedsStudentMigrantEducationProgramAssociation] --
CREATE TABLE [extension].[CedsStudentMigrantEducationProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [MigrantEducationProgramEnrollmentTypeDescriptorId] [INT] NULL,
    CONSTRAINT [CedsStudentMigrantEducationProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[CedsStudentNoDProgramAssociation] --
CREATE TABLE [extension].[CedsStudentNoDProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DisplacementTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CedsStudentNoDProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CedsStudentNoDProgramAssociation] ADD CONSTRAINT [CedsStudentNoDProgramAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CedsStudentNoDProgramAssociation] ADD CONSTRAINT [CedsStudentNoDProgramAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CedsStudentNoDProgramAssociation] ADD CONSTRAINT [CedsStudentNoDProgramAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CharterContract] --
CREATE TABLE [extension].[CharterContract] (
    [ContractIdentifier] [NVARCHAR](20) NOT NULL,
    [ApprovalDate] [DATE] NOT NULL,
    [RenewalDate] [DATE] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CharterContract_PK] PRIMARY KEY CLUSTERED (
        [ContractIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CharterContract] ADD CONSTRAINT [CharterContract_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CharterContract] ADD CONSTRAINT [CharterContract_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CharterContract] ADD CONSTRAINT [CharterContract_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CharterSchoolApprovalAgency] --
CREATE TABLE [extension].[CharterSchoolApprovalAgency] (
    [CharterSchoolApprovalAgencyId] [INT] NOT NULL,
    [CharterApprovalAgencyTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CharterSchoolApprovalAgency_PK] PRIMARY KEY CLUSTERED (
        [CharterSchoolApprovalAgencyId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CharterSchoolApprovalAgency] ADD CONSTRAINT [CharterSchoolApprovalAgency_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CharterSchoolApprovalAgency] ADD CONSTRAINT [CharterSchoolApprovalAgency_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CharterSchoolApprovalAgency] ADD CONSTRAINT [CharterSchoolApprovalAgency_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[CharterSchoolManagementOrganizationTypeDescriptor] --
CREATE TABLE [extension].[CharterSchoolManagementOrganizationTypeDescriptor] (
    [CharterSchoolManagementOrganizationTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CharterSchoolManagementOrganizationTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CharterSchoolManagementOrganizationTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[ComprehensiveAndTargetedSupportDescriptor] --
CREATE TABLE [extension].[ComprehensiveAndTargetedSupportDescriptor] (
    [ComprehensiveAndTargetedSupportDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ComprehensiveAndTargetedSupportDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ComprehensiveAndTargetedSupportDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[ComprehensiveSupportDescriptor] --
CREATE TABLE [extension].[ComprehensiveSupportDescriptor] (
    [ComprehensiveSupportDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ComprehensiveSupportDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ComprehensiveSupportDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[DisciplineActionDiscipline] --
CREATE TABLE [extension].[DisciplineActionDiscipline] (
    [CedsDisciplineActionIdentifier] [NVARCHAR](20) NOT NULL,
    [DisciplineDate] [DATE] NOT NULL,
    [DisciplineDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [IdeaInterimRemovalTypeDescriptorId] [INT] NULL,
    [IdeaInterimRemovalReasonDescriptorId] [INT] NULL,
    [DisciplineMethodFirearmDescriptorId] [INT] NULL,
    [IDEADisciplineMethodFirearmDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [DisciplineActionDiscipline_PK] PRIMARY KEY CLUSTERED (
        [CedsDisciplineActionIdentifier] ASC,
        [DisciplineDate] ASC,
        [DisciplineDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[DisciplineActionDiscipline] ADD CONSTRAINT [DisciplineActionDiscipline_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[DisciplineActionDiscipline] ADD CONSTRAINT [DisciplineActionDiscipline_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[DisciplineActionDiscipline] ADD CONSTRAINT [DisciplineActionDiscipline_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[DisciplineMethodFirearmDescriptor] --
CREATE TABLE [extension].[DisciplineMethodFirearmDescriptor] (
    [DisciplineMethodFirearmDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DisciplineMethodFirearmDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DisciplineMethodFirearmDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[DisciplineTypeDescriptor] --
CREATE TABLE [extension].[DisciplineTypeDescriptor] (
    [DisciplineTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DisciplineTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DisciplineTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[DisplacementTypeDescriptor] --
CREATE TABLE [extension].[DisplacementTypeDescriptor] (
    [DisplacementTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DisplacementTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DisplacementTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[EducationOrganizationFederalFunding] --
CREATE TABLE [extension].[EducationOrganizationFederalFunding] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FederalProgramCode] [NVARCHAR](10) NULL,
    [FederalProgramsFundingAllocation] [MONEY] NULL,
    [ParentalInvolvmementReservationFunds] [MONEY] NULL,
    [REAPAlternativeFundingStatusDescriptorId] [INT] NULL,
    [FederalProgramFundingAllocationTypeDescriptorId] [INT] NULL,
    CONSTRAINT [EducationOrganizationFederalFunding_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[EducationOrganizationNetworkExtension] --
CREATE TABLE [extension].[EducationOrganizationNetworkExtension] (
    [EducationOrganizationNetworkId] [INT] NOT NULL,
    [CharterSchoolManagementOrganizationTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [EducationOrganizationNetworkExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationNetworkId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[EducationOrganizationNetworkExtension] ADD CONSTRAINT [EducationOrganizationNetworkExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[EmergencyorProvisionalCredentialStatusDescriptor] --
CREATE TABLE [extension].[EmergencyorProvisionalCredentialStatusDescriptor] (
    [EmergencyorProvisionalCredentialStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EmergencyorProvisionalCredentialStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EmergencyorProvisionalCredentialStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[FederalProgramFundingAllocationTypeDescriptor] --
CREATE TABLE [extension].[FederalProgramFundingAllocationTypeDescriptor] (
    [FederalProgramFundingAllocationTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FederalProgramFundingAllocationTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FederalProgramFundingAllocationTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IDEADisciplineMethodFirearmDescriptor] --
CREATE TABLE [extension].[IDEADisciplineMethodFirearmDescriptor] (
    [IDEADisciplineMethodFirearmDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IDEADisciplineMethodFirearmDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IDEADisciplineMethodFirearmDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IdeaInterimRemovalReasonDescriptor] --
CREATE TABLE [extension].[IdeaInterimRemovalReasonDescriptor] (
    [IdeaInterimRemovalReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IdeaInterimRemovalReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IdeaInterimRemovalReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IdeaInterimRemovalTypeDescriptor] --
CREATE TABLE [extension].[IdeaInterimRemovalTypeDescriptor] (
    [IdeaInterimRemovalTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IdeaInterimRemovalTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IdeaInterimRemovalTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IndicatorStatusDescriptor] --
CREATE TABLE [extension].[IndicatorStatusDescriptor] (
    [IndicatorStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IndicatorStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IndicatorStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IndicatorStatusSubgroupDescriptor] --
CREATE TABLE [extension].[IndicatorStatusSubgroupDescriptor] (
    [IndicatorStatusSubgroupDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IndicatorStatusSubgroupDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IndicatorStatusSubgroupDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IndicatorStatusSubgroupTypeDescriptor] --
CREATE TABLE [extension].[IndicatorStatusSubgroupTypeDescriptor] (
    [IndicatorStatusSubgroupTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IndicatorStatusSubgroupTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IndicatorStatusSubgroupTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IndicatorStatusTypeDescriptor] --
CREATE TABLE [extension].[IndicatorStatusTypeDescriptor] (
    [IndicatorStatusTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IndicatorStatusTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IndicatorStatusTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[InexperiencedStatusDescriptor] --
CREATE TABLE [extension].[InexperiencedStatusDescriptor] (
    [InexperiencedStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [InexperiencedStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [InexperiencedStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[K12LeaTitleISupportServiceDescriptor] --
CREATE TABLE [extension].[K12LeaTitleISupportServiceDescriptor] (
    [K12LeaTitleISupportServiceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [K12LeaTitleISupportServiceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [K12LeaTitleISupportServiceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[LocalEducationAgencyTypeDescriptor] --
CREATE TABLE [extension].[LocalEducationAgencyTypeDescriptor] (
    [LocalEducationAgencyTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [LocalEducationAgencyTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[MepProjectTypeDescriptor] --
CREATE TABLE [extension].[MepProjectTypeDescriptor] (
    [MepProjectTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MepProjectTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MepProjectTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[MigrantEducationProgramEnrollmentTypeDescriptor] --
CREATE TABLE [extension].[MigrantEducationProgramEnrollmentTypeDescriptor] (
    [MigrantEducationProgramEnrollmentTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MigrantEducationProgramEnrollmentTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MigrantEducationProgramEnrollmentTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[MigrantEducationProgramServicesTypeDescriptor] --
CREATE TABLE [extension].[MigrantEducationProgramServicesTypeDescriptor] (
    [MigrantEducationProgramServicesTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MigrantEducationProgramServicesTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MigrantEducationProgramServicesTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor] --
CREATE TABLE [extension].[NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor] (
    [NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId] [INT] NOT NULL,
    CONSTRAINT [NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor_PK] PRIMARY KEY CLUSTERED (
        [NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[NationalSchoolLunchProgramStatusDescriptor] --
CREATE TABLE [extension].[NationalSchoolLunchProgramStatusDescriptor] (
    [NationalSchoolLunchProgramStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [NationalSchoolLunchProgramStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [NationalSchoolLunchProgramStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[OutOfFieldStatusDescriptor] --
CREATE TABLE [extension].[OutOfFieldStatusDescriptor] (
    [OutOfFieldStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [OutOfFieldStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [OutOfFieldStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[ParaprofessionalQualificationDescriptor] --
CREATE TABLE [extension].[ParaprofessionalQualificationDescriptor] (
    [ParaprofessionalQualificationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ParaprofessionalQualificationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ParaprofessionalQualificationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[PerkinsLEPStatusDescriptor] --
CREATE TABLE [extension].[PerkinsLEPStatusDescriptor] (
    [PerkinsLEPStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PerkinsLEPStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PerkinsLEPStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor] --
CREATE TABLE [extension].[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor] (
    [ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[REAPAlternativeFundingStatusDescriptor] --
CREATE TABLE [extension].[REAPAlternativeFundingStatusDescriptor] (
    [REAPAlternativeFundingStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [REAPAlternativeFundingStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [REAPAlternativeFundingStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[ReconstitutedStatusDescriptor] --
CREATE TABLE [extension].[ReconstitutedStatusDescriptor] (
    [ReconstitutedStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ReconstitutedStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ReconstitutedStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[SchoolDangerousStatusDescriptor] --
CREATE TABLE [extension].[SchoolDangerousStatusDescriptor] (
    [SchoolDangerousStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SchoolDangerousStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SchoolDangerousStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[SchoolFederalFunds] --
CREATE TABLE [extension].[SchoolFederalFunds] (
    [FiscalYear] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolImprovementAllocation] [MONEY] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [SchoolFederalFunds_PK] PRIMARY KEY CLUSTERED (
        [FiscalYear] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[SchoolFederalFunds] ADD CONSTRAINT [SchoolFederalFunds_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[SchoolFederalFunds] ADD CONSTRAINT [SchoolFederalFunds_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[SchoolFederalFunds] ADD CONSTRAINT [SchoolFederalFunds_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[SharedTimeIndicatorDescriptor] --
CREATE TABLE [extension].[SharedTimeIndicatorDescriptor] (
    [SharedTimeIndicatorDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SharedTimeIndicatorDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SharedTimeIndicatorDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[SpecialEducationAgeGroupTaughtDescriptor] --
CREATE TABLE [extension].[SpecialEducationAgeGroupTaughtDescriptor] (
    [SpecialEducationAgeGroupTaughtDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationAgeGroupTaughtDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationAgeGroupTaughtDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[SpecialEducationSupportServicesCategoryDescriptor] --
CREATE TABLE [extension].[SpecialEducationSupportServicesCategoryDescriptor] (
    [SpecialEducationSupportServicesCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationSupportServicesCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationSupportServicesCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[StaffEducationOrganizationAssignmentAssociationExtension] --
CREATE TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StaffClassificationDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [SpecialEducationAgeGroupTaughtDescriptorId] [INT] NULL,
    [SpecialEducationSupportServicesCategoryDescriptorId] [INT] NULL,
    [TitleIProgramStaffCategoryDescriptorId] [INT] NULL,
    [InexperiencedStatusDescriptorId] [INT] NULL,
    [EmergencyorProvisionalCredentialStatusDescriptorId] [INT] NULL,
    [OutOfFieldStatusDescriptorId] [INT] NULL,
    [RecordStartDateTime] [DATE] NULL,
    [RecordEndDateTime] [DATE] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [StaffClassificationDescriptorId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] ADD CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StateDefinedCustomIndicator] --
CREATE TABLE [extension].[StateDefinedCustomIndicator] (
    [SchoolYear] [INT] NOT NULL,
    [StatedDefinedCustomIndicatorId] [INT] NOT NULL,
    [Code] [NVARCHAR](50) NOT NULL,
    [Definition] [NVARCHAR](500) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StateDefinedCustomIndicator_PK] PRIMARY KEY CLUSTERED (
        [SchoolYear] ASC,
        [StatedDefinedCustomIndicatorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[StateDefinedCustomIndicator] ADD CONSTRAINT [StateDefinedCustomIndicator_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[StateDefinedCustomIndicator] ADD CONSTRAINT [StateDefinedCustomIndicator_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[StateDefinedCustomIndicator] ADD CONSTRAINT [StateDefinedCustomIndicator_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[StateDefinedCustomIndicatorStatusTypeDescriptor] --
CREATE TABLE [extension].[StateDefinedCustomIndicatorStatusTypeDescriptor] (
    [StateDefinedCustomIndicatorStatusTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StateDefinedCustomIndicatorStatusTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StateDefinedCustomIndicatorStatusTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[StateDefinedIndicator] --
CREATE TABLE [extension].[StateDefinedIndicator] (
    [SchoolYear] [INT] NOT NULL,
    [StatedDefinedCustomIndicatorId] [INT] NOT NULL,
    [Code] [NVARCHAR](50) NOT NULL,
    [Definition] [NVARCHAR](500) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StateDefinedIndicator_PK] PRIMARY KEY CLUSTERED (
        [SchoolYear] ASC,
        [StatedDefinedCustomIndicatorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[StateDefinedIndicator] ADD CONSTRAINT [StateDefinedIndicator_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[StateDefinedIndicator] ADD CONSTRAINT [StateDefinedIndicator_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[StateDefinedIndicator] ADD CONSTRAINT [StateDefinedIndicator_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[StatePovertyDesignationDescriptor] --
CREATE TABLE [extension].[StatePovertyDesignationDescriptor] (
    [StatePovertyDesignationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StatePovertyDesignationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StatePovertyDesignationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[StudentExtension] --
CREATE TABLE [extension].[StudentExtension] (
    [StudentUSI] [INT] NOT NULL,
    [NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentExtension_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[StudentExtension] ADD CONSTRAINT [StudentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[TargetedSupportDescriptor] --
CREATE TABLE [extension].[TargetedSupportDescriptor] (
    [TargetedSupportDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TargetedSupportDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TargetedSupportDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[TitleIinstructionalServiceDescriptor] --
CREATE TABLE [extension].[TitleIinstructionalServiceDescriptor] (
    [TitleIinstructionalServiceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TitleIinstructionalServiceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TitleIinstructionalServiceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[TitleIProgramStaffCategoryDescriptor] --
CREATE TABLE [extension].[TitleIProgramStaffCategoryDescriptor] (
    [TitleIProgramStaffCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TitleIProgramStaffCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TitleIProgramStaffCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[TitleIProgramTypeDescriptor] --
CREATE TABLE [extension].[TitleIProgramTypeDescriptor] (
    [TitleIProgramTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TitleIProgramTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TitleIProgramTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[VirtualSchoolStatusDescriptor] --
CREATE TABLE [extension].[VirtualSchoolStatusDescriptor] (
    [VirtualSchoolStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [VirtualSchoolStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [VirtualSchoolStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

