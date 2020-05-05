	
	-- FS203 TEST DATA ==========================================================
	
	-- add extension records
	DECLARE @BeginDate DATE, @EducationOrganizationId INT, @StaffClassificationDescriptorId INT, @StaffUSI INT
	DECLARE @InexperiencedStatusDescriptorId INT, @EmergencyorProvisionalCredentialStatusDescriptorId INT, @OutOfFieldStatusDescriptorId INT

	SET @BeginDate = '1980-11-16'
	SET @EducationOrganizationId = 255901012
	SET @StaffUSI = 1334

	SELECT @StaffClassificationDescriptorId = DescriptorId FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/StaffClassificationDescriptor'
			AND edfi.Descriptor.CodeValue = 'Teacher'

	SELECT @InexperiencedStatusDescriptorId = DescriptorId FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/InexperiencedStatusDescriptor'
			AND edfi.Descriptor.CodeValue = 'TCHEXPRNCD'

	SELECT @EmergencyorProvisionalCredentialStatusDescriptorId = DescriptorId FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/EmergencyorProvisionalCredentialStatusDescriptor'
			AND edfi.Descriptor.CodeValue = 'TCHWEMRPRVCRD'

	SELECT @OutOfFieldStatusDescriptorId = DescriptorId FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/OutOfFieldStatusDescriptor'
			AND edfi.Descriptor.CodeValue = 'TCHINFLD'

	IF NOT EXISTS (SELECT * FROM extension.StaffEducationOrganizationAssignmentAssociationExtension
		WHERE BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganizationId
		AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
		AND StaffUSI = @StaffUSI)
			INSERT INTO extension.StaffEducationOrganizationAssignmentAssociationExtension (
				BeginDate
				,EducationOrganizationId
				,StaffClassificationDescriptorId
				,StaffUSI
				,InexperiencedStatusDescriptorId
				,EmergencyorProvisionalCredentialStatusDescriptorId
				,OutOfFieldStatusDescriptorId
				,RecordStartDateTime
				,RecordEndDateTime
				,CreateDate
			) VALUES (
				@BeginDate
				,@EducationOrganizationId
				,@StaffClassificationDescriptorId
				,@StaffUSI
				,@InexperiencedStatusDescriptorId
				,@EmergencyorProvisionalCredentialStatusDescriptorId
				,@OutOfFieldStatusDescriptorId
				,'07/01/2017'
				,NULL
				,GETDATE()
			)
	ELSE 
		UPDATE extension.StaffEducationOrganizationAssignmentAssociationExtension
		SET InexperiencedStatusDescriptorId=@InexperiencedStatusDescriptorId
		,EmergencyorProvisionalCredentialStatusDescriptorId=@EmergencyorProvisionalCredentialStatusDescriptorId
		,OutOfFieldStatusDescriptorId = @OutOfFieldStatusDescriptorId
		WHERE BeginDate = @BeginDate
			AND EducationOrganizationId = @EducationOrganizationId
			AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
			AND StaffUSI = @StaffUSI


