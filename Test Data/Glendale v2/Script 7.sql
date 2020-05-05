
ALTER TABLE [edfi].[StateEducationAgencyFederalFunds]
    WITH NOCHECK ADD CONSTRAINT [FK_StateEducationAgencyFederalFunds_StateEducationAgency_StateEducationAgencyId] FOREIGN KEY ([StateEducationAgencyId]) REFERENCES [edfi].[StateEducationAgency] ([StateEducationAgencyId])
ALTER TABLE [edfi].[StudentAcademicRecordClassRanking]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordClassRanking_StudentAcademicRecord_StudentUSI] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[StudentAcademicRecord] ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStudyAppropriateSex]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyAppropriateSex_InterventionStudy] FOREIGN KEY ([InterventionStudyIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionStudy] ([InterventionStudyIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStudyAppropriateSex]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyAppropriateSex_SexType_SexTypeId] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId])
ALTER TABLE [edfi].[EducationOrganizationCategory]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationCategory_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationOrganizationCategory]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationCategory_EducationOrganizationCategoryType_EducationOrganizationCategoryTypeId] FOREIGN KEY ([EducationOrganizationCategoryTypeId]) REFERENCES [edfi].[EducationOrganizationCategoryType] ([EducationOrganizationCategoryTypeId])
ALTER TABLE [edfi].[StudentMigrantEducationProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentMigrantEducationProgramAssociation_ContinuationOfServicesReasonDescriptorId] FOREIGN KEY ([ContinuationOfServicesReasonDescriptorId]) REFERENCES [edfi].[ContinuationOfServicesReasonDescriptor] ([ContinuationOfServicesReasonDescriptorId])
ALTER TABLE [edfi].[StudentMigrantEducationProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentMigrantEducationProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationOrganizationNetworkAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationNetworkAssociation_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([MemberEducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[EducationOrganizationNetworkAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationNetworkAssociation_EducationOrganizationNetwork_EducationOrganizationNetworkId] FOREIGN KEY ([EducationOrganizationNetworkId]) REFERENCES [edfi].[EducationOrganizationNetwork] ([EducationOrganizationNetworkId])
ALTER TABLE [edfi].[ContractedStaff]
    WITH NOCHECK ADD CONSTRAINT [FK_ContractedStaff_Account_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [AccountNumber], [FiscalYear]) REFERENCES [edfi].[Account] ([EducationOrganizationId], [AccountNumber], [FiscalYear])
ALTER TABLE [edfi].[ContractedStaff]
    WITH NOCHECK ADD CONSTRAINT [FK_ContractedStaff_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[StaffIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffIdentificationCode_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffIdentificationCode_StaffIdentificationSystemDescriptor_StaffIdentificationSystemDescriptorId] FOREIGN KEY ([StaffIdentificationSystemDescriptorId]) REFERENCES [edfi].[StaffIdentificationSystemDescriptor] ([StaffIdentificationSystemDescriptorId])
ALTER TABLE [edfi].[InterventionStudyURI]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyURI_InterventionStudy] FOREIGN KEY ([InterventionStudyIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionStudy] ([InterventionStudyIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStudyLearningResourceMetadataURI]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyLearningResourceMetadataURI_InterventionStudy] FOREIGN KEY ([InterventionStudyIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionStudy] ([InterventionStudyIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffCohortAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffCohortAssociation_Cohort_EducationOrganizationId] FOREIGN KEY ([CohortIdentifier], [EducationOrganizationId]) REFERENCES [edfi].[Cohort] ([CohortIdentifier], [EducationOrganizationId])
ALTER TABLE [edfi].[StaffCohortAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffCohortAssociation_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[InterventionStudyPopulationServed]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyPopulationServed_InterventionStudy] FOREIGN KEY ([InterventionStudyIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionStudy] ([InterventionStudyIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStudyPopulationServed]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyPopulationServed_PopulationServedType_PopulationServedTypeId] FOREIGN KEY ([PopulationServedTypeId]) REFERENCES [edfi].[PopulationServedType] ([PopulationServedTypeId])
ALTER TABLE [edfi].[EducationOrganizationPeerAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationPeerAssociation_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[EducationOrganizationPeerAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationPeerAssociation_EducationOrganization_PeerEducationOrganizationId] FOREIGN KEY ([PeerEducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[EducationContentDerivativeSourceLearningResourceMetadataURI]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentDerivativeSourceLearningResourceMetadataURI_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier]) ON DELETE CASCADE
ALTER TABLE [edfi].[LearningStandardIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandardIdentificationCode_LearningStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ProgramLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramLearningStandard_LearningObjective_Objective] FOREIGN KEY ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId])
ALTER TABLE [edfi].[ProgramLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramLearningStandard_Program_ProgramTypeId] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationContentAppropriateGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentAppropriateGradeLevel_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationContentAppropriateGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentAppropriateGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[CourseTranscriptEarnedAdditionalCredits]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscriptEarnedAdditionalCredits_AdditionalCreditType_AdditionalCreditTypeId] FOREIGN KEY ([AdditionalCreditTypeId]) REFERENCES [edfi].[AdditionalCreditType] ([AdditionalCreditTypeId])
ALTER TABLE [edfi].[CourseTranscriptEarnedAdditionalCredits]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscriptEarnedAdditionalCredits_CourseTranscript] FOREIGN KEY ([CourseAttemptResultTypeId], [StudentUSI], [EducationOrganizationId], [CourseEducationOrganizationId], [SchoolYear], [TermDescriptorId], [CourseCode]) REFERENCES [edfi].[CourseTranscript] ([CourseAttemptResultTypeId], [StudentUSI], [EducationOrganizationId], [CourseEducationOrganizationId], [SchoolYear], [TermDescriptorId], [CourseCode])
ALTER TABLE [edfi].[StudentProgramAssociationService]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAssociationService_ServiceDescriptor_ServiceDescriptorId] FOREIGN KEY ([ServiceDescriptorId]) REFERENCES [edfi].[ServiceDescriptor] ([ServiceDescriptorId])
ALTER TABLE [edfi].[StudentProgramAssociationService]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAssociationService_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentLanguageUse]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLanguageUse_LanguageUseType_LanguageUseTypeId] FOREIGN KEY ([LanguageUseTypeId]) REFERENCES [edfi].[LanguageUseType] ([LanguageUseTypeId])
ALTER TABLE [edfi].[StudentLanguageUse]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLanguageUse_StudentLanguages_StudentUSI] FOREIGN KEY ([StudentUSI], [LanguageDescriptorId]) REFERENCES [edfi].[StudentLanguage] ([StudentUSI], [LanguageDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LeaveEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_LeaveEvent_LeaveEventCategoryType_LeaveEventCategoryTypeId] FOREIGN KEY ([LeaveEventCategoryTypeId]) REFERENCES [edfi].[LeaveEventCategoryType] ([LeaveEventCategoryTypeId])
ALTER TABLE [edfi].[LeaveEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_LeaveEvent_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[InterventionStudyAppropriateGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyAppropriateGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[InterventionStudyAppropriateGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyAppropriateGradeLevel_InterventionStudy] FOREIGN KEY ([InterventionStudyIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionStudy] ([InterventionStudyIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseLearningObjective_Course_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [CourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [CourseCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseLearningObjective_LearningObjective_Objective] FOREIGN KEY ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId])
ALTER TABLE [edfi].[InterventionDiagnosis]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionDiagnosis_DiagnosisDescriptor_DiagnosisDescriptorId] FOREIGN KEY ([DiagnosisDescriptorId]) REFERENCES [edfi].[DiagnosisDescriptor] ([DiagnosisDescriptorId])
ALTER TABLE [edfi].[InterventionDiagnosis]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionDiagnosis_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationOrganizationIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationIdentificationDescriptor_Descriptor] FOREIGN KEY ([EducationOrganizationIdentificationSystemDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId])
ALTER TABLE [edfi].[EducationOrganizationIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationIdentificationSystemDescriptor_EducationOrganizationIdentificationSystemType] FOREIGN KEY ([EducationOrganizationIdentificationSystemTypeId]) REFERENCES [edfi].[EducationOrganizationIdentificationSystemType] ([EducationOrganizationIdentificationSystemTypeId])
ALTER TABLE [edfi].[StudentSpecialEducationProgramAssociationServiceProvider]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationServiceProvider_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[StudentSpecialEducationProgramAssociationServiceProvider]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationServiceProvider_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentProgramParticipationProgramCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramParticipationProgramCharacteristic_ProgramCharacteristicDescriptor_ProgramCharacteristicDescriptorId] FOREIGN KEY ([ProgramCharacteristicDescriptorId]) REFERENCES [edfi].[ProgramCharacteristicDescriptor] ([ProgramCharacteristicDescriptorId])
ALTER TABLE [edfi].[StudentProgramParticipationProgramCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramParticipationProgramCharacteristic_StudentProgramParticipation_ProgramTypeId] FOREIGN KEY ([StudentUSI], [ProgramTypeId]) REFERENCES [edfi].[StudentProgramParticipation] ([StudentUSI], [ProgramTypeId]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseIdentificationCode_Course_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [CourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [CourseCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseIdentificationCode_CourseIdentificationSystemDescriptor] FOREIGN KEY ([CourseIdentificationSystemDescriptorId]) REFERENCES [edfi].[CourseIdentificationSystemDescriptor] ([CourseIdentificationSystemDescriptorId])
ALTER TABLE [edfi].[EducationOrganizationInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationInternationalAddress_AddressType_AddressTypeId] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId])
ALTER TABLE [edfi].[EducationOrganizationInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationInternationalAddress_CountryDescriptorId_CountryDescriptor_CountryDescriptorId] FOREIGN KEY ([CountryDescriptorId]) REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
ALTER TABLE [edfi].[EducationOrganizationInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationInternationalAddress_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[Actual]
    WITH NOCHECK ADD CONSTRAINT [FK_Actual_Account_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [AccountNumber], [FiscalYear]) REFERENCES [edfi].[Account] ([EducationOrganizationId], [AccountNumber], [FiscalYear])
ALTER TABLE [edfi].[StaffProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffProgramAssociation_Program_ProgramEducationOrganizationId] FOREIGN KEY ([ProgramEducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName])
ALTER TABLE [edfi].[StaffProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffProgramAssociation_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[CourseLevelCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseLevelCharacteristics_Course_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [CourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [CourseCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseLevelCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseLevelCharacteristics_CourseLevelCharacteristicsType_CourseLevelCharacteristicsTypeId] FOREIGN KEY ([CourseLevelCharacteristicTypeId]) REFERENCES [edfi].[CourseLevelCharacteristicType] ([CourseLevelCharacteristicTypeId])
ALTER TABLE [edfi].[LearningObjectiveLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningObjectiveLearningStandard_LearningObjective] FOREIGN KEY ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LearningObjectiveLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningObjectiveLearningStandard_LearningStandard] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[StudentCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCharacteristic_StudentCharacteristicDescriptorId] FOREIGN KEY ([StudentCharacteristicDescriptorId]) REFERENCES [edfi].[StudentCharacteristicDescriptor] ([StudentCharacteristicDescriptorId])
ALTER TABLE [edfi].[StudentCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCharacteristics_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[LocalEducationAgencyFederalFunds]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgencyFederalFunds_LocalEducationAgency_LocalEducationAgencyId] FOREIGN KEY ([LocalEducationAgencyId]) REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
ALTER TABLE [edfi].[StudentIndicator]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentIndicator_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[PostSecondaryEventPostSecondaryInstitutionMediumOfInstruction]
    WITH NOCHECK ADD CONSTRAINT [FK_PostSecondaryEventPostSecondaryInstitutionMediumOfInstruction_MediumOfInstructionType_MediumOfInstructionTypeId] FOREIGN KEY ([MediumOfInstructionTypeId]) REFERENCES [edfi].[MediumOfInstructionType] ([MediumOfInstructionTypeId])
ALTER TABLE [edfi].[PostSecondaryEventPostSecondaryInstitutionMediumOfInstruction]
    WITH NOCHECK ADD CONSTRAINT [FK_PostSecondaryEventPostSecondaryInstitutionMediumOfInstruction_PostSecondaryEventPostSecondaryInstitution] FOREIGN KEY ([StudentUSI], [PostSecondaryEventCategoryTypeId], [EventDate]) REFERENCES [edfi].[PostSecondaryEventPostSecondaryInstitution] ([StudentUSI], [PostSecondaryEventCategoryTypeId], [EventDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[GraduationPlanTypeDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanTypeDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([GraduationPlanTypeDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[GraduationPlanTypeDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanTypeDescriptor_GraduationPlanType_GraduationPlanTypeId] FOREIGN KEY ([GraduationPlanTypeId]) REFERENCES [edfi].[GraduationPlanType] ([GraduationPlanTypeId])
ALTER TABLE [edfi].[PostSecondaryEventPostSecondaryInstitutionIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_PostSecondaryEventIdentificationCode_EducationOrganizationIdentificationSystemDescriptorId] FOREIGN KEY ([EducationOrganizationIdentificationSystemDescriptorId]) REFERENCES [edfi].[EducationOrganizationIdentificationSystemDescriptor] ([EducationOrganizationIdentificationSystemDescriptorId])
ALTER TABLE [edfi].[PostSecondaryEventPostSecondaryInstitutionIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_PostSecondaryEventPostSecondaryInstitutionIdentificationCode_PostSecondaryEventPostSecondaryInstitution] FOREIGN KEY ([StudentUSI], [PostSecondaryEventCategoryTypeId], [EventDate]) REFERENCES [edfi].[PostSecondaryEventPostSecondaryInstitution] ([StudentUSI], [PostSecondaryEventCategoryTypeId], [EventDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffOtherName]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffOtherName_OtherNameType_OtherNameTypeId] FOREIGN KEY ([OtherNameTypeId]) REFERENCES [edfi].[OtherNameType] ([OtherNameTypeId])
ALTER TABLE [edfi].[StaffOtherName]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffOtherName_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[ObjectiveAssessmentLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_ObjectiveAssessmentLearningStandard_LearningStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[ObjectiveAssessmentLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_ObjectiveAssessmentLearningStandard_ObjectiveAssessment] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode]) REFERENCES [edfi].[ObjectiveAssessment] ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLanguages_LanguageDescriptor_LanguageDescriptorId] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
ALTER TABLE [edfi].[StudentLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLanguages_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationOrganizationInstitutionTelephone]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationInstitutionTelephone_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationOrganizationInstitutionTelephone]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationInstitutionTelephone_InstitutionTelephoneNumberType_InstitutionTelephoneNumberTypeId] FOREIGN KEY ([InstitutionTelephoneNumberTypeId]) REFERENCES [edfi].[InstitutionTelephoneNumberType] ([InstitutionTelephoneNumberTypeId])
ALTER TABLE [edfi].[StudentLearningStyle]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLearningStyle_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[ProgramCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramCharacteristic_Program_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) ON DELETE CASCADE
ALTER TABLE [edfi].[ProgramCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramCharacteristic_ProgramCharacteristicDescriptor_ProgramCharacteristicDescriptorId] FOREIGN KEY ([ProgramCharacteristicDescriptorId]) REFERENCES [edfi].[ProgramCharacteristicDescriptor] ([ProgramCharacteristicDescriptorId])
ALTER TABLE [edfi].[CredentialFieldDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_CredentialFieldDescriptor_AcademicSubjectDescriptor_AcademicSubjectDescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
ALTER TABLE [edfi].[CredentialFieldDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_CredentialFieldDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([CredentialFieldDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionPopulationServed]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPopulationServed_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionPopulationServed]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPopulationServed_PopulationServedType_PopulationServedTypeId] FOREIGN KEY ([PopulationServedTypeId]) REFERENCES [edfi].[PopulationServedType] ([PopulationServedTypeId])
ALTER TABLE [edfi].[GraduationPlanCreditsByCourseCourse]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanCreditsByCourseCourse_Course] FOREIGN KEY ([CourseEducationOrganizationId], [CourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [CourseCode])
ALTER TABLE [edfi].[GraduationPlanCreditsByCourseCourse]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanCreditsByCourseCourse_GraduationPlanCreditsByCourse] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [CourseSetName]) REFERENCES [edfi].[GraduationPlanCreditsByCourse] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [CourseSetName]) ON DELETE CASCADE
ALTER TABLE [edfi].[ProgramService]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramService_Program_ProgramTypeId] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) ON DELETE CASCADE
ALTER TABLE [edfi].[ProgramService]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramService_ServiceDescriptor_ServiceDescriptorId] FOREIGN KEY ([ServiceDescriptorId]) REFERENCES [edfi].[ServiceDescriptor] ([ServiceDescriptorId])
ALTER TABLE [edfi].[ServiceDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ServiceDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ServiceDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[RestraintEventProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_RestraintEventProgram_Program] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName])
ALTER TABLE [edfi].[RestraintEventProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_RestraintEventProgram_RestraintEvent_StudentUSI] FOREIGN KEY ([StudentUSI], [SchoolId], [RestraintEventIdentifier], [EventDate]) REFERENCES [edfi].[RestraintEvent] ([StudentUSI], [SchoolId], [RestraintEventIdentifier], [EventDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[LanguageDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_LanguageDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LanguageDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_LanguageDescriptor_LanguagesType_LanguageTypeId] FOREIGN KEY ([LanguageTypeId]) REFERENCES [edfi].[LanguageType] ([LanguageTypeId])
ALTER TABLE [edfi].[AssessmentFamilyContentStandardAuthor]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamilyContentStandardAuthor_AssessmentFamilyContentStandard_AssessmentFamilyTitle] FOREIGN KEY ([AssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamilyContentStandard] ([AssessmentFamilyTitle]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionAppropriateGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionAppropriateGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[InterventionAppropriateGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionAppropriateGradeLevel_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[GraduationPlanCreditsBySubject]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanCreditsBySubject_AcademicSubjectDescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
ALTER TABLE [edfi].[GraduationPlanCreditsBySubject]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanCreditsBySubject_CreditType_CreditTypeId] FOREIGN KEY ([CreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[GraduationPlanCreditsBySubject]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanCreditsBySubject_GraduationPlan_EducationOrganizationId] FOREIGN KEY ([GraduationPlanTypeDescriptorId], [EducationOrganizationId], [GraduationSchoolYear]) REFERENCES [edfi].[GraduationPlan] ([GraduationPlanTypeDescriptorId], [EducationOrganizationId], [GraduationSchoolYear]) ON DELETE CASCADE
ALTER TABLE [edfi].[PostSecondaryEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_PostSecondaryEvent_PostSecondaryEventCategoryType_PostSecondaryEventCategoryTypeId] FOREIGN KEY ([PostSecondaryEventCategoryTypeId]) REFERENCES [edfi].[PostSecondaryEventCategoryType] ([PostSecondaryEventCategoryTypeId])
ALTER TABLE [edfi].[PostSecondaryEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_PostSecondaryEvent_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[SchoolGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_SchoolGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[SchoolGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_SchoolGradeLevel_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentLanguages_Assessment_AssessmentTitle] FOREIGN KEY ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentLanguages_LanguageDescriptor_LanguageDescriptorId] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
ALTER TABLE [edfi].[EntryTypeDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_EntryTypeDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([EntryTypeDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[EntryTypeDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_EntryTypeDescriptor_EntryType_EntryTypeId] FOREIGN KEY ([EntryTypeId]) REFERENCES [edfi].[EntryType] ([EntryTypeId])
ALTER TABLE [edfi].[ParentAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentAddress_AddressType_AddressTypeId] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId])
ALTER TABLE [edfi].[ParentAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentAddress_Parent_ParentUSI] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[ParentAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentAddress_StateAbbreviationType_StateAbbreviationTypeId] FOREIGN KEY ([StateAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
ALTER TABLE [edfi].[StudentInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInternationalAddress_AddressType_AddressTypeId] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId])
ALTER TABLE [edfi].[StudentInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInternationalAddress_CountryDescriptorId_CountryDescriptor_CountryDescriptorId] FOREIGN KEY ([CountryDescriptorId]) REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
ALTER TABLE [edfi].[StudentInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInternationalAddress_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentRace]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentRace_RaceType_RaceTypeId] FOREIGN KEY ([RaceTypeId]) REFERENCES [edfi].[RaceType] ([RaceTypeId])
ALTER TABLE [edfi].[StudentRace]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentRace_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAddress_AddressType_AddressTypeId] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId])
ALTER TABLE [edfi].[StudentAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAddress_StateAbbreviationType_StateAbbreviationTypeId] FOREIGN KEY ([StateAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
ALTER TABLE [edfi].[StudentAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAddress_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[ExitWithdrawTypeDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ExitWithdrawTypeDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ExitWithdrawTypeDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ExitWithdrawTypeDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ExitWithdrawTypeDescriptor_ExitWithdrawType_ExitWithdrawTypeId] FOREIGN KEY ([ExitWithdrawTypeId]) REFERENCES [edfi].[ExitWithdrawType] ([ExitWithdrawTypeId])
ALTER TABLE [edfi].[EducationOrganizationInterventionPrescriptionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationInterventionPrescriptionAssociation_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[EducationOrganizationInterventionPrescriptionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationInterventionPrescriptionAssociation_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [InterventionPrescriptionEducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId])
ALTER TABLE [edfi].[AssessmentFamilyAssessmentPeriod]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamilyAssessmentPeriod_AssessmentFamily_AssessmentFamilyTitle] FOREIGN KEY ([AssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamily] ([AssessmentFamilyTitle]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentFamilyAssessmentPeriod]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamilyAssessmentPeriod_AssessmentPeriodDescriptor_AssessmentPeriodDescriptorId] FOREIGN KEY ([AssessmentPeriodDescriptorId]) REFERENCES [edfi].[AssessmentPeriodDescriptor] ([AssessmentPeriodDescriptorId])
ALTER TABLE [edfi].[StudentInterventionAssociationInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAssociationInterventionEffectiveness_DiagnosisDescriptorId] FOREIGN KEY ([DiagnosisDescriptorId]) REFERENCES [edfi].[DiagnosisDescriptor] ([DiagnosisDescriptorId])
ALTER TABLE [edfi].[StudentInterventionAssociationInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAssociationInterventionEffectiveness_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[StudentInterventionAssociationInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAssociationInterventionEffectiveness_InterventionEffectivenessRatingType] FOREIGN KEY ([InterventionEffectivenessRatingTypeId]) REFERENCES [edfi].[InterventionEffectivenessRatingType] ([InterventionEffectivenessRatingTypeId])
ALTER TABLE [edfi].[StudentInterventionAssociationInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAssociationInterventionEffectiveness_PopulationServedType_PopulationServedTypeId] FOREIGN KEY ([PopulationServedTypeId]) REFERENCES [edfi].[PopulationServedType] ([PopulationServedTypeId])
ALTER TABLE [edfi].[StudentInterventionAssociationInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAssociationInterventionEffectiveness_StudentInterventionAssociation] FOREIGN KEY ([StudentUSI], [InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[StudentInterventionAssociation] ([StudentUSI], [InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[DisciplineActionStaff]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineActionStaff_DisciplineAction_StudentUSI] FOREIGN KEY ([DisciplineActionIdentifier], [StudentUSI], [DisciplineDate]) REFERENCES [edfi].[DisciplineAction] ([DisciplineActionIdentifier], [StudentUSI], [DisciplineDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[DisciplineActionStaff]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineActionStaff_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[CourseLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseLearningStandard_Course_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [CourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [CourseCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseLearningStandard_LearningStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[FeederSchoolAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_FeederSchoolAssociation_FeederSchoolId_School_SchoolId] FOREIGN KEY ([FeederSchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[FeederSchoolAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_FeederSchoolAssociation_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[AssessmentProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentProgram_Program_ProgramTypeId] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName])
ALTER TABLE [edfi].[AssessmentProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentProgram_Assessment_AssessmentTitle] FOREIGN KEY ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentCohortYear]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCohortYears_CohortYearType_CohortYearTypeId] FOREIGN KEY ([CohortYearTypeId]) REFERENCES [edfi].[CohortYearType] ([CohortYearTypeId])
ALTER TABLE [edfi].[StudentCohortYear]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCohortYears_SchoolYearType_SchoolYear] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
ALTER TABLE [edfi].[StudentCohortYear]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCohortYears_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[EmploymentStatusDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_EmploymentStatusDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([EmploymentStatusDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[EmploymentStatusDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_EmploymentStatusDescriptor_EmploymentStatusType_EmploymentStatusTypeId] FOREIGN KEY ([EmploymentStatusTypeId]) REFERENCES [edfi].[EmploymentStatusType] ([EmploymentStatusTypeId])
ALTER TABLE [edfi].[StudentAcademicRecordDiploma]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordDiploma_AchievementCategoryDescriptor_AchievementCategoryDescriptorId] FOREIGN KEY ([AchievementCategoryDescriptorId]) REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
ALTER TABLE [edfi].[StudentAcademicRecordDiploma]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordDiploma_DiplomaLevelType_DiplomaLevelTypeId] FOREIGN KEY ([DiplomaLevelTypeId]) REFERENCES [edfi].[DiplomaLevelType] ([DiplomaLevelTypeId])
ALTER TABLE [edfi].[StudentAcademicRecordDiploma]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordDiploma_DiplomaType_DiplomaTypeId] FOREIGN KEY ([DiplomaTypeId]) REFERENCES [edfi].[DiplomaType] ([DiplomaTypeId])
ALTER TABLE [edfi].[StudentAcademicRecordDiploma]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordDiploma_StudentAcademicRecord_StudentUSI] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[StudentAcademicRecord] ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LearningStandardGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandardGradeLevel_GradeLevelDescriptor_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[LearningStandardGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandardGradeLevel_LearningStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[StaffIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffIdentificationSystemDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([StaffIdentificationSystemDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId])
ALTER TABLE [edfi].[StaffIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffIdentificationSystemDescriptor_StaffIdentificationSystemType_StaffIdentificationSystemTypeId] FOREIGN KEY ([StaffIdentificationSystemTypeId]) REFERENCES [edfi].[StaffIdentificationSystemType] ([StaffIdentificationSystemTypeId])
ALTER TABLE [edfi].[InterventionLearningResourceMetadataURI]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionLearningResourceMetadataURI_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentInterventionAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAttendanceEvent_AttendanceEventCategoryDescriptorId] FOREIGN KEY ([AttendanceEventCategoryDescriptorId]) REFERENCES [edfi].[AttendanceEventCategoryDescriptor] ([AttendanceEventCategoryDescriptorId])
ALTER TABLE [edfi].[StudentInterventionAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAttendanceEvent_EducationalEnvironmentType_EducationalEnvironmentTypeId] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId])
ALTER TABLE [edfi].[StudentInterventionAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAttendanceEvent_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId])
ALTER TABLE [edfi].[StudentInterventionAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAttendanceEvent_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[AchievementCategoryDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AchievementCategoryDescriptor_AchievementCategoryType_AchievementCategoryTypeId] FOREIGN KEY ([AchievementCategoryTypeId]) REFERENCES [edfi].[AchievementCategoryType] ([AchievementCategoryTypeId])
ALTER TABLE [edfi].[AchievementCategoryDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AchievementCategoryDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AchievementCategoryDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStaff]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStaff_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStaff]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStaff_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[SessionGradingPeriod]
    WITH NOCHECK ADD CONSTRAINT [FK_SessionGradingPeriod_GradingPeriod_SchoolId] FOREIGN KEY ([GradingPeriodDescriptorId], [SchoolId], [BeginDate]) REFERENCES [edfi].[GradingPeriod] ([GradingPeriodDescriptorId], [SchoolId], [BeginDate])
ALTER TABLE [edfi].[SessionGradingPeriod]
    WITH NOCHECK ADD CONSTRAINT [FK_SessionGradingPeriod_Session_SchoolId] FOREIGN KEY ([SchoolId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[Session] ([SchoolId], [SchoolYear], [TermDescriptorId]) ON UPDATE CASCADE
ALTER TABLE [edfi].[InterventionPrescriptionLearningResourceMetadataURI]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionLearningResourceMetadataURI_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentTelephone]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentTelephone_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentTelephone]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentTelephone_TelephoneNumberType_TelephoneNumberTypeId] FOREIGN KEY ([TelephoneNumberTypeId]) REFERENCES [edfi].[TelephoneNumberType] ([TelephoneNumberTypeId])
ALTER TABLE [edfi].[ParentInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentInternationalAddress_AddressType_AddressTypeId] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId])
ALTER TABLE [edfi].[ParentInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentInternationalAddress_CountryDescriptorId_CountryDescriptor_CountryDescriptorId] FOREIGN KEY ([CountryDescriptorId]) REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
ALTER TABLE [edfi].[ParentInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentInternationalAddress_Parent_ParentUSI] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionPrescriptionAppropriateSex]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionAppropriateSex_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionPrescriptionAppropriateSex]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionAppropriateSex_SexType_SexTypeId] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId])
ALTER TABLE [edfi].[CohortProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_CohortProgram_Cohort_EducationOrganizationId] FOREIGN KEY ([CohortIdentifier], [EducationOrganizationId]) REFERENCES [edfi].[Cohort] ([CohortIdentifier], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[CohortProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_CohortProgram_Program_EducationOrganizationId] FOREIGN KEY ([ProgramEducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName])
ALTER TABLE [edfi].[InterventionPrescriptionDiagnosis]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionDiagnosis_DiagnosisDescriptor_DiagnosisDescriptorId] FOREIGN KEY ([DiagnosisDescriptorId]) REFERENCES [edfi].[DiagnosisDescriptor] ([DiagnosisDescriptorId])
ALTER TABLE [edfi].[InterventionPrescriptionDiagnosis]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionDiagnosis_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseOfferedGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseGradeLevel_Course_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [CourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [CourseCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseOfferedGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[InterventionURI]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionURI_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[AccountCodeDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AccountCodeDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AccountCodeDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseOffering]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseOffering_Course_SchoolId] FOREIGN KEY ([EducationOrganizationId], [CourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [CourseCode])
ALTER TABLE [edfi].[CourseOffering]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseOffering_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[CourseOffering]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseOffering_Session_SchoolId] FOREIGN KEY ([SchoolId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[Session] ([SchoolId], [SchoolYear], [TermDescriptorId]) ON UPDATE CASCADE
ALTER TABLE [edfi].[StudentAcademicRecordRecognition]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordRecognition_AchievementCategoryDescriptor_AchievementCategoryDescriptorId] FOREIGN KEY ([AchievementCategoryDescriptorId]) REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
ALTER TABLE [edfi].[StudentAcademicRecordRecognition]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordRecognition_RecognitionType_RecognitionTypeId] FOREIGN KEY ([RecognitionTypeId]) REFERENCES [edfi].[RecognitionType] ([RecognitionTypeId])
ALTER TABLE [edfi].[StudentAcademicRecordRecognition]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordRecognition_StudentAcademicRecord_StudentUSI] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[StudentAcademicRecord] ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentParentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentParentAssociation_Parent_ParentUSI] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI])
ALTER TABLE [edfi].[StudentParentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentParentAssociation_RelationType_RelationTypeId] FOREIGN KEY ([RelationTypeId]) REFERENCES [edfi].[RelationType] ([RelationTypeId])
ALTER TABLE [edfi].[StudentParentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentParentAssociation_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[InterventionMeetingTime]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionMeetingTime_ClassPeriod_ClassPeriodName] FOREIGN KEY ([SchoolId], [ClassPeriodName]) REFERENCES [edfi].[ClassPeriod] ([SchoolId], [ClassPeriodName]) ON UPDATE CASCADE
ALTER TABLE [edfi].[InterventionMeetingTime]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionMeetingTime_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentFamilyContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamilyContentStandard_AssessmentFamily_AssessmentFamilyTitle] FOREIGN KEY ([AssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamily] ([AssessmentFamilyTitle]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentFamilyContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamilyContentStandard_EducationOrganization_MandatingEducationOrganizationId] FOREIGN KEY ([MandatingEducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[AssessmentFamilyContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamilyContentStandard_PublicationStatusType_PublicationStatusTypeId] FOREIGN KEY ([PublicationStatusTypeId]) REFERENCES [edfi].[PublicationStatusType] ([PublicationStatusTypeId])
ALTER TABLE [edfi].[EducationServiceCenter]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationServiceCenter_EducationOrganization_EducationServiceCenterId] FOREIGN KEY ([EducationServiceCenterId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationServiceCenter]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationServiceCenter_StateEducationAgency_StateEducationAgencyId] FOREIGN KEY ([StateEducationAgencyId]) REFERENCES [edfi].[StateEducationAgency] ([StateEducationAgencyId])
ALTER TABLE [edfi].[InterventionPrescriptionURI]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionURI_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentGradebookEntry]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentGradebookEntry_CompetencyLevelDescriptor_CompetencyLevelDescriptorId] FOREIGN KEY ([CompetencyLevelDescriptorId]) REFERENCES [edfi].[CompetencyLevelDescriptor] ([CompetencyLevelDescriptorId])
ALTER TABLE [edfi].[StudentGradebookEntry]
    ADD CONSTRAINT [FK_StudentGradebookEntry_GradebookEntry_SchoolId] FOREIGN KEY ([GradebookEntryTitle], [ClassroomIdentificationCode], [SchoolId], [ClassPeriodName], [LocalCourseCode], [SchoolYear], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse], [DateAssigned]) REFERENCES [edfi].[GradebookEntry] ([GradebookEntryTitle], [ClassroomIdentificationCode], [SchoolId], [ClassPeriodName], [LocalCourseCode], [SchoolYear], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse], [DateAssigned])
