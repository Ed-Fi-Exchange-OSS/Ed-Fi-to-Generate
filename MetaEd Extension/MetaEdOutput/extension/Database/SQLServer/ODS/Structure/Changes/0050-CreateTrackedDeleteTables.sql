-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TABLE [changes].[extension_BehaviorTypeDescriptor_TrackedDelete]
(
       BehaviorTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_BehaviorTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsLocalEducationAgency_TrackedDelete]
(
       CedsLocalEducationAgencyId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsLocalEducationAgency_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsSchoolAccountability_TrackedDelete]
(
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsSchoolAccountability_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsSchoolComprehensiveAndTargetedSupport_TrackedDelete]
(
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsSchoolComprehensiveAndTargetedSupport_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsSchoolCustomIndicatorStatusType_TrackedDelete]
(
       IndicatorStatusDescriptorId [INT] NOT NULL,
       IndicatorStatusSubgroupDescriptorId [INT] NOT NULL,
       IndicatorStatusSubgroupTypeDescriptorId [INT] NOT NULL,
       IndicatorStatusTypeDescriptorId [INT] NOT NULL,
       SchoolId [INT] NOT NULL,
       StatedDefinedCustomIndicatorStatusType [NVARCHAR](100) NOT NULL,
       StatedDefinedIndicatorStatus [NVARCHAR](100) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsSchoolCustomIndicatorStatusType_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsSchoolIndicatorStatus_TrackedDelete]
(
       IndicatorStatusDescriptorId [INT] NOT NULL,
       IndicatorStatusSubgroupDescriptorId [INT] NOT NULL,
       IndicatorStatusSubgroupTypeDescriptorId [INT] NOT NULL,
       IndicatorStatusTypeDescriptorId [INT] NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsSchoolIndicatorStatus_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsSchoolStatus_TrackedDelete]
(
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsSchoolStatus_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsSchool_TrackedDelete]
(
       CedsSchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsSchool_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsSpecialEducationStaffCategory_TrackedDelete]
(
       SchoolId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsSpecialEducationStaffCategory_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsStudentAssessment_TrackedDelete]
