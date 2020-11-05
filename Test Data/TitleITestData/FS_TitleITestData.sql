-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.



	DECLARE @CedsLocalEducationAgencyId INT = 255901
	DECLARE @EducationOrganizationId INT = 255901
	DECLARE @ProgramEducationOrganizationId INT = 255901
	DECLARE @ProgramName NVARCHAR(60) = 'Title I Part A'
	DECLARE @ProgramId NVARCHAR(20) = '2559010_08'
	DECLARE @ProgramTypeDescriptorId INT

	--=====================================================================
	-- Convert school as Title I school
	DECLARE @SchoolId INT = 255901001
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

	SELECT @TitleIinstructionalServiceDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000282' AND CodeValue = 'Mathematics'
	SELECT @TitleIProgramTypeDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000284' AND CodeValue = 'TargetedAssistanceProgram'
	SELECT @K12LeaTitleISupportServiceDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000289' AND CodeValue = 'HealthDentalEyeCare'

	IF NOT EXISTS (SELECT * FROM extension.CedsLocalEducationAgency WHERE CedsLocalEducationAgencyId = @CedsLocalEducationAgencyId)
		INSERT INTO extension.CedsLocalEducationAgency (
			[CedsLocalEducationAgencyId]
			--,[LocalEducationAgencyTypeDescriptorId]
			,[LocalEducationAgencyId]
			,[TitleIinstructionalServiceDescriptorId]
			,[TitleIProgramTypeDescriptorId]
			,[K12LeaTitleISupportServiceDescriptorId]
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
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	ELSE 
		UPDATE extension.CedsLocalEducationAgency
		SET [TitleIinstructionalServiceDescriptorId] = [TitleIinstructionalServiceDescriptorId]
		, [TitleIProgramTypeDescriptorId] = @TitleIProgramTypeDescriptorId
		, [K12LeaTitleISupportServiceDescriptorId] = @K12LeaTitleISupportServiceDescriptorId
		WHERE CedsLocalEducationAgencyId = @CedsLocalEducationAgencyId
	--=====================================================================

	SELECT @ProgramTypeDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue = 'Title I Part A'

	DECLARE @BeginDate DATE = '7/1/2017'
	DECLARE @StudentUSI INT	= 21840
	DECLARE @TitleIPartAParticipantDescriptorId INT

	SELECT @TitleIPartAParticipantDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'uri://ed-fi.org/TitleIPartAParticipantDescriptor' AND CodeValue = 'Public Schoolwide Program'


	-- create general student to titleI program association
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
	IF NOT EXISTS (SELECT * FROM edfi.StudentTitleIPartAProgramAssociation WHERE 
		BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganizationId
		AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
		AND ProgramName = @ProgramName
		AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
		AND StudentUSI = @StudentUSI
		AND TitleIPartAParticipantDescriptorId = @TitleIPartAParticipantDescriptorId
		)
		INSERT INTO edfi.StudentTitleIPartAProgramAssociation (
			[BeginDate]
			,[EducationOrganizationId]
			,[ProgramEducationOrganizationId]
			,[ProgramName]
			,[ProgramTypeDescriptorId]
			,[StudentUSI]
			,[TitleIPartAParticipantDescriptorId]
		) VALUES (
			@BeginDate
			,@EducationOrganizationId
			,@ProgramEducationOrganizationId
			,@ProgramName
			,@ProgramTypeDescriptorId
			,@StudentUSI
			,@TitleIPartAParticipantDescriptorId
		)

	-- ========== make a student IDEA
	DECLARE @DisabilityDescriptorId INT
	DECLARE @DisabilityDeterminationSourceTypeDescriptorId INT

	select @DisabilityDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'MD'
			and Namespace = 'uri://ed-fi.org/DisabilityDescriptor'

	select @DisabilityDeterminationSourceTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'By health care provider'
			and Namespace = 'uri://ed-fi.org/DisabilityDeterminationSourceTypeDescriptor'


	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociationDisability
		WHERE DisabilityDescriptorId = @DisabilityDescriptorId
		AND EducationOrganizationId=@EducationOrganizationId
		AND StudentUSI=@StudentUSI)
		INSERT INTO edfi.StudentEducationOrganizationAssociationDisability (
			[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[StudentUSI]
			,[CreateDate]
			,[DisabilityDeterminationSourceTypeDescriptorId]
		) VALUES (
			@DisabilityDescriptorId
			,@EducationOrganizationId
			,@StudentUSI
			, GETDATE()
			,@DisabilityDeterminationSourceTypeDescriptorId
		)

	-- add homeless attribute

		declare @HomelessPrimaryNighttimeResidenceDescriptorId int

		select @ProgramTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Homeless'
			and Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'
		select @EducationOrganizationId = 255901
		select @ProgramEducationOrganizationId = 255901
		select @ProgramName = 'Homeless'
		select @HomelessPrimaryNighttimeResidenceDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Shelters'
			and Namespace = 'uri://ed-fi.org/HomelessPrimaryNighttimeResidenceDescriptor'
		select @StudentUSI = 21840

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


	

	-- FS193 Title I Allocations
	SET @EducationOrganizationId = 255901
	DECLARE @REAPAlternativeFundingStatusDescriptorId INT
	DECLARE @Namespace VARCHAR(100)
	DECLARE @CodeValue VARCHAR(100)
	DECLARE @FederalProgramFundingAllocationTypeId INT

	-- [extension].[FederalProgramFundingAllocationTypeDescriptor]
	SELECT @FederalProgramFundingAllocationTypeId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = 'https://ceds.ed.gov/element/000548' AND CodeValue = 'RETAINED'

	DECLARE @FederalProgramCode NVARCHAR(100) = '84.010'
	DECLARE @FederalProgramsFundingAllocation MONEY	= 10843.31
	DECLARE @ParentalInvolvmementReservationFunds MONEY = 500

	SELECT @REAPAlternativeFundingStatusDescriptorId = DescriptorId FROM edfi.Descriptor WHERE 
		Namespace = @Namespace AND CodeValue = 'Yes'

	-- populate extension table if not exists
	IF NOT EXISTS (SELECT * FROM extension.EducationOrganizationFederalFunding WHERE
		EducationOrganizationId = @EducationOrganizationId
		)
		INSERT INTO extension.EducationOrganizationFederalFunding (
			[EducationOrganizationId]
			,[FederalProgramCode]
			,[FederalProgramsFundingAllocation]
			,[ParentalInvolvmementReservationFunds]
			,[REAPAlternativeFundingStatusDescriptorId]
			,FederalProgramFundingAllocationTypeDescriptorId
		) VALUES (
			@EducationOrganizationId
			,@FederalProgramCode
			,@FederalProgramsFundingAllocation
			,@ParentalInvolvmementReservationFunds
			,@REAPAlternativeFundingStatusDescriptorId
			,@FederalProgramFundingAllocationTypeId
		)
	ELSE 
		UPDATE extension.EducationOrganizationFederalFunding
		SET FederalProgramCode = @FederalProgramCode
		,FederalProgramsFundingAllocation = @FederalProgramsFundingAllocation
		,ParentalInvolvmementReservationFunds  =@ParentalInvolvmementReservationFunds
		,FederalProgramFundingAllocationTypeDescriptorId = @FederalProgramFundingAllocationTypeId
		WHERE EducationOrganizationId = @EducationOrganizationId