ALTER TABLE [edfi].[StudentGradebookEntry]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentGradebookEntry_StudentSectionAssociation_StudentUSI] FOREIGN KEY ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [BeginDate]) REFERENCES [edfi].[StudentSectionAssociation] ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [BeginDate]) ON UPDATE CASCADE
ALTER TABLE [edfi].[Budget]
    WITH NOCHECK ADD CONSTRAINT [FK_Budget_Account_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [AccountNumber], [FiscalYear]) REFERENCES [edfi].[Account] ([EducationOrganizationId], [AccountNumber], [FiscalYear])
ALTER TABLE [edfi].[InterventionStudyEducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyEducationContent_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier])
ALTER TABLE [edfi].[InterventionStudyEducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyEducationContent_InterventionStudy] FOREIGN KEY ([InterventionStudyIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionStudy] ([InterventionStudyIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStudyStateAbbreviation]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyStateAbbreviation_InterventionStudy] FOREIGN KEY ([InterventionStudyIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionStudy] ([InterventionStudyIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStudyStateAbbreviation]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyStateAbbreviation_StateAbbreviationType_StateAbbreviationTypeId] FOREIGN KEY ([StateAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
ALTER TABLE [edfi].[ReasonExitedDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ReasonExitedDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ReasonExitedDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ReasonExitedDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ReasonExitedDescriptor_ReasonExitedType_ReasonExitedTypeId] FOREIGN KEY ([ReasonExitedTypeId]) REFERENCES [edfi].[ReasonExitedType] ([ReasonExitedTypeId])
ALTER TABLE [edfi].[StudentAcademicRecordAcademicHonor]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordAcademicHonor_AcademicHonorCategoryType_AcademicHonorCategoryTypeId] FOREIGN KEY ([AcademicHonorCategoryTypeId]) REFERENCES [edfi].[AcademicHonorCategoryType] ([AcademicHonorCategoryTypeId])
ALTER TABLE [edfi].[StudentAcademicRecordAcademicHonor]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordAcademicHonor_AchievementCategoryDescriptor_AchievementCategoryDescriptorId] FOREIGN KEY ([AchievementCategoryDescriptorId]) REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
ALTER TABLE [edfi].[StudentAcademicRecordAcademicHonor]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordAcademicHonor_StudentAcademicRecord_StudentUSI] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[StudentAcademicRecord] ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[DisciplineIncidentWeapon]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineIncidentWeapons_DisciplineIncident_SchoolId] FOREIGN KEY ([IncidentIdentifier], [SchoolId]) REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId]) ON DELETE CASCADE
ALTER TABLE [edfi].[DisciplineIncidentWeapon]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineIncidentWeapons_WeaponDescriptor_WeaponDescriptorId] FOREIGN KEY ([WeaponDescriptorId]) REFERENCES [edfi].[WeaponDescriptor] ([WeaponDescriptorId])
ALTER TABLE [edfi].[Location]
    WITH NOCHECK ADD CONSTRAINT [FK_Location_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[ReportCardGrade]
    WITH NOCHECK ADD CONSTRAINT [FK_ReportCardGrade_Grade] FOREIGN KEY ([GradingPeriodDescriptorId], [GradingPeriodBeginDate], [GradeTypeId], [StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [BeginDate]) REFERENCES [edfi].[Grade] ([GradingPeriodDescriptorId], [GradingPeriodBeginDate], [GradeTypeId], [StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [BeginDate]) ON UPDATE CASCADE
ALTER TABLE [edfi].[ReportCardGrade]
    WITH NOCHECK ADD CONSTRAINT [FK_ReportCardGrade_ReportCard_SchoolId] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId]) REFERENCES [edfi].[ReportCard] ([StudentUSI], [EducationOrganizationId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId])
ALTER TABLE [edfi].[StaffInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffInternationalAddress_AddressType_AddressTypeId] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId])
ALTER TABLE [edfi].[StaffInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffInternationalAddress_CountryDescriptorId_CountryDescriptor_CountryDescriptorId] FOREIGN KEY ([CountryDescriptorId]) REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
ALTER TABLE [edfi].[StaffInternationalAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffInternationalAddress_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentSchoolAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEvent_AttendanceEventCategoryDescriptorId] FOREIGN KEY ([AttendanceEventCategoryDescriptorId]) REFERENCES [edfi].[AttendanceEventCategoryDescriptor] ([AttendanceEventCategoryDescriptorId])
ALTER TABLE [edfi].[StudentSchoolAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEvent_EducationalEnvironmentType_EducationalEnvironmentTypeId] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId])
ALTER TABLE [edfi].[StudentSchoolAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEvent_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[StudentSchoolAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEvent_Session_SchoolId] FOREIGN KEY ([SchoolId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[Session] ([SchoolId], [SchoolYear], [TermDescriptorId]) ON UPDATE CASCADE
ALTER TABLE [edfi].[StudentSchoolAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEvent_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[InterventionPrescriptionPopulationServed]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionPopulationServed_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionPrescriptionPopulationServed]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionPopulationServed_PopulationServedType_PopulationServedTypeId] FOREIGN KEY ([PopulationServedTypeId]) REFERENCES [edfi].[PopulationServedType] ([PopulationServedTypeId])
ALTER TABLE [edfi].[Payroll]
    WITH NOCHECK ADD CONSTRAINT [FK_Payroll_Account_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [AccountNumber], [FiscalYear]) REFERENCES [edfi].[Account] ([EducationOrganizationId], [AccountNumber], [FiscalYear])
ALTER TABLE [edfi].[Payroll]
    WITH NOCHECK ADD CONSTRAINT [FK_Payroll_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[GraduationPlanRequiredAssessment]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanRequiredAssessment_Assessment_AssessmentTitle] FOREIGN KEY ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
ALTER TABLE [edfi].[GraduationPlanRequiredAssessment]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanRequiredAssessment_GraduationPlan_EducationOrganizationId] FOREIGN KEY ([GraduationPlanTypeDescriptorId], [EducationOrganizationId], [GraduationSchoolYear]) REFERENCES [edfi].[GraduationPlan] ([GraduationPlanTypeDescriptorId], [EducationOrganizationId], [GraduationSchoolYear])
ALTER TABLE [edfi].[CompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_CompetencyObjective_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[CompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_CompetencyObjective_ObjectiveGradeLevelDescriptorId] FOREIGN KEY ([ObjectiveGradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[ClassPeriod]
    WITH NOCHECK ADD CONSTRAINT [FK_ClassPeriod_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[StudentTitleIPartAProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentTitleIPartAProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentTitleIPartAProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentTitleIPartAProgramAssociation_TitleIPartAParticipantType_TitleIPartAParticipantTypeId] FOREIGN KEY ([TitleIPartAParticipantTypeId]) REFERENCES [edfi].[TitleIPartAParticipantType] ([TitleIPartAParticipantTypeId])
ALTER TABLE [edfi].[WeaponDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_WeaponDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([WeaponDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[WeaponDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_WeaponDescriptor_WeaponsType_WeaponsTypeId] FOREIGN KEY ([WeaponTypeId]) REFERENCES [edfi].[WeaponType] ([WeaponTypeId])
ALTER TABLE [edfi].[StaffClassificationDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffClassificationDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([StaffClassificationDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffClassificationDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffClassificationDescriptor_StaffClassificationType_StaffClassificationTypeId] FOREIGN KEY ([StaffClassificationTypeId]) REFERENCES [edfi].[StaffClassificationType] ([StaffClassificationTypeId])
ALTER TABLE [edfi].[StudentSpecialEducationProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociation_SpecialEducationSettingDescriptor_SpecialEducationSettingDescriptorId] FOREIGN KEY ([SpecialEducationSettingDescriptorId]) REFERENCES [edfi].[SpecialEducationSettingDescriptor] ([SpecialEducationSettingDescriptorId])
ALTER TABLE [edfi].[StudentSpecialEducationProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[SpecialEducationSettingDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_SpecialEducationSettingDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([SpecialEducationSettingDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[SpecialEducationSettingDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_SpecialEducationSettingDescriptor_SpecialEducationSettingType_SpecialEducationSettingTypeId] FOREIGN KEY ([SpecialEducationSettingTypeId]) REFERENCES [edfi].[SpecialEducationSettingType] ([SpecialEducationSettingTypeId])
ALTER TABLE [edfi].[SchoolFoodServicesEligibilityDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_SchoolFoodServicesEligibilityDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([SchoolFoodServicesEligibilityDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[SchoolFoodServicesEligibilityDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_SchoolFoodServicesEligibilityDescriptor_SchoolFoodServicesEligibilityType_SchoolFoodServicesEligibilityTypeId] FOREIGN KEY ([SchoolFoodServicesEligibilityTypeId]) REFERENCES [edfi].[SchoolFoodServicesEligibilityType] ([SchoolFoodServicesEligibilityTypeId])
ALTER TABLE [edfi].[StaffSchoolAssociationGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSchoolAssociationGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[StaffSchoolAssociationGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSchoolAssociationGradeLevel_StaffSchoolAssociation_StaffUSI] FOREIGN KEY ([StaffUSI], [ProgramAssignmentDescriptorId], [SchoolId]) REFERENCES [edfi].[StaffSchoolAssociation] ([StaffUSI], [ProgramAssignmentDescriptorId], [SchoolId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffIdentificationDocument_IdentificationDocumentUseType_IdentificationDocumentUseTypeId] FOREIGN KEY ([IdentificationDocumentUseTypeId]) REFERENCES [edfi].[IdentificationDocumentUseType] ([IdentificationDocumentUseTypeId])
ALTER TABLE [edfi].[StaffIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffIdentificationDocument_IssuerCountryDescriptorId_CountryDescriptor_CountryDescriptorId] FOREIGN KEY ([IssuerCountryDescriptorId]) REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
ALTER TABLE [edfi].[StaffIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffIdentificationDocument_PersonalInformationVerificationType_PersonalInformationVerificationTypeId] FOREIGN KEY ([PersonalInformationVerificationTypeId]) REFERENCES [edfi].[PersonalInformationVerificationType] ([PersonalInformationVerificationTypeId])
ALTER TABLE [edfi].[StaffIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffIdentificationDocument_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseOfferingCurriculumUsed]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseOfferingCurriculumUsed_CourseOffering_LocalCourseCode] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [TermDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseOfferingCurriculumUsed]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseOfferingCurriculumUsed_CurriculumUsedType_CurriculumUsedTypeId] FOREIGN KEY ([CurriculumUsedTypeId]) REFERENCES [edfi].[CurriculumUsedType] ([CurriculumUsedTypeId])
ALTER TABLE [edfi].[SectionCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_SectionCharacteristic_Section_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [edfi].[SectionCharacteristic]
    WITH NOCHECK ADD CONSTRAINT [FK_SectionCharacteristic_SectionCharacteristicsDescriptor_SectionCharacteristicsDescriptorId] FOREIGN KEY ([SectionCharacteristicDescriptorId]) REFERENCES [edfi].[SectionCharacteristicDescriptor] ([SectionCharacteristicDescriptorId])
ALTER TABLE [edfi].[ReporterDescriptionDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ReporterDescriptionDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ReporterDescriptionDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ReporterDescriptionDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ReporterDescriptionDescriptor_ReporterDescriptionType_ReporterDescriptionTypeId] FOREIGN KEY ([ReporterDescriptionTypeId]) REFERENCES [edfi].[ReporterDescriptionType] ([ReporterDescriptionTypeId])
ALTER TABLE [edfi].[TermDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_TermDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([TermDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId])
ALTER TABLE [edfi].[TermDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_TermDescriptor_TermType_TermTypeId] FOREIGN KEY ([TermTypeId]) REFERENCES [edfi].[TermType] ([TermTypeId]) ON UPDATE CASCADE
ALTER TABLE [edfi].[StudentCohortAssociationSection]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCohortAssociationSection_Section_LocalCourseCode] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) ON UPDATE CASCADE
ALTER TABLE [edfi].[StudentCohortAssociationSection]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCohortAssociationSection_StudentCohortAssociation_StudentUSI] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [CohortIdentifier], [BeginDate]) REFERENCES [edfi].[StudentCohortAssociation] ([StudentUSI], [EducationOrganizationId], [CohortIdentifier], [BeginDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[AccountCode]
    WITH NOCHECK ADD CONSTRAINT [FK_AccountCode_Account_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [AccountNumber], [FiscalYear]) REFERENCES [edfi].[Account] ([EducationOrganizationId], [AccountNumber], [FiscalYear]) ON DELETE CASCADE
ALTER TABLE [edfi].[AccountCode]
    WITH NOCHECK ADD CONSTRAINT [FK_AccountCode_AccountCodeDescriptor_AccountCodeDescriptorId] FOREIGN KEY ([AccountCodeDescriptorId]) REFERENCES [edfi].[AccountCodeDescriptor] ([AccountCodeDescriptorId])
ALTER TABLE [edfi].[Account]
    WITH NOCHECK ADD CONSTRAINT [FK_Account_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[OpenStaffPositionAcademicSubject]
    WITH NOCHECK ADD CONSTRAINT [FK_OpenStaffPositionAcademicSubject_AcademicSubjectDescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
ALTER TABLE [edfi].[OpenStaffPositionAcademicSubject]
    WITH NOCHECK ADD CONSTRAINT [FK_OpenStaffPositionAcademicSubjects_OpenStaffPosition_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [EmploymentStatusDescriptorId], [StaffClassificationDescriptorId], [RequisitionNumber], [DatePosted]) REFERENCES [edfi].[OpenStaffPosition] ([EducationOrganizationId], [EmploymentStatusDescriptorId], [StaffClassificationDescriptorId], [RequisitionNumber], [DatePosted]) ON DELETE CASCADE
ALTER TABLE [edfi].[StateEducationAgencyAccountability]
    WITH NOCHECK ADD CONSTRAINT [FK_StateEducationAgencyAccountability_SchoolYearType_SchoolYear] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
ALTER TABLE [edfi].[StateEducationAgencyAccountability]
    WITH NOCHECK ADD CONSTRAINT [FK_StateEducationAgencyAccountability_StateEducationAgency_StateEducationAgencyId] FOREIGN KEY ([StateEducationAgencyId]) REFERENCES [edfi].[StateEducationAgency] ([StateEducationAgencyId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StateEducationAgency]
    WITH NOCHECK ADD CONSTRAINT [FK_StateEducationAgency_EducationOrganization_StateEducationAgencyId] FOREIGN KEY ([StateEducationAgencyId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LocalEducationAgencyAccountability]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgencyAccountability_GunFreeSchoolsActReportingStatusType_GunFreeSchoolsActReportingStatusTypeId] FOREIGN KEY ([GunFreeSchoolsActReportingStatusTypeId]) REFERENCES [edfi].[GunFreeSchoolsActReportingStatusType] ([GunFreeSchoolsActReportingStatusTypeId])
ALTER TABLE [edfi].[LocalEducationAgencyAccountability]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgencyAccountability_LocalEducationAgency_LocalEducationAgencyId] FOREIGN KEY ([LocalEducationAgencyId]) REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LocalEducationAgencyAccountability]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgencyAccountability_SchoolChoiceImplementStatusType_SchoolChoiceImplementationStatusTypeId] FOREIGN KEY ([SchoolChoiceImplementStatusTypeId]) REFERENCES [edfi].[SchoolChoiceImplementStatusType] ([SchoolChoiceImplementStatusTypeId])
ALTER TABLE [edfi].[LocalEducationAgencyAccountability]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgencyAccountability_SchoolYearType_SchoolYear] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
ALTER TABLE [edfi].[LevelDescriptorGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_LevelDescriptorGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[LevelDescriptorGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_LevelDescriptorGradeLevel_LevelDescriptor_LevelDescriptorId] FOREIGN KEY ([LevelDescriptorId]) REFERENCES [edfi].[LevelDescriptor] ([LevelDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentDisciplineIncidentAssociationBehavior]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentBehavior_BehaviorDescriptor_BehaviorDescriptorId] FOREIGN KEY ([BehaviorDescriptorId]) REFERENCES [edfi].[BehaviorDescriptor] ([BehaviorDescriptorId])
ALTER TABLE [edfi].[StudentDisciplineIncidentAssociationBehavior]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentBehavior_StudentDisciplineIncidentAssociation_StudentUSI] FOREIGN KEY ([StudentUSI], [SchoolId], [IncidentIdentifier]) REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([StudentUSI], [SchoolId], [IncidentIdentifier]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentIdentificationCode_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentIdentificationCode_StudentIdentificationSystemDescriptor_DescriptorId] FOREIGN KEY ([StudentIdentificationSystemDescriptorId]) REFERENCES [edfi].[StudentIdentificationSystemDescriptor] ([StudentIdentificationSystemDescriptorId])
ALTER TABLE [edfi].[GradingPeriodDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_GradingPeriodDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([GradingPeriodDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[GradingPeriodDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_GradingPeriodDescriptor_GradingPeriodType_GradingPeriodTypeId] FOREIGN KEY ([GradingPeriodTypeId]) REFERENCES [edfi].[GradingPeriodType] ([GradingPeriodTypeId])
ALTER TABLE [edfi].[ReportCardStudentLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_ReportCardStudentLearningObjective_ReportCard] FOREIGN KEY ([StudentUSI], [ReportCardEducationOrganizationId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId]) REFERENCES [edfi].[ReportCard] ([StudentUSI], [EducationOrganizationId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ReportCardStudentLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_ReportCardStudentLearningObjective_StudentLearningObjective_StudentUSI] FOREIGN KEY ([StudentUSI], [Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId]) REFERENCES [edfi].[StudentLearningObjective] ([StudentUSI], [Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId])
ALTER TABLE [edfi].[GraduationPlanRequiredAssessmentAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanRequiredAssessmentAssessmentPerformanceLevel_AssessmentReportingMethodType_AssessmentReportingMethodTypeId] FOREIGN KEY ([AssessmentReportingMethodTypeId]) REFERENCES [edfi].[AssessmentReportingMethodType] ([AssessmentReportingMethodTypeId])
ALTER TABLE [edfi].[GraduationPlanRequiredAssessmentAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanRequiredAssessmentAssessmentPerformanceLevel_GraduationPlanRequiredAssessment_AssessmentTitle] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear]) REFERENCES [edfi].[GraduationPlanRequiredAssessment] ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear])
ALTER TABLE [edfi].[GraduationPlanRequiredAssessmentAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanRequiredAssessmentAssessmentPerformanceLevel_PerformanceLevelDescriptor_PerformanceLevelDescriptorId] FOREIGN KEY ([PerformanceLevelDescriptorId]) REFERENCES [edfi].[PerformanceLevelDescriptor] ([PerformanceLevelDescriptorId])
ALTER TABLE [edfi].[GraduationPlanRequiredAssessmentAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanRequiredAssessmentAssessmentPerformanceLevel_ResultDatatypeType_ResultDatatypeTypeId] FOREIGN KEY ([ResultDatatypeTypeId]) REFERENCES [edfi].[ResultDatatypeType] ([ResultDatatypeTypeId])
ALTER TABLE [edfi].[StaffCredential]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffCredential_CredentialFieldDescriptor_CredentialFieldDescriptorId] FOREIGN KEY ([CredentialFieldDescriptorId]) REFERENCES [edfi].[CredentialFieldDescriptor] ([CredentialFieldDescriptorId])
ALTER TABLE [edfi].[StaffCredential]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffCredential_CredentialType_CredentialTypeId] FOREIGN KEY ([CredentialTypeId]) REFERENCES [edfi].[CredentialType] ([CredentialTypeId])
ALTER TABLE [edfi].[StaffCredential]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffCredential_LevelDescriptor_LevelDescriptorId] FOREIGN KEY ([LevelDescriptorId]) REFERENCES [edfi].[LevelDescriptor] ([LevelDescriptorId])
ALTER TABLE [edfi].[StaffCredential]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffCredential_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffCredential]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffCredential_StateAbbreviationType_StateOfIssueAbbreviationTypeId] FOREIGN KEY ([StateOfIssueStateAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
ALTER TABLE [edfi].[StaffCredential]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffCredential_TeachingCredentialBasisType_TeachingCredentialBasisTypeId] FOREIGN KEY ([TeachingCredentialBasisTypeId]) REFERENCES [edfi].[TeachingCredentialBasisType] ([TeachingCredentialBasisTypeId])
ALTER TABLE [edfi].[StaffCredential]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffCredential_TeachingCredentialDescriptor_TeachingCredentialDescriptorId] FOREIGN KEY ([TeachingCredentialDescriptorId]) REFERENCES [edfi].[TeachingCredentialDescriptor] ([TeachingCredentialDescriptorId])
ALTER TABLE [edfi].[TeachingCredentialDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_TeachingCredentialDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([TeachingCredentialDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[TeachingCredentialDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_TeachingCredentialDescriptor_TeachingCredentialType_TeachingCredentialTypeId] FOREIGN KEY ([TeachingCredentialTypeId]) REFERENCES [edfi].[TeachingCredentialType] ([TeachingCredentialTypeId])
ALTER TABLE [edfi].[BellScheduleMeetingTime]
    WITH NOCHECK ADD CONSTRAINT [FK_BellScheduleMeetingTime_BellSchedule] FOREIGN KEY ([BellScheduleName], [GradeLevelDescriptorId], [SchoolId], [Date]) REFERENCES [edfi].[BellSchedule] ([BellScheduleName], [GradeLevelDescriptorId], [SchoolId], [Date]) ON DELETE CASCADE
ALTER TABLE [edfi].[BellScheduleMeetingTime]
    WITH NOCHECK ADD CONSTRAINT [FK_BellScheduleMeetingTime_ClassPeriod] FOREIGN KEY ([SchoolId], [ClassPeriodName]) REFERENCES [edfi].[ClassPeriod] ([SchoolId], [ClassPeriodName]) ON UPDATE CASCADE
ALTER TABLE [edfi].[StaffRace]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffRace_RaceType_RaceTypeId] FOREIGN KEY ([RaceTypeId]) REFERENCES [edfi].[RaceType] ([RaceTypeId])
ALTER TABLE [edfi].[StaffRace]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffRace_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[RestraintEventReason]
    WITH NOCHECK ADD CONSTRAINT [FK_RestraintEventReason_RestraintEvent_StudentUSI] FOREIGN KEY ([StudentUSI], [SchoolId], [RestraintEventIdentifier], [EventDate]) REFERENCES [edfi].[RestraintEvent] ([StudentUSI], [SchoolId], [RestraintEventIdentifier], [EventDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[RestraintEventReason]
    WITH NOCHECK ADD CONSTRAINT [FK_RestraintEventReason_RestraintEventReasonType_RestraintEventReasonTypeId] FOREIGN KEY ([RestraintEventReasonTypeId]) REFERENCES [edfi].[RestraintEventReasonType] ([RestraintEventReasonTypeId])
ALTER TABLE [edfi].[OpenStaffPositionInstructionalGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_OpenStaffPositionInstructionalGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[OpenStaffPositionInstructionalGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_OpenStaffPositionInstructionalGradeLevels_OpenStaffPosition_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [EmploymentStatusDescriptorId], [StaffClassificationDescriptorId], [RequisitionNumber], [DatePosted]) REFERENCES [edfi].[OpenStaffPosition] ([EducationOrganizationId], [EmploymentStatusDescriptorId], [StaffClassificationDescriptorId], [RequisitionNumber], [DatePosted]) ON DELETE CASCADE
ALTER TABLE [edfi].[GradeLevelDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_GradeLevelDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[GradeLevelDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_GradeLevelDescriptor_GradeLevelType_GradeLevelTypeId] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId])
ALTER TABLE [edfi].[EducationContentAppropriateSex]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentAppropriateSex_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationContentAppropriateSex]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentAppropriateSex_SexType_SexTypeId] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId])
ALTER TABLE [edfi].[AssessmentFamilyLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamiliyLanguages_AssessmentFamily_AssessmentFamilyTitle] FOREIGN KEY ([AssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamily] ([AssessmentFamilyTitle]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentFamilyLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamilyLanguages_LanguageDescriptor_LanguageDescriptorId] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
ALTER TABLE [edfi].[AccommodationDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AccommodationDescriptor_AccommodationType_AccommodationTypeId] FOREIGN KEY ([AccommodationTypeId]) REFERENCES [edfi].[AccommodationType] ([AccommodationTypeId])
ALTER TABLE [edfi].[AccommodationDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AccommodationDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AccommodationDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ReportCardStudentCompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_ReportCardStudentCompetencyObjective_ReportCard_StudentUSI] FOREIGN KEY ([StudentUSI], [ReportCardEducationOrganizationId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId]) REFERENCES [edfi].[ReportCard] ([StudentUSI], [EducationOrganizationId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId])
ALTER TABLE [edfi].[ReportCardStudentCompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_ReportCardStudentCompetencyObjective_StudentCompetencyObjective_StudentUSI] FOREIGN KEY ([StudentUSI], [Objective], [ObjectiveGradeLevelDescriptorId], [ObjectiveEducationOrganizationId], [SchoolId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate]) REFERENCES [edfi].[StudentCompetencyObjective] ([StudentUSI], [Objective], [ObjectiveGradeLevelDescriptorId], [ObjectiveEducationOrganizationId], [SchoolId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate])
ALTER TABLE [edfi].[StaffTelephone]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffTelephone_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffTelephone]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffTelephone_TelephoneNumberType_TelephoneNumberTypeId] FOREIGN KEY ([TelephoneNumberTypeId]) REFERENCES [edfi].[TelephoneNumberType] ([TelephoneNumberTypeId])
ALTER TABLE [edfi].[BehaviorDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_BehaviorDescriptor_BehaviorType_BehaviorTypeId] FOREIGN KEY ([BehaviorTypeId]) REFERENCES [edfi].[BehaviorType] ([BehaviorTypeId])
ALTER TABLE [edfi].[BehaviorDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_BehaviorDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([BehaviorDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ReportCard]
    WITH NOCHECK ADD CONSTRAINT [FK_ReportCard_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[ReportCard]
    WITH NOCHECK ADD CONSTRAINT [FK_ReportCard_GradingPeriod_SchoolId] FOREIGN KEY ([GradingPeriodDescriptorId], [SchoolId], [GradingPeriodBeginDate]) REFERENCES [edfi].[GradingPeriod] ([GradingPeriodDescriptorId], [SchoolId], [BeginDate])
ALTER TABLE [edfi].[ReportCard]
    WITH NOCHECK ADD CONSTRAINT [FK_ReportCard_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[GradingPeriod]
    WITH NOCHECK ADD CONSTRAINT [FK_GradingPeriod_GradingPeriodDescriptorId] FOREIGN KEY ([GradingPeriodDescriptorId]) REFERENCES [edfi].[GradingPeriodDescriptor] ([GradingPeriodDescriptorId])
ALTER TABLE [edfi].[GradingPeriod]
    WITH NOCHECK ADD CONSTRAINT [FK_GradingPeriod_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[StudentCTEProgramAssociationCTEProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgram_CareerPathwayType_CareerPathwayTypeId] FOREIGN KEY ([CareerPathwayTypeId]) REFERENCES [edfi].[CareerPathwayType] ([CareerPathwayTypeId])
ALTER TABLE [edfi].[StudentCTEProgramAssociationCTEProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgram_StudentCTEProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentCTEProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentCTEProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationOrganizationNetwork]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationNetwork_NetworkPurposeType_NetworkPurposeTypeId] FOREIGN KEY ([NetworkPurposeTypeId]) REFERENCES [edfi].[NetworkPurposeType] ([NetworkPurposeTypeId])
ALTER TABLE [edfi].[EducationOrganizationNetwork]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationNetwork_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationNetworkId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LimitedEnglishProficiencyDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_LimitedEnglishProficiencyDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([LimitedEnglishProficiencyDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LimitedEnglishProficiencyDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_LimitedEnglishProficiencyDescriptor_LimitedEnglishProficiencyType_LimitedEnglishProficiencyTypeId] FOREIGN KEY ([LimitedEnglishProficiencyTypeId]) REFERENCES [edfi].[LimitedEnglishProficiencyType] ([LimitedEnglishProficiencyTypeId])
ALTER TABLE [edfi].[AccountabilityRating]
    WITH NOCHECK ADD CONSTRAINT [FK_AccountabilityRating_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[AccountabilityRating]
    WITH NOCHECK ADD CONSTRAINT [FK_AccountabilityRating_SchoolYearType_SchoolYear] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
ALTER TABLE [edfi].[EducationContentLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentLanguage_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationContentLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentLanguage_LanguageDescriptor_LanguageDescriptorId] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
ALTER TABLE [edfi].[StudentIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentIdentificationSystemDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([StudentIdentificationSystemDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId])
ALTER TABLE [edfi].[StudentIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentIdentificationSystemDescriptor_StudentIdentificationSystemType_StudentIdentificationSystemTypeId] FOREIGN KEY ([StudentIdentificationSystemTypeId]) REFERENCES [edfi].[StudentIdentificationSystemType] ([StudentIdentificationSystemTypeId])
ALTER TABLE [edfi].[StudentProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAssociation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[StudentProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAssociation_Program] FOREIGN KEY ([ProgramEducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName])
ALTER TABLE [edfi].[StudentProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAssociation_ReasonExitedDescriptor_ReasonExitedDescriptorId] FOREIGN KEY ([ReasonExitedDescriptorId]) REFERENCES [edfi].[ReasonExitedDescriptor] ([ReasonExitedDescriptorId])
ALTER TABLE [edfi].[StudentProgramAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAssociation_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[SectionProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_SectionProgram_Program] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName])
ALTER TABLE [edfi].[SectionProgram]
    WITH NOCHECK ADD CONSTRAINT [FK_SectionProgram_Section_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [edfi].[InterventionEducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionEducationContent_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier])
ALTER TABLE [edfi].[InterventionEducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionEducationContent_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseTranscript]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscript_CourseAttemptResultType_CourseAttemptResultTypeId] FOREIGN KEY ([CourseAttemptResultTypeId]) REFERENCES [edfi].[CourseAttemptResultType] ([CourseAttemptResultTypeId])
ALTER TABLE [edfi].[CourseTranscript]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscript_CourseEducationOrganizationId_Course_EducationOrganizationId] FOREIGN KEY ([CourseEducationOrganizationId], [CourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [CourseCode])
ALTER TABLE [edfi].[CourseTranscript]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscript_CourseRepeatCodeType_CourseRepeatCodeTypeId] FOREIGN KEY ([CourseRepeatCodeTypeId]) REFERENCES [edfi].[CourseRepeatCodeType] ([CourseRepeatCodeTypeId])
ALTER TABLE [edfi].[CourseTranscript]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscript_CreditType_AttemptedCreditTypeId] FOREIGN KEY ([AttemptedCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[CourseTranscript]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscript_CreditType_EarnedCreditTypeId] FOREIGN KEY ([EarnedCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[CourseTranscript]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscript_GradeLevelDescriptorId] FOREIGN KEY ([WhenTakenGradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[CourseTranscript]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscript_MethodCreditEarnedType_MethodCreditEarnedTypeId] FOREIGN KEY ([MethodCreditEarnedTypeId]) REFERENCES [edfi].[MethodCreditEarnedType] ([MethodCreditEarnedTypeId])
ALTER TABLE [edfi].[CourseTranscript]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscript_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[CourseTranscript]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseTranscript_StudentAcademicRecord_StudentUSI] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[StudentAcademicRecord] ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId])
ALTER TABLE [edfi].[StudentLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLearningObjective_CompetencyLevelDescriptor_CompetencyLevelDescriptorId] FOREIGN KEY ([CompetencyLevelDescriptorId]) REFERENCES [edfi].[CompetencyLevelDescriptor] ([CompetencyLevelDescriptorId])
ALTER TABLE [edfi].[StudentLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLearningObjective_GradingPeriod_SchoolId] FOREIGN KEY ([GradingPeriodDescriptorId], [SchoolId], [GradingPeriodBeginDate]) REFERENCES [edfi].[GradingPeriod] ([GradingPeriodDescriptorId], [SchoolId], [BeginDate])
ALTER TABLE [edfi].[StudentLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLearningObjective_LearningObjective_Objective] FOREIGN KEY ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId])
ALTER TABLE [edfi].[StudentLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLearningObjective_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[StudentLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLearningObjective_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate])
ALTER TABLE [edfi].[StudentLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentLearningObjective_StudentSectionAssociation_StudentUSI] FOREIGN KEY ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [StudentSectionAssociationBeginDate]) REFERENCES [edfi].[StudentSectionAssociation] ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [BeginDate]) ON UPDATE CASCADE
ALTER TABLE [edfi].[ProgramCharacteristicDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramCharacteristicDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ProgramCharacteristicDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ProgramCharacteristicDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramCharacteristicDescriptor_ProgramCharacteristicType_ProgramCharacteristicTypeId] FOREIGN KEY ([ProgramCharacteristicTypeId]) REFERENCES [edfi].[ProgramCharacteristicType] ([ProgramCharacteristicTypeId])
ALTER TABLE [edfi].[LevelOfEducationDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_LevelOfEducationDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([LevelOfEducationDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LevelOfEducationDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_LevelOfEducationDescriptor_LevelOfEducationType_LevelOfEducationTypeId] FOREIGN KEY ([LevelOfEducationTypeId]) REFERENCES [edfi].[LevelOfEducationType] ([LevelOfEducationTypeId])
ALTER TABLE [edfi].[StudentCompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCompetencyObjective_CompetencyLevelDescriptor_CompetencyLevelDescriptorId] FOREIGN KEY ([CompetencyLevelDescriptorId]) REFERENCES [edfi].[CompetencyLevelDescriptor] ([CompetencyLevelDescriptorId])
ALTER TABLE [edfi].[StudentCompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCompetencyObjective_CompetencyObjective_Objective] FOREIGN KEY ([Objective], [ObjectiveGradeLevelDescriptorId], [ObjectiveEducationOrganizationId]) REFERENCES [edfi].[CompetencyObjective] ([Objective], [ObjectiveGradeLevelDescriptorId], [EducationOrganizationId])
ALTER TABLE [edfi].[StudentCompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCompetencyObjective_GradingPeriod] FOREIGN KEY ([GradingPeriodDescriptorId], [SchoolId], [GradingPeriodBeginDate]) REFERENCES [edfi].[GradingPeriod] ([GradingPeriodDescriptorId], [SchoolId], [BeginDate])
ALTER TABLE [edfi].[StudentCompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCompetencyObjective_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[StudentCompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCompetencyObjective_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [EducationOrganizationId], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate])
ALTER TABLE [edfi].[StudentCompetencyObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCompetencyObjective_StudentSectionAssociation] FOREIGN KEY ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [BeginDate]) REFERENCES [edfi].[StudentSectionAssociation] ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [BeginDate]) ON UPDATE CASCADE
ALTER TABLE [edfi].[EducationContentDerivativeSourceEducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentDerivativeSourceEducationContent_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationContentDerivativeSourceEducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentDerivativeSourceEducationContent_EducationContent_DerivativeSourceContentIdentifier] FOREIGN KEY ([DerivativeSourceContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier])
ALTER TABLE [edfi].[StudentAcademicRecordReportCard]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordReportCard_ReportCard] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId]) REFERENCES [edfi].[ReportCard] ([StudentUSI], [EducationOrganizationId], [GradingPeriodDescriptorId], [GradingPeriodBeginDate], [SchoolId])
ALTER TABLE [edfi].[StudentAcademicRecordReportCard]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecordReportCard_StudentAcademicRecord_StudentUSI] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[StudentAcademicRecord] ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[SectionCharacteristicDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_SectionCharacteristicDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([SectionCharacteristicDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[SectionCharacteristicDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_SectionCharacteristicDescriptor_SectionCharacteristicType_SectionCharacteristicTypeId] FOREIGN KEY ([SectionCharacteristicTypeId]) REFERENCES [edfi].[SectionCharacteristicType] ([SectionCharacteristicTypeId])
ALTER TABLE [edfi].[GradebookEntryLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_GradebookEntryLearningStandard_GradebookEntry_SectionSchoolId] FOREIGN KEY ([GradebookEntryTitle], [ClassroomIdentificationCode], [SchoolId], [ClassPeriodName], [LocalCourseCode], [SchoolYear], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse], [DateAssigned]) REFERENCES [edfi].[GradebookEntry] ([GradebookEntryTitle], [ClassroomIdentificationCode], [SchoolId], [ClassPeriodName], [LocalCourseCode], [SchoolYear], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse], [DateAssigned]) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [edfi].[GradebookEntryLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_GradebookEntryLearningStandard_LearningStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[StaffAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffAddress_AddressType_AddressTypeId] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId])
ALTER TABLE [edfi].[StaffAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffAddress_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffAddress_StateAbbreviationType_StateAbbreviationTypeId] FOREIGN KEY ([StateAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
ALTER TABLE [edfi].[StudentAssessmentAccommodation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAssessmentAccommodation_AccommodationDescriptor_AccommodationDescriptorId] FOREIGN KEY ([AccommodationDescriptorId]) REFERENCES [edfi].[AccommodationDescriptor] ([AccommodationDescriptorId])
ALTER TABLE [edfi].[StudentAssessmentAccommodation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAssessmentAccommodation_StudentAssessment_StudentUSI] FOREIGN KEY ([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate]) REFERENCES [edfi].[StudentAssessment] ([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionAppropriateSex]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionAppropriateSex_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionAppropriateSex]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionAppropriateSex_SexType_SexTypeId] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId])
ALTER TABLE [edfi].[LearningStandardContentStandardAuthor]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandardContentStandardAuthor_LearningStandardContentStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandardContentStandard] ([LearningStandardId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LearningStandardContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandardContentStandard_EducationOrganization_MandatingEducationOrganizationReference] FOREIGN KEY ([MandatingEducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[LearningStandardContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandardContentStandard_LearningStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LearningStandardContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandardContentStandard_PublicationStatusType_PublicationStatusTypeId] FOREIGN KEY ([PublicationStatusTypeId]) REFERENCES [edfi].[PublicationStatusType] ([PublicationStatusTypeId])
ALTER TABLE [edfi].[AdministrativeFundingControlDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AdministrativeFundingControlDescriptor_AdministrativeFundingControlType_AdministrativeFundingControlTypeId] FOREIGN KEY ([AdministrativeFundingControlTypeId]) REFERENCES [edfi].[AdministrativeFundingControlType] ([AdministrativeFundingControlTypeId])
ALTER TABLE [edfi].[AdministrativeFundingControlDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AdministrativeFundingControlDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AdministrativeFundingControlDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentSection]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentSection_Assessment_AssessmentTitle] FOREIGN KEY ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentSection]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentSection_Section_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) ON UPDATE CASCADE
ALTER TABLE [edfi].[InterventionPrescriptionAppropriateGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionAppropriateGradeLevel_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[InterventionPrescriptionAppropriateGradeLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionAppropriateGradeLevel_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ProgramLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramLearningObjective_LearningStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[ProgramLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramLearningObjective_Program_ProgramTypeId] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentCharacteristicDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCharacteristicDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([StudentCharacteristicDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentCharacteristicDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCharacteristicDescriptor_StudentCharacteristicType_StudentCharacteristicTypeId] FOREIGN KEY ([StudentCharacteristicTypeId]) REFERENCES [edfi].[StudentCharacteristicType] ([StudentCharacteristicTypeId])
ALTER TABLE [edfi].[StudentEducationOrganizationAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociation_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[StudentEducationOrganizationAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociation_ResponsibilityDescriptor_ResponsibilityDescriptorId] FOREIGN KEY ([ResponsibilityDescriptorId]) REFERENCES [edfi].[ResponsibilityDescriptor] ([ResponsibilityDescriptorId])
ALTER TABLE [edfi].[StudentEducationOrganizationAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociation_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[StaffElectronicMail]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffElectronicMail_ElectronicMailType_ElectronicMailTypeId] FOREIGN KEY ([ElectronicMailTypeId]) REFERENCES [edfi].[ElectronicMailType] ([ElectronicMailTypeId])
ALTER TABLE [edfi].[StaffElectronicMail]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffElectronicMail_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentElectronicMail]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentElectronicMail_ElectronicMailType_ElectronicMailTypeId] FOREIGN KEY ([ElectronicMailTypeId]) REFERENCES [edfi].[ElectronicMailType] ([ElectronicMailTypeId])
ALTER TABLE [edfi].[StudentElectronicMail]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentElectronicMail_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[AcademicSubjectDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AcademicSubjectDescriptor_AcademicSubjectType_AcademicSubjectTypeId] FOREIGN KEY ([AcademicSubjectTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId])
ALTER TABLE [edfi].[AcademicSubjectDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AcademicSubjectDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ObjectiveAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_ObjectiveAssessmentPerformanceLevel_AssessmentReportingMethodType_AssessmentReportingMethodTypeId] FOREIGN KEY ([AssessmentReportingMethodTypeId]) REFERENCES [edfi].[AssessmentReportingMethodType] ([AssessmentReportingMethodTypeId])
ALTER TABLE [edfi].[ObjectiveAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_ObjectiveAssessmentPerformanceLevel_ObjectiveAssessment] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode]) REFERENCES [edfi].[ObjectiveAssessment] ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[ObjectiveAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_ObjectiveAssessmentPerformanceLevel_PerformanceLevelDescriptor_PerformanceLevelDescriptorId] FOREIGN KEY ([PerformanceLevelDescriptorId]) REFERENCES [edfi].[PerformanceLevelDescriptor] ([PerformanceLevelDescriptorId])
ALTER TABLE [edfi].[ObjectiveAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_ObjectiveAssessmentPerformanceLevel_ResultDatatypeType_ResultDatatypeTypeId] FOREIGN KEY ([ResultDatatypeTypeId]) REFERENCES [edfi].[ResultDatatypeType] ([ResultDatatypeTypeId])
ALTER TABLE [edfi].[StaffLanguageUse]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffLanguageUse_LanguageUseType_LanguageUseTypeId] FOREIGN KEY ([LanguageUseTypeId]) REFERENCES [edfi].[LanguageUseType] ([LanguageUseTypeId])
ALTER TABLE [edfi].[StaffLanguageUse]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffLanguageUse_StaffLanguages_StaffUSI] FOREIGN KEY ([StaffUSI], [LanguageDescriptorId]) REFERENCES [edfi].[StaffLanguage] ([StaffUSI], [LanguageDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffLanguages_LanguageDescriptor_LanguageDescriptorId] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
ALTER TABLE [edfi].[StaffLanguage]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffLanguages_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffSectionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSectionAssociation_ClassroomPositionDescriptor_ClassroomPositionDescriptorId] FOREIGN KEY ([ClassroomPositionDescriptorId]) REFERENCES [edfi].[ClassroomPositionDescriptor] ([ClassroomPositionDescriptorId])
ALTER TABLE [edfi].[StaffSectionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSectionAssociation_Section_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) ON UPDATE CASCADE
ALTER TABLE [edfi].[StaffSectionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSectionAssociation_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[ClassroomPositionDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ClassroomPositionDescriptor_ClassroomPositionType_ClassroomPositionTypeId] FOREIGN KEY ([ClassroomPositionTypeId]) REFERENCES [edfi].[ClassroomPositionType] ([ClassroomPositionTypeId])
ALTER TABLE [edfi].[ClassroomPositionDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ClassroomPositionDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ClassroomPositionDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[Cohort]
    WITH NOCHECK ADD CONSTRAINT [FK_Cohort_AcademicSubjectDescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
ALTER TABLE [edfi].[Cohort]
    WITH NOCHECK ADD CONSTRAINT [FK_Cohort_CohortScopeType_CohortScopeTypeId] FOREIGN KEY ([CohortScopeTypeId]) REFERENCES [edfi].[CohortScopeType] ([CohortScopeTypeId])
ALTER TABLE [edfi].[Cohort]
    WITH NOCHECK ADD CONSTRAINT [FK_Cohort_CohortType_CohortTypeId] FOREIGN KEY ([CohortTypeId]) REFERENCES [edfi].[CohortType] ([CohortTypeId])
ALTER TABLE [edfi].[Cohort]
    WITH NOCHECK ADD CONSTRAINT [FK_Cohort_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[StudentAssessmentStudentObjectiveAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_PerformanceLevelDescriptor_PerformanceLevelDescriptorId] FOREIGN KEY ([PerformanceLevelDescriptorId]) REFERENCES [edfi].[PerformanceLevelDescriptor] ([PerformanceLevelDescriptorId])
ALTER TABLE [edfi].[StudentAssessmentStudentObjectiveAssessmentPerformanceLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_StudentAssessmentStudentObjectiveAssessment] FOREIGN KEY ([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode], [AdministrationDate]) REFERENCES [edfi].[StudentAssessmentStudentObjectiveAssessment] ([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode], [AdministrationDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentItemLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentItemLearningStandard_AssessmentItem] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode]) REFERENCES [edfi].[AssessmentItem] ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentItemLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentItemLearningStandard_LearningStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[AssessmentItem]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentItem_Assessment_AssessmentTitle] FOREIGN KEY ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
ALTER TABLE [edfi].[AssessmentItem]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentItem_AssessmentItemCategoryType_AssessmentItemCategoryTypeId] FOREIGN KEY ([AssessmentItemCategoryTypeId]) REFERENCES [edfi].[AssessmentItemCategoryType] ([AssessmentItemCategoryTypeId])
ALTER TABLE [edfi].[LocalEducationAgency]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgency_CharterStatusType_CharterStatusTypeId] FOREIGN KEY ([CharterStatusTypeId]) REFERENCES [edfi].[CharterStatusType] ([CharterStatusTypeId])
ALTER TABLE [edfi].[LocalEducationAgency]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgency_EducationOrganization_LocalEducationAgencyId] FOREIGN KEY ([LocalEducationAgencyId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LocalEducationAgency]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgency_EducationServiceCenter_EducationServiceCenterId] FOREIGN KEY ([EducationServiceCenterId]) REFERENCES [edfi].[EducationServiceCenter] ([EducationServiceCenterId])
ALTER TABLE [edfi].[LocalEducationAgency]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgency_LocalEducationAgency_LocalEducationAgencyId] FOREIGN KEY ([ParentLocalEducationAgencyId]) REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
ALTER TABLE [edfi].[LocalEducationAgency]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgency_LocalEducationAgencyCategoryType_LocalEducationAgencyCategoryTypeId] FOREIGN KEY ([LocalEducationAgencyCategoryTypeId]) REFERENCES [edfi].[LocalEducationAgencyCategoryType] ([LocalEducationAgencyCategoryTypeId])
ALTER TABLE [edfi].[LocalEducationAgency]
    WITH NOCHECK ADD CONSTRAINT [FK_LocalEducationAgency_StateEducationAgency_StateEducationAgencyId] FOREIGN KEY ([StateEducationAgencyId]) REFERENCES [edfi].[StateEducationAgency] ([StateEducationAgencyId])
