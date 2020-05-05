

		--10810
		--10812
	DECLARE @BeginDate DATETIME = '9/1/2017'
	DECLARE @StudentUSI INT
	DECLARE @StudentCharacteristicDescriptorId INT
	DECLARE @EducationOrganizationId INT = 255901001

	DECLARE @ProgramName VARCHAR(100) = 'MEP Program'
	, @ProgramId VARCHAR(100) = '2559010_12', @ProgramTypeDescriptorId INT
	, @MigrantEducationProgramServiceDescriptorId_1 INT
	, @MigrantEducationProgramServiceDescriptorId_2 INT
	, @ContinuationOfServicesReasonDescriptorId INT
	, @PriorityForServices BIT = 1
	, @LastQualifyingMove DATE = '9/1/2017'
	, @QualifyingArrivalDate DATE = '9/1/2017'
	, @MigrantEducationProgramEnrollmentTypeDescriptorId_1 INT
	, @MigrantEducationProgramEnrollmentTypeDescriptorId_2 INT


	SELECT @StudentCharacteristicDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor'
		AND CodeValue = 'Migrant'


	TRUNCATE TABLE extension.CedsStudentMigrantEducationProgramAssociation

	DELETE FROM [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService]
	WHERE StudentUSI IN  (000005,000007,10810,10812, 10813)

	DELETE FROM [edfi].[StudentMigrantEducationProgramAssociation]
	WHERE StudentUSI IN  (000005,000007,10810,10812, 10813)


	DELETE FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
	WHERE StudentUSI IN  (000005,000007,10810,10812, 10813)
	AND [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId

	DELETE FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
	WHERE StudentUSI IN  (000005,000007,10810,10812, 10813)
	AND [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId

	DELETE FROM [edfi].[GeneralStudentProgramAssociation]
	WHERE StudentUSI IN  (000005,000007,10810,10812, 10813)
	AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId




	SELECT @StudentUSI = 10810
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
		WHERE [EducationOrganizationId] = @EducationOrganizationId
		AND [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
		AND [StudentUSI] = @StudentUSI)
		INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] (
			[EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate]
		) VALUES (
			@EducationOrganizationId
			,@StudentCharacteristicDescriptorId
			,@StudentUSI
			,GETDATE()
		)

	-- add [edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod record
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		WHERE BeginDate = @BeginDate
		AND [EducationOrganizationId] = @EducationOrganizationId
		AND [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
		AND [StudentUSI] = @StudentUSI)
		INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] (
			BeginDate
			,[EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate]
		) VALUES (
			@BeginDate
			,@EducationOrganizationId
			,@StudentCharacteristicDescriptorId
			,@StudentUSI
			,GETDATE()
		)

	SELECT @StudentUSI = 10812
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
		WHERE [EducationOrganizationId] = @EducationOrganizationId
		AND [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
		AND [StudentUSI] = @StudentUSI)
		INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] (
			[EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate]
		) VALUES (
			@EducationOrganizationId
			,@StudentCharacteristicDescriptorId
			,@StudentUSI
			,GETDATE()
		)

	-- add [edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod record
	-- add [edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod record
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		WHERE BeginDate = @BeginDate
		AND [EducationOrganizationId] = @EducationOrganizationId
		AND [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
		AND [StudentUSI] = @StudentUSI)
		INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] (
			BeginDate
			,[EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate]
		) VALUES (
			@BeginDate
			,@EducationOrganizationId
			,@StudentCharacteristicDescriptorId
			,@StudentUSI
			,GETDATE()
		)



	-- =================================================================================================
	-- create a new MEP program
	SELECT @EducationOrganizationId = 255901 
	


	DECLARE @ServiceBeginDate DATE = '9/1/2017'
	DECLARE @ServiceEndDate DATE = '8/31/2018'

	SELECT @ProgramTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue='Migrant Education'

	-- uri://ed-fi.org/MigrantEducationProgramServiceDescriptor
	SELECT @MigrantEducationProgramServiceDescriptorId_1 = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/MigrantEducationProgramServiceDescriptor' AND CodeValue='Mathematics Instruction'

	SELECT @MigrantEducationProgramServiceDescriptorId_2 = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/MigrantEducationProgramServiceDescriptor' AND CodeValue='Referral Services'

	SELECT @ContinuationOfServicesReasonDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/ContinuationofServicesReasonDescriptor' AND CodeValue='Prev migratory scndry student continuing scndry sc'

	SELECT @MigrantEducationProgramEnrollmentTypeDescriptorId_1 = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'https://ceds.ed.gov/element/000437' AND CodeValue='01'

	SELECT @MigrantEducationProgramEnrollmentTypeDescriptorId_2 = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'https://ceds.ed.gov/element/000437' AND CodeValue='02'

	IF NOT EXISTS (SELECT * FROM extension.[MigrantEducationProgramEnrollmentTypeDescriptor] WHERE [MigrantEducationProgramEnrollmentTypeDescriptorId] = @MigrantEducationProgramEnrollmentTypeDescriptorId_1)
	INSERT INTO [extension].[MigrantEducationProgramEnrollmentTypeDescriptor]
        ([MigrantEducationProgramEnrollmentTypeDescriptorId])
		VALUES
			(@MigrantEducationProgramEnrollmentTypeDescriptorId_1)

			select @MigrantEducationProgramEnrollmentTypeDescriptorId_1, @MigrantEducationProgramEnrollmentTypeDescriptorId_2

	IF NOT EXISTS (SELECT * FROM extension.[MigrantEducationProgramEnrollmentTypeDescriptor] WHERE [MigrantEducationProgramEnrollmentTypeDescriptorId] = @MigrantEducationProgramEnrollmentTypeDescriptorId_2)
	INSERT INTO [extension].[MigrantEducationProgramEnrollmentTypeDescriptor]
        ([MigrantEducationProgramEnrollmentTypeDescriptorId])
		VALUES
			(@MigrantEducationProgramEnrollmentTypeDescriptorId_2)

	-- create MEP program
	IF NOT EXISTS (SELECT * FROM [edfi].[Program] 
		WHERE [EducationOrganizationId]=@EducationOrganizationId 
			  AND ProgramName=@ProgramName 
			  AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
			  AND ProgramId=@ProgramId)
		BEGIN
			INSERT INTO [edfi].[Program] (
				[EducationOrganizationId]
				,[ProgramName]
				,[ProgramId]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				,[ProgramTypeDescriptorId]
				--,[Discriminator]
			) VALUES (
				@EducationOrganizationId
				,@ProgramName
				,@ProgramId
				,NEWID()
				,GetDate()
				,GetDate()
				,@ProgramTypeDescriptorId
			)
		END

	-- create Student association with MEP program
	--10810	(000005)
	--10812 (000007)
	
	
	-- create general student program association to MEP program
	--[edfi].[GeneralStudentProgramAssociation]
	SELECT @StudentUSI = 10810
	IF NOT EXISTS (SELECT * FROM [edfi].[GeneralStudentProgramAssociation] WHERE
				EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
			BEGIN
				INSERT INTO [edfi].[GeneralStudentProgramAssociation] (
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
				) VALUES (
					@BeginDate
					,@EducationOrganizationId
					,@EducationOrganizationId
					,@ProgramName
					,@ProgramTypeDescriptorId
					,@StudentUSI
					,NULL
					,NULL
					,NULL
					,GetDate()
					,GetDate()
				)
			END

		-- add into StudentMigrantEducationProgramAssociation
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentMigrantEducationProgramAssociation] WHERE 
				StudentUSI=@StudentUSI
				AND EducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND BeginDate = @BeginDate
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId)
		BEGIN
			INSERT INTO [edfi].[StudentMigrantEducationProgramAssociation] (
				[StudentUSI]
				,[EducationOrganizationId]
				,[ProgramName]
				,[ProgramEducationOrganizationId]
				,[BeginDate]
				,[PriorityForServices]
				,[LastQualifyingMove]
				,[ContinuationOfServicesReasonDescriptorId]
				--,[USInitialEntry]
				--,[USMostRecentEntry]
				--,[USInitialSchoolEntry]
				,[QualifyingArrivalDate]
				--,[StateResidencyDate]
				--,[EligibilityExpirationDate]
				,[ProgramTypeDescriptorId]
			) VALUES (
				@StudentUSI
				,@EducationOrganizationId
				,@ProgramName
				,@EducationOrganizationId
				,@BeginDate
				,@PriorityForServices
				,@LastQualifyingMove
				,@ContinuationOfServicesReasonDescriptorId
				,@QualifyingArrivalDate
				,@ProgramTypeDescriptorId
			)
		END

	-- insert into StudentMigrantEducationProgramAssociationMigrantEducationProgramService
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService] WHERE 
				BeginDate = @BeginDate
				AND EducationOrganizationId=@EducationOrganizationId
				AND MigrantEducationProgramServiceDescriptorId = @MigrantEducationProgramServiceDescriptorId_1
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
		BEGIN
			INSERT INTO [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService] (
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
				,[CreateDate]
			) VALUES (
				@BeginDate
				,@EducationOrganizationId
				,@MigrantEducationProgramServiceDescriptorId_1
				,@EducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,NULL				-- [PrimaryIndicator]
				,@ServiceBeginDate
				,@ServiceEndDate
				,GETDATE()
			)
		END


	-- insert extention.CedsStudentMigrantEducationProgramAssociation
	-- Enrollment type
	IF NOT EXISTS (SELECT * FROM extension.CedsStudentMigrantEducationProgramAssociation WHERE
				BeginDate = @BeginDate
				AND EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
			BEGIN
				INSERT INTO extension.CedsStudentMigrantEducationProgramAssociation (
					[BeginDate]
					,[EducationOrganizationId]
					,[ProgramEducationOrganizationId]
					,[ProgramName]
					,ProgramTypeId
					,[StudentUSI]
					,[MigrantEducationProgramEnrollmentTypeDescriptorId]
				) VALUES (
					@BeginDate
					,@EducationOrganizationId
					,@EducationOrganizationId
					,@ProgramName
					,@ProgramTypeDescriptorId
					,@StudentUSI
					,@MigrantEducationProgramEnrollmentTypeDescriptorId_1
				)
			END

	--==================================================================================================
	SELECT @StudentUSI = 10812
	IF NOT EXISTS (SELECT * FROM [edfi].[GeneralStudentProgramAssociation] WHERE
				EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
			BEGIN
				INSERT INTO [edfi].[GeneralStudentProgramAssociation] (
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
				) VALUES (
					@BeginDate
					,@EducationOrganizationId
					,@EducationOrganizationId
					,@ProgramName
					,@ProgramTypeDescriptorId
					,@StudentUSI
					,NULL
					,NULL
					,NULL
					,GetDate()
					,GetDate()
				)
			END

		-- add into StudentMigrantEducationProgramAssociation
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentMigrantEducationProgramAssociation] WHERE 
				EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
		BEGIN
			INSERT INTO [edfi].[StudentMigrantEducationProgramAssociation] (
				[StudentUSI]
				,[EducationOrganizationId]
				,[ProgramName]
				,[ProgramEducationOrganizationId]
				,[BeginDate]
				,[PriorityForServices]
				,[LastQualifyingMove]
				,[ContinuationOfServicesReasonDescriptorId]
				--,[USInitialEntry]
				--,[USMostRecentEntry]
				--,[USInitialSchoolEntry]
				,[QualifyingArrivalDate]
				--,[StateResidencyDate]
				--,[EligibilityExpirationDate]
				,[ProgramTypeDescriptorId]
			) VALUES (
				@StudentUSI
				,@EducationOrganizationId
				,@ProgramName
				,@EducationOrganizationId
				,@BeginDate
				,@PriorityForServices
				,@LastQualifyingMove
				,@ContinuationOfServicesReasonDescriptorId
				,@QualifyingArrivalDate
				,@ProgramTypeDescriptorId
			)
		END

	-- insert into StudentMigrantEducationProgramAssociationMigrantEducationProgramService
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService] WHERE 
				BeginDate = @BeginDate
				AND EducationOrganizationId=@EducationOrganizationId
				AND MigrantEducationProgramServiceDescriptorId = @MigrantEducationProgramServiceDescriptorId_2
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
		BEGIN
			INSERT INTO [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService] (
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
				,[CreateDate]
			) VALUES (
				@BeginDate
				,@EducationOrganizationId
				,@MigrantEducationProgramServiceDescriptorId_2
				,@EducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,NULL				-- [PrimaryIndicator]
				,@ServiceBeginDate
				,@ServiceEndDate
				,GETDATE()
			)
		END

		--select @MigrantEducationProgramEnrollmentTypeDescriptorId_2
	-- insert extention.CedsStudentMigrantEducationProgramAssociation
	-- Enrollment type
	IF NOT EXISTS (SELECT * FROM extension.CedsStudentMigrantEducationProgramAssociation WHERE
				BeginDate = @BeginDate
				AND EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeId =@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
			BEGIN
				INSERT INTO extension.CedsStudentMigrantEducationProgramAssociation (
					[BeginDate]
					,[EducationOrganizationId]
					,[ProgramEducationOrganizationId]
					,[ProgramName]
					,[ProgramTypeId]
					,[StudentUSI]
					,[MigrantEducationProgramEnrollmentTypeDescriptorId]
				) VALUES (
					@BeginDate
					,@EducationOrganizationId
					,@EducationOrganizationId
					,@ProgramName
					,@ProgramTypeDescriptorId
					,@StudentUSI
					,@MigrantEducationProgramEnrollmentTypeDescriptorId_2
				)
			END


	DECLARE @LimitedEnglishProficiencyDescriptorId INT
	SELECT @LimitedEnglishProficiencyDescriptorId = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
		WHERE Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor' AND CodeValue = 'Limited'



	
	
	DECLARE @EntryGradeLevelDescriptor INT
	DECLARE @ProgramEducationOrganizationId INT
	DECLARE @SchoolId INT

	select @ProgramTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'English as a Second Language (ESL)'
			and Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'

	

	select @EducationOrganizationId = 255901
	select @ProgramEducationOrganizationId = 255901
	select @ProgramName = 'English as a Second Language (ESL)'

	SELECT @StudentUSI = 10813
	SELECT @BeginDate = '7/1/2017'
	SELECT @SchoolId = 255901001

	TRUNCATE TABLE extension.CedsStudentMigrantEducationProgramAssociation

	DELETE FROM [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService]
	WHERE StudentUSI IN  (10810,10812, 10813)

	DELETE FROM [edfi].[StudentMigrantEducationProgramAssociation]
	WHERE StudentUSI IN  (10810,10812, 10813)


	DELETE FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
	WHERE StudentUSI IN  (10810,10812, 10813)
	AND [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId

	DELETE FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
	WHERE StudentUSI IN  (10810,10812, 10813)

	DELETE FROM [edfi].[GeneralStudentProgramAssociation]
	WHERE StudentUSI IN  (10810,10812, 10813)
	AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId

	-- GeneralStudentProgramAssociation
	--if not exists (select * from edfi.GeneralStudentProgramAssociation where EducationOrganizationId=@EducationOrganizationId
	--	and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
	--	and ProgramName = @ProgramName
	--	and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
	--	and StudentUSI=@StudentUSI)
	--	insert into edfi.GeneralStudentProgramAssociation (
	--		[BeginDate]
	--		,[EducationOrganizationId]
	--		,[ProgramEducationOrganizationId]
	--		,[ProgramName]
	--		,[ProgramTypeDescriptorId]
	--		,[StudentUSI]
	--		,[EndDate]
	--		,[ReasonExitedDescriptorId]
	--		,[ServedOutsideOfRegularSession]
	--		,[CreateDate]
	--		,[LastModifiedDate]
	--		,[Id]
	--		,[Discriminator]
	--	) values (
	--		@BeginDate
	--		,@EducationOrganizationId
	--		,@ProgramEducationOrganizationId
	--		,@ProgramName
	--		,@ProgramTypeDescriptorId
	--		,@StudentUSI
	--		,NULL
	--		,NULL
	--		,NULL
	--		,GetDate()
	--		,GetDate()
	--		,NEWID ()
	--		,'edfi.StudentProgramAssociation'
	--	)

	-- LEP
	SELECT @LimitedEnglishProficiencyDescriptorId = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
		WHERE Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor' AND CodeValue = 'Limited'

	UPDATE edfi.StudentEducationOrganizationAssociation
	SET LimitedEnglishProficiencyDescriptorId = @LimitedEnglishProficiencyDescriptorId
	WHERE StudentUSI = @StudentUSI

	-- Migrant Student program association with Referral
	SET @ProgramName = 'MEP Program'
	SET @ProgramId = '2559010_12'
	SET @PriorityForServices = 1
	SET @LastQualifyingMove = '9/1/2017'
	SET @QualifyingArrivalDate = '9/1/2017'
	SET @ServiceBeginDate = '9/1/2017'
	SET @ServiceEndDate = '8/31/2018'

	SELECT @ProgramTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue='Migrant Education'

	-- uri://ed-fi.org/MigrantEducationProgramServiceDescriptor
	SELECT @MigrantEducationProgramServiceDescriptorId_1 = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/MigrantEducationProgramServiceDescriptor' AND CodeValue='Referral Services'

	SELECT @MigrantEducationProgramEnrollmentTypeDescriptorId_1 = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'https://ceds.ed.gov/element/000437' AND CodeValue='01'

	SELECT @ContinuationOfServicesReasonDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/ContinuationofServicesReasonDescriptor' AND CodeValue='Prev migratory scndry student continuing scndry sc'

	-- create MEP program if NOT EXISTS
	IF NOT EXISTS (SELECT * FROM [edfi].[Program] 
		WHERE [EducationOrganizationId]=@EducationOrganizationId 
			  AND ProgramName=@ProgramName 
			  AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
			  AND ProgramId=@ProgramId)
		BEGIN
			INSERT INTO [edfi].[Program] (
				[EducationOrganizationId]
				,[ProgramName]
				,[ProgramId]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				,[ProgramTypeDescriptorId]
				--,[Discriminator]
			) VALUES (
				@EducationOrganizationId
				,@ProgramName
				,@ProgramId
				,NEWID()
				,GetDate()
				,GetDate()
				,@ProgramTypeDescriptorId
			)
		END

	SELECT @BeginDate = '9/1/2017'
	-- create general student program association to MEP program
	IF NOT EXISTS (SELECT * FROM [edfi].[GeneralStudentProgramAssociation] WHERE
				EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
			BEGIN
				INSERT INTO [edfi].[GeneralStudentProgramAssociation] (
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
				) VALUES (
					@BeginDate
					,@EducationOrganizationId
					,@EducationOrganizationId
					,@ProgramName
					,@ProgramTypeDescriptorId
					,@StudentUSI
					,NULL
					,NULL
					,NULL
					,GetDate()
					,GetDate()
				)
			END

	-- clear program related records
	DELETE FROM extension.CedsStudentMigrantEducationProgramAssociation WHERE StudentUSI = @StudentUSI
	DELETE FROM [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService] WHERE StudentUSI = @StudentUSI
	DELETE FROM [edfi].[StudentMigrantEducationProgramAssociation] WHERE StudentUSI = @StudentUSI



	-- add into StudentMigrantEducationProgramAssociation
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentMigrantEducationProgramAssociation] WHERE 
				StudentUSI=@StudentUSI
				AND EducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND BeginDate = @BeginDate
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId)
		BEGIN
			INSERT INTO [edfi].[StudentMigrantEducationProgramAssociation] (
				[StudentUSI]
				,[EducationOrganizationId]
				,[ProgramName]
				,[ProgramEducationOrganizationId]
				,[BeginDate]
				,[PriorityForServices]
				,[LastQualifyingMove]
				,[ContinuationOfServicesReasonDescriptorId]
				--,[USInitialEntry]
				--,[USMostRecentEntry]
				--,[USInitialSchoolEntry]
				,[QualifyingArrivalDate]
				--,[StateResidencyDate]
				--,[EligibilityExpirationDate]
				,[ProgramTypeDescriptorId]
			) VALUES (
				@StudentUSI
				,@EducationOrganizationId
				,@ProgramName
				,@EducationOrganizationId
				,@BeginDate
				,@PriorityForServices
				,@LastQualifyingMove
				,@ContinuationOfServicesReasonDescriptorId
				,@QualifyingArrivalDate
				,@ProgramTypeDescriptorId
			)
		END

	-- insert into StudentMigrantEducationProgramAssociationMigrantEducationProgramService
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService] WHERE 
				BeginDate = @BeginDate
				AND EducationOrganizationId=@EducationOrganizationId
				AND MigrantEducationProgramServiceDescriptorId = @MigrantEducationProgramServiceDescriptorId_1
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
		BEGIN
			INSERT INTO [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService] (
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
				,[CreateDate]
			) VALUES (
				@BeginDate
				,@EducationOrganizationId
				,@MigrantEducationProgramServiceDescriptorId_1
				,@EducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,NULL				-- [PrimaryIndicator]
				,@ServiceBeginDate
				,@ServiceEndDate
				,GETDATE()
			)
		END

	-- insert extention.CedsStudentMigrantEducationProgramAssociation
	-- Enrollment type
	IF NOT EXISTS (SELECT * FROM extension.CedsStudentMigrantEducationProgramAssociation WHERE
				BeginDate = @BeginDate
				AND EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
			BEGIN
				INSERT INTO extension.CedsStudentMigrantEducationProgramAssociation (
					[BeginDate]
					,[EducationOrganizationId]
					,[ProgramEducationOrganizationId]
					,[ProgramName]
					,[ProgramTypeId]
					,[StudentUSI]
					,[MigrantEducationProgramEnrollmentTypeDescriptorId]
				) VALUES (
					@BeginDate
					,@EducationOrganizationId
					,@EducationOrganizationId
					,@ProgramName
					,@ProgramTypeDescriptorId
					,@StudentUSI
					,@MigrantEducationProgramEnrollmentTypeDescriptorId_1
				)
			END

	-- insert extention.CedsStudentMigrantEducationProgramAssociation
	-- Enrollment type - REQUIRED
	IF NOT EXISTS (SELECT * FROM extension.CedsStudentMigrantEducationProgramAssociation WHERE
				BeginDate = @BeginDate
				AND EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
			BEGIN
				INSERT INTO extension.CedsStudentMigrantEducationProgramAssociation (
					[BeginDate]
					,[EducationOrganizationId]
					,[ProgramEducationOrganizationId]
					,[ProgramName]
					,[ProgramTypeId]
					,[StudentUSI]
					,[MigrantEducationProgramEnrollmentTypeDescriptorId]
				) VALUES (
					@BeginDate
					,@EducationOrganizationId
					,@EducationOrganizationId
					,@ProgramName
					,@ProgramTypeDescriptorId
					,@StudentUSI
					,@MigrantEducationProgramEnrollmentTypeDescriptorId_1
				)
			END

	-- StudentHomelessProgramAssociation
	--if not exists (select * from edfi.StudentHomelessProgramAssociation where EducationOrganizationId=@EducationOrganizationId
	--	and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
	--	and ProgramName = @ProgramName
	--	and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
	--	and StudentUSI=@StudentUSI)
	--	insert into edfi.StudentHomelessProgramAssociation (
	--		[BeginDate]
	--		,[EducationOrganizationId]
	--		,[ProgramEducationOrganizationId]
	--		,[ProgramName]
	--		,[ProgramTypeDescriptorId]
	--		,[StudentUSI]
	--		,[HomelessPrimaryNighttimeResidenceDescriptorId]
	--		,[AwaitingFosterCare]
	--		,[HomelessUnaccompaniedYouth]
	--	) values (
	--		@BeginDate
	--		,@EducationOrganizationId
	--		,@ProgramEducationOrganizationId
	--		,@ProgramName
	--		,@ProgramTypeDescriptorId
	--		,@StudentUSI
	--		,@HomelessPrimaryNighttimeResidenceDescriptorId
	--		,NULL
	--		,0
	--	)

	---- StudentProgramAssociation
	--if not exists (select * from edfi.StudentProgramAssociation where 
	--	StudentUSI=@StudentUSI
	--	AND EducationOrganizationId = @EducationOrganizationId
	--	and ProgramName = @ProgramName
	--	and ProgramEducationOrganizationId=@ProgramEducationOrganizationId
	--	and ProgramTypeDescriptorId = @ProgramTypeDescriptorId
	--	)
	--	INSERT INTO edfi.StudentProgramAssociation (
	--		[StudentUSI]
	--		,[EducationOrganizationId]
	--		,[ProgramName]
	--		,[ProgramEducationOrganizationId]
	--		,[BeginDate]
	--		,[ProgramTypeDescriptorId]
	--	) VALUES (
	--		@StudentUSI
	--		,@EducationOrganizationId
	--		,@ProgramName
	--		,@ProgramEducationOrganizationId
	--		,@BeginDate
	--		,@ProgramTypeDescriptorId
	--	)

	---- StudentSchoolAssociation
	--IF NOT EXISTS (SELECT * FROM edfi.StudentSchoolAssociation WHERE 
	--	StudentUSI=@StudentUSI
	--	AND SchoolId=@SchoolId)
	--	INSERT INTO edfi.StudentSchoolAssociation (
	--		StudentUSI
	--		,SchoolId
	--		,EntryDate
	--		,[EntryGradeLevelDescriptorId]
	--		,[EducationOrganizationId]
	--		,[GraduationPlanTypeDescriptorId]
	--		,[GraduationSchoolYear]
	--		,[Id]
	--		,[LastModifiedDate]
	--		,[CreateDate]
	--	) VALUES (
	--		@StudentUSI
	--		,@SchoolId
	--		,'2017-08-21'
	--		,@EntryGradeLevelDescriptor
	--		,@SchoolId
	--		,@GraduationPlanTypeDescriptorId
	--		,'2020'
	--		,NEWID ()
	--		,GETDATE()
	--		,GETDATE()
	--	)
	--ELSE
	--	UPDATE edfi.StudentSchoolAssociation
	--	SET [EntryGradeLevelDescriptorId]=@EntryGradeLevelDescriptor		-- by default Sixth grade
	--	WHERE StudentUSI=@StudentUSI
	--	AND SchoolId=@SchoolId
	

	
	DECLARE @CedsLocalEducationAgencyId INT = 255901
	SET @EducationOrganizationId = 255901
	SET @ProgramEducationOrganizationId = 255901
	SET @ProgramName = 'Title I Part A'
	SET @ProgramId = '2559010_08'

	--=====================================================================
	-- Convert school as Title I school
	SET @SchoolId = 255901001
	DECLARE @TitleIPartASchoolDesignationDescriptorId INT
	SELECT @TitleIPartASchoolDesignationDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'uri://ed-fi.org/TitleIPartASchoolDesignationDescriptor' AND CodeValue = 'Title I Targeted Assistance School'
	UPDATE edfi.School 
	SET TitleIPartASchoolDesignationDescriptorId = @TitleIPartASchoolDesignationDescriptorId
	WHERE SchoolId = @SchoolId

	-- add LEA extension for title I testing
	DECLARE @TitleIinstructionalServiceDescriptorId INT
	DECLARE @TitleIProgramTypeDescriptorId INT
	DECLARE @K12LeaTitleISupportServiceDescriptorId INT
	DECLARE @MepProjectTypeDescriptorId INT

	SELECT @TitleIinstructionalServiceDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000282' AND CodeValue = 'Mathematics'
	SELECT @TitleIProgramTypeDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000284' AND CodeValue = 'TargetedAssistanceProgram'
	SELECT @K12LeaTitleISupportServiceDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000289' AND CodeValue = 'HealthDentalEyeCare'

	SELECT @MepProjectTypeDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000463' AND CodeValue = 'SummerIntersession'

	IF NOT EXISTS (SELECT * FROM extension.CedsLocalEducationAgency WHERE CedsLocalEducationAgencyId = @CedsLocalEducationAgencyId)
		INSERT INTO extension.CedsLocalEducationAgency (
			[CedsLocalEducationAgencyId]
			--,[LocalEducationAgencyTypeDescriptorId]
			,[LocalEducationAgencyId]
			,[TitleIinstructionalServiceDescriptorId]
			,[TitleIProgramTypeDescriptorId]
			,[K12LeaTitleISupportServiceDescriptorId]
			,[MepProjectTypeDescriptorId]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@CedsLocalEducationAgencyId
			--,NULL
			,@CedsLocalEducationAgencyId
			,@TitleIinstructionalServiceDescriptorId
			,@TitleIProgramTypeDescriptorId
			,@K12LeaTitleISupportServiceDescriptorId
			,@MepProjectTypeDescriptorId
			,GETDATE()
			,GETDATE()
			,NEWID()
		)

	--=====================================================================

	IF NOT EXISTS (SELECT * FROM extension.CedsSchool WHERE CedsSchoolId = @SchoolId)
		INSERT INTO extension.CedsSchool (
			[CedsSchoolId]
			,[MepProjectTypeDescriptorId]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@SchoolId
			,@MepProjectTypeDescriptorId
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	ELSE
		UPDATE extension.CedsSchool
		SET MepProjectTypeDescriptorId = @MepProjectTypeDescriptorId
		WHERE CedsSchoolId = @SchoolId


	
	-- FS165 Migratory Data

	SET @SchoolId = 255901001

	IF NOT EXISTS (SELECT * FROM extension.CedsSchoolStatus WHERE SchoolId = @SchoolId)
		INSERT INTO extension.CedsSchoolStatus (
			[SchoolId]
			,[ConsolidatedMepFundsStatus]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@SchoolId
			,1
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	ELSE 
		UPDATE extension.CedsSchoolStatus
		SET [ConsolidatedMepFundsStatus] = 1
		WHERE SchoolId = @SchoolId