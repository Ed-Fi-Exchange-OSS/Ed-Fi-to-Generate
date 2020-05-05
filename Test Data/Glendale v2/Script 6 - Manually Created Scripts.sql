
-- Manual updates to prevent a 6 GB file (yeah, 6 GB)

ALTER TABLE EdFi.StudentAssessmentStudentObjectiveAssessment DROP CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessment_StudentAssessment_StudentUSI
ALTER TABLE EdFi.StudentAssessmentStudentObjectiveAssessmentScoreResult DROP CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessmentScoreResult_StudentObjectiveAssessment
ALTER TABLE EdFi.StudentAssessmentStudentObjectiveAssessment DROP CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessment_ObjectiveAssessment
ALTER TABLE EdFi.ObjectiveAssessmentLearningObjective DROP CONSTRAINT FK_ObjectiveAssessmentLearningObjective_ObjectiveAssessment
ALTER TABLE EdFi.ObjectiveAssessment DROP CONSTRAINT FK_ObjectiveAssessment_Assessment_AssessmentTitle
ALTER TABLE EdFi.AssessmentIdentificationCode DROP CONSTRAINT FK_AssessmentIdentificationCode_Assessment_AssessmentTitle
ALTER TABLE EdFi.AssessmentPerformanceLevel DROP CONSTRAINT FK_AssessmentPerformanceLevel_Assessment_AssessmentTitle
ALTER TABLE EdFi.ObjectiveAssessmentLearningObjective DROP CONSTRAINT FK_ObjectiveAssessmentLearningObjective_LearningObjective_Objective
ALTER TABLE EdFi.DisciplineActionDiscipline DROP CONSTRAINT FK_DisciplineActionDiscipline_DisciplineAction_StudentUSI
ALTER TABLE EdFi.DisciplineActionDisciplineIncident DROP CONSTRAINT FK_DisciplineActionDisciplineIncident_DisciplineAction_StudentUSI
--ALTER TABLE EdFi.StudentAssessment DROP CONSTRAINT FK_StudentAssessment_Assessment_AssessmentTitle
ALTER TABLE EdFi.StudentAssessmentScoreResult DROP CONSTRAINT FK_StudentAssessmentScoreResult_StudentAssessment_StudentUSI
ALTER TABLE EdFi.StudentAssessmentItem DROP CONSTRAINT FK_StudentAssessmentItem_StudentAssessment_StudentUSI
ALTER TABLE EdFi.StudentAssessmentPerformanceLevel DROP CONSTRAINT FK_StudentAssessmentPerformanceLevel_StudentAssessment_StudentUSI

UPDATE EdFi.StudentAssessmentStudentObjectiveAssessment
SET AdministrationDate = DATEADD(YY, 6, AdministrationDate),
	AcademicSubjectDescriptorId = 8

UPDATE EdFi.StudentAssessmentStudentObjectiveAssessmentScoreResult
SET AdministrationDate = DATEADD(YY, 6, AdministrationDate),
	AcademicSubjectDescriptorId = 8

UPDATE EdFi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel
SET AdministrationDate = DATEADD(YY, 6, AdministrationDate),
	AcademicSubjectDescriptorId = 8

UPDATE EdFi.ObjectiveAssessment 
SET AcademicSubjectDescriptorId = 8
WHERE (AssessmentTitle LIKE 'STAAR%' OR AssessmentTitle LIKE 'TAKS%') and AcademicSubjectDescriptorId = 1

--UPDATE EdFi.Assessment 
--SET AcademicSubjectDescriptorId = 8
--WHERE (AssessmentTitle LIKE 'STAAR%' OR AssessmentTitle LIKE 'TAKS%') and AcademicSubjectDescriptorId = 1

UPDATE EdFi.AssessmentIdentificationCode 
SET AcademicSubjectDescriptorId = 8
WHERE (AssessmentTitle LIKE 'STAAR%' OR AssessmentTitle LIKE 'TAKS%') and AcademicSubjectDescriptorId = 1

UPDATE EdFi.AssessmentPerformanceLevel 
SET AcademicSubjectDescriptorId = 8
WHERE (AssessmentTitle LIKE 'STAAR%' OR AssessmentTitle LIKE 'TAKS%') and AcademicSubjectDescriptorId = 1