ALTER TABLE [edfi].[StaffSchoolAssociationAcademicSubject]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSchoolAssociationAcademicSubject_AcademicSubjectDescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
ALTER TABLE [edfi].[StaffSchoolAssociationAcademicSubject]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSchoolAssociationAcademicSubjects_StaffSchoolAssociation_StaffUSI] FOREIGN KEY ([StaffUSI], [ProgramAssignmentDescriptorId], [SchoolId]) REFERENCES [edfi].[StaffSchoolAssociation] ([StaffUSI], [ProgramAssignmentDescriptorId], [SchoolId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffSchoolAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSchoolAssociation_ProgramAssignmentDescriptorId] FOREIGN KEY ([ProgramAssignmentDescriptorId]) REFERENCES [edfi].[ProgramAssignmentDescriptor] ([ProgramAssignmentDescriptorId])
ALTER TABLE [edfi].[StaffSchoolAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSchoolAssociation_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[StaffSchoolAssociation]
    ADD CONSTRAINT [FK_StaffSchoolAssociation_SchoolYearType_SchoolYear] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
ALTER TABLE [edfi].[StaffSchoolAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffSchoolAssociation_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[InterventionStudyInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyInterventionEffectiveness_DiagnosisDescriptor_DiagnosisDescriptorId] FOREIGN KEY ([DiagnosisDescriptorId]) REFERENCES [edfi].[DiagnosisDescriptor] ([DiagnosisDescriptorId])
ALTER TABLE [edfi].[InterventionStudyInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyInterventionEffectiveness_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[InterventionStudyInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyInterventionEffectiveness_InterventionEffectivenessRatingType_InterventionEffectivenessRatingTypeId] FOREIGN KEY ([InterventionEffectivenessRatingTypeId]) REFERENCES [edfi].[InterventionEffectivenessRatingType] ([InterventionEffectivenessRatingTypeId])
ALTER TABLE [edfi].[InterventionStudyInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyInterventionEffectiveness_InterventionStudy] FOREIGN KEY ([InterventionStudyIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionStudy] ([InterventionStudyIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStudyInterventionEffectiveness]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudyInterventionEffectiveness_PopulationServedType_PopulationServedTypeId] FOREIGN KEY ([PopulationServedTypeId]) REFERENCES [edfi].[PopulationServedType] ([PopulationServedTypeId])
ALTER TABLE [edfi].[DiagnosisDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_DiagnosisDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([DiagnosisDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[DiagnosisDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_DiagnosisDescriptor_DiagnosisType_DiagnosisTypeId] FOREIGN KEY ([DiagnosisTypeId]) REFERENCES [edfi].[DiagnosisType] ([DiagnosisTypeId])
ALTER TABLE [edfi].[CompetencyLevelDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_CompetencyLevelDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([CompetencyLevelDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[CompetencyLevelDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_CompetencyLevelDescriptor_PerformanceBaseType_PerformanceBaseConversionTypeId] FOREIGN KEY ([PerformanceBaseConversionTypeId]) REFERENCES [edfi].[PerformanceBaseConversionType] ([PerformanceBaseConversionTypeId])
ALTER TABLE [edfi].[StudentSchoolAssociationEducationPlan]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSchoolAssociationEducationPlans_EducationPlansType_EducationPlansTypeId] FOREIGN KEY ([EducationPlanTypeId]) REFERENCES [edfi].[EducationPlanType] ([EducationPlanTypeId])
ALTER TABLE [edfi].[StudentSchoolAssociationEducationPlan]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSchoolAssociationEducationPlans_StudentSchoolAssociation_StudentUSI] FOREIGN KEY ([StudentUSI], [SchoolId], [EntryDate]) REFERENCES [edfi].[StudentSchoolAssociation] ([StudentUSI], [SchoolId], [EntryDate]) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [edfi].[StudentDisability]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentDisability_DisabilityDescriptor_DisabilityDescriptorId] FOREIGN KEY ([DisabilityDescriptorId]) REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
ALTER TABLE [edfi].[StudentDisability]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentDisability_DisabilityDeterminationSourceType_DisabilityDeterminationSourceTypeId] FOREIGN KEY ([DisabilityDeterminationSourceTypeId]) REFERENCES [edfi].[DisabilityDeterminationSourceType] ([DisabilityDeterminationSourceTypeId])
ALTER TABLE [edfi].[StudentDisability]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentDisability_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[RestraintEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_RestraintEvent_EducationalEnvironmentType_EducationalEnvironmentTypeId] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId])
ALTER TABLE [edfi].[RestraintEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_RestraintEvent_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[RestraintEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_RestraintEvent_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[OpenStaffPosition]
    WITH NOCHECK ADD CONSTRAINT [FK_OpenStaffPosition_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[OpenStaffPosition]
    WITH NOCHECK ADD CONSTRAINT [FK_OpenStaffPosition_EmploymentStatusDescriptor_EmploymentStatusDescriptorId] FOREIGN KEY ([EmploymentStatusDescriptorId]) REFERENCES [edfi].[EmploymentStatusDescriptor] ([EmploymentStatusDescriptorId])
ALTER TABLE [edfi].[OpenStaffPosition]
    WITH NOCHECK ADD CONSTRAINT [FK_OpenStaffPosition_PostingResultType_PostingResultTypeId] FOREIGN KEY ([PostingResultTypeId]) REFERENCES [edfi].[PostingResultType] ([PostingResultTypeId])
ALTER TABLE [edfi].[OpenStaffPosition]
    WITH NOCHECK ADD CONSTRAINT [FK_OpenStaffPosition_ProgramAssignmentDescriptor_ProgramAssignmentDescriptorId] FOREIGN KEY ([ProgramAssignmentDescriptorId]) REFERENCES [edfi].[ProgramAssignmentDescriptor] ([ProgramAssignmentDescriptorId])
ALTER TABLE [edfi].[OpenStaffPosition]
    WITH NOCHECK ADD CONSTRAINT [FK_OpenStaffPosition_StaffClassificationDescriptorId] FOREIGN KEY ([StaffClassificationDescriptorId]) REFERENCES [edfi].[StaffClassificationDescriptor] ([StaffClassificationDescriptorId])
ALTER TABLE [edfi].[GradebookEntry]
    WITH NOCHECK ADD CONSTRAINT [FK_GradebookEntry_GradebookEntryType_GradebookEntryTypeId] FOREIGN KEY ([GradebookEntryTypeId]) REFERENCES [edfi].[GradebookEntryType] ([GradebookEntryTypeId])
ALTER TABLE [edfi].[GradebookEntry]
    WITH NOCHECK ADD CONSTRAINT [FK_GradebookEntry_GradingPeriod] FOREIGN KEY ([GradingPeriodDescriptorId], [SchoolId], [BeginDate]) REFERENCES [edfi].[GradingPeriod] ([GradingPeriodDescriptorId], [SchoolId], [BeginDate])
ALTER TABLE [edfi].[GradebookEntry]
    WITH NOCHECK ADD CONSTRAINT [FK_GradebookEntry_Section_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) ON UPDATE CASCADE
ALTER TABLE [edfi].[StudentProgramParticipation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramParticipations_ProgramType_ProgramTypeId] FOREIGN KEY ([ProgramTypeId]) REFERENCES [edfi].[ProgramType] ([ProgramTypeId])
ALTER TABLE [edfi].[StudentProgramParticipation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramParticipations_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentInterventionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAssociation_Cohort_CohortEducationOrganizationId] FOREIGN KEY ([CohortIdentifier], [CohortEducationOrganizationId]) REFERENCES [edfi].[Cohort] ([CohortIdentifier], [EducationOrganizationId])
ALTER TABLE [edfi].[StudentInterventionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAssociation_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId])
ALTER TABLE [edfi].[StudentInterventionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentInterventionAssociation_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[Intervention]
    WITH NOCHECK ADD CONSTRAINT [FK_Intervention_DeliveryMethodType_DeliveryMethodTypeId] FOREIGN KEY ([DeliveryMethodTypeId]) REFERENCES [edfi].[DeliveryMethodType] ([DeliveryMethodTypeId])
ALTER TABLE [edfi].[Intervention]
    WITH NOCHECK ADD CONSTRAINT [FK_Intervention_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[Intervention]
    WITH NOCHECK ADD CONSTRAINT [FK_Intervention_InterventionClassType_InterventionClassTypeId] FOREIGN KEY ([InterventionClassTypeId]) REFERENCES [edfi].[InterventionClassType] ([InterventionClassTypeId])
ALTER TABLE [edfi].[InterventionInterventionPrescription]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionInterventionPrescription_Intervention] FOREIGN KEY ([InterventionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[Intervention] ([InterventionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionInterventionPrescription]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionInterventionPrescription_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [InterventionPrescriptionEducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId])
ALTER TABLE [edfi].[InterventionPrescription]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescription_DeliveryMethodType_DeliveryMethodTypeId] FOREIGN KEY ([DeliveryMethodTypeId]) REFERENCES [edfi].[DeliveryMethodType] ([DeliveryMethodTypeId])
ALTER TABLE [edfi].[InterventionPrescription]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescription_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[InterventionPrescription]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescription_InterventionClassType_InterventionClassTypeId] FOREIGN KEY ([InterventionClassTypeId]) REFERENCES [edfi].[InterventionClassType] ([InterventionClassTypeId])
ALTER TABLE [edfi].[SeparationReasonDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_SeparationReasonDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([SeparationReasonDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[SeparationReasonDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_SeparationReasonDescriptor_SeparationReasonType_SeparationReasonTypeId] FOREIGN KEY ([SeparationReasonTypeId]) REFERENCES [edfi].[SeparationReasonType] ([SeparationReasonTypeId])
ALTER TABLE [edfi].[PerformanceLevelDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_PerformanceLevelDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([PerformanceLevelDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[PerformanceLevelDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_PerformanceLevelDescriptor_PerformanceBaseType_PerformanceBaseConversionTypeId] FOREIGN KEY ([PerformanceBaseConversionTypeId]) REFERENCES [edfi].[PerformanceBaseConversionType] ([PerformanceBaseConversionTypeId])
ALTER TABLE [edfi].[InterventionPrescriptionEducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionEducationContent_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier])
ALTER TABLE [edfi].[InterventionPrescriptionEducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionPrescriptionEducationContent_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentProgramAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAttendanceEvent_AttendanceEventCategoryDescriptorId] FOREIGN KEY ([AttendanceEventCategoryDescriptorId]) REFERENCES [edfi].[AttendanceEventCategoryDescriptor] ([AttendanceEventCategoryDescriptorId])
ALTER TABLE [edfi].[StudentProgramAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAttendanceEvent_EducationalEnvironmentType_EducationalEnvironmentTypeId] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId])
ALTER TABLE [edfi].[StudentProgramAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAttendanceEvent_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[StudentProgramAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAttendanceEvent_Program_ProgramTypeId] FOREIGN KEY ([ProgramEducationOrganizationId], [ProgramTypeId], [ProgramName]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId], [ProgramName])
ALTER TABLE [edfi].[StudentProgramAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentProgramAttendanceEvent_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[Program]
    WITH NOCHECK ADD CONSTRAINT [FK_Program_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[Program]
    WITH NOCHECK ADD CONSTRAINT [FK_Program_ProgramSponsorType_ProgramSponsorTypeId] FOREIGN KEY ([ProgramSponsorTypeId]) REFERENCES [edfi].[ProgramSponsorType] ([ProgramSponsorTypeId])
ALTER TABLE [edfi].[Program]
    WITH NOCHECK ADD CONSTRAINT [FK_Program_ProgramType_ProgramTypeId] FOREIGN KEY ([ProgramTypeId]) REFERENCES [edfi].[ProgramType] ([ProgramTypeId])
ALTER TABLE [edfi].[CountryDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_CountryDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([CountryDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId])
ALTER TABLE [edfi].[AssessmentScore]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentScore_Assessment_AssessmentTitle] FOREIGN KEY ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentScore]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentScore_AssessmentReportingMethodType_AssessmentReportingMethodTypeId] FOREIGN KEY ([AssessmentReportingMethodTypeId]) REFERENCES [edfi].[AssessmentReportingMethodType] ([AssessmentReportingMethodTypeId])
ALTER TABLE [edfi].[AssessmentScore]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentScore_ResultDatatypeType_ResultDatatypeTypeId] FOREIGN KEY ([ResultDatatypeTypeId]) REFERENCES [edfi].[ResultDatatypeType] ([ResultDatatypeTypeId])
ALTER TABLE [edfi].[ObjectiveAssessmentAssessmentItem]
    WITH NOCHECK ADD CONSTRAINT [FK_ObjectiveAssessmentAssessmentItem_AssessmentItem] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AssessmentItemIdentificationCode]) REFERENCES [edfi].[AssessmentItem] ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode])
ALTER TABLE [edfi].[ObjectiveAssessmentAssessmentItem]
    WITH NOCHECK ADD CONSTRAINT [FK_ObjectiveAssessmentAssessmentItem_ObjectiveAssessment] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode]) REFERENCES [edfi].[ObjectiveAssessment] ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[GraduationPlanCreditsByCourse]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanCreditsByCourse_CreditType_CreditTypeId] FOREIGN KEY ([CreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[GraduationPlanCreditsByCourse]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanCreditsByCourse_GradeLevelDescriptorId] FOREIGN KEY ([WhenTakenGradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[GraduationPlanCreditsByCourse]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanCreditsByCourse_GraduationPlan_EducationOrganizationId] FOREIGN KEY ([GraduationPlanTypeDescriptorId], [EducationOrganizationId], [GraduationSchoolYear]) REFERENCES [edfi].[GraduationPlan] ([GraduationPlanTypeDescriptorId], [EducationOrganizationId], [GraduationSchoolYear]) ON DELETE CASCADE
ALTER TABLE [edfi].[GraduationPlan]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlan_CreditType_TotalCreditsRequiredCreditTypeId] FOREIGN KEY ([TotalRequiredCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[GraduationPlan]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlan_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[GraduationPlan]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlan_GraduationPlanTypeDescriptor_GraduationPlanTypeDescriptorId] FOREIGN KEY ([GraduationPlanTypeDescriptorId]) REFERENCES [edfi].[GraduationPlanTypeDescriptor] ([GraduationPlanTypeDescriptorId])
ALTER TABLE [edfi].[GraduationPlan]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlan_SchoolYearType_GraduationSchoolYear] FOREIGN KEY ([GraduationSchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
ALTER TABLE [edfi].[CalendarDateCalendarEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_CalendarDateCalendarEvent_CalendarDate] FOREIGN KEY ([SchoolId], [Date]) REFERENCES [edfi].[CalendarDate] ([SchoolId], [Date]) ON DELETE CASCADE
ALTER TABLE [edfi].[CalendarDateCalendarEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_CalendarDateCalendarEvent_CalendarEventDescriptor_CalendarEventDescriptorId] FOREIGN KEY ([CalendarEventDescriptorId]) REFERENCES [edfi].[CalendarEventDescriptor] ([CalendarEventDescriptorId])
ALTER TABLE [edfi].[CalendarEventDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_CalendarEventDescriptor_CalendarEventType_CalendarEventTypeId] FOREIGN KEY ([CalendarEventTypeId]) REFERENCES [edfi].[CalendarEventType] ([CalendarEventTypeId])
ALTER TABLE [edfi].[CalendarEventDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_CalendarEventDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([CalendarEventDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffVisa]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffVisa_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffVisa]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffVisa_VisaType_VisaTypeId] FOREIGN KEY ([VisaTypeId]) REFERENCES [edfi].[VisaType] ([VisaTypeId])
ALTER TABLE [edfi].[Staff]
    WITH NOCHECK ADD CONSTRAINT [FK_Staff_CitizenshipStatusType_CitizenshipStatusTypeId] FOREIGN KEY ([CitizenshipStatusTypeId]) REFERENCES [edfi].[CitizenshipStatusType] ([CitizenshipStatusTypeId])
ALTER TABLE [edfi].[Staff]
    WITH NOCHECK ADD CONSTRAINT [FK_Staff_LevelOfEducationDescriptor_HighestCompletedLevelOfEducationDescriptorId] FOREIGN KEY ([HighestCompletedLevelOfEducationDescriptorId]) REFERENCES [edfi].[LevelOfEducationDescriptor] ([LevelOfEducationDescriptorId])
ALTER TABLE [edfi].[Staff]
    WITH NOCHECK ADD CONSTRAINT [FK_Staff_OldEthnicityType_OldEthnicityTypeId] FOREIGN KEY ([OldEthnicityTypeId]) REFERENCES [edfi].[OldEthnicityType] ([OldEthnicityTypeId])
ALTER TABLE [edfi].[Staff]
    WITH NOCHECK ADD CONSTRAINT [FK_Staff_SexType_SexTypeId] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId])
ALTER TABLE [edfi].[SectionAttendanceTakenEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_SectionAttendanceTakeEvent_Section_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) ON UPDATE CASCADE
ALTER TABLE [edfi].[SectionAttendanceTakenEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_SectionAttendanceTakenEvent_CalendarDate_SchoolId] FOREIGN KEY ([SchoolId], [Date]) REFERENCES [edfi].[CalendarDate] ([SchoolId], [Date])
ALTER TABLE [edfi].[SectionAttendanceTakenEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_SectionAttendanceTakenEvent_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[StudentCohortAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCohortAssociation_Cohort_EducationOrganizationId] FOREIGN KEY ([CohortIdentifier], [EducationOrganizationId]) REFERENCES [edfi].[Cohort] ([CohortIdentifier], [EducationOrganizationId])
ALTER TABLE [edfi].[StudentCohortAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentCohortAssociation_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[Session]
    WITH NOCHECK ADD CONSTRAINT [FK_Session_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[Session]
    WITH NOCHECK ADD CONSTRAINT [FK_Session_SchoolYearType_SchoolYear] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
ALTER TABLE [edfi].[Session]
    WITH NOCHECK ADD CONSTRAINT [FK_Session_TermDescriptor_TermDescriptorId] FOREIGN KEY ([TermDescriptorId]) REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
ALTER TABLE [edfi].[StudentIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentIdentificationDocument_IdentificationDocumentUseType_IdentificationDocumentUseTypeId] FOREIGN KEY ([IdentificationDocumentUseTypeId]) REFERENCES [edfi].[IdentificationDocumentUseType] ([IdentificationDocumentUseTypeId])
ALTER TABLE [edfi].[StudentIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentIdentificationDocument_IssuerCountryDescriptorId_CountryDescriptor_CountryDescriptorId] FOREIGN KEY ([IssuerCountryDescriptorId]) REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
ALTER TABLE [edfi].[StudentIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentIdentificationDocument_PersonalInformationVerificationType_PersonalInformationVerificationTypeId] FOREIGN KEY ([PersonalInformationVerificationTypeId]) REFERENCES [edfi].[PersonalInformationVerificationType] ([PersonalInformationVerificationTypeId])
ALTER TABLE [edfi].[StudentIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentIdentificationDocument_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationContentAuthor]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentAuthor_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier]) ON DELETE CASCADE
ALTER TABLE [edfi].[InterventionStudy]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudy_DeliveryMethodType_DeliveryMethodTypeId] FOREIGN KEY ([DeliveryMethodTypeId]) REFERENCES [edfi].[DeliveryMethodType] ([DeliveryMethodTypeId])
ALTER TABLE [edfi].[InterventionStudy]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudy_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[InterventionStudy]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudy_InterventionClassType_InterventionClassTypeId] FOREIGN KEY ([InterventionClassTypeId]) REFERENCES [edfi].[InterventionClassType] ([InterventionClassTypeId])
ALTER TABLE [edfi].[InterventionStudy]
    WITH NOCHECK ADD CONSTRAINT [FK_InterventionStudy_InterventionPrescription] FOREIGN KEY ([InterventionPrescriptionIdentificationCode], [InterventionPrescriptionEducationOrganizationId]) REFERENCES [edfi].[InterventionPrescription] ([InterventionPrescriptionIdentificationCode], [EducationOrganizationId])
ALTER TABLE [edfi].[DisabilityDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_DisabilityDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([DisabilityDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[DisabilityDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_DisabilityDescriptor_DisabilityCategoryType_DisabilityCategoryId] FOREIGN KEY ([DisabilityCategoryTypeId]) REFERENCES [edfi].[DisabilityCategoryType] ([DisabilityCategoryTypeId])
ALTER TABLE [edfi].[DisabilityDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_DisabilityDescriptor_DisabilityType_DisabilityTypeId] FOREIGN KEY ([DisabilityTypeId]) REFERENCES [edfi].[DisabilityType] ([DisabilityTypeId])
ALTER TABLE [edfi].[EducationOrganizationIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationIdentificationCode_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationOrganizationIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationIdentificationCode_EducationOrganizationIdentificationSystemDescriptorId] FOREIGN KEY ([EducationOrganizationIdentificationSystemDescriptorId]) REFERENCES [edfi].[EducationOrganizationIdentificationSystemDescriptor] ([EducationOrganizationIdentificationSystemDescriptorId])
ALTER TABLE [edfi].[Grade]
    WITH NOCHECK ADD CONSTRAINT [FK_Grade_GradeType_GradeTypeId] FOREIGN KEY ([GradeTypeId]) REFERENCES [edfi].[GradeType] ([GradeTypeId])
ALTER TABLE [edfi].[Grade]
    WITH NOCHECK ADD CONSTRAINT [FK_Grade_GradingPeriod_BeginDate] FOREIGN KEY ([GradingPeriodDescriptorId], [SchoolId], [GradingPeriodBeginDate]) REFERENCES [edfi].[GradingPeriod] ([GradingPeriodDescriptorId], [SchoolId], [BeginDate])
ALTER TABLE [edfi].[Grade]
    WITH NOCHECK ADD CONSTRAINT [FK_Grade_PerformanceBaseType_PerformanceBaseConversionTypeId] FOREIGN KEY ([PerformanceBaseConversionTypeId]) REFERENCES [edfi].[PerformanceBaseConversionType] ([PerformanceBaseConversionTypeId])
ALTER TABLE [edfi].[Grade]
    WITH NOCHECK ADD CONSTRAINT [FK_Grade_StudentSectionAssociation] FOREIGN KEY ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [BeginDate]) REFERENCES [edfi].[StudentSectionAssociation] ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [UniqueSectionCode], [SequenceOfCourse], [SchoolYear], [TermDescriptorId], [BeginDate]) ON UPDATE CASCADE
ALTER TABLE [edfi].[GradebookEntryLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_GradebookEntryLearningObjective_LearningObjective_Objective] FOREIGN KEY ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId])
ALTER TABLE [edfi].[GradebookEntryLearningObjective]
    WITH NOCHECK ADD CONSTRAINT [FK_GradebookEntryLearningOjective_GradebookEntry_SectionSchoolId] FOREIGN KEY ([GradebookEntryTitle], [ClassroomIdentificationCode], [SchoolId], [ClassPeriodName], [LocalCourseCode], [SchoolYear], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse], [DateAssigned]) REFERENCES [edfi].[GradebookEntry] ([GradebookEntryTitle], [ClassroomIdentificationCode], [SchoolId], [ClassPeriodName], [LocalCourseCode], [SchoolYear], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse], [DateAssigned]) ON UPDATE CASCADE
