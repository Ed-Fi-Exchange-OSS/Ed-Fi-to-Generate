use EdFi_Sample_ODS_Data_For_Generate

DECLARE @EdFiStudent TABLE
(
	StudentUSI int
)

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  --INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)
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
  SET @ProgramName = 'Career and Technical Education'
  SET @CreateDate = GetDate()

  DECLARE @SchoolYear int
  SET @SchoolYear = 2018

BEGIN TRY

BEGIN TRANSACTION

DECLARE @DisciplineDescriptorId int
SELECT @DisciplineDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisciplineDescriptor' AND CodeValue = 'In School Suspension'

DECLARE @IdeaInterimRemovalTypeDescriptorId int
SELECT @IdeaInterimRemovalTypeDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor' AND CodeValue = 'InterimRemovalWeapons'

DECLARE @IdeaInterimRemovalReasonDescriptorId int
SELECT @IdeaInterimRemovalReasonDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/IdeaInterimRemovalReasonDescriptor' AND CodeValue = 'InterimRemovalWeapons'

DECLARE @DisciplineMethodFirearmDescriptorId int
SELECT @DisciplineMethodFirearmDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000537' AND CodeValue = 'EXPALT'

DECLARE @IDEADisciplineMethodFirearmDescriptorId int
SELECT @IDEADisciplineMethodFirearmDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000556' AND CodeValue = 'EXPNOTMOD'

DECLARE @CedsDisciplineActionIdentifier varchar(100)
SET @CedsDisciplineActionIdentifier = '1771'

DECLARE @DisciplineDate date
SET @DisciplineDate = '2018-03-08'

DECLARE @SchoolId int
SET @SchoolId = 255901012

INSERT INTO [edfi].[DisciplineAction]
           ([DisciplineActionIdentifier]
           ,[StudentUSI]
           ,[DisciplineDate]
           ,[DisciplineActionLength]
           ,[ActualDisciplineActionLength]
           ,[ResponsibilitySchoolId]
			)
SELECT @CedsDisciplineActionIdentifier
		, s.StudentUSI
		, @DisciplineDate
		, 1 [DisciplineActionLength]
		, 1 [ActualDisciplineActionLength]
		, @SchoolId

FROM @EdfiStudent s
LEFT JOIN [edfi].[DisciplineAction] dd
	ON dd.DisciplineActionIdentifier = @CedsDisciplineActionIdentifier AND dd.StudentUSI = s.StudentUSI AND dd.DisciplineDate = @DisciplineDate
WHERE dd.StudentUSI IS NULL

DECLARE @Pre_DisciplineDescriptorId int
SELECT @Pre_DisciplineDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisciplineDescriptor' AND CodeValue = 'Removal from Classroom'


Update dd
SET [DisciplineDescriptorId] = @DisciplineDescriptorId
FROM [edfi].[DisciplineActionDiscipline] dd
join @EdfiStudent s on dd.StudentUSI = s.StudentUSI

INSERT INTO [edfi].[DisciplineActionDiscipline]
           ([StudentUSI]
           ,[DisciplineActionIdentifier]
           ,[DisciplineDate]
           ,[DisciplineDescriptorId]
           )
SELECT s.StudentUSI
		,@CedsDisciplineActionIdentifier
		, @DisciplineDate
		, @DisciplineDescriptorId

FROM @EdfiStudent s
LEFT JOIN [edfi].[DisciplineActionDiscipline] dd
	ON dd.DisciplineActionIdentifier = @CedsDisciplineActionIdentifier AND dd.StudentUSI = s.StudentUSI AND dd.DisciplineDate = @DisciplineDate
	AND dd.DisciplineDescriptorId = @DisciplineDescriptorId 
WHERE dd.StudentUSI IS NULL

Update dd
SET [DisciplineDescriptorId] = @DisciplineDescriptorId
FROM [edfi].[DisciplineActionDiscipline] dd
join @EdfiStudent s on dd.StudentUSI = s.StudentUSI

INSERT INTO [extension].[DisciplineActionDiscipline]
           ([CedsDisciplineActionIdentifier]
           ,[DisciplineDate]
           ,[DisciplineDescriptorId]
           ,[StudentUSI]
           ,[IdeaInterimRemovalTypeDescriptorId]
           ,[IdeaInterimRemovalReasonDescriptorId]
           ,[DisciplineMethodFirearmDescriptorId]
           ,[IDEADisciplineMethodFirearmDescriptorId]
)
SELECT @CedsDisciplineActionIdentifier
		, @DisciplineDate
		, @DisciplineDescriptorId
		, s.StudentUSI
		, @IdeaInterimRemovalTypeDescriptorId
		, @IdeaInterimRemovalReasonDescriptorId
		, @DisciplineMethodFirearmDescriptorId
		, @IDEADisciplineMethodFirearmDescriptorId
FROM @EdfiStudent s
LEFT JOIN [extension].[DisciplineActionDiscipline] dd
	ON dd.CedsDisciplineActionIdentifier = @CedsDisciplineActionIdentifier AND dd.StudentUSI = s.StudentUSI AND dd.DisciplineDate = @DisciplineDate
	AND dd.DisciplineDescriptorId = @DisciplineDescriptorId 
WHERE dd.StudentUSI IS NULL


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

--  INSERT INTO [extension].[DisciplineActionDiscipline]
--           ([CedsDisciplineActionIdentifier]
--           ,[DisciplineDate]
--           ,[DisciplineDescriptorId]
--           ,[StudentUSI]
--           ,[IdeaInterimRemovalTypeDescriptorId]
--           ,[IdeaInterimRemovalReasonDescriptorId]
--           ,[DisciplineMethodFirearmDescriptorId]
--           ,[IDEADisciplineMethodFirearmDescriptorId]
--)

--	SELECT '1825'
--	, '2017-11-22'
--	, 416
--	, 20013
--	, 4053
--	, 4048
--	, 4057
--	, 4064



  --Insert into [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineIncidentWeapon]

  --Select 255901012, 1826, 735, GetDate()

  --  Update dad
  --Set [IDEADisciplineMethodFirearmDescriptorId] = 4064
  --FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[DisciplineActionDiscipline] dad