(
       AcademicSubjectDescriptorId [INT] NOT NULL,
       AdministrationDate [DATE] NOT NULL,
       AssessedGradeLevelDescriptorId [INT] NOT NULL,
       CedsAssessmentTitle [NVARCHAR](60) NOT NULL,
       CedsAssessmentVersion [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsStudentAssessment_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsStudentCTEProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsStudentCTEProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsStudentHomelessProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       CedsProgramName [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsStudentHomelessProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsStudentMigrantEducationProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsStudentMigrantEducationProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CedsStudentNoDProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CedsStudentNoDProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CharterContract_TrackedDelete]
(
       ContractIdentifier [NVARCHAR](20) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CharterContract_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CharterSchoolApprovalAgency_TrackedDelete]
(
       CharterSchoolApprovalAgencyId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CharterSchoolApprovalAgency_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_CharterSchoolManagementOrganizationTypeDescriptor_TrackedDelete]
(
       CharterSchoolManagementOrganizationTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_CharterSchoolManagementOrganizationTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_ComprehensiveAndTargetedSupportDescriptor_TrackedDelete]
(
       ComprehensiveAndTargetedSupportDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_ComprehensiveAndTargetedSupportDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_ComprehensiveSupportDescriptor_TrackedDelete]
(
       ComprehensiveSupportDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_ComprehensiveSupportDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_DisciplineActionDiscipline_TrackedDelete]
(
       CedsDisciplineActionIdentifier [NVARCHAR](20) NOT NULL,
       DisciplineDate [DATE] NOT NULL,
       DisciplineDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_DisciplineActionDiscipline_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_DisciplineMethodFirearmDescriptor_TrackedDelete]
(
       DisciplineMethodFirearmDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_DisciplineMethodFirearmDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_DisciplineTypeDescriptor_TrackedDelete]
(
       DisciplineTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_DisciplineTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_DisplacementTypeDescriptor_TrackedDelete]
(
       DisplacementTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_DisplacementTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_EducationOrganizationFederalFunding_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_EducationOrganizationFederalFunding_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_EmergencyorProvisionalCredentialStatusDescriptor_TrackedDelete]
(
       EmergencyorProvisionalCredentialStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_EmergencyorProvisionalCredentialStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_FederalProgramFundingAllocationTypeDescriptor_TrackedDelete]
(
       FederalProgramFundingAllocationTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_FederalProgramFundingAllocationTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_IDEADisciplineMethodFirearmDescriptor_TrackedDelete]
(
       IDEADisciplineMethodFirearmDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_IDEADisciplineMethodFirearmDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_IdeaInterimRemovalReasonDescriptor_TrackedDelete]
(
       IdeaInterimRemovalReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_IdeaInterimRemovalReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_IdeaInterimRemovalTypeDescriptor_TrackedDelete]
(
       IdeaInterimRemovalTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_IdeaInterimRemovalTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_IndicatorStatusDescriptor_TrackedDelete]
(
       IndicatorStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_IndicatorStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_IndicatorStatusSubgroupDescriptor_TrackedDelete]
(
       IndicatorStatusSubgroupDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_IndicatorStatusSubgroupDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_IndicatorStatusSubgroupTypeDescriptor_TrackedDelete]
(
       IndicatorStatusSubgroupTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_IndicatorStatusSubgroupTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_IndicatorStatusTypeDescriptor_TrackedDelete]
(
       IndicatorStatusTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_IndicatorStatusTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_InexperiencedStatusDescriptor_TrackedDelete]
(
       InexperiencedStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_InexperiencedStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_K12LeaTitleISupportServiceDescriptor_TrackedDelete]
(
       K12LeaTitleISupportServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_K12LeaTitleISupportServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_LocalEducationAgencyTypeDescriptor_TrackedDelete]
(
       LocalEducationAgencyTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_LocalEducationAgencyTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_MepProjectTypeDescriptor_TrackedDelete]
(
       MepProjectTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_MepProjectTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_MigrantEducationProgramEnrollmentTypeDescriptor_TrackedDelete]
(
       MigrantEducationProgramEnrollmentTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_MigrantEducationProgramEnrollmentTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_MigrantEducationProgramServicesTypeDescriptor_TrackedDelete]
(
       MigrantEducationProgramServicesTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_MigrantEducationProgramServicesTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor_TrackedDelete]
(
       NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_NationalSchoolLunchProgramDirectCertificationIndicatorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_NationalSchoolLunchProgramStatusDescriptor_TrackedDelete]
(
       NationalSchoolLunchProgramStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_NationalSchoolLunchProgramStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_OutOfFieldStatusDescriptor_TrackedDelete]
(
       OutOfFieldStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_OutOfFieldStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_ParaprofessionalQualificationDescriptor_TrackedDelete]
(
       ParaprofessionalQualificationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_ParaprofessionalQualificationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_PerkinsLEPStatusDescriptor_TrackedDelete]
(
       PerkinsLEPStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_PerkinsLEPStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor_TrackedDelete]
(
       ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_REAPAlternativeFundingStatusDescriptor_TrackedDelete]
(
       REAPAlternativeFundingStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_REAPAlternativeFundingStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_ReconstitutedStatusDescriptor_TrackedDelete]
(
       ReconstitutedStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_ReconstitutedStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_SchoolDangerousStatusDescriptor_TrackedDelete]
(
       SchoolDangerousStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_SchoolDangerousStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_SchoolFederalFunds_TrackedDelete]
(
       FiscalYear [INT] NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_SchoolFederalFunds_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_SharedTimeIndicatorDescriptor_TrackedDelete]
(
       SharedTimeIndicatorDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_SharedTimeIndicatorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_SpecialEducationAgeGroupTaughtDescriptor_TrackedDelete]
(
       SpecialEducationAgeGroupTaughtDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_SpecialEducationAgeGroupTaughtDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_SpecialEducationSupportServicesCategoryDescriptor_TrackedDelete]
(
       SpecialEducationSupportServicesCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_SpecialEducationSupportServicesCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_StateDefinedCustomIndicatorStatusTypeDescriptor_TrackedDelete]
(
       StateDefinedCustomIndicatorStatusTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_StateDefinedCustomIndicatorStatusTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_StateDefinedCustomIndicator_TrackedDelete]
(
       SchoolYear [INT] NOT NULL,
       StatedDefinedCustomIndicatorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_StateDefinedCustomIndicator_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_StateDefinedIndicator_TrackedDelete]
(
       SchoolYear [INT] NOT NULL,
       StatedDefinedCustomIndicatorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_StateDefinedIndicator_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_StatePovertyDesignationDescriptor_TrackedDelete]
(
       StatePovertyDesignationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_StatePovertyDesignationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_TargetedSupportDescriptor_TrackedDelete]
(
       TargetedSupportDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_TargetedSupportDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_TitleIProgramStaffCategoryDescriptor_TrackedDelete]
(
       TitleIProgramStaffCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_TitleIProgramStaffCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_TitleIProgramTypeDescriptor_TrackedDelete]
(
       TitleIProgramTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_TitleIProgramTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_TitleIinstructionalServiceDescriptor_TrackedDelete]
(
       TitleIinstructionalServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_TitleIinstructionalServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[extension_VirtualSchoolStatusDescriptor_TrackedDelete]
(
       VirtualSchoolStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_extension_VirtualSchoolStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

