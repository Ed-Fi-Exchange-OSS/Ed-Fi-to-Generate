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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The category of local education agency/district. For example: Independent or Charter.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'TitleIinstructionalServiceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'TitleIProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'K12LeaTitleISupportServiceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'MepProjectTypeDescriptorId'
GO

-- Extended Properties [extension].[CedsSchool] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an extension of edfi.School.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency by the State Education Agency (SEA).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'CedsSchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the identifier of the education organization that approves charter school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'CharterSchoolApprovalAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the identifier of the education organization Network.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'EducationOrgabizationNetworkId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The classification of participation by a school in the National School Lunch Program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'NationalSchoolLunchProgramStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that the school was restructured, transformed or otherwise changed as a consequence of the state''s accountability system under ESEA or as a result of School Improvement Grants (SIG).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'ReconstitutedStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that a school offers career and technical education or other educational services in which some or all students are enrolled at a separate school of record and attend the shared-time school on a part-time basis.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'SharedTimeIndicatorDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school by the state education agency (SEA).  Also known as the State School Identification Number (ID).  This ID cannot be updated through this file.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'VirtualSchoolStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The unique number a SEA assigns to the contract (or charter) that authorizes the charter school to operate in the state under the state’s charter school legislation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'ContractIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'a metric that a state uses to determine the high poverty and low poverty schools', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'StatePovertyDesignationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchool', @level2type=N'COLUMN', @level2name=N'MepProjectTypeDescriptorId'
GO

-- Extended Properties [extension].[CedsSchoolAccountability] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an extension of edfi.School Accountability', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolAccountability'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency by the State Education Agency (SEA).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolAccountability', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The School Year', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolAccountability', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether the school or local education agency (LEA) submitted a Gun-Free Schools Act (GFSA) of 1994 report to the state, as defined by Title 18, Section 921.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolAccountability', @level2type=N'COLUMN', @level2name=N'GunFreeSchoolsActReportingStatusDescriptorId'
GO

-- Extended Properties [extension].[CedsSchoolComprehensiveAndTargetedSupport] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation for School Support and Improvement.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolComprehensiveAndTargetedSupport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolComprehensiveAndTargetedSupport', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The reason for identification for targeted support and improvement (TSI). ', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolComprehensiveAndTargetedSupport', @level2type=N'COLUMN', @level2name=N'ComprehensiveAndTargetedSupportDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication the school is designated by the state as a comprehensive support and improvement (CSI) or targeted support and improvement (TSI) school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolComprehensiveAndTargetedSupport', @level2type=N'COLUMN', @level2name=N'ComprehensiveSupportDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The reasons for identification for comprehensive support and improvement (CSI).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolComprehensiveAndTargetedSupport', @level2type=N'COLUMN', @level2name=N'TargetedSupportDescriptorId'
GO

-- Extended Properties [extension].[CedsSchoolCustomIndicatorStatusType] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity extends the School Indicator Status of CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s indicator Status per the Indicator Status Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType', @level2type=N'COLUMN', @level2name=N'IndicatorStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s indicator Status''s Subgroup, such as American Indian - Alaska Native.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType', @level2type=N'COLUMN', @level2name=N'IndicatorStatusSubgroupDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s indicator Status''s Subgroup Type, such as Race.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType', @level2type=N'COLUMN', @level2name=N'IndicatorStatusSubgroupTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s indicator Status Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType', @level2type=N'COLUMN', @level2name=N'IndicatorStatusTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s State Defined indicator Status per the Indicator Status Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType', @level2type=N'COLUMN', @level2name=N'StatedDefinedCustomIndicatorStatusType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s State Defined indicator Status per the Indicator Status Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType', @level2type=N'COLUMN', @level2name=N'StatedDefinedIndicatorStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType', @level2type=N'COLUMN', @level2name=N'RecordStartDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolCustomIndicatorStatusType', @level2type=N'COLUMN', @level2name=N'RecordEndDateTime'
GO

