-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


	DECLARE @REAPAlternativeFundingStatusDescriptorId INT, @EducationOrganizationId INT
	SET @EducationOrganizationId = 255901

	select @REAPAlternativeFundingStatusDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Yes'
		and Namespace = 'https://ceds.ed.gov/element/000560'

	IF NOT EXISTS (SELECT * FROM extension.REAPAlternativeFundingStatusDescriptor WHERE REAPAlternativeFundingStatusDescriptorId=@REAPAlternativeFundingStatusDescriptorId)
		INSERT INTO extension.REAPAlternativeFundingStatusDescriptor (
			REAPAlternativeFundingStatusDescriptorId
		) VALUES (
			@REAPAlternativeFundingStatusDescriptorId
		)

	IF NOT EXISTS (SELECT * FROM extension.EducationOrganizationFederalFunding 
		WHERE EducationOrganizationId=@EducationOrganizationId)
		INSERT INTO extension.EducationOrganizationFederalFunding (
			EducationOrganizationId
			,FederalProgramCode
			,FederalProgramsFundingAllocation
			,ParentalInvolvmementReservationFunds
			,REAPAlternativeFundingStatusDescriptorId
		) VALUES (
			@EducationOrganizationId
			,''
			,''
			,''
			,@REAPAlternativeFundingStatusDescriptorId
		)
	ELSE
		UPDATE extension.EducationOrganizationFederalFunding
		SET REAPAlternativeFundingStatusDescriptorId = @REAPAlternativeFundingStatusDescriptorId
		WHERE EducationOrganizationId = @EducationOrganizationId


	

	-- TEST DATA FOR FS160 High School Graduates Postsecondary Enrollment
	-- INSERT test data into edfi.PostSecondaryEvent table

	DECLARE @PostSecondaryEventCategoryDescriptorId INT
	DECLARE @StudentUSI INT = 21631
	DECLARE @EventDate DATE = '6/30/2018'
	DECLARE @DiplomaTypeDescriptorId INT

	SELECT @PostSecondaryEventCategoryDescriptorId = DescriptorID FROM [edfi].Descriptor
	WHERE Namespace = 'uri://ed-fi.org/PostSecondaryEventCategoryDescriptor'
	AND CodeValue = 'College Enrollment'

	IF NOT EXISTS (SELECT * FROM edfi.PostSecondaryEvent WHERE 
					StudentUSI = @StudentUSI
					AND EventDate = @EventDate
					AND PostSecondaryEventCategoryDescriptorId = @PostSecondaryEventCategoryDescriptorId)
		INSERT INTO edfi.PostSecondaryEvent (
			[StudentUSI]
			,[EventDate]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[PostSecondaryEventCategoryDescriptorId]
		) VALUES (
			@StudentUSI
			,@EventDate
			,NEWID()
			,GETDATE()
			,GETDATE()
			,@PostSecondaryEventCategoryDescriptorId
		)


	SELECT @DiplomaTypeDescriptorId = DescriptorID FROM [edfi].Descriptor
	WHERE Namespace = 'uri://ed-fi.org/DiplomaTypeDescriptor'
	AND CodeValue = 'Regular diploma'

	IF EXISTS (SELECT * FROM [edfi].[StudentAcademicRecordDiploma] WHERE StudentUSI = 21631)
		UPDATE [edfi].[StudentAcademicRecordDiploma]
		SET DiplomaTypeDescriptorId = @DiplomaTypeDescriptorId
		,DiplomaAwardDate = '8/12/2017'
		WHERE StudentUSI = 21631


	

	-- create test data for FS163 - gun free school
	-- LEA - insert LEA record into [edfi].[LocalEducationAgencyAccountability]
	DECLARE @LocalEducationAgencyId INT = 255901
	DECLARE @SchoolYear INT = 2018
	DECLARE @GunFreeSchoolsActReportingStatusDescriptorId INT
	DECLARE @SchoolChoiceImplementStatusDescriptorId INT

	SELECT @SchoolChoiceImplementStatusDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/SchoolChoiceImplementStatusDescriptor'
	AND CodeValue = 'Implemented at all grade levels'

	SELECT @GunFreeSchoolsActReportingStatusDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/GunFreeSchoolsActReportingStatusDescriptor'
	AND CodeValue = 'No'


	IF NOT EXISTS (SELECT * FROM [edfi].[LocalEducationAgencyAccountability] WHERE LocalEducationAgencyId = @LocalEducationAgencyId
					AND SchoolYear = @SchoolYear)
		INSERT INTO [edfi].[LocalEducationAgencyAccountability] (
			[LocalEducationAgencyId]
			,[SchoolYear]
			,[CreateDate]
			,[GunFreeSchoolsActReportingStatusDescriptorId]
			,[SchoolChoiceImplementStatusDescriptorId]
		) VALUES (
			@LocalEducationAgencyId
			,@SchoolYear
			,GETDATE()
			,@GunFreeSchoolsActReportingStatusDescriptorId
			,@SchoolChoiceImplementStatusDescriptorId
		)
		ELSE 
			UPDATE [edfi].[LocalEducationAgencyAccountability]
			SET [GunFreeSchoolsActReportingStatusDescriptorId] = @GunFreeSchoolsActReportingStatusDescriptorId
			,[SchoolChoiceImplementStatusDescriptorId]=@SchoolChoiceImplementStatusDescriptorId
			WHERE LocalEducationAgencyId = @LocalEducationAgencyId
				AND SchoolYear = @SchoolYear


	-- School - insert extension table record [extension].CedsSchoolAccountability
	SELECT @GunFreeSchoolsActReportingStatusDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/GunFreeSchoolsActReportingStatusDescriptor'
	AND CodeValue = 'Yes, with one or more student offenses'

	DECLARE @SchoolId INT = 255901107
	IF NOT EXISTS (SELECT * FROM [extension].CedsSchoolAccountability
			WHERE SchoolId = @SchoolId AND SchoolYear = @SchoolYear)
		INSERT INTO [extension].CedsSchoolAccountability (
			[SchoolId]
			,[SchoolYear]
			,[GunFreeSchoolsActReportingStatusDescriptorId]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@SchoolId
			,@SchoolYear
			,@GunFreeSchoolsActReportingStatusDescriptorId
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	ELSE
		UPDATE [extension].CedsSchoolAccountability
		SET GunFreeSchoolsActReportingStatusDescriptorId = @GunFreeSchoolsActReportingStatusDescriptorId
		WHERE SchoolId = @SchoolId
		AND SchoolYear=@SchoolYear

	SELECT @GunFreeSchoolsActReportingStatusDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/GunFreeSchoolsActReportingStatusDescriptor'
	AND CodeValue = 'Yes, with no reported offenses'

	SET @SchoolId = 255901001
	IF NOT EXISTS (SELECT * FROM [extension].CedsSchoolAccountability
			WHERE SchoolId = @SchoolId AND SchoolYear = @SchoolYear)
		INSERT INTO [extension].CedsSchoolAccountability (
			[SchoolId]
			,[SchoolYear]
			,[GunFreeSchoolsActReportingStatusDescriptorId]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@SchoolId
			,@SchoolYear
			,@GunFreeSchoolsActReportingStatusDescriptorId
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	ELSE
		UPDATE [extension].CedsSchoolAccountability
		SET GunFreeSchoolsActReportingStatusDescriptorId = @GunFreeSchoolsActReportingStatusDescriptorId
		WHERE SchoolId = @SchoolId
		AND SchoolYear=@SchoolYear

	-- FS199 TEST DATA FOR SCHOOL

	SET @SchoolYear = 2018 
	SET @SchoolId = 255901007
	DECLARE @IndicatorStatusDescriptorId INT, 
	@IndicatorStatusSubgroupDescriptorId INT, 
	@IndicatorStatusSubgroupTypeDescriptorId INT,
	@IndicatorStatusTypeDescriptorId INT,
	@StatedDefinedIndicatorStatus NVARCHAR(100)

	SELECT @IndicatorStatusDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor'
		AND edfi.Descriptor.CodeValue = 'STTDEF'

	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'LEP'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'EnglishLearnerStatus'

	SELECT @IndicatorStatusTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'GraduationRateIndicatorStatus'

	SELECT @StatedDefinedIndicatorStatus = 'blue'
	print @IndicatorStatusTypeDescriptorId
	-- populate join table for statuses
	IF NOT EXISTS (SELECT * FROM extension.IndicatorStatusDescriptor WHERE IndicatorStatusDescriptorId=@IndicatorStatusDescriptorId)
		INSERT INTO extension.IndicatorStatusDescriptor (
			IndicatorStatusDescriptorId
		) VALUES (
			@IndicatorStatusDescriptorId
		)

	IF NOT EXISTS (SELECT * FROM extension.IndicatorStatusSubgroupDescriptor WHERE IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId)
		INSERT INTO extension.IndicatorStatusSubgroupDescriptor (
			IndicatorStatusSubgroupDescriptorId
		) VALUES (
			@IndicatorStatusSubgroupDescriptorId
		)
	IF NOT EXISTS (SELECT * FROM extension.IndicatorStatusSubgroupTypeDescriptor WHERE IndicatorStatusSubgroupTypeDescriptorID=@IndicatorStatusSubgroupTypeDescriptorId)
		INSERT INTO extension.IndicatorStatusSubgroupTypeDescriptor (
			IndicatorStatusSubgroupTypeDescriptorID
		) VALUES (
			@IndicatorStatusSubgroupTypeDescriptorId
		)

	IF NOT EXISTS (SELECT * FROM extension.IndicatorStatusTypeDescriptor WHERE IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId)
		INSERT INTO extension.IndicatorStatusTypeDescriptor (
			IndicatorStatusTypeDescriptorId
		) VALUES (
			@IndicatorStatusTypeDescriptorId
		)

	-- populate ceds school custom extension records
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolIndicatorStatus WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus)
		INSERT INTO extension.CedsSchoolIndicatorStatus (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[RecordStartDateTime]
			,[RecordEndDateTime]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus
			,'7/10/2017'
			,NULL
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	
	-- EconomicallyDisadvantagedStatus ================================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'ECODIS'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'EconomicallyDisadvantagedStatus'
	
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolIndicatorStatus WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus)
		INSERT INTO extension.CedsSchoolIndicatorStatus (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[RecordStartDateTime]
			,[RecordEndDateTime]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus
			,'7/10/2017'
			,NULL
			,GETDATE()
			,GETDATE()
			,NEWID()
		)

	-- DisabilityStatus ================================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MB'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'DisabilityStatus'
	
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolIndicatorStatus WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus)
		INSERT INTO extension.CedsSchoolIndicatorStatus (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[RecordStartDateTime]
			,[RecordEndDateTime]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus
			,'7/10/2017'
			,NULL
			,GETDATE()
			,GETDATE()
			,NEWID()
		)

	-- RaceEthnicity ================================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MB'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'RaceEthnicity'
	
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolIndicatorStatus WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus)
		INSERT INTO extension.CedsSchoolIndicatorStatus (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[RecordStartDateTime]
			,[RecordEndDateTime]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus
			,'7/10/2017'
			,NULL
			,GETDATE()
			,GETDATE()
			,NEWID()
		)

	-- AllStudents ================================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MB'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'AllStudents'
	
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolIndicatorStatus WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus)
		INSERT INTO extension.CedsSchoolIndicatorStatus (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[RecordStartDateTime]
			,[RecordEndDateTime]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus
			,'7/10/2017'
			,NULL
			,GETDATE()
			,GETDATE()
			,NEWID()
		)