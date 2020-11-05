-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE generate
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA ='ODS' AND TABLE_NAME='ProgramParticipationNeglectedProgressLevel') 
BEGIN
	CREATE TABLE [ODS].ProgramParticipationNeglectedProgressLevel
	(
		ProgramParticipationNeglectedProgressLevelId INT PRIMARY KEY IDENTITY NOT NULL,
		PersonProgramParticipationId INT NULL,
		RefAcademicSubjectId INT NULL,
		RefProgressLevelId INT NULL
	)

	ALTER TABLE [ODS].[ProgramParticipationNeglectedProgressLevel]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationNeglectedProgressLevel_PersonProgramParticipation] FOREIGN KEY([PersonProgramParticipationId])
	REFERENCES [ODS].[PersonProgramParticipation] ([PersonProgramParticipationId])


	ALTER TABLE [ODS].[ProgramParticipationNeglectedProgressLevel]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationNeglectedProgressLevel_RefAcademicSubject] FOREIGN KEY([RefAcademicSubjectId])
	REFERENCES [ODS].[RefAcademicSubject] ([RefAcademicSubjectId])


	ALTER TABLE [ODS].[ProgramParticipationNeglectedProgressLevel]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationNeglectedProgressLevel_RefProgressLevel] FOREIGN KEY
	([RefProgressLevelId])
	REFERENCES [ODS].[RefProgressLevel] ([RefProgressLevelId])

END

GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA ='ODS' AND TABLE_NAME='K12StudentAcademicRecord' AND COLUMN_NAME = 'RefProgressLevelId') 
BEGIN
	ALTER TABLE ODS.K12StudentAcademicRecord
	DROP CONSTRAINT FK_K12StudentAcademicRecord_RefProgressLevel

	ALTER TABLE ODS.K12StudentAcademicRecord DROP COLUMN RefProgressLevelId
END