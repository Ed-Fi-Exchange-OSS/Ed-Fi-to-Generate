CREATE TRIGGER [edfi].[edfi_AbsenceEventCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AbsenceEventCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AbsenceEventCategoryDescriptor_TrackedDelete](AbsenceEventCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AbsenceEventCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AbsenceEventCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AbsenceEventCategoryDescriptor] ENABLE TRIGGER [edfi_AbsenceEventCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AcademicHonorCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AcademicHonorCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AcademicHonorCategoryDescriptor_TrackedDelete](AcademicHonorCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AcademicHonorCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AcademicHonorCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AcademicHonorCategoryDescriptor] ENABLE TRIGGER [edfi_AcademicHonorCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AcademicSubjectDescriptor_TR_DeleteTracking] ON [edfi].[AcademicSubjectDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AcademicSubjectDescriptor_TrackedDelete](AcademicSubjectDescriptorId, Id, ChangeVersion)
    SELECT  d.AcademicSubjectDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AcademicSubjectDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AcademicSubjectDescriptor] ENABLE TRIGGER [edfi_AcademicSubjectDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AcademicWeek_TR_DeleteTracking] ON [edfi].[AcademicWeek] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AcademicWeek_TrackedDelete](SchoolId, WeekIdentifier, Id, ChangeVersion)
    SELECT  SchoolId, WeekIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[AcademicWeek] ENABLE TRIGGER [edfi_AcademicWeek_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AccommodationDescriptor_TR_DeleteTracking] ON [edfi].[AccommodationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AccommodationDescriptor_TrackedDelete](AccommodationDescriptorId, Id, ChangeVersion)
    SELECT  d.AccommodationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AccommodationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AccommodationDescriptor] ENABLE TRIGGER [edfi_AccommodationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AccountClassificationDescriptor_TR_DeleteTracking] ON [edfi].[AccountClassificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AccountClassificationDescriptor_TrackedDelete](AccountClassificationDescriptorId, Id, ChangeVersion)
    SELECT  d.AccountClassificationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AccountClassificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AccountClassificationDescriptor] ENABLE TRIGGER [edfi_AccountClassificationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AccountCode_TR_DeleteTracking] ON [edfi].[AccountCode] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AccountCode_TrackedDelete](AccountClassificationDescriptorId, AccountCodeNumber, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    SELECT  AccountClassificationDescriptorId, AccountCodeNumber, EducationOrganizationId, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[AccountCode] ENABLE TRIGGER [edfi_AccountCode_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Account_TR_DeleteTracking] ON [edfi].[Account] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Account_TrackedDelete](AccountIdentifier, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    SELECT  AccountIdentifier, EducationOrganizationId, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Account] ENABLE TRIGGER [edfi_Account_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AccountabilityRating_TR_DeleteTracking] ON [edfi].[AccountabilityRating] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AccountabilityRating_TrackedDelete](EducationOrganizationId, RatingTitle, SchoolYear, Id, ChangeVersion)
    SELECT  EducationOrganizationId, RatingTitle, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[AccountabilityRating] ENABLE TRIGGER [edfi_AccountabilityRating_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AchievementCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AchievementCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AchievementCategoryDescriptor_TrackedDelete](AchievementCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AchievementCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AchievementCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AchievementCategoryDescriptor] ENABLE TRIGGER [edfi_AchievementCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Actual_TR_DeleteTracking] ON [edfi].[Actual] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Actual_TrackedDelete](AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    SELECT  AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Actual] ENABLE TRIGGER [edfi_Actual_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AdditionalCreditTypeDescriptor_TR_DeleteTracking] ON [edfi].[AdditionalCreditTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AdditionalCreditTypeDescriptor_TrackedDelete](AdditionalCreditTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.AdditionalCreditTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AdditionalCreditTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AdditionalCreditTypeDescriptor] ENABLE TRIGGER [edfi_AdditionalCreditTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AddressTypeDescriptor_TR_DeleteTracking] ON [edfi].[AddressTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AddressTypeDescriptor_TrackedDelete](AddressTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.AddressTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AddressTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AddressTypeDescriptor] ENABLE TRIGGER [edfi_AddressTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AdministrationEnvironmentDescriptor_TR_DeleteTracking] ON [edfi].[AdministrationEnvironmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AdministrationEnvironmentDescriptor_TrackedDelete](AdministrationEnvironmentDescriptorId, Id, ChangeVersion)
    SELECT  d.AdministrationEnvironmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AdministrationEnvironmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AdministrationEnvironmentDescriptor] ENABLE TRIGGER [edfi_AdministrationEnvironmentDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AdministrativeFundingControlDescriptor_TR_DeleteTracking] ON [edfi].[AdministrativeFundingControlDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AdministrativeFundingControlDescriptor_TrackedDelete](AdministrativeFundingControlDescriptorId, Id, ChangeVersion)
    SELECT  d.AdministrativeFundingControlDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AdministrativeFundingControlDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AdministrativeFundingControlDescriptor] ENABLE TRIGGER [edfi_AdministrativeFundingControlDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AssessmentCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentCategoryDescriptor_TrackedDelete](AssessmentCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentCategoryDescriptor] ENABLE TRIGGER [edfi_AssessmentCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AssessmentIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentIdentificationSystemDescriptor_TrackedDelete](AssessmentIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_AssessmentIdentificationSystemDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AssessmentItemCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentItemCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentItemCategoryDescriptor_TrackedDelete](AssessmentItemCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentItemCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentItemCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentItemCategoryDescriptor] ENABLE TRIGGER [edfi_AssessmentItemCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AssessmentItemResultDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentItemResultDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentItemResultDescriptor_TrackedDelete](AssessmentItemResultDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentItemResultDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentItemResultDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentItemResultDescriptor] ENABLE TRIGGER [edfi_AssessmentItemResultDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AssessmentItem_TR_DeleteTracking] ON [edfi].[AssessmentItem] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentItem_TrackedDelete](AssessmentIdentifier, IdentificationCode, Namespace, Id, ChangeVersion)
    SELECT  AssessmentIdentifier, IdentificationCode, Namespace, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[AssessmentItem] ENABLE TRIGGER [edfi_AssessmentItem_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AssessmentPeriodDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentPeriodDescriptor_TrackedDelete](AssessmentPeriodDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentPeriodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentPeriodDescriptor] ENABLE TRIGGER [edfi_AssessmentPeriodDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AssessmentReportingMethodDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentReportingMethodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentReportingMethodDescriptor_TrackedDelete](AssessmentReportingMethodDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentReportingMethodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentReportingMethodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentReportingMethodDescriptor] ENABLE TRIGGER [edfi_AssessmentReportingMethodDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Assessment_TR_DeleteTracking] ON [edfi].[Assessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Assessment_TrackedDelete](AssessmentIdentifier, Namespace, Id, ChangeVersion)
    SELECT  AssessmentIdentifier, Namespace, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Assessment] ENABLE TRIGGER [edfi_Assessment_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AttemptStatusDescriptor_TR_DeleteTracking] ON [edfi].[AttemptStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AttemptStatusDescriptor_TrackedDelete](AttemptStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.AttemptStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AttemptStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AttemptStatusDescriptor] ENABLE TRIGGER [edfi_AttemptStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_AttendanceEventCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AttendanceEventCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AttendanceEventCategoryDescriptor_TrackedDelete](AttendanceEventCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AttendanceEventCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AttendanceEventCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AttendanceEventCategoryDescriptor] ENABLE TRIGGER [edfi_AttendanceEventCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_BehaviorDescriptor_TR_DeleteTracking] ON [edfi].[BehaviorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_BehaviorDescriptor_TrackedDelete](BehaviorDescriptorId, Id, ChangeVersion)
    SELECT  d.BehaviorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BehaviorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[BehaviorDescriptor] ENABLE TRIGGER [edfi_BehaviorDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_BellSchedule_TR_DeleteTracking] ON [edfi].[BellSchedule] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_BellSchedule_TrackedDelete](BellScheduleName, SchoolId, Id, ChangeVersion)
    SELECT  BellScheduleName, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[BellSchedule] ENABLE TRIGGER [edfi_BellSchedule_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Budget_TR_DeleteTracking] ON [edfi].[Budget] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Budget_TrackedDelete](AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    SELECT  AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Budget] ENABLE TRIGGER [edfi_Budget_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CalendarDate_TR_DeleteTracking] ON [edfi].[CalendarDate] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CalendarDate_TrackedDelete](CalendarCode, Date, SchoolId, SchoolYear, Id, ChangeVersion)
    SELECT  CalendarCode, Date, SchoolId, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[CalendarDate] ENABLE TRIGGER [edfi_CalendarDate_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CalendarEventDescriptor_TR_DeleteTracking] ON [edfi].[CalendarEventDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CalendarEventDescriptor_TrackedDelete](CalendarEventDescriptorId, Id, ChangeVersion)
    SELECT  d.CalendarEventDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CalendarEventDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CalendarEventDescriptor] ENABLE TRIGGER [edfi_CalendarEventDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CalendarTypeDescriptor_TR_DeleteTracking] ON [edfi].[CalendarTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CalendarTypeDescriptor_TrackedDelete](CalendarTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CalendarTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CalendarTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CalendarTypeDescriptor] ENABLE TRIGGER [edfi_CalendarTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Calendar_TR_DeleteTracking] ON [edfi].[Calendar] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Calendar_TrackedDelete](CalendarCode, SchoolId, SchoolYear, Id, ChangeVersion)
    SELECT  CalendarCode, SchoolId, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Calendar] ENABLE TRIGGER [edfi_Calendar_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CareerPathwayDescriptor_TR_DeleteTracking] ON [edfi].[CareerPathwayDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CareerPathwayDescriptor_TrackedDelete](CareerPathwayDescriptorId, Id, ChangeVersion)
    SELECT  d.CareerPathwayDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CareerPathwayDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CareerPathwayDescriptor] ENABLE TRIGGER [edfi_CareerPathwayDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CharterApprovalAgencyTypeDescriptor_TR_DeleteTracking] ON [edfi].[CharterApprovalAgencyTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CharterApprovalAgencyTypeDescriptor_TrackedDelete](CharterApprovalAgencyTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CharterApprovalAgencyTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CharterApprovalAgencyTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CharterApprovalAgencyTypeDescriptor] ENABLE TRIGGER [edfi_CharterApprovalAgencyTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CharterStatusDescriptor_TR_DeleteTracking] ON [edfi].[CharterStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CharterStatusDescriptor_TrackedDelete](CharterStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.CharterStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CharterStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CharterStatusDescriptor] ENABLE TRIGGER [edfi_CharterStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CitizenshipStatusDescriptor_TR_DeleteTracking] ON [edfi].[CitizenshipStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CitizenshipStatusDescriptor_TrackedDelete](CitizenshipStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.CitizenshipStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CitizenshipStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CitizenshipStatusDescriptor] ENABLE TRIGGER [edfi_CitizenshipStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ClassPeriod_TR_DeleteTracking] ON [edfi].[ClassPeriod] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ClassPeriod_TrackedDelete](ClassPeriodName, SchoolId, Id, ChangeVersion)
    SELECT  ClassPeriodName, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[ClassPeriod] ENABLE TRIGGER [edfi_ClassPeriod_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ClassroomPositionDescriptor_TR_DeleteTracking] ON [edfi].[ClassroomPositionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ClassroomPositionDescriptor_TrackedDelete](ClassroomPositionDescriptorId, Id, ChangeVersion)
    SELECT  d.ClassroomPositionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ClassroomPositionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ClassroomPositionDescriptor] ENABLE TRIGGER [edfi_ClassroomPositionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CohortScopeDescriptor_TR_DeleteTracking] ON [edfi].[CohortScopeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CohortScopeDescriptor_TrackedDelete](CohortScopeDescriptorId, Id, ChangeVersion)
    SELECT  d.CohortScopeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CohortScopeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CohortScopeDescriptor] ENABLE TRIGGER [edfi_CohortScopeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CohortTypeDescriptor_TR_DeleteTracking] ON [edfi].[CohortTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CohortTypeDescriptor_TrackedDelete](CohortTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CohortTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CohortTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CohortTypeDescriptor] ENABLE TRIGGER [edfi_CohortTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CohortYearTypeDescriptor_TR_DeleteTracking] ON [edfi].[CohortYearTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CohortYearTypeDescriptor_TrackedDelete](CohortYearTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CohortYearTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CohortYearTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CohortYearTypeDescriptor] ENABLE TRIGGER [edfi_CohortYearTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Cohort_TR_DeleteTracking] ON [edfi].[Cohort] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Cohort_TrackedDelete](CohortIdentifier, EducationOrganizationId, Id, ChangeVersion)
    SELECT  CohortIdentifier, EducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Cohort] ENABLE TRIGGER [edfi_Cohort_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CommunityOrganization_TR_DeleteTracking] ON [edfi].[CommunityOrganization] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CommunityOrganization_TrackedDelete](CommunityOrganizationId, Id, ChangeVersion)
    SELECT  d.CommunityOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.CommunityOrganizationId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[CommunityOrganization] ENABLE TRIGGER [edfi_CommunityOrganization_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CommunityProviderLicense_TR_DeleteTracking] ON [edfi].[CommunityProviderLicense] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CommunityProviderLicense_TrackedDelete](CommunityProviderId, LicenseIdentifier, LicensingOrganization, Id, ChangeVersion)
    SELECT  CommunityProviderId, LicenseIdentifier, LicensingOrganization, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[CommunityProviderLicense] ENABLE TRIGGER [edfi_CommunityProviderLicense_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CommunityProvider_TR_DeleteTracking] ON [edfi].[CommunityProvider] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CommunityProvider_TrackedDelete](CommunityProviderId, Id, ChangeVersion)
    SELECT  d.CommunityProviderId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.CommunityProviderId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[CommunityProvider] ENABLE TRIGGER [edfi_CommunityProvider_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CompetencyLevelDescriptor_TR_DeleteTracking] ON [edfi].[CompetencyLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CompetencyLevelDescriptor_TrackedDelete](CompetencyLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.CompetencyLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CompetencyLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CompetencyLevelDescriptor] ENABLE TRIGGER [edfi_CompetencyLevelDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CompetencyObjective_TR_DeleteTracking] ON [edfi].[CompetencyObjective] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CompetencyObjective_TrackedDelete](EducationOrganizationId, Objective, ObjectiveGradeLevelDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, Objective, ObjectiveGradeLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[CompetencyObjective] ENABLE TRIGGER [edfi_CompetencyObjective_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ContactTypeDescriptor_TR_DeleteTracking] ON [edfi].[ContactTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ContactTypeDescriptor_TrackedDelete](ContactTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ContactTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ContactTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ContactTypeDescriptor] ENABLE TRIGGER [edfi_ContactTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ContentClassDescriptor_TR_DeleteTracking] ON [edfi].[ContentClassDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ContentClassDescriptor_TrackedDelete](ContentClassDescriptorId, Id, ChangeVersion)
    SELECT  d.ContentClassDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ContentClassDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ContentClassDescriptor] ENABLE TRIGGER [edfi_ContentClassDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ContinuationOfServicesReasonDescriptor_TR_DeleteTracking] ON [edfi].[ContinuationOfServicesReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ContinuationOfServicesReasonDescriptor_TrackedDelete](ContinuationOfServicesReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.ContinuationOfServicesReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ContinuationOfServicesReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ContinuationOfServicesReasonDescriptor] ENABLE TRIGGER [edfi_ContinuationOfServicesReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ContractedStaff_TR_DeleteTracking] ON [edfi].[ContractedStaff] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ContractedStaff_TrackedDelete](AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, StaffUSI, Id, ChangeVersion)
    SELECT  AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[ContractedStaff] ENABLE TRIGGER [edfi_ContractedStaff_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CostRateDescriptor_TR_DeleteTracking] ON [edfi].[CostRateDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CostRateDescriptor_TrackedDelete](CostRateDescriptorId, Id, ChangeVersion)
    SELECT  d.CostRateDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CostRateDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CostRateDescriptor] ENABLE TRIGGER [edfi_CostRateDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CountryDescriptor_TR_DeleteTracking] ON [edfi].[CountryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CountryDescriptor_TrackedDelete](CountryDescriptorId, Id, ChangeVersion)
    SELECT  d.CountryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CountryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CountryDescriptor] ENABLE TRIGGER [edfi_CountryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CourseAttemptResultDescriptor_TR_DeleteTracking] ON [edfi].[CourseAttemptResultDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseAttemptResultDescriptor_TrackedDelete](CourseAttemptResultDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseAttemptResultDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseAttemptResultDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseAttemptResultDescriptor] ENABLE TRIGGER [edfi_CourseAttemptResultDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CourseDefinedByDescriptor_TR_DeleteTracking] ON [edfi].[CourseDefinedByDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseDefinedByDescriptor_TrackedDelete](CourseDefinedByDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseDefinedByDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseDefinedByDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseDefinedByDescriptor] ENABLE TRIGGER [edfi_CourseDefinedByDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CourseGPAApplicabilityDescriptor_TR_DeleteTracking] ON [edfi].[CourseGPAApplicabilityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseGPAApplicabilityDescriptor_TrackedDelete](CourseGPAApplicabilityDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseGPAApplicabilityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseGPAApplicabilityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseGPAApplicabilityDescriptor] ENABLE TRIGGER [edfi_CourseGPAApplicabilityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CourseIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[CourseIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseIdentificationSystemDescriptor_TrackedDelete](CourseIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_CourseIdentificationSystemDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CourseLevelCharacteristicDescriptor_TR_DeleteTracking] ON [edfi].[CourseLevelCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseLevelCharacteristicDescriptor_TrackedDelete](CourseLevelCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseLevelCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseLevelCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseLevelCharacteristicDescriptor] ENABLE TRIGGER [edfi_CourseLevelCharacteristicDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CourseOffering_TR_DeleteTracking] ON [edfi].[CourseOffering] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseOffering_TrackedDelete](LocalCourseCode, SchoolId, SchoolYear, SessionName, Id, ChangeVersion)
    SELECT  LocalCourseCode, SchoolId, SchoolYear, SessionName, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[CourseOffering] ENABLE TRIGGER [edfi_CourseOffering_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CourseRepeatCodeDescriptor_TR_DeleteTracking] ON [edfi].[CourseRepeatCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseRepeatCodeDescriptor_TrackedDelete](CourseRepeatCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseRepeatCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseRepeatCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseRepeatCodeDescriptor] ENABLE TRIGGER [edfi_CourseRepeatCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CourseTranscript_TR_DeleteTracking] ON [edfi].[CourseTranscript] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseTranscript_TrackedDelete](CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId, Id, ChangeVersion)
    SELECT  CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[CourseTranscript] ENABLE TRIGGER [edfi_CourseTranscript_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Course_TR_DeleteTracking] ON [edfi].[Course] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Course_TrackedDelete](CourseCode, EducationOrganizationId, Id, ChangeVersion)
    SELECT  CourseCode, EducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Course] ENABLE TRIGGER [edfi_Course_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CredentialFieldDescriptor_TR_DeleteTracking] ON [edfi].[CredentialFieldDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CredentialFieldDescriptor_TrackedDelete](CredentialFieldDescriptorId, Id, ChangeVersion)
    SELECT  d.CredentialFieldDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CredentialFieldDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CredentialFieldDescriptor] ENABLE TRIGGER [edfi_CredentialFieldDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CredentialTypeDescriptor_TR_DeleteTracking] ON [edfi].[CredentialTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CredentialTypeDescriptor_TrackedDelete](CredentialTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CredentialTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CredentialTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CredentialTypeDescriptor] ENABLE TRIGGER [edfi_CredentialTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Credential_TR_DeleteTracking] ON [edfi].[Credential] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Credential_TrackedDelete](CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId, Id, ChangeVersion)
    SELECT  CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Credential] ENABLE TRIGGER [edfi_Credential_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CreditTypeDescriptor_TR_DeleteTracking] ON [edfi].[CreditTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CreditTypeDescriptor_TrackedDelete](CreditTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CreditTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CreditTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CreditTypeDescriptor] ENABLE TRIGGER [edfi_CreditTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_CurriculumUsedDescriptor_TR_DeleteTracking] ON [edfi].[CurriculumUsedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CurriculumUsedDescriptor_TrackedDelete](CurriculumUsedDescriptorId, Id, ChangeVersion)
    SELECT  d.CurriculumUsedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CurriculumUsedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CurriculumUsedDescriptor] ENABLE TRIGGER [edfi_CurriculumUsedDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DeliveryMethodDescriptor_TR_DeleteTracking] ON [edfi].[DeliveryMethodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DeliveryMethodDescriptor_TrackedDelete](DeliveryMethodDescriptorId, Id, ChangeVersion)
    SELECT  d.DeliveryMethodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DeliveryMethodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DeliveryMethodDescriptor] ENABLE TRIGGER [edfi_DeliveryMethodDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Descriptor_TR_DeleteTracking] ON [edfi].[Descriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Descriptor_TrackedDelete](DescriptorId, Id, ChangeVersion)
    SELECT  DescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Descriptor] ENABLE TRIGGER [edfi_Descriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DiagnosisDescriptor_TR_DeleteTracking] ON [edfi].[DiagnosisDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DiagnosisDescriptor_TrackedDelete](DiagnosisDescriptorId, Id, ChangeVersion)
    SELECT  d.DiagnosisDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DiagnosisDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DiagnosisDescriptor] ENABLE TRIGGER [edfi_DiagnosisDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DiplomaLevelDescriptor_TR_DeleteTracking] ON [edfi].[DiplomaLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DiplomaLevelDescriptor_TrackedDelete](DiplomaLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.DiplomaLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DiplomaLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DiplomaLevelDescriptor] ENABLE TRIGGER [edfi_DiplomaLevelDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DiplomaTypeDescriptor_TR_DeleteTracking] ON [edfi].[DiplomaTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DiplomaTypeDescriptor_TrackedDelete](DiplomaTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.DiplomaTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DiplomaTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DiplomaTypeDescriptor] ENABLE TRIGGER [edfi_DiplomaTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DisabilityDescriptor_TR_DeleteTracking] ON [edfi].[DisabilityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisabilityDescriptor_TrackedDelete](DisabilityDescriptorId, Id, ChangeVersion)
    SELECT  d.DisabilityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisabilityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisabilityDescriptor] ENABLE TRIGGER [edfi_DisabilityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DisabilityDesignationDescriptor_TR_DeleteTracking] ON [edfi].[DisabilityDesignationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisabilityDesignationDescriptor_TrackedDelete](DisabilityDesignationDescriptorId, Id, ChangeVersion)
    SELECT  d.DisabilityDesignationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisabilityDesignationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisabilityDesignationDescriptor] ENABLE TRIGGER [edfi_DisabilityDesignationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DisabilityDeterminationSourceTypeDescriptor_TR_DeleteTracking] ON [edfi].[DisabilityDeterminationSourceTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisabilityDeterminationSourceTypeDescriptor_TrackedDelete](DisabilityDeterminationSourceTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.DisabilityDeterminationSourceTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisabilityDeterminationSourceTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisabilityDeterminationSourceTypeDescriptor] ENABLE TRIGGER [edfi_DisabilityDeterminationSourceTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DisciplineActionLengthDifferenceReasonDescriptor_TR_DeleteTracking] ON [edfi].[DisciplineActionLengthDifferenceReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisciplineActionLengthDifferenceReasonDescriptor_TrackedDelete](DisciplineActionLengthDifferenceReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.DisciplineActionLengthDifferenceReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisciplineActionLengthDifferenceReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisciplineActionLengthDifferenceReasonDescriptor] ENABLE TRIGGER [edfi_DisciplineActionLengthDifferenceReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DisciplineAction_TR_DeleteTracking] ON [edfi].[DisciplineAction] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisciplineAction_TrackedDelete](DisciplineActionIdentifier, DisciplineDate, StudentUSI, Id, ChangeVersion)
    SELECT  DisciplineActionIdentifier, DisciplineDate, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[DisciplineAction] ENABLE TRIGGER [edfi_DisciplineAction_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DisciplineDescriptor_TR_DeleteTracking] ON [edfi].[DisciplineDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisciplineDescriptor_TrackedDelete](DisciplineDescriptorId, Id, ChangeVersion)
    SELECT  d.DisciplineDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisciplineDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisciplineDescriptor] ENABLE TRIGGER [edfi_DisciplineDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_DisciplineIncident_TR_DeleteTracking] ON [edfi].[DisciplineIncident] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisciplineIncident_TrackedDelete](IncidentIdentifier, SchoolId, Id, ChangeVersion)
    SELECT  IncidentIdentifier, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[DisciplineIncident] ENABLE TRIGGER [edfi_DisciplineIncident_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationContent_TR_DeleteTracking] ON [edfi].[EducationContent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationContent_TrackedDelete](ContentIdentifier, Id, ChangeVersion)
    SELECT  ContentIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationContent] ENABLE TRIGGER [edfi_EducationContent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationOrganizationCategoryDescriptor_TR_DeleteTracking] ON [edfi].[EducationOrganizationCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationCategoryDescriptor_TrackedDelete](EducationOrganizationCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.EducationOrganizationCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducationOrganizationCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EducationOrganizationCategoryDescriptor] ENABLE TRIGGER [edfi_EducationOrganizationCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationOrganizationIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[EducationOrganizationIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationIdentificationSystemDescriptor_TrackedDelete](EducationOrganizationIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.EducationOrganizationIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducationOrganizationIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EducationOrganizationIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_EducationOrganizationIdentificationSystemDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationOrganizationInterventionPrescriptionAssociation_TR_DeleteTracking] ON [edfi].[EducationOrganizationInterventionPrescriptionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationInterventionPrescriptionAssociation_TrackedDelete](EducationOrganizationId, InterventionPrescriptionEducationOrganizationId, InterventionPrescriptionIdentificationCode, Id, ChangeVersion)
    SELECT  EducationOrganizationId, InterventionPrescriptionEducationOrganizationId, InterventionPrescriptionIdentificationCode, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationOrganizationInterventionPrescriptionAssociation] ENABLE TRIGGER [edfi_EducationOrganizationInterventionPrescriptionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationOrganizationNetworkAssociation_TR_DeleteTracking] ON [edfi].[EducationOrganizationNetworkAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationNetworkAssociation_TrackedDelete](EducationOrganizationNetworkId, MemberEducationOrganizationId, Id, ChangeVersion)
    SELECT  EducationOrganizationNetworkId, MemberEducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationOrganizationNetworkAssociation] ENABLE TRIGGER [edfi_EducationOrganizationNetworkAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationOrganizationNetwork_TR_DeleteTracking] ON [edfi].[EducationOrganizationNetwork] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationNetwork_TrackedDelete](EducationOrganizationNetworkId, Id, ChangeVersion)
    SELECT  d.EducationOrganizationNetworkId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.EducationOrganizationNetworkId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[EducationOrganizationNetwork] ENABLE TRIGGER [edfi_EducationOrganizationNetwork_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationOrganizationPeerAssociation_TR_DeleteTracking] ON [edfi].[EducationOrganizationPeerAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationPeerAssociation_TrackedDelete](EducationOrganizationId, PeerEducationOrganizationId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, PeerEducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationOrganizationPeerAssociation] ENABLE TRIGGER [edfi_EducationOrganizationPeerAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationOrganization_TR_DeleteTracking] ON [edfi].[EducationOrganization] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganization_TrackedDelete](EducationOrganizationId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationOrganization] ENABLE TRIGGER [edfi_EducationOrganization_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationPlanDescriptor_TR_DeleteTracking] ON [edfi].[EducationPlanDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationPlanDescriptor_TrackedDelete](EducationPlanDescriptorId, Id, ChangeVersion)
    SELECT  d.EducationPlanDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducationPlanDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EducationPlanDescriptor] ENABLE TRIGGER [edfi_EducationPlanDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationServiceCenter_TR_DeleteTracking] ON [edfi].[EducationServiceCenter] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationServiceCenter_TrackedDelete](EducationServiceCenterId, Id, ChangeVersion)
    SELECT  d.EducationServiceCenterId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.EducationServiceCenterId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[EducationServiceCenter] ENABLE TRIGGER [edfi_EducationServiceCenter_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EducationalEnvironmentDescriptor_TR_DeleteTracking] ON [edfi].[EducationalEnvironmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationalEnvironmentDescriptor_TrackedDelete](EducationalEnvironmentDescriptorId, Id, ChangeVersion)
    SELECT  d.EducationalEnvironmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducationalEnvironmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EducationalEnvironmentDescriptor] ENABLE TRIGGER [edfi_EducationalEnvironmentDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ElectronicMailTypeDescriptor_TR_DeleteTracking] ON [edfi].[ElectronicMailTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ElectronicMailTypeDescriptor_TrackedDelete](ElectronicMailTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ElectronicMailTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ElectronicMailTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ElectronicMailTypeDescriptor] ENABLE TRIGGER [edfi_ElectronicMailTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EmploymentStatusDescriptor_TR_DeleteTracking] ON [edfi].[EmploymentStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EmploymentStatusDescriptor_TrackedDelete](EmploymentStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.EmploymentStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EmploymentStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EmploymentStatusDescriptor] ENABLE TRIGGER [edfi_EmploymentStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EntryGradeLevelReasonDescriptor_TR_DeleteTracking] ON [edfi].[EntryGradeLevelReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EntryGradeLevelReasonDescriptor_TrackedDelete](EntryGradeLevelReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.EntryGradeLevelReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EntryGradeLevelReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EntryGradeLevelReasonDescriptor] ENABLE TRIGGER [edfi_EntryGradeLevelReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EntryTypeDescriptor_TR_DeleteTracking] ON [edfi].[EntryTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EntryTypeDescriptor_TrackedDelete](EntryTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.EntryTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EntryTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EntryTypeDescriptor] ENABLE TRIGGER [edfi_EntryTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_EventCircumstanceDescriptor_TR_DeleteTracking] ON [edfi].[EventCircumstanceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EventCircumstanceDescriptor_TrackedDelete](EventCircumstanceDescriptorId, Id, ChangeVersion)
    SELECT  d.EventCircumstanceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EventCircumstanceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EventCircumstanceDescriptor] ENABLE TRIGGER [edfi_EventCircumstanceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ExitWithdrawTypeDescriptor_TR_DeleteTracking] ON [edfi].[ExitWithdrawTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ExitWithdrawTypeDescriptor_TrackedDelete](ExitWithdrawTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ExitWithdrawTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ExitWithdrawTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ExitWithdrawTypeDescriptor] ENABLE TRIGGER [edfi_ExitWithdrawTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_FeederSchoolAssociation_TR_DeleteTracking] ON [edfi].[FeederSchoolAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_FeederSchoolAssociation_TrackedDelete](BeginDate, FeederSchoolId, SchoolId, Id, ChangeVersion)
    SELECT  BeginDate, FeederSchoolId, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[FeederSchoolAssociation] ENABLE TRIGGER [edfi_FeederSchoolAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GeneralStudentProgramAssociation_TR_DeleteTracking] ON [edfi].[GeneralStudentProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GeneralStudentProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[GeneralStudentProgramAssociation] ENABLE TRIGGER [edfi_GeneralStudentProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GradeLevelDescriptor_TR_DeleteTracking] ON [edfi].[GradeLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradeLevelDescriptor_TrackedDelete](GradeLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.GradeLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GradeLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GradeLevelDescriptor] ENABLE TRIGGER [edfi_GradeLevelDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GradeTypeDescriptor_TR_DeleteTracking] ON [edfi].[GradeTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradeTypeDescriptor_TrackedDelete](GradeTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.GradeTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GradeTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GradeTypeDescriptor] ENABLE TRIGGER [edfi_GradeTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Grade_TR_DeleteTracking] ON [edfi].[Grade] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Grade_TrackedDelete](BeginDate, GradeTypeDescriptorId, GradingPeriodDescriptorId, GradingPeriodSchoolYear, GradingPeriodSequence, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, GradeTypeDescriptorId, GradingPeriodDescriptorId, GradingPeriodSchoolYear, GradingPeriodSequence, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Grade] ENABLE TRIGGER [edfi_Grade_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GradebookEntryTypeDescriptor_TR_DeleteTracking] ON [edfi].[GradebookEntryTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradebookEntryTypeDescriptor_TrackedDelete](GradebookEntryTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.GradebookEntryTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GradebookEntryTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GradebookEntryTypeDescriptor] ENABLE TRIGGER [edfi_GradebookEntryTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GradebookEntry_TR_DeleteTracking] ON [edfi].[GradebookEntry] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradebookEntry_TrackedDelete](DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    SELECT  DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[GradebookEntry] ENABLE TRIGGER [edfi_GradebookEntry_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GradingPeriodDescriptor_TR_DeleteTracking] ON [edfi].[GradingPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradingPeriodDescriptor_TrackedDelete](GradingPeriodDescriptorId, Id, ChangeVersion)
    SELECT  d.GradingPeriodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GradingPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GradingPeriodDescriptor] ENABLE TRIGGER [edfi_GradingPeriodDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GradingPeriod_TR_DeleteTracking] ON [edfi].[GradingPeriod] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradingPeriod_TrackedDelete](GradingPeriodDescriptorId, PeriodSequence, SchoolId, SchoolYear, Id, ChangeVersion)
    SELECT  GradingPeriodDescriptorId, PeriodSequence, SchoolId, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[GradingPeriod] ENABLE TRIGGER [edfi_GradingPeriod_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GraduationPlanTypeDescriptor_TR_DeleteTracking] ON [edfi].[GraduationPlanTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GraduationPlanTypeDescriptor_TrackedDelete](GraduationPlanTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.GraduationPlanTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GraduationPlanTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GraduationPlanTypeDescriptor] ENABLE TRIGGER [edfi_GraduationPlanTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GraduationPlan_TR_DeleteTracking] ON [edfi].[GraduationPlan] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GraduationPlan_TrackedDelete](EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, Id, ChangeVersion)
    SELECT  EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[GraduationPlan] ENABLE TRIGGER [edfi_GraduationPlan_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_GunFreeSchoolsActReportingStatusDescriptor_TR_DeleteTracking] ON [edfi].[GunFreeSchoolsActReportingStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GunFreeSchoolsActReportingStatusDescriptor_TrackedDelete](GunFreeSchoolsActReportingStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.GunFreeSchoolsActReportingStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GunFreeSchoolsActReportingStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GunFreeSchoolsActReportingStatusDescriptor] ENABLE TRIGGER [edfi_GunFreeSchoolsActReportingStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_HomelessPrimaryNighttimeResidenceDescriptor_TR_DeleteTracking] ON [edfi].[HomelessPrimaryNighttimeResidenceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_HomelessPrimaryNighttimeResidenceDescriptor_TrackedDelete](HomelessPrimaryNighttimeResidenceDescriptorId, Id, ChangeVersion)
    SELECT  d.HomelessPrimaryNighttimeResidenceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.HomelessPrimaryNighttimeResidenceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[HomelessPrimaryNighttimeResidenceDescriptor] ENABLE TRIGGER [edfi_HomelessPrimaryNighttimeResidenceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_HomelessProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[HomelessProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_HomelessProgramServiceDescriptor_TrackedDelete](HomelessProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.HomelessProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.HomelessProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[HomelessProgramServiceDescriptor] ENABLE TRIGGER [edfi_HomelessProgramServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_IdentificationDocumentUseDescriptor_TR_DeleteTracking] ON [edfi].[IdentificationDocumentUseDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_IdentificationDocumentUseDescriptor_TrackedDelete](IdentificationDocumentUseDescriptorId, Id, ChangeVersion)
    SELECT  d.IdentificationDocumentUseDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IdentificationDocumentUseDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[IdentificationDocumentUseDescriptor] ENABLE TRIGGER [edfi_IdentificationDocumentUseDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_IncidentLocationDescriptor_TR_DeleteTracking] ON [edfi].[IncidentLocationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_IncidentLocationDescriptor_TrackedDelete](IncidentLocationDescriptorId, Id, ChangeVersion)
    SELECT  d.IncidentLocationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IncidentLocationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[IncidentLocationDescriptor] ENABLE TRIGGER [edfi_IncidentLocationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_InstitutionTelephoneNumberTypeDescriptor_TR_DeleteTracking] ON [edfi].[InstitutionTelephoneNumberTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InstitutionTelephoneNumberTypeDescriptor_TrackedDelete](InstitutionTelephoneNumberTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.InstitutionTelephoneNumberTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InstitutionTelephoneNumberTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InstitutionTelephoneNumberTypeDescriptor] ENABLE TRIGGER [edfi_InstitutionTelephoneNumberTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_InteractivityStyleDescriptor_TR_DeleteTracking] ON [edfi].[InteractivityStyleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InteractivityStyleDescriptor_TrackedDelete](InteractivityStyleDescriptorId, Id, ChangeVersion)
    SELECT  d.InteractivityStyleDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InteractivityStyleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InteractivityStyleDescriptor] ENABLE TRIGGER [edfi_InteractivityStyleDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_InternetAccessDescriptor_TR_DeleteTracking] ON [edfi].[InternetAccessDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InternetAccessDescriptor_TrackedDelete](InternetAccessDescriptorId, Id, ChangeVersion)
    SELECT  d.InternetAccessDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InternetAccessDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InternetAccessDescriptor] ENABLE TRIGGER [edfi_InternetAccessDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_InterventionClassDescriptor_TR_DeleteTracking] ON [edfi].[InterventionClassDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InterventionClassDescriptor_TrackedDelete](InterventionClassDescriptorId, Id, ChangeVersion)
    SELECT  d.InterventionClassDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InterventionClassDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InterventionClassDescriptor] ENABLE TRIGGER [edfi_InterventionClassDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_InterventionEffectivenessRatingDescriptor_TR_DeleteTracking] ON [edfi].[InterventionEffectivenessRatingDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InterventionEffectivenessRatingDescriptor_TrackedDelete](InterventionEffectivenessRatingDescriptorId, Id, ChangeVersion)
    SELECT  d.InterventionEffectivenessRatingDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InterventionEffectivenessRatingDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InterventionEffectivenessRatingDescriptor] ENABLE TRIGGER [edfi_InterventionEffectivenessRatingDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_InterventionPrescription_TR_DeleteTracking] ON [edfi].[InterventionPrescription] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InterventionPrescription_TrackedDelete](EducationOrganizationId, InterventionPrescriptionIdentificationCode, Id, ChangeVersion)
    SELECT  EducationOrganizationId, InterventionPrescriptionIdentificationCode, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[InterventionPrescription] ENABLE TRIGGER [edfi_InterventionPrescription_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_InterventionStudy_TR_DeleteTracking] ON [edfi].[InterventionStudy] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InterventionStudy_TrackedDelete](EducationOrganizationId, InterventionStudyIdentificationCode, Id, ChangeVersion)
    SELECT  EducationOrganizationId, InterventionStudyIdentificationCode, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[InterventionStudy] ENABLE TRIGGER [edfi_InterventionStudy_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Intervention_TR_DeleteTracking] ON [edfi].[Intervention] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Intervention_TrackedDelete](EducationOrganizationId, InterventionIdentificationCode, Id, ChangeVersion)
    SELECT  EducationOrganizationId, InterventionIdentificationCode, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Intervention] ENABLE TRIGGER [edfi_Intervention_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LanguageDescriptor_TR_DeleteTracking] ON [edfi].[LanguageDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LanguageDescriptor_TrackedDelete](LanguageDescriptorId, Id, ChangeVersion)
    SELECT  d.LanguageDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LanguageDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LanguageDescriptor] ENABLE TRIGGER [edfi_LanguageDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LanguageInstructionProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[LanguageInstructionProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LanguageInstructionProgramServiceDescriptor_TrackedDelete](LanguageInstructionProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.LanguageInstructionProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LanguageInstructionProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LanguageInstructionProgramServiceDescriptor] ENABLE TRIGGER [edfi_LanguageInstructionProgramServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LanguageUseDescriptor_TR_DeleteTracking] ON [edfi].[LanguageUseDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LanguageUseDescriptor_TrackedDelete](LanguageUseDescriptorId, Id, ChangeVersion)
    SELECT  d.LanguageUseDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LanguageUseDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LanguageUseDescriptor] ENABLE TRIGGER [edfi_LanguageUseDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LearningObjective_TR_DeleteTracking] ON [edfi].[LearningObjective] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LearningObjective_TrackedDelete](LearningObjectiveId, Namespace, Id, ChangeVersion)
    SELECT  LearningObjectiveId, Namespace, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[LearningObjective] ENABLE TRIGGER [edfi_LearningObjective_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LearningStandardCategoryDescriptor_TR_DeleteTracking] ON [edfi].[LearningStandardCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LearningStandardCategoryDescriptor_TrackedDelete](LearningStandardCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.LearningStandardCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LearningStandardCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LearningStandardCategoryDescriptor] ENABLE TRIGGER [edfi_LearningStandardCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LearningStandard_TR_DeleteTracking] ON [edfi].[LearningStandard] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LearningStandard_TrackedDelete](LearningStandardId, Id, ChangeVersion)
    SELECT  LearningStandardId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[LearningStandard] ENABLE TRIGGER [edfi_LearningStandard_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LevelOfEducationDescriptor_TR_DeleteTracking] ON [edfi].[LevelOfEducationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LevelOfEducationDescriptor_TrackedDelete](LevelOfEducationDescriptorId, Id, ChangeVersion)
    SELECT  d.LevelOfEducationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LevelOfEducationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LevelOfEducationDescriptor] ENABLE TRIGGER [edfi_LevelOfEducationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LicenseStatusDescriptor_TR_DeleteTracking] ON [edfi].[LicenseStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LicenseStatusDescriptor_TrackedDelete](LicenseStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.LicenseStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LicenseStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LicenseStatusDescriptor] ENABLE TRIGGER [edfi_LicenseStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LicenseTypeDescriptor_TR_DeleteTracking] ON [edfi].[LicenseTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LicenseTypeDescriptor_TrackedDelete](LicenseTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.LicenseTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LicenseTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LicenseTypeDescriptor] ENABLE TRIGGER [edfi_LicenseTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LimitedEnglishProficiencyDescriptor_TR_DeleteTracking] ON [edfi].[LimitedEnglishProficiencyDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LimitedEnglishProficiencyDescriptor_TrackedDelete](LimitedEnglishProficiencyDescriptorId, Id, ChangeVersion)
    SELECT  d.LimitedEnglishProficiencyDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LimitedEnglishProficiencyDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LimitedEnglishProficiencyDescriptor] ENABLE TRIGGER [edfi_LimitedEnglishProficiencyDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LocalEducationAgencyCategoryDescriptor_TR_DeleteTracking] ON [edfi].[LocalEducationAgencyCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LocalEducationAgencyCategoryDescriptor_TrackedDelete](LocalEducationAgencyCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.LocalEducationAgencyCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LocalEducationAgencyCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LocalEducationAgencyCategoryDescriptor] ENABLE TRIGGER [edfi_LocalEducationAgencyCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LocalEducationAgency_TR_DeleteTracking] ON [edfi].[LocalEducationAgency] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LocalEducationAgency_TrackedDelete](LocalEducationAgencyId, Id, ChangeVersion)
    SELECT  d.LocalEducationAgencyId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.LocalEducationAgencyId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[LocalEducationAgency] ENABLE TRIGGER [edfi_LocalEducationAgency_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_LocaleDescriptor_TR_DeleteTracking] ON [edfi].[LocaleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LocaleDescriptor_TrackedDelete](LocaleDescriptorId, Id, ChangeVersion)
    SELECT  d.LocaleDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LocaleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LocaleDescriptor] ENABLE TRIGGER [edfi_LocaleDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Location_TR_DeleteTracking] ON [edfi].[Location] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Location_TrackedDelete](ClassroomIdentificationCode, SchoolId, Id, ChangeVersion)
    SELECT  ClassroomIdentificationCode, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Location] ENABLE TRIGGER [edfi_Location_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TR_DeleteTracking] ON [edfi].[MagnetSpecialProgramEmphasisSchoolDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TrackedDelete](MagnetSpecialProgramEmphasisSchoolDescriptorId, Id, ChangeVersion)
    SELECT  d.MagnetSpecialProgramEmphasisSchoolDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MagnetSpecialProgramEmphasisSchoolDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MagnetSpecialProgramEmphasisSchoolDescriptor] ENABLE TRIGGER [edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_MediumOfInstructionDescriptor_TR_DeleteTracking] ON [edfi].[MediumOfInstructionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MediumOfInstructionDescriptor_TrackedDelete](MediumOfInstructionDescriptorId, Id, ChangeVersion)
    SELECT  d.MediumOfInstructionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MediumOfInstructionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MediumOfInstructionDescriptor] ENABLE TRIGGER [edfi_MediumOfInstructionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_MethodCreditEarnedDescriptor_TR_DeleteTracking] ON [edfi].[MethodCreditEarnedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MethodCreditEarnedDescriptor_TrackedDelete](MethodCreditEarnedDescriptorId, Id, ChangeVersion)
    SELECT  d.MethodCreditEarnedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MethodCreditEarnedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MethodCreditEarnedDescriptor] ENABLE TRIGGER [edfi_MethodCreditEarnedDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_MigrantEducationProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[MigrantEducationProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MigrantEducationProgramServiceDescriptor_TrackedDelete](MigrantEducationProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.MigrantEducationProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MigrantEducationProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MigrantEducationProgramServiceDescriptor] ENABLE TRIGGER [edfi_MigrantEducationProgramServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_MonitoredDescriptor_TR_DeleteTracking] ON [edfi].[MonitoredDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MonitoredDescriptor_TrackedDelete](MonitoredDescriptorId, Id, ChangeVersion)
    SELECT  d.MonitoredDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MonitoredDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MonitoredDescriptor] ENABLE TRIGGER [edfi_MonitoredDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_NeglectedOrDelinquentProgramDescriptor_TR_DeleteTracking] ON [edfi].[NeglectedOrDelinquentProgramDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_NeglectedOrDelinquentProgramDescriptor_TrackedDelete](NeglectedOrDelinquentProgramDescriptorId, Id, ChangeVersion)
    SELECT  d.NeglectedOrDelinquentProgramDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NeglectedOrDelinquentProgramDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[NeglectedOrDelinquentProgramDescriptor] ENABLE TRIGGER [edfi_NeglectedOrDelinquentProgramDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_NeglectedOrDelinquentProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[NeglectedOrDelinquentProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_NeglectedOrDelinquentProgramServiceDescriptor_TrackedDelete](NeglectedOrDelinquentProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.NeglectedOrDelinquentProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NeglectedOrDelinquentProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[NeglectedOrDelinquentProgramServiceDescriptor] ENABLE TRIGGER [edfi_NeglectedOrDelinquentProgramServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_NetworkPurposeDescriptor_TR_DeleteTracking] ON [edfi].[NetworkPurposeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_NetworkPurposeDescriptor_TrackedDelete](NetworkPurposeDescriptorId, Id, ChangeVersion)
    SELECT  d.NetworkPurposeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NetworkPurposeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[NetworkPurposeDescriptor] ENABLE TRIGGER [edfi_NetworkPurposeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ObjectiveAssessment_TR_DeleteTracking] ON [edfi].[ObjectiveAssessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ObjectiveAssessment_TrackedDelete](AssessmentIdentifier, IdentificationCode, Namespace, Id, ChangeVersion)
    SELECT  AssessmentIdentifier, IdentificationCode, Namespace, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[ObjectiveAssessment] ENABLE TRIGGER [edfi_ObjectiveAssessment_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_OldEthnicityDescriptor_TR_DeleteTracking] ON [edfi].[OldEthnicityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_OldEthnicityDescriptor_TrackedDelete](OldEthnicityDescriptorId, Id, ChangeVersion)
    SELECT  d.OldEthnicityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OldEthnicityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[OldEthnicityDescriptor] ENABLE TRIGGER [edfi_OldEthnicityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_OpenStaffPosition_TR_DeleteTracking] ON [edfi].[OpenStaffPosition] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_OpenStaffPosition_TrackedDelete](EducationOrganizationId, RequisitionNumber, Id, ChangeVersion)
    SELECT  EducationOrganizationId, RequisitionNumber, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[OpenStaffPosition] ENABLE TRIGGER [edfi_OpenStaffPosition_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_OperationalStatusDescriptor_TR_DeleteTracking] ON [edfi].[OperationalStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_OperationalStatusDescriptor_TrackedDelete](OperationalStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.OperationalStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OperationalStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[OperationalStatusDescriptor] ENABLE TRIGGER [edfi_OperationalStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_OtherNameTypeDescriptor_TR_DeleteTracking] ON [edfi].[OtherNameTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_OtherNameTypeDescriptor_TrackedDelete](OtherNameTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.OtherNameTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OtherNameTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[OtherNameTypeDescriptor] ENABLE TRIGGER [edfi_OtherNameTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Parent_TR_DeleteTracking] ON [edfi].[Parent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Parent_TrackedDelete](ParentUSI, Id, ChangeVersion)
    SELECT  ParentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Parent] ENABLE TRIGGER [edfi_Parent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ParticipationDescriptor_TR_DeleteTracking] ON [edfi].[ParticipationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ParticipationDescriptor_TrackedDelete](ParticipationDescriptorId, Id, ChangeVersion)
    SELECT  d.ParticipationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ParticipationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ParticipationDescriptor] ENABLE TRIGGER [edfi_ParticipationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Payroll_TR_DeleteTracking] ON [edfi].[Payroll] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Payroll_TrackedDelete](AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, StaffUSI, Id, ChangeVersion)
    SELECT  AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Payroll] ENABLE TRIGGER [edfi_Payroll_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PerformanceBaseConversionDescriptor_TR_DeleteTracking] ON [edfi].[PerformanceBaseConversionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PerformanceBaseConversionDescriptor_TrackedDelete](PerformanceBaseConversionDescriptorId, Id, ChangeVersion)
    SELECT  d.PerformanceBaseConversionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PerformanceBaseConversionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PerformanceBaseConversionDescriptor] ENABLE TRIGGER [edfi_PerformanceBaseConversionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PerformanceLevelDescriptor_TR_DeleteTracking] ON [edfi].[PerformanceLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PerformanceLevelDescriptor_TrackedDelete](PerformanceLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.PerformanceLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PerformanceLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PerformanceLevelDescriptor] ENABLE TRIGGER [edfi_PerformanceLevelDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PersonalInformationVerificationDescriptor_TR_DeleteTracking] ON [edfi].[PersonalInformationVerificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PersonalInformationVerificationDescriptor_TrackedDelete](PersonalInformationVerificationDescriptorId, Id, ChangeVersion)
    SELECT  d.PersonalInformationVerificationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PersonalInformationVerificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PersonalInformationVerificationDescriptor] ENABLE TRIGGER [edfi_PersonalInformationVerificationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PopulationServedDescriptor_TR_DeleteTracking] ON [edfi].[PopulationServedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PopulationServedDescriptor_TrackedDelete](PopulationServedDescriptorId, Id, ChangeVersion)
    SELECT  d.PopulationServedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PopulationServedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PopulationServedDescriptor] ENABLE TRIGGER [edfi_PopulationServedDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PostSecondaryEventCategoryDescriptor_TR_DeleteTracking] ON [edfi].[PostSecondaryEventCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostSecondaryEventCategoryDescriptor_TrackedDelete](PostSecondaryEventCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.PostSecondaryEventCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostSecondaryEventCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PostSecondaryEventCategoryDescriptor] ENABLE TRIGGER [edfi_PostSecondaryEventCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PostSecondaryEvent_TR_DeleteTracking] ON [edfi].[PostSecondaryEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostSecondaryEvent_TrackedDelete](EventDate, PostSecondaryEventCategoryDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  EventDate, PostSecondaryEventCategoryDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[PostSecondaryEvent] ENABLE TRIGGER [edfi_PostSecondaryEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PostSecondaryInstitutionLevelDescriptor_TR_DeleteTracking] ON [edfi].[PostSecondaryInstitutionLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostSecondaryInstitutionLevelDescriptor_TrackedDelete](PostSecondaryInstitutionLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.PostSecondaryInstitutionLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostSecondaryInstitutionLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PostSecondaryInstitutionLevelDescriptor] ENABLE TRIGGER [edfi_PostSecondaryInstitutionLevelDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PostSecondaryInstitution_TR_DeleteTracking] ON [edfi].[PostSecondaryInstitution] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostSecondaryInstitution_TrackedDelete](PostSecondaryInstitutionId, Id, ChangeVersion)
    SELECT  d.PostSecondaryInstitutionId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.PostSecondaryInstitutionId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[PostSecondaryInstitution] ENABLE TRIGGER [edfi_PostSecondaryInstitution_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PostingResultDescriptor_TR_DeleteTracking] ON [edfi].[PostingResultDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostingResultDescriptor_TrackedDelete](PostingResultDescriptorId, Id, ChangeVersion)
    SELECT  d.PostingResultDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostingResultDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PostingResultDescriptor] ENABLE TRIGGER [edfi_PostingResultDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProficiencyDescriptor_TR_DeleteTracking] ON [edfi].[ProficiencyDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProficiencyDescriptor_TrackedDelete](ProficiencyDescriptorId, Id, ChangeVersion)
    SELECT  d.ProficiencyDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProficiencyDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProficiencyDescriptor] ENABLE TRIGGER [edfi_ProficiencyDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProgramAssignmentDescriptor_TR_DeleteTracking] ON [edfi].[ProgramAssignmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgramAssignmentDescriptor_TrackedDelete](ProgramAssignmentDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramAssignmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramAssignmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgramAssignmentDescriptor] ENABLE TRIGGER [edfi_ProgramAssignmentDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProgramCharacteristicDescriptor_TR_DeleteTracking] ON [edfi].[ProgramCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgramCharacteristicDescriptor_TrackedDelete](ProgramCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgramCharacteristicDescriptor] ENABLE TRIGGER [edfi_ProgramCharacteristicDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProgramSponsorDescriptor_TR_DeleteTracking] ON [edfi].[ProgramSponsorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgramSponsorDescriptor_TrackedDelete](ProgramSponsorDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramSponsorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramSponsorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgramSponsorDescriptor] ENABLE TRIGGER [edfi_ProgramSponsorDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProgramTypeDescriptor_TR_DeleteTracking] ON [edfi].[ProgramTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgramTypeDescriptor_TrackedDelete](ProgramTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgramTypeDescriptor] ENABLE TRIGGER [edfi_ProgramTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Program_TR_DeleteTracking] ON [edfi].[Program] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Program_TrackedDelete](EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Program] ENABLE TRIGGER [edfi_Program_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProgressDescriptor_TR_DeleteTracking] ON [edfi].[ProgressDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgressDescriptor_TrackedDelete](ProgressDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgressDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgressDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgressDescriptor] ENABLE TRIGGER [edfi_ProgressDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProgressLevelDescriptor_TR_DeleteTracking] ON [edfi].[ProgressLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgressLevelDescriptor_TrackedDelete](ProgressLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgressLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgressLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgressLevelDescriptor] ENABLE TRIGGER [edfi_ProgressLevelDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProviderCategoryDescriptor_TR_DeleteTracking] ON [edfi].[ProviderCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProviderCategoryDescriptor_TrackedDelete](ProviderCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.ProviderCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProviderCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProviderCategoryDescriptor] ENABLE TRIGGER [edfi_ProviderCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProviderProfitabilityDescriptor_TR_DeleteTracking] ON [edfi].[ProviderProfitabilityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProviderProfitabilityDescriptor_TrackedDelete](ProviderProfitabilityDescriptorId, Id, ChangeVersion)
    SELECT  d.ProviderProfitabilityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProviderProfitabilityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProviderProfitabilityDescriptor] ENABLE TRIGGER [edfi_ProviderProfitabilityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ProviderStatusDescriptor_TR_DeleteTracking] ON [edfi].[ProviderStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProviderStatusDescriptor_TrackedDelete](ProviderStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.ProviderStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProviderStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProviderStatusDescriptor] ENABLE TRIGGER [edfi_ProviderStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_PublicationStatusDescriptor_TR_DeleteTracking] ON [edfi].[PublicationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PublicationStatusDescriptor_TrackedDelete](PublicationStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.PublicationStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PublicationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PublicationStatusDescriptor] ENABLE TRIGGER [edfi_PublicationStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_RaceDescriptor_TR_DeleteTracking] ON [edfi].[RaceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RaceDescriptor_TrackedDelete](RaceDescriptorId, Id, ChangeVersion)
    SELECT  d.RaceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RaceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RaceDescriptor] ENABLE TRIGGER [edfi_RaceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ReasonExitedDescriptor_TR_DeleteTracking] ON [edfi].[ReasonExitedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ReasonExitedDescriptor_TrackedDelete](ReasonExitedDescriptorId, Id, ChangeVersion)
    SELECT  d.ReasonExitedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReasonExitedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ReasonExitedDescriptor] ENABLE TRIGGER [edfi_ReasonExitedDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ReasonNotTestedDescriptor_TR_DeleteTracking] ON [edfi].[ReasonNotTestedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ReasonNotTestedDescriptor_TrackedDelete](ReasonNotTestedDescriptorId, Id, ChangeVersion)
    SELECT  d.ReasonNotTestedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReasonNotTestedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ReasonNotTestedDescriptor] ENABLE TRIGGER [edfi_ReasonNotTestedDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_RecognitionTypeDescriptor_TR_DeleteTracking] ON [edfi].[RecognitionTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RecognitionTypeDescriptor_TrackedDelete](RecognitionTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.RecognitionTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RecognitionTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RecognitionTypeDescriptor] ENABLE TRIGGER [edfi_RecognitionTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_RelationDescriptor_TR_DeleteTracking] ON [edfi].[RelationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RelationDescriptor_TrackedDelete](RelationDescriptorId, Id, ChangeVersion)
    SELECT  d.RelationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RelationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RelationDescriptor] ENABLE TRIGGER [edfi_RelationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_RepeatIdentifierDescriptor_TR_DeleteTracking] ON [edfi].[RepeatIdentifierDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RepeatIdentifierDescriptor_TrackedDelete](RepeatIdentifierDescriptorId, Id, ChangeVersion)
    SELECT  d.RepeatIdentifierDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RepeatIdentifierDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RepeatIdentifierDescriptor] ENABLE TRIGGER [edfi_RepeatIdentifierDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ReportCard_TR_DeleteTracking] ON [edfi].[ReportCard] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ReportCard_TrackedDelete](EducationOrganizationId, GradingPeriodDescriptorId, GradingPeriodSchoolId, GradingPeriodSchoolYear, GradingPeriodSequence, StudentUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, GradingPeriodDescriptorId, GradingPeriodSchoolId, GradingPeriodSchoolYear, GradingPeriodSequence, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[ReportCard] ENABLE TRIGGER [edfi_ReportCard_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ReporterDescriptionDescriptor_TR_DeleteTracking] ON [edfi].[ReporterDescriptionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ReporterDescriptionDescriptor_TrackedDelete](ReporterDescriptionDescriptorId, Id, ChangeVersion)
    SELECT  d.ReporterDescriptionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReporterDescriptionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ReporterDescriptionDescriptor] ENABLE TRIGGER [edfi_ReporterDescriptionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ResidencyStatusDescriptor_TR_DeleteTracking] ON [edfi].[ResidencyStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ResidencyStatusDescriptor_TrackedDelete](ResidencyStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.ResidencyStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ResidencyStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ResidencyStatusDescriptor] ENABLE TRIGGER [edfi_ResidencyStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ResponseIndicatorDescriptor_TR_DeleteTracking] ON [edfi].[ResponseIndicatorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ResponseIndicatorDescriptor_TrackedDelete](ResponseIndicatorDescriptorId, Id, ChangeVersion)
    SELECT  d.ResponseIndicatorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ResponseIndicatorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ResponseIndicatorDescriptor] ENABLE TRIGGER [edfi_ResponseIndicatorDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ResponsibilityDescriptor_TR_DeleteTracking] ON [edfi].[ResponsibilityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ResponsibilityDescriptor_TrackedDelete](ResponsibilityDescriptorId, Id, ChangeVersion)
    SELECT  d.ResponsibilityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ResponsibilityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ResponsibilityDescriptor] ENABLE TRIGGER [edfi_ResponsibilityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_RestraintEventReasonDescriptor_TR_DeleteTracking] ON [edfi].[RestraintEventReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RestraintEventReasonDescriptor_TrackedDelete](RestraintEventReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.RestraintEventReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RestraintEventReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RestraintEventReasonDescriptor] ENABLE TRIGGER [edfi_RestraintEventReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_RestraintEvent_TR_DeleteTracking] ON [edfi].[RestraintEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RestraintEvent_TrackedDelete](RestraintEventIdentifier, SchoolId, StudentUSI, Id, ChangeVersion)
    SELECT  RestraintEventIdentifier, SchoolId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[RestraintEvent] ENABLE TRIGGER [edfi_RestraintEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ResultDatatypeTypeDescriptor_TR_DeleteTracking] ON [edfi].[ResultDatatypeTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ResultDatatypeTypeDescriptor_TrackedDelete](ResultDatatypeTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ResultDatatypeTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ResultDatatypeTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ResultDatatypeTypeDescriptor] ENABLE TRIGGER [edfi_ResultDatatypeTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_RetestIndicatorDescriptor_TR_DeleteTracking] ON [edfi].[RetestIndicatorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RetestIndicatorDescriptor_TrackedDelete](RetestIndicatorDescriptorId, Id, ChangeVersion)
    SELECT  d.RetestIndicatorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RetestIndicatorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RetestIndicatorDescriptor] ENABLE TRIGGER [edfi_RetestIndicatorDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SchoolCategoryDescriptor_TR_DeleteTracking] ON [edfi].[SchoolCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SchoolCategoryDescriptor_TrackedDelete](SchoolCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SchoolCategoryDescriptor] ENABLE TRIGGER [edfi_SchoolCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SchoolChoiceImplementStatusDescriptor_TR_DeleteTracking] ON [edfi].[SchoolChoiceImplementStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SchoolChoiceImplementStatusDescriptor_TrackedDelete](SchoolChoiceImplementStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolChoiceImplementStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolChoiceImplementStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SchoolChoiceImplementStatusDescriptor] ENABLE TRIGGER [edfi_SchoolChoiceImplementStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SchoolFoodServiceProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[SchoolFoodServiceProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SchoolFoodServiceProgramServiceDescriptor_TrackedDelete](SchoolFoodServiceProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolFoodServiceProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolFoodServiceProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SchoolFoodServiceProgramServiceDescriptor] ENABLE TRIGGER [edfi_SchoolFoodServiceProgramServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SchoolTypeDescriptor_TR_DeleteTracking] ON [edfi].[SchoolTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SchoolTypeDescriptor_TrackedDelete](SchoolTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SchoolTypeDescriptor] ENABLE TRIGGER [edfi_SchoolTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_School_TR_DeleteTracking] ON [edfi].[School] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_School_TrackedDelete](SchoolId, Id, ChangeVersion)
    SELECT  d.SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.SchoolId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[School] ENABLE TRIGGER [edfi_School_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SectionAttendanceTakenEvent_TR_DeleteTracking] ON [edfi].[SectionAttendanceTakenEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SectionAttendanceTakenEvent_TrackedDelete](CalendarCode, Date, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    SELECT  CalendarCode, Date, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[SectionAttendanceTakenEvent] ENABLE TRIGGER [edfi_SectionAttendanceTakenEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SectionCharacteristicDescriptor_TR_DeleteTracking] ON [edfi].[SectionCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SectionCharacteristicDescriptor_TrackedDelete](SectionCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.SectionCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SectionCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SectionCharacteristicDescriptor] ENABLE TRIGGER [edfi_SectionCharacteristicDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Section_TR_DeleteTracking] ON [edfi].[Section] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Section_TrackedDelete](LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    SELECT  LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Section] ENABLE TRIGGER [edfi_Section_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SeparationDescriptor_TR_DeleteTracking] ON [edfi].[SeparationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SeparationDescriptor_TrackedDelete](SeparationDescriptorId, Id, ChangeVersion)
    SELECT  d.SeparationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SeparationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SeparationDescriptor] ENABLE TRIGGER [edfi_SeparationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SeparationReasonDescriptor_TR_DeleteTracking] ON [edfi].[SeparationReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SeparationReasonDescriptor_TrackedDelete](SeparationReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.SeparationReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SeparationReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SeparationReasonDescriptor] ENABLE TRIGGER [edfi_SeparationReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_ServiceDescriptor_TR_DeleteTracking] ON [edfi].[ServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ServiceDescriptor_TrackedDelete](ServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.ServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ServiceDescriptor] ENABLE TRIGGER [edfi_ServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Session_TR_DeleteTracking] ON [edfi].[Session] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Session_TrackedDelete](SchoolId, SchoolYear, SessionName, Id, ChangeVersion)
    SELECT  SchoolId, SchoolYear, SessionName, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Session] ENABLE TRIGGER [edfi_Session_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SexDescriptor_TR_DeleteTracking] ON [edfi].[SexDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SexDescriptor_TrackedDelete](SexDescriptorId, Id, ChangeVersion)
    SELECT  d.SexDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SexDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SexDescriptor] ENABLE TRIGGER [edfi_SexDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SpecialEducationProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[SpecialEducationProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SpecialEducationProgramServiceDescriptor_TrackedDelete](SpecialEducationProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SpecialEducationProgramServiceDescriptor] ENABLE TRIGGER [edfi_SpecialEducationProgramServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_SpecialEducationSettingDescriptor_TR_DeleteTracking] ON [edfi].[SpecialEducationSettingDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SpecialEducationSettingDescriptor_TrackedDelete](SpecialEducationSettingDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationSettingDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationSettingDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SpecialEducationSettingDescriptor] ENABLE TRIGGER [edfi_SpecialEducationSettingDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffAbsenceEvent_TR_DeleteTracking] ON [edfi].[StaffAbsenceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffAbsenceEvent_TrackedDelete](AbsenceEventCategoryDescriptorId, EventDate, StaffUSI, Id, ChangeVersion)
    SELECT  AbsenceEventCategoryDescriptorId, EventDate, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StaffAbsenceEvent] ENABLE TRIGGER [edfi_StaffAbsenceEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffClassificationDescriptor_TR_DeleteTracking] ON [edfi].[StaffClassificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffClassificationDescriptor_TrackedDelete](StaffClassificationDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffClassificationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffClassificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StaffClassificationDescriptor] ENABLE TRIGGER [edfi_StaffClassificationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffCohortAssociation_TR_DeleteTracking] ON [edfi].[StaffCohortAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffCohortAssociation_TrackedDelete](BeginDate, CohortIdentifier, EducationOrganizationId, StaffUSI, Id, ChangeVersion)
    SELECT  BeginDate, CohortIdentifier, EducationOrganizationId, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StaffCohortAssociation] ENABLE TRIGGER [edfi_StaffCohortAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffEducationOrganizationAssignmentAssociation_TR_DeleteTracking] ON [edfi].[StaffEducationOrganizationAssignmentAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffEducationOrganizationAssignmentAssociation_TrackedDelete](BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI, Id, ChangeVersion)
    SELECT  BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StaffEducationOrganizationAssignmentAssociation] ENABLE TRIGGER [edfi_StaffEducationOrganizationAssignmentAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffEducationOrganizationContactAssociation_TR_DeleteTracking] ON [edfi].[StaffEducationOrganizationContactAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffEducationOrganizationContactAssociation_TrackedDelete](ContactTitle, EducationOrganizationId, StaffUSI, Id, ChangeVersion)
    SELECT  ContactTitle, EducationOrganizationId, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StaffEducationOrganizationContactAssociation] ENABLE TRIGGER [edfi_StaffEducationOrganizationContactAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffEducationOrganizationEmploymentAssociation_TR_DeleteTracking] ON [edfi].[StaffEducationOrganizationEmploymentAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffEducationOrganizationEmploymentAssociation_TrackedDelete](EducationOrganizationId, EmploymentStatusDescriptorId, HireDate, StaffUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, EmploymentStatusDescriptorId, HireDate, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StaffEducationOrganizationEmploymentAssociation] ENABLE TRIGGER [edfi_StaffEducationOrganizationEmploymentAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[StaffIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffIdentificationSystemDescriptor_TrackedDelete](StaffIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StaffIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_StaffIdentificationSystemDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffLeaveEventCategoryDescriptor_TR_DeleteTracking] ON [edfi].[StaffLeaveEventCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffLeaveEventCategoryDescriptor_TrackedDelete](StaffLeaveEventCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffLeaveEventCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffLeaveEventCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StaffLeaveEventCategoryDescriptor] ENABLE TRIGGER [edfi_StaffLeaveEventCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffLeave_TR_DeleteTracking] ON [edfi].[StaffLeave] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffLeave_TrackedDelete](BeginDate, StaffLeaveEventCategoryDescriptorId, StaffUSI, Id, ChangeVersion)
    SELECT  BeginDate, StaffLeaveEventCategoryDescriptorId, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StaffLeave] ENABLE TRIGGER [edfi_StaffLeave_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffProgramAssociation_TR_DeleteTracking] ON [edfi].[StaffProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffProgramAssociation_TrackedDelete](BeginDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StaffUSI, Id, ChangeVersion)
    SELECT  BeginDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StaffProgramAssociation] ENABLE TRIGGER [edfi_StaffProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffSchoolAssociation_TR_DeleteTracking] ON [edfi].[StaffSchoolAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffSchoolAssociation_TrackedDelete](ProgramAssignmentDescriptorId, SchoolId, StaffUSI, Id, ChangeVersion)
    SELECT  ProgramAssignmentDescriptorId, SchoolId, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StaffSchoolAssociation] ENABLE TRIGGER [edfi_StaffSchoolAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StaffSectionAssociation_TR_DeleteTracking] ON [edfi].[StaffSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffSectionAssociation_TrackedDelete](LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI, Id, ChangeVersion)
    SELECT  LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StaffSectionAssociation] ENABLE TRIGGER [edfi_StaffSectionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Staff_TR_DeleteTracking] ON [edfi].[Staff] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Staff_TrackedDelete](StaffUSI, Id, ChangeVersion)
    SELECT  StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Staff] ENABLE TRIGGER [edfi_Staff_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StateAbbreviationDescriptor_TR_DeleteTracking] ON [edfi].[StateAbbreviationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StateAbbreviationDescriptor_TrackedDelete](StateAbbreviationDescriptorId, Id, ChangeVersion)
    SELECT  d.StateAbbreviationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StateAbbreviationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StateAbbreviationDescriptor] ENABLE TRIGGER [edfi_StateAbbreviationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StateEducationAgency_TR_DeleteTracking] ON [edfi].[StateEducationAgency] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StateEducationAgency_TrackedDelete](StateEducationAgencyId, Id, ChangeVersion)
    SELECT  d.StateEducationAgencyId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.StateEducationAgencyId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[StateEducationAgency] ENABLE TRIGGER [edfi_StateEducationAgency_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentAcademicRecord_TR_DeleteTracking] ON [edfi].[StudentAcademicRecord] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentAcademicRecord_TrackedDelete](EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentAcademicRecord] ENABLE TRIGGER [edfi_StudentAcademicRecord_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentAssessment_TR_DeleteTracking] ON [edfi].[StudentAssessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentAssessment_TrackedDelete](AssessmentIdentifier, Namespace, StudentAssessmentIdentifier, StudentUSI, Id, ChangeVersion)
    SELECT  AssessmentIdentifier, Namespace, StudentAssessmentIdentifier, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentAssessment] ENABLE TRIGGER [edfi_StudentAssessment_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentCTEProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentCTEProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentCTEProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentCTEProgramAssociation] ENABLE TRIGGER [edfi_StudentCTEProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentCharacteristicDescriptor_TR_DeleteTracking] ON [edfi].[StudentCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentCharacteristicDescriptor_TrackedDelete](StudentCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StudentCharacteristicDescriptor] ENABLE TRIGGER [edfi_StudentCharacteristicDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentCohortAssociation_TR_DeleteTracking] ON [edfi].[StudentCohortAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentCohortAssociation_TrackedDelete](BeginDate, CohortIdentifier, EducationOrganizationId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, CohortIdentifier, EducationOrganizationId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentCohortAssociation] ENABLE TRIGGER [edfi_StudentCohortAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentCompetencyObjective_TR_DeleteTracking] ON [edfi].[StudentCompetencyObjective] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentCompetencyObjective_TrackedDelete](GradingPeriodDescriptorId, GradingPeriodSchoolId, GradingPeriodSchoolYear, GradingPeriodSequence, Objective, ObjectiveEducationOrganizationId, ObjectiveGradeLevelDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  GradingPeriodDescriptorId, GradingPeriodSchoolId, GradingPeriodSchoolYear, GradingPeriodSequence, Objective, ObjectiveEducationOrganizationId, ObjectiveGradeLevelDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentCompetencyObjective] ENABLE TRIGGER [edfi_StudentCompetencyObjective_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentDisciplineIncidentAssociation_TR_DeleteTracking] ON [edfi].[StudentDisciplineIncidentAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentDisciplineIncidentAssociation_TrackedDelete](IncidentIdentifier, SchoolId, StudentUSI, Id, ChangeVersion)
    SELECT  IncidentIdentifier, SchoolId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentDisciplineIncidentAssociation] ENABLE TRIGGER [edfi_StudentDisciplineIncidentAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentEducationOrganizationAssociation_TR_DeleteTracking] ON [edfi].[StudentEducationOrganizationAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentEducationOrganizationAssociation_TrackedDelete](EducationOrganizationId, StudentUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentEducationOrganizationAssociation] ENABLE TRIGGER [edfi_StudentEducationOrganizationAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentEducationOrganizationResponsibilityAssociation_TR_DeleteTracking] ON [edfi].[StudentEducationOrganizationResponsibilityAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentEducationOrganizationResponsibilityAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ResponsibilityDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, EducationOrganizationId, ResponsibilityDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentEducationOrganizationResponsibilityAssociation] ENABLE TRIGGER [edfi_StudentEducationOrganizationResponsibilityAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentGradebookEntry_TR_DeleteTracking] ON [edfi].[StudentGradebookEntry] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentGradebookEntry_TrackedDelete](BeginDate, DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentGradebookEntry] ENABLE TRIGGER [edfi_StudentGradebookEntry_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentHomelessProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentHomelessProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentHomelessProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentHomelessProgramAssociation] ENABLE TRIGGER [edfi_StudentHomelessProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[StudentIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentIdentificationSystemDescriptor_TrackedDelete](StudentIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StudentIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_StudentIdentificationSystemDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentInterventionAssociation_TR_DeleteTracking] ON [edfi].[StudentInterventionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentInterventionAssociation_TrackedDelete](EducationOrganizationId, InterventionIdentificationCode, StudentUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, InterventionIdentificationCode, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentInterventionAssociation] ENABLE TRIGGER [edfi_StudentInterventionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentInterventionAttendanceEvent_TR_DeleteTracking] ON [edfi].[StudentInterventionAttendanceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentInterventionAttendanceEvent_TrackedDelete](AttendanceEventCategoryDescriptorId, EducationOrganizationId, EventDate, InterventionIdentificationCode, StudentUSI, Id, ChangeVersion)
    SELECT  AttendanceEventCategoryDescriptorId, EducationOrganizationId, EventDate, InterventionIdentificationCode, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentInterventionAttendanceEvent] ENABLE TRIGGER [edfi_StudentInterventionAttendanceEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentLanguageInstructionProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentLanguageInstructionProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentLanguageInstructionProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentLanguageInstructionProgramAssociation] ENABLE TRIGGER [edfi_StudentLanguageInstructionProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentLearningObjective_TR_DeleteTracking] ON [edfi].[StudentLearningObjective] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentLearningObjective_TrackedDelete](GradingPeriodDescriptorId, GradingPeriodSchoolId, GradingPeriodSchoolYear, GradingPeriodSequence, LearningObjectiveId, Namespace, StudentUSI, Id, ChangeVersion)
    SELECT  GradingPeriodDescriptorId, GradingPeriodSchoolId, GradingPeriodSchoolYear, GradingPeriodSequence, LearningObjectiveId, Namespace, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentLearningObjective] ENABLE TRIGGER [edfi_StudentLearningObjective_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentMigrantEducationProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentMigrantEducationProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentMigrantEducationProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentMigrantEducationProgramAssociation] ENABLE TRIGGER [edfi_StudentMigrantEducationProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentNeglectedOrDelinquentProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentNeglectedOrDelinquentProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentNeglectedOrDelinquentProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentNeglectedOrDelinquentProgramAssociation] ENABLE TRIGGER [edfi_StudentNeglectedOrDelinquentProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentParentAssociation_TR_DeleteTracking] ON [edfi].[StudentParentAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentParentAssociation_TrackedDelete](ParentUSI, StudentUSI, Id, ChangeVersion)
    SELECT  ParentUSI, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentParentAssociation] ENABLE TRIGGER [edfi_StudentParentAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentParticipationCodeDescriptor_TR_DeleteTracking] ON [edfi].[StudentParticipationCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentParticipationCodeDescriptor_TrackedDelete](StudentParticipationCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentParticipationCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentParticipationCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StudentParticipationCodeDescriptor] ENABLE TRIGGER [edfi_StudentParticipationCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentProgramAssociation] ENABLE TRIGGER [edfi_StudentProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentProgramAttendanceEvent_TR_DeleteTracking] ON [edfi].[StudentProgramAttendanceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentProgramAttendanceEvent_TrackedDelete](AttendanceEventCategoryDescriptorId, EducationOrganizationId, EventDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  AttendanceEventCategoryDescriptorId, EducationOrganizationId, EventDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentProgramAttendanceEvent] ENABLE TRIGGER [edfi_StudentProgramAttendanceEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentSchoolAssociation_TR_DeleteTracking] ON [edfi].[StudentSchoolAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSchoolAssociation_TrackedDelete](EntryDate, SchoolId, StudentUSI, Id, ChangeVersion)
    SELECT  EntryDate, SchoolId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentSchoolAssociation] ENABLE TRIGGER [edfi_StudentSchoolAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentSchoolAttendanceEvent_TR_DeleteTracking] ON [edfi].[StudentSchoolAttendanceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSchoolAttendanceEvent_TrackedDelete](AttendanceEventCategoryDescriptorId, EventDate, SchoolId, SchoolYear, SessionName, StudentUSI, Id, ChangeVersion)
    SELECT  AttendanceEventCategoryDescriptorId, EventDate, SchoolId, SchoolYear, SessionName, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentSchoolAttendanceEvent] ENABLE TRIGGER [edfi_StudentSchoolAttendanceEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentSchoolFoodServiceProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentSchoolFoodServiceProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSchoolFoodServiceProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentSchoolFoodServiceProgramAssociation] ENABLE TRIGGER [edfi_StudentSchoolFoodServiceProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentSectionAssociation_TR_DeleteTracking] ON [edfi].[StudentSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSectionAssociation_TrackedDelete](BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentSectionAssociation] ENABLE TRIGGER [edfi_StudentSectionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentSectionAttendanceEvent_TR_DeleteTracking] ON [edfi].[StudentSectionAttendanceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSectionAttendanceEvent_TrackedDelete](AttendanceEventCategoryDescriptorId, EventDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, ChangeVersion)
    SELECT  AttendanceEventCategoryDescriptorId, EventDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[StudentSectionAttendanceEvent] ENABLE TRIGGER [edfi_StudentSectionAttendanceEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentSpecialEducationProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentSpecialEducationProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSpecialEducationProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentSpecialEducationProgramAssociation] ENABLE TRIGGER [edfi_StudentSpecialEducationProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_StudentTitleIPartAProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentTitleIPartAProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentTitleIPartAProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentTitleIPartAProgramAssociation] ENABLE TRIGGER [edfi_StudentTitleIPartAProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_Student_TR_DeleteTracking] ON [edfi].[Student] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Student_TrackedDelete](StudentUSI, Id, ChangeVersion)
    SELECT  StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Student] ENABLE TRIGGER [edfi_Student_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_TeachingCredentialBasisDescriptor_TR_DeleteTracking] ON [edfi].[TeachingCredentialBasisDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TeachingCredentialBasisDescriptor_TrackedDelete](TeachingCredentialBasisDescriptorId, Id, ChangeVersion)
    SELECT  d.TeachingCredentialBasisDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TeachingCredentialBasisDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TeachingCredentialBasisDescriptor] ENABLE TRIGGER [edfi_TeachingCredentialBasisDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_TeachingCredentialDescriptor_TR_DeleteTracking] ON [edfi].[TeachingCredentialDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TeachingCredentialDescriptor_TrackedDelete](TeachingCredentialDescriptorId, Id, ChangeVersion)
    SELECT  d.TeachingCredentialDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TeachingCredentialDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TeachingCredentialDescriptor] ENABLE TRIGGER [edfi_TeachingCredentialDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_TechnicalSkillsAssessmentDescriptor_TR_DeleteTracking] ON [edfi].[TechnicalSkillsAssessmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TechnicalSkillsAssessmentDescriptor_TrackedDelete](TechnicalSkillsAssessmentDescriptorId, Id, ChangeVersion)
    SELECT  d.TechnicalSkillsAssessmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TechnicalSkillsAssessmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TechnicalSkillsAssessmentDescriptor] ENABLE TRIGGER [edfi_TechnicalSkillsAssessmentDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_TelephoneNumberTypeDescriptor_TR_DeleteTracking] ON [edfi].[TelephoneNumberTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TelephoneNumberTypeDescriptor_TrackedDelete](TelephoneNumberTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.TelephoneNumberTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TelephoneNumberTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TelephoneNumberTypeDescriptor] ENABLE TRIGGER [edfi_TelephoneNumberTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_TermDescriptor_TR_DeleteTracking] ON [edfi].[TermDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TermDescriptor_TrackedDelete](TermDescriptorId, Id, ChangeVersion)
    SELECT  d.TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TermDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TermDescriptor] ENABLE TRIGGER [edfi_TermDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_TitleIPartAParticipantDescriptor_TR_DeleteTracking] ON [edfi].[TitleIPartAParticipantDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TitleIPartAParticipantDescriptor_TrackedDelete](TitleIPartAParticipantDescriptorId, Id, ChangeVersion)
    SELECT  d.TitleIPartAParticipantDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TitleIPartAParticipantDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TitleIPartAParticipantDescriptor] ENABLE TRIGGER [edfi_TitleIPartAParticipantDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_TitleIPartASchoolDesignationDescriptor_TR_DeleteTracking] ON [edfi].[TitleIPartASchoolDesignationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TitleIPartASchoolDesignationDescriptor_TrackedDelete](TitleIPartASchoolDesignationDescriptorId, Id, ChangeVersion)
    SELECT  d.TitleIPartASchoolDesignationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TitleIPartASchoolDesignationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TitleIPartASchoolDesignationDescriptor] ENABLE TRIGGER [edfi_TitleIPartASchoolDesignationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_TribalAffiliationDescriptor_TR_DeleteTracking] ON [edfi].[TribalAffiliationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TribalAffiliationDescriptor_TrackedDelete](TribalAffiliationDescriptorId, Id, ChangeVersion)
    SELECT  d.TribalAffiliationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TribalAffiliationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TribalAffiliationDescriptor] ENABLE TRIGGER [edfi_TribalAffiliationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_VisaDescriptor_TR_DeleteTracking] ON [edfi].[VisaDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_VisaDescriptor_TrackedDelete](VisaDescriptorId, Id, ChangeVersion)
    SELECT  d.VisaDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VisaDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[VisaDescriptor] ENABLE TRIGGER [edfi_VisaDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfi].[edfi_WeaponDescriptor_TR_DeleteTracking] ON [edfi].[WeaponDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_WeaponDescriptor_TrackedDelete](WeaponDescriptorId, Id, ChangeVersion)
    SELECT  d.WeaponDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.WeaponDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[WeaponDescriptor] ENABLE TRIGGER [edfi_WeaponDescriptor_TR_DeleteTracking]
GO