ALTER TABLE [edfi].[EducationContentDerivativeSourceURI]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContentDerivativeSourceURI_EducationContent_ContentIdentifier] FOREIGN KEY ([ContentIdentifier]) REFERENCES [edfi].[EducationContent] ([ContentIdentifier]) ON DELETE CASCADE
ALTER TABLE [edfi].[ParentElectronicMail]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentElectronicMail_ElectronicMailType_ElectronicMailTypeId] FOREIGN KEY ([ElectronicMailTypeId]) REFERENCES [edfi].[ElectronicMailType] ([ElectronicMailTypeId])
ALTER TABLE [edfi].[ParentElectronicMail]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentElectronicMail_Parent_ParentUSI] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[BellSchedule]
    WITH NOCHECK ADD CONSTRAINT [FK_BellSchedule_CalendarDate_Date] FOREIGN KEY ([SchoolId], [Date]) REFERENCES [edfi].[CalendarDate] ([SchoolId], [Date])
ALTER TABLE [edfi].[BellSchedule]
    WITH NOCHECK ADD CONSTRAINT [FK_BellSchedule_GradeLevelDescriptorId] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[CalendarDate]
    WITH NOCHECK ADD CONSTRAINT [FK_CalendarDate_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[ResidencyStatusDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ResidencyStatusDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ResidencyStatusDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ResidencyStatusDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ResidencyStatusDescriptor_ResidencyStatusType_ResidencyStatusTypeId] FOREIGN KEY ([ResidencyStatusTypeId]) REFERENCES [edfi].[ResidencyStatusType] ([ResidencyStatusTypeId])
ALTER TABLE [edfi].[ParentTelephone]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentTelephone_Parent_ParentUSI] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[ParentTelephone]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentTelephone_TelephoneNumberType_TelephoneNumberTypeId] FOREIGN KEY ([TelephoneNumberTypeId]) REFERENCES [edfi].[TelephoneNumberType] ([TelephoneNumberTypeId])
ALTER TABLE [edfi].[StudentOtherName]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentOtherName_OtherNameType_OtherNameTypeId] FOREIGN KEY ([OtherNameTypeId]) REFERENCES [edfi].[OtherNameType] ([OtherNameTypeId])
ALTER TABLE [edfi].[StudentOtherName]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentOtherName_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[Student]
    WITH NOCHECK ADD CONSTRAINT [FK_Student_BirthCountryDescriptorId_CountryDescriptor_CountryDescriptorId] FOREIGN KEY ([BirthCountryDescriptorId]) REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
