

	-- FS169 test data
	-- populate two CTE students into extension.CedsStudentCTEProgramAssociation table with DisplacementTypeDescriptor

	TRUNCATE TABLE extension.CedsStudentCTEProgramAssociation

	DECLARE @StudentUSI INT
	DECLARE @EducationOrganizationId INT
	DECLARE @ProgramName NVARCHAR(60)
	DECLARE @ProgramEducationOrganizationId INT
	DECLARE @BeginDate DATE
	DECLARE @ProgramTypeDescriptorId INT

	DECLARE @DisplacementTypeDescriptorId INT

	-- pull first student
	SET @StudentUSI = 21631
	SELECT @EducationOrganizationId = EducationOrganizationId
		   ,@ProgramName = ProgramName
		   ,@ProgramEducationOrganizationId = ProgramEducationOrganizationId
		   ,@BeginDate = BeginDate
		   ,@ProgramTypeDescriptorId = ProgramTypeDescriptorId
	FROM [edfi].[StudentCTEProgramAssociation]
	WHERE StudentUSI = @StudentUSI

	-- insert into extension table

	SELECT @DisplacementTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue='ADVTRAIN'

SELECT * 


FROM [edfi].[StudentCTEProgramAssociation] cte
LEFT JOIN extension.CedsStudentCTEProgramAssociation ext
	ON cte.StudentUSI = ext.StudentUSI AND cte.EducationOrganizationId = ext.EducationOrganizationId AND cte.ProgramEducationOrganizationId = ext.ProgramEducationOrganizationId
	AND cte.BeginDate = ext.BeginDate AND cte.ProgramTypeDescriptorId = ext.ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

	INSERT INTO extension.CedsStudentCTEProgramAssociation (
		[BeginDate]
		,[EducationOrganizationId]
		,[ProgramEducationOrganizationId]
		,[ProgramName]
		,[ProgramTypeDescriptorId]
		,[StudentUSI]
		,[DisplacementTypeDescriptorId]
		,[AdvancedTrainingEnrollmentDate]
		,CteParticipant
		,CteConcentrator
		,[CreateDate]
		,[LastModifiedDate]
		,[Id]
	) VALUES (
		@BeginDate
		,@EducationOrganizationId
		,@ProgramEducationOrganizationId
		,@ProgramName
		,@ProgramTypeDescriptorId
		,@StudentUSI
		,@DisplacementTypeDescriptorId
		,'1/1/2018'
		,0
		,1
		,GETDATE()
		,GETDATE()
		,NEWID()
	)

	-- student 2
	SET @StudentUSI = 21690
	SELECT @EducationOrganizationId = EducationOrganizationId
		   ,@ProgramName = ProgramName
		   ,@ProgramEducationOrganizationId = ProgramEducationOrganizationId
		   ,@BeginDate = BeginDate
		   ,@ProgramTypeDescriptorId = ProgramTypeDescriptorId
	FROM [edfi].[StudentCTEProgramAssociation]
	WHERE StudentUSI = @StudentUSI

	-- insert into extension table
	SELECT @DisplacementTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue='EMPLOYMENT'

	INSERT INTO extension.CedsStudentCTEProgramAssociation (
		[BeginDate]
		,[EducationOrganizationId]
		,[ProgramEducationOrganizationId]
		,[ProgramName]
		,[ProgramTypeDescriptorId]
		,[StudentUSI]
		,[DisplacementTypeDescriptorId]
		,CteParticipant
		,CteConcentrator
		,[CreateDate]
		,[LastModifiedDate]
		,[Id]
	) VALUES (
		@BeginDate
		,@EducationOrganizationId
		,@ProgramEducationOrganizationId
		,@ProgramName
		,@ProgramTypeDescriptorId
		,@StudentUSI
		,@DisplacementTypeDescriptorId
		,0
		,1
		,GETDATE()
		,GETDATE()
		,NEWID()
	)

	-- student 3
	SET @StudentUSI = 21984
	SELECT @EducationOrganizationId = EducationOrganizationId
		   ,@ProgramName = ProgramName
		   ,@ProgramEducationOrganizationId = ProgramEducationOrganizationId
		   ,@BeginDate = BeginDate
		   ,@ProgramTypeDescriptorId = ProgramTypeDescriptorId
	FROM [edfi].[StudentCTEProgramAssociation]
	WHERE StudentUSI = @StudentUSI

	-- insert into extension table
	SELECT @DisplacementTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue='MILITARY'

	INSERT INTO extension.CedsStudentCTEProgramAssociation (
		[BeginDate]
		,[EducationOrganizationId]
		,[ProgramEducationOrganizationId]
		,[ProgramName]
		,[ProgramTypeDescriptorId]
		,[StudentUSI]
		,[DisplacementTypeDescriptorId]
		,CteParticipant
		,CteConcentrator
		,[CreateDate]
		,[LastModifiedDate]
		,[Id]
	) VALUES (
		@BeginDate
		,@EducationOrganizationId
		,@ProgramEducationOrganizationId
		,@ProgramName
		,@ProgramTypeDescriptorId
		,@StudentUSI
		,@DisplacementTypeDescriptorId
		,1
		,0
		,GETDATE()
		,GETDATE()
		,NEWID()
	)

	-- student 4
	SET @StudentUSI = 22548
	SELECT @EducationOrganizationId = EducationOrganizationId
		   ,@ProgramName = ProgramName
		   ,@ProgramEducationOrganizationId = ProgramEducationOrganizationId
		   ,@BeginDate = BeginDate
		   ,@ProgramTypeDescriptorId = ProgramTypeDescriptorId
	FROM [edfi].[StudentCTEProgramAssociation]
	WHERE StudentUSI = @StudentUSI

	-- insert into extension table
	SELECT @DisplacementTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue='POSTSEC'

	INSERT INTO extension.CedsStudentCTEProgramAssociation (
		[BeginDate]
		,[EducationOrganizationId]
		,[ProgramEducationOrganizationId]
		,[ProgramName]
		,[ProgramTypeDescriptorId]
		,[StudentUSI]
		,[DisplacementTypeDescriptorId]
		,CteParticipant
		,CteConcentrator
		,[CreateDate]
		,[LastModifiedDate]
		,[Id]
	) VALUES (
		@BeginDate
		,@EducationOrganizationId
		,@ProgramEducationOrganizationId
		,@ProgramName
		,@ProgramTypeDescriptorId
		,@StudentUSI
		,@DisplacementTypeDescriptorId
		,1
		,0
		,GETDATE()
		,GETDATE()
		,NEWID()
	)


	---- simulate CTE concentrator
	--UPDATE Top(20) [Staging].[ProgramParticipationCTE]
	--SET CteConcentrator=1
	--, [CteParticipant] = 1
	
	--UPDATE Top(20) [Staging].[ProgramParticipationCTE]
	--SET CteConcentrator=0
	--, [CteParticipant] = 0
	--where RecordId between 21899 and 22537

	--UPDATE Top(20) [Staging].[ProgramParticipationCTE]
	--SET CteConcentrator=1
	--, [CteParticipant] = 1
	--where RecordId between 22532 and 22583

	-- FS-155-FS156
	-- CTE Participants in Programs for Non-traditional
	-- CTE Concentrators in Programs for Non-traditional
	DECLARE @CareerPathwayDescriptorId INT

	SELECT @CareerPathwayDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/CareerPathwayDescriptor' AND CodeValue='Information Technology'

	SET @StudentUSI = 21631
	IF NOT EXISTS (SELECT * FROM edfi.StudentCTEProgramAssociationCTEProgram WHERE 
				StudentUSI=@StudentUSI
				AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
				AND BeginDate = @BeginDate
				AND ProgramName=@ProgramName
				AND EducationOrganizationId=@EducationOrganizationId
				AND CareerPathwayDescriptorId=@CareerPathwayDescriptorId
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				)
		INSERT INTO edfi.StudentCTEProgramAssociationCTEProgram (
			[StudentUSI]
			,[ProgramEducationOrganizationId]
			,[BeginDate]
			,[CIPCode]
			,[PrimaryCTEProgramIndicator]
			,[CTEProgramCompletionIndicator]
			,[ProgramName]
			,[EducationOrganizationId]
			,[CreateDate]
			,[CareerPathwayDescriptorId]
			,[ProgramTypeDescriptorId]
		) VALUES (
			@StudentUSI
			,@ProgramEducationOrganizationId
			,@BeginDate
			,NULL
			,NULL
			,1						-- [CTEProgramCompletionIndicator]
			,@ProgramName
			,@EducationOrganizationId
			,GETDATE()
			,@CareerPathwayDescriptorId
			,@ProgramTypeDescriptorId
		)