UPDATE EdFi.ObjectiveAssessmentLearningObjective 
SET AcademicSubjectDescriptorId = 8
WHERE (AssessmentTitle LIKE 'STAAR%' OR AssessmentTitle LIKE 'TAKS%') and AcademicSubjectDescriptorId = 1

UPDATE EdFi.LearningObjective 
SET AcademicSubjectDescriptorId = 8
WHERE AcademicSubjectDescriptorId = 1 AND Description IS NOT NULL

UPDATE EdFi.DisciplineAction
SET DisciplineDate = DATEADD(YY, 6, DisciplineDate)

UPDATE EdFi.DisciplineActionDiscipline
SET DisciplineDate = DATEADD(YY, 6, DisciplineDate)

UPDATE EdFi.DisciplineActionDisciplineIncident
SET DisciplineDate = DATEADD(YY, 6, DisciplineDate)

--UPDATE select * from EdFi.StaffEducationOrganizationAssignmentAssociation where staffusi = 4828
--SET BeginDate = '07/01/2017'

UPDATE EdFi.StudentAssessment
SET AdministrationDate = DATEADD(YY, 6, AdministrationDate)

UPDATE EdFi.StudentAssessmentItem
SET AdministrationDate = DATEADD(YY, 6, AdministrationDate)

UPDATE EdFi.StudentAssessmentPerformanceLevel
SET AcademicSubjectDescriptorId = 8

UPDATE EdFi.StudentAssessmentScoreResult
SET AdministrationDate = DATEADD(YY, 6, AdministrationDate)

UPDATE EdFi.StudentSchoolAssociation
SET EntryDate = DATEADD(YY, 6, EntryDate)


ALTER TABLE [edfi].[StudentAssessmentStudentObjectiveAssessment]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessment_StudentAssessment_StudentUSI] FOREIGN KEY([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate])
REFERENCES [edfi].[StudentAssessment] ([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate])
ON DELETE CASCADE
ALTER TABLE [edfi].[StudentAssessmentStudentObjectiveAssessment] CHECK CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessment_StudentAssessment_StudentUSI]

ALTER TABLE [edfi].[StudentAssessmentStudentObjectiveAssessmentScoreResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessmentScoreResult_StudentObjectiveAssessment] FOREIGN KEY([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode], [AdministrationDate])
REFERENCES [edfi].[StudentAssessmentStudentObjectiveAssessment] ([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode], [AdministrationDate])
ON DELETE CASCADE
ALTER TABLE [edfi].[StudentAssessmentStudentObjectiveAssessmentScoreResult] CHECK CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessmentScoreResult_StudentObjectiveAssessment]

ALTER TABLE [edfi].[StudentAssessmentStudentObjectiveAssessment]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessment_ObjectiveAssessment] FOREIGN KEY([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode])
REFERENCES [edfi].[ObjectiveAssessment] ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode])
ALTER TABLE [edfi].[StudentAssessmentStudentObjectiveAssessment] CHECK CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessment_ObjectiveAssessment]

ALTER TABLE [edfi].[ObjectiveAssessmentLearningObjective]  WITH CHECK ADD  CONSTRAINT [FK_ObjectiveAssessmentLearningObjective_ObjectiveAssessment] FOREIGN KEY([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode])
REFERENCES [edfi].[ObjectiveAssessment] ([AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [IdentificationCode])
ON DELETE CASCADE
ALTER TABLE [edfi].[ObjectiveAssessmentLearningObjective] CHECK CONSTRAINT [FK_ObjectiveAssessmentLearningObjective_ObjectiveAssessment]

ALTER TABLE [edfi].[ObjectiveAssessment]  WITH NOCHECK ADD  CONSTRAINT [FK_ObjectiveAssessment_Assessment_AssessmentTitle] FOREIGN KEY([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
ALTER TABLE [edfi].[ObjectiveAssessment] CHECK CONSTRAINT [FK_ObjectiveAssessment_Assessment_AssessmentTitle]

ALTER TABLE [edfi].[AssessmentIdentificationCode]  WITH NOCHECK ADD  CONSTRAINT [FK_AssessmentIdentificationCode_Assessment_AssessmentTitle] FOREIGN KEY([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentIdentificationCode] CHECK CONSTRAINT [FK_AssessmentIdentificationCode_Assessment_AssessmentTitle]

ALTER TABLE [edfi].[AssessmentPerformanceLevel]  WITH NOCHECK ADD  CONSTRAINT [FK_AssessmentPerformanceLevel_Assessment_AssessmentTitle] FOREIGN KEY([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
ON DELETE CASCADE
ALTER TABLE [edfi].[AssessmentPerformanceLevel] CHECK CONSTRAINT [FK_AssessmentPerformanceLevel_Assessment_AssessmentTitle]

ALTER TABLE [edfi].[ObjectiveAssessmentLearningObjective]  WITH NOCHECK ADD  CONSTRAINT [FK_ObjectiveAssessmentLearningObjective_LearningObjective_Objective] FOREIGN KEY([Objective], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId])
REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectDescriptorId], [ObjectiveGradeLevelDescriptorId])
ALTER TABLE [edfi].[ObjectiveAssessmentLearningObjective] CHECK CONSTRAINT [FK_ObjectiveAssessmentLearningObjective_LearningObjective_Objective]

ALTER TABLE [edfi].[DisciplineActionDiscipline]  WITH NOCHECK ADD  CONSTRAINT [FK_DisciplineActionDiscipline_DisciplineAction_StudentUSI] FOREIGN KEY([DisciplineActionIdentifier], [StudentUSI], [DisciplineDate])
REFERENCES [edfi].[DisciplineAction] ([DisciplineActionIdentifier], [StudentUSI], [DisciplineDate])
ON DELETE CASCADE
ALTER TABLE [edfi].[DisciplineActionDiscipline] CHECK CONSTRAINT [FK_DisciplineActionDiscipline_DisciplineAction_StudentUSI]

ALTER TABLE [edfi].[DisciplineActionDisciplineIncident]  WITH NOCHECK ADD  CONSTRAINT [FK_DisciplineActionDisciplineIncident_DisciplineAction_StudentUSI] FOREIGN KEY([DisciplineActionIdentifier], [StudentUSI], [DisciplineDate])
REFERENCES [edfi].[DisciplineAction] ([DisciplineActionIdentifier], [StudentUSI], [DisciplineDate])
ON DELETE CASCADE
ALTER TABLE [edfi].[DisciplineActionDisciplineIncident] CHECK CONSTRAINT [FK_DisciplineActionDisciplineIncident_DisciplineAction_StudentUSI]

ALTER TABLE [edfi].[StudentAssessmentScoreResult]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAssessmentScoreResult_StudentAssessment_StudentUSI] FOREIGN KEY([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate])
REFERENCES [edfi].[StudentAssessment] ([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate])
ON DELETE CASCADE
ALTER TABLE [edfi].[StudentAssessmentScoreResult] CHECK CONSTRAINT [FK_StudentAssessmentScoreResult_StudentAssessment_StudentUSI]

ALTER TABLE [edfi].[StudentAssessmentItem]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAssessmentItem_StudentAssessment_StudentUSI] FOREIGN KEY([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate])
REFERENCES [edfi].[StudentAssessment] ([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate])
ON DELETE CASCADE
ALTER TABLE [edfi].[StudentAssessmentItem] CHECK CONSTRAINT [FK_StudentAssessmentItem_StudentAssessment_StudentUSI]

ALTER TABLE [edfi].[StudentAssessmentPerformanceLevel]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAssessmentPerformanceLevel_StudentAssessment_StudentUSI] FOREIGN KEY([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate])
REFERENCES [edfi].[StudentAssessment] ([StudentUSI], [AssessmentTitle], [AcademicSubjectDescriptorId], [AssessedGradeLevelDescriptorId], [Version], [AdministrationDate])
ON DELETE CASCADE
ALTER TABLE [edfi].[StudentAssessmentPerformanceLevel] CHECK CONSTRAINT [FK_StudentAssessmentPerformanceLevel_StudentAssessment_StudentUSI]

--ALTER TABLE [edfi].[StudentAssessment]  WITH CHECK ADD  CONSTRAINT [FK_StudentAssessment_Assessment_AssessmentTitle] FOREIGN KEY([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
--REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AssessedGradeLevelDescriptorId], [AcademicSubjectDescriptorId], [Version])
--ALTER TABLE [edfi].[StudentAssessment] CHECK CONSTRAINT [FK_StudentAssessment_Assessment_AssessmentTitle]



-- End manual updates