ALTER TABLE [edfi].[Student]
    WITH NOCHECK ADD CONSTRAINT [FK_Student_CitizenshipStatusType_CitizenshipStatusTypeId] FOREIGN KEY ([CitizenshipStatusTypeId]) REFERENCES [edfi].[CitizenshipStatusType] ([CitizenshipStatusTypeId])
ALTER TABLE [edfi].[Student]
    WITH NOCHECK ADD CONSTRAINT [FK_Student_LimitedEnglishProficiencyDescriptorId] FOREIGN KEY ([LimitedEnglishProficiencyDescriptorId]) REFERENCES [edfi].[LimitedEnglishProficiencyDescriptor] ([LimitedEnglishProficiencyDescriptorId])
ALTER TABLE [edfi].[Student]
    WITH NOCHECK ADD CONSTRAINT [FK_Student_OldEthnicityType_OldEthnicityTypeId] FOREIGN KEY ([OldEthnicityTypeId]) REFERENCES [edfi].[OldEthnicityType] ([OldEthnicityTypeId])
ALTER TABLE [edfi].[Student]
    WITH NOCHECK ADD CONSTRAINT [FK_Student_SchoolFoodServicesEligibilityDescriptor_SchoolFoodServicesEligibilityDescriptorId] FOREIGN KEY ([SchoolFoodServicesEligibilityDescriptorId]) REFERENCES [edfi].[SchoolFoodServicesEligibilityDescriptor] ([SchoolFoodServicesEligibilityDescriptorId])
