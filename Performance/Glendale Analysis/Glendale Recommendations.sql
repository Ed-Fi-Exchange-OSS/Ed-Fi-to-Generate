﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use [EdFi_Ods_Glendale_v21]
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_StudentAssessment_38_1364199910__K1_K12_K2_K3_K6_K4] ON [edfi].[StudentAssessment]
(
	[StudentUSI] ASC,
	[ReasonNotTestedTypeId] ASC,
	[AssessmentTitle] ASC,
	[AcademicSubjectDescriptorId] ASC,
	[AdministrationDate] ASC,
	[AssessedGradeLevelDescriptorId] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1364199910_12_2] ON [edfi].[StudentAssessment]([ReasonNotTestedTypeId], [AssessmentTitle])
go

CREATE STATISTICS [_dta_stat_1364199910_3_2_4] ON [edfi].[StudentAssessment]([AcademicSubjectDescriptorId], [AssessmentTitle], [AssessedGradeLevelDescriptorId])
go

CREATE STATISTICS [_dta_stat_1364199910_6_12_2_1_3] ON [edfi].[StudentAssessment]([AdministrationDate], [ReasonNotTestedTypeId], [AssessmentTitle], [StudentUSI], [AcademicSubjectDescriptorId])
go

CREATE STATISTICS [_dta_stat_1364199910_2_1_3_6_4] ON [edfi].[StudentAssessment]([AssessmentTitle], [StudentUSI], [AcademicSubjectDescriptorId], [AdministrationDate], [AssessedGradeLevelDescriptorId])
go

CREATE STATISTICS [_dta_stat_1364199910_4_3_12_2_1_6] ON [edfi].[StudentAssessment]([AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [ReasonNotTestedTypeId], [AssessmentTitle], [StudentUSI], [AdministrationDate])
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_Student_38_1108198998__K1_3_5_8_9_15_18_24] ON [edfi].[Student]
(
	[StudentUSI] ASC
)
INCLUDE ( 	[FirstName],
	[LastSurname],
	[SexTypeId],
	[BirthDate],
	[HispanicLatinoEthnicity],
	[SchoolFoodServicesEligibilityDescriptorId],
	[StudentUniqueId]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_Student_38_1108198998__K3_K5_K4_K9_24] ON [edfi].[Student]
(
	[FirstName] ASC,
	[LastSurname] ASC,
	[MiddleName] ASC,
	[BirthDate] ASC
)
INCLUDE ( 	[StudentUniqueId]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_Student_38_1108198998__K1_K24] ON [edfi].[Student]
(
	[StudentUSI] ASC,
	[StudentUniqueId] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1108198998_8_1] ON [edfi].[Student]([SexTypeId], [StudentUSI])
go

CREATE STATISTICS [_dta_stat_1108198998_18_1_8] ON [edfi].[Student]([SchoolFoodServicesEligibilityDescriptorId], [StudentUSI], [SexTypeId])
go

CREATE NONCLUSTERED INDEX [_dta_index_StudentSchoolAssociation_38_688721506__K2_K1_K4_3_5_6_7_8_9_10_11_12_13_14_15_16_17_18_19_20_21] ON [edfi].[StudentSchoolAssociation]
(
	[SchoolId] ASC,
	[StudentUSI] ASC,
	[EntryDate] ASC
)
INCLUDE ( 	[SchoolYear],
	[EntryGradeLevelDescriptorId],
	[EntryGradeLevelReasonTypeId],
	[EntryTypeDescriptorId],
	[RepeatGradeIndicator],
	[SchoolChoiceTransfer],
	[ExitWithdrawDate],
	[ExitWithdrawTypeDescriptorId],
	[ResidencyStatusDescriptorId],
	[PrimarySchool],
	[EmployedWhileEnrolled],
	[ClassOfSchoolYear],
	[EducationOrganizationId],
	[GraduationPlanTypeDescriptorId],
	[GraduationSchoolYear],
	[Id],
	[LastModifiedDate],
	[CreateDate]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE NONCLUSTERED INDEX [_dta_index_StudentSchoolAssociation_38_688721506__K1_K11_K5_K2_K4_K10_K15_K18] ON [edfi].[StudentSchoolAssociation]
(
	[StudentUSI] ASC,
	[ExitWithdrawTypeDescriptorId] ASC,
	[EntryGradeLevelDescriptorId] ASC,
	[SchoolId] ASC,
	[EntryDate] ASC,
	[ExitWithdrawDate] ASC,
	[ClassOfSchoolYear] ASC,
	[GraduationSchoolYear] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE NONCLUSTERED INDEX [_dta_index_StudentSchoolAssociation_38_688721506__K2_K1_4_10] ON [edfi].[StudentSchoolAssociation]
(
	[SchoolId] ASC,
	[StudentUSI] ASC
)
INCLUDE ( 	[EntryDate],
	[ExitWithdrawDate]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_688721506_2_11_5] ON [edfi].[StudentSchoolAssociation]([SchoolId], [ExitWithdrawTypeDescriptorId], [EntryGradeLevelDescriptorId])
go

CREATE STATISTICS [_dta_stat_688721506_4_10_15_18] ON [edfi].[StudentSchoolAssociation]([EntryDate], [ExitWithdrawDate], [ClassOfSchoolYear], [GraduationSchoolYear])
go

CREATE STATISTICS [_dta_stat_688721506_11_5_1_2_4_10_15_18] ON [edfi].[StudentSchoolAssociation]([ExitWithdrawTypeDescriptorId], [EntryGradeLevelDescriptorId], [StudentUSI], [SchoolId], [EntryDate], [ExitWithdrawDate], [ClassOfSchoolYear], [GraduationSchoolYear])
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_StudentProgramAssociation_38_496720822__K4_K1] ON [edfi].[StudentProgramAssociation]
(
	[ProgramName] ASC,
	[StudentUSI] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_496720822_6_7] ON [edfi].[StudentProgramAssociation]([BeginDate], [EndDate])
go

CREATE STATISTICS [_dta_stat_496720822_1_6_3_2] ON [edfi].[StudentProgramAssociation]([StudentUSI], [BeginDate], [ProgramTypeId], [EducationOrganizationId])
go

CREATE STATISTICS [_dta_stat_496720822_1_4_6_3_2_5_8_7] ON [edfi].[StudentProgramAssociation]([StudentUSI], [ProgramName], [BeginDate], [ProgramTypeId], [EducationOrganizationId], [ProgramEducationOrganizationId], [ReasonExitedDescriptorId], [EndDate])
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_Assessment_38_901578250__K1_K12_2_3_4_7] ON [edfi].[Assessment]
(
	[AssessmentTitle] ASC,
	[AssessmentFamilyTitle] ASC
)
INCLUDE ( 	[AssessedGradeLevelDescriptorId],
	[AssessmentCategoryDescriptorId],
	[AcademicSubjectDescriptorId],
	[Version]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_901578250_3_4] ON [edfi].[Assessment]([AssessmentCategoryDescriptorId], [AcademicSubjectDescriptorId])
