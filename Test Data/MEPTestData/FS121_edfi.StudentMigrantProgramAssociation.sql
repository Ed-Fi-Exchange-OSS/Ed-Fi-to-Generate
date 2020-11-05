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
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)

  DECLARE @BeginDate Date 
  DECLARE @EducationOrganizationId int
  DECLARE @ProgramName varchar(128)
  DECLARE @ProgramTypeDescriptorId int
  DECLARE @CreateDate date

  SET @BeginDate = '2010-08-30'
  SET @EducationOrganizationId = 255901
  SET @ProgramName = 'Migrant Education'
  SET @CreateDate = GetDate()

  select * from edfi.Descriptor where DescriptorId = 1645
  SELECT * FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' 

  SELECT @ProgramTypeDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue = @ProgramName
  select @ProgramTypeDescriptorId
  BEGIN TRY

	BEGIN TRANSACTION


	IF NOT EXISTS (select 1 from edfi.ProgramTypeDescriptor where ProgramTypeDescriptorId = @ProgramTypeDescriptorId)
		INSERT INTO edfi.ProgramTypeDescriptor
		VALUES (@ProgramTypeDescriptorId)

	IF NOT EXISTS (select 1 from edfi.Program where [ProgramName] = @ProgramName AND  ProgramTypeDescriptorId = @ProgramTypeDescriptorId)
	INSERT INTO [edfi].[Program]
           ([EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramId]
           ,[ProgramTypeDescriptorId]
	)
	SELECT @EducationOrganizationId
			,@ProgramName
			, '255901_02'
			, @ProgramTypeDescriptorId

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

DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)

  
  declare @QualifyingArrivalDate date 
  set @QualifyingArrivalDate = '2017-09-01'

  declare @LastQualifyingMove date 
  set @LastQualifyingMove = '2017-09-15'

  declare @PriorityForServices bit
  Set @PriorityForServices = 1

declare @ContinuationOfServicesReasonDescriptorId int
SELECT @ContinuationOfServicesReasonDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/ContinuationOfServicesReasonDescriptor' AND CodeValue = 'Ceased to be migratory during prev term and no com'

INSERT INTO [edfi].[StudentMigrantEducationProgramAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]

           ,[ProgramName]
           ,[ProgramEducationOrganizationId]

           ,[BeginDate]
           ,[PriorityForServices]

           ,[LastQualifyingMove]
           ,[ContinuationOfServicesReasonDescriptorId]

           ,[QualifyingArrivalDate]
           ,[ProgramTypeDescriptorId])
SELECT s.StudentUSI
	, @EducationOrganizationId

	, @ProgramName
	, @EducationOrganizationId [ProgramEducationOrganizationId]

	, @BeginDate
	, @PriorityForServices

	, @LastQualifyingMove
	, @ContinuationOfServicesReasonDescriptorId

	, @QualifyingArrivalDate
	, @ProgramTypeDescriptorId
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentMigrantEducationProgramAssociation] fa
	ON fa.StudentUSI = s.StudentUSI AND fa.BeginDate = @BeginDate AND fa.EducationOrganizationId = @EducationOrganizationId
	AND fa.ProgramEducationOrganizationId = @EducationOrganizationId AND fa.ProgramName = @ProgramName
	AND fa.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE fa.StudentUSI IS NULL	

DECLARE @MigrantEducationProgramServiceDescriptorId INT
SELECT @MigrantEducationProgramServiceDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/MigrantEducationProgramServiceDescriptor' AND CodeValue = 'High School Accrual'

DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)

INSERT INTO [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService]
           (
		   [BeginDate]
           ,[EducationOrganizationId]
           ,[MigrantEducationProgramServiceDescriptorId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[PrimaryIndicator]
           ,[ServiceBeginDate]
           ,[ServiceEndDate]
           ,[CreateDate])

SELECT @BeginDate
	, @EducationOrganizationId
	, @MigrantEducationProgramServiceDescriptorId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, 1 [PrimaryIndicator]
	, '2017-10-01'
	, NULL [ServiceEndDate]
	, GETDATE() [CreateDate]
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService] fs
	ON fs.StudentUSI = s.StudentUSI AND fs.BeginDate = @BeginDate AND fs.EducationOrganizationId = @EducationOrganizationId
	AND fs.ProgramEducationOrganizationId = @EducationOrganizationId AND fs.ProgramName = @ProgramName
	AND fs.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE fs.StudentUSI IS NULL


DECLARE @MigrantEducationProgramEnrollmentTypeDescriptorIdId INT
SELECT @MigrantEducationProgramEnrollmentTypeDescriptorIdId = DescriptorId FROM edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000437' AND CodeValue = '01'

INSERT INTO [extension].[CedsStudentMigrantEducationProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeId]
           ,[StudentUSI]
           ,[MigrantEducationProgramEnrollmentTypeDescriptorId]
           ,[MigrantEducationProgramServicesTypeDescriptorId]
           ,[MigrantStudentQualifyingArrivalDate])
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @MigrantEducationProgramEnrollmentTypeDescriptorIdId
	, NULL [MigrantEducationProgramEnrollmentTypeDescriptorId]
	, NULL [MigrantStudentQualifyingArrivalDate]
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentMigrantEducationProgramAssociation] ceds
	ON ceds.StudentUSI = s.StudentUSI AND ceds.BeginDate = @BeginDate AND ceds.EducationOrganizationId = @EducationOrganizationId
	AND ceds.ProgramEducationOrganizationId = @EducationOrganizationId AND ceds.ProgramName = @ProgramName
	AND ceds.ProgramTypeId = @ProgramTypeDescriptorId
WHERE ceds.StudentUSI IS NULL


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