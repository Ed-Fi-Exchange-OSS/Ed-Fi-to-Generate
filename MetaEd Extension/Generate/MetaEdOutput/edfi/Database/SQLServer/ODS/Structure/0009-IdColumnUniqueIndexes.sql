-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AcademicHonorCategoryType') AND name = N'UX_AcademicHonorCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AcademicHonorCategoryType_Id ON [edfi].[AcademicHonorCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AcademicSubjectType') AND name = N'UX_AcademicSubjectType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AcademicSubjectType_Id ON [edfi].[AcademicSubjectType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AcademicWeek') AND name = N'UX_AcademicWeek_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AcademicWeek_Id ON [edfi].[AcademicWeek]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AccommodationType') AND name = N'UX_AccommodationType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AccommodationType_Id ON [edfi].[AccommodationType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Account') AND name = N'UX_Account_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Account_Id ON [edfi].[Account]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AccountabilityRating') AND name = N'UX_AccountabilityRating_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AccountabilityRating_Id ON [edfi].[AccountabilityRating]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AchievementCategoryType') AND name = N'UX_AchievementCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AchievementCategoryType_Id ON [edfi].[AchievementCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Actual') AND name = N'UX_Actual_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Actual_Id ON [edfi].[Actual]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AdditionalCreditType') AND name = N'UX_AdditionalCreditType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AdditionalCreditType_Id ON [edfi].[AdditionalCreditType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AddressType') AND name = N'UX_AddressType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AddressType_Id ON [edfi].[AddressType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AdministrationEnvironmentType') AND name = N'UX_AdministrationEnvironmentType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AdministrationEnvironmentType_Id ON [edfi].[AdministrationEnvironmentType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AdministrativeFundingControlType') AND name = N'UX_AdministrativeFundingControlType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AdministrativeFundingControlType_Id ON [edfi].[AdministrativeFundingControlType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Assessment') AND name = N'UX_Assessment_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Assessment_Id ON [edfi].[Assessment]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AssessmentCategoryType') AND name = N'UX_AssessmentCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AssessmentCategoryType_Id ON [edfi].[AssessmentCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AssessmentFamily') AND name = N'UX_AssessmentFamily_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AssessmentFamily_Id ON [edfi].[AssessmentFamily]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AssessmentIdentificationSystemType') AND name = N'UX_AssessmentIdentificationSystemType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AssessmentIdentificationSystemType_Id ON [edfi].[AssessmentIdentificationSystemType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AssessmentItem') AND name = N'UX_AssessmentItem_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AssessmentItem_Id ON [edfi].[AssessmentItem]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AssessmentItemCategoryType') AND name = N'UX_AssessmentItemCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AssessmentItemCategoryType_Id ON [edfi].[AssessmentItemCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AssessmentItemResultType') AND name = N'UX_AssessmentItemResultType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AssessmentItemResultType_Id ON [edfi].[AssessmentItemResultType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AssessmentReportingMethodType') AND name = N'UX_AssessmentReportingMethodType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AssessmentReportingMethodType_Id ON [edfi].[AssessmentReportingMethodType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.AttendanceEventCategoryType') AND name = N'UX_AttendanceEventCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AttendanceEventCategoryType_Id ON [edfi].[AttendanceEventCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.BehaviorType') AND name = N'UX_BehaviorType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_BehaviorType_Id ON [edfi].[BehaviorType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.BellSchedule') AND name = N'UX_BellSchedule_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_BellSchedule_Id ON [edfi].[BellSchedule]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Budget') AND name = N'UX_Budget_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Budget_Id ON [edfi].[Budget]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CalendarDate') AND name = N'UX_CalendarDate_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CalendarDate_Id ON [edfi].[CalendarDate]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CalendarEventType') AND name = N'UX_CalendarEventType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CalendarEventType_Id ON [edfi].[CalendarEventType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CareerPathwayType') AND name = N'UX_CareerPathwayType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CareerPathwayType_Id ON [edfi].[CareerPathwayType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CharterApprovalAgencyType') AND name = N'UX_CharterApprovalAgencyType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CharterApprovalAgencyType_Id ON [edfi].[CharterApprovalAgencyType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CharterStatusType') AND name = N'UX_CharterStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CharterStatusType_Id ON [edfi].[CharterStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CitizenshipStatusType') AND name = N'UX_CitizenshipStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CitizenshipStatusType_Id ON [edfi].[CitizenshipStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ClassPeriod') AND name = N'UX_ClassPeriod_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ClassPeriod_Id ON [edfi].[ClassPeriod]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ClassroomPositionType') AND name = N'UX_ClassroomPositionType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ClassroomPositionType_Id ON [edfi].[ClassroomPositionType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Cohort') AND name = N'UX_Cohort_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Cohort_Id ON [edfi].[Cohort]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CohortScopeType') AND name = N'UX_CohortScopeType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CohortScopeType_Id ON [edfi].[CohortScopeType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CohortType') AND name = N'UX_CohortType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CohortType_Id ON [edfi].[CohortType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CohortYearType') AND name = N'UX_CohortYearType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CohortYearType_Id ON [edfi].[CohortYearType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CompetencyObjective') AND name = N'UX_CompetencyObjective_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CompetencyObjective_Id ON [edfi].[CompetencyObjective]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ContentClassType') AND name = N'UX_ContentClassType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ContentClassType_Id ON [edfi].[ContentClassType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ContinuationOfServicesReasonType') AND name = N'UX_ContinuationOfServicesReasonType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ContinuationOfServicesReasonType_Id ON [edfi].[ContinuationOfServicesReasonType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ContractedStaff') AND name = N'UX_ContractedStaff_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ContractedStaff_Id ON [edfi].[ContractedStaff]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CostRateType') AND name = N'UX_CostRateType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CostRateType_Id ON [edfi].[CostRateType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Course') AND name = N'UX_Course_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Course_Id ON [edfi].[Course]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CourseAttemptResultType') AND name = N'UX_CourseAttemptResultType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseAttemptResultType_Id ON [edfi].[CourseAttemptResultType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CourseDefinedByType') AND name = N'UX_CourseDefinedByType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseDefinedByType_Id ON [edfi].[CourseDefinedByType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CourseGPAApplicabilityType') AND name = N'UX_CourseGPAApplicabilityType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseGPAApplicabilityType_Id ON [edfi].[CourseGPAApplicabilityType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CourseIdentificationSystemType') AND name = N'UX_CourseIdentificationSystemType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseIdentificationSystemType_Id ON [edfi].[CourseIdentificationSystemType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CourseLevelCharacteristicType') AND name = N'UX_CourseLevelCharacteristicType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseLevelCharacteristicType_Id ON [edfi].[CourseLevelCharacteristicType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CourseOffering') AND name = N'UX_CourseOffering_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseOffering_Id ON [edfi].[CourseOffering]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CourseRepeatCodeType') AND name = N'UX_CourseRepeatCodeType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseRepeatCodeType_Id ON [edfi].[CourseRepeatCodeType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CourseTranscript') AND name = N'UX_CourseTranscript_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseTranscript_Id ON [edfi].[CourseTranscript]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CredentialType') AND name = N'UX_CredentialType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CredentialType_Id ON [edfi].[CredentialType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CreditType') AND name = N'UX_CreditType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CreditType_Id ON [edfi].[CreditType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.CurriculumUsedType') AND name = N'UX_CurriculumUsedType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CurriculumUsedType_Id ON [edfi].[CurriculumUsedType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DeliveryMethodType') AND name = N'UX_DeliveryMethodType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DeliveryMethodType_Id ON [edfi].[DeliveryMethodType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Descriptor') AND name = N'UX_Descriptor_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Descriptor_Id ON [edfi].[Descriptor]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DiagnosisType') AND name = N'UX_DiagnosisType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DiagnosisType_Id ON [edfi].[DiagnosisType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DiplomaLevelType') AND name = N'UX_DiplomaLevelType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DiplomaLevelType_Id ON [edfi].[DiplomaLevelType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DiplomaType') AND name = N'UX_DiplomaType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DiplomaType_Id ON [edfi].[DiplomaType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DisabilityCategoryType') AND name = N'UX_DisabilityCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisabilityCategoryType_Id ON [edfi].[DisabilityCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DisabilityDeterminationSourceType') AND name = N'UX_DisabilityDeterminationSourceType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisabilityDeterminationSourceType_Id ON [edfi].[DisabilityDeterminationSourceType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DisabilityType') AND name = N'UX_DisabilityType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisabilityType_Id ON [edfi].[DisabilityType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DisciplineAction') AND name = N'UX_DisciplineAction_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineAction_Id ON [edfi].[DisciplineAction]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DisciplineActionLengthDifferenceReasonType') AND name = N'UX_DisciplineActionLengthDifferenceReasonType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineActionLengthDifferenceReasonType_Id ON [edfi].[DisciplineActionLengthDifferenceReasonType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DisciplineIncident') AND name = N'UX_DisciplineIncident_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineIncident_Id ON [edfi].[DisciplineIncident]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.DisciplineType') AND name = N'UX_DisciplineType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineType_Id ON [edfi].[DisciplineType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EducationalEnvironmentType') AND name = N'UX_EducationalEnvironmentType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationalEnvironmentType_Id ON [edfi].[EducationalEnvironmentType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EducationContent') AND name = N'UX_EducationContent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationContent_Id ON [edfi].[EducationContent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EducationOrganization') AND name = N'UX_EducationOrganization_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganization_Id ON [edfi].[EducationOrganization]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EducationOrganizationCategoryType') AND name = N'UX_EducationOrganizationCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationCategoryType_Id ON [edfi].[EducationOrganizationCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EducationOrganizationIdentificationSystemType') AND name = N'UX_EducationOrganizationIdentificationSystemType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationIdentificationSystemType_Id ON [edfi].[EducationOrganizationIdentificationSystemType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EducationOrganizationInterventionPrescriptionAssociation') AND name = N'UX_EducationOrganizationInterventionPrescriptionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationInterventionPrescriptionAssociation_Id ON [edfi].[EducationOrganizationInterventionPrescriptionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EducationOrganizationNetworkAssociation') AND name = N'UX_EducationOrganizationNetworkAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationNetworkAssociation_Id ON [edfi].[EducationOrganizationNetworkAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EducationOrganizationPeerAssociation') AND name = N'UX_EducationOrganizationPeerAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationPeerAssociation_Id ON [edfi].[EducationOrganizationPeerAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EducationPlanType') AND name = N'UX_EducationPlanType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationPlanType_Id ON [edfi].[EducationPlanType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ElectronicMailType') AND name = N'UX_ElectronicMailType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ElectronicMailType_Id ON [edfi].[ElectronicMailType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EmploymentStatusType') AND name = N'UX_EmploymentStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EmploymentStatusType_Id ON [edfi].[EmploymentStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EntryGradeLevelReasonType') AND name = N'UX_EntryGradeLevelReasonType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EntryGradeLevelReasonType_Id ON [edfi].[EntryGradeLevelReasonType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EntryType') AND name = N'UX_EntryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EntryType_Id ON [edfi].[EntryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.EventCircumstanceType') AND name = N'UX_EventCircumstanceType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EventCircumstanceType_Id ON [edfi].[EventCircumstanceType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ExitWithdrawType') AND name = N'UX_ExitWithdrawType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ExitWithdrawType_Id ON [edfi].[ExitWithdrawType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.FeederSchoolAssociation') AND name = N'UX_FeederSchoolAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_FeederSchoolAssociation_Id ON [edfi].[FeederSchoolAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Grade') AND name = N'UX_Grade_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Grade_Id ON [edfi].[Grade]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.GradebookEntry') AND name = N'UX_GradebookEntry_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GradebookEntry_Id ON [edfi].[GradebookEntry]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.GradebookEntryType') AND name = N'UX_GradebookEntryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GradebookEntryType_Id ON [edfi].[GradebookEntryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.GradeLevelType') AND name = N'UX_GradeLevelType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GradeLevelType_Id ON [edfi].[GradeLevelType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.GradeType') AND name = N'UX_GradeType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GradeType_Id ON [edfi].[GradeType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.GradingPeriod') AND name = N'UX_GradingPeriod_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GradingPeriod_Id ON [edfi].[GradingPeriod]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.GradingPeriodType') AND name = N'UX_GradingPeriodType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GradingPeriodType_Id ON [edfi].[GradingPeriodType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.GraduationPlan') AND name = N'UX_GraduationPlan_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GraduationPlan_Id ON [edfi].[GraduationPlan]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.GraduationPlanType') AND name = N'UX_GraduationPlanType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GraduationPlanType_Id ON [edfi].[GraduationPlanType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.GunFreeSchoolsActReportingStatusType') AND name = N'UX_GunFreeSchoolsActReportingStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GunFreeSchoolsActReportingStatusType_Id ON [edfi].[GunFreeSchoolsActReportingStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.IdentificationDocumentUseType') AND name = N'UX_IdentificationDocumentUseType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_IdentificationDocumentUseType_Id ON [edfi].[IdentificationDocumentUseType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.IncidentLocationType') AND name = N'UX_IncidentLocationType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_IncidentLocationType_Id ON [edfi].[IncidentLocationType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.InstitutionTelephoneNumberType') AND name = N'UX_InstitutionTelephoneNumberType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_InstitutionTelephoneNumberType_Id ON [edfi].[InstitutionTelephoneNumberType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.IntegratedTechnologyStatusType') AND name = N'UX_IntegratedTechnologyStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_IntegratedTechnologyStatusType_Id ON [edfi].[IntegratedTechnologyStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.InteractivityStyleType') AND name = N'UX_InteractivityStyleType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_InteractivityStyleType_Id ON [edfi].[InteractivityStyleType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.InternetAccessType') AND name = N'UX_InternetAccessType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_InternetAccessType_Id ON [edfi].[InternetAccessType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Intervention') AND name = N'UX_Intervention_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Intervention_Id ON [edfi].[Intervention]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.InterventionClassType') AND name = N'UX_InterventionClassType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_InterventionClassType_Id ON [edfi].[InterventionClassType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.InterventionEffectivenessRatingType') AND name = N'UX_InterventionEffectivenessRatingType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_InterventionEffectivenessRatingType_Id ON [edfi].[InterventionEffectivenessRatingType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.InterventionPrescription') AND name = N'UX_InterventionPrescription_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_InterventionPrescription_Id ON [edfi].[InterventionPrescription]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.InterventionStudy') AND name = N'UX_InterventionStudy_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_InterventionStudy_Id ON [edfi].[InterventionStudy]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LanguageType') AND name = N'UX_LanguageType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LanguageType_Id ON [edfi].[LanguageType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LanguageUseType') AND name = N'UX_LanguageUseType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LanguageUseType_Id ON [edfi].[LanguageUseType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LearningObjective') AND name = N'UX_LearningObjective_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LearningObjective_Id ON [edfi].[LearningObjective]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LearningStandard') AND name = N'UX_LearningStandard_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LearningStandard_Id ON [edfi].[LearningStandard]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LeaveEvent') AND name = N'UX_LeaveEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LeaveEvent_Id ON [edfi].[LeaveEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LeaveEventCategoryType') AND name = N'UX_LeaveEventCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LeaveEventCategoryType_Id ON [edfi].[LeaveEventCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LevelOfEducationType') AND name = N'UX_LevelOfEducationType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LevelOfEducationType_Id ON [edfi].[LevelOfEducationType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LimitedEnglishProficiencyType') AND name = N'UX_LimitedEnglishProficiencyType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LimitedEnglishProficiencyType_Id ON [edfi].[LimitedEnglishProficiencyType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LocalEducationAgencyCategoryType') AND name = N'UX_LocalEducationAgencyCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LocalEducationAgencyCategoryType_Id ON [edfi].[LocalEducationAgencyCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.LocalEducationAgencyFederalFunds') AND name = N'UX_LocalEducationAgencyFederalFunds_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LocalEducationAgencyFederalFunds_Id ON [edfi].[LocalEducationAgencyFederalFunds]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Location') AND name = N'UX_Location_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Location_Id ON [edfi].[Location]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.MagnetSpecialProgramEmphasisSchoolType') AND name = N'UX_MagnetSpecialProgramEmphasisSchoolType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MagnetSpecialProgramEmphasisSchoolType_Id ON [edfi].[MagnetSpecialProgramEmphasisSchoolType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.MediumOfInstructionType') AND name = N'UX_MediumOfInstructionType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MediumOfInstructionType_Id ON [edfi].[MediumOfInstructionType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.MeetingDayType') AND name = N'UX_MeetingDayType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MeetingDayType_Id ON [edfi].[MeetingDayType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.MethodCreditEarnedType') AND name = N'UX_MethodCreditEarnedType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MethodCreditEarnedType_Id ON [edfi].[MethodCreditEarnedType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.NetworkPurposeType') AND name = N'UX_NetworkPurposeType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_NetworkPurposeType_Id ON [edfi].[NetworkPurposeType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ObjectiveAssessment') AND name = N'UX_ObjectiveAssessment_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ObjectiveAssessment_Id ON [edfi].[ObjectiveAssessment]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.OldEthnicityType') AND name = N'UX_OldEthnicityType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_OldEthnicityType_Id ON [edfi].[OldEthnicityType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.OpenStaffPosition') AND name = N'UX_OpenStaffPosition_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_OpenStaffPosition_Id ON [edfi].[OpenStaffPosition]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.OperationalStatusType') AND name = N'UX_OperationalStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_OperationalStatusType_Id ON [edfi].[OperationalStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.OtherNameType') AND name = N'UX_OtherNameType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_OtherNameType_Id ON [edfi].[OtherNameType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Parent') AND name = N'UX_Parent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Parent_Id ON [edfi].[Parent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Payroll') AND name = N'UX_Payroll_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Payroll_Id ON [edfi].[Payroll]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.PerformanceBaseConversionType') AND name = N'UX_PerformanceBaseConversionType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PerformanceBaseConversionType_Id ON [edfi].[PerformanceBaseConversionType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.PersonalInformationVerificationType') AND name = N'UX_PersonalInformationVerificationType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonalInformationVerificationType_Id ON [edfi].[PersonalInformationVerificationType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.PopulationServedType') AND name = N'UX_PopulationServedType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PopulationServedType_Id ON [edfi].[PopulationServedType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.PostingResultType') AND name = N'UX_PostingResultType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PostingResultType_Id ON [edfi].[PostingResultType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.PostSecondaryEvent') AND name = N'UX_PostSecondaryEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PostSecondaryEvent_Id ON [edfi].[PostSecondaryEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.PostSecondaryEventCategoryType') AND name = N'UX_PostSecondaryEventCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PostSecondaryEventCategoryType_Id ON [edfi].[PostSecondaryEventCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.PostSecondaryInstitutionLevelType') AND name = N'UX_PostSecondaryInstitutionLevelType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PostSecondaryInstitutionLevelType_Id ON [edfi].[PostSecondaryInstitutionLevelType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Program') AND name = N'UX_Program_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Program_Id ON [edfi].[Program]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ProgramAssignmentType') AND name = N'UX_ProgramAssignmentType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ProgramAssignmentType_Id ON [edfi].[ProgramAssignmentType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ProgramCharacteristicType') AND name = N'UX_ProgramCharacteristicType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ProgramCharacteristicType_Id ON [edfi].[ProgramCharacteristicType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ProgramSponsorType') AND name = N'UX_ProgramSponsorType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ProgramSponsorType_Id ON [edfi].[ProgramSponsorType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ProgramType') AND name = N'UX_ProgramType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ProgramType_Id ON [edfi].[ProgramType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.PublicationStatusType') AND name = N'UX_PublicationStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PublicationStatusType_Id ON [edfi].[PublicationStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.RaceType') AND name = N'UX_RaceType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RaceType_Id ON [edfi].[RaceType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ReasonExitedType') AND name = N'UX_ReasonExitedType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ReasonExitedType_Id ON [edfi].[ReasonExitedType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ReasonNotTestedType') AND name = N'UX_ReasonNotTestedType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ReasonNotTestedType_Id ON [edfi].[ReasonNotTestedType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.RecognitionType') AND name = N'UX_RecognitionType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RecognitionType_Id ON [edfi].[RecognitionType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.RelationType') AND name = N'UX_RelationType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RelationType_Id ON [edfi].[RelationType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.RepeatIdentifierType') AND name = N'UX_RepeatIdentifierType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RepeatIdentifierType_Id ON [edfi].[RepeatIdentifierType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ReportCard') AND name = N'UX_ReportCard_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ReportCard_Id ON [edfi].[ReportCard]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ReporterDescriptionType') AND name = N'UX_ReporterDescriptionType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ReporterDescriptionType_Id ON [edfi].[ReporterDescriptionType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ResidencyStatusType') AND name = N'UX_ResidencyStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ResidencyStatusType_Id ON [edfi].[ResidencyStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ResponseIndicatorType') AND name = N'UX_ResponseIndicatorType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ResponseIndicatorType_Id ON [edfi].[ResponseIndicatorType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ResponsibilityType') AND name = N'UX_ResponsibilityType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ResponsibilityType_Id ON [edfi].[ResponsibilityType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.RestraintEvent') AND name = N'UX_RestraintEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RestraintEvent_Id ON [edfi].[RestraintEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.RestraintEventReasonType') AND name = N'UX_RestraintEventReasonType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RestraintEventReasonType_Id ON [edfi].[RestraintEventReasonType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.ResultDatatypeType') AND name = N'UX_ResultDatatypeType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ResultDatatypeType_Id ON [edfi].[ResultDatatypeType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.RetestIndicatorType') AND name = N'UX_RetestIndicatorType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RetestIndicatorType_Id ON [edfi].[RetestIndicatorType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SchoolCategoryType') AND name = N'UX_SchoolCategoryType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SchoolCategoryType_Id ON [edfi].[SchoolCategoryType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SchoolChoiceImplementStatusType') AND name = N'UX_SchoolChoiceImplementStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SchoolChoiceImplementStatusType_Id ON [edfi].[SchoolChoiceImplementStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SchoolFoodServicesEligibilityType') AND name = N'UX_SchoolFoodServicesEligibilityType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SchoolFoodServicesEligibilityType_Id ON [edfi].[SchoolFoodServicesEligibilityType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SchoolType') AND name = N'UX_SchoolType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SchoolType_Id ON [edfi].[SchoolType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SchoolYearType') AND name = N'UX_SchoolYearType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SchoolYearType_Id ON [edfi].[SchoolYearType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Section') AND name = N'UX_Section_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Section_Id ON [edfi].[Section]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SectionAttendanceTakenEvent') AND name = N'UX_SectionAttendanceTakenEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SectionAttendanceTakenEvent_Id ON [edfi].[SectionAttendanceTakenEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SectionCharacteristicType') AND name = N'UX_SectionCharacteristicType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SectionCharacteristicType_Id ON [edfi].[SectionCharacteristicType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SeparationReasonType') AND name = N'UX_SeparationReasonType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SeparationReasonType_Id ON [edfi].[SeparationReasonType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SeparationType') AND name = N'UX_SeparationType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SeparationType_Id ON [edfi].[SeparationType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Session') AND name = N'UX_Session_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Session_Id ON [edfi].[Session]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SexType') AND name = N'UX_SexType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SexType_Id ON [edfi].[SexType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.SpecialEducationSettingType') AND name = N'UX_SpecialEducationSettingType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SpecialEducationSettingType_Id ON [edfi].[SpecialEducationSettingType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Staff') AND name = N'UX_Staff_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Staff_Id ON [edfi].[Staff]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StaffClassificationType') AND name = N'UX_StaffClassificationType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffClassificationType_Id ON [edfi].[StaffClassificationType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StaffCohortAssociation') AND name = N'UX_StaffCohortAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffCohortAssociation_Id ON [edfi].[StaffCohortAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StaffEducationOrganizationAssignmentAssociation') AND name = N'UX_StaffEducationOrganizationAssignmentAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffEducationOrganizationAssignmentAssociation_Id ON [edfi].[StaffEducationOrganizationAssignmentAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StaffEducationOrganizationEmploymentAssociation') AND name = N'UX_StaffEducationOrganizationEmploymentAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffEducationOrganizationEmploymentAssociation_Id ON [edfi].[StaffEducationOrganizationEmploymentAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StaffIdentificationSystemType') AND name = N'UX_StaffIdentificationSystemType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffIdentificationSystemType_Id ON [edfi].[StaffIdentificationSystemType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StaffProgramAssociation') AND name = N'UX_StaffProgramAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffProgramAssociation_Id ON [edfi].[StaffProgramAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StaffSchoolAssociation') AND name = N'UX_StaffSchoolAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffSchoolAssociation_Id ON [edfi].[StaffSchoolAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StaffSectionAssociation') AND name = N'UX_StaffSectionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffSectionAssociation_Id ON [edfi].[StaffSectionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StateAbbreviationType') AND name = N'UX_StateAbbreviationType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StateAbbreviationType_Id ON [edfi].[StateAbbreviationType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StateEducationAgencyFederalFunds') AND name = N'UX_StateEducationAgencyFederalFunds_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StateEducationAgencyFederalFunds_Id ON [edfi].[StateEducationAgencyFederalFunds]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.Student') AND name = N'UX_Student_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Student_Id ON [edfi].[Student]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentAcademicRecord') AND name = N'UX_StudentAcademicRecord_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentAcademicRecord_Id ON [edfi].[StudentAcademicRecord]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentAssessment') AND name = N'UX_StudentAssessment_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentAssessment_Id ON [edfi].[StudentAssessment]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentCharacteristicType') AND name = N'UX_StudentCharacteristicType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentCharacteristicType_Id ON [edfi].[StudentCharacteristicType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentCohortAssociation') AND name = N'UX_StudentCohortAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentCohortAssociation_Id ON [edfi].[StudentCohortAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentCompetencyObjective') AND name = N'UX_StudentCompetencyObjective_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentCompetencyObjective_Id ON [edfi].[StudentCompetencyObjective]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentDisciplineIncidentAssociation') AND name = N'UX_StudentDisciplineIncidentAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentDisciplineIncidentAssociation_Id ON [edfi].[StudentDisciplineIncidentAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentEducationOrganizationAssociation') AND name = N'UX_StudentEducationOrganizationAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentEducationOrganizationAssociation_Id ON [edfi].[StudentEducationOrganizationAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentGradebookEntry') AND name = N'UX_StudentGradebookEntry_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentGradebookEntry_Id ON [edfi].[StudentGradebookEntry]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentIdentificationSystemType') AND name = N'UX_StudentIdentificationSystemType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentIdentificationSystemType_Id ON [edfi].[StudentIdentificationSystemType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentInterventionAssociation') AND name = N'UX_StudentInterventionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentInterventionAssociation_Id ON [edfi].[StudentInterventionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentInterventionAttendanceEvent') AND name = N'UX_StudentInterventionAttendanceEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentInterventionAttendanceEvent_Id ON [edfi].[StudentInterventionAttendanceEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentLearningObjective') AND name = N'UX_StudentLearningObjective_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentLearningObjective_Id ON [edfi].[StudentLearningObjective]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentParentAssociation') AND name = N'UX_StudentParentAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentParentAssociation_Id ON [edfi].[StudentParentAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentParticipationCodeType') AND name = N'UX_StudentParticipationCodeType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentParticipationCodeType_Id ON [edfi].[StudentParticipationCodeType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentProgramAssociation') AND name = N'UX_StudentProgramAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentProgramAssociation_Id ON [edfi].[StudentProgramAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentProgramAttendanceEvent') AND name = N'UX_StudentProgramAttendanceEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentProgramAttendanceEvent_Id ON [edfi].[StudentProgramAttendanceEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentSchoolAssociation') AND name = N'UX_StudentSchoolAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAssociation_Id ON [edfi].[StudentSchoolAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentSchoolAttendanceEvent') AND name = N'UX_StudentSchoolAttendanceEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAttendanceEvent_Id ON [edfi].[StudentSchoolAttendanceEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentSectionAssociation') AND name = N'UX_StudentSectionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSectionAssociation_Id ON [edfi].[StudentSectionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.StudentSectionAttendanceEvent') AND name = N'UX_StudentSectionAttendanceEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSectionAttendanceEvent_Id ON [edfi].[StudentSectionAttendanceEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.TeachingCredentialBasisType') AND name = N'UX_TeachingCredentialBasisType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeachingCredentialBasisType_Id ON [edfi].[TeachingCredentialBasisType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.TeachingCredentialType') AND name = N'UX_TeachingCredentialType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeachingCredentialType_Id ON [edfi].[TeachingCredentialType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.TelephoneNumberType') AND name = N'UX_TelephoneNumberType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TelephoneNumberType_Id ON [edfi].[TelephoneNumberType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.TermType') AND name = N'UX_TermType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TermType_Id ON [edfi].[TermType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.TitleIPartAParticipantType') AND name = N'UX_TitleIPartAParticipantType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TitleIPartAParticipantType_Id ON [edfi].[TitleIPartAParticipantType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.TitleIPartASchoolDesignationType') AND name = N'UX_TitleIPartASchoolDesignationType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TitleIPartASchoolDesignationType_Id ON [edfi].[TitleIPartASchoolDesignationType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.VisaType') AND name = N'UX_VisaType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_VisaType_Id ON [edfi].[VisaType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfi.WeaponType') AND name = N'UX_WeaponType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_WeaponType_Id ON [edfi].[WeaponType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