ALTER TABLE [edfi].[Student]
    WITH NOCHECK ADD CONSTRAINT [FK_Student_SexType_SexTypeId] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId])
ALTER TABLE [edfi].[Student]
    WITH NOCHECK ADD CONSTRAINT [FK_Student_StateAbbreviationType_StateOfBirthAbbreviationTypeId] FOREIGN KEY ([BirthStateAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
ALTER TABLE [edfi].[SchoolCategory]
    WITH NOCHECK ADD CONSTRAINT [FK_SchoolCategory_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]) ON DELETE CASCADE
ALTER TABLE [edfi].[SchoolCategory]
    WITH NOCHECK ADD CONSTRAINT [FK_SchoolCategory_SchoolCategoryType_SchoolCategoryTypeId] FOREIGN KEY ([SchoolCategoryTypeId]) REFERENCES [edfi].[SchoolCategoryType] ([SchoolCategoryTypeId])
ALTER TABLE [edfi].[EducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContent_ContentClassType_ContentClassTypeId] FOREIGN KEY ([ContentClassTypeId]) REFERENCES [edfi].[ContentClassType] ([ContentClassTypeId])
ALTER TABLE [edfi].[EducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContent_CostRateType_CostRateTypeId] FOREIGN KEY ([CostRateTypeId]) REFERENCES [edfi].[CostRateType] ([CostRateTypeId])
ALTER TABLE [edfi].[EducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContent_InteractivityStyleType_InteractivityStyleTypeId] FOREIGN KEY ([InteractivityStyleTypeId]) REFERENCES [edfi].[InteractivityStyleType] ([InteractivityStyleTypeId])
ALTER TABLE [edfi].[EducationContent]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationContent_LearningStandard_LearningStandardId] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[GraduationPlanRequiredAssessmentScore]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanRequiredAssessmentScore_AssessmentReportingMethodType_AssessmentReportingMethodTypeId] FOREIGN KEY ([AssessmentReportingMethodTypeId]) REFERENCES [edfi].[AssessmentReportingMethodType] ([AssessmentReportingMethodTypeId])
ALTER TABLE [edfi].[GraduationPlanRequiredAssessmentScore]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanRequiredAssessmentScore_GraduationPlanRequiredAssessment_AssessmentTitle] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear]) REFERENCES [edfi].[GraduationPlanRequiredAssessment] ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear])
ALTER TABLE [edfi].[GraduationPlanRequiredAssessmentScore]
    WITH NOCHECK ADD CONSTRAINT [FK_GraduationPlanRequiredAssessmentScore_ResultDatatypeType_ResultDatatypeTypeId] FOREIGN KEY ([ResultDatatypeTypeId]) REFERENCES [edfi].[ResultDatatypeType] ([ResultDatatypeTypeId])
