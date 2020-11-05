-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TABLE [changes].[edfi_AbsenceEventCategoryDescriptor_TrackedDelete]
(
       AbsenceEventCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AbsenceEventCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AcademicHonorCategoryDescriptor_TrackedDelete]
(
       AcademicHonorCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AcademicHonorCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AcademicSubjectDescriptor_TrackedDelete]
(
       AcademicSubjectDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AcademicSubjectDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AcademicWeek_TrackedDelete]
(
       SchoolId [INT] NOT NULL,
       WeekIdentifier [NVARCHAR](80) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AcademicWeek_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AccommodationDescriptor_TrackedDelete]
(
       AccommodationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AccommodationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AccountClassificationDescriptor_TrackedDelete]
(
       AccountClassificationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AccountClassificationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AccountCode_TrackedDelete]
(
       AccountClassificationDescriptorId [INT] NOT NULL,
       AccountCodeNumber [NVARCHAR](50) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AccountCode_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Account_TrackedDelete]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Account_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AccountabilityRating_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       RatingTitle [NVARCHAR](60) NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AccountabilityRating_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AchievementCategoryDescriptor_TrackedDelete]
(
       AchievementCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AchievementCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Actual_TrackedDelete]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       AsOfDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Actual_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AdditionalCreditTypeDescriptor_TrackedDelete]
(
       AdditionalCreditTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AdditionalCreditTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AddressTypeDescriptor_TrackedDelete]
(
       AddressTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AddressTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AdministrationEnvironmentDescriptor_TrackedDelete]
(
       AdministrationEnvironmentDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AdministrationEnvironmentDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AdministrativeFundingControlDescriptor_TrackedDelete]
(
       AdministrativeFundingControlDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AdministrativeFundingControlDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentCategoryDescriptor_TrackedDelete]
(
       AssessmentCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentIdentificationSystemDescriptor_TrackedDelete]
(
       AssessmentIdentificationSystemDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentItemCategoryDescriptor_TrackedDelete]
(
       AssessmentItemCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentItemCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentItemResultDescriptor_TrackedDelete]
(
       AssessmentItemResultDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentItemResultDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentItem_TrackedDelete]
(
       AssessmentIdentifier [NVARCHAR](60) NOT NULL,
       IdentificationCode [NVARCHAR](60) NOT NULL,
       Namespace [NVARCHAR](255) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentItem_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentPeriodDescriptor_TrackedDelete]
(
       AssessmentPeriodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentPeriodDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentReportingMethodDescriptor_TrackedDelete]
(
       AssessmentReportingMethodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentReportingMethodDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Assessment_TrackedDelete]
(
       AssessmentIdentifier [NVARCHAR](60) NOT NULL,
       Namespace [NVARCHAR](255) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Assessment_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AttemptStatusDescriptor_TrackedDelete]
(
       AttemptStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AttemptStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AttendanceEventCategoryDescriptor_TrackedDelete]
(
       AttendanceEventCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AttendanceEventCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_BehaviorDescriptor_TrackedDelete]
(
       BehaviorDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_BehaviorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_BellSchedule_TrackedDelete]
(
       BellScheduleName [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_BellSchedule_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Budget_TrackedDelete]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       AsOfDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Budget_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CalendarDate_TrackedDelete]
(
       CalendarCode [NVARCHAR](60) NOT NULL,
       Date [DATE] NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CalendarDate_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CalendarEventDescriptor_TrackedDelete]
(
       CalendarEventDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CalendarEventDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CalendarTypeDescriptor_TrackedDelete]
(
       CalendarTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CalendarTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Calendar_TrackedDelete]
(
       CalendarCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Calendar_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CareerPathwayDescriptor_TrackedDelete]
(
       CareerPathwayDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CareerPathwayDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CharterApprovalAgencyTypeDescriptor_TrackedDelete]
(
       CharterApprovalAgencyTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CharterApprovalAgencyTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CharterStatusDescriptor_TrackedDelete]
(
       CharterStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CharterStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CitizenshipStatusDescriptor_TrackedDelete]
(
       CitizenshipStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CitizenshipStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ClassPeriod_TrackedDelete]
