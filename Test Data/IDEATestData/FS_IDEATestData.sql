	
	USE [EdFi_Sample_ODS_Data_For_Generate]

	-- FS002 =================================================================================================================

	DECLARE @RaceDescriptorId INT

	-- create test data for FS002 - two records
	DECLARE @BeginDate DATE = '2010-09-01'

	-- insert into edfi.StudentSpecialEducationProgramAssociationDisability
	DECLARE @StudentUSI INT
	-- 21681, 21829

	DECLARE @EducationOrganizationID INT = 255901
	-- 255901

	DECLARE @ProgramEducationOrganizationId INT = 255901

	DECLARE @DisabilityDescriptorId_1 INT, @DisabilityDescriptorId_2 INT
	-- Autism, Hearing impairment
	DECLARE @DisabilityDescriptorId INT

	SELECT @DisabilityDescriptorId_1 = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue='AUT'

	SELECT @DisabilityDescriptorId_2 = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue='HI'

	DECLARE @DisabilityDeterminationSourceTypeDescriptorId INT
	-- By health care provider

	DECLARE @ProgramName NVARCHAR(60) = 'Special Education'

	DECLARE @ProgramTypeDescriptorId INT

	SELECT @DisabilityDeterminationSourceTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDeterminationSourceTypeDescriptor' AND CodeValue='By health care provider'

	SELECT @ProgramTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue='Special Education'

	-- create records in edfi.StudentEducationOrganizationAssociation if not exists
	DECLARE @SexDescriptorId INT
	DECLARE @HispanicLatinoEthnicity BIT
	SET @StudentUSI = 21681			-- 604872

	SELECT @SexDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/SexDescriptor' AND CodeValue='Female'

	-- insert record 1
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociation WHERE
		StudentUSI=@StudentUSI
		AND EducationOrganizationId=@EducationOrganizationID)
		INSERT INTO edfi.StudentEducationOrganizationAssociation (
			[StudentUSI]
			,[EducationOrganizationId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[HispanicLatinoEthnicity]
			,[SexDescriptorId]
		) VALUES (
			@StudentUSI
			,@EducationOrganizationID
			,NEWID()
			,GETDATE()
			,GETDATE()
			,0
			,@SexDescriptorId
		)

	-- insert record 2
	SET @StudentUSI = 21829				-- 605020
	--SELECT @SexDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	--WHERE Namespace LIKE 'uri://ed-fi.org/SexDescriptor' AND CodeValue='Male'
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociation WHERE
		StudentUSI=@StudentUSI
		AND EducationOrganizationId=@EducationOrganizationID)
		INSERT INTO edfi.StudentEducationOrganizationAssociation (
			[StudentUSI]
			,[EducationOrganizationId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[HispanicLatinoEthnicity]
			,[SexDescriptorId]
		) VALUES (
			@StudentUSI
			,@EducationOrganizationID
			,NEWID()
			,GETDATE()
			,GETDATE()
			,0
			,@SexDescriptorId
		)

	-- ACTUAL DISABILITY ===================================================================================================
	-- insert into [edfi].[StudentSpecialEducationProgramAssociationDisability]
	-- insert record 1
	SET @StudentUSI = 21681
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociationDisability
		WHERE DisabilityDescriptorId=@DisabilityDescriptorId_1
			AND EducationOrganizationId = @EducationOrganizationID
			AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentEducationOrganizationAssociationDisability (
			[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[StudentUSI]
			,[DisabilityDiagnosis]
			,[OrderOfDisability]
			,[DisabilityDeterminationSourceTypeDescriptorId]
			,[CreateDate]
		) VALUES (
			@DisabilityDescriptorId_1
			,@EducationOrganizationID
			,@StudentUSI
			,NULL
			,NULL
			,@DisabilityDeterminationSourceTypeDescriptorId
			,GETDATE()
		)

	-- insert record 2
	SET @StudentUSI = 21829
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociationDisability
		WHERE DisabilityDescriptorId=@DisabilityDescriptorId_2
			AND EducationOrganizationId = @EducationOrganizationID
			AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentEducationOrganizationAssociationDisability (
			[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[StudentUSI]
			,[DisabilityDiagnosis]
			,[OrderOfDisability]
			,[DisabilityDeterminationSourceTypeDescriptorId]
			,[CreateDate]
		) VALUES (
			@DisabilityDescriptorId_2
			,@EducationOrganizationID
			,@StudentUSI
			,NULL
			,NULL
			,@DisabilityDeterminationSourceTypeDescriptorId
			,GETDATE()
		)


	-- insert record 3
	SET @StudentUSI = 22525				-- 605716
	SELECT @DisabilityDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue='MD'
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociationDisability
		WHERE DisabilityDescriptorId=@DisabilityDescriptorId
			AND EducationOrganizationId = @EducationOrganizationID
			AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentEducationOrganizationAssociationDisability (
			[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[StudentUSI]
			,[DisabilityDiagnosis]
			,[OrderOfDisability]
			,[DisabilityDeterminationSourceTypeDescriptorId]
			,[CreateDate]
		) VALUES (
			@DisabilityDescriptorId
			,@EducationOrganizationID
			,@StudentUSI
			,NULL
			,NULL
			,@DisabilityDeterminationSourceTypeDescriptorId
			,GETDATE()
		)

	-- add student race into [edfi].[StudentEducationOrganizationAssociationRace]
	SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/RaceDescriptor' AND CodeValue='Choose Not to Respond'
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace] WHERE
		EducationOrganizationId=@EducationOrganizationID
		AND StudentUSI=@StudentUSI
		AND RaceDescriptorId=@RaceDescriptorId)
		INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace] (
			[EducationOrganizationId]
			,[StudentUSI]
			,[CreateDate]
			,[RaceDescriptorId]
		) VALUES (
			@EducationOrganizationID
			,@StudentUSI
			,GETDATE()
			,@RaceDescriptorId
		)

	-- insert record 4
	SET @StudentUSI = 22571						-- 605762
	SELECT @DisabilityDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue='Physical Disability'
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociationDisability
		WHERE DisabilityDescriptorId=@DisabilityDescriptorId
			AND EducationOrganizationId = @EducationOrganizationID
			AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentEducationOrganizationAssociationDisability (
			[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[StudentUSI]
			,[DisabilityDiagnosis]
			,[OrderOfDisability]
			,[DisabilityDeterminationSourceTypeDescriptorId]
			,[CreateDate]
		) VALUES (
			@DisabilityDescriptorId
			,@EducationOrganizationID
			,@StudentUSI
			,NULL
			,NULL
			,@DisabilityDeterminationSourceTypeDescriptorId
			,GETDATE()
		)

	-- add student race into [edfi].[StudentEducationOrganizationAssociationRace]
	SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/RaceDescriptor' AND CodeValue='Other'
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace] WHERE
		EducationOrganizationId=@EducationOrganizationID
		AND StudentUSI=@StudentUSI
		AND RaceDescriptorId=@RaceDescriptorId)
		INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace] (
			[EducationOrganizationId]
			,[StudentUSI]
			,[CreateDate]
			,[RaceDescriptorId]
		) VALUES (
			@EducationOrganizationID
			,@StudentUSI
			,GETDATE()
			,@RaceDescriptorId
		)

	-- insert record 5
	SET @StudentUSI = 21798						-- 604989
	SELECT @DisabilityDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue='ID'
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociationDisability
		WHERE DisabilityDescriptorId=@DisabilityDescriptorId
			AND EducationOrganizationId = @EducationOrganizationID
			AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentEducationOrganizationAssociationDisability (
			[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[StudentUSI]
			,[DisabilityDiagnosis]
			,[OrderOfDisability]
			,[DisabilityDeterminationSourceTypeDescriptorId]
			,[CreateDate]
		) VALUES (
			@DisabilityDescriptorId
			,@EducationOrganizationID
			,@StudentUSI
			,NULL
			,NULL
			,@DisabilityDeterminationSourceTypeDescriptorId
			,GETDATE()
		)

	-- add student race into [edfi].[StudentEducationOrganizationAssociationRace]
	SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/RaceDescriptor' AND CodeValue='White'
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace] WHERE
		EducationOrganizationId=@EducationOrganizationID
		AND StudentUSI=@StudentUSI
		AND RaceDescriptorId=@RaceDescriptorId)
		INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace] (
			[EducationOrganizationId]
			,[StudentUSI]
			,[CreateDate]
			,[RaceDescriptorId]
		) VALUES (
			@EducationOrganizationID
			,@StudentUSI
			,GETDATE()
			,@RaceDescriptorId
		)
	

	-- FS006 =======================================================================================================================
		
	-- connect multiple tables
	-- DisciplineIncident
	-- StudentDisciplineIncidentAssociation
	-- DisciplineActionStudentDisciplineIncidentAssociation
	-- DisciplineAction
	-- DisciplineActionDiscipline
	-- minors:
		-- DisciplineIncidentBehavior
		-- DisciplineIncidentWeapon
	
	DECLARE @SchoolId INT = 255901107
	SET @EducationOrganizationId = 255901
	DECLARE @StaffUSI INT = 10
	DECLARE @ProgramAssignmentDescriptorId INT
	DECLARE @SchoolYear INT = 2018
	SET @SexDescriptorId = 1387

	SELECT @ProgramAssignmentDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ProgramAssignmentDescriptor' AND CodeValue='Special Education'

	-- INSERT Staff to School association
	IF NOT EXISTS (SELECT * FROM [edfi].[StaffSchoolAssociation] WHERE StaffUSI=@StaffUSI
					AND ProgramAssignmentDescriptorId=@ProgramAssignmentDescriptorId
					AND SchoolId=@SchoolId
					AND SchoolYear=@SchoolYear)
		INSERT INTO [edfi].[StaffSchoolAssociation] (
			[StaffUSI]
			,[ProgramAssignmentDescriptorId]
			,[SchoolId]
			,[SchoolYear]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[CalendarCode]
			,[Discriminator]
		) VALUES (
			@StaffUSI
			,@ProgramAssignmentDescriptorId
			,@SchoolId
			,@SchoolYear
			,NEWID()
			,GETDATE()
			,GETDATE()
			,NULL
			,NULL
		)



	DECLARE @IncidentIdentifier INT = 108
	DECLARE @ReporterDescriptionDescriptorId INT
	DECLARE @IncidentLocationDescriptorId INT

	SELECT @ReporterDescriptionDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ReporterDescriptionDescriptor' AND CodeValue='Staff'

	SELECT @IncidentLocationDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/IncidentLocationDescriptor' AND CodeValue='Classroom'

	-- DisciplineIncident create new discipline incident
	IF NOT EXISTS (SELECT * FROM [edfi].[DisciplineIncident] WHERE IncidentIdentifier=@IncidentIdentifier
				AND SchoolId = @SchoolId)
		INSERT INTO [edfi].[DisciplineIncident] (
			[IncidentIdentifier]
			,[SchoolId]
			,[IncidentDate]
			,[IncidentTime]
			,[IncidentDescription]
			,[ReporterDescriptionDescriptorId]
			,[ReporterName]
			,[ReportedToLawEnforcement]
			,[CaseNumber]
			,[IncidentCost]
			,[StaffUSI]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[IncidentLocationDescriptorId]
			,[Discriminator]
		) VALUES (
			@IncidentIdentifier
			,@SchoolId
			,'2017-09-26'
			,'14:30:00.0000000'
			,NULL
			,@ReporterDescriptionDescriptorId
			,'John Dow'
			,0			-- ReportedToLawEnforcement
			,NULL
			,NULL
			,@StaffUSI
			,NEWID()
			,GETDATE()
			,GETDATE()
			,@IncidentLocationDescriptorId
			,NULL
		)

	SET @StudentUSI = 21681
	DECLARE @StudentParticipationCodeDescriptorId INT

	SELECT @StudentParticipationCodeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/StudentParticipationCodeDescriptor' AND CodeValue='Perpetrator'

	-- StudentDisciplineIncidentAssociation
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentDisciplineIncidentAssociation] WHERE 
			StudentUSI=@StudentUSI
			AND SchoolId=@SchoolId
			AND IncidentIdentifier=@IncidentIdentifier)
			
	-- make Student to DisciplineIncident association
	INSERT INTO [edfi].[StudentDisciplineIncidentAssociation](
		[StudentUSI]
		,[SchoolId]
		,[IncidentIdentifier]
		,[Id]
		,[LastModifiedDate]
		,[CreateDate]
		,[StudentParticipationCodeDescriptorId]
		,[Discriminator]
	) VALUES (
		@StudentUSI
		,@SchoolId
		,@IncidentIdentifier
		,NEWID()
		,GETDATE()
		,GETDATE()
		,@StudentParticipationCodeDescriptorId
		,NULL
	)

	-- DisciplineAction
	DECLARE @DisciplineActionIdentifier NVARCHAR(20) = '108'
	DECLARE @DisciplineDate DATE = '2017-09-26'
	IF NOT EXISTS (SELECT * FROM [edfi].[DisciplineAction] WHERE
					DisciplineActionIdentifier = @DisciplineActionIdentifier
					AND StudentUSI=@StudentUSI
					AND DisciplineDate = @DisciplineDate)
		INSERT INTO [edfi].[DisciplineAction] (
			[DisciplineActionIdentifier]
			,[StudentUSI]
			,[DisciplineDate]
			,[DisciplineActionLength]
			,[ActualDisciplineActionLength]
			,[RelatedToZeroTolerancePolicy]
			,[ResponsibilitySchoolId]
			,[AssignmentSchoolId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[ReceivedEducationServicesDuringExpulsion]
			,[IEPPlacementMeetingIndicator]
			,[DisciplineActionLengthDifferenceReasonDescriptorId]
			,[Discriminator]
		) VALUES (
			@DisciplineActionIdentifier
			,@StudentUSI
			,@DisciplineDate
			,1.00
			,1.00
			,NULL
			,@SchoolId
			,NULL
			,NEWID()
			,GETDATE()
			,GETDATE()
			,NULL
			,NULL
			,NULL
			,NULL
		)


	-- DisciplineActionDiscipline
	DECLARE @DisciplineDescriptorId INT
	SELECT @DisciplineDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisciplineDescriptor' AND CodeValue='In School Suspension'

	IF NOT EXISTS(SELECT * FROM edfi.DisciplineActionDiscipline WHERE 
					StudentUSI=@StudentUSI
					AND DisciplineActionIdentifier = @DisciplineActionIdentifier
					AND DisciplineDate=@DisciplineDate
					AND DisciplineDescriptorId = @DisciplineDescriptorId)
		INSERT INTO edfi.DisciplineActionDiscipline (
			[StudentUSI]
			,[DisciplineActionIdentifier]
			,[DisciplineDate]
			,[DisciplineDescriptorId]
			,[CreateDate]
		) VALUES (
			@StudentUSI
			,@DisciplineActionIdentifier
			,@DisciplineDate
			,@DisciplineDescriptorId
			,GETDATE()
		)

	-- DisciplineActionStudentDisciplineIncidentAssociation
	IF NOT EXISTS (SELECT * FROM edfi.DisciplineActionStudentDisciplineIncidentAssociation WHERE 
				   DisciplineActionIdentifier=@DisciplineActionIdentifier
				   AND DisciplineDate=@DisciplineDate
				   AND IncidentIdentifier=@IncidentIdentifier
				   AND SchoolId=@SchoolId
				   AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.DisciplineActionStudentDisciplineIncidentAssociation (
			[DisciplineActionIdentifier]
			,[DisciplineDate]
			,[IncidentIdentifier]
			,[SchoolId]
			,[StudentUSI]
			,[CreateDate]
		) VALUES (
			@DisciplineActionIdentifier
			,@DisciplineDate
			,@IncidentIdentifier
			,@SchoolId
			,@StudentUSI
			,GETDATE()
		)

	-- OPTIONAL ------------------------------
	-- DisciplineIncidentBehavior
	DECLARE @BehaviorDescriptorId INT
	SELECT @BehaviorDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/BehaviorDescriptor' AND CodeValue='School Violation'

	IF NOT EXISTS (SELECT * FROM edfi.DisciplineIncidentBehavior WHERE 
					SchoolId=@SchoolId
					AND IncidentIdentifier=@IncidentIdentifier
					AND BehaviorDescriptorId=@BehaviorDescriptorId)
		INSERT INTO edfi.DisciplineIncidentBehavior (
			[SchoolId]
			,[IncidentIdentifier]
			,[BehaviorDescriptorId]
			,[BehaviorDetailedDescription]
			,[CreateDate]
		) VALUES (
			@SchoolId
			,@IncidentIdentifier
			,@BehaviorDescriptorId
			,'violation'
			,GETDATE()
		)

	-- DisciplineIncidentWeapon
	DECLARE @WeaponDescriptorId INT
	SELECT @WeaponDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/WeaponDescriptor' AND CodeValue='Handgun'
	IF NOT EXISTS (SELECT * FROM edfi.DisciplineIncidentWeapon WHERE 
					SchoolId=@SchoolId
					AND IncidentIdentifier=@IncidentIdentifier
					AND WeaponDescriptorId=@WeaponDescriptorId)
		INSERT INTO edfi.DisciplineIncidentWeapon (
			[SchoolId]
			,[IncidentIdentifier]
			,WeaponDescriptorId
			,[CreateDate]
		) VALUES (
			@SchoolId
			,@IncidentIdentifier
			,@WeaponDescriptorId
			,GETDATE()
		)

		-- update student for LEP

		DECLARE @LEP INT
		SELECT @LEP = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
		WHERE Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor' AND CodeValue = 'Limited'

	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociation]
		WHERE StudentUSI = @StudentUSI)
		INSERT INTO [edfi].[StudentEducationOrganizationAssociation] (
			[StudentUSI]
			,[EducationOrganizationId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[LimitedEnglishProficiencyDescriptorId]
			,[SexDescriptorId]
		) VALUES (
			@StudentUSI
			,@EducationOrganizationId
			,NEWID()
			,GETDATE()
			,GETDATE()
			,@LEP
			,@SexDescriptorId
		)
	ELSE
		UPDATE [edfi].[StudentEducationOrganizationAssociation]
		SET [LimitedEnglishProficiencyDescriptorId] = @LEP
		WHERE StudentUSI=@StudentUSI


	-- student race
	SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/RaceDescriptor' AND CodeValue = 'White'


	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace]
	WHERE StudentUSI=@StudentUSI)
	INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace]
	(
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

	-- FS005- FS007-FS086-FS088 ============================================================================================================
	
	-- this is test data for FS007 - FS088
	

	-- insert extension data for FS007
	-- extension.DisciplineActionDiscipline
	SET @EducationOrganizationId = 255901
	SET @DisciplineActionIdentifier = '108'
	SET @StudentUSI = 21681
	SET @DisciplineDate = '2017-09-26'
	DECLARE @IdeaInterimRemovalReasonDescriptorId INT
	DECLARE @IdeaInterimRemovalTypeDescriptorId INT
	DECLARE @IDEADisciplineMethodFirearmDescriptorId INT
	DECLARE @DisciplineMethodFirearmDescriptorId INT

	SELECT @DisciplineDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisciplineDescriptor' AND CodeValue='In School Suspension'


	SELECT @IdeaInterimRemovalReasonDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/IdeaInterimRemovalReasonDescriptor' AND CodeValue='InterimRemovalDrugs'

	SELECT @IdeaInterimRemovalTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor' AND CodeValue='InterimRemovalSeriousBodilyInjury'

	SELECT @IDEADisciplineMethodFirearmDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'https://ceds.ed.gov/element/000556' AND CodeValue='EXPNOTMOD'

	SELECT @DisciplineMethodFirearmDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'https://ceds.ed.gov/element/000537' AND CodeValue='EXPNOTMODNOALT'


	IF NOT EXISTS(SELECT * FROM extension.DisciplineActionDiscipline WHERE 
					StudentUSI=@StudentUSI
					AND CedsDisciplineActionIdentifier = @DisciplineActionIdentifier
					AND DisciplineDate=@DisciplineDate
					AND DisciplineDescriptorId = @DisciplineDescriptorId)
		INSERT INTO extension.DisciplineActionDiscipline (
			[StudentUSI]
			,[CedsDisciplineActionIdentifier]
			,[DisciplineDate]
			,[DisciplineDescriptorId]
			,IdeaInterimRemovalTypeDescriptorId
			,IdeaInterimRemovalReasonDescriptorId
			,IDEADisciplineMethodFirearmDescriptorId
			,DisciplineMethodFirearmDescriptorId
			,[CreateDate]
			,LastModifiedDate
			,Id
		) VALUES (
			@StudentUSI
			,@DisciplineActionIdentifier
			,@DisciplineDate
			,@DisciplineDescriptorId
			,@IdeaInterimRemovalTypeDescriptorId
			,@IdeaInterimRemovalReasonDescriptorId
			,@IDEADisciplineMethodFirearmDescriptorId
			,@DisciplineMethodFirearmDescriptorId
			,GETDATE()
			,GETDATE()
			,NEWID()
		)

	-- assign student as IDEA
	-- insert into [edfi].StudentEducationOrganizationAssociationDisability

	SELECT @DisabilityDescriptorId = DescriptorId FROM edfi.Descriptor
	WHERE Namespace = 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue = 'AUT'

	SELECT @DisabilityDeterminationSourceTypeDescriptorId = DescriptorId FROM edfi.Descriptor
	WHERE Namespace = 'uri://ed-fi.org/DisabilityDeterminationSourceTypeDescriptor' AND CodeValue = 'By health care provider'

	IF NOT EXISTS (SELECT * FROM [edfi].StudentEducationOrganizationAssociationDisability
		WHERE DisabilityDescriptorId = @DisabilityDescriptorId
		AND EducationOrganizationId=@EducationOrganizationId
		AND StudentUSI=@StudentUSI)
		INSERT INTO [edfi].StudentEducationOrganizationAssociationDisability (
			[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[StudentUSI]
			,[CreateDate]
			,[DisabilityDeterminationSourceTypeDescriptorId]
		) VALUES (
			@DisabilityDescriptorId
			,@EducationOrganizationId
			,@StudentUSI
			,GETDATE()
			,@DisabilityDeterminationSourceTypeDescriptorId
		)

	-- FS009 ============================================================================================================================
	
	-- create test data for FS002 - two records
	SET @BeginDate = '2010-09-01'

	-- insert into edfi.StudentSpecialEducationProgramAssociationDisability
	-- 21681, 21829

	SET @EducationOrganizationID = 255901
	-- 255901

	SET @ProgramEducationOrganizationId = 255901

	-- Autism, Hearing impairment

	SELECT @DisabilityDescriptorId_1 = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue='AUT'

	SELECT @DisabilityDescriptorId_2 = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue='HI'


	-- By health care provider

	SET @ProgramName = 'Special Education'


	SELECT @DisabilityDeterminationSourceTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDeterminationSourceTypeDescriptor' AND CodeValue='By health care provider'

	SELECT @ProgramTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue='Special Education'

	-- create records in edfi.StudentEducationOrganizationAssociation if not exists
	SET @StudentUSI = 21681

	SELECT @SexDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/SexDescriptor' AND CodeValue='Female'

	-- insert record 1
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociation WHERE
		StudentUSI=@StudentUSI
		AND EducationOrganizationId=@EducationOrganizationID)
		INSERT INTO edfi.StudentEducationOrganizationAssociation (
			[StudentUSI]
			,[EducationOrganizationId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[HispanicLatinoEthnicity]
			,[SexDescriptorId]
		) VALUES (
			@StudentUSI
			,@EducationOrganizationID
			,NEWID()
			,GETDATE()
			,GETDATE()
			,0
			,@SexDescriptorId
		)

	-- insert record 2
	SET @StudentUSI = 21829
	--SELECT @SexDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	--WHERE Namespace LIKE 'uri://ed-fi.org/SexDescriptor' AND CodeValue='Male'
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociation WHERE
		StudentUSI=@StudentUSI
		AND EducationOrganizationId=@EducationOrganizationID)
		INSERT INTO edfi.StudentEducationOrganizationAssociation (
			[StudentUSI]
			,[EducationOrganizationId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[HispanicLatinoEthnicity]
			,[SexDescriptorId]
		) VALUES (
			@StudentUSI
			,@EducationOrganizationID
			,NEWID()
			,GETDATE()
			,GETDATE()
			,0
			,@SexDescriptorId
		)

	-- remove all records
	DELETE FROM edfi.StudentSpecialEducationProgramAssociationDisability

	-- insert into [edfi].[StudentSpecialEducationProgramAssociationDisability]
	-- insert record 1
	SET @StudentUSI = 21681
	IF NOT EXISTS (SELECT * FROM edfi.StudentSpecialEducationProgramAssociationDisability
		WHERE 
			BeginDate = @BeginDate
			AND DisabilityDescriptorId=@DisabilityDescriptorId_1
			AND EducationOrganizationId = @EducationOrganizationID
			AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
			AND ProgramName = @ProgramName
			AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentSpecialEducationProgramAssociationDisability (
			[BeginDate]
			,[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[ProgramEducationOrganizationId]
			,[ProgramName]
			,[ProgramTypeDescriptorId]
			,[StudentUSI]
			,[DisabilityDiagnosis]
			,[OrderOfDisability]
			,[DisabilityDeterminationSourceTypeDescriptorId]
			,[CreateDate]
		) VALUES (
			@BeginDate
			,@DisabilityDescriptorId_1
			,@EducationOrganizationID
			,@ProgramEducationOrganizationId
			,@ProgramName
			,@ProgramTypeDescriptorId
			,@StudentUSI
			,NULL
			,NULL
			,@DisabilityDeterminationSourceTypeDescriptorId
			,GETDATE()
		)

	-- insert record 2
	SET @StudentUSI = 21829
	IF NOT EXISTS (SELECT * FROM edfi.StudentSpecialEducationProgramAssociationDisability
		WHERE 
			BeginDate = @BeginDate
			AND DisabilityDescriptorId=@DisabilityDescriptorId_2
			AND EducationOrganizationId = @EducationOrganizationID
			AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
			AND ProgramName = @ProgramName
			AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.StudentSpecialEducationProgramAssociationDisability (
			[BeginDate]
			,[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[ProgramEducationOrganizationId]
			,[ProgramName]
			,[ProgramTypeDescriptorId]
			,[StudentUSI]
			,[DisabilityDiagnosis]
			,[OrderOfDisability]
			,[DisabilityDeterminationSourceTypeDescriptorId]
			,[CreateDate]
		) VALUES (
			@BeginDate
			,@DisabilityDescriptorId_2
			,@EducationOrganizationID
			,@ProgramEducationOrganizationId
			,@ProgramName
			,@ProgramTypeDescriptorId
			,@StudentUSI
			,NULL
			,NULL
			,@DisabilityDeterminationSourceTypeDescriptorId
			,GETDATE()
		)


	-- test date FS009
	-- add extra descriptors
	

	-- RUN FS002 test data script first

	DECLARE @ReasonExitedDescriptorId INT

	SELECT @ReasonExitedDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ReasonExitedDescriptor' AND CodeValue='AlternateDiploma'
	IF NOT EXISTS (SELECT * FROM [edfi].[ReasonExitedDescriptor] WHERE ReasonExitedDescriptorId=@ReasonExitedDescriptorId)
		INSERT INTO [edfi].[ReasonExitedDescriptor]
		SELECT @ReasonExitedDescriptorId
	
	SELECT @ReasonExitedDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ReasonExitedDescriptor' AND CodeValue='Transferred'
	IF NOT EXISTS (SELECT * FROM [edfi].[ReasonExitedDescriptor] WHERE ReasonExitedDescriptorId=@ReasonExitedDescriptorId)
		INSERT INTO [edfi].[ReasonExitedDescriptor]
		SELECT @ReasonExitedDescriptorId

	-- update [edfi].[GeneralStudentProgramAssociation], set exit SpecEd reason column with Dropout:
	SELECT @StudentUSI = 21681
	UPDATE [edfi].[GeneralStudentProgramAssociation]
	SET ReasonExitedDescriptorId=@ReasonExitedDescriptorId
	WHERE StudentUSI=@StudentUSI

	SELECT @StudentUSI = 21829
	SELECT @ReasonExitedDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ReasonExitedDescriptor' AND CodeValue='Discontinued schooling'

	-- update [edfi].[GeneralStudentProgramAssociation], set exit SpecEd reason column with Dropout:

	UPDATE [edfi].[GeneralStudentProgramAssociation]
	SET ReasonExitedDescriptorId=@ReasonExitedDescriptorId
	WHERE StudentUSI=@StudentUSI

	-- FS070-FS099 ================================================================================================================
	DECLARE @EducationOrganization INT = 255901012
	SET @StaffUSI = 1334
	DECLARE @StaffClassificationDescriptorId INT
	DECLARE @SpecialEducationAgeGroupTaughtDescriptorId INT
	DECLARE @SpecialEducationSupportServicesCategoryDescriptorId INT
	DECLARE @ParaprofessionalQualificationDescriptorId INT
	DECLARE @TitleIProgramStaffCategoryDescriptorId INT
	DECLARE @RecordStartDateTime DATE = '2017-07-01'
	DECLARE @RecordEndDateTime DATE	= '2018-06-30'

	SET @BeginDate = '1980-11-16'

	SELECT @StaffClassificationDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/StaffClassificationDescriptor' AND CodeValue='Teacher'

	SELECT @SpecialEducationAgeGroupTaughtDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/SpecialEducationAgeGroupTaughtDescriptor' AND CodeValue='3TO5'

	SELECT @SpecialEducationSupportServicesCategoryDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'https://ceds.ed.gov/element/000558' AND CodeValue='AUDIO'

	SELECT @ParaprofessionalQualificationDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'https://ceds.ed.gov/element/000207' AND CodeValue='Qualified'

	SELECT @TitleIProgramStaffCategoryDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'https://ceds.ed.gov/element/000283' AND CodeValue='TitleIAdministrator'


	IF NOT EXISTS (SELECT * FROM [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
		WHERE BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganization
		AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
		AND StaffUSI = @StaffUSI)
		INSERT INTO [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
				   ([StaffUSI]
				   ,[BeginDate]
				   ,[EducationOrganizationId]
				   ,[StaffClassificationDescriptorId]
				   ,[SpecialEducationAgeGroupTaughtDescriptorId]
				   ,[SpecialEducationSupportServicesCategoryDescriptorId]
				   ,[ParaprofessionalQualificationDescriptorId]
				   ,[TitleIProgramStaffCategoryDescriptorId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime]
				   )
		SELECT  [StaffUSI]
		,[BeginDate]
			  ,[EducationOrganizationId]
			  ,[StaffClassificationDescriptorId]
			  , @SpecialEducationAgeGroupTaughtDescriptorId  [SpecialEducationAgeGroupTaughtDescriptorId] --3 through 5
			  , @SpecialEducationSupportServicesCategoryDescriptorId [SpecialEducationSupportServicesCategoryDescriptorId] -- Audiologists
			  , @ParaprofessionalQualificationDescriptorId [ParaprofessionalQualificationDescriptorId] -- Qualified
			  , @TitleIProgramStaffCategoryDescriptorId [TitleIProgramStaffCategoryDescriptorId] -- TitleIAdministrator
			  , @RecordStartDateTime
			  , @RecordEndDateTime
		  FROM [edfi].[StaffEducationOrganizationAssignmentAssociation]
		  where StaffUSI = @StaffUSI
	ELSE
		UPDATE [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
		SET [SpecialEducationAgeGroupTaughtDescriptorId] = @SpecialEducationAgeGroupTaughtDescriptorId
		,[SpecialEducationSupportServicesCategoryDescriptorId] = @SpecialEducationSupportServicesCategoryDescriptorId
		,[ParaprofessionalQualificationDescriptorId] = @ParaprofessionalQualificationDescriptorId
		,[TitleIProgramStaffCategoryDescriptorId] = @TitleIProgramStaffCategoryDescriptorId
		WHERE BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganization
		AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
		AND StaffUSI = @StaffUSI

	-- FS089 - TEST DATA Children with Disabilities (IDEA) Early Childhood - 3-5yo

	DECLARE @StudentUniqueId INT
	DECLARE @StudentUSI_1 INT, @StudentUSI_2 INT
	-- create two IDEA students 3-5 yo
	-- 888888, 999999
	SET @StudentUniqueId = 888888
	IF NOT EXISTS (SELECT * FROM edfi.Student WHERE StudentUniqueId = @StudentUniqueId)
		BEGIN
		INSERT INTO edfi.Student (
			[PersonalTitlePrefix]
			,[FirstName]
			,[LastSurname]
			,[BirthDate]
			,[StudentUniqueId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			'Mr'
			,'Nick'
			,'Nolte'
			,'3/5/2013'
			,@StudentUniqueId
			,NEWID()
			,GETDATE()
			,GETDATE()
		)
		END

	SET @StudentUniqueId = 999999
	IF NOT EXISTS (SELECT * FROM edfi.Student WHERE StudentUniqueId = @StudentUniqueId)
		BEGIN
		INSERT INTO edfi.Student (
			[PersonalTitlePrefix]
			,[FirstName]
			,[LastSurname]
			,[BirthDate]
			,[StudentUniqueId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			'Mr'
			,'Maggy'
			,'Richardson'
			,'2/13/2014'
			,@StudentUniqueId
			,NEWID()
			,GETDATE()
			,GETDATE()
		)
		END


	
	

	-- create Student/School association
	SET @SchoolID = 255901107
	DECLARE @EntryGradeLevelDescriptorId INT
	DECLARE @GraduationPlanTypeDescriptorId INT

	SELECT @EntryGradeLevelDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' AND CodeValue='Preschool/Prekindergarten'

	SELECT @GraduationPlanTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/GraduationPlanTypeDescriptor' AND CodeValue='Minimum'

	SET @StudentUniqueId = 888888
	SELECT @StudentUSI_1 = StudentUSI FROM edfi.Student WHERE StudentUniqueId = @StudentUniqueId
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentSchoolAssociation] WHERE 
					StudentUSI = @StudentUSI_1
					AND SchoolId=@SchoolID
					)
		INSERT INTO [edfi].[StudentSchoolAssociation] (
			[StudentUSI]
			,[SchoolId]
			,[SchoolYear]
			,[EntryDate]
			,[EntryGradeLevelDescriptorId]
			,[EducationOrganizationId]
			,[GraduationPlanTypeDescriptorId]
			,[GraduationSchoolYear]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			@StudentUSI_1
			,@SchoolID
			,2018
			,'2017-07-01'
			,@EntryGradeLevelDescriptorId
			,@SchoolID
			,@GraduationPlanTypeDescriptorId
			,2010
			,NEWID()
			,GETDATE()
			,GETDATE()
		)
			
	SET @StudentUniqueId = 999999
	SELECT @StudentUSI_2 = StudentUSI FROM edfi.Student WHERE StudentUniqueId = @StudentUniqueId
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentSchoolAssociation] WHERE 
					StudentUSI = @StudentUSI_2
					AND SchoolId=@SchoolID
					)
		INSERT INTO [edfi].[StudentSchoolAssociation] (
			[StudentUSI]
			,[SchoolId]
			,[SchoolYear]
			,[EntryDate]
			,[EntryGradeLevelDescriptorId]
			,[EducationOrganizationId]
			,[GraduationPlanTypeDescriptorId]
			,[GraduationSchoolYear]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			@StudentUSI_2
			,@SchoolID
			,2018
			,'2017-07-01'
			,@EntryGradeLevelDescriptorId
			,@SchoolID
			,@GraduationPlanTypeDescriptorId
			,2010
			,NEWID()
			,GETDATE()
			,GETDATE()
		)		
	print '@StudentUSI_1='+cast(@StudentUSI_1 as varchar(20))
	print '@StudentUSI_2='+cast(@StudentUSI_2 as varchar(20))
	
	-- ================================================================================================================
	-- create test data for FS002 - two records
	SET @BeginDate = '2010-09-01'

	-- insert into edfi.StudentSpecialEducationProgramAssociationDisability

	SET @EducationOrganizationID = 255901
	-- 255901

	SET @ProgramEducationOrganizationId = 255901

	-- Autism, Hearing impairment

	SELECT @DisabilityDescriptorId_1 = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue='AUT'

	SELECT @DisabilityDescriptorId_2 = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue='HI'

	-- By health care provider

	SET @ProgramName = 'Special Education'

	SELECT @DisabilityDeterminationSourceTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisabilityDeterminationSourceTypeDescriptor' AND CodeValue='By health care provider'

	SELECT @ProgramTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue='Special Education'

	-- create records in edfi.StudentEducationOrganizationAssociation if not exists

	SELECT @SexDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/SexDescriptor' AND CodeValue='Male'
	
	-- insert record 1
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociation WHERE
		StudentUSI=@StudentUSI_1
		AND EducationOrganizationId=@EducationOrganizationID)
		INSERT INTO edfi.StudentEducationOrganizationAssociation (
			[StudentUSI]
			,[EducationOrganizationId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[HispanicLatinoEthnicity]
			,[SexDescriptorId]
		) VALUES (
			@StudentUSI_1
			,@EducationOrganizationID
			,NEWID()
			,GETDATE()
			,GETDATE()
			,0
			,@SexDescriptorId
		)

	-- insert record 2
	
	SELECT @SexDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/SexDescriptor' AND CodeValue='Female'
	IF NOT EXISTS (SELECT * FROM edfi.StudentEducationOrganizationAssociation WHERE
		StudentUSI=@StudentUSI_2
		AND EducationOrganizationId=@EducationOrganizationID)
		INSERT INTO edfi.StudentEducationOrganizationAssociation (
			[StudentUSI]
			,[EducationOrganizationId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[HispanicLatinoEthnicity]
			,[SexDescriptorId]
		) VALUES (
			@StudentUSI_2
			,@EducationOrganizationID
			,NEWID()
			,GETDATE()
			,GETDATE()
			,0
			,@SexDescriptorId
		)

	-- INSERT INTO [edfi].[GeneralStudentProgramAssociation]
	-- record 1
	IF NOT EXISTS (SELECT * FROM edfi.GeneralStudentProgramAssociation
		WHERE 
			BeginDate = @BeginDate
			AND EducationOrganizationId = @EducationOrganizationID
			AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
			AND ProgramName = @ProgramName
			AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			AND StudentUSI = @StudentUSI_1)
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
			,@EducationOrganizationID
			,@ProgramEducationOrganizationId
			,@ProgramName
			,@ProgramTypeDescriptorId
			,@StudentUSI_1
			,GETDATE()
			,GETDATE()
			,NEWID()
		)

	-- record 2
	IF NOT EXISTS (SELECT * FROM edfi.GeneralStudentProgramAssociation
		WHERE 
			BeginDate = @BeginDate
			AND EducationOrganizationId = @EducationOrganizationID
			AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
			AND ProgramName = @ProgramName
			AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			AND StudentUSI = @StudentUSI_2)
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
			,@EducationOrganizationID
			,@ProgramEducationOrganizationId
			,@ProgramName
			,@ProgramTypeDescriptorId
			,@StudentUSI_2
			,GETDATE()
			,GETDATE()
			,NEWID()
		)


	-- INSERT INTO edfi.StudentSpecialEducationProgramAssociation
	DECLARE @SpecialEducationSettingDescriptorId INT
	SELECT @SpecialEducationSettingDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/SpecialEducationSettingDescriptor' AND CodeValue='Residential Facility'

	-- record 1
	IF NOT EXISTS (SELECT * FROM edfi.StudentSpecialEducationProgramAssociation
		WHERE 
			BeginDate = @BeginDate
			AND EducationOrganizationId = @EducationOrganizationID
			AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
			AND ProgramName = @ProgramName
			AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			AND StudentUSI = @StudentUSI_1)
		INSERT INTO edfi.StudentSpecialEducationProgramAssociation (
			[BeginDate]
			,[EducationOrganizationId]
			,[ProgramEducationOrganizationId]
			,[ProgramName]
			,[ProgramTypeDescriptorId]
			,[StudentUSI]
			,IdeaEligibility
			,SpecialEducationSettingDescriptorId
			,SpecialEducationHoursPerWeek
			,SchoolHoursPerWeek
			,LastEvaluationDate
			,IEPReviewDate
			,IEPBeginDate
		) VALUES (
			@BeginDate
			,@EducationOrganizationID
			,@ProgramEducationOrganizationId
			,@ProgramName
			,@ProgramTypeDescriptorId
			,@StudentUSI_1
			,1
			,@SpecialEducationSettingDescriptorId
			,25
			,10
			,'2018-08-23'
			,'2018-08-27'
			,'2018-09-01'
		)

	-- record 2
	IF NOT EXISTS (SELECT * FROM edfi.StudentSpecialEducationProgramAssociation
		WHERE 
			BeginDate = @BeginDate
			AND EducationOrganizationId = @EducationOrganizationID
			AND ProgramEducationOrganizationId = @ProgramEducationOrganizationId
			AND ProgramName = @ProgramName
			AND ProgramTypeDescriptorId = @ProgramTypeDescriptorId
			AND StudentUSI = @StudentUSI_2)
		INSERT INTO edfi.StudentSpecialEducationProgramAssociation (
			[BeginDate]
			,[EducationOrganizationId]
			,[ProgramEducationOrganizationId]
			,[ProgramName]
			,[ProgramTypeDescriptorId]
			,[StudentUSI]
			,IdeaEligibility
			,SpecialEducationSettingDescriptorId
			,SpecialEducationHoursPerWeek
			,SchoolHoursPerWeek
			,LastEvaluationDate
			,IEPReviewDate
			,IEPBeginDate
		) VALUES (
			@BeginDate
			,@EducationOrganizationID
			,@ProgramEducationOrganizationId
			,@ProgramName
			,@ProgramTypeDescriptorId
			,@StudentUSI_2
			,1
			,@SpecialEducationSettingDescriptorId
			,25
			,10
			,'2018-08-23'
			,'2018-08-27'
			,'2018-09-01'
		)

	-- assign student as IDEA
	-- insert into [edfi].StudentEducationOrganizationAssociationDisability
	--DECLARE @DisabilityDescriptorId INT
	--DECLARE @DisabilityDeterminationSourceTypeDescriptorId INT

	SELECT @DisabilityDescriptorId_1 = DescriptorId FROM edfi.Descriptor
	WHERE Namespace = 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue = 'AUT'

	SELECT @DisabilityDeterminationSourceTypeDescriptorId = DescriptorId FROM edfi.Descriptor
	WHERE Namespace = 'uri://ed-fi.org/DisabilityDeterminationSourceTypeDescriptor' AND CodeValue = 'By health care provider'

	IF NOT EXISTS (SELECT * FROM [edfi].StudentEducationOrganizationAssociationDisability
		WHERE DisabilityDescriptorId = @DisabilityDescriptorId_1
		AND EducationOrganizationId=@EducationOrganizationId
		AND StudentUSI=@StudentUSI_1)
		INSERT INTO [edfi].StudentEducationOrganizationAssociationDisability (
			[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[StudentUSI]
			,[CreateDate]
			,[DisabilityDeterminationSourceTypeDescriptorId]
		) VALUES (
			@DisabilityDescriptorId_1
			,@EducationOrganizationId
			,@StudentUSI_1
			,GETDATE()
			,@DisabilityDeterminationSourceTypeDescriptorId
		)


	IF NOT EXISTS (SELECT * FROM [edfi].StudentEducationOrganizationAssociationDisability
		WHERE DisabilityDescriptorId = @DisabilityDescriptorId_2
		AND EducationOrganizationId=@EducationOrganizationId
		AND StudentUSI=@StudentUSI_2)
		INSERT INTO [edfi].StudentEducationOrganizationAssociationDisability (
			[DisabilityDescriptorId]
			,[EducationOrganizationId]
			,[StudentUSI]
			,[CreateDate]
			,[DisabilityDeterminationSourceTypeDescriptorId]
		) VALUES (
			@DisabilityDescriptorId_2
			,@EducationOrganizationId
			,@StudentUSI_2
			,GETDATE()
			,@DisabilityDeterminationSourceTypeDescriptorId
		)

	-- add Race
	-- [edfi].[StudentEducationOrganizationAssociationRace]

	-- student race
	DECLARE @RaceDescriptorId_1 INT
	SELECT @RaceDescriptorId_1 = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/RaceDescriptor' AND CodeValue = 'White'


	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace]
	WHERE StudentUSI=@StudentUSI_1)
	INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace]
	(
		[EducationOrganizationId]
		,[StudentUSI]
		,[CreateDate]
		,[RaceDescriptorId]
	) VALUES (
		@EducationOrganizationId
		,@StudentUSI_1
		,GETDATE()
		,@RaceDescriptorId_1
	)

	-- student race
	DECLARE @RaceDescriptorId_2 INT
	SELECT @RaceDescriptorId_2 = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/RaceDescriptor' AND CodeValue = 'American Indian - Alaska Native'


	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace]
	WHERE StudentUSI=@StudentUSI_2)
	INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace]
	(
		[EducationOrganizationId]
		,[StudentUSI]
		,[CreateDate]
		,[RaceDescriptorId]
	) VALUES (
		@EducationOrganizationId
		,@StudentUSI_2
		,GETDATE()
		,@RaceDescriptorId_2
	)

	-- FS112 =====================================================================================================================================
	
	DECLARE @StaffUniqueId VARCHAR(100) = '47941F401D104617A22B7052D4FFA8BD'
	DECLARE @HighestCompletedLevelOfEducationDescriptorId INT
	DECLARE @OldEthnicityDescriptorId INT
	SET @EducationOrganizationId = 255901001
	DECLARE @PositionTitle VARCHAR(100) = 'Eleventh grade Teacher'
	DECLARE @EmploymentStatusDescriptorId INT

	DECLARE @StateOfIssueStateAbbreviationDescriptorId INT
	DECLARE @CredentialIdentifier NVARCHAR(60) = 'CO Issued Certification'


	SELECT @OldEthnicityDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/OldEthnicityDescriptor'
		AND edfi.Descriptor.CodeValue = 'White, Not Of Hispanic Origin'

	SELECT @StateOfIssueStateAbbreviationDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/StateAbbreviationDescriptor'
		AND edfi.Descriptor.CodeValue = 'CO'

	SELECT @StaffClassificationDescriptorId = DescriptorId FROM edfi.Descriptor 
		WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/StaffClassificationDescriptor'
			AND edfi.Descriptor.CodeValue = 'Paraprofessionals'

	SELECT @EmploymentStatusDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/EmploymentStatusDescriptor'
		AND edfi.Descriptor.CodeValue = 'Tenured or permanent'

	-- ======================================================================
	IF NOT EXISTS (SELECT * FROM edfi.StaffClassificationDescriptor
		WHERE StaffClassificationDescriptorId = @StaffClassificationDescriptorId)
		INSERT INTO edfi.StaffClassificationDescriptor
		SELECT @StaffClassificationDescriptorId
		
	-- staff 1
	SELECT @StaffUniqueId = '47941F401D104617A22B7052D4FFA8BD'

	SELECT @HighestCompletedLevelOfEducationDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/LevelOfEducationDescriptor'
		AND edfi.Descriptor.CodeValue = 'Bachelor''s'

	SELECT @SexDescriptorId = DescriptorId FROM edfi.Descriptor 
		WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/SexDescriptor'
			AND edfi.Descriptor.CodeValue = 'Male'

	IF NOT EXISTS (SELECT * FROM [edfi].[Staff] 
		WHERE StaffUniqueId = @StaffUniqueId)
		INSERT INTO [edfi].[Staff] (
			[FirstName]
			,[LastSurname]
			,[BirthDate]
			,[HispanicLatinoEthnicity]
			,[HighestCompletedLevelOfEducationDescriptorId]
			,[YearsOfPriorProfessionalExperience]
			,[YearsOfPriorTeachingExperience]
			,[HighlyQualifiedTeacher]
			,[LoginId]
			,[StaffUniqueId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[SexDescriptorId]
			,[OldEthnicityDescriptorId]
		) VALUES (
			'John'
			,'Dow'
			,'1957-05-05'
			,0
			,@HighestCompletedLevelOfEducationDescriptorId
			,32
			,8
			,1
			,'john.dow'
			,@StaffUniqueId
			,NEWID()
			,GETDATE()
			,GETDATE()
			,@SexDescriptorId
			,@OldEthnicityDescriptorId
		)
	
	-- staff 2
	SELECT @StaffUniqueId = '21E8EFF8BBB149D8A04B555C3D1CC2B9'

	SELECT @HighestCompletedLevelOfEducationDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/LevelOfEducationDescriptor'
		AND edfi.Descriptor.CodeValue = 'Master''s'

	SELECT @SexDescriptorId = DescriptorId FROM edfi.Descriptor 
	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/SexDescriptor'
		AND edfi.Descriptor.CodeValue = 'Female'

	IF NOT EXISTS (SELECT * FROM [edfi].[Staff] 
		WHERE StaffUniqueId = @StaffUniqueId)
		INSERT INTO [edfi].[Staff] (
			[FirstName]
			,[LastSurname]
			,[BirthDate]
			,[HispanicLatinoEthnicity]
			,[HighestCompletedLevelOfEducationDescriptorId]
			,[YearsOfPriorProfessionalExperience]
			,[YearsOfPriorTeachingExperience]
			,[HighlyQualifiedTeacher]
			,[LoginId]
			,[StaffUniqueId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[SexDescriptorId]
			,[OldEthnicityDescriptorId]
		) VALUES (
			'Jane'
			,'Dow'
			,'1972-01-20'
			,0
			,@HighestCompletedLevelOfEducationDescriptorId
			,25
			,12
			,1
			,'jane.dow'
			,@StaffUniqueId
			,NEWID()
			,GETDATE()
			,GETDATE()
			,@SexDescriptorId
			,@OldEthnicityDescriptorId
		)

	-- pull staff 1 and make edfi.StaffEducationOrganizationAssignmentAssociation
	SELECT @StaffUniqueId = '47941F401D104617A22B7052D4FFA8BD'
	SELECT @StaffUSI = StaffUSI FROM [edfi].[Staff] 
		WHERE StaffUniqueId = @StaffUniqueId

	SELECT @BeginDate = '1988-07-20'
	SELECT @PositionTitle = 'Sixth grade Teacher'

	IF NOT EXISTS (SELECT * FROM edfi.StaffEducationOrganizationAssignmentAssociation
		WHERE StaffUSI = @StaffUSI
		AND EducationOrganizationId = @EducationOrganizationId
		AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
		AND BeginDate = @BeginDate )
		INSERT INTO edfi.StaffEducationOrganizationAssignmentAssociation (
			[StaffUSI]
			,[EducationOrganizationId]
			,[StaffClassificationDescriptorId]
			,[BeginDate]
			,[PositionTitle]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			@StaffUSI
			,@EducationOrganizationId
			,@StaffClassificationDescriptorId
			,@BeginDate
			,@PositionTitle
			,NEWID()
			,GETDATE()
			,GETDATE()
		)

	-- staff credentials
	IF NOT EXISTS (SELECT * FROM edfi.StaffCredential
		WHERE StaffUSI = @StaffUSI
		AND CredentialIdentifier = @CredentialIdentifier
		AND StateOfIssueStateAbbreviationDescriptorId = @StateOfIssueStateAbbreviationDescriptorId)
		INSERT INTO edfi.StaffCredential
		SELECT @StaffUSI, GETDATE(), @CredentialIdentifier, @StateOfIssueStateAbbreviationDescriptorId
	
	-- employment association
	IF NOT EXISTS (SELECT * FROM [edfi].[StaffEducationOrganizationEmploymentAssociation]
		WHERE EducationOrganizationId = @EducationOrganizationId
		AND StaffUSI = @StaffUSI
		AND EmploymentStatusDescriptorId = @EmploymentStatusDescriptorId
		AND HireDate = @BeginDate
		)
		INSERT INTO [edfi].[StaffEducationOrganizationEmploymentAssociation] (
			[EducationOrganizationId]
			,[StaffUSI]
			,[EmploymentStatusDescriptorId]
			,[HireDate]
			,[Department]
			,[FullTimeEquivalency]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			@EducationOrganizationId
			,@StaffUSI
			,@EmploymentStatusDescriptorId
			,@BeginDate
			,'400'
			,1.00000
			,NEWID()
			,GETDATE()
			,GETDATE()
		)

	SET @RecordStartDateTime = '2017-07-01'
	SET @RecordEndDateTime = '2018-06-30'

	SELECT @SpecialEducationAgeGroupTaughtDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/SpecialEducationAgeGroupTaughtDescriptor' AND CodeValue='3TO5'

	SELECT @SpecialEducationSupportServicesCategoryDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'https://ceds.ed.gov/element/000558' AND CodeValue='INTERPRET'

	SELECT @ParaprofessionalQualificationDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'https://ceds.ed.gov/element/000207' AND CodeValue='Qualified'

	SELECT @TitleIProgramStaffCategoryDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'https://ceds.ed.gov/element/000283' AND CodeValue='TitleIAdministrator'

	print '1'
	print @StaffUSI
	IF NOT EXISTS (SELECT * FROM [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
		WHERE BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganizationId
		AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
		AND StaffUSI = @StaffUSI)
		INSERT INTO [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
				   ([StaffUSI]
				   ,[BeginDate]
				   ,[EducationOrganizationId]
				   ,[StaffClassificationDescriptorId]
				   ,[SpecialEducationAgeGroupTaughtDescriptorId]
				   ,[SpecialEducationSupportServicesCategoryDescriptorId]
				   ,[ParaprofessionalQualificationDescriptorId]
				   ,[TitleIProgramStaffCategoryDescriptorId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime]
				   )
		SELECT  [StaffUSI]
		,[BeginDate]
			  ,[EducationOrganizationId]
			  ,[StaffClassificationDescriptorId]
			  , @SpecialEducationAgeGroupTaughtDescriptorId  [SpecialEducationAgeGroupTaughtDescriptorId] --3 through 5
			  , @SpecialEducationSupportServicesCategoryDescriptorId [SpecialEducationSupportServicesCategoryDescriptorId] -- Audiologists
			  , @ParaprofessionalQualificationDescriptorId [ParaprofessionalQualificationDescriptorId] -- Qualified
			  , @TitleIProgramStaffCategoryDescriptorId [TitleIProgramStaffCategoryDescriptorId] -- TitleIAdministrator
			  , @RecordStartDateTime
			  , @RecordEndDateTime
		  FROM [edfi].[StaffEducationOrganizationAssignmentAssociation]
		  where StaffUSI = @StaffUSI
	ELSE
		UPDATE [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
		SET [SpecialEducationAgeGroupTaughtDescriptorId] = @SpecialEducationAgeGroupTaughtDescriptorId
		,[SpecialEducationSupportServicesCategoryDescriptorId] = @SpecialEducationSupportServicesCategoryDescriptorId
		,[ParaprofessionalQualificationDescriptorId] = @ParaprofessionalQualificationDescriptorId
		,[TitleIProgramStaffCategoryDescriptorId] = @TitleIProgramStaffCategoryDescriptorId
		,RecordStartDateTime = @RecordStartDateTime
		,RecordEndDateTime = RecordEndDateTime
		WHERE BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganizationId
		AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
		AND StaffUSI = @StaffUSI

	--==============================================================================================
	-- pull staff 2 
	SELECT @StaffUniqueId = '21E8EFF8BBB149D8A04B555C3D1CC2B9'
	SELECT @StaffUSI = StaffUSI FROM [edfi].[Staff] 
		WHERE StaffUniqueId = @StaffUniqueId

	SELECT @BeginDate = '1986-12-20'
	SELECT @PositionTitle = 'Seventh grade Teacher'

	IF NOT EXISTS (SELECT * FROM edfi.StaffEducationOrganizationAssignmentAssociation
		WHERE StaffUSI = @StaffUSI
		AND EducationOrganizationId = @EducationOrganizationId
		AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
		AND BeginDate = @BeginDate )
		INSERT INTO edfi.StaffEducationOrganizationAssignmentAssociation (
			[StaffUSI]
			,[EducationOrganizationId]
			,[StaffClassificationDescriptorId]
			,[BeginDate]
			,[PositionTitle]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			@StaffUSI
			,@EducationOrganizationId
			,@StaffClassificationDescriptorId
			,@BeginDate
			,@PositionTitle
			,NEWID()
			,GETDATE()
			,GETDATE()
		)

	-- credentials
	IF NOT EXISTS (SELECT * FROM edfi.StaffCredential
		WHERE StaffUSI = @StaffUSI
		AND CredentialIdentifier = @CredentialIdentifier
		AND StateOfIssueStateAbbreviationDescriptorId = @StateOfIssueStateAbbreviationDescriptorId)
		INSERT INTO edfi.StaffCredential
		SELECT @StaffUSI, GETDATE(), @CredentialIdentifier, @StateOfIssueStateAbbreviationDescriptorId

	-- employment association
	IF NOT EXISTS (SELECT * FROM [edfi].[StaffEducationOrganizationEmploymentAssociation]
		WHERE EducationOrganizationId = @EducationOrganizationId
		AND StaffUSI = @StaffUSI
		AND EmploymentStatusDescriptorId = @EmploymentStatusDescriptorId
		AND HireDate = @BeginDate
		)
		INSERT INTO [edfi].[StaffEducationOrganizationEmploymentAssociation] (
			[EducationOrganizationId]
			,[StaffUSI]
			,[EmploymentStatusDescriptorId]
			,[HireDate]
			,[Department]
			,[FullTimeEquivalency]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			@EducationOrganizationId
			,@StaffUSI
			,@EmploymentStatusDescriptorId
			,@BeginDate
			,'400'
			,1.00000
			,NEWID()
			,GETDATE()
			,GETDATE()
		)


	SELECT @SpecialEducationSupportServicesCategoryDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'https://ceds.ed.gov/element/000558' AND CodeValue='PSYCH'

	print '2'
	print @StaffUSI
	IF NOT EXISTS (SELECT * FROM [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
		WHERE BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganizationId
		AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
		AND StaffUSI = @StaffUSI)
		INSERT INTO [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
				   ([StaffUSI]
				   ,[BeginDate]
				   ,[EducationOrganizationId]
				   ,[StaffClassificationDescriptorId]
				   ,[SpecialEducationAgeGroupTaughtDescriptorId]
				   ,[SpecialEducationSupportServicesCategoryDescriptorId]
				   ,[ParaprofessionalQualificationDescriptorId]
				   ,[TitleIProgramStaffCategoryDescriptorId]
				   ,[RecordStartDateTime]
				   ,[RecordEndDateTime]
				   )
		SELECT  [StaffUSI]
		,[BeginDate]
			  ,[EducationOrganizationId]
			  ,[StaffClassificationDescriptorId]
			  , @SpecialEducationAgeGroupTaughtDescriptorId  [SpecialEducationAgeGroupTaughtDescriptorId] --3 through 5
			  , @SpecialEducationSupportServicesCategoryDescriptorId [SpecialEducationSupportServicesCategoryDescriptorId] -- Audiologists
			  , @ParaprofessionalQualificationDescriptorId [ParaprofessionalQualificationDescriptorId] -- Qualified
			  , @TitleIProgramStaffCategoryDescriptorId [TitleIProgramStaffCategoryDescriptorId] -- TitleIAdministrator
			  , @RecordStartDateTime
			  , @RecordEndDateTime
		  FROM [edfi].[StaffEducationOrganizationAssignmentAssociation]
		  where StaffUSI = @StaffUSI
	ELSE
		UPDATE [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
		SET [SpecialEducationAgeGroupTaughtDescriptorId] = @SpecialEducationAgeGroupTaughtDescriptorId
		,[SpecialEducationSupportServicesCategoryDescriptorId] = @SpecialEducationSupportServicesCategoryDescriptorId
		,[ParaprofessionalQualificationDescriptorId] = @ParaprofessionalQualificationDescriptorId
		,[TitleIProgramStaffCategoryDescriptorId] = @TitleIProgramStaffCategoryDescriptorId
		,RecordStartDateTime = @RecordStartDateTime
		,RecordEndDateTime = RecordEndDateTime
		WHERE BeginDate = @BeginDate
		AND EducationOrganizationId = @EducationOrganizationId
		AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
		AND StaffUSI = @StaffUSI

	--SELECT * FROM edfi.StaffEducationOrganizationAssignmentAssociation
	--	WHERE StaffUSI = @StaffUSI
	--	AND EducationOrganizationId = @EducationOrganizationId
	--	AND StaffClassificationDescriptorId = @StaffClassificationDescriptorId
	--	AND BeginDate = @BeginDate


	
	-- connect multiple tables
	-- DisciplineIncident
	-- StudentDisciplineIncidentAssociation
	-- DisciplineActionStudentDisciplineIncidentAssociation
	-- DisciplineAction
	-- DisciplineActionDiscipline
	-- minors:
		-- DisciplineIncidentBehavior
		-- DisciplineIncidentWeapon
	
	SET @SchoolId = 255901107
	SET @EducationOrganizationId = 255901
	SET @StaffUSI = 10
	SET @SchoolYear = 2018
	SET @SexDescriptorId = 1387

	SELECT @ProgramAssignmentDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ProgramAssignmentDescriptor' AND CodeValue='Special Education'

	-- INSERT Staff to School association
	IF NOT EXISTS (SELECT * FROM [edfi].[StaffSchoolAssociation] WHERE StaffUSI=@StaffUSI
					AND ProgramAssignmentDescriptorId=@ProgramAssignmentDescriptorId
					AND SchoolId=@SchoolId
					AND SchoolYear=@SchoolYear)
		INSERT INTO [edfi].[StaffSchoolAssociation] (
			[StaffUSI]
			,[ProgramAssignmentDescriptorId]
			,[SchoolId]
			,[SchoolYear]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[CalendarCode]
			,[Discriminator]
		) VALUES (
			@StaffUSI
			,@ProgramAssignmentDescriptorId
			,@SchoolId
			,@SchoolYear
			,NEWID()
			,GETDATE()
			,GETDATE()
			,NULL
			,NULL
		)



	SET @IncidentIdentifier = 108

	SELECT @ReporterDescriptionDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/ReporterDescriptionDescriptor' AND CodeValue='Staff'

	SELECT @IncidentLocationDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/IncidentLocationDescriptor' AND CodeValue='Classroom'

	-- DisciplineIncident create new discipline incident
	IF NOT EXISTS (SELECT * FROM [edfi].[DisciplineIncident] WHERE IncidentIdentifier=@IncidentIdentifier
				AND SchoolId = @SchoolId)
		INSERT INTO [edfi].[DisciplineIncident] (
			[IncidentIdentifier]
			,[SchoolId]
			,[IncidentDate]
			,[IncidentTime]
			,[IncidentDescription]
			,[ReporterDescriptionDescriptorId]
			,[ReporterName]
			,[ReportedToLawEnforcement]
			,[CaseNumber]
			,[IncidentCost]
			,[StaffUSI]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[IncidentLocationDescriptorId]
			,[Discriminator]
		) VALUES (
			@IncidentIdentifier
			,@SchoolId
			,'2017-09-26'
			,'14:30:00.0000000'
			,NULL
			,@ReporterDescriptionDescriptorId
			,'John Dow'
			,0			-- ReportedToLawEnforcement
			,NULL
			,NULL
			,@StaffUSI
			,NEWID()
			,GETDATE()
			,GETDATE()
			,@IncidentLocationDescriptorId
			,NULL
		)

	SET @StudentUSI = 21681

	SELECT @StudentParticipationCodeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/StudentParticipationCodeDescriptor' AND CodeValue='Perpetrator'

	-- StudentDisciplineIncidentAssociation
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentDisciplineIncidentAssociation] WHERE 
			StudentUSI=@StudentUSI
			AND SchoolId=@SchoolId
			AND IncidentIdentifier=@IncidentIdentifier)
			
	-- make Student to DisciplineIncident association
	INSERT INTO [edfi].[StudentDisciplineIncidentAssociation](
		[StudentUSI]
		,[SchoolId]
		,[IncidentIdentifier]
		,[Id]
		,[LastModifiedDate]
		,[CreateDate]
		,[StudentParticipationCodeDescriptorId]
		,[Discriminator]
	) VALUES (
		@StudentUSI
		,@SchoolId
		,@IncidentIdentifier
		,NEWID()
		,GETDATE()
		,GETDATE()
		,@StudentParticipationCodeDescriptorId
		,NULL
	)

	-- DisciplineAction
	SET @DisciplineActionIdentifier = '108'
	SET @DisciplineDate = '2017-09-26'
	IF NOT EXISTS (SELECT * FROM [edfi].[DisciplineAction] WHERE
					DisciplineActionIdentifier = @DisciplineActionIdentifier
					AND StudentUSI=@StudentUSI
					AND DisciplineDate = @DisciplineDate)
		INSERT INTO [edfi].[DisciplineAction] (
			[DisciplineActionIdentifier]
			,[StudentUSI]
			,[DisciplineDate]
			,[DisciplineActionLength]
			,[ActualDisciplineActionLength]
			,[RelatedToZeroTolerancePolicy]
			,[ResponsibilitySchoolId]
			,[AssignmentSchoolId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[ReceivedEducationServicesDuringExpulsion]
			,[IEPPlacementMeetingIndicator]
			,[DisciplineActionLengthDifferenceReasonDescriptorId]
			,[Discriminator]
		) VALUES (
			@DisciplineActionIdentifier
			,@StudentUSI
			,@DisciplineDate
			,1.00
			,1.00
			,NULL
			,@SchoolId
			,NULL
			,NEWID()
			,GETDATE()
			,GETDATE()
			,NULL
			,NULL
			,NULL
			,NULL
		)


	-- DisciplineActionDiscipline
	SELECT @DisciplineDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/DisciplineDescriptor' AND CodeValue='In School Suspension'

	IF NOT EXISTS(SELECT * FROM edfi.DisciplineActionDiscipline WHERE 
					StudentUSI=@StudentUSI
					AND DisciplineActionIdentifier = @DisciplineActionIdentifier
					AND DisciplineDate=@DisciplineDate
					AND DisciplineDescriptorId = @DisciplineDescriptorId)
		INSERT INTO edfi.DisciplineActionDiscipline (
			[StudentUSI]
			,[DisciplineActionIdentifier]
			,[DisciplineDate]
			,[DisciplineDescriptorId]
			,[CreateDate]
		) VALUES (
			@StudentUSI
			,@DisciplineActionIdentifier
			,@DisciplineDate
			,@DisciplineDescriptorId
			,GETDATE()
		)

	-- DisciplineActionStudentDisciplineIncidentAssociation
	IF NOT EXISTS (SELECT * FROM edfi.DisciplineActionStudentDisciplineIncidentAssociation WHERE 
				   DisciplineActionIdentifier=@DisciplineActionIdentifier
				   AND DisciplineDate=@DisciplineDate
				   AND IncidentIdentifier=@IncidentIdentifier
				   AND SchoolId=@SchoolId
				   AND StudentUSI = @StudentUSI)
		INSERT INTO edfi.DisciplineActionStudentDisciplineIncidentAssociation (
			[DisciplineActionIdentifier]
			,[DisciplineDate]
			,[IncidentIdentifier]
			,[SchoolId]
			,[StudentUSI]
			,[CreateDate]
		) VALUES (
			@DisciplineActionIdentifier
			,@DisciplineDate
			,@IncidentIdentifier
			,@SchoolId
			,@StudentUSI
			,GETDATE()
		)

	-- OPTIONAL ------------------------------
	-- DisciplineIncidentBehavior
	SELECT @BehaviorDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/BehaviorDescriptor' AND CodeValue='School Violation'

	IF NOT EXISTS (SELECT * FROM edfi.DisciplineIncidentBehavior WHERE 
					SchoolId=@SchoolId
					AND IncidentIdentifier=@IncidentIdentifier
					AND BehaviorDescriptorId=@BehaviorDescriptorId)
		INSERT INTO edfi.DisciplineIncidentBehavior (
			[SchoolId]
			,[IncidentIdentifier]
			,[BehaviorDescriptorId]
			,[BehaviorDetailedDescription]
			,[CreateDate]
		) VALUES (
			@SchoolId
			,@IncidentIdentifier
			,@BehaviorDescriptorId
			,'violation'
			,GETDATE()
		)

	-- DisciplineIncidentWeapon
	SELECT @WeaponDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace LIKE 'uri://ed-fi.org/WeaponDescriptor' AND CodeValue='Handgun'
	IF NOT EXISTS (SELECT * FROM edfi.DisciplineIncidentWeapon WHERE 
					SchoolId=@SchoolId
					AND IncidentIdentifier=@IncidentIdentifier
					AND WeaponDescriptorId=@WeaponDescriptorId)
		INSERT INTO edfi.DisciplineIncidentWeapon (
			[SchoolId]
			,[IncidentIdentifier]
			,WeaponDescriptorId
			,[CreateDate]
		) VALUES (
			@SchoolId
			,@IncidentIdentifier
			,@WeaponDescriptorId
			,GETDATE()
		)

	-- update student for LEP

	SELECT @LEP = DescriptorId FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor
		WHERE Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor' AND CodeValue = 'Limited'

	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociation]
		WHERE StudentUSI = @StudentUSI)
		INSERT INTO [edfi].[StudentEducationOrganizationAssociation] (
			[StudentUSI]
			,[EducationOrganizationId]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
			,[LimitedEnglishProficiencyDescriptorId]
			,[SexDescriptorId]
		) VALUES (
			@StudentUSI
			,@EducationOrganizationId
			,NEWID()
			,GETDATE()
			,GETDATE()
			,@LEP
			,@SexDescriptorId
		)
	ELSE
		UPDATE [edfi].[StudentEducationOrganizationAssociation]
		SET [LimitedEnglishProficiencyDescriptorId] = @LEP
		WHERE StudentUSI=@StudentUSI


	-- student race
	SELECT @RaceDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/RaceDescriptor' AND CodeValue = 'White'


	IF NOT EXISTS (SELECT * FROM [edfi].[StudentEducationOrganizationAssociationRace]
	WHERE StudentUSI=@StudentUSI)
	INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace]
	(
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