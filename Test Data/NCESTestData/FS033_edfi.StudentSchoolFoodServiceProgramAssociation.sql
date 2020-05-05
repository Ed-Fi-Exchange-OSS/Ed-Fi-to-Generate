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
  SET @ProgramName = 'Food Service Program'
  SET @CreateDate = GetDate()

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
			, '255901_01'
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

INSERT INTO [edfi].[StudentSchoolFoodServiceProgramAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramEducationOrganizationId]
           ,[BeginDate]
           ,[ProgramTypeDescriptorId]
           ,[DirectCertification]
			)
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @ProgramName
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @BeginDate
	, @ProgramTypeDescriptorId
	, 1 [DirectCertification]
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentSchoolFoodServiceProgramAssociation] fa
	ON fa.StudentUSI = s.StudentUSI AND fa.BeginDate = @BeginDate AND fa.EducationOrganizationId = @EducationOrganizationId
	AND fa.ProgramEducationOrganizationId = @EducationOrganizationId AND fa.ProgramName = @ProgramName
	AND fa.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE fa.StudentUSI IS NULL	


DECLARE @SchoolFoodServiceProgramServiceDescriptorId INT
SELECT @SchoolFoodServiceProgramServiceDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/SchoolFoodServiceProgramServiceDescriptor' AND CodeValue = 'Free Lunch'

DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)

INSERT INTO [edfi].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService]
           (
		    [StudentUSI]
           ,[EducationOrganizationId]
		   ,[ProgramName]
           ,[ProgramEducationOrganizationId]
           ,[BeginDate]
           ,[ProgramTypeDescriptorId]
           ,[SchoolFoodServiceProgramServiceDescriptorId]
           ,[ServiceBeginDate]
           ,[ServiceEndDate]
           ,[CreateDate]
		   )
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @ProgramName
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @BeginDate
	, @ProgramTypeDescriptorId
	, @SchoolFoodServiceProgramServiceDescriptorId 
	, '2017-10-01'
	, NULL [ServiceEndDate]
	, GETDATE() [CreateDate]
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService] fs
	ON fs.StudentUSI = s.StudentUSI AND fs.BeginDate = @BeginDate AND fs.EducationOrganizationId = @EducationOrganizationId
	AND fs.ProgramEducationOrganizationId = @EducationOrganizationId AND fs.ProgramName = @ProgramName
	AND fs.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE fs.StudentUSI IS NULL

SELECT @SchoolFoodServiceProgramServiceDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/SchoolFoodServiceProgramServiceDescriptor' AND CodeValue = 'Full Price Lunch'

DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)

INSERT INTO [edfi].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService]
           (
		    [StudentUSI]
           ,[EducationOrganizationId]
		   ,[ProgramName]
           ,[ProgramEducationOrganizationId]
           ,[BeginDate]
           ,[ProgramTypeDescriptorId]
           ,[SchoolFoodServiceProgramServiceDescriptorId]
           ,[ServiceBeginDate]
           ,[ServiceEndDate]
           ,[CreateDate]
		   )
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @ProgramName
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @BeginDate
	, @ProgramTypeDescriptorId
	, @SchoolFoodServiceProgramServiceDescriptorId 
	, '2017-10-01'
	, NULL [ServiceEndDate]
	, GETDATE() [CreateDate]
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService] fs
	ON fs.StudentUSI = s.StudentUSI AND fs.BeginDate = @BeginDate AND fs.EducationOrganizationId = @EducationOrganizationId
	AND fs.ProgramEducationOrganizationId = @EducationOrganizationId AND fs.ProgramName = @ProgramName
	AND fs.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE fs.StudentUSI IS NULL

SELECT @SchoolFoodServiceProgramServiceDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/SchoolFoodServiceProgramServiceDescriptor' AND CodeValue = 'Reduced Price Lunch'
DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)

INSERT INTO [edfi].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService]
           (
		    [StudentUSI]
           ,[EducationOrganizationId]
		   ,[ProgramName]
           ,[ProgramEducationOrganizationId]
           ,[BeginDate]
           ,[ProgramTypeDescriptorId]
           ,[SchoolFoodServiceProgramServiceDescriptorId]
           ,[ServiceBeginDate]
           ,[ServiceEndDate]
           ,[CreateDate]
		   )
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @ProgramName
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @BeginDate
	, @ProgramTypeDescriptorId
	, @SchoolFoodServiceProgramServiceDescriptorId 
	, '2017-10-01'
	, NULL [ServiceEndDate]
	, GETDATE() [CreateDate]
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService] fs
	ON fs.StudentUSI = s.StudentUSI AND fs.BeginDate = @BeginDate AND fs.EducationOrganizationId = @EducationOrganizationId
	AND fs.ProgramEducationOrganizationId = @EducationOrganizationId AND fs.ProgramName = @ProgramName
	AND fs.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE fs.StudentUSI IS NULL

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