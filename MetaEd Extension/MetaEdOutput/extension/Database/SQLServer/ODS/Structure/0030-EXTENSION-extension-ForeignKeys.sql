-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE [extension].[BehaviorTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_BehaviorTypeDescriptor_Descriptor] FOREIGN KEY ([BehaviorTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[CedsLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_CedsLocalEducationAgency_K12LeaTitleISupportServiceDescriptor] FOREIGN KEY ([K12LeaTitleISupportServiceDescriptorId])
REFERENCES [extension].[K12LeaTitleISupportServiceDescriptor] ([K12LeaTitleISupportServiceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsLocalEducationAgency_K12LeaTitleISupportServiceDescriptor]
ON [extension].[CedsLocalEducationAgency] ([K12LeaTitleISupportServiceDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_CedsLocalEducationAgency_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsLocalEducationAgency_LocalEducationAgency]
ON [extension].[CedsLocalEducationAgency] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [extension].[CedsLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_CedsLocalEducationAgency_LocalEducationAgencyCategoryDescriptor] FOREIGN KEY ([LocalEducationAgencyCategoryDescriptorId])
REFERENCES [edfi].[LocalEducationAgencyCategoryDescriptor] ([LocalEducationAgencyCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsLocalEducationAgency_LocalEducationAgencyCategoryDescriptor]
ON [extension].[CedsLocalEducationAgency] ([LocalEducationAgencyCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_CedsLocalEducationAgency_MepProjectTypeDescriptor] FOREIGN KEY ([MepProjectTypeDescriptorId])
REFERENCES [extension].[MepProjectTypeDescriptor] ([MepProjectTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsLocalEducationAgency_MepProjectTypeDescriptor]
ON [extension].[CedsLocalEducationAgency] ([MepProjectTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_CedsLocalEducationAgency_TitleIinstructionalServiceDescriptor] FOREIGN KEY ([TitleIinstructionalServiceDescriptorId])
REFERENCES [extension].[TitleIinstructionalServiceDescriptor] ([TitleIinstructionalServiceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsLocalEducationAgency_TitleIinstructionalServiceDescriptor]
ON [extension].[CedsLocalEducationAgency] ([TitleIinstructionalServiceDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_CedsLocalEducationAgency_TitleIProgramTypeDescriptor] FOREIGN KEY ([TitleIProgramTypeDescriptorId])
REFERENCES [extension].[TitleIProgramTypeDescriptor] ([TitleIProgramTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsLocalEducationAgency_TitleIProgramTypeDescriptor]
ON [extension].[CedsLocalEducationAgency] ([TitleIProgramTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchool] WITH CHECK ADD CONSTRAINT [FK_CedsSchool_CharterContract] FOREIGN KEY ([ContractIdentifier])
REFERENCES [extension].[CharterContract] ([ContractIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchool_CharterContract]
ON [extension].[CedsSchool] ([ContractIdentifier] ASC)
GO

ALTER TABLE [extension].[CedsSchool] WITH CHECK ADD CONSTRAINT [FK_CedsSchool_MepProjectTypeDescriptor] FOREIGN KEY ([MepProjectTypeDescriptorId])
REFERENCES [extension].[MepProjectTypeDescriptor] ([MepProjectTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchool_MepProjectTypeDescriptor]
ON [extension].[CedsSchool] ([MepProjectTypeDescriptorId] ASC)
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

ALTER TABLE [extension].[CedsSchool] WITH CHECK ADD CONSTRAINT [FK_CedsSchool_StatePovertyDesignationDescriptor] FOREIGN KEY ([StatePovertyDesignationDescriptorId])
REFERENCES [extension].[StatePovertyDesignationDescriptor] ([StatePovertyDesignationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchool_StatePovertyDesignationDescriptor]
ON [extension].[CedsSchool] ([StatePovertyDesignationDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchool] WITH CHECK ADD CONSTRAINT [FK_CedsSchool_VirtualSchoolStatusDescriptor] FOREIGN KEY ([VirtualSchoolStatusDescriptorId])
REFERENCES [extension].[VirtualSchoolStatusDescriptor] ([VirtualSchoolStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchool_VirtualSchoolStatusDescriptor]
ON [extension].[CedsSchool] ([VirtualSchoolStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolAccountability] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolAccountability_GunFreeSchoolsActReportingStatusDescriptor] FOREIGN KEY ([GunFreeSchoolsActReportingStatusDescriptorId])
REFERENCES [edfi].[GunFreeSchoolsActReportingStatusDescriptor] ([GunFreeSchoolsActReportingStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolAccountability_GunFreeSchoolsActReportingStatusDescriptor]
ON [extension].[CedsSchoolAccountability] ([GunFreeSchoolsActReportingStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolComprehensiveAndTargetedSupport] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolComprehensiveAndTargetedSupport_ComprehensiveAndTargetedSupportDescriptor] FOREIGN KEY ([ComprehensiveAndTargetedSupportDescriptorId])
REFERENCES [extension].[ComprehensiveAndTargetedSupportDescriptor] ([ComprehensiveAndTargetedSupportDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolComprehensiveAndTargetedSupport_ComprehensiveAndTargetedSupportDescriptor]
ON [extension].[CedsSchoolComprehensiveAndTargetedSupport] ([ComprehensiveAndTargetedSupportDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolComprehensiveAndTargetedSupport] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolComprehensiveAndTargetedSupport_ComprehensiveSupportDescriptor] FOREIGN KEY ([ComprehensiveSupportDescriptorId])
REFERENCES [extension].[ComprehensiveSupportDescriptor] ([ComprehensiveSupportDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolComprehensiveAndTargetedSupport_ComprehensiveSupportDescriptor]
ON [extension].[CedsSchoolComprehensiveAndTargetedSupport] ([ComprehensiveSupportDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolComprehensiveAndTargetedSupport] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolComprehensiveAndTargetedSupport_TargetedSupportDescriptor] FOREIGN KEY ([TargetedSupportDescriptorId])
REFERENCES [extension].[TargetedSupportDescriptor] ([TargetedSupportDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolComprehensiveAndTargetedSupport_TargetedSupportDescriptor]
ON [extension].[CedsSchoolComprehensiveAndTargetedSupport] ([TargetedSupportDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolCustomIndicatorStatusType] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolCustomIndicatorStatusType_IndicatorStatusDescriptor] FOREIGN KEY ([IndicatorStatusDescriptorId])
REFERENCES [extension].[IndicatorStatusDescriptor] ([IndicatorStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolCustomIndicatorStatusType_IndicatorStatusDescriptor]
ON [extension].[CedsSchoolCustomIndicatorStatusType] ([IndicatorStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolCustomIndicatorStatusType] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolCustomIndicatorStatusType_IndicatorStatusSubgroupDescriptor] FOREIGN KEY ([IndicatorStatusSubgroupDescriptorId])
REFERENCES [extension].[IndicatorStatusSubgroupDescriptor] ([IndicatorStatusSubgroupDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolCustomIndicatorStatusType_IndicatorStatusSubgroupDescriptor]
ON [extension].[CedsSchoolCustomIndicatorStatusType] ([IndicatorStatusSubgroupDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolCustomIndicatorStatusType] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolCustomIndicatorStatusType_IndicatorStatusSubgroupTypeDescriptor] FOREIGN KEY ([IndicatorStatusSubgroupTypeDescriptorId])
REFERENCES [extension].[IndicatorStatusSubgroupTypeDescriptor] ([IndicatorStatusSubgroupTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolCustomIndicatorStatusType_IndicatorStatusSubgroupTypeDescriptor]
ON [extension].[CedsSchoolCustomIndicatorStatusType] ([IndicatorStatusSubgroupTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolCustomIndicatorStatusType] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolCustomIndicatorStatusType_IndicatorStatusTypeDescriptor] FOREIGN KEY ([IndicatorStatusTypeDescriptorId])
REFERENCES [extension].[IndicatorStatusTypeDescriptor] ([IndicatorStatusTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolCustomIndicatorStatusType_IndicatorStatusTypeDescriptor]
ON [extension].[CedsSchoolCustomIndicatorStatusType] ([IndicatorStatusTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolIndicatorStatus] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolIndicatorStatus_IndicatorStatusDescriptor] FOREIGN KEY ([IndicatorStatusDescriptorId])
REFERENCES [extension].[IndicatorStatusDescriptor] ([IndicatorStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolIndicatorStatus_IndicatorStatusDescriptor]
ON [extension].[CedsSchoolIndicatorStatus] ([IndicatorStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolIndicatorStatus] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolIndicatorStatus_IndicatorStatusSubgroupDescriptor] FOREIGN KEY ([IndicatorStatusSubgroupDescriptorId])
REFERENCES [extension].[IndicatorStatusSubgroupDescriptor] ([IndicatorStatusSubgroupDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolIndicatorStatus_IndicatorStatusSubgroupDescriptor]
ON [extension].[CedsSchoolIndicatorStatus] ([IndicatorStatusSubgroupDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolIndicatorStatus] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolIndicatorStatus_IndicatorStatusSubgroupTypeDescriptor] FOREIGN KEY ([IndicatorStatusSubgroupTypeDescriptorId])
REFERENCES [extension].[IndicatorStatusSubgroupTypeDescriptor] ([IndicatorStatusSubgroupTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolIndicatorStatus_IndicatorStatusSubgroupTypeDescriptor]
ON [extension].[CedsSchoolIndicatorStatus] ([IndicatorStatusSubgroupTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolIndicatorStatus] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolIndicatorStatus_IndicatorStatusTypeDescriptor] FOREIGN KEY ([IndicatorStatusTypeDescriptorId])
REFERENCES [extension].[IndicatorStatusTypeDescriptor] ([IndicatorStatusTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolIndicatorStatus_IndicatorStatusTypeDescriptor]
ON [extension].[CedsSchoolIndicatorStatus] ([IndicatorStatusTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolStatus] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolStatus_ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor] FOREIGN KEY ([ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId])
REFERENCES [extension].[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor] ([ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolStatus_ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor]
ON [extension].[CedsSchoolStatus] ([ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSchoolStatus] WITH CHECK ADD CONSTRAINT [FK_CedsSchoolStatus_SchoolDangerousStatusDescriptor] FOREIGN KEY ([SchoolDangerousStatusDescriptorId])
REFERENCES [extension].[SchoolDangerousStatusDescriptor] ([SchoolDangerousStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSchoolStatus_SchoolDangerousStatusDescriptor]
ON [extension].[CedsSchoolStatus] ([SchoolDangerousStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsSpecialEducationStaffCategory] WITH CHECK ADD CONSTRAINT [FK_CedsSpecialEducationStaffCategory_SpecialEducationProgramServiceDescriptor] FOREIGN KEY ([SpecialEducationProgramServiceDescriptorId])
REFERENCES [edfi].[SpecialEducationProgramServiceDescriptor] ([SpecialEducationProgramServiceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsSpecialEducationStaffCategory_SpecialEducationProgramServiceDescriptor]
ON [extension].[CedsSpecialEducationStaffCategory] ([SpecialEducationProgramServiceDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsStudentCTEProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CedsStudentCTEProgramAssociation_DisplacementTypeDescriptor] FOREIGN KEY ([DisplacementTypeDescriptorId])
REFERENCES [extension].[DisplacementTypeDescriptor] ([DisplacementTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsStudentCTEProgramAssociation_DisplacementTypeDescriptor]
ON [extension].[CedsStudentCTEProgramAssociation] ([DisplacementTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsStudentCTEProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CedsStudentCTEProgramAssociation_PerkinsLEPStatusDescriptor] FOREIGN KEY ([PerkinsLEPStatusDescriptorId])
REFERENCES [extension].[PerkinsLEPStatusDescriptor] ([PerkinsLEPStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsStudentCTEProgramAssociation_PerkinsLEPStatusDescriptor]
ON [extension].[CedsStudentCTEProgramAssociation] ([PerkinsLEPStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsStudentMigrantEducationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CedsStudentMigrantEducationProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[CedsStudentMigrantEducationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CedsStudentMigrantEducationProgramAssociation_MigrantEducationProgramEnrollmentTypeDescriptor] FOREIGN KEY ([MigrantEducationProgramEnrollmentTypeDescriptorId])
REFERENCES [extension].[MigrantEducationProgramEnrollmentTypeDescriptor] ([MigrantEducationProgramEnrollmentTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsStudentMigrantEducationProgramAssociation_MigrantEducationProgramEnrollmentTypeDescriptor]
ON [extension].[CedsStudentMigrantEducationProgramAssociation] ([MigrantEducationProgramEnrollmentTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CedsStudentNoDProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CedsStudentNoDProgramAssociation_DisplacementTypeDescriptor] FOREIGN KEY ([DisplacementTypeDescriptorId])
REFERENCES [extension].[DisplacementTypeDescriptor] ([DisplacementTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CedsStudentNoDProgramAssociation_DisplacementTypeDescriptor]
ON [extension].[CedsStudentNoDProgramAssociation] ([DisplacementTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CharterSchoolApprovalAgency] WITH CHECK ADD CONSTRAINT [FK_CharterSchoolApprovalAgency_CharterApprovalAgencyTypeDescriptor] FOREIGN KEY ([CharterApprovalAgencyTypeDescriptorId])
REFERENCES [edfi].[CharterApprovalAgencyTypeDescriptor] ([CharterApprovalAgencyTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CharterSchoolApprovalAgency_CharterApprovalAgencyTypeDescriptor]
ON [extension].[CharterSchoolApprovalAgency] ([CharterApprovalAgencyTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CharterSchoolManagementOrganizationTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_CharterSchoolManagementOrganizationTypeDescriptor_Descriptor] FOREIGN KEY ([CharterSchoolManagementOrganizationTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ComprehensiveAndTargetedSupportDescriptor] WITH CHECK ADD CONSTRAINT [FK_ComprehensiveAndTargetedSupportDescriptor_Descriptor] FOREIGN KEY ([ComprehensiveAndTargetedSupportDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ComprehensiveSupportDescriptor] WITH CHECK ADD CONSTRAINT [FK_ComprehensiveSupportDescriptor_Descriptor] FOREIGN KEY ([ComprehensiveSupportDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[DisciplineActionDiscipline] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionDiscipline_IdeaInterimRemovalReasonDescriptor] FOREIGN KEY ([IdeaInterimRemovalReasonDescriptorId])
REFERENCES [extension].[IdeaInterimRemovalReasonDescriptor] ([IdeaInterimRemovalReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineActionDiscipline_IdeaInterimRemovalReasonDescriptor]
ON [extension].[DisciplineActionDiscipline] ([IdeaInterimRemovalReasonDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineActionDiscipline] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionDiscipline_IdeaInterimRemovalTypeDescriptor] FOREIGN KEY ([IdeaInterimRemovalTypeDescriptorId])
REFERENCES [extension].[IdeaInterimRemovalTypeDescriptor] ([IdeaInterimRemovalTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineActionDiscipline_IdeaInterimRemovalTypeDescriptor]
ON [extension].[DisciplineActionDiscipline] ([IdeaInterimRemovalTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineMethodFirearmDescriptor] WITH CHECK ADD CONSTRAINT [FK_DisciplineMethodFirearmDescriptor_Descriptor] FOREIGN KEY ([DisciplineMethodFirearmDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[DisciplineTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_DisciplineTypeDescriptor_Descriptor] FOREIGN KEY ([DisciplineTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[DisplacementTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_DisplacementTypeDescriptor_Descriptor] FOREIGN KEY ([DisplacementTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[EducationOrganizationFederalFunding] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFederalFunding_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[EducationOrganizationFederalFunding] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFederalFunding_FederalProgramFundingAllocationTypeDescriptor] FOREIGN KEY ([FederalProgramFundingAllocationTypeDescriptorId])
REFERENCES [extension].[FederalProgramFundingAllocationTypeDescriptor] ([FederalProgramFundingAllocationTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationFederalFunding_FederalProgramFundingAllocationTypeDescriptor]
ON [extension].[EducationOrganizationFederalFunding] ([FederalProgramFundingAllocationTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[EducationOrganizationFederalFunding] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFederalFunding_REAPAlternativeFundingStatusDescriptor] FOREIGN KEY ([REAPAlternativeFundingStatusDescriptorId])
REFERENCES [extension].[REAPAlternativeFundingStatusDescriptor] ([REAPAlternativeFundingStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationFederalFunding_REAPAlternativeFundingStatusDescriptor]
ON [extension].[EducationOrganizationFederalFunding] ([REAPAlternativeFundingStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[EducationOrganizationNetworkExtension] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationNetworkExtension_CharterSchoolManagementOrganizationTypeDescriptor] FOREIGN KEY ([CharterSchoolManagementOrganizationTypeDescriptorId])
REFERENCES [extension].[CharterSchoolManagementOrganizationTypeDescriptor] ([CharterSchoolManagementOrganizationTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationNetworkExtension_CharterSchoolManagementOrganizationTypeDescriptor]
ON [extension].[EducationOrganizationNetworkExtension] ([CharterSchoolManagementOrganizationTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[EducationOrganizationNetworkExtension] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationNetworkExtension_EducationOrganizationNetwork] FOREIGN KEY ([EducationOrganizationNetworkId])
REFERENCES [edfi].[EducationOrganizationNetwork] ([EducationOrganizationNetworkId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[EmergencyorProvisionalCredentialStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_EmergencyorProvisionalCredentialStatusDescriptor_Descriptor] FOREIGN KEY ([EmergencyorProvisionalCredentialStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[FederalProgramFundingAllocationTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_FederalProgramFundingAllocationTypeDescriptor_Descriptor] FOREIGN KEY ([FederalProgramFundingAllocationTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IDEADisciplineMethodFirearmDescriptor] WITH CHECK ADD CONSTRAINT [FK_IDEADisciplineMethodFirearmDescriptor_Descriptor] FOREIGN KEY ([IDEADisciplineMethodFirearmDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IdeaInterimRemovalReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_IdeaInterimRemovalReasonDescriptor_Descriptor] FOREIGN KEY ([IdeaInterimRemovalReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IdeaInterimRemovalTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_IdeaInterimRemovalTypeDescriptor_Descriptor] FOREIGN KEY ([IdeaInterimRemovalTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IndicatorStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_IndicatorStatusDescriptor_Descriptor] FOREIGN KEY ([IndicatorStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IndicatorStatusSubgroupDescriptor] WITH CHECK ADD CONSTRAINT [FK_IndicatorStatusSubgroupDescriptor_Descriptor] FOREIGN KEY ([IndicatorStatusSubgroupDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IndicatorStatusSubgroupTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_IndicatorStatusSubgroupTypeDescriptor_Descriptor] FOREIGN KEY ([IndicatorStatusSubgroupTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IndicatorStatusTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_IndicatorStatusTypeDescriptor_Descriptor] FOREIGN KEY ([IndicatorStatusTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[InexperiencedStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_InexperiencedStatusDescriptor_Descriptor] FOREIGN KEY ([InexperiencedStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[K12LeaTitleISupportServiceDescriptor] WITH CHECK ADD CONSTRAINT [FK_K12LeaTitleISupportServiceDescriptor_Descriptor] FOREIGN KEY ([K12LeaTitleISupportServiceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[LocalEducationAgencyTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyTypeDescriptor_Descriptor] FOREIGN KEY ([LocalEducationAgencyTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[MepProjectTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_MepProjectTypeDescriptor_Descriptor] FOREIGN KEY ([MepProjectTypeDescriptorId])
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

ALTER TABLE [extension].[OutOfFieldStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_OutOfFieldStatusDescriptor_Descriptor] FOREIGN KEY ([OutOfFieldStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ParaprofessionalQualificationDescriptor] WITH CHECK ADD CONSTRAINT [FK_ParaprofessionalQualificationDescriptor_Descriptor] FOREIGN KEY ([ParaprofessionalQualificationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[PerkinsLEPStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_PerkinsLEPStatusDescriptor_Descriptor] FOREIGN KEY ([PerkinsLEPStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor_Descriptor] FOREIGN KEY ([ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[REAPAlternativeFundingStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_REAPAlternativeFundingStatusDescriptor_Descriptor] FOREIGN KEY ([REAPAlternativeFundingStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ReconstitutedStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_ReconstitutedStatusDescriptor_Descriptor] FOREIGN KEY ([ReconstitutedStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[SchoolDangerousStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_SchoolDangerousStatusDescriptor_Descriptor] FOREIGN KEY ([SchoolDangerousStatusDescriptorId])
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

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_EmergencyorProvisionalCredentialStatusDescriptor] FOREIGN KEY ([EmergencyorProvisionalCredentialStatusDescriptorId])
REFERENCES [extension].[EmergencyorProvisionalCredentialStatusDescriptor] ([EmergencyorProvisionalCredentialStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationAssignmentAssociationExtension_EmergencyorProvisionalCredentialStatusDescriptor]
ON [extension].[StaffEducationOrganizationAssignmentAssociationExtension] ([EmergencyorProvisionalCredentialStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_InexperiencedStatusDescriptor] FOREIGN KEY ([InexperiencedStatusDescriptorId])
REFERENCES [extension].[InexperiencedStatusDescriptor] ([InexperiencedStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationAssignmentAssociationExtension_InexperiencedStatusDescriptor]
ON [extension].[StaffEducationOrganizationAssignmentAssociationExtension] ([InexperiencedStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_OutOfFieldStatusDescriptor] FOREIGN KEY ([OutOfFieldStatusDescriptorId])
REFERENCES [extension].[OutOfFieldStatusDescriptor] ([OutOfFieldStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationAssignmentAssociationExtension_OutOfFieldStatusDescriptor]
ON [extension].[StaffEducationOrganizationAssignmentAssociationExtension] ([OutOfFieldStatusDescriptorId] ASC)
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

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_StaffEducationOrganizationAssignmentAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
REFERENCES [edfi].[StaffEducationOrganizationAssignmentAssociation] ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_TitleIProgramStaffCategoryDescriptor] FOREIGN KEY ([TitleIProgramStaffCategoryDescriptorId])
REFERENCES [extension].[TitleIProgramStaffCategoryDescriptor] ([TitleIProgramStaffCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationAssignmentAssociationExtension_TitleIProgramStaffCategoryDescriptor]
ON [extension].[StaffEducationOrganizationAssignmentAssociationExtension] ([TitleIProgramStaffCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[StateDefinedCustomIndicatorStatusTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_StateDefinedCustomIndicatorStatusTypeDescriptor_Descriptor] FOREIGN KEY ([StateDefinedCustomIndicatorStatusTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StatePovertyDesignationDescriptor] WITH CHECK ADD CONSTRAINT [FK_StatePovertyDesignationDescriptor_Descriptor] FOREIGN KEY ([StatePovertyDesignationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
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

ALTER TABLE [extension].[TargetedSupportDescriptor] WITH CHECK ADD CONSTRAINT [FK_TargetedSupportDescriptor_Descriptor] FOREIGN KEY ([TargetedSupportDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[TitleIinstructionalServiceDescriptor] WITH CHECK ADD CONSTRAINT [FK_TitleIinstructionalServiceDescriptor_Descriptor] FOREIGN KEY ([TitleIinstructionalServiceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[TitleIProgramStaffCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_TitleIProgramStaffCategoryDescriptor_Descriptor] FOREIGN KEY ([TitleIProgramStaffCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[TitleIProgramTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_TitleIProgramTypeDescriptor_Descriptor] FOREIGN KEY ([TitleIProgramTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[VirtualSchoolStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_VirtualSchoolStatusDescriptor_Descriptor] FOREIGN KEY ([VirtualSchoolStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