ALTER TABLE [edfi].[StudentDisciplineIncidentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociation_DisciplineIncident_SchoolId] FOREIGN KEY ([IncidentIdentifier], [SchoolId]) REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ALTER TABLE [edfi].[StudentDisciplineIncidentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociation_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[StudentDisciplineIncidentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociation_StudentParticipationCodeType_StudentParticipationCodeTypeId] FOREIGN KEY ([StudentParticipationCodeTypeId]) REFERENCES [edfi].[StudentParticipationCodeType] ([StudentParticipationCodeTypeId])
ALTER TABLE [edfi].[DisciplineIncident]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineIncident_IncidentLocationType_IncidentLocationTypeId] FOREIGN KEY ([IncidentLocationTypeId]) REFERENCES [edfi].[IncidentLocationType] ([IncidentLocationTypeId])
ALTER TABLE [edfi].[DisciplineIncident]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineIncident_ReporterDescriptionDescriptorId] FOREIGN KEY ([ReporterDescriptionDescriptorId]) REFERENCES [edfi].[ReporterDescriptionDescriptor] ([ReporterDescriptionDescriptorId])
ALTER TABLE [edfi].[DisciplineIncident]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineIncident_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[DisciplineIncident]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineIncident_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[CourseIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseIdentificationDescriptor_Descriptor] FOREIGN KEY ([CourseIdentificationSystemDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId])
ALTER TABLE [edfi].[CourseIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseIdentificationSystemDescriptor_CourseIdentificationSystemType] FOREIGN KEY ([CourseIdentificationSystemTypeId]) REFERENCES [edfi].[CourseIdentificationSystemType] ([CourseIdentificationSystemTypeId])
ALTER TABLE [edfi].[EducationOrganization]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganization_OperationalStatusType_OperationalStatusTypeId] FOREIGN KEY ([OperationalStatusTypeId]) REFERENCES [edfi].[OperationalStatusType] ([OperationalStatusTypeId])
ALTER TABLE [edfi].[AssessmentIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentIdentificationSystemDescriptor_AssessmentIdentificationSystemType_AssessmentIdentificationSystemTypeId] FOREIGN KEY ([AssessmentIdentificationSystemTypeId]) REFERENCES [edfi].[AssessmentIdentificationSystemType] ([AssessmentIdentificationSystemTypeId])
ALTER TABLE [edfi].[AssessmentIdentificationSystemDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentIdentificationSystemDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AssessmentIdentificationSystemDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId])
ALTER TABLE [edfi].[StudentSectionAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSectionAttendanceEvent_AttendanceEventCategoryDescriptorId] FOREIGN KEY ([AttendanceEventCategoryDescriptorId]) REFERENCES [edfi].[AttendanceEventCategoryDescriptor] ([AttendanceEventCategoryDescriptorId])
ALTER TABLE [edfi].[StudentSectionAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSectionAttendanceEvent_EducationalEnvironmentType_EducationalEnvironmentTypeId] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId])
ALTER TABLE [edfi].[StudentSectionAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSectionAttendanceEvent_Section_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) ON UPDATE CASCADE
ALTER TABLE [edfi].[StudentSectionAttendanceEvent]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSectionAttendanceEvent_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[AttendanceEventCategoryDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AttendanceEventCategoryDescriptor_AttendanceEventCategoryType_AttendanceEventCategoryTypeId] FOREIGN KEY ([AttendanceEventCategoryTypeId]) REFERENCES [edfi].[AttendanceEventCategoryType] ([AttendanceEventCategoryTypeId])
ALTER TABLE [edfi].[AttendanceEventCategoryDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AttendanceEventCategoryDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AttendanceEventCategoryDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[StaffEducationOrganizationEmploymentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffEducationOrganizationEmploymentAssociation_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[StaffEducationOrganizationEmploymentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffEducationOrganizationEmploymentAssociation_EmploymentStatusDescriptor_EmploymentStatusDescriptorId] FOREIGN KEY ([EmploymentStatusDescriptorId]) REFERENCES [edfi].[EmploymentStatusDescriptor] ([EmploymentStatusDescriptorId])
ALTER TABLE [edfi].[StaffEducationOrganizationEmploymentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffEducationOrganizationEmploymentAssociation_SeparationReasonDescriptor_SeparationReasonDescriptorId] FOREIGN KEY ([SeparationReasonDescriptorId]) REFERENCES [edfi].[SeparationReasonDescriptor] ([SeparationReasonDescriptorId])
ALTER TABLE [edfi].[StaffEducationOrganizationEmploymentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffEducationOrganizationEmploymentAssociation_SeparationType_SeparationTypeId] FOREIGN KEY ([SeparationTypeId]) REFERENCES [edfi].[SeparationType] ([SeparationTypeId])
ALTER TABLE [edfi].[StaffEducationOrganizationEmploymentAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StaffEducationOrganizationEmploymentAssociation_Staff_StaffUSI] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
ALTER TABLE [edfi].[LevelDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_LevelDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([LevelDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[CourseCompetencyLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseCompetencyLevel_CompetencyLevelDescriptor_CompetencyLevelDescriptorId] FOREIGN KEY ([CompetencyLevelDescriptorId]) REFERENCES [edfi].[CompetencyLevelDescriptor] ([CompetencyLevelDescriptorId])
ALTER TABLE [edfi].[CourseCompetencyLevel]
    WITH NOCHECK ADD CONSTRAINT [FK_CourseCompetencyLevel_Course_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId], [CourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [CourseCode]) ON DELETE CASCADE
ALTER TABLE [edfi].[Course]
    WITH NOCHECK ADD CONSTRAINT [FK_Course_AcademicSubjectDescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
ALTER TABLE [edfi].[Course]
    WITH NOCHECK ADD CONSTRAINT [FK_Course_CareerPathwayType_CareerPathwayTypeId] FOREIGN KEY ([CareerPathwayTypeId]) REFERENCES [edfi].[CareerPathwayType] ([CareerPathwayTypeId])
ALTER TABLE [edfi].[Course]
    WITH NOCHECK ADD CONSTRAINT [FK_Course_CourseDefinedByType_CourseDefinedByTypeId] FOREIGN KEY ([CourseDefinedByTypeId]) REFERENCES [edfi].[CourseDefinedByType] ([CourseDefinedByTypeId])
ALTER TABLE [edfi].[Course]
    WITH NOCHECK ADD CONSTRAINT [FK_Course_CourseGPAApplicabilityType_CourseGPAApplicabilityTypeId] FOREIGN KEY ([CourseGPAApplicabilityTypeId]) REFERENCES [edfi].[CourseGPAApplicabilityType] ([CourseGPAApplicabilityTypeId])
ALTER TABLE [edfi].[Course]
    WITH NOCHECK ADD CONSTRAINT [FK_Course_CreditType_MaximumAvailableCreditTypeId] FOREIGN KEY ([MaximumAvailableCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[Course]
    WITH NOCHECK ADD CONSTRAINT [FK_Course_CreditType_MinimumAvailableCreditTypeId] FOREIGN KEY ([MinimumAvailableCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[Course]
    WITH NOCHECK ADD CONSTRAINT [FK_Course_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[LearningObjectiveContentStandardAuthor]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningObjectiveContentStandardAuthor_LearningObjectiveContentStandard_Objective] FOREIGN KEY ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) REFERENCES [edfi].[LearningObjectiveContentStandard] ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LearningObjectiveContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningObjectiveContentStandard_EducationOrganization_MandatingEducationOrganizationId] FOREIGN KEY ([MandatingEducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[LearningObjectiveContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningObjectiveContentStandard_LearningObjective_Objective] FOREIGN KEY ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LearningObjectiveContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningObjectiveContentStandard_PublicationStatusType_PublicationStatusTypeId] FOREIGN KEY ([PublicationStatusTypeId]) REFERENCES [edfi].[PublicationStatusType] ([PublicationStatusTypeId])
ALTER TABLE [edfi].[StudentAcademicRecord]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecord_CreditType_CumulativeAttemptedCreditTypeId] FOREIGN KEY ([CumulativeAttemptedCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[StudentAcademicRecord]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecord_CreditType_CumulativeEarnedCreditTypeId] FOREIGN KEY ([CumulativeEarnedCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[StudentAcademicRecord]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecord_CreditType_SessionAttemptedCreditTypeId] FOREIGN KEY ([SessionAttemptedCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[StudentAcademicRecord]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecord_CreditType_SessionEarnedCreditTypeId] FOREIGN KEY ([SessionEarnedCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[StudentAcademicRecord]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecord_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[StudentAcademicRecord]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecord_SchoolYearType_SchoolYear] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
ALTER TABLE [edfi].[StudentAcademicRecord]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecord_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[StudentAcademicRecord]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentAcademicRecord_TermDescriptor_TermDescriptorId] FOREIGN KEY ([TermDescriptorId]) REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
ALTER TABLE [edfi].[ResponsibilityDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ResponsibilityDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ResponsibilityDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ResponsibilityDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ResponsibilityDescriptor_ResponsibilityType_ResponsibilityTypeId] FOREIGN KEY ([ResponsibilityTypeId]) REFERENCES [edfi].[ResponsibilityType] ([ResponsibilityTypeId])
ALTER TABLE [edfi].[StudentSectionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSectionAssociation_RepeatIdentifierType_RepeatIdentifierTypeId] FOREIGN KEY ([RepeatIdentifierTypeId]) REFERENCES [edfi].[RepeatIdentifierType] ([RepeatIdentifierTypeId])
ALTER TABLE [edfi].[StudentSectionAssociation]
    ADD CONSTRAINT [FK_StudentSectionAssociation_Section_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse]) ON UPDATE CASCADE
ALTER TABLE [edfi].[StudentSectionAssociation]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentSectionAssociation_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
ALTER TABLE [edfi].[Section]
    WITH NOCHECK ADD CONSTRAINT [FK_Section_PopulationServedType_PopulationServedTypeId] FOREIGN KEY ([PopulationServedTypeId]) REFERENCES [edfi].[PopulationServedType] ([PopulationServedTypeId])
ALTER TABLE [edfi].[Section]
    WITH NOCHECK ADD CONSTRAINT [FK_Section_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[Section]
    WITH NOCHECK ADD CONSTRAINT [FK_Section_ClassPeriod_SchoolId] FOREIGN KEY ([SchoolId], [ClassPeriodName]) REFERENCES [edfi].[ClassPeriod] ([SchoolId], [ClassPeriodName]) ON UPDATE CASCADE
ALTER TABLE [edfi].[Section]
    WITH NOCHECK ADD CONSTRAINT [FK_Section_CourseOffering_SchoolId] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [TermDescriptorId])
ALTER TABLE [edfi].[Section]
    WITH NOCHECK ADD CONSTRAINT [FK_Section_CreditType_AvailableCreditTypeId] FOREIGN KEY ([AvailableCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
ALTER TABLE [edfi].[Section]
    WITH NOCHECK ADD CONSTRAINT [FK_Section_EducationalEnvironmentType_EducationalEnvironmentTypeId] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId])
ALTER TABLE [edfi].[Section]
    WITH NOCHECK ADD CONSTRAINT [FK_Section_LanguageDescriptor_InstructionLanguageDescriptorId] FOREIGN KEY ([InstructionLanguageDescriptorId]) REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
ALTER TABLE [edfi].[Section]
    WITH NOCHECK ADD CONSTRAINT [FK_Section_Location_SchoolId] FOREIGN KEY ([SchoolId], [ClassroomIdentificationCode]) REFERENCES [edfi].[Location] ([SchoolId], [ClassroomIdentificationCode]) ON UPDATE CASCADE
ALTER TABLE [edfi].[Section]
    WITH NOCHECK ADD CONSTRAINT [FK_Section_MediumOfInstructionType_MediumOfInstructionTypeId] FOREIGN KEY ([MediumOfInstructionTypeId]) REFERENCES [edfi].[MediumOfInstructionType] ([MediumOfInstructionTypeId])
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_AdministrativeFundingControlDescriptor_AdministrativeFundingControlDescriptorId] FOREIGN KEY ([AdministrativeFundingControlDescriptorId]) REFERENCES [edfi].[AdministrativeFundingControlDescriptor] ([AdministrativeFundingControlDescriptorId])
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_CharterApprovalAgencyType_CharterApprovalAgencyTypeId] FOREIGN KEY ([CharterApprovalAgencyTypeId]) REFERENCES [edfi].[CharterApprovalAgencyType] ([CharterApprovalAgencyTypeId])
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_CharterStatusType_CharterStatusTypeId] FOREIGN KEY ([CharterStatusTypeId]) REFERENCES [edfi].[CharterStatusType] ([CharterStatusTypeId])
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_EducationOrganization_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_InternetAccessType_InternetAccessTypeId] FOREIGN KEY ([InternetAccessTypeId]) REFERENCES [edfi].[InternetAccessType] ([InternetAccessTypeId])
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_LocalEducationAgency_LocalEducationAgencyId] FOREIGN KEY ([LocalEducationAgencyId]) REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_MagnetSpecialProgramEmphasisSchoolType_MagnetSpecialProgramEmphasisSchoolTypeId] FOREIGN KEY ([MagnetSpecialProgramEmphasisSchoolTypeId]) REFERENCES [edfi].[MagnetSpecialProgramEmphasisSchoolType] ([MagnetSpecialProgramEmphasisSchoolTypeId])
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_SchoolType_SchoolTypeId] FOREIGN KEY ([SchoolTypeId]) REFERENCES [edfi].[SchoolType] ([SchoolTypeId])
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_SchoolYearType_SchoolYear] FOREIGN KEY ([CharterApprovalSchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
ALTER TABLE [edfi].[School]
    WITH NOCHECK ADD CONSTRAINT [FK_School_TitleIPartASchoolDesignationType_TitleIPartASchoolDesignationTypeId] FOREIGN KEY ([TitleIPartASchoolDesignationTypeId]) REFERENCES [edfi].[TitleIPartASchoolDesignationType] ([TitleIPartASchoolDesignationTypeId])
ALTER TABLE [edfi].[EducationOrganizationAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationAddress_AddressType_AddressTypeId] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId])
ALTER TABLE [edfi].[EducationOrganizationAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationAddress_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]) ON DELETE CASCADE
ALTER TABLE [edfi].[EducationOrganizationAddress]
    WITH NOCHECK ADD CONSTRAINT [FK_EducationOrganizationAddress_StateAbbreviationType_StateAbbreviationTypeId] FOREIGN KEY ([StateAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
ALTER TABLE [edfi].[ContinuationOfServicesReasonDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ContinuationOfServicesReasonDescriptor_ContinuationOfServicesReasonType_ContinuationOfServicesReasonTypeId] FOREIGN KEY ([ContinuationOfServicesReasonTypeId]) REFERENCES [edfi].[ContinuationOfServicesReasonType] ([ContinuationOfServicesReasonTypeId])
ALTER TABLE [edfi].[ContinuationOfServicesReasonDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ContinuationOfServicesReasonDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ContinuationOfServicesReasonDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentContentStandardAuthor]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentContentStandardAuthor_AssessmentContentStandard_AssessmentTitle] FOREIGN KEY ([AssessmentVersion], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId]) REFERENCES [edfi].[AssessmentContentStandard] ([AssessmentVersion], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentContentStandard_Assessment_AssessmentTitle] FOREIGN KEY ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [AssessmentVersion]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentContentStandard_EducationOrganization_MandatingEducationOrganizationId] FOREIGN KEY ([MandatingEducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ALTER TABLE [edfi].[AssessmentContentStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentContentStandard_PublicationStatusType_PublicationStatusTypeId] FOREIGN KEY ([PublicationStatusTypeId]) REFERENCES [edfi].[PublicationStatusType] ([PublicationStatusTypeId])
ALTER TABLE [edfi].[AssessmentCategoryDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentCategoryDescriptor_AssessmentCategoryType_AssessmentCategoryTypeId] FOREIGN KEY ([AssessmentCategoryTypeId]) REFERENCES [edfi].[AssessmentCategoryType] ([AssessmentCategoryTypeId])
ALTER TABLE [edfi].[AssessmentCategoryDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentCategoryDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AssessmentCategoryDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId])
ALTER TABLE [edfi].[DisciplineDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([DisciplineDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[DisciplineDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_DisciplineDescriptor_DisciplineType_DisciplineTypeId] FOREIGN KEY ([DisciplineTypeId]) REFERENCES [edfi].[DisciplineType] ([DisciplineTypeId])
ALTER TABLE [edfi].[AssessmentFamilyIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamilyIdentificationCode_AssessmentFamily_AssessmentFamilyTitle] FOREIGN KEY ([AssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamily] ([AssessmentFamilyTitle]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentFamilyIdentificationCode]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamilyIdentificationCode_AssessmentIdentificationSystemDescriptor_AssessmentIdentificationSystemDescriptorId] FOREIGN KEY ([AssessmentIdentificationSystemDescriptorId]) REFERENCES [edfi].[AssessmentIdentificationSystemDescriptor] ([AssessmentIdentificationSystemDescriptorId])
ALTER TABLE [edfi].[AssessmentFamily]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamily_AcademicSubjectDescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
ALTER TABLE [edfi].[AssessmentFamily]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamily_AssessedGradeLevelDescriptorId] FOREIGN KEY ([AssessedGradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[AssessmentFamily]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamily_AssessmentCategoryDescriptor_AssessmentCategoryDescriptorId] FOREIGN KEY ([AssessmentCategoryDescriptorId]) REFERENCES [edfi].[AssessmentCategoryDescriptor] ([AssessmentCategoryDescriptorId])
ALTER TABLE [edfi].[AssessmentFamily]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamily_AssessmentFamily_ParentAssessmentFamilyTitle] FOREIGN KEY ([ParentAssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamily] ([AssessmentFamilyTitle])
ALTER TABLE [edfi].[AssessmentFamily]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentFamily_LowestAssessedGradeLevelDescriptorId] FOREIGN KEY ([LowestAssessedGradeLevelDescriptorId]) REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
ALTER TABLE [edfi].[ParentOtherName]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentOtherName_OtherNameType_OtherNameTypeId] FOREIGN KEY ([OtherNameTypeId]) REFERENCES [edfi].[OtherNameType] ([OtherNameTypeId])
ALTER TABLE [edfi].[ParentOtherName]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentOtherName_Parent_ParentUSI] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentPeriodDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_AssessmentPeriodDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AssessmentPeriodDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ParentIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentIdentificationDocument_IdentificationDocumentUseType_IdentificationDocumentUseTypeId] FOREIGN KEY ([IdentificationDocumentUseTypeId]) REFERENCES [edfi].[IdentificationDocumentUseType] ([IdentificationDocumentUseTypeId])
ALTER TABLE [edfi].[ParentIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentIdentificationDocument_IssuerCountryDescriptorId_CountryDescriptor_CountryDescriptorId] FOREIGN KEY ([IssuerCountryDescriptorId]) REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
ALTER TABLE [edfi].[ParentIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentIdentificationDocument_Parent_ParentUSI] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[ParentIdentificationDocument]
    WITH NOCHECK ADD CONSTRAINT [FK_ParentIdentificationDocument_PersonalInformationVerificationType_PersonalInformationVerificationTypeId] FOREIGN KEY ([PersonalInformationVerificationTypeId]) REFERENCES [edfi].[PersonalInformationVerificationType] ([PersonalInformationVerificationTypeId])