(
       ClassPeriodName [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ClassPeriod_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ClassroomPositionDescriptor_TrackedDelete]
(
       ClassroomPositionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ClassroomPositionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CohortScopeDescriptor_TrackedDelete]
(
       CohortScopeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CohortScopeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CohortTypeDescriptor_TrackedDelete]
(
       CohortTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CohortTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CohortYearTypeDescriptor_TrackedDelete]
(
       CohortYearTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CohortYearTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Cohort_TrackedDelete]
(
       CohortIdentifier [NVARCHAR](20) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Cohort_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CommunityOrganization_TrackedDelete]
(
       CommunityOrganizationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CommunityOrganization_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CommunityProviderLicense_TrackedDelete]
(
       CommunityProviderId [INT] NOT NULL,
       LicenseIdentifier [NVARCHAR](20) NOT NULL,
       LicensingOrganization [NVARCHAR](75) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CommunityProviderLicense_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CommunityProvider_TrackedDelete]
(
       CommunityProviderId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CommunityProvider_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CompetencyLevelDescriptor_TrackedDelete]
(
       CompetencyLevelDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CompetencyLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CompetencyObjective_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       Objective [NVARCHAR](60) NOT NULL,
       ObjectiveGradeLevelDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CompetencyObjective_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ContactTypeDescriptor_TrackedDelete]
(
       ContactTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ContactTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ContentClassDescriptor_TrackedDelete]
(
       ContentClassDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ContentClassDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ContinuationOfServicesReasonDescriptor_TrackedDelete]
(
       ContinuationOfServicesReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ContinuationOfServicesReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ContractedStaff_TrackedDelete]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       AsOfDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ContractedStaff_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CostRateDescriptor_TrackedDelete]
(
       CostRateDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CostRateDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CountryDescriptor_TrackedDelete]
(
       CountryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CountryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseAttemptResultDescriptor_TrackedDelete]
(
       CourseAttemptResultDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseAttemptResultDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseDefinedByDescriptor_TrackedDelete]
(
       CourseDefinedByDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseDefinedByDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseGPAApplicabilityDescriptor_TrackedDelete]
(
       CourseGPAApplicabilityDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseGPAApplicabilityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseIdentificationSystemDescriptor_TrackedDelete]
(
       CourseIdentificationSystemDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseLevelCharacteristicDescriptor_TrackedDelete]
(
       CourseLevelCharacteristicDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseLevelCharacteristicDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseOffering_TrackedDelete]
(
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseOffering_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseRepeatCodeDescriptor_TrackedDelete]
(
       CourseRepeatCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseRepeatCodeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseTranscript_TrackedDelete]
(
       CourseAttemptResultDescriptorId [INT] NOT NULL,
       CourseCode [NVARCHAR](60) NOT NULL,
       CourseEducationOrganizationId [INT] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseTranscript_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Course_TrackedDelete]
(
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Course_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CredentialFieldDescriptor_TrackedDelete]
(
       CredentialFieldDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CredentialFieldDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CredentialTypeDescriptor_TrackedDelete]
(
       CredentialTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CredentialTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Credential_TrackedDelete]
(
       CredentialIdentifier [NVARCHAR](60) NOT NULL,
       StateOfIssueStateAbbreviationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Credential_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CreditTypeDescriptor_TrackedDelete]
(
       CreditTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CreditTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CurriculumUsedDescriptor_TrackedDelete]
(
       CurriculumUsedDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CurriculumUsedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DeliveryMethodDescriptor_TrackedDelete]
(
       DeliveryMethodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DeliveryMethodDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Descriptor_TrackedDelete]
(
       DescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Descriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DiagnosisDescriptor_TrackedDelete]
(
       DiagnosisDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DiagnosisDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DiplomaLevelDescriptor_TrackedDelete]
(
       DiplomaLevelDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DiplomaLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DiplomaTypeDescriptor_TrackedDelete]
(
       DiplomaTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DiplomaTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisabilityDescriptor_TrackedDelete]
(
       DisabilityDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisabilityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisabilityDesignationDescriptor_TrackedDelete]
(
       DisabilityDesignationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisabilityDesignationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisabilityDeterminationSourceTypeDescriptor_TrackedDelete]
(
       DisabilityDeterminationSourceTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisabilityDeterminationSourceTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisciplineActionLengthDifferenceReasonDescriptor_TrackedDelete]
