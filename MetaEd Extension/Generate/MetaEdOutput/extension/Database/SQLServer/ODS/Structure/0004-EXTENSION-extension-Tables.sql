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
    [LocalEducationAgencyTypeDescriptorId] [INT] NULL,
    [LocalEducationAgencyId] [INT] NOT NULL,
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
    [NationalSchoolLunchProgramStatusDescriptorId] [INT] NULL,
    [ReconstitutedStatusDescriptorId] [INT] NULL,
    [SharedTimeIndicatorDescriptorId] [INT] NULL,
    [VirtualSchoolStatusDescriptorId] [INT] NULL,
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

-- Table [extension].[CedsStudentMigrantEducationProgramAssociation] --
CREATE TABLE [extension].[CedsStudentMigrantEducationProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [MigrantEducationProgramEnrollmentTypeDescriptorId] [INT] NULL,
    [MigrantEducationProgramServicesTypeDescriptorId] [INT] NULL,
    [MigrantStudentQualifyingArrivalDate] [DATE] NULL,
    CONSTRAINT [CedsStudentMigrantEducationProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeId] ASC,
        [StudentUSI] ASC
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

-- Table [extension].[EducationOrganizationFederalFunding] --
CREATE TABLE [extension].[EducationOrganizationFederalFunding] (
    [EducationOrganizationId] [INT] NOT NULL,
    [FederalProgramCode] [NVARCHAR](10) NULL,
    [FederalProgramsFundingAllocation] [MONEY] NULL,
    [ParentalInvolvmementReservationFunds] [MONEY] NULL,
    CONSTRAINT [EducationOrganizationFederalFunding_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC
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

-- Table [extension].[ReconstitutedStatusDescriptor] --
CREATE TABLE [extension].[ReconstitutedStatusDescriptor] (
    [ReconstitutedStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ReconstitutedStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ReconstitutedStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
    CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [StaffClassificationDescriptorId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[StudentExtension] --
CREATE TABLE [extension].[StudentExtension] (
    [StudentUSI] [INT] NOT NULL,
    [NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId] [INT] NULL,
    CONSTRAINT [StudentExtension_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC
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

-- Table [extension].[VirtualSchoolStatusDescriptor] --
CREATE TABLE [extension].[VirtualSchoolStatusDescriptor] (
    [VirtualSchoolStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [VirtualSchoolStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [VirtualSchoolStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [extension].[BehaviorTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_BehaviorTypeDescriptor_Descriptor] FOREIGN KEY ([BehaviorTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[CedsLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_CedsLocalEducationAgency_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsLocalEducationAgency_LocalEducationAgency]
ON [extension].[CedsLocalEducationAgency] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [extension].[CedsLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_CedsLocalEducationAgency_LocalEducationAgencyTypeDescriptor] FOREIGN KEY ([LocalEducationAgencyTypeDescriptorId])
REFERENCES [extension].[LocalEducationAgencyTypeDescriptor] ([LocalEducationAgencyTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsLocalEducationAgency_LocalEducationAgencyTypeDescriptor]
ON [extension].[CedsLocalEducationAgency] ([LocalEducationAgencyTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchool] WITH CHECK ADD CONSTRAINT [FK_CedsSchool_NationalSchoolLunchProgramStatusDescriptor] FOREIGN KEY ([NationalSchoolLunchProgramStatusDescriptorId])
REFERENCES [extension].[NationalSchoolLunchProgramStatusDescriptor] ([NationalSchoolLunchProgramStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchool_NationalSchoolLunchProgramStatusDescriptor]
ON [extension].[CedsSchool] ([NationalSchoolLunchProgramStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchool] WITH CHECK ADD CONSTRAINT [FK_CedsSchool_ReconstitutedStatusDescriptor] FOREIGN KEY ([ReconstitutedStatusDescriptorId])
REFERENCES [extension].[ReconstitutedStatusDescriptor] ([ReconstitutedStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchool_ReconstitutedStatusDescriptor]
ON [extension].[CedsSchool] ([ReconstitutedStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchool] WITH CHECK ADD CONSTRAINT [FK_CedsSchool_SharedTimeIndicatorDescriptor] FOREIGN KEY ([SharedTimeIndicatorDescriptorId])
REFERENCES [extension].[SharedTimeIndicatorDescriptor] ([SharedTimeIndicatorDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchool_SharedTimeIndicatorDescriptor]
ON [extension].[CedsSchool] ([SharedTimeIndicatorDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchool] WITH CHECK ADD CONSTRAINT [FK_CedsSchool_VirtualSchoolStatusDescriptor] FOREIGN KEY ([VirtualSchoolStatusDescriptorId])
REFERENCES [extension].[VirtualSchoolStatusDescriptor] ([VirtualSchoolStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchool_VirtualSchoolStatusDescriptor]
ON [extension].[CedsSchool] ([VirtualSchoolStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsStudentMigrantEducationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CedsStudentMigrantEducationProgramAssociation_MigrantEducationProgramEnrollmentTypeDescriptor] FOREIGN KEY ([MigrantEducationProgramEnrollmentTypeDescriptorId])
REFERENCES [extension].[MigrantEducationProgramEnrollmentTypeDescriptor] ([MigrantEducationProgramEnrollmentTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsStudentMigrantEducationProgramAssociation_MigrantEducationProgramEnrollmentTypeDescriptor]
ON [extension].[CedsStudentMigrantEducationProgramAssociation] ([MigrantEducationProgramEnrollmentTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsStudentMigrantEducationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CedsStudentMigrantEducationProgramAssociation_MigrantEducationProgramServicesTypeDescriptor] FOREIGN KEY ([MigrantEducationProgramServicesTypeDescriptorId])
REFERENCES [extension].[MigrantEducationProgramServicesTypeDescriptor] ([MigrantEducationProgramServicesTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsStudentMigrantEducationProgramAssociation_MigrantEducationProgramServicesTypeDescriptor]
ON [extension].[CedsStudentMigrantEducationProgramAssociation] ([MigrantEducationProgramServicesTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsStudentMigrantEducationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CedsStudentMigrantEducationProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate])
REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[DisciplineTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_DisciplineTypeDescriptor_Descriptor] FOREIGN KEY ([DisciplineTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[EducationOrganizationFederalFunding] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFederalFunding_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[LocalEducationAgencyTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyTypeDescriptor_Descriptor] FOREIGN KEY ([LocalEducationAgencyTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[MigrantEducationProgramEnrollmentTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_MigrantEducationProgramEnrollmentTypeDescriptor_Descriptor] FOREIGN KEY ([MigrantEducationProgramEnrollmentTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[MigrantEducationProgramServicesTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_MigrantEducationProgramServicesTypeDescriptor_Descriptor] FOREIGN KEY ([MigrantEducationProgramServicesTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor] WITH CHECK ADD CONSTRAINT [FK_NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor_Descriptor] FOREIGN KEY ([NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[NationalSchoolLunchProgramStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_NationalSchoolLunchProgramStatusDescriptor_Descriptor] FOREIGN KEY ([NationalSchoolLunchProgramStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ReconstitutedStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_ReconstitutedStatusDescriptor_Descriptor] FOREIGN KEY ([ReconstitutedStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[SharedTimeIndicatorDescriptor] WITH CHECK ADD CONSTRAINT [FK_SharedTimeIndicatorDescriptor_Descriptor] FOREIGN KEY ([SharedTimeIndicatorDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[SpecialEducationAgeGroupTaughtDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationAgeGroupTaughtDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationAgeGroupTaughtDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[SpecialEducationSupportServicesCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationSupportServicesCategoryDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationSupportServicesCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_SpecialEducationAgeGroupTaughtDescriptor] FOREIGN KEY ([SpecialEducationAgeGroupTaughtDescriptorId])
REFERENCES [extension].[SpecialEducationAgeGroupTaughtDescriptor] ([SpecialEducationAgeGroupTaughtDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationAssignmentAssociationExtension_SpecialEducationAgeGroupTaughtDescriptor]
ON [extension].[StaffEducationOrganizationAssignmentAssociationExtension] ([SpecialEducationAgeGroupTaughtDescriptorId] ASC)
GO

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_SpecialEducationSupportServicesCategoryDescriptor] FOREIGN KEY ([SpecialEducationSupportServicesCategoryDescriptorId])
REFERENCES [extension].[SpecialEducationSupportServicesCategoryDescriptor] ([SpecialEducationSupportServicesCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationAssignmentAssociationExtension_SpecialEducationSupportServicesCategoryDescriptor]
ON [extension].[StaffEducationOrganizationAssignmentAssociationExtension] ([SpecialEducationSupportServicesCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_StaffEducationOrganizationAssignmentAssociation] FOREIGN KEY ([StaffUSI], [EducationOrganizationId], [StaffClassificationDescriptorId], [BeginDate])
REFERENCES [edfi].[StaffEducationOrganizationAssignmentAssociation] ([StaffUSI], [EducationOrganizationId], [StaffClassificationDescriptorId], [BeginDate])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_TitleIProgramStaffCategoryDescriptor] FOREIGN KEY ([TitleIProgramStaffCategoryDescriptorId])
REFERENCES [extension].[TitleIProgramStaffCategoryDescriptor] ([TitleIProgramStaffCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationAssignmentAssociationExtension_TitleIProgramStaffCategoryDescriptor]
ON [extension].[StaffEducationOrganizationAssignmentAssociationExtension] ([TitleIProgramStaffCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentExtension_NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor] FOREIGN KEY ([NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId])
REFERENCES [extension].[NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor] ([NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentExtension_NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor]
ON [extension].[StudentExtension] ([NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentExtension_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[TitleIProgramStaffCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_TitleIProgramStaffCategoryDescriptor_Descriptor] FOREIGN KEY ([TitleIProgramStaffCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[VirtualSchoolStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_VirtualSchoolStatusDescriptor_Descriptor] FOREIGN KEY ([VirtualSchoolStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

-- Extended Properties [extension].[BehaviorTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An extension of the Behavior Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'BehaviorTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'BehaviorTypeDescriptor', @level2type=N'COLUMN', @level2name=N'BehaviorTypeDescriptorId'
GO

-- Extended Properties [extension].[CedsLocalEducationAgency] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity extends LocalEducationAgency to contain elements necessary for loading Generate.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency by the State Education Agency (SEA).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'CedsLocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The classification of education agencies within the geographic boundaries of a state according to the level of administrative and operational control.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency by the State Education Agency (SEA).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO

-- Extended Properties [extension].[CedsSchool] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an extension of edfi.School.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency by the State Education Agency (SEA).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'CedsSchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The classification of participation by a school in the National School Lunch Program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'NationalSchoolLunchProgramStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that the school was restructured, transformed or otherwise changed as a consequence of the state''s accountability system under ESEA or as a result of School Improvement Grants (SIG).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'ReconstitutedStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that a school offers career and technical education or other educational services in which some or all students are enrolled at a separate school of record and attend the shared-time school on a part-time basis.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'SharedTimeIndicatorDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the extent to which a public school offers instruction in which students and teachers are separated by time and/or location, and interaction occurs via computers and/or telecommunications technologies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'VirtualSchoolStatusDescriptorId'
GO

-- Extended Properties [extension].[CedsStudentMigrantEducationProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity extends the StudentMigrantEducationProgramAssociation to provide additional elements needed for the population of Generate.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education agency by the State Education Agency (SEA).  Also known as the State LEA ID.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education agency by the State Education Agency (SEA).  Also known as the State LEA ID.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of school/migrant education program in which instruction and/or support services are provided.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'MigrantEducationProgramEnrollmentTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of services received by participating migrant students in the migrant education program (MEP).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'MigrantEducationProgramServicesTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The qualifying arrival date (QAD) is the month, date, and year that the child completed a move with his or her parent to enable the parent to find qualifying employment. In some cases, the child and worker may not always move together, in which case the QAD would be the date that the child joins the worker who has already moved, or the date the worker joins the child who has already moved. The QAD is the date the child''s eligibility for the Migrant Education Program begins.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'MigrantStudentQualifyingArrivalDate'
GO

-- Extended Properties [extension].[DisciplineTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An extension of the Discipline Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineTypeDescriptor', @level2type=N'COLUMN', @level2name=N'DisciplineTypeDescriptorId'
GO

-- Extended Properties [extension].[EducationOrganizationFederalFunding] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents funding for the organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education agency by the State Education Agency (SEA).  Also known as the State LEA ID.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Federal Program Code as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'FederalProgramCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Federal Programs Funding Allocation as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'FederalProgramsFundingAllocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Parent Involvement Reservation Funds as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'ParentalInvolvmementReservationFunds'
GO

-- Extended Properties [extension].[LocalEducationAgencyTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Local Education Agency Type as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTypeDescriptor', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyTypeDescriptorId'
GO

-- Extended Properties [extension].[MigrantEducationProgramEnrollmentTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Migrant Education Program Enrollment Type as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MigrantEducationProgramEnrollmentTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MigrantEducationProgramEnrollmentTypeDescriptor', @level2type=N'COLUMN', @level2name=N'MigrantEducationProgramEnrollmentTypeDescriptorId'
GO

-- Extended Properties [extension].[MigrantEducationProgramServicesTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Migrant Education Program Services Type as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MigrantEducationProgramServicesTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MigrantEducationProgramServicesTypeDescriptor', @level2type=N'COLUMN', @level2name=N'MigrantEducationProgramServicesTypeDescriptorId'
GO

-- Extended Properties [extension].[NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the National School Lunch Program Direct Certification Indicator as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor', @level2type=N'COLUMN', @level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId'
GO

-- Extended Properties [extension].[NationalSchoolLunchProgramStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the National School Lunch Program Status as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NationalSchoolLunchProgramStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NationalSchoolLunchProgramStatusDescriptor', @level2type=N'COLUMN', @level2name=N'NationalSchoolLunchProgramStatusDescriptorId'
GO

-- Extended Properties [extension].[ReconstitutedStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the ReconstitutedStatus of a school as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ReconstitutedStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ReconstitutedStatusDescriptor', @level2type=N'COLUMN', @level2name=N'ReconstitutedStatusDescriptorId'
GO

-- Extended Properties [extension].[SharedTimeIndicatorDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the School Shared Time Indicator as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SharedTimeIndicatorDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SharedTimeIndicatorDescriptor', @level2type=N'COLUMN', @level2name=N'SharedTimeIndicatorDescriptorId'
GO

-- Extended Properties [extension].[SpecialEducationAgeGroupTaughtDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Special Education Age Group Taught as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SpecialEducationAgeGroupTaughtDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SpecialEducationAgeGroupTaughtDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEducationAgeGroupTaughtDescriptorId'
GO

-- Extended Properties [extension].[SpecialEducationSupportServicesCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Special Education Support Services Category as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SpecialEducationSupportServicesCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SpecialEducationSupportServicesCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEducationSupportServicesCategoryDescriptorId'
GO

-- Extended Properties [extension].[StaffEducationOrganizationAssignmentAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the start or effective date of a staff member''s employment, contract, or relationship with the LEA.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education agency by the State Education Agency (SEA).  Also known as the State LEA ID.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The titles of employment, official status, or rank of education staff.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'StaffClassificationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Special Education Age Group Taught as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'SpecialEducationAgeGroupTaughtDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Special Education Support Services Category as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'SpecialEducationSupportServicesCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Title I Program Staff Category as defined in CEDS', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'TitleIProgramStaffCategoryDescriptorId'
GO

-- Extended Properties [extension].[StudentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the student''s National School Lunch Program (NSLP) eligibility has been determined through direct certification.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId'
GO

-- Extended Properties [extension].[TitleIProgramStaffCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Title I Program Staff Category as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TitleIProgramStaffCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TitleIProgramStaffCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'TitleIProgramStaffCategoryDescriptorId'
GO

-- Extended Properties [extension].[VirtualSchoolStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Virtual School Status as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'VirtualSchoolStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'VirtualSchoolStatusDescriptor', @level2type=N'COLUMN', @level2name=N'VirtualSchoolStatusDescriptorId'
GO

