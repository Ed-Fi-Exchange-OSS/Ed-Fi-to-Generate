-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


	-- FS119

	DECLARE @EducationOrganizationId INT=255901, @ProgramName VARCHAR(100) = 'NoD Program'
	, @ProgramId VARCHAR(100) = '2559010_09', @ProgramTypeDescriptorId INT
	, @StudentUSI INT = 21658
	, @BeginDate DATETIME = '2010-08-30'
	, @NeglectedOrDelinquentProgramDescriptorId INT
	, @DisplacementTypeDescriptorId INT


	SELECT @ProgramTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue='Neglected and Delinquent Program'

	SELECT @NeglectedOrDelinquentProgramDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/NeglectedOrDelinquentProgramDescriptor' AND CodeValue='Adult Corrections'

	SELECT @DisplacementTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue='POSTSEC'

	-- create NoD program
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

	-- create general student program association to NoD program
	--[edfi].[GeneralStudentProgramAssociation]
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

	-- add into StudentNeglectedOrDelinquentProgramAssociation
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentNeglectedOrDelinquentProgramAssociation] WHERE 
				EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
		BEGIN
			INSERT INTO [edfi].[StudentNeglectedOrDelinquentProgramAssociation] (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,NeglectedOrDelinquentProgramDescriptorId
			) VALUES (
				@BeginDate
				,@EducationOrganizationId
				,@EducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,@NeglectedOrDelinquentProgramDescriptorId
			)
		END

	-- add into extension.CedsStudentNoDProgramAssociation
	IF NOT EXISTS (SELECT * FROM extension.CedsStudentNoDProgramAssociation WHERE 
				EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
		BEGIN
			INSERT INTO extension.CedsStudentNoDProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,DisplacementTypeDescriptorId
				,CreateDate
				,LastModifiedDate
			) VALUES (
				@BeginDate
				,@EducationOrganizationId
				,@EducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,@DisplacementTypeDescriptorId
				,GetDate()
				,GetDate()
			)
		END


	-- set diploma type to 'General Educational Development (GED) credential'
	DECLARE @DiplomaTypeDescriptorId INT

	SELECT @DiplomaTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/DiplomaTypeDescriptor' 
		AND CodeValue='General Educational Development (GED) credential'

	UPDATE [edfi].[StudentAcademicRecordDiploma]
	SET DiplomaTypeDescriptorId = @DiplomaTypeDescriptorId
	WHERE StudentUSI=@StudentUSI


	--FS127
	SET @EducationOrganizationId = 255901
	SET @ProgramName = 'NoD Program'
	SET @ProgramId = '2559010_09'
	SET @StudentUSI = 10812
	SET @BeginDate = '2010-08-30'

	SELECT @ProgramTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue='Neglected and Delinquent Program'

	SELECT @NeglectedOrDelinquentProgramDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/NeglectedOrDelinquentProgramDescriptor' AND CodeValue='Juvenile Corrections'

	SELECT @DisplacementTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue='POSTSEC'

	-- create NoD program
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

	-- create general student program association to NoD program
	--[edfi].[GeneralStudentProgramAssociation]
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

	-- add into StudentNeglectedOrDelinquentProgramAssociation
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentNeglectedOrDelinquentProgramAssociation] WHERE 
				EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
		BEGIN
			INSERT INTO [edfi].[StudentNeglectedOrDelinquentProgramAssociation] (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,NeglectedOrDelinquentProgramDescriptorId
			) VALUES (
				@BeginDate
				,@EducationOrganizationId
				,@EducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,@NeglectedOrDelinquentProgramDescriptorId
			)
		END

	-- add into extension.CedsStudentNoDProgramAssociation
	IF NOT EXISTS (SELECT * FROM extension.CedsStudentNoDProgramAssociation WHERE 
				EducationOrganizationId=@EducationOrganizationId
				AND ProgramEducationOrganizationId=@EducationOrganizationId
				AND ProgramName=@ProgramName
				AND ProgramTypeDescriptorId=@ProgramTypeDescriptorId
				AND StudentUSI=@StudentUSI)
		BEGIN
			INSERT INTO extension.CedsStudentNoDProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,DisplacementTypeDescriptorId
				,CreateDate
				,LastModifiedDate
			) VALUES (
				@BeginDate
				,@EducationOrganizationId
				,@EducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				,@StudentUSI
				,@DisplacementTypeDescriptorId
				,GetDate()
				,GetDate()
			)
		END


	-- set diploma type to 'General Educational Development (GED) credential'
	DECLARE @DiplomaTypeDescriptorId INT

	SELECT @DiplomaTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace = 'uri://ed-fi.org/DiplomaTypeDescriptor' 
		AND CodeValue='General Educational Development (GED) credential'

	UPDATE [edfi].[StudentAcademicRecordDiploma]
	SET DiplomaTypeDescriptorId = @DiplomaTypeDescriptorId
	WHERE StudentUSI=@StudentUSI