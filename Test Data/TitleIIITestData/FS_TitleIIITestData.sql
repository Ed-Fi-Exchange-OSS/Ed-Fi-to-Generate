-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.



	-- duplicate student into student assessment table with new academic subject
	DECLARE @AcademicSubjectDescriptorId INT
	DECLARE @AssessedGradeLevelDescriptorId INT = 464
	DECLARE @AdministrationDate DATE = '2017-08-25'
	DECLARE @AssessmentTitle VARCHAR(60) = 'Mathematics'
	DECLARE @AssessmentVersion INT = 1
	DECLARE @AssessmentReportingMethodDescriptorId INT = 1114
	DECLARE @PerformanceLevelDescriptorId INT = 570
	DECLARE @StudentUSI INT = 21656

	SELECT @AcademicSubjectDescriptorId = DescriptorId FROM edfi.Descriptor 
		WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/AcademicSubjectDescriptor'
			AND edfi.Descriptor.CodeValue = 'Mathematics'
	
	IF NOT EXISTS (SELECT * FROM [edfi].[StudentAssessment] WHERE 
		AcademicSubjectDescriptorId = @AcademicSubjectDescriptorId
		AND AdministrationDate = @AdministrationDate
		AND AssessedGradeLevelDescriptorId = @AssessedGradeLevelDescriptorId
		AND AssessmentTitle = @AssessmentTitle
		AND AssessmentVersion = @AssessmentVersion
		AND StudentUSI = @StudentUSI)
		INSERT INTO [edfi].[StudentAssessment] (
			[AcademicSubjectDescriptorId]
			,[AdministrationDate]
			,[AssessedGradeLevelDescriptorId]
			,[AssessmentTitle]
			,[AssessmentVersion]
			,[StudentUSI]
			,CreateDate
			,LastModifiedDate
			,Id
		) VALUES (
			@AcademicSubjectDescriptorId
			,@AdministrationDate
			,@AssessedGradeLevelDescriptorId
			,@AssessmentTitle
			,@AssessmentVersion
			,@StudentUSI
			,GETDATE()
			,GETDATE()
			,NEWID()
		)
	
	-- insert edfi.StudentAssessmentPerformanceLevel
	IF NOT EXISTS (SELECT * FROM [edfi].StudentAssessmentPerformanceLevel WHERE 
		AcademicSubjectDescriptorId = @AcademicSubjectDescriptorId
		AND AdministrationDate = @AdministrationDate
		AND AssessedGradeLevelDescriptorId = @AssessedGradeLevelDescriptorId
		AND AssessmentReportingMethodDescriptorId = @AssessmentReportingMethodDescriptorId
		AND AssessmentTitle = @AssessmentTitle
		AND AssessmentVersion = @AssessmentVersion
		AND PerformanceLevelDescriptorId = @PerformanceLevelDescriptorId
		AND StudentUSI = @StudentUSI)
	INSERT INTO [edfi].StudentAssessmentPerformanceLevel (
		[AcademicSubjectDescriptorId]
		,[AdministrationDate]
		,[AssessedGradeLevelDescriptorId]
		,[AssessmentReportingMethodDescriptorId]
		,[AssessmentTitle]
		,[AssessmentVersion]
		,[PerformanceLevelDescriptorId]
		,[StudentUSI]
		,[PerformanceLevelMet]
		,[CreateDate]
	) VALUES (
		@AcademicSubjectDescriptorId
		,@AdministrationDate
		,@AssessedGradeLevelDescriptorId
		,@AssessmentReportingMethodDescriptorId
		,@AssessmentTitle
		,@AssessmentVersion
		,@PerformanceLevelDescriptorId
		,@StudentUSI
		,1 --[PerformanceLevelMet]
		,GETDATE()
	)

	---- update assessment student data
	--SELECT @AcademicSubjectDescriptorId = DescriptorId FROM edfi.Descriptor 
	--	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/AcademicSubjectDescriptor'
	--		AND edfi.Descriptor.CodeValue = 'Mathematics'

	

	--UPDATE [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
	--SET AcademicSubjectDescriptorId = 4009
	--WHERE AcademicSubjectDescriptorId=6
	--AND AdministrationDate = '2017-08-25'
	--AND AssessedGradeLevelDescriptorId = 464
	--AND AssessmentTitle = 'STATE Math'
	--AND AssessmentVersion = 1
	--AND StudentUSI = 21656

	--SELECT @AcademicSubjectDescriptorId = DescriptorId FROM edfi.Descriptor 
	--	WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/AcademicSubjectDescriptor'
	--		AND edfi.Descriptor.CodeValue = 'Science'

	--UPDATE [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
	--SET AcademicSubjectDescriptorId = 4009
	--WHERE AcademicSubjectDescriptorId=10
	--AND AdministrationDate = '2017-08-25'
	--AND AssessedGradeLevelDescriptorId = 464
	--AND AssessmentTitle = 'STATE Math'
	--AND AssessmentVersion = 1
	--AND StudentUSI = 15


	--UPDATE [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
	--SET AdministrationLanguageDescriptorId = 505
	--,WhenAssessedGradeLevelDescriptorId = 464
	--,SchoolYear=2018
	--WHERE StudentUSI = 15

	--FS126 Title III Former EL Students 
	TRUNCATE TABLE extension.CedsStudentAssessment 

	INSERT INTO extension.CedsStudentAssessment (
		[AcademicSubjectDescriptorId]
		,[AdministrationDate]
		,[AssessedGradeLevelDescriptorId]
		,[CedsAssessmentTitle]
		,[CedsAssessmentVersion]
		,[StudentUSI]
		,StateFullAcademicYear
		,LEAFullAcademicYear
		,SchoolFullAcademicYear
		,RecordStartDateTime
	)
	SELECT 
		[AcademicSubjectDescriptorId]
		,[AdministrationDate]
		,[AssessedGradeLevelDescriptorId]
		,[AssessmentTitle]
		,[AssessmentVersion]
		,[StudentUSI]
		,1
		,1
		,1
		,[AdministrationDate]
	FROM edfi.StudentAssessment
