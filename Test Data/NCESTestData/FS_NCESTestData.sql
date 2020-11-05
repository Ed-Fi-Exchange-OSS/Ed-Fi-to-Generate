-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


	-- FS032 ========================================================

	DECLARE @EducationOrganizationId INT = 255901
	DECLARE @ExitWithdrawTypeDescriptorId INT
	DECLARE @StudentUSI INT = 10848
	DECLARE @StudentCharacteristicDescriptorId INT
	DECLARE @BeginDate DATETIME = '2017-07-01'
	DECLARE @LimitedEnglishProficiencyDescriptorId INT
	DECLARE @SexDescriptorId INT

	SELECT @ExitWithdrawTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = 'uri://ed-fi.org/ExitWithdrawTypeDescriptor' AND CodeValue = 'Dropout'

	SELECT @SexDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = 'uri://ed-fi.org/SexDescriptor' AND CodeValue = 'Female'

	UPDATE edfi.StudentSchoolAssociation
	SET ExitWithdrawTypeDescriptorId = @ExitWithdrawTypeDescriptorId
	WHERE StudentUSI = @StudentUSI


	-- add StudentEducationOrganizationAssociation record
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociation WHERE 
		StudentUSI=@StudentUSI
		AND EducationOrganizationId=@EducationOrganizationId)
		INSERT INTO edfi.StudentEducationOrganizationAssociation (
			[StudentUSI]
			,[EducationOrganizationId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[SexDescriptorId]
		) VALUES (
			@StudentUSI
			,@EducationOrganizationId
			,NEWID()
			,GETDATE()
			,GETDATE()
			,@SexDescriptorId
		)

	-- add Economic Disadvantaged characteristic
		SELECT @StudentCharacteristicDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Economic Disadvantaged' 

		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE 
			EducationOrganizationId = @EducationOrganizationId
			AND StudentUSI=@StudentUSI
			AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] (
				[EducationOrganizationId] ,[StudentCharacteristicDescriptorId] ,[StudentUSI] ,[CreateDate]
			) VALUES (
				@EducationOrganizationId ,@StudentCharacteristicDescriptorId ,@StudentUSI ,GETDATE()
			)
		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] WHERE 
			BeginDate = @BeginDate
			AND EducationOrganizationId = @EducationOrganizationId
			AND StudentUSI=@StudentUSI
			AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] (
				[BeginDate] ,[EducationOrganizationId] ,[StudentCharacteristicDescriptorId] ,[StudentUSI] ,[EndDate] ,[CreateDate]
			) VALUES (
				@BeginDate ,@EducationOrganizationId ,@StudentCharacteristicDescriptorId ,@StudentUSI ,NULL ,GETDATE()
			)

		-- add Migrant status
		SELECT @StudentCharacteristicDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Migrant' 

		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE 
			EducationOrganizationId = @EducationOrganizationId
			AND StudentUSI=@StudentUSI
			AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] (
				[EducationOrganizationId] ,[StudentCharacteristicDescriptorId] ,[StudentUSI] ,[CreateDate]
			) VALUES (
				@EducationOrganizationId ,@StudentCharacteristicDescriptorId ,@StudentUSI ,GETDATE()
			)
		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] WHERE 
			BeginDate = @BeginDate
			AND EducationOrganizationId = @EducationOrganizationId
			AND StudentUSI=@StudentUSI
			AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] (
				[BeginDate] ,[EducationOrganizationId] ,[StudentCharacteristicDescriptorId] ,[StudentUSI] ,[EndDate] ,[CreateDate]
			) VALUES (
				@BeginDate ,@EducationOrganizationId ,@StudentCharacteristicDescriptorId ,@StudentUSI ,NULL ,GETDATE()
			)

		-- LEP status
		SELECT @LimitedEnglishProficiencyDescriptorId = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
		WHERE Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor' AND CodeValue = 'Limited'
		UPDATE edfi.StudentEducationOrganizationAssociation
		SET LimitedEnglishProficiencyDescriptorId = @LimitedEnglishProficiencyDescriptorId
		WHERE StudentUSI = @StudentUSI



	-- FS033 ====================================================================================
	-- FS033 Food Service eligibility
	-- create a new test Program 
	SET @EducationOrganizationId = 255901
	DECLARE @ProgramName NVARCHAR(60) = 'Food eligibility'
	DECLARE @ProgramId NVARCHAR(20)	= '2559010_11'
	DECLARE @ProgramTypeDescriptorId INT 
	DECLARE @ProgramEducationOrganizationId INT = 255901
	SET @BeginDate = '7/1/2017'
	SET @StudentUSI = 21840

	DECLARE @SchoolFoodServiceProgramServiceDescriptorId INT


	SELECT @ProgramTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor] WHERE
		Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue = 'Food Service Program'

	IF NOT EXISTS (SELECT 1 FROM edfi.ProgramTypeDescriptor WHERE ProgramTypeDescriptorId = @ProgramTypeDescriptorId) BEGIN
		INSERT INTO edfi.ProgramTypeDescriptor VALUES (@ProgramTypeDescriptorId)
	END

	SELECT @SchoolFoodServiceProgramServiceDescriptorId = DescriptorId FROM [edfi].[Descriptor] WHERE
		Namespace = 'uri://ed-fi.org/SchoolFoodServiceProgramServiceDescriptor' AND CodeValue = 'Free Breakfast'

	-- create program if not exists
	IF NOT EXISTS (SELECT * FROM [edfi].[Program] WHERE 
		EducationOrganizationId = @EducationOrganizationId
		AND ProgramName = @ProgramName
		AND ProgramId = @ProgramId
		AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId)
		INSERT INTO [edfi].[Program] (
			[EducationOrganizationId]
			,[ProgramName]
			,[ProgramId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[ProgramTypeDescriptorId]
		) VALUES (
			@EducationOrganizationId
			,@ProgramName
			,@ProgramId
			,NEWID()
			,GETDATE()
			,GETDATE()
			,@ProgramTypeDescriptorId
		)

	-- create general student to food program association
	IF NOT EXISTS (SELECT * FROM edfi.GeneralStudentProgramAssociation WHERE 
		BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganizationId
		AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
		AND ProgramName = @ProgramName
		AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
		AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.GeneralStudentProgramAssociation (
			[BeginDate]
			,[EducationOrganizationId]
			,[ProgramEducationOrganizationId]
			,[ProgramName]
			,[ProgramTypeDescriptorId]
			,[StudentUSI]
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
			,GETDATE()
			,GETDATE()
			,NEWID()
		)


	-- create student to food service program association
	IF NOT EXISTS (SELECT * FROM edfi.StudentSchoolFoodServiceProgramAssociation WHERE 
		BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganizationId
		AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
		AND ProgramName = @ProgramName
		AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
		AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentSchoolFoodServiceProgramAssociation (
			[BeginDate]
			,[EducationOrganizationId]
			,[ProgramEducationOrganizationId]
			,[ProgramName]
			,[ProgramTypeDescriptorId]
			,[StudentUSI]
		) VALUES (
			@BeginDate
			,@EducationOrganizationId
			,@ProgramEducationOrganizationId
			,@ProgramName
			,@ProgramTypeDescriptorId
			,@StudentUSI
		)

	-- create association to food service program school food service
	IF NOT EXISTS (SELECT * FROM edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService WHERE 
		BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganizationId
		AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
		AND ProgramName = @ProgramName
		AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
		AND StudentUSI = @StudentUSI
		AND SchoolFoodServiceProgramServiceDescriptorId = @SchoolFoodServiceProgramServiceDescriptorId)
		INSERT INTO edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService (
			[BeginDate]
			,[EducationOrganizationId]
			,[ProgramEducationOrganizationId]
			,[ProgramName]
			,[ProgramTypeDescriptorId]
			,[SchoolFoodServiceProgramServiceDescriptorId]
			,[StudentUSI]
			,[CreateDate]
		) VALUES (
			@BeginDate
			,@EducationOrganizationId
			,@ProgramEducationOrganizationId
			,@ProgramName
			,@ProgramTypeDescriptorId
			,@SchoolFoodServiceProgramServiceDescriptorId
			,@StudentUSI
			,GETDATE()
		)

	-- FS129 TEST DATA ============================================================================================================
	DECLARE @SchoolId INT = 255901001
	DECLARE @MagnetOrSpecialProgramEmphasisSchoolId INT
	DECLARE @NSLPStatusId INT
	DECLARE @TitleIPartASchoolDesignationDescriptorId INT
	DECLARE @VirtualSchoolStatusDescriptorId INT
	DECLARE @NationalSchoolLunchProgramStatusDescriptorId INT
	DECLARE @SharedTimeIndicatorDescriptorId INT
	DECLARE @ReconstitutedStatusDescriptorId INT
	DECLARE @CharterStatusDescriptorId INT

	SELECT @TitleIPartASchoolDesignationDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'uri://ed-fi.org/TitleIPartASchoolDesignationDescriptor' AND CodeValue = 'Title I Targeted Assistance School'

	SELECT @MagnetOrSpecialProgramEmphasisSchoolId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'uri://ed-fi.org/MagnetSpecialProgramEmphasisSchoolDescriptor' AND CodeValue = 'All students participate'

	SELECT @CharterStatusDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'uri://ed-fi.org/CharterStatusDescriptor' AND CodeValue = 'Open Enrollment'

	UPDATE edfi.School 
	SET TitleIPartASchoolDesignationDescriptorId = @TitleIPartASchoolDesignationDescriptorId
		,MagnetSpecialProgramEmphasisSchoolDescriptorId = @MagnetOrSpecialProgramEmphasisSchoolId
		,CharterStatusDescriptorId = @CharterStatusDescriptorId
	WHERE SchoolId = @SchoolId

	
	SELECT @NationalSchoolLunchProgramStatusDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/001767' AND CodeValue = 'NSLPWOPRO'

	SELECT @VirtualSchoolStatusDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/001766' AND CodeValue = 'SupplementalVirtual'

	SELECT @SharedTimeIndicatorDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000257' AND CodeValue = 'Yes'

	SELECT @ReconstitutedStatusDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000230' AND CodeValue = 'Yes'

	IF NOT EXISTS (SELECT * FROM extension.CedsSchool WHERE CedsSchoolId = @SchoolId)
		INSERT INTO extension.CedsSchool (
			[CedsSchoolId]
			,[NationalSchoolLunchProgramStatusDescriptorId]
			,[ReconstitutedStatusDescriptorId]
			,[SharedTimeIndicatorDescriptorId]
			,[VirtualSchoolStatusDescriptorId]
			,[ContractIdentifier]
			,[StatePovertyDesignationDescriptorId]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@SchoolId
			,@NationalSchoolLunchProgramStatusDescriptorId
			,@ReconstitutedStatusDescriptorId
			,@SharedTimeIndicatorDescriptorId
			,@VirtualSchoolStatusDescriptorId
			,NULL
			,NULL
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	ELSE 
		UPDATE extension.CedsSchool 
		SET [NationalSchoolLunchProgramStatusDescriptorId] = @NationalSchoolLunchProgramStatusDescriptorId
		,ReconstitutedStatusDescriptorId = @ReconstitutedStatusDescriptorId
		,[SharedTimeIndicatorDescriptorId] = @SharedTimeIndicatorDescriptorId
		,[VirtualSchoolStatusDescriptorId] = @VirtualSchoolStatusDescriptorId
		WHERE CedsSchoolId=@SchoolId

	--IF NOT EXISTS (SELECT * FROM extension.CedsSchoolStatus WHERE SchoolId = @SchoolId)
	--	INSERT INTO extension.CedsSchoolStatus (
	--		[SchoolId]
	--		,[ConsolidatedMepFundsStatus]
	--		,[CreateDate]
	--		,[LastModifiedDate]
	--		,[Id]
	--	) VALUES (
	--		@SchoolId
	--		,1
	--		,GETDATE()
	--		,GETDATE()
	--		,NEWID()
	--	)
	--ELSE 
	--	UPDATE extension.CedsSchoolStatus
	--	SET [ConsolidatedMepFundsStatus] = 1
	--	WHERE SchoolId = @SchoolId


	


		-- insert Race records  [edfi].[StudentEducationOrganizationAssociationRace]
		-- Reg diploma:
		-- 21631	RaceDescriptorId=1280 (White), namespace=uri://ed-fi.org/RaceDescriptor
		-- 21984    RaceDescriptorId=1280 (Native Hawaiian - Pacific Islander), namespace=uri://ed-fi.org/RaceDescriptor

		-- Other
		--21777		RaceDescriptorId=1280 (American Indian - Alaska Native), namespace=uri://ed-fi.org/RaceDescriptor
		--22110		RaceDescriptorId=1280 (Asian), namespace=uri://ed-fi.org/RaceDescriptor
		--22144		RaceDescriptorId=1280 (Black - African American), namespace=uri://ed-fi.org/RaceDescriptor

		SET @SchoolId = 255901001
		SET @EducationOrganizationId = 255901
		DECLARE @RaceDescriptorId INT
		DECLARE @NameSpace NVARCHAR(50) = 'uri://ed-fi.org/RaceDescriptor'
		SET @BeginDate = '2018-01-01'

		SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = @NameSpace AND CodeValue = 'White'

		SET @StudentUSI=21631
		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace]
			WHERE EducationOrganizationId = @EducationOrganizationId AND StudentUSI = @StudentUSI)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace] (
				[EducationOrganizationId]
				,[StudentUSI]
				,[CreateDate]
				,[RaceDescriptorId]
			) VALUES (
				@EducationOrganizationId
				,@StudentUSI
				,GETDATE()
				,@RaceDescriptorId
			)

		-- add Economic Disadvantaged characteristic
		SELECT @StudentCharacteristicDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Economic Disadvantaged' 

		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE 
			EducationOrganizationId = @EducationOrganizationId
			AND StudentUSI=@StudentUSI
			AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] (
				[EducationOrganizationId] ,[StudentCharacteristicDescriptorId] ,[StudentUSI] ,[CreateDate]
			) VALUES (
				@EducationOrganizationId ,@StudentCharacteristicDescriptorId ,@StudentUSI ,GETDATE()
			)
		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] WHERE 
			BeginDate = @BeginDate
			AND EducationOrganizationId = @EducationOrganizationId
			AND StudentUSI=@StudentUSI
			AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] (
				[BeginDate] ,[EducationOrganizationId] ,[StudentCharacteristicDescriptorId] ,[StudentUSI] ,[EndDate] ,[CreateDate]
			) VALUES (
				@BeginDate ,@EducationOrganizationId ,@StudentCharacteristicDescriptorId ,@StudentUSI ,NULL ,GETDATE()
			)

		-- add Migrant status
		SELECT @StudentCharacteristicDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Migrant' 

		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE 
			EducationOrganizationId = @EducationOrganizationId
			AND StudentUSI=@StudentUSI
			AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] (
				[EducationOrganizationId] ,[StudentCharacteristicDescriptorId] ,[StudentUSI] ,[CreateDate]
			) VALUES (
				@EducationOrganizationId ,@StudentCharacteristicDescriptorId ,@StudentUSI ,GETDATE()
			)
		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] WHERE 
			BeginDate = @BeginDate
			AND EducationOrganizationId = @EducationOrganizationId
			AND StudentUSI=@StudentUSI
			AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] (
				[BeginDate] ,[EducationOrganizationId] ,[StudentCharacteristicDescriptorId] ,[StudentUSI] ,[EndDate] ,[CreateDate]
			) VALUES (
				@BeginDate ,@EducationOrganizationId ,@StudentCharacteristicDescriptorId ,@StudentUSI ,NULL ,GETDATE()
			)

		-- LEP status
		SELECT @LimitedEnglishProficiencyDescriptorId = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
		WHERE Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor' AND CodeValue = 'Limited'
		UPDATE edfi.StudentEducationOrganizationAssociation
		SET LimitedEnglishProficiencyDescriptorId = @LimitedEnglishProficiencyDescriptorId
		WHERE StudentUSI = @StudentUSI
		--==========================================================================================================

		SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = @NameSpace AND CodeValue = 'Native Hawaiian - Pacific Islander'
		SET @StudentUSI=21984
		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace]
			WHERE EducationOrganizationId = @EducationOrganizationId AND StudentUSI = @StudentUSI)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace] (
				[EducationOrganizationId]
				,[StudentUSI]
				,[CreateDate]
				,[RaceDescriptorId]
			) VALUES (
				@EducationOrganizationId
				,@StudentUSI
				,GETDATE()
				,@RaceDescriptorId
			)

		SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = @NameSpace AND CodeValue = 'American Indian - Alaska Native'
		SET @StudentUSI=21777
		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace]
			WHERE EducationOrganizationId = @EducationOrganizationId AND StudentUSI = @StudentUSI)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace] (
				[EducationOrganizationId]
				,[StudentUSI]
				,[CreateDate]
				,[RaceDescriptorId]
			) VALUES (
				@EducationOrganizationId
				,@StudentUSI
				,GETDATE()
				,@RaceDescriptorId
			)
		SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = @NameSpace AND CodeValue = 'Asian'
		SET @StudentUSI=22110
		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace]
			WHERE EducationOrganizationId = @EducationOrganizationId AND StudentUSI = @StudentUSI)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace] (
				[EducationOrganizationId]
				,[StudentUSI]
				,[CreateDate]
				,[RaceDescriptorId]
			) VALUES (
				@EducationOrganizationId
				,@StudentUSI
				,GETDATE()
				,@RaceDescriptorId
			)

		SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
		WHERE Namespace = @NameSpace AND CodeValue = 'Black - African American'
		SET @StudentUSI=22144
		IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace]
			WHERE EducationOrganizationId = @EducationOrganizationId AND StudentUSI = @StudentUSI)
			INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace] (
				[EducationOrganizationId]
				,[StudentUSI]
				,[CreateDate]
				,[RaceDescriptorId]
			) VALUES (
				@EducationOrganizationId
				,@StudentUSI
				,GETDATE()
				,@RaceDescriptorId
			)