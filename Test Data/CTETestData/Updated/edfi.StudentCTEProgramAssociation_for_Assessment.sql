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

  SELECT @ProgramTypeDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue = 'Career and Technical Education'

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

DELETE FROM @EdFiStudent
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

INSERT INTO [edfi].[StudentCTEProgramAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramEducationOrganizationId]
           ,[BeginDate]
           ,[ProgramTypeDescriptorId]
           ,[NonTraditionalGenderStatus]
			)
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @ProgramName
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @BeginDate
	, @ProgramTypeDescriptorId
	, 1 [NonTraditionalGenderStatus]
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentCTEProgramAssociation] cte
	ON cte.StudentUSI = s.StudentUSI AND cte.BeginDate = @BeginDate AND cte.EducationOrganizationId = @EducationOrganizationId
	AND cte.ProgramEducationOrganizationId = @EducationOrganizationId AND cte.ProgramName = @ProgramName
	AND cte.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE cte.StudentUSI IS NULL	

declare @ServiceDescriptorId int
select @ServiceDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/ServiceDescriptor' and CodeValue = 'Assistive technology device or service'

declare @ServiceBeginDate date
set @ServiceBeginDate = '2017-10-01'

INSERT INTO [edfi].[StudentCTEProgramAssociationService]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[ServiceDescriptorId]
           ,[StudentUSI]
           ,[PrimaryIndicator]
           ,[ServiceBeginDate]
           ,[ServiceEndDate]
           ,[CreateDate])
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, @ServiceDescriptorId
	, s.StudentUSI
	, NULL [PrimaryIndicator]
	, @ServiceBeginDate
	, NULL [ServiceEndDate]
	, GETDATE()
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentCTEProgramAssociationService] cte
	ON cte.StudentUSI = s.StudentUSI AND cte.BeginDate = @BeginDate AND cte.EducationOrganizationId = @EducationOrganizationId
	AND cte.ProgramEducationOrganizationId = @EducationOrganizationId AND cte.ProgramName = @ProgramName
	AND cte.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE cte.StudentUSI IS NULL	


DELETE FROM @EdFiStudent

INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)

DECLARE @DisplacementTypeDescriptorId int
SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'ADVTRAIN'
--SELECT * from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' 
DELETE FROM @EdFiStudent

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)

  DECLARE @PerkinsLEPStatusDescriptorId INT
  SELECT @PerkinsLEPStatusDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000581' AND CodeValue = 'LEPP'

INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
		   ,[PerkinsLEPStatusDescriptorId]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @PerkinsLEPStatusDescriptorId
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

DECLARE @CareerPathwayDescriptorId int
SELECT @CareerPathwayDescriptorId = DescriptorId from edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/CareerPathwayDescriptor' and CodeValue = 'Education and Training'

INSERT INTO [edfi].[StudentCTEProgramAssociationCTEProgram]
           (
		   [StudentUSI]
           ,[ProgramEducationOrganizationId]
           ,[BeginDate]
           ,[CTEProgramCompletionIndicator]
           ,[ProgramName]
           ,[EducationOrganizationId]
           ,[CreateDate]
           ,[CareerPathwayDescriptorId]
           ,[ProgramTypeDescriptorId]
		   )
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @BeginDate
	, 1 [CTEProgramCompletionIndicator]
	, @ProgramName
	, @EducationOrganizationId
	, GETDATE()
	, @CareerPathwayDescriptorId
	, @ProgramTypeDescriptorId
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentCTEProgramAssociationCTEProgram] ctecte
	ON ctecte.StudentUSI = s.StudentUSI
		AND ctecte.BeginDate = @BeginDate AND ctecte.ProgramName = @ProgramName AND ctecte.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ctecte.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ctecte.StudentUSI IS NULL

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)

SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'EMPLOYMENT'

INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'MILITARY'


INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)

SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'OBTAINEMP'

INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)
SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'POSTSEC'

INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

-- LEP
DECLARE @LimitedEnglishProficiencyDescriptorId int
DECLARE @SexDescriptorId int

DELETE FROM @EdFiStudent

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
SELECT @LimitedEnglishProficiencyDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor' AND CodeValue = 'Limited'
SELECT @SexDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/SexDescriptor' AND CodeValue = 'Male'

INSERT INTO [edfi].[StudentEducationOrganizationAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[LastModifiedDate]
           ,[CreateDate]
           ,[HispanicLatinoEthnicity]
           ,[LimitedEnglishProficiencyDescriptorId]
           ,[SexDescriptorId]
		)
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @CreateDate
	, @CreateDate
	, 0 [HispanicLatinoEthnicity]
	, @LimitedEnglishProficiencyDescriptorId
	, @SexDescriptorId
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentEducationOrganizationAssociation] sa
	ON sa.StudentUSI = s.StudentUSI
		AND sa.EducationOrganizationId = @EducationOrganizationId
WHERE sa.StudentUSI IS NULL

-- Correction

		select @sexdescriptorid = DescriptorId from EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor where Namespace = 'uri://ed-fi.org/SexDescriptor' and CodeValue = 'Female'

		Update sa
		Set SexDescriptorId = @sexdescriptorid
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociation sa
		where StudentUSI = 20001 

	DECLARE @ExitWithdrawTypeDescriptorId int
	select @ExitWithdrawTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/ExitWithdrawTypeDescriptor' AND CodeValue = 'Completed'

	Update ssa
	SET ExitWithdrawTypeDescriptorId = @ExitWithdrawTypeDescriptorId
	from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa
	Where StudentUSI = 20002

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