go

CREATE STATISTICS [_dta_stat_901578250_1_3_4] ON [edfi].[Assessment]([AssessmentTitle], [AssessmentCategoryDescriptorId], [AcademicSubjectDescriptorId])
go

CREATE STATISTICS [_dta_stat_901578250_3_2_4_1] ON [edfi].[Assessment]([AssessmentCategoryDescriptorId], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [AssessmentTitle])
go

CREATE STATISTICS [_dta_stat_901578250_1_4_2_7_3_12] ON [edfi].[Assessment]([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AssessmentCategoryDescriptorId], [AssessmentFamilyTitle])
go

CREATE NONCLUSTERED INDEX [_dta_index_StaffEducationOrganizationAssign_38_372196376__K2_K3_K1_4_6] ON [edfi].[StaffEducationOrganizationAssignmentAssociation]
(
	[EducationOrganizationId] ASC,
	[StaffClassificationDescriptorId] ASC,
	[StaffUSI] ASC
)
INCLUDE ( 	[BeginDate],
	[EndDate]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_Descriptor_38_1282103608__K3_K1_5] ON [edfi].[Descriptor]
(
	[CodeValue] ASC,
	[DescriptorId] ASC
)
INCLUDE ( 	[Description]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_Descriptor_38_1282103608__K1_K3_5] ON [edfi].[Descriptor]
(
	[DescriptorId] ASC,
	[CodeValue] ASC
)
INCLUDE ( 	[Description]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_Descriptor_38_1282103608__K3_K1] ON [edfi].[Descriptor]
(
	[CodeValue] ASC,
	[DescriptorId] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_1282103608_4_1] ON [edfi].[Descriptor]([ShortDescription], [DescriptorId])
go

CREATE STATISTICS [_dta_stat_848722076_2_1_6] ON [edfi].[StudentSpecialEducationProgramAssociation]([EducationOrganizationId], [StudentUSI], [BeginDate])
go

CREATE STATISTICS [_dta_stat_1509580416_4_3_5_6_1] ON [edfi].[AssessmentPerformanceLevel]([AcademicSubjectDescriptorId], [AssessmentTitle], [AssessedGradeLevelDescriptorId], [Version], [PerformanceLevelDescriptorId])
go

CREATE STATISTICS [_dta_stat_180195692_3_5_4_9] ON [edfi].[Staff]([FirstName], [LastSurname], [MiddleName], [BirthDate])
go

CREATE STATISTICS [_dta_stat_1460200252_4_7_2] ON [edfi].[StudentAssessmentPerformanceLevel]([AssessedGradeLevelDescriptorId], [PerformanceLevelDescriptorId], [AssessmentTitle])
go

CREATE STATISTICS [_dta_stat_1460200252_3_7_4_2] ON [edfi].[StudentAssessmentPerformanceLevel]([AcademicSubjectDescriptorId], [PerformanceLevelDescriptorId], [AssessedGradeLevelDescriptorId], [AssessmentTitle])
go

CREATE STATISTICS [_dta_stat_1460200252_2_1_3_6_4] ON [edfi].[StudentAssessmentPerformanceLevel]([AssessmentTitle], [StudentUSI], [AcademicSubjectDescriptorId], [AdministrationDate], [AssessedGradeLevelDescriptorId])
go

CREATE STATISTICS [_dta_stat_1460200252_1_4_7_2_3_6] ON [edfi].[StudentAssessmentPerformanceLevel]([StudentUSI], [AssessedGradeLevelDescriptorId], [PerformanceLevelDescriptorId], [AssessmentTitle], [AcademicSubjectDescriptorId], [AdministrationDate])
go

CREATE STATISTICS [_dta_stat_281104092_1_2] ON [extension].[CEDSStudent]([StudentUSI], [NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId])
go