-- FS206 TEST DATA -------------------------------------------------------

	IF NOT EXISTS (SELECT 1 FROM [extension].[CedsSchoolComprehensiveAndTargetedSupport] WHERE SchoolId = 255901001)
	INSERT INTO [extension].[CedsSchoolComprehensiveAndTargetedSupport]
			   (
				[SchoolId]
			   ,[ComprehensiveAndTargetedSupportDescriptorId]
			   ,[ComprehensiveSupportDescriptorId]
			   ,[TargetedSupportDescriptorId]
			   )
	SELECT 255901001
 		  , (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ComprehensiveAndTargetedSupportDescriptor' And CodeValue ='CSI') ComprehensiveAndTargetedSupportDescriptor
		   , (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ComprehensiveSupportDescriptor' And CodeValue ='CSILOWPERF') ComprehensiveSupportDescriptor
		   ,NULL TargetedSupportDescriptor
	GO

	IF NOT EXISTS (SELECT 1 FROM [extension].[CedsSchoolComprehensiveAndTargetedSupport] WHERE SchoolId = 255901002)
	INSERT INTO [extension].[CedsSchoolComprehensiveAndTargetedSupport]
			   (
				[SchoolId]
			   ,[ComprehensiveAndTargetedSupportDescriptorId]
			   ,[ComprehensiveSupportDescriptorId]
			   ,[TargetedSupportDescriptorId]
			   )
	SELECT 255901002
 		  , (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ComprehensiveAndTargetedSupportDescriptor' And CodeValue ='TSI') ComprehensiveAndTargetedSupportDescriptor
		   ,NULL ComprehensiveSupportDescriptorId
		   , (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/TargetedSupportDescriptor' And CodeValue ='TSIUNDER') TargetedSupportDescriptor
	GO

	

-- FS200 TEST DATA FOR SCHOOL
	DECLARE @SchoolYear INT = 2018, @SchoolId INT = 255901007
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
		AND edfi.Descriptor.CodeValue = 'AcademicAchievementIndicatorStatus'

	SELECT @StatedDefinedIndicatorStatus = 'green'
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
	-- EconomicallyDisadvantagedStatus==================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'ECODIS'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'EconomicallyDisadvantagedStatus'
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

	-- DisabilityStatus==================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MW'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'DisabilityStatus'
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

	-- RaceEthnicity==================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MW'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'RaceEthnicity'
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

	-- AllStudents==================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MW'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'AllStudents'
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

	
-- FS201 TEST DATA FOR SCHOOL

	SET @SchoolId = 255901007

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
		AND edfi.Descriptor.CodeValue = 'OtherAcademicIndicatorStatus'

	SELECT @StatedDefinedIndicatorStatus = 'yellow'
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
	
	-- EconomicallyDisadvantagedStatus ====================================
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

	-- RaceEthnicity ====================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MA'

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

	-- DisabilityStatus ====================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MA'

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

	-- AllStudents ====================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MA'

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
	
	
	--FS202 TEST DATA
	SET @SchoolYear = 2018
	SET @SchoolId = 255901001
	
	truncate table extension.StateDefinedCustomIndicator

	-- Populate extension.StateDefinedCustomIndicator
	
	IF NOT EXISTS (SELECT * FROM extension.StateDefinedCustomIndicator WHERE Code = 'IND01'
		AND SchoolYear = @SchoolYear
	)
		INSERT INTO extension.StateDefinedCustomIndicator (
			StatedDefinedCustomIndicatorId
			,SchoolYear
			,[Code]
			,[Definition]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			1
			,@SchoolYear
			,'IND01'
			,'IND01'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)

	IF NOT EXISTS (SELECT * FROM extension.StateDefinedCustomIndicator WHERE Code = 'IND02' AND SchoolYear = @SchoolYear)
		INSERT INTO extension.StateDefinedCustomIndicator (
			StatedDefinedCustomIndicatorId
			,SchoolYear
			,[Code]
			,[Definition]
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			2
			,@SchoolYear
			,'IND02'
			,'IND02'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)



	DECLARE @StatedDefinedIndicatorStatus1 NVARCHAR(100), 
	@StatedDefinedIndicatorStatus2 NVARCHAR(100), 
	@StatedDefinedCustomIndicatorStatusType1 NVARCHAR(100) = 'IND01', 
	@StatedDefinedCustomIndicatorStatusType2 NVARCHAR(100) = 'IND02'

	SET @SchoolId = 255901001

	-- initialize FS202
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
		AND edfi.Descriptor.CodeValue = 'SchoolQualityOrStudentSuccessIndicatorStatus'

	SELECT @StatedDefinedIndicatorStatus1 = 'red'

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
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus1
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType1)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus1
			,@StatedDefinedCustomIndicatorStatusType1
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	
	SELECT @StatedDefinedIndicatorStatus2 = 'purple'

	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus2
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType2)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus2
			,@StatedDefinedCustomIndicatorStatusType2
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
		-- ECODIS EconomicallyDisadvantaged ============================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'ECODIS'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'EconomicallyDisadvantagedStatus'

	SELECT @StatedDefinedIndicatorStatus1 = 'red'

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
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus1
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType1)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus1
			,@StatedDefinedCustomIndicatorStatusType1
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	
	SELECT @StatedDefinedIndicatorStatus2 = 'purple'

	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus2
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType2)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus2
			,@StatedDefinedCustomIndicatorStatusType2
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)

	-- RaceEthnicity

	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MW'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'RaceEthnicity'

	SELECT @StatedDefinedIndicatorStatus1 = 'red'

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
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus1
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType1)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus1
			,@StatedDefinedCustomIndicatorStatusType1
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	
	SELECT @StatedDefinedIndicatorStatus2 = 'purple'

	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus2
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType2)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus2
			,@StatedDefinedCustomIndicatorStatusType2
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)

	-- DisabilityStatus ====================================

	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MW'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'DisabilityStatus'

	SELECT @StatedDefinedIndicatorStatus1 = 'red'

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
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus1
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType1)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus1
			,@StatedDefinedCustomIndicatorStatusType1
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	
	SELECT @StatedDefinedIndicatorStatus2 = 'purple'

	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus2
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType2)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus2
			,@StatedDefinedCustomIndicatorStatusType2
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)


	-- AllStudents ================================================
	SELECT @IndicatorStatusSubgroupDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		AND edfi.Descriptor.CodeValue = 'MW'

	SELECT @IndicatorStatusSubgroupTypeDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'AllStudents'

	SELECT @StatedDefinedIndicatorStatus1 = 'red'

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
	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus1
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType1)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus1
			,@StatedDefinedCustomIndicatorStatusType1
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	
	SELECT @StatedDefinedIndicatorStatus2 = 'purple'

	IF NOT EXISTS(SELECT * FROM extension.CedsSchoolCustomIndicatorStatusType WHERE
					IndicatorStatusDescriptorId = @IndicatorStatusDescriptorId
					AND IndicatorStatusSubgroupDescriptorId=@IndicatorStatusSubgroupDescriptorId
					AND IndicatorStatusSubgroupTypeDescriptorId=@IndicatorStatusSubgroupTypeDescriptorId
					AND IndicatorStatusTypeDescriptorId=@IndicatorStatusTypeDescriptorId
					AND SchoolId=@SchoolId
					AND StatedDefinedIndicatorStatus=@StatedDefinedIndicatorStatus2
					AND StatedDefinedCustomIndicatorStatusType=@StatedDefinedCustomIndicatorStatusType2)
		INSERT INTO extension.CedsSchoolCustomIndicatorStatusType (
			[IndicatorStatusDescriptorId]
			,[IndicatorStatusSubgroupDescriptorId]
			,[IndicatorStatusSubgroupTypeDescriptorId]
			,[IndicatorStatusTypeDescriptorId]
			,[SchoolId]
			,[StatedDefinedIndicatorStatus]
			,[StatedDefinedCustomIndicatorStatusType]
			,RecordStartDateTime
			,[CreateDate]
			,[LastModifiedDate]
			,[Id]
		) VALUES (
			@IndicatorStatusDescriptorId
			,@IndicatorStatusSubgroupDescriptorId
			,@IndicatorStatusSubgroupTypeDescriptorId
			,@IndicatorStatusTypeDescriptorId
			,@SchoolId
			,@StatedDefinedIndicatorStatus2
			,@StatedDefinedCustomIndicatorStatusType2
			,'07/01/2017'
			,GETDATE()
			,GETDATE()
			,NEWID()
		)


	