-- Extended Properties [extension].[CedsSchoolIndicatorStatus] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity extends the School Indicator Status of CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolIndicatorStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s indicator Status per the Indicator Status Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolIndicatorStatus', @level2type=N'COLUMN', @level2name=N'IndicatorStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s indicator Status''s Subgroup, such as American Indian - Alaska Native.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolIndicatorStatus', @level2type=N'COLUMN', @level2name=N'IndicatorStatusSubgroupDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s indicator Status''s Subgroup Type, such as Race.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolIndicatorStatus', @level2type=N'COLUMN', @level2name=N'IndicatorStatusSubgroupTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s indicator Status Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolIndicatorStatus', @level2type=N'COLUMN', @level2name=N'IndicatorStatusTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolIndicatorStatus', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s State Defined indicator Status per the Indicator Status Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolIndicatorStatus', @level2type=N'COLUMN', @level2name=N'StatedDefinedIndicatorStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolIndicatorStatus', @level2type=N'COLUMN', @level2name=N'RecordStartDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolIndicatorStatus', @level2type=N'COLUMN', @level2name=N'RecordEndDateTime'
GO

-- Extended Properties [extension].[CedsSchoolStatus] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an extension of edfi.School Status', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolStatus', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s performance indicator on the progress in achieving English Language proficiency indicator.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolStatus', @level2type=N'COLUMN', @level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s status to indicate if it''s in the dangerous.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolStatus', @level2type=N'COLUMN', @level2name=N'SchoolDangerousStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s performance on the progress in State Defined achieving English Language proficiency indicator.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolStatus', @level2type=N'COLUMN', @level2name=N'ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSchoolStatus', @level2type=N'COLUMN', @level2name=N'ConsolidatedMepFundsStatus'
GO

-- Extended Properties [extension].[CedsSpecialEducationStaffCategory] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSpecialEducationStaffCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Id.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSpecialEducationStaffCategory', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Staff USI.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSpecialEducationStaffCategory', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Special Education Program Service Category', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsSpecialEducationStaffCategory', @level2type=N'COLUMN', @level2name=N'SpecialEducationProgramServiceDescriptorId'
GO

-- Extended Properties [extension].[CedsStudentAssessment] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'AcademicSubjectDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'AdministrationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'AssessedGradeLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'CedsAssessmentTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'CedsAssessmentVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'StateFullAcademicYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'LEAFullAcademicYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'SchoolFullAcademicYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'RecordStartDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentAssessment', @level2type=N'COLUMN', @level2name=N'RecordEndDateTime'
GO

-- Extended Properties [extension].[CedsStudentCTEProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an extension to edfi.StudentCTEProgramAssociation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the Student was associated with the Program or service.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization that provides the program', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the table ProgramTypeDescriptor', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the table edfi.Student ', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The types of placement after secondary education.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'DisplacementTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The types of perkins LEP Status', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'PerkinsLEPStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'AdvancedTrainingEnrollmentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'CteParticipant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentCTEProgramAssociation', @level2type=N'COLUMN', @level2name=N'CteConcentrator'
GO

-- Extended Properties [extension].[CedsStudentHomelessProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentHomelessProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentHomelessProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentHomelessProgramAssociation', @level2type=N'COLUMN', @level2name=N'CedsProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentHomelessProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentHomelessProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentHomelessProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentHomelessProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentHomelessProgramAssociation', @level2type=N'COLUMN', @level2name=N'HomelessServicedIndicator'
GO

-- Extended Properties [extension].[CedsStudentMigrantEducationProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity extends the StudentMigrantEducationProgramAssociation to provide additional elements needed for the population of Generate.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of school/migrant education program in which instruction and/or support services are provided.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentMigrantEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'MigrantEducationProgramEnrollmentTypeDescriptorId'
GO

-- Extended Properties [extension].[CedsStudentNoDProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an extension to edfi.StudentCTEProgramAssociation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentNoDProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the Student was associated with the Program or service.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentNoDProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentNoDProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization that provides the program', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentNoDProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentNoDProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the table ProgramTypeDescriptor', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentNoDProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the table edfi.Student ', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentNoDProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The types of placement after secondary education.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CedsStudentNoDProgramAssociation', @level2type=N'COLUMN', @level2name=N'DisplacementTypeDescriptorId'
GO

-- Extended Properties [extension].[CharterContract] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an extension attribute of edfi.School.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CharterContract'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The unique number a SEA assigns to the contract (or charter) that authorizes the charter school to operate in the state under the state’s charter school legislation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CharterContract', @level2type=N'COLUMN', @level2name=N'ContractIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The effective date of the contract (or charter) that an approved charter school authorizer authorized the charter school to operate in the state under the state’s charter school legislation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CharterContract', @level2type=N'COLUMN', @level2name=N'ApprovalDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date by which the charter school must renew its contract (or charter) with an approved charter school authorizer in order to continue to operate in the state under the state’s charter school legislation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CharterContract', @level2type=N'COLUMN', @level2name=N'RenewalDate'
GO

-- Extended Properties [extension].[CharterSchoolApprovalAgency] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an organizzation that approves the charter school', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CharterSchoolApprovalAgency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the identifier of the education organization that approves charter school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CharterSchoolApprovalAgency', @level2type=N'COLUMN', @level2name=N'CharterSchoolApprovalAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the type of the education organization that approves charter school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CharterSchoolApprovalAgency', @level2type=N'COLUMN', @level2name=N'CharterApprovalAgencyTypeDescriptorId'
GO

-- Extended Properties [extension].[CharterSchoolManagementOrganizationTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CharterSchoolManagementOrganizationType', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CharterSchoolManagementOrganizationTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CharterSchoolManagementOrganizationTypeDescriptor', @level2type=N'COLUMN', @level2name=N'CharterSchoolManagementOrganizationTypeDescriptorId'
GO

-- Extended Properties [extension].[ComprehensiveAndTargetedSupportDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication the school is designated by the state as a comprehensive support and improvement (CSI) or targeted support and improvement (TSI) school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ComprehensiveAndTargetedSupportDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ComprehensiveAndTargetedSupportDescriptor', @level2type=N'COLUMN', @level2name=N'ComprehensiveAndTargetedSupportDescriptorId'
GO

-- Extended Properties [extension].[ComprehensiveSupportDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The reasons for identification for comprehensive support and improvement (CSI).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ComprehensiveSupportDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ComprehensiveSupportDescriptor', @level2type=N'COLUMN', @level2name=N'ComprehensiveSupportDescriptorId'
GO

-- Extended Properties [extension].[DisciplineActionDiscipline] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionDiscipline'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'CedsDisciplineActionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'DisciplineDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'DisciplineDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency by the State Education Agency (SEA).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'IdeaInterimRemovalTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'IdeaInterimRemovalReasonDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'DisciplineMethodFirearmDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'IDEADisciplineMethodFirearmDescriptorId'
GO

-- Extended Properties [extension].[DisciplineMethodFirearmDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineMethodFirearmDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineMethodFirearmDescriptor', @level2type=N'COLUMN', @level2name=N'DisciplineMethodFirearmDescriptorId'
GO

-- Extended Properties [extension].[DisciplineTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An extension of the Discipline Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineTypeDescriptor', @level2type=N'COLUMN', @level2name=N'DisciplineTypeDescriptorId'
GO

-- Extended Properties [extension].[DisplacementTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisplacementTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisplacementTypeDescriptor', @level2type=N'COLUMN', @level2name=N'DisplacementTypeDescriptorId'
GO

-- Extended Properties [extension].[EducationOrganizationFederalFunding] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents funding for the organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Federal Program Code as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'FederalProgramCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Federal Programs Funding Allocation as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'FederalProgramsFundingAllocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Parent Involvement Reservation Funds as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'ParentalInvolvmementReservationFunds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LEA exercises alternative funding ', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'REAPAlternativeFundingStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationFederalFunding', @level2type=N'COLUMN', @level2name=N'FederalProgramFundingAllocationTypeDescriptorId'
GO

-- Extended Properties [extension].[EducationOrganizationNetworkExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationNetworkExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a network of education organizations.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationNetworkExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationNetworkId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an extension to EducationOrganizationNetwork.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EducationOrganizationNetworkExtension', @level2type=N'COLUMN', @level2name=N'CharterSchoolManagementOrganizationTypeDescriptorId'
GO

-- Extended Properties [extension].[EmergencyorProvisionalCredentialStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the EmergencyorProvisionalCredentialStatus of a teacher as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EmergencyorProvisionalCredentialStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'EmergencyorProvisionalCredentialStatusDescriptor', @level2type=N'COLUMN', @level2name=N'EmergencyorProvisionalCredentialStatusDescriptorId'
GO

-- Extended Properties [extension].[FederalProgramFundingAllocationTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'FederalProgramFundingAllocationTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'FederalProgramFundingAllocationTypeDescriptor', @level2type=N'COLUMN', @level2name=N'FederalProgramFundingAllocationTypeDescriptorId'
GO

-- Extended Properties [extension].[IDEADisciplineMethodFirearmDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IDEADisciplineMethodFirearmDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IDEADisciplineMethodFirearmDescriptor', @level2type=N'COLUMN', @level2name=N'IDEADisciplineMethodFirearmDescriptorId'
GO

-- Extended Properties [extension].[IdeaInterimRemovalReasonDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IdeaInterimRemovalReasonDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IdeaInterimRemovalReasonDescriptor', @level2type=N'COLUMN', @level2name=N'IdeaInterimRemovalReasonDescriptorId'
GO

-- Extended Properties [extension].[IdeaInterimRemovalTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IdeaInterimRemovalTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IdeaInterimRemovalTypeDescriptor', @level2type=N'COLUMN', @level2name=N'IdeaInterimRemovalTypeDescriptorId'
GO

-- Extended Properties [extension].[IndicatorStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Indicator Status as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IndicatorStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IndicatorStatusDescriptor', @level2type=N'COLUMN', @level2name=N'IndicatorStatusDescriptorId'
GO

-- Extended Properties [extension].[IndicatorStatusSubgroupDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Indicator Status''s SubGroup per the Indicator Status Subgroup Type as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IndicatorStatusSubgroupDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IndicatorStatusSubgroupDescriptor', @level2type=N'COLUMN', @level2name=N'IndicatorStatusSubgroupDescriptorId'
GO

-- Extended Properties [extension].[IndicatorStatusSubgroupTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Indicator Status''s SubGroup Type as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IndicatorStatusSubgroupTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IndicatorStatusSubgroupTypeDescriptor', @level2type=N'COLUMN', @level2name=N'IndicatorStatusSubgroupTypeDescriptorId'
GO

-- Extended Properties [extension].[IndicatorStatusTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Indicator Status Type as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IndicatorStatusTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IndicatorStatusTypeDescriptor', @level2type=N'COLUMN', @level2name=N'IndicatorStatusTypeDescriptorId'
GO

-- Extended Properties [extension].[InexperiencedStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the InexperiencedStatus of a teacher as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'InexperiencedStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'InexperiencedStatusDescriptor', @level2type=N'COLUMN', @level2name=N'InexperiencedStatusDescriptorId'
GO

-- Extended Properties [extension].[K12LeaTitleISupportServiceDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'K12LeaTitleISupportServiceDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'K12LeaTitleISupportServiceDescriptor', @level2type=N'COLUMN', @level2name=N'K12LeaTitleISupportServiceDescriptorId'
GO

-- Extended Properties [extension].[LocalEducationAgencyTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Local Education Agency Type as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTypeDescriptor', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyTypeDescriptorId'
GO

-- Extended Properties [extension].[MepProjectTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MepProjectTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MepProjectTypeDescriptor', @level2type=N'COLUMN', @level2name=N'MepProjectTypeDescriptorId'
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

-- Extended Properties [extension].[OutOfFieldStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the OutOfFieldStatus of a teacher as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'OutOfFieldStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'OutOfFieldStatusDescriptor', @level2type=N'COLUMN', @level2name=N'OutOfFieldStatusDescriptorId'
GO

-- Extended Properties [extension].[ParaprofessionalQualificationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether paraprofessionals are classified as qualified for their assignment according to state definition.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ParaprofessionalQualificationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ParaprofessionalQualificationDescriptor', @level2type=N'COLUMN', @level2name=N'ParaprofessionalQualificationDescriptorId'
GO

-- Extended Properties [extension].[PerkinsLEPStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is  for Perkins LEP Status.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PerkinsLEPStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PerkinsLEPStatusDescriptor', @level2type=N'COLUMN', @level2name=N'PerkinsLEPStatusDescriptorId'
GO

-- Extended Properties [extension].[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A school''s performance on the progress in achieving English Language proficiency indicator.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor', @level2type=N'COLUMN', @level2name=N'ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId'
GO

-- Extended Properties [extension].[REAPAlternativeFundingStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'REAPAlternativeFundingStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'REAPAlternativeFundingStatusDescriptor', @level2type=N'COLUMN', @level2name=N'REAPAlternativeFundingStatusDescriptorId'
GO

-- Extended Properties [extension].[ReconstitutedStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the ReconstitutedStatus of a school as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ReconstitutedStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ReconstitutedStatusDescriptor', @level2type=N'COLUMN', @level2name=N'ReconstitutedStatusDescriptorId'
GO

-- Extended Properties [extension].[SchoolDangerousStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolDangerousStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolDangerousStatusDescriptor', @level2type=N'COLUMN', @level2name=N'SchoolDangerousStatusDescriptorId'
GO

-- Extended Properties [extension].[SchoolFederalFunds] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an extension attribute of edfi.School.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolFederalFunds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this is docs', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolFederalFunds', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolFederalFunds', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this is docs', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolFederalFunds', @level2type=N'COLUMN', @level2name=N'SchoolImprovementAllocation'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inexperienced Status', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'InexperiencedStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Emergency or Provisional Credential Status', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'EmergencyorProvisionalCredentialStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Out Of Field Status', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'OutOfFieldStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'RecordStartDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'RecordEndDateTime'
GO

-- Extended Properties [extension].[StateDefinedCustomIndicator] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedCustomIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedCustomIndicator', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedCustomIndicator', @level2type=N'COLUMN', @level2name=N'StatedDefinedCustomIndicatorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedCustomIndicator', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedCustomIndicator', @level2type=N'COLUMN', @level2name=N'Definition'
GO

-- Extended Properties [extension].[StateDefinedCustomIndicatorStatusTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the State Defined Custom Indicator Status Type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedCustomIndicatorStatusTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedCustomIndicatorStatusTypeDescriptor', @level2type=N'COLUMN', @level2name=N'StateDefinedCustomIndicatorStatusTypeDescriptorId'
GO

-- Extended Properties [extension].[StateDefinedIndicator] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedIndicator', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedIndicator', @level2type=N'COLUMN', @level2name=N'StatedDefinedCustomIndicatorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedIndicator', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StateDefinedIndicator', @level2type=N'COLUMN', @level2name=N'Definition'
GO

-- Extended Properties [extension].[StatePovertyDesignationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'a metric that a state uses to determine the high poverty and low poverty schools', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StatePovertyDesignationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StatePovertyDesignationDescriptor', @level2type=N'COLUMN', @level2name=N'StatePovertyDesignationDescriptorId'
GO

-- Extended Properties [extension].[StudentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the student''s National School Lunch Program (NSLP) eligibility has been determined through direct certification.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId'
GO

-- Extended Properties [extension].[TargetedSupportDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The reason for identification for targeted support and improvement (TSI). ', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TargetedSupportDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TargetedSupportDescriptor', @level2type=N'COLUMN', @level2name=N'TargetedSupportDescriptorId'
GO

-- Extended Properties [extension].[TitleIinstructionalServiceDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TitleIinstructionalServiceDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TitleIinstructionalServiceDescriptor', @level2type=N'COLUMN', @level2name=N'TitleIinstructionalServiceDescriptorId'
GO

-- Extended Properties [extension].[TitleIProgramStaffCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the Title I Program Staff Category as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TitleIProgramStaffCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TitleIProgramStaffCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'TitleIProgramStaffCategoryDescriptorId'
GO

-- Extended Properties [extension].[TitleIProgramTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TitleIProgramTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TitleIProgramTypeDescriptor', @level2type=N'COLUMN', @level2name=N'TitleIProgramTypeDescriptorId'
GO

-- Extended Properties [extension].[VirtualSchoolStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Virtual School Status as defined in CEDS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'VirtualSchoolStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'VirtualSchoolStatusDescriptor', @level2type=N'COLUMN', @level2name=N'VirtualSchoolStatusDescriptorId'
GO