ALTER TABLE [edfi].[Parent]
    WITH NOCHECK ADD CONSTRAINT [FK_Parent_SexType_SexTypeId] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId])
ALTER TABLE [edfi].[ProgramAssignmentDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramAssignmentDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([ProgramAssignmentDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
ALTER TABLE [edfi].[ProgramAssignmentDescriptor]
    WITH NOCHECK ADD CONSTRAINT [FK_ProgramAssignmentDescriptor_ProgramAssignmentType_ProgramAssignmentTypeId] FOREIGN KEY ([ProgramAssignmentTypeId]) REFERENCES [edfi].[ProgramAssignmentType] ([ProgramAssignmentTypeId])
ALTER TABLE [edfi].[LearningStandardPrerequisiteLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandardPrerequisiteLearningStandard_LearningStandard] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId]) ON DELETE CASCADE
ALTER TABLE [edfi].[LearningStandardPrerequisiteLearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandardPrerequisiteLearningStandard_LearningStandard_Prerequisite] FOREIGN KEY ([PrerequisiteLearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[LearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandard_AcademicSubjectDescriptorId] FOREIGN KEY ([AcademicSubjectDescriptorId]) REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
ALTER TABLE [edfi].[LearningStandard]
    WITH NOCHECK ADD CONSTRAINT [FK_LearningStandard_LearningStandard_ParentLearningStandardId] FOREIGN KEY ([ParentLearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
ALTER TABLE [edfi].[StudentVisa]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentVisa_Student_StudentUSI] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]) ON DELETE CASCADE
ALTER TABLE [edfi].[StudentVisa]
    WITH NOCHECK ADD CONSTRAINT [FK_StudentVisa_VisaType_VisaTypeId] FOREIGN KEY ([VisaTypeId]) REFERENCES [edfi].[VisaType] ([VisaTypeId])
ALTER TABLE [edfi].[SessionAcademicWeek]
    WITH NOCHECK ADD CONSTRAINT [FK_AcademicWeek_Session_SchoolId] FOREIGN KEY ([WeekIdentifier], [SchoolId]) REFERENCES [edfi].[AcademicWeek] ([WeekIdentifier], [SchoolId])
ALTER TABLE [edfi].[SessionAcademicWeek]
    WITH NOCHECK ADD CONSTRAINT [FK_SessionAcademicWeek_Session_SchoolId] FOREIGN KEY ([SchoolId], [SchoolYear], [TermDescriptorId]) REFERENCES [edfi].[Session] ([SchoolId], [SchoolYear], [TermDescriptorId]) ON UPDATE CASCADE
ALTER TABLE [edfi].[AcademicWeek]
    WITH NOCHECK ADD CONSTRAINT [FK_AcademicWeek_CalendarDate_BeginDate] FOREIGN KEY ([SchoolId], [BeginDate]) REFERENCES [edfi].[CalendarDate] ([SchoolId], [Date])
ALTER TABLE [edfi].[AcademicWeek]
    WITH NOCHECK ADD CONSTRAINT [FK_AcademicWeek_CalendarDate_EndDate] FOREIGN KEY ([SchoolId], [EndDate]) REFERENCES [edfi].[CalendarDate] ([SchoolId], [Date])
ALTER TABLE [edfi].[AcademicWeek]
    WITH NOCHECK ADD CONSTRAINT [FK_AcademicWeek_School_SchoolId] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
ALTER TABLE [edfi].[PostSecondaryEventPostSecondaryInstitution]
    WITH NOCHECK ADD CONSTRAINT [FK_PostSecondaryEventPostSecondaryInstitution_AdministrativeFundingControlDescriptorId] FOREIGN KEY ([AdministrativeFundingControlDescriptorId]) REFERENCES [edfi].[AdministrativeFundingControlDescriptor] ([AdministrativeFundingControlDescriptorId])
ALTER TABLE [edfi].[PostSecondaryEventPostSecondaryInstitution]
    WITH NOCHECK ADD CONSTRAINT [FK_PostSecondaryEventPostSecondaryInstitution_PostSecondaryEvent] FOREIGN KEY ([StudentUSI], [PostSecondaryEventCategoryTypeId], [EventDate]) REFERENCES [edfi].[PostSecondaryEvent] ([StudentUSI], [PostSecondaryEventCategoryTypeId], [EventDate]) ON DELETE CASCADE
ALTER TABLE [edfi].[PostSecondaryEventPostSecondaryInstitution]
    WITH NOCHECK ADD CONSTRAINT [FK_PostSecondaryEventPostSecondaryInstitution_PostSecondaryInstitutionLevelType_PostSecondaryInstitutionLevelTypeId] FOREIGN KEY ([PostSecondaryInstitutionLevelTypeId]) REFERENCES [edfi].[PostSecondaryInstitutionLevelType] ([PostSecondaryInstitutionLevelTypeId])