(
       DisciplineActionLengthDifferenceReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisciplineActionLengthDifferenceReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisciplineAction_TrackedDelete]
(
       DisciplineActionIdentifier [NVARCHAR](20) NOT NULL,
       DisciplineDate [DATE] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisciplineAction_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisciplineDescriptor_TrackedDelete]
(
       DisciplineDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisciplineDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisciplineIncident_TrackedDelete]
(
       IncidentIdentifier [NVARCHAR](20) NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisciplineIncident_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationContent_TrackedDelete]
(
       ContentIdentifier [NVARCHAR](225) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationContent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationCategoryDescriptor_TrackedDelete]
(
       EducationOrganizationCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganizationCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationIdentificationSystemDescriptor_TrackedDelete]
(
       EducationOrganizationIdentificationSystemDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganizationIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationInterventionPrescriptionAssociation_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       InterventionPrescriptionEducationOrganizationId [INT] NOT NULL,
       InterventionPrescriptionIdentificationCode [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganizationInterventionPrescriptionAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationNetworkAssociation_TrackedDelete]
(
       EducationOrganizationNetworkId [INT] NOT NULL,
       MemberEducationOrganizationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganizationNetworkAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationNetwork_TrackedDelete]
(
       EducationOrganizationNetworkId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganizationNetwork_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationPeerAssociation_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       PeerEducationOrganizationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganizationPeerAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganization_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganization_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationPlanDescriptor_TrackedDelete]
(
       EducationPlanDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationPlanDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationServiceCenter_TrackedDelete]
(
       EducationServiceCenterId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationServiceCenter_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationalEnvironmentDescriptor_TrackedDelete]
(
       EducationalEnvironmentDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationalEnvironmentDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ElectronicMailTypeDescriptor_TrackedDelete]
(
       ElectronicMailTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ElectronicMailTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EmploymentStatusDescriptor_TrackedDelete]
(
       EmploymentStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EmploymentStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EntryGradeLevelReasonDescriptor_TrackedDelete]
(
       EntryGradeLevelReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EntryGradeLevelReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EntryTypeDescriptor_TrackedDelete]
(
       EntryTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EntryTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EventCircumstanceDescriptor_TrackedDelete]
(
       EventCircumstanceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EventCircumstanceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ExitWithdrawTypeDescriptor_TrackedDelete]
(
       ExitWithdrawTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ExitWithdrawTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_FeederSchoolAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       FeederSchoolId [INT] NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_FeederSchoolAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GeneralStudentProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GeneralStudentProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradeLevelDescriptor_TrackedDelete]
(
       GradeLevelDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradeLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradeTypeDescriptor_TrackedDelete]
(
       GradeTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradeTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Grade_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       GradeTypeDescriptorId [INT] NOT NULL,
       GradingPeriodDescriptorId [INT] NOT NULL,
       GradingPeriodSchoolYear [SMALLINT] NOT NULL,
       GradingPeriodSequence [INT] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Grade_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradebookEntryTypeDescriptor_TrackedDelete]
(
       GradebookEntryTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradebookEntryTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradebookEntry_TrackedDelete]
(
       DateAssigned [DATE] NOT NULL,
       GradebookEntryTitle [NVARCHAR](60) NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradebookEntry_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradingPeriodDescriptor_TrackedDelete]
(
       GradingPeriodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradingPeriodDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradingPeriod_TrackedDelete]
(
       GradingPeriodDescriptorId [INT] NOT NULL,
       PeriodSequence [INT] NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradingPeriod_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GraduationPlanTypeDescriptor_TrackedDelete]
(
       GraduationPlanTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GraduationPlanTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GraduationPlan_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       GraduationPlanTypeDescriptorId [INT] NOT NULL,
       GraduationSchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GraduationPlan_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GunFreeSchoolsActReportingStatusDescriptor_TrackedDelete]
(
       GunFreeSchoolsActReportingStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GunFreeSchoolsActReportingStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_HomelessPrimaryNighttimeResidenceDescriptor_TrackedDelete]
(
       HomelessPrimaryNighttimeResidenceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_HomelessPrimaryNighttimeResidenceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_HomelessProgramServiceDescriptor_TrackedDelete]
(
       HomelessProgramServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_HomelessProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_IdentificationDocumentUseDescriptor_TrackedDelete]
(
       IdentificationDocumentUseDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_IdentificationDocumentUseDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_IncidentLocationDescriptor_TrackedDelete]
(
       IncidentLocationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_IncidentLocationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InstitutionTelephoneNumberTypeDescriptor_TrackedDelete]
(
       InstitutionTelephoneNumberTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InstitutionTelephoneNumberTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InteractivityStyleDescriptor_TrackedDelete]
(
       InteractivityStyleDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InteractivityStyleDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InternetAccessDescriptor_TrackedDelete]
(
       InternetAccessDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InternetAccessDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InterventionClassDescriptor_TrackedDelete]
(
       InterventionClassDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InterventionClassDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InterventionEffectivenessRatingDescriptor_TrackedDelete]
(
       InterventionEffectivenessRatingDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InterventionEffectivenessRatingDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InterventionPrescription_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       InterventionPrescriptionIdentificationCode [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InterventionPrescription_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InterventionStudy_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       InterventionStudyIdentificationCode [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InterventionStudy_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Intervention_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       InterventionIdentificationCode [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Intervention_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LanguageDescriptor_TrackedDelete]
(
       LanguageDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LanguageDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LanguageInstructionProgramServiceDescriptor_TrackedDelete]
(
       LanguageInstructionProgramServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LanguageInstructionProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LanguageUseDescriptor_TrackedDelete]
(
       LanguageUseDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LanguageUseDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LearningObjective_TrackedDelete]
(
       LearningObjectiveId [NVARCHAR](60) NOT NULL,
       Namespace [NVARCHAR](255) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LearningObjective_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LearningStandardCategoryDescriptor_TrackedDelete]
(
       LearningStandardCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LearningStandardCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LearningStandard_TrackedDelete]
(
       LearningStandardId [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LearningStandard_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LevelOfEducationDescriptor_TrackedDelete]
(
       LevelOfEducationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LevelOfEducationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LicenseStatusDescriptor_TrackedDelete]
(
       LicenseStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LicenseStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LicenseTypeDescriptor_TrackedDelete]
(
       LicenseTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LicenseTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LimitedEnglishProficiencyDescriptor_TrackedDelete]
(
       LimitedEnglishProficiencyDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LimitedEnglishProficiencyDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LocalEducationAgencyCategoryDescriptor_TrackedDelete]
(
       LocalEducationAgencyCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LocalEducationAgencyCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LocalEducationAgency_TrackedDelete]
(
       LocalEducationAgencyId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LocalEducationAgency_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LocaleDescriptor_TrackedDelete]
(
       LocaleDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LocaleDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Location_TrackedDelete]
(
       ClassroomIdentificationCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Location_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TrackedDelete]
(
       MagnetSpecialProgramEmphasisSchoolDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MediumOfInstructionDescriptor_TrackedDelete]
(
       MediumOfInstructionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MediumOfInstructionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MethodCreditEarnedDescriptor_TrackedDelete]
(
       MethodCreditEarnedDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MethodCreditEarnedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MigrantEducationProgramServiceDescriptor_TrackedDelete]
(
       MigrantEducationProgramServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MigrantEducationProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MonitoredDescriptor_TrackedDelete]
(
       MonitoredDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MonitoredDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_NeglectedOrDelinquentProgramDescriptor_TrackedDelete]
(
       NeglectedOrDelinquentProgramDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_NeglectedOrDelinquentProgramDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_NeglectedOrDelinquentProgramServiceDescriptor_TrackedDelete]
(
       NeglectedOrDelinquentProgramServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_NeglectedOrDelinquentProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_NetworkPurposeDescriptor_TrackedDelete]
(
       NetworkPurposeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_NetworkPurposeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ObjectiveAssessment_TrackedDelete]
(
       AssessmentIdentifier [NVARCHAR](60) NOT NULL,
       IdentificationCode [NVARCHAR](60) NOT NULL,
       Namespace [NVARCHAR](255) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ObjectiveAssessment_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_OldEthnicityDescriptor_TrackedDelete]
(
       OldEthnicityDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_OldEthnicityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_OpenStaffPosition_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       RequisitionNumber [NVARCHAR](20) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_OpenStaffPosition_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_OperationalStatusDescriptor_TrackedDelete]
(
       OperationalStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_OperationalStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_OtherNameTypeDescriptor_TrackedDelete]
(
       OtherNameTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_OtherNameTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Parent_TrackedDelete]
(
       ParentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Parent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ParticipationDescriptor_TrackedDelete]
(
       ParticipationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ParticipationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Payroll_TrackedDelete]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       AsOfDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Payroll_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PerformanceBaseConversionDescriptor_TrackedDelete]
(
       PerformanceBaseConversionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PerformanceBaseConversionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PerformanceLevelDescriptor_TrackedDelete]
(
       PerformanceLevelDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PerformanceLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PersonalInformationVerificationDescriptor_TrackedDelete]
(
       PersonalInformationVerificationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PersonalInformationVerificationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PopulationServedDescriptor_TrackedDelete]
(
       PopulationServedDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PopulationServedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostSecondaryEventCategoryDescriptor_TrackedDelete]
(
       PostSecondaryEventCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PostSecondaryEventCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostSecondaryEvent_TrackedDelete]
(
       EventDate [DATE] NOT NULL,
       PostSecondaryEventCategoryDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PostSecondaryEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostSecondaryInstitutionLevelDescriptor_TrackedDelete]
(
       PostSecondaryInstitutionLevelDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PostSecondaryInstitutionLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostSecondaryInstitution_TrackedDelete]
(
       PostSecondaryInstitutionId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PostSecondaryInstitution_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostingResultDescriptor_TrackedDelete]
(
       PostingResultDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PostingResultDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProficiencyDescriptor_TrackedDelete]
(
       ProficiencyDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProficiencyDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgramAssignmentDescriptor_TrackedDelete]
(
       ProgramAssignmentDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgramAssignmentDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgramCharacteristicDescriptor_TrackedDelete]
(
       ProgramCharacteristicDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgramCharacteristicDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgramSponsorDescriptor_TrackedDelete]
(
       ProgramSponsorDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgramSponsorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgramTypeDescriptor_TrackedDelete]
(
       ProgramTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgramTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Program_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Program_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgressDescriptor_TrackedDelete]
(
       ProgressDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgressDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgressLevelDescriptor_TrackedDelete]
(
       ProgressLevelDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgressLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProviderCategoryDescriptor_TrackedDelete]
(
       ProviderCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProviderCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProviderProfitabilityDescriptor_TrackedDelete]
(
       ProviderProfitabilityDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProviderProfitabilityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProviderStatusDescriptor_TrackedDelete]
(
       ProviderStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProviderStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PublicationStatusDescriptor_TrackedDelete]
(
       PublicationStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PublicationStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RaceDescriptor_TrackedDelete]
(
       RaceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RaceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ReasonExitedDescriptor_TrackedDelete]
(
       ReasonExitedDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ReasonExitedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ReasonNotTestedDescriptor_TrackedDelete]
(
       ReasonNotTestedDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ReasonNotTestedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RecognitionTypeDescriptor_TrackedDelete]
(
       RecognitionTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RecognitionTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RelationDescriptor_TrackedDelete]
(
       RelationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RelationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RepeatIdentifierDescriptor_TrackedDelete]
(
       RepeatIdentifierDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RepeatIdentifierDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ReportCard_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       GradingPeriodDescriptorId [INT] NOT NULL,
       GradingPeriodSchoolId [INT] NOT NULL,
       GradingPeriodSchoolYear [SMALLINT] NOT NULL,
       GradingPeriodSequence [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ReportCard_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ReporterDescriptionDescriptor_TrackedDelete]
(
       ReporterDescriptionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ReporterDescriptionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ResidencyStatusDescriptor_TrackedDelete]
(
       ResidencyStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ResidencyStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ResponseIndicatorDescriptor_TrackedDelete]
(
       ResponseIndicatorDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ResponseIndicatorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ResponsibilityDescriptor_TrackedDelete]
(
       ResponsibilityDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ResponsibilityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RestraintEventReasonDescriptor_TrackedDelete]
(
       RestraintEventReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RestraintEventReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RestraintEvent_TrackedDelete]
(
       RestraintEventIdentifier [NVARCHAR](20) NOT NULL,
       SchoolId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RestraintEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ResultDatatypeTypeDescriptor_TrackedDelete]
(
       ResultDatatypeTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ResultDatatypeTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RetestIndicatorDescriptor_TrackedDelete]
(
       RetestIndicatorDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RetestIndicatorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SchoolCategoryDescriptor_TrackedDelete]
(
       SchoolCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SchoolCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SchoolChoiceImplementStatusDescriptor_TrackedDelete]
(
       SchoolChoiceImplementStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SchoolChoiceImplementStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SchoolFoodServiceProgramServiceDescriptor_TrackedDelete]
(
       SchoolFoodServiceProgramServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SchoolFoodServiceProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SchoolTypeDescriptor_TrackedDelete]
(
       SchoolTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SchoolTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_School_TrackedDelete]
(
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_School_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SectionAttendanceTakenEvent_TrackedDelete]
(
       CalendarCode [NVARCHAR](60) NOT NULL,
       Date [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SectionAttendanceTakenEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SectionCharacteristicDescriptor_TrackedDelete]
(
       SectionCharacteristicDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SectionCharacteristicDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Section_TrackedDelete]
(
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Section_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SeparationDescriptor_TrackedDelete]
(
       SeparationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SeparationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SeparationReasonDescriptor_TrackedDelete]
(
       SeparationReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SeparationReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ServiceDescriptor_TrackedDelete]
(
       ServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Session_TrackedDelete]
(
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Session_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SexDescriptor_TrackedDelete]
(
       SexDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SexDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SpecialEducationProgramServiceDescriptor_TrackedDelete]
(
       SpecialEducationProgramServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SpecialEducationProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SpecialEducationSettingDescriptor_TrackedDelete]
(
       SpecialEducationSettingDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SpecialEducationSettingDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffAbsenceEvent_TrackedDelete]
(
       AbsenceEventCategoryDescriptorId [INT] NOT NULL,
       EventDate [DATE] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffAbsenceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffClassificationDescriptor_TrackedDelete]
(
       StaffClassificationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffClassificationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffCohortAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       CohortIdentifier [NVARCHAR](20) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffCohortAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffEducationOrganizationAssignmentAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       StaffClassificationDescriptorId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffEducationOrganizationAssignmentAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffEducationOrganizationContactAssociation_TrackedDelete]
(
       ContactTitle [NVARCHAR](75) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffEducationOrganizationContactAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffEducationOrganizationEmploymentAssociation_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       EmploymentStatusDescriptorId [INT] NOT NULL,
       HireDate [DATE] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffEducationOrganizationEmploymentAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffIdentificationSystemDescriptor_TrackedDelete]
(
       StaffIdentificationSystemDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffLeaveEventCategoryDescriptor_TrackedDelete]
(
       StaffLeaveEventCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffLeaveEventCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffLeave_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       StaffLeaveEventCategoryDescriptorId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffLeave_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffSchoolAssociation_TrackedDelete]
(
       ProgramAssignmentDescriptorId [INT] NOT NULL,
       SchoolId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffSchoolAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffSectionAssociation_TrackedDelete]
(
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffSectionAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Staff_TrackedDelete]
(
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Staff_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StateAbbreviationDescriptor_TrackedDelete]
(
       StateAbbreviationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StateAbbreviationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StateEducationAgency_TrackedDelete]
(
       StateEducationAgencyId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StateEducationAgency_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentAcademicRecord_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentAcademicRecord_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentAssessment_TrackedDelete]
(
       AssessmentIdentifier [NVARCHAR](60) NOT NULL,
       Namespace [NVARCHAR](255) NOT NULL,
       StudentAssessmentIdentifier [NVARCHAR](60) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentAssessment_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentCTEProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentCTEProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentCharacteristicDescriptor_TrackedDelete]
(
       StudentCharacteristicDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentCharacteristicDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentCohortAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       CohortIdentifier [NVARCHAR](20) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentCohortAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentCompetencyObjective_TrackedDelete]
(
       GradingPeriodDescriptorId [INT] NOT NULL,
       GradingPeriodSchoolId [INT] NOT NULL,
       GradingPeriodSchoolYear [SMALLINT] NOT NULL,
       GradingPeriodSequence [INT] NOT NULL,
       Objective [NVARCHAR](60) NOT NULL,
       ObjectiveEducationOrganizationId [INT] NOT NULL,
       ObjectiveGradeLevelDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentCompetencyObjective_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentDisciplineIncidentAssociation_TrackedDelete]
(
       IncidentIdentifier [NVARCHAR](20) NOT NULL,
       SchoolId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentDisciplineIncidentAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentEducationOrganizationAssociation_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentEducationOrganizationAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentEducationOrganizationResponsibilityAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ResponsibilityDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentEducationOrganizationResponsibilityAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentGradebookEntry_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       DateAssigned [DATE] NOT NULL,
       GradebookEntryTitle [NVARCHAR](60) NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentGradebookEntry_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentHomelessProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentHomelessProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentIdentificationSystemDescriptor_TrackedDelete]
(
       StudentIdentificationSystemDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentInterventionAssociation_TrackedDelete]
(
       EducationOrganizationId [INT] NOT NULL,
       InterventionIdentificationCode [NVARCHAR](60) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentInterventionAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentInterventionAttendanceEvent_TrackedDelete]
(
       AttendanceEventCategoryDescriptorId [INT] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       EventDate [DATE] NOT NULL,
       InterventionIdentificationCode [NVARCHAR](60) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentInterventionAttendanceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentLanguageInstructionProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentLanguageInstructionProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentLearningObjective_TrackedDelete]
(
       GradingPeriodDescriptorId [INT] NOT NULL,
       GradingPeriodSchoolId [INT] NOT NULL,
       GradingPeriodSchoolYear [SMALLINT] NOT NULL,
       GradingPeriodSequence [INT] NOT NULL,
       LearningObjectiveId [NVARCHAR](60) NOT NULL,
       Namespace [NVARCHAR](255) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentLearningObjective_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentMigrantEducationProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentMigrantEducationProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentNeglectedOrDelinquentProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentNeglectedOrDelinquentProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentParentAssociation_TrackedDelete]
(
       ParentUSI [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentParentAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentParticipationCodeDescriptor_TrackedDelete]
(
       StudentParticipationCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentParticipationCodeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentProgramAttendanceEvent_TrackedDelete]
(
       AttendanceEventCategoryDescriptorId [INT] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       EventDate [DATE] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentProgramAttendanceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSchoolAssociation_TrackedDelete]
(
       EntryDate [DATE] NOT NULL,
       SchoolId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentSchoolAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSchoolAttendanceEvent_TrackedDelete]
(
       AttendanceEventCategoryDescriptorId [INT] NOT NULL,
       EventDate [DATE] NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentSchoolAttendanceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSchoolFoodServiceProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentSchoolFoodServiceProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSectionAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentSectionAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSectionAttendanceEvent_TrackedDelete]
(
       AttendanceEventCategoryDescriptorId [INT] NOT NULL,
       EventDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentSectionAttendanceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSpecialEducationProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentSpecialEducationProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentTitleIPartAProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentTitleIPartAProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Student_TrackedDelete]
(
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Student_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TeachingCredentialBasisDescriptor_TrackedDelete]
(
       TeachingCredentialBasisDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TeachingCredentialBasisDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TeachingCredentialDescriptor_TrackedDelete]
(
       TeachingCredentialDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TeachingCredentialDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TechnicalSkillsAssessmentDescriptor_TrackedDelete]
(
       TechnicalSkillsAssessmentDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TechnicalSkillsAssessmentDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TelephoneNumberTypeDescriptor_TrackedDelete]
(
       TelephoneNumberTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TelephoneNumberTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TermDescriptor_TrackedDelete]
(
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TermDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TitleIPartAParticipantDescriptor_TrackedDelete]
(
       TitleIPartAParticipantDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TitleIPartAParticipantDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TitleIPartASchoolDesignationDescriptor_TrackedDelete]
(
       TitleIPartASchoolDesignationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TitleIPartASchoolDesignationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TribalAffiliationDescriptor_TrackedDelete]
(
       TribalAffiliationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TribalAffiliationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_VisaDescriptor_TrackedDelete]
(
       VisaDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_VisaDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_WeaponDescriptor_TrackedDelete]
(
       WeaponDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_WeaponDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

