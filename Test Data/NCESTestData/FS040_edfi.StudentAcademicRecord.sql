-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use EdFi_Sample_ODS_Data_For_Generate

DECLARE @EdFiStudent TABLE
(
	StudentUSI int
)

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)

  DECLARE @BeginDate Date 
  DECLARE @EducationOrganizationId int
  DECLARE @ProgramName varchar(128)
  DECLARE @ProgramTypeDescriptorId int
  DECLARE @CreateDate date

  SET @BeginDate = '2010-08-30'
  SET @EducationOrganizationId = 255901
  SET @ProgramName = 'Career and Technical Education'
  SET @CreateDate = GetDate()

  DECLARE @SchoolYear int
  SET @SchoolYear = 2018

  DECLARE @TermDescriptorId int

  

BEGIN TRY

BEGIN TRANSACTION

SELECT @TermDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/TermDescriptor' AND CodeValue = 'Fall Semester'

INSERT INTO [edfi].[StudentAcademicRecord]
			([StudentUSI]
			,[EducationOrganizationId]
			,[SchoolYear]
			,[TermDescriptorId]
)
SELECT 
		s.StudentUSI
	, @EducationOrganizationId
	, @SchoolYear
	, @TermDescriptorId
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentAcademicRecord] sa
	ON sa.StudentUSI = s.StudentUSI AND sa.EducationOrganizationId = @EducationOrganizationId
	AND sa.[SchoolYear] = @SchoolYear AND sa.[TermDescriptorId] = @TermDescriptorId
WHERE sa.StudentUSI IS NULL

DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)

DECLARE @DiplomaAwardDate date
SET @DiplomaAwardDate = '2017-12-15'
DECLARE @CteCompleter bit
SET @CteCompleter = 1

DECLARE @DiplomaLevelDescriptorId INT
DECLARE @DiplomaTypeDescriptorId INT

SELECT @DiplomaLevelDescriptorId = DescriptorId  FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/DiplomaLevelDescriptor' AND CodeValue = 'Recommended'

SELECT @DiplomaTypeDescriptorId = DescriptorId  FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/DiplomaTypeDescriptor' AND CodeValue = 'Regular diploma'

INSERT INTO [edfi].[StudentAcademicRecordDiploma]
           ([StudentUSI]
           ,[SchoolYear]
           ,[TermDescriptorId]
           ,[EducationOrganizationId]
           ,[DiplomaAwardDate]
           ,[CTECompleter]
           ,[DiplomaLevelDescriptorId]
           ,[DiplomaTypeDescriptorId])
SELECT s.StudentUSI
	, @SchoolYear
	, @TermDescriptorId
	, @EducationOrganizationId 
	, @DiplomaAwardDate
	, @CteCompleter
	, @DiplomaLevelDescriptorId
	, @DiplomaTypeDescriptorId
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentAcademicRecordDiploma] sd
	ON sd.StudentUSI = s.StudentUSI AND sd.SchoolYear = @SchoolYear AND sd.EducationOrganizationId = @EducationOrganizationId
	AND sd.TermDescriptorId = @TermDescriptorId AND sd.DiplomaAwardDate = @DiplomaAwardDate
WHERE sd.StudentUSI IS NULL	


DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)

SELECT @DiplomaLevelDescriptorId = DescriptorId  FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/DiplomaLevelDescriptor' AND CodeValue = 'Distinguished'
SELECT @DiplomaTypeDescriptorId = DescriptorId  FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/DiplomaTypeDescriptor' AND CodeValue = 'General Educational Development (GED) credential'
SET @CteCompleter = 0

INSERT INTO [edfi].[StudentAcademicRecordDiploma]
           ([StudentUSI]
           ,[SchoolYear]
           ,[TermDescriptorId]
           ,[EducationOrganizationId]
           ,[DiplomaAwardDate]
           ,[CTECompleter]
           ,[DiplomaLevelDescriptorId]
           ,[DiplomaTypeDescriptorId])
SELECT s.StudentUSI
	, @SchoolYear
	, @TermDescriptorId
	, @EducationOrganizationId 
	, @DiplomaAwardDate
	, @CteCompleter
	, @DiplomaLevelDescriptorId
	, @DiplomaTypeDescriptorId
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentAcademicRecordDiploma] sd
	ON sd.StudentUSI = s.StudentUSI AND sd.SchoolYear = @SchoolYear AND sd.EducationOrganizationId = @EducationOrganizationId
	AND sd.TermDescriptorId = @TermDescriptorId AND sd.DiplomaAwardDate = @DiplomaAwardDate
WHERE sd.StudentUSI IS NULL	


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