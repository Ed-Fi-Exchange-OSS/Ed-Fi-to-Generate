-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO
DECLARE @BeginDate date
DECLARE @EducationOrganizationId int
DECLARE @ProgramName varchar(100)
DECLARE @ProgramTypeDescriptorId int
DECLARE @EnglishLearnerParticipation bit
DECLARE @CreateDate date

SET @CreateDate = GETDATE()
SET @EducationOrganizationId = 255901
SET @BeginDate = '2017-08-30'
SET @ProgramName = 'English as a Second Language (ESL)'
SET @EnglishLearnerParticipation = 1

SELECT @ProgramTypeDescriptorId = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
WHERE Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue = 'English as a Second Language (ESL)'

DECLARE @EdfiStudent TABLE
(
	StudentUSI int
)

INSERT INTO @EdfiStudent VALUES(20002)

BEGIN TRY

BEGIN TRANSACTION

INSERT INTO [edfi].[GeneralStudentProgramAssociation]
    (
	[BeginDate]
    ,[EducationOrganizationId]
    ,[ProgramEducationOrganizationId]
    ,[ProgramName]
    ,[ProgramTypeDescriptorId]
    ,[StudentUSI]
    ,[EndDate]
    ,[ReasonExitedDescriptorId]
    ,[CreateDate]
    ,[LastModifiedDate]
    )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, NULL [EndDate]
	, NULL [ReasonExitedDescriptorId]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [edfi].[GeneralStudentProgramAssociation] ga
	ON ga.StudentUSI = s.StudentUSI AND ga.BeginDate = @BeginDate AND ga.EducationOrganizationId = @EducationOrganizationId
	AND ga.ProgramEducationOrganizationId = @EducationOrganizationId AND ga.ProgramName = @ProgramName
	AND ga.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ga.StudentUSI IS NULL

INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[EnglishLearnerParticipation])
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @EnglishLearnerParticipation

FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentLanguageInstructionProgramAssociation] lg
	ON lg.StudentUSI = s.StudentUSI
WHERE lg.StudentUSI IS NULL

  DECLARE @SchoolYear int
  DECLARE @ParticipationDescriptorId  int
  DECLARE @ProficiencyDescriptorId  int
  DECLARE @ProgressDescriptorId  int

  SELECT @ParticipationDescriptorId = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
	WHERE Namespace = 'uri://ed-fi.org/ParticipationDescriptor' AND CodeValue = 'Completed'
--	select @ParticipationDescriptorId

  SELECT @ProficiencyDescriptorId = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
	WHERE Namespace = 'uri://ed-fi.org/ProficiencyDescriptor' AND CodeValue = 'Proficient'
--	select @ProficiencyDescriptorId

  SELECT @ProgressDescriptorId = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
	WHERE Namespace = 'uri://ed-fi.org/ProgressDescriptor' AND CodeValue = 'Proficient'
--	select @ProgressDescriptorId

  SET @SchoolYear = 2018
INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[SchoolYear]
           ,[StudentUSI]
           ,[ParticipationDescriptorId]
           ,[ProficiencyDescriptorId]
           ,[ProgressDescriptorId]
           ,[CreateDate])
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, @SchoolYear
	, s.StudentUSI
	, @ParticipationDescriptorId
	, @ProficiencyDescriptorId
	, @ProgressDescriptorId 
	, GETDATE()
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment] sa
	ON sa.StudentUSI = s.StudentUSI
WHERE sa.StudentUSI IS NULL

DECLARE @LanguageInstructionProgramServiceDescriptorId  int
SELECT @LanguageInstructionProgramServiceDescriptorId = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
WHERE Namespace = 'uri://ed-fi.org/LanguageInstructionProgramServiceDescriptor' AND CodeValue = 'Content-Based ESL'

DECLARE  @ServiceStartDate date
SET @ServiceStartDate = '09/01/2017' 
INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[LanguageInstructionProgramServiceDescriptorId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[ServiceBeginDate]
           ,[ServiceEndDate]
           ,[CreateDate])
SELECT @BeginDate
	, @EducationOrganizationId
	, @LanguageInstructionProgramServiceDescriptorId
	, @EducationOrganizationId
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @ServiceStartDate 
	, NULL [ServiceEndDate]
	, GETDATE()
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService] svr
ON svr.StudentUSI = s.StudentUSI
WHERE svr.StudentUSI IS NULL

	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
END CATCH