
	DECLARE @EntryGradeLevelDescriptor INT
	DECLARE @StudentUSI INT
	DECLARE @ProgramTypeDescriptorId INT
	DECLARE @EducationOrganizationId INT
	DECLARE @ProgramEducationOrganizationId INT
	DECLARE @ProgramName VARCHAR(60)
	DECLARE @BeginDate DATE
	DECLARE @SchoolId INT
	DECLARE @GraduationPlanTypeDescriptorId INT
	DECLARE @HomelessPrimaryNighttimeResidenceDescriptorId INT
	DECLARE @StudentCharacteristicDescriptorId INT
	DECLARE @ProgramCharacteristicDescriptorId INT 

	SELECT @EducationOrganizationId = 255901
	SELECT @ProgramName = 'Homeless'
	select @ProgramTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Homeless'
		and Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'

	select @ProgramCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'A McKinney-Vento Program for Homelessness'
		and Namespace = 'uri://ed-fi.org/ProgramCharacteristicDescriptor'


	IF NOT EXISTS (SELECT * FROM edfi.ProgramCharacteristic WHERE EducationOrganizationId = @EducationOrganizationId
		AND ProgramCharacteristicDescriptorId = @ProgramCharacteristicDescriptorId
		AND ProgramName = @ProgramName
		AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
	)
		INSERT INTO edfi.ProgramCharacteristic (
			[EducationOrganizationId]
			,[ProgramCharacteristicDescriptorId]
			,[ProgramName]
			,[CreateDate]
			,[ProgramTypeDescriptorId]	
		)
		VALUES (
			@EducationOrganizationId
			,@ProgramCharacteristicDescriptorId
			,@ProgramName
			,GetDate()
			,@ProgramTypeDescriptorId
		)


--==================================================================================================================
-- FS194 TEST DATA
	select @EntryGradeLevelDescriptor = DescriptorId from edfi.Descriptor where CodeValue = 'Infant/toddler'		-- or Preschool/Prekindergarten
		and Namespace = 'uri://ed-fi.org/GradeLevelDescriptor'

	select @ProgramTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Homeless'
			and Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'

	select @GraduationPlanTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Minimum'		-- Minimum
		and Namespace = 'uri://ed-fi.org/GraduationPlanTypeDescriptor'

	select @HomelessPrimaryNighttimeResidenceDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Hotels/motels'
			and Namespace = 'uri://ed-fi.org/HomelessPrimaryNighttimeResidenceDescriptor'

	select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Homeless'
		and Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor'

	select @EducationOrganizationId = 255901
	select @ProgramEducationOrganizationId = 255901
	select @ProgramName = 'Homeless'

	SELECT @StudentUSI = 3				-- existing BDay 2007-07-30
	SELECT @BeginDate = '9/1/2018'
	SELECT @SchoolId = 255901006

	-- Student
	UPDATE edfi.Student
	SET BirthDate = '9/1/2017'				-- by default 2007-07-30
	WHERE StudentUSI = @StudentUSI

	-- [edfi].StudentEducationOrganizationAssociationStudentCharacteristic
	IF NOT EXISTS (SELECT * FROM [edfi].StudentEducationOrganizationAssociationStudentCharacteristic WHERE
		EducationOrganizationId=@SchoolId
		AND StudentUSI = @StudentUSI
		AND StudentCharacteristicDescriptorId=@StudentCharacteristicDescriptorId)
		INSERT INTO [edfi].StudentEducationOrganizationAssociationStudentCharacteristic (
			[EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[DesignatedBy]
			,[CreateDate]
		) VALUES (
			@SchoolId
			,@StudentCharacteristicDescriptorId
			,@StudentUSI
			,NULL
			,GETDATE()
		)

	-- edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod WHERE
		EducationOrganizationId = @SchoolId
		AND StudentCharacteristicDescriptorId=@StudentCharacteristicDescriptorId
		AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod (
			[BeginDate]
			,[EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[EndDate]
			,[CreateDate]
		) VALUES (
			'2018-01-01'
			,@SchoolId
			,@StudentCharacteristicDescriptorId
			,@StudentUSI
			,NULL
			,GETDATE()
		)
	
	-- homeless program
	if not exists (select * from edfi.Program where 
		ProgramName = @ProgramName
		and ProgramTypeDescriptorId = @ProgramTypeDescriptorId 
		and EducationOrganizationId = @EducationOrganizationId)
		insert into edfi.Program (
			[EducationOrganizationId]
			,[ProgramName]
			,[ProgramId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[ProgramTypeDescriptorId]
			,[Discriminator]
		) values (
			@EducationOrganizationId
			,@ProgramName
			,'2559010_10'
			,NEWID ()
			,GetDate()
			,GetDate()
			,@ProgramTypeDescriptorId
			,NULL
		)

	-- GeneralStudentProgramAssociation
		if not exists (select * from edfi.GeneralStudentProgramAssociation where EducationOrganizationId=@EducationOrganizationId
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			and StudentUSI=@StudentUSI)
			insert into edfi.GeneralStudentProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[EndDate]
				,[ReasonExitedDescriptorId]
				,[ServedOutsideOfRegularSession]
				,[CreateDate]
				,[LastModifiedDate]
				,[Id]
				,[Discriminator]
			) values (
				@BeginDate
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,NULL
				,NULL
				,NULL
				,GetDate()
				,GetDate()
				,NEWID ()
				,'edfi.StudentProgramAssociation'
			)


		-- StudentHomelessProgramAssociation
		if not exists (select * from edfi.StudentHomelessProgramAssociation where EducationOrganizationId=@EducationOrganizationId
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			and StudentUSI=@StudentUSI)
			insert into edfi.StudentHomelessProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[HomelessPrimaryNighttimeResidenceDescriptorId]
				,[AwaitingFosterCare]
				,[HomelessUnaccompaniedYouth]
			) values (
				@BeginDate
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,@HomelessPrimaryNighttimeResidenceDescriptorId
				,NULL
				,0
			)

		-- StudentProgramAssociation
		if not exists (select * from edfi.StudentProgramAssociation where 
			StudentUSI=@StudentUSI
			AND EducationOrganizationId = @EducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			)
			INSERT INTO edfi.StudentProgramAssociation (
				[StudentUSI]
				,[EducationOrganizationId]
				,[ProgramName]
				,[ProgramEducationOrganizationId]
				,[BeginDate]
				,[ProgramTypeDescriptorId]
			) VALUES (
				@StudentUSI
				,@EducationOrganizationId
				,@ProgramName
				,@ProgramEducationOrganizationId
				,@BeginDate
				,@ProgramTypeDescriptorId
			)

		-- StudentSchoolAssociation
		IF NOT EXISTS (SELECT * FROM edfi.StudentSchoolAssociation WHERE 
			StudentUSI=@StudentUSI
			AND SchoolId=@SchoolId)
			INSERT INTO edfi.StudentSchoolAssociation (
				StudentUSI
				,SchoolId
				,EntryDate
				,[EntryGradeLevelDescriptorId]
				,[EducationOrganizationId]
				,[GraduationPlanTypeDescriptorId]
				,[GraduationSchoolYear]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
			) VALUES (
				@StudentUSI
				,@SchoolId
				,'2017-08-21'
				,@EntryGradeLevelDescriptor
				,@SchoolId
				,@GraduationPlanTypeDescriptorId
				,'2020'
				,NEWID ()
				,GETDATE()
				,GETDATE()
			)
		ELSE
			UPDATE edfi.StudentSchoolAssociation
			SET [EntryGradeLevelDescriptorId]=@EntryGradeLevelDescriptor		-- by default Sixth grade
			WHERE StudentUSI=@StudentUSI
			AND SchoolId=@SchoolId


-- ======================================================================================================
-- FS118 TEST DATA
		--Declare @ProgramTypeDescriptorId int
		--declare @EducationOrganizationId int
		--declare @ProgramEducationOrganizationId int
		--declare @ProgramName varchar(60)
		--declare @StudentUSI int
		--declare @HomelessPrimaryNighttimeResidenceDescriptorId int

		select @ProgramTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Homeless'
			and Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'
		select @EducationOrganizationId = 255901
		select @ProgramEducationOrganizationId = 255901
		select @ProgramName = 'Homeless'
		select @HomelessPrimaryNighttimeResidenceDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Shelters'
			and Namespace = 'uri://ed-fi.org/HomelessPrimaryNighttimeResidenceDescriptor'
		select @StudentUSI = 21631

		-- new homeless program
		if not exists (select * from edfi.Program where ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId and EducationOrganizationId = @EducationOrganizationId)
			insert into edfi.Program (
				[EducationOrganizationId]
				,[ProgramName]
				,[ProgramId]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				,[ProgramTypeDescriptorId]
				,[Discriminator]
			) values (
				@EducationOrganizationId
				,@ProgramName
				,'2559010_10'
				,NEWID ()
				,GetDate()
				,GetDate()
				,@ProgramTypeDescriptorId
				,NULL
			)

		-- insert GeneralStudentProgramAssociation
		if not exists (select * from edfi.GeneralStudentProgramAssociation where EducationOrganizationId=@EducationOrganizationId
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			and StudentUSI=@StudentUSI)
			insert into edfi.GeneralStudentProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[EndDate]
				,[ReasonExitedDescriptorId]
				,[ServedOutsideOfRegularSession]
				,[CreateDate]
				,[LastModifiedDate]
				,[Id]
				,[Discriminator]
			) values (
				'2018-05-01'
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,'2018-05-01'
				,NULL
				,NULL
				,GetDate()
				,GetDate()
				,NEWID ()
				,'edfi.StudentProgramAssociation'
			)


		-- insert StudentHomelessProgramAssociation
		if not exists (select * from edfi.StudentHomelessProgramAssociation where EducationOrganizationId=@EducationOrganizationId
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			and StudentUSI=@StudentUSI)
			insert into edfi.StudentHomelessProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[HomelessPrimaryNighttimeResidenceDescriptorId]
				,[AwaitingFosterCare]
				,[HomelessUnaccompaniedYouth]
			) values (
				'2018-05-01'
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,@HomelessPrimaryNighttimeResidenceDescriptorId
				,NULL
				,1
			)

	
	--FS103 - use extension.CedsSchool
	SET @SchoolId = 255901001

	DECLARE @StatePovertyDesignationDescriptorId INT
	DECLARE @NameSpace VARCHAR(100) = 'https://ceds.ed.gov/element/000585'

	SELECT @StatePovertyDesignationDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = @NameSpace AND CodeValue = 'HighQuartile'

	IF NOT EXISTS (SELECT * FROM extension.CedsSchool WHERE CedsSchoolId = @SchoolId)
		INSERT INTO extension.CedsSchool (
			[CedsSchoolId]
			,[StatePovertyDesignationDescriptorId]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@SchoolId
			,@StatePovertyDesignationDescriptorId
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	ELSE 
		UPDATE extension.CedsSchool
		SET [StatePovertyDesignationDescriptorId] = @StatePovertyDesignationDescriptorId
		WHERE CedsSchoolId=@SchoolId


	--==============================================================================================================

		select @ProgramTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Homeless'
			and Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'
		select @EducationOrganizationId = 255901
		select @ProgramEducationOrganizationId = 255901
		select @ProgramName = 'Homeless'
		select @HomelessPrimaryNighttimeResidenceDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Shelters'
			and Namespace = 'uri://ed-fi.org/HomelessPrimaryNighttimeResidenceDescriptor'
		select @StudentUSI = 1

		-- new homeless program
		if not exists (select * from edfi.Program where ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId and EducationOrganizationId = @EducationOrganizationId)
			insert into edfi.Program (
				[EducationOrganizationId]
				,[ProgramName]
				,[ProgramId]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				,[ProgramTypeDescriptorId]
				,[Discriminator]
			) values (
				@EducationOrganizationId
				,@ProgramName
				,'2559010_10'
				,NEWID ()
				,GetDate()
				,GetDate()
				,@ProgramTypeDescriptorId
				,NULL
			)

		-- insert GeneralStudentProgramAssociation
		if not exists (select * from edfi.GeneralStudentProgramAssociation where EducationOrganizationId=@EducationOrganizationId
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			and StudentUSI=@StudentUSI)
			insert into edfi.GeneralStudentProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[EndDate]
				,[ReasonExitedDescriptorId]
				,[ServedOutsideOfRegularSession]
				,[CreateDate]
				,[LastModifiedDate]
				,[Id]
				,[Discriminator]
			) values (
				'2018-05-01'
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,'2018-05-01'
				,NULL
				,NULL
				,GetDate()
				,GetDate()
				,NEWID ()
				,'edfi.StudentProgramAssociation'
			)


		-- insert StudentHomelessProgramAssociation
		if not exists (select * from edfi.StudentHomelessProgramAssociation where EducationOrganizationId=@EducationOrganizationId
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			and StudentUSI=@StudentUSI)
			insert into edfi.StudentHomelessProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[HomelessPrimaryNighttimeResidenceDescriptorId]
				,[AwaitingFosterCare]
				,[HomelessUnaccompaniedYouth]
			) values (
				'2018-05-01'
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,@HomelessPrimaryNighttimeResidenceDescriptorId
				,NULL
				,1
			)

	--========================================================================================================
	update ssa
	set EntryDate = '2017-07-01'
	from [edfi].StudentSchoolAssociation ssa
	WHERE EntryDate <> '2017-07-01'

	INSERT INTO [EdFi].[Session] 
	SELECT TOP 1 ssa.[SchoolId]
		,2018 SchoolYear
		, 722
		,'2017 - 2018 Spring Semester'
		,'2018-01-02'
		,'2018-05-07'
		, 84
		, NEWID()
		, '2018-06-25 16:57:02.093'
		, '2018-06-25 16:57:02.093'
		, NULL
	FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa
	JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociationDisability] d
	ON ssa.StudentUSI = d.StudentUSI
	LEFT  JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[session] s 
	ON ssa.SchoolId = s.SchoolId
	AND s.SchoolYear = 2018
	AND rtrim(s.SessionName) = '2017 - 2018 Spring Semester'
	WHERE s.id IS NULL


	INSERT INTO [edfi].[StudentSchoolAttendanceEvent]
           (
		    [StudentUSI]
           ,[SchoolId]
           ,[SchoolYear]
           ,[EventDate]
           ,[AttendanceEventCategoryDescriptorId]
           ,[EventDuration]
           ,[SessionName]
           ,[EducationalEnvironmentDescriptorId]
           )
			SELECT DISTINCT 
			st.[StudentUSI]
           ,st.[SchoolId]

           ,st.[SchoolYear]
           ,st.[EventDate]

           ,ISNULL(st.[AttendanceEventCategoryDescriptorId], 102)
           ,st.[EventDuration]
		   ,'2017 - 2018 Spring Semester'
           ,st.[EducationalEnvironmentDescriptorId]
		    FROM (
				SELECT TOP 80 [StudentUSI]
					  ,[SchoolId]
					  ,2018 SchoolYear
					  ,DateAdd(d, ROUND(DateDiff(d, '2017-09-01', '2018-05-31') * RAND(CHECKSUM(NEWID())), 0),
					  DATEADD(second,CHECKSUM(NEWID())%48000, '2017-09-01')) [EventDate]
					  ,CASE 
							WHEN Abs(Checksum(NewId())) % 10 > 5 THEN 99
							WHEN Abs(Checksum(NewId())) % 10 <= 5 THEN 101
					   END [AttendanceEventCategoryDescriptorId]
					   ,1.00 [EventDuration]
					   ,942 [EducationalEnvironmentDescriptorId]
				  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation]
				  where schoolid = 255901001 and Year(entrydate) = 2017
				
				UNION
				
				SELECT TOP 20 d.[StudentUSI]
					  ,ssa.[SchoolId]
					  ,2018 SchoolYear
					  ,DateAdd(d, ROUND(DateDiff(d, '2017-09-01', '2018-05-31') * RAND(CHECKSUM(NEWID())), 0),
					  DATEADD(second,CHECKSUM(NEWID())%48000, '2017-09-01')) [EventDate]
					  ,CASE 
							WHEN Abs(Checksum(NewId())) % 10 > 5 THEN 99
							WHEN Abs(Checksum(NewId())) % 10 <= 5 THEN 101
					   END [AttendanceEventCategoryDescriptorId]
					   ,1.00 [EventDuration]
					   ,942 [EducationalEnvironmentDescriptorId]
				  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa
				  JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociationDisability] d
					ON ssa.StudentUSI = d.StudentUSI
				  JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[session] s 
					ON ssa.SchoolId = s.SchoolId
					AND s.SchoolYear = 2018
					AND s.SessionName = '2017 - 2018 Spring Semester'
				  WHERE Year(entrydate) = 2017
			) st
			LEFT JOIN [edfi].[StudentSchoolAttendanceEvent] att
			ON att.[StudentUSI] = st.StudentUSI	
			AND att.[SchoolId] = att.SchoolId
			AND att.[SchoolYear] = att.SchoolYear
			AND att.[EventDate] = att.EventDate
			AND att.[AttendanceEventCategoryDescriptorId] = att.AttendanceEventCategoryDescriptorId
			WHERE att.StudentUSI IS NULL

			update se
			SET EventDuration = CAST((Abs(Checksum(NewId())) % 10)/10.00 AS decimal(3,2))
			from [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAttendanceEvent] se
			inner join (
			select TOp 200 stSchAtt.*
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAttendanceEvent] stSchAtt 
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d ON d.DescriptorId = stSchAtt.AttendanceEventCategoryDescriptorId
			WHERE d.CodeValue <> 'In Attendance'
			) pt on pt.[StudentUSI] = se.StudentUSI and pt.SchoolId = se.SchoolId 
				and pt.SchoolYear = se.SchoolYear and pt.EventDate = se.EventDate
				and pt.AttendanceEventCategoryDescriptorId = se.AttendanceEventCategoryDescriptorId



	-- FS132 TEST DATA - use extension.SchoolFederalFunds
	DECLARE @FiscalYear INT = 2018
	SET @SchoolId = 255901001

	IF NOT EXISTS (SELECT * FROM extension.SchoolFederalFunds WHERE
		FiscalYear = @FiscalYear
		AND SchoolId = @SchoolId)
		INSERT INTO extension.SchoolFederalFunds (
			[FiscalYear]
			,[SchoolId]
			,[SchoolImprovementAllocation]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@FiscalYear
			,@SchoolId
			, 150000.04
			,GETDATE()
			,GETDATE()
			,NEWID()
		)


	--=========================================================================================
	select @EntryGradeLevelDescriptor = DescriptorId from edfi.Descriptor where CodeValue = 'Infant/toddler'		-- or Preschool/Prekindergarten
		and Namespace = 'uri://ed-fi.org/GradeLevelDescriptor'

	select @ProgramTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Homeless'
			and Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'

	select @GraduationPlanTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Minimum'		-- Minimum
		and Namespace = 'uri://ed-fi.org/GraduationPlanTypeDescriptor'

	select @HomelessPrimaryNighttimeResidenceDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Hotels/motels'
			and Namespace = 'uri://ed-fi.org/HomelessPrimaryNighttimeResidenceDescriptor'

	select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Homeless'
		and Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor'

	SELECT @EducationOrganizationId = 255901
	SELECT @ProgramName = 'Homeless'
	select @ProgramTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Homeless'
		and Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'

	select @ProgramCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'A McKinney-Vento Program for Homelessness'
		and Namespace = 'uri://ed-fi.org/ProgramCharacteristicDescriptor'


	IF NOT EXISTS (SELECT * FROM edfi.ProgramCharacteristic WHERE EducationOrganizationId = @EducationOrganizationId
		AND ProgramCharacteristicDescriptorId = @ProgramCharacteristicDescriptorId
		AND ProgramName = @ProgramName
		AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
	)
		INSERT INTO edfi.ProgramCharacteristic (
			[EducationOrganizationId]
			,[ProgramCharacteristicDescriptorId]
			,[ProgramName]
			,[CreateDate]
			,[ProgramTypeDescriptorId]	
		)
		VALUES (
			@EducationOrganizationId
			,@ProgramCharacteristicDescriptorId
			,@ProgramName
			,GetDate()
			,@ProgramTypeDescriptorId
		)



	select @EducationOrganizationId = 255901
	select @ProgramEducationOrganizationId = 255901
	select @ProgramName = 'Homeless'

	SELECT @StudentUSI = 3				-- existing BDay 2007-07-30
	SELECT @BeginDate = '9/1/2018'
	SELECT @SchoolId = 255901006

	-- Student
	UPDATE edfi.Student
	SET BirthDate = '9/1/2017'				-- by default 2007-07-30
	WHERE StudentUSI = @StudentUSI

	-- [edfi].StudentEducationOrganizationAssociationStudentCharacteristic
	IF NOT EXISTS (SELECT * FROM [edfi].StudentEducationOrganizationAssociationStudentCharacteristic WHERE
		EducationOrganizationId=@SchoolId
		AND StudentUSI = @StudentUSI
		AND StudentCharacteristicDescriptorId=@StudentCharacteristicDescriptorId)
		INSERT INTO [edfi].StudentEducationOrganizationAssociationStudentCharacteristic (
			[EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[DesignatedBy]
			,[CreateDate]
		) VALUES (
			@SchoolId
			,@StudentCharacteristicDescriptorId
			,@StudentUSI
			,NULL
			,GETDATE()
		)

	-- edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod WHERE
		EducationOrganizationId = @SchoolId
		AND StudentCharacteristicDescriptorId=@StudentCharacteristicDescriptorId
		AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod (
			[BeginDate]
			,[EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[EndDate]
			,[CreateDate]
		) VALUES (
			'2018-01-01'
			,@SchoolId
			,@StudentCharacteristicDescriptorId
			,@StudentUSI
			,NULL
			,GETDATE()
		)
	
	-- homeless program
	if not exists (select * from edfi.Program where 
		ProgramName = @ProgramName
		and ProgramTypeDescriptorId = @ProgramTypeDescriptorId 
		and EducationOrganizationId = @EducationOrganizationId)
		insert into edfi.Program (
			[EducationOrganizationId]
			,[ProgramName]
			,[ProgramId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[ProgramTypeDescriptorId]
			,[Discriminator]
		) values (
			@EducationOrganizationId
			,@ProgramName
			,'2559010_10'
			,NEWID ()
			,GetDate()
			,GetDate()
			,@ProgramTypeDescriptorId
			,NULL
		)

	-- GeneralStudentProgramAssociation
		if not exists (select * from edfi.GeneralStudentProgramAssociation where 
			BeginDate = @BeginDate
			AND EducationOrganizationId=@EducationOrganizationId
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			and StudentUSI=@StudentUSI)
			insert into edfi.GeneralStudentProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[EndDate]
				,[ReasonExitedDescriptorId]
				,[ServedOutsideOfRegularSession]
				,[CreateDate]
				,[LastModifiedDate]
				,[Id]
				,[Discriminator]
			) values (
				@BeginDate
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,NULL
				,NULL
				,NULL
				,GetDate()
				,GetDate()
				,NEWID ()
				,'edfi.StudentProgramAssociation'
			)

		-- StudentHomelessProgramAssociation
		if not exists (select * from edfi.StudentHomelessProgramAssociation where 
			BeginDate = @BeginDate
			AND EducationOrganizationId=@EducationOrganizationId
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			and StudentUSI=@StudentUSI)
			insert into edfi.StudentHomelessProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[HomelessPrimaryNighttimeResidenceDescriptorId]
				,[AwaitingFosterCare]
				,[HomelessUnaccompaniedYouth]
			) values (
				@BeginDate
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,@HomelessPrimaryNighttimeResidenceDescriptorId
				,NULL
				,1
			)

		-- StudentProgramAssociation
		if not exists (select * from edfi.StudentProgramAssociation where 
			StudentUSI=@StudentUSI
			AND EducationOrganizationId = @EducationOrganizationId
			and ProgramName = @ProgramName
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			)
			INSERT INTO edfi.StudentProgramAssociation (
				[StudentUSI]
				,[EducationOrganizationId]
				,[ProgramName]
				,[ProgramEducationOrganizationId]
				,[BeginDate]
				,[ProgramTypeDescriptorId]
			) VALUES (
				@StudentUSI
				,@EducationOrganizationId
				,@ProgramName
				,@ProgramEducationOrganizationId
				,@BeginDate
				,@ProgramTypeDescriptorId
			)

		-- StudentSchoolAssociation
		IF NOT EXISTS (SELECT * FROM edfi.StudentSchoolAssociation WHERE 
			StudentUSI=@StudentUSI
			AND SchoolId=@SchoolId)
			INSERT INTO edfi.StudentSchoolAssociation (
				StudentUSI
				,SchoolId
				,EntryDate
				,[EntryGradeLevelDescriptorId]
				,[EducationOrganizationId]
				,[GraduationPlanTypeDescriptorId]
				,[GraduationSchoolYear]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
			) VALUES (
				@StudentUSI
				,@SchoolId
				,'2017-08-21'
				,@EntryGradeLevelDescriptor
				,@SchoolId
				,@GraduationPlanTypeDescriptorId
				,'2020'
				,NEWID ()
				,GETDATE()
				,GETDATE()
			)
		ELSE
			UPDATE edfi.StudentSchoolAssociation
			SET [EntryGradeLevelDescriptorId]=@EntryGradeLevelDescriptor		-- by default Sixth grade
			WHERE StudentUSI=@StudentUSI
			AND SchoolId=@SchoolId


		-- StudentHomelessProgramAssociation
		if not exists (select * from extension.CedsStudentHomelessProgramAssociation where 
			BeginDate = @BeginDate
			AND EducationOrganizationId=@EducationOrganizationId
			and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
			and CedsProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			and StudentUSI=@StudentUSI)
			insert into extension.CedsStudentHomelessProgramAssociation (
				[BeginDate]
				,[CedsProgramName]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[HomelessServicedIndicator]
				,[CreateDate]
				,[LastModifiedDate]
				,[Id]
			) values (
				@BeginDate
				,@ProgramName
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,1
				,GETDATE()
				,GETDATE()
				,NEWID()
			)