	
	-- FS203 --== Inexperienced teachers =================================================
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/InexperiencedStatusDescriptor'
		AND edfi.Descriptor.CodeValue = 'TCHEXPRNCD')
	BEGIN
		INSERT INTO edfi.Descriptor (
				[Namespace]
				,[CodeValue]
				,[ShortDescription]
				,[Description]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				)
		VALUES (
				'uri://ed-fi.org/InexperiencedStatusDescriptor'
				,'TCHEXPRNCD'
				,'Experienced teachers'
				,'Experienced teachers'
				,NEWID()
				,GetDate()
				,GetDate()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/InexperiencedStatusDescriptor'
		AND edfi.Descriptor.CodeValue = 'TCHINEXPRNCD')
	BEGIN
		INSERT INTO edfi.Descriptor (
				[Namespace]
				,[CodeValue]
				,[ShortDescription]
				,[Description]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				)
		VALUES (
				'uri://ed-fi.org/InexperiencedStatusDescriptor'
				,'TCHINEXPRNCD'
				,'Inexperienced teachers'
				,'Inexperienced teachers'
				,NEWID()
				,GetDate()
				,GetDate()
		)
	END
	-- EmergencyorProvisionalCredentialStatusDescriptor
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/EmergencyorProvisionalCredentialStatusDescriptor'
		AND edfi.Descriptor.CodeValue = 'TCHWEMRPRVCRD')
	BEGIN
		INSERT INTO edfi.Descriptor (
				[Namespace]
				,[CodeValue]
				,[ShortDescription]
				,[Description]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				)
		VALUES (
				'uri://ed-fi.org/EmergencyorProvisionalCredentialStatusDescriptor'
				,'TCHWEMRPRVCRD'
				,'Emergency or Provisional'
				,'Emergency or Provisional – Teachers with emergency or provisional credential'
				,NEWID()
				,GetDate()
				,GetDate()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/EmergencyorProvisionalCredentialStatusDescriptor'
		AND edfi.Descriptor.CodeValue = 'TCHWOEMRPRVCRD')
	BEGIN
		INSERT INTO edfi.Descriptor (
				[Namespace]
				,[CodeValue]
				,[ShortDescription]
				,[Description]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				)
		VALUES (
				'uri://ed-fi.org/EmergencyorProvisionalCredentialStatusDescriptor'
				,'TCHWOEMRPRVCRD'
				,'No Emergency or Provisional'
				,'No Emergency or Provisional – Teachers without emergency or provisional credential'
				,NEWID()
				,GetDate()
				,GetDate()
		)
	END
	-- OutOfFieldStatusDescriptor
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/OutOfFieldStatusDescriptor'
		AND edfi.Descriptor.CodeValue = 'TCHINFLD')
	BEGIN
		INSERT INTO edfi.Descriptor (
				[Namespace]
				,[CodeValue]
				,[ShortDescription]
				,[Description]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				)
		VALUES (
				'uri://ed-fi.org/OutOfFieldStatusDescriptor'
				,'TCHINFLD'
				,'Teaching in Field'
				,'Teaching in Field - Teachers teaching in the subject or field for which they are certified or licensed'
				,NEWID()
				,GetDate()
				,GetDate()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/OutOfFieldStatusDescriptor'
		AND edfi.Descriptor.CodeValue = 'TCHOUTFLD')
	BEGIN
		INSERT INTO edfi.Descriptor (
				[Namespace]
				,[CodeValue]
				,[ShortDescription]
				,[Description]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				)
		VALUES (
				'uri://ed-fi.org/OutOfFieldStatusDescriptor'
				,'TCHOUTFLD'
				,'Not Teaching in Field'
				,'Not Teaching in Field - Teachers teaching in the subject or field for which they are not certified or license'
				,NEWID()
				,GetDate()
				,GetDate()
		)
	END

	-- FS206 Comprehencive and targeted support descriptors =================================================
	
DECLARE @NameSpace varchar(100), @code varchar(200), @Desc varchar(200), @shortDesc varchar(75)
SELECT @NameSpace = 'uri://ed-fi.org/ComprehensiveAndTargetedSupportDescriptor', @code = 'CSI', @Desc = 'Comprehensive Support and Improvement'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc


SELECT @NameSpace = 'uri://ed-fi.org/ComprehensiveAndTargetedSupportDescriptor', @code = 'TSI', @Desc = 'Targeted Support and Improvement'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc


SELECT @NameSpace = 'uri://ed-fi.org/ComprehensiveAndTargetedSupportDescriptor', @code = 'CSIEXIT', @Desc = 'Comprehensive Support and Improvement - Exit Status'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc

SELECT @NameSpace = 'uri://ed-fi.org/ComprehensiveAndTargetedSupportDescriptor', @code = 'TSIEXIT', @Desc = 'Targeted Support and Improvement - Exit Status'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc

SELECT @NameSpace = 'uri://ed-fi.org/ComprehensiveAndTargetedSupportDescriptor', @code = 'NOTCSITSI', @Desc = 'Not Comprehensive Support and Improvement or Targeted Support and Improvement'
	, @shortDesc = 'Not Comprehensive Support & Improvement or Targeted Support & Improvement'
IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @shortDesc, @Desc


INSERT INTO [extension].[ComprehensiveAndTargetedSupportDescriptor]
(
	[ComprehensiveAndTargetedSupportDescriptorId]
)
SELECT DescriptorId 
FROM [edfi].[Descriptor] D
LEFT JOIN [extension].[ComprehensiveAndTargetedSupportDescriptor] cs ON cs.ComprehensiveAndTargetedSupportDescriptorId = d.DescriptorId
WHERE Namespace = @NameSpace
AND cs.ComprehensiveAndTargetedSupportDescriptorId IS NULL



-- ComprehensiveSupportDescriptor
SELECT @NameSpace = 'uri://ed-fi.org/ComprehensiveSupportDescriptor', @code = 'CSILOWPERF', @Desc = 'Lowest-performing school'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc


SELECT @code = 'CSILOWGR', @Desc = 'Low graduation rate high school'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc


SELECT @code = 'CSIOTHER', @Desc = 'Additional targeted support school not exiting such status'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc



INSERT INTO [extension].[ComprehensiveSupportDescriptor]
(
	[ComprehensiveSupportDescriptorId]
)
SELECT DescriptorId 
FROM [edfi].[Descriptor] D
LEFT JOIN [extension].[ComprehensiveSupportDescriptor] cs ON cs.ComprehensiveSupportDescriptorId = d.DescriptorId
WHERE Namespace = @NameSpace
AND cs.ComprehensiveSupportDescriptorId IS NULL

-- Targeted support
SELECT @NameSpace = 'uri://ed-fi.org/TargetedSupportDescriptor', @code = 'TSIUNDER', @Desc = 'Consistently underperforming subgroups school'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc


SELECT  @code = 'TSIOTHER', @Desc = 'Additional targeted support and improvement school'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc


INSERT INTO [extension].[TargetedSupportDescriptor]
(
	[TargetedSupportDescriptorId]
)
SELECT DescriptorId 
FROM [edfi].[Descriptor] D
LEFT JOIN [extension].[TargetedSupportDescriptor] cs ON cs.TargetedSupportDescriptorId = d.DescriptorId
WHERE Namespace = @NameSpace
AND cs.TargetedSupportDescriptorId IS NULL

--	FS199 TEST DATA - populate Descriptor table first, if there is no data
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'MISSING')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'MISSING'
		,'MISSING'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'NOSTUDENTS')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'NOSTUDENTS'
		,'NOSTUDENTS'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'STTDEF')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'STTDEF'
		,'STTDEF'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'TOOFEW')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'TOOFEW'
		,'TOOFEW'
		,NEWID(), GETDATE(), GETDATE()
	)
--=============================================================================================================
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'ECODIS')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'ECODIS'
		,'ECODIS'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'LEP')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'LEP'
		,'LEP'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MW')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MW'
		,'MW'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MA')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MA'
		,'MA'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MAN')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MAN'
		,'MAN'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MAP')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MAP'
		,'MAP'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MB')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MB'
		,'MB'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MF')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MF'
		,'MF'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MHL')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MHL'
		,'MHL'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MHN')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MHN'
		,'MHN'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MM')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MM'
		,'MM'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MNP')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MNP'
		,'MNP'
		,NEWID(), GETDATE(), GETDATE()
	)



--====================================================================================================================
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'AllStudents')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'AllStudents'
		,'AllStudents'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'DisabilityStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'DisabilityStatus'
		,'DisabilityStatus'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'EconomicallyDisadvantagedStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'EconomicallyDisadvantagedStatus'
		,'EconomicallyDisadvantagedStatus'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'EnglishLearnerStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'EnglishLearnerStatus'
		,'EnglishLearnerStatus'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'RaceEthnicity')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'RaceEthnicity'
		,'RaceEthnicity'
		,NEWID(), GETDATE(), GETDATE()
	)
--=================================================================================================================

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'AcademicAchievementIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'AcademicAchievementIndicatorStatus'
		,'AcademicAchievementIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'GraduationRateIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'GraduationRateIndicatorStatus'
		,'GraduationRateIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'OtherAcademicIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'OtherAcademicIndicatorStatus'
		,'OtherAcademicIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'ProgressAchievingEnglishLanguageProficiency')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'ProgressAchievingEnglishLanguageProficiency'
		,'ProgressAchievingEnglishLanguageProficiency'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'SchoolQualityOrStudentSuccessIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'SchoolQualityOrStudentSuccessIndicatorStatus'
		,'SchoolQualityOrStudentSuccessIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)




--	FS200 TEST DATA - populate Descriptor table first, if there is no data
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'MISSING')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'MISSING'
		,'MISSING'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'NOSTUDENTS')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'NOSTUDENTS'
		,'NOSTUDENTS'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'STTDEF')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'STTDEF'
		,'STTDEF'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'TOOFEW')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'TOOFEW'
		,'TOOFEW'
		,NEWID(), GETDATE(), GETDATE()
	)
--=============================================================================================================
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'ECODIS')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'ECODIS'
		,'ECODIS'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'LEP')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'LEP'
		,'LEP'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MA')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MA'
		,'MA'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MAN')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MAN'
		,'MAN'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MAP')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MAP'
		,'MAP'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MB')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MB'
		,'MB'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MF')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MF'
		,'MF'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MHL')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MHL'
		,'MHL'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MHN')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MHN'
		,'MHN'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MM')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MM'
		,'MM'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MNP')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MNP'
		,'MNP'
		,NEWID(), GETDATE(), GETDATE()
	)



--====================================================================================================================
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'AllStudents')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'AllStudents'
		,'AllStudents'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'DisabilityStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'DisabilityStatus'
		,'DisabilityStatus'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'EconomicallyDisadvantagedStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'EconomicallyDisadvantagedStatus'
		,'EconomicallyDisadvantagedStatus'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'EnglishLearnerStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'EnglishLearnerStatus'
		,'EnglishLearnerStatus'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'RaceEthnicity')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'RaceEthnicity'
		,'RaceEthnicity'
		,NEWID(), GETDATE(), GETDATE()
	)
--=================================================================================================================

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'AcademicAchievementIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'AcademicAchievementIndicatorStatus'
		,'AcademicAchievementIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'GraduationRateIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'GraduationRateIndicatorStatus'
		,'GraduationRateIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'OtherAcademicIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'OtherAcademicIndicatorStatus'
		,'OtherAcademicIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'ProgressAchievingEnglishLanguageProficiency')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'ProgressAchievingEnglishLanguageProficiency'
		,'ProgressAchievingEnglishLanguageProficiency'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'SchoolQualityOrStudentSuccessIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'SchoolQualityOrStudentSuccessIndicatorStatus'
		,'SchoolQualityOrStudentSuccessIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)


	

--	FS201 TEST DATA - populate Descriptor table first, if there is no data
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'MISSING')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'MISSING'
		,'MISSING'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'NOSTUDENTS')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'NOSTUDENTS'
		,'NOSTUDENTS'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'STTDEF')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'STTDEF'
		,'STTDEF'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' AND CodeValue = 'TOOFEW')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusDescriptor'
		,'TOOFEW'
		,'TOOFEW'
		,NEWID(), GETDATE(), GETDATE()
	)
--=============================================================================================================
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'ECODIS')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'ECODIS'
		,'ECODIS'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'LEP')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'LEP'
		,'LEP'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MA')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MA'
		,'MA'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MAN')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MAN'
		,'MAN'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MAP')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MAP'
		,'MAP'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MB')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MB'
		,'MB'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MF')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MF'
		,'MF'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MHL')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MHL'
		,'MHL'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MHN')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MHN'
		,'MHN'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MM')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MM'
		,'MM'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' AND CodeValue = 'MNP')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'
		,'MNP'
		,'MNP'
		,NEWID(), GETDATE(), GETDATE()
	)



--====================================================================================================================
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'AllStudents')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'AllStudents'
		,'AllStudents'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'DisabilityStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'DisabilityStatus'
		,'DisabilityStatus'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'EconomicallyDisadvantagedStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'EconomicallyDisadvantagedStatus'
		,'EconomicallyDisadvantagedStatus'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'EnglishLearnerStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'EnglishLearnerStatus'
		,'EnglishLearnerStatus'
		,NEWID(), GETDATE(), GETDATE()
	)
IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' AND CodeValue = 'RaceEthnicity')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'
		,'RaceEthnicity'
		,'RaceEthnicity'
		,NEWID(), GETDATE(), GETDATE()
	)
--=================================================================================================================

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'AcademicAchievementIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'AcademicAchievementIndicatorStatus'
		,'AcademicAchievementIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'GraduationRateIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'GraduationRateIndicatorStatus'
		,'GraduationRateIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'OtherAcademicIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'OtherAcademicIndicatorStatus'
		,'OtherAcademicIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'ProgressAchievingEnglishLanguageProficiency')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'ProgressAchievingEnglishLanguageProficiency'
		,'ProgressAchievingEnglishLanguageProficiency'
		,NEWID(), GETDATE(), GETDATE()
	)

IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor] WHERE 
		Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' AND CodeValue = 'SchoolQualityOrStudentSuccessIndicatorStatus')
	INSERT INTO [edfi].[Descriptor] ([Namespace],[CodeValue],[ShortDescription]
		,[Id],[LastModifiedDate],[CreateDate]
	) VALUES (
		'uri://ed-fi.org/IndicatorStatusTypeDescriptor'
		,'SchoolQualityOrStudentSuccessIndicatorStatus'
		,'SchoolQualityOrStudentSuccessIndicatorStatus'
		,NEWID(), GETDATE(), GETDATE()
	)


	-- Title I Descriptors ===================================================================================
	DECLARE @CodeValue NVARCHAR(100)
	SET @NameSpace = 'https://ceds.ed.gov/element/000284'
	SET @CodeValue = 'TargetedAssistanceProgram'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'SchoolwideProgram'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'PrivateSchoolStudents'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'LocalNeglectedProgram'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	SET @NameSpace = 'https://ceds.ed.gov/element/000282'
	SET @CodeValue = 'Reading/Language Arts'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'Mathematics'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'Science'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'SocialSciences'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'CareerAndTechnical'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'Other'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)



	SET @NameSpace = 'https://ceds.ed.gov/element/000289'
	SET @CodeValue = 'HealthDentalEyeCare'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'GuidanceAdvocacy'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'Other'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)


	SET @Namespace = 'https://ceds.ed.gov/element/000548'
	SET @CodeValue = 'RETAINED'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'TRANSFER'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'DISTNONLEA'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'UNALLOC'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	SET @Namespace = 'https://ceds.ed.gov/element/000560'
	SET @CodeValue = 'NA'
	IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor]
		WHERE Namespace = @Namespace
		AND CodeValue = @CodeValue
		)
		INSERT INTO [edfi].[Descriptor] (
			[Namespace]
			,[CodeValue]
			,[ShortDescription]
			,[Description]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			@Namespace, @CodeValue, @CodeValue, @CodeValue, NEWID(), GETDATE(), GETDATE()
		)
	SET @CodeValue = 'No'
	IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor]
		WHERE Namespace = @Namespace
		AND CodeValue = @CodeValue
		)
		INSERT INTO [edfi].[Descriptor] (
			[Namespace]
			,[CodeValue]
			,[ShortDescription]
			,[Description]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			@Namespace, @CodeValue, @CodeValue, @CodeValue, NEWID(), GETDATE(), GETDATE()
		)
	SET @CodeValue = 'Yes'
	IF NOT EXISTS (SELECT * FROM [edfi].[Descriptor]
		WHERE Namespace = @Namespace
		AND CodeValue = @CodeValue
		)
		INSERT INTO [edfi].[Descriptor] (
			[Namespace]
			,[CodeValue]
			,[ShortDescription]
			,[Description]
			,[Id]
			,[LastModifiedDate]
			,[CreateDate]
		) VALUES (
			@Namespace, @CodeValue, @CodeValue, @CodeValue, NEWID(), GETDATE(), GETDATE()
		)



	-- RefDisciplineMethodFirearms
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPNOTMODNOALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPNOTMODNOALT'
			  ,'One year expulsion and no educational services'
			  ,'One year expulsion and no educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPMODALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPMODALT'
			  ,'Expulsion modified to less than one year with educational services'
			  ,'Expulsion modified to less than one year with educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPMODNOALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPMODNOALT'
			  ,'Expulsion modified to less than one year without educational services'
			  ,'Expulsion modified to less than one year without educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPALT'
			  ,'One year expulsion and educational services'
			  ,'One year expulsion and educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'REMOVEOTHER')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'REMOVEOTHER'
			  ,'Other reasons such as death, withdrawal, or incarceration'
			  ,'Other reasons such as death, withdrawal, or incarceration is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'OTHERDISACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'OTHERDISACTION'
			  ,'Another type of disciplinary action'
			  ,'Another type of disciplinary action is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'NOACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'NOACTION'
			  ,'No disciplinary action taken'
			  ,'No disciplinary action taken is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO



	-- RefIDEADisciplineMethodFirearm


	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'EXPMOD')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'EXPMOD'
			  ,'Expulsion modified to less than one year with ed services under IDEA'
			  ,'Expulsion modified to less than one year with educational services under IDEA was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'EXPNOTMOD')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'EXPNOTMOD'
			  ,'One year expulsion with educational services under IDEA'
			  ,'One year expulsion with educational services under IDEA was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'REMOVEOTHER')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'REMOVEOTHER'
			  ,'Other reasons such as death, withdrawal, or incarceration'
			  ,'Other reasons such as death, withdrawal, or incarceration was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'OTHERDISACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'OTHERDISACTION'
			  ,'Another type of disciplinary action'
			  ,'Another type of disciplinary action was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'NOACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'NOACTION'
			  ,'No disciplinary action taken'
			  ,'No disciplinary action taken was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	
	-- FS086 populate extensions DisciplineMethodFirearm
	-- RefDisciplineMethodFirearms
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPNOTMODNOALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPNOTMODNOALT'
			  ,'One year expulsion and no educational services'
			  ,'One year expulsion and no educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPMODALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPMODALT'
			  ,'Expulsion modified to less than one year with educational services'
			  ,'Expulsion modified to less than one year with educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPMODNOALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPMODNOALT'
			  ,'Expulsion modified to less than one year without educational services'
			  ,'Expulsion modified to less than one year without educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPALT'
			  ,'One year expulsion and educational services'
			  ,'One year expulsion and educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'REMOVEOTHER')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'REMOVEOTHER'
			  ,'Other reasons such as death, withdrawal, or incarceration'
			  ,'Other reasons such as death, withdrawal, or incarceration is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'OTHERDISACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'OTHERDISACTION'
			  ,'Another type of disciplinary action'
			  ,'Another type of disciplinary action is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'NOACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'NOACTION'
			  ,'No disciplinary action taken'
			  ,'No disciplinary action taken is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO



	-- RefIDEADisciplineMethodFirearm


	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'EXPMOD')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'EXPMOD'
			  ,'Expulsion modified to less than one year with ed services under IDEA'
			  ,'Expulsion modified to less than one year with educational services under IDEA was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'EXPNOTMOD')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'EXPNOTMOD'
			  ,'One year expulsion with educational services under IDEA'
			  ,'One year expulsion with educational services under IDEA was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'REMOVEOTHER')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'REMOVEOTHER'
			  ,'Other reasons such as death, withdrawal, or incarceration'
			  ,'Other reasons such as death, withdrawal, or incarceration was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'OTHERDISACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'OTHERDISACTION'
			  ,'Another type of disciplinary action'
			  ,'Another type of disciplinary action was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'NOACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'NOACTION'
			  ,'No disciplinary action taken'
			  ,'No disciplinary action taken was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000560'
		AND edfi.Descriptor.CodeValue = 'Yes')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000560'
			  ,'Yes'
			  ,'The alternative uses of funds authority'
			  ,'The LEA is exercising the alternative uses of funds authority'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000560'
		AND edfi.Descriptor.CodeValue = 'No')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000560'
			  ,'No'
			  ,'No alternative uses of funds authority'
			  ,'The LEA is eligible but is not exercising the alternative uses of funds authority'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000560'
		AND edfi.Descriptor.CodeValue = 'NA')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000560'
			  ,'NA'
			  ,'The LEA is not eligible'
			  ,'The LEA is not eligible to use alternative uses of funds authority'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END


	-- school reconstituted status descriptors
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000230'
		AND edfi.Descriptor.CodeValue = 'Yes')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000230'
			  ,'Yes'
			  ,'Reconstituted School'
			  ,'Reconstituted School'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000230'
		AND edfi.Descriptor.CodeValue = 'No')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000230'
			  ,'No'
			  ,'Not a reconstituted school'
			  ,'Not a reconstituted school'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO


	
	-- reasons for unilateral removal (FS007)
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IdeaInterimRemovalReasonDescriptor'
		AND edfi.Descriptor.CodeValue = 'InterimRemovalDrugs')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/IdeaInterimRemovalReasonDescriptor'
			  ,'InterimRemovalDrugs'
			  ,'Removed due to Drugs'
			  ,'Removed due to Drugs'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IdeaInterimRemovalReasonDescriptor'
		AND edfi.Descriptor.CodeValue = 'InterimRemovalWeapons')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/IdeaInterimRemovalReasonDescriptor'
			  ,'InterimRemovalWeapons'
			  ,'Removed due to Weapons'
			  ,'Removed due to Weapons'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IdeaInterimRemovalReasonDescriptor'
		AND edfi.Descriptor.CodeValue = 'InterimRemovalSeriousBodilyInjury')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/IdeaInterimRemovalReasonDescriptor'
			  ,'InterimRemovalSeriousBodilyInjury'
			  ,'Removed due to SeriousBodilyInjury'
			  ,'Removed due to SeriousBodilyInjury'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END

	-- IDEA Disciplinary removal (FS088)
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'InterimRemovalDrugs')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor'
			  ,'InterimRemovalDrugs'
			  ,'Removal for drugs'
			  ,'Removal for drugs'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'InterimRemovalWeapons')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor'
			  ,'InterimRemovalWeapons'
			  ,'Removal for weapons'
			  ,'Removal for weapons'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'InterimRemovalSeriousBodilyInjury')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor'
			  ,'InterimRemovalSeriousBodilyInjury'
			  ,'Removal for serious bodily injury'
			  ,'Removal for serious bodily injury'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor'
		AND edfi.Descriptor.CodeValue = 'InterimRemovalHearingOfficer')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/IdeaInterimRemovalTypeDescriptor'
			  ,'InterimRemovalHearingOfficer'
			  ,'Removed based on a Hearing Officer finding'
			  ,'Removed based on a Hearing Officer finding'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END


	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/ReasonExitedDescriptor'
		AND edfi.Descriptor.CodeValue = 'Transferred')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/ReasonExitedDescriptor'
			  ,'Transferred'
			  ,'Transferred to regular education'
			  ,'Transferred to regular education'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/ReasonExitedDescriptor'
		AND edfi.Descriptor.CodeValue = 'AlternateDiploma')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/ReasonExitedDescriptor'
			  ,'AlternateDiploma'
			  ,'Graduated with an alternate diploma'
			  ,'Graduated with an alternate diploma'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END


	-- new staff classification added - Paraprofessionals
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/StaffClassificationDescriptor'
		AND edfi.Descriptor.CodeValue = 'Paraprofessionals')
	BEGIN
		INSERT INTO edfi.Descriptor (
				[Namespace]
				,[CodeValue]
				,[ShortDescription]
				,[Description]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				)
		VALUES (
				'uri://ed-fi.org/StaffClassificationDescriptor'
				,'Paraprofessionals'
				,'Paraprofessionals'
				,'Paraprofessionals'
				,NEWID()
				,GetDate()
				,GetDate()
		)
	END


	
	-- FS086 populate extensions DisciplineMethodFirearm
	-- RefDisciplineMethodFirearms
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPNOTMODNOALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPNOTMODNOALT'
			  ,'One year expulsion and no educational services'
			  ,'One year expulsion and no educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPMODALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPMODALT'
			  ,'Expulsion modified to less than one year with educational services'
			  ,'Expulsion modified to less than one year with educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPMODNOALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPMODNOALT'
			  ,'Expulsion modified to less than one year without educational services'
			  ,'Expulsion modified to less than one year without educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPALT'
			  ,'One year expulsion and educational services'
			  ,'One year expulsion and educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'REMOVEOTHER')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'REMOVEOTHER'
			  ,'Other reasons such as death, withdrawal, or incarceration'
			  ,'Other reasons such as death, withdrawal, or incarceration is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'OTHERDISACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'OTHERDISACTION'
			  ,'Another type of disciplinary action'
			  ,'Another type of disciplinary action is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'NOACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'NOACTION'
			  ,'No disciplinary action taken'
			  ,'No disciplinary action taken is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO



	-- RefIDEADisciplineMethodFirearm


	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'EXPMOD')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'EXPMOD'
			  ,'Expulsion modified to less than one year with ed services under IDEA'
			  ,'Expulsion modified to less than one year with educational services under IDEA was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'EXPNOTMOD')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'EXPNOTMOD'
			  ,'One year expulsion with educational services under IDEA'
			  ,'One year expulsion with educational services under IDEA was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'REMOVEOTHER')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'REMOVEOTHER'
			  ,'Other reasons such as death, withdrawal, or incarceration'
			  ,'Other reasons such as death, withdrawal, or incarceration was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'OTHERDISACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'OTHERDISACTION'
			  ,'Another type of disciplinary action'
			  ,'Another type of disciplinary action was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'NOACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'NOACTION'
			  ,'No disciplinary action taken'
			  ,'No disciplinary action taken was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000560'
		AND edfi.Descriptor.CodeValue = 'Yes')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000560'
			  ,'Yes'
			  ,'The alternative uses of funds authority'
			  ,'The LEA is exercising the alternative uses of funds authority'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000560'
		AND edfi.Descriptor.CodeValue = 'No')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000560'
			  ,'No'
			  ,'No alternative uses of funds authority'
			  ,'The LEA is eligible but is not exercising the alternative uses of funds authority'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000560'
		AND edfi.Descriptor.CodeValue = 'NA')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000560'
			  ,'NA'
			  ,'The LEA is not eligible'
			  ,'The LEA is not eligible to use alternative uses of funds authority'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END



	DECLARE @NameSpace NVARCHAR(100)
	DECLARE @CodeValue NVARCHAR(100)
	SET @NameSpace = 'https://ceds.ed.gov/element/000284'
	SET @CodeValue = 'TargetedAssistanceProgram'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'SchoolwideProgram'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'PrivateSchoolStudents'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'LocalNeglectedProgram'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	SET @NameSpace = 'https://ceds.ed.gov/element/000282'
	SET @CodeValue = 'Reading/Language Arts'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'Mathematics'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'Science'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'SocialSciences'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'CareerAndTechnical'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'Other'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)



	SET @NameSpace = 'https://ceds.ed.gov/element/000289'
	SET @CodeValue = 'HealthDentalEyeCare'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'GuidanceAdvocacy'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'Other'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)


	SET @Namespace = 'https://ceds.ed.gov/element/000548'
	SET @CodeValue = 'RETAINED'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'TRANSFER'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'DISTNONLEA'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'UNALLOC'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE Namespace = 'https://ceds.ed.gov/element/000581'
		AND edfi.Descriptor.CodeValue = 'Perkins LEP')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000581'
			  ,'Perkins LEP'
			  ,'LEP Status (Perkins)'
			  ,'Perkins Limited English Proficiency'
			  ,NULL 
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END


	-- new descriptors - MEP Program enrollment type
	SET @NameSpace = 'https://ceds.ed.gov/element/000437'
	SET @CodeValue = '01'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '02'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '03'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '04'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '05'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '06'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)


	-- ============== ADD Mep Project Type Descriptors
	SET @NameSpace = 'https://ceds.ed.gov/element/000463'
	SET @CodeValue = 'SchoolDay'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	SET @CodeValue = 'ExtendedDay'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	SET @CodeValue = 'SummerIntersession'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	SET @CodeValue = 'YearRound'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000585'
		AND edfi.Descriptor.CodeValue = 'HighQuartile')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000585'
			  ,'HighQuartile'
			  ,'High poverty quartile school'
			  ,'The school is a high poverty quartile school according to state''s indicator of poverty.'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000585'
		AND edfi.Descriptor.CodeValue = 'LowQuartile')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000585'
			  ,'LowQuartile'
			  ,'Low poverty quartile school'
			  ,'The school is a low poverty quartile school according to state''s indicator of poverty.'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000585'
		AND edfi.Descriptor.CodeValue = 'Neither')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000585'
			  ,'Neither'
			  ,'Neither high nor low poverty quartile school'
			  ,'The school is neither high nor low poverty quartile school according to state''s indicator of poverty.'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GETDATE()
			  ,GETDATE()
		)
	END


	-- FS086 populate extensions DisciplineMethodFirearm
	-- RefDisciplineMethodFirearms
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPNOTMODNOALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPNOTMODNOALT'
			  ,'One year expulsion and no educational services'
			  ,'One year expulsion and no educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPMODALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPMODALT'
			  ,'Expulsion modified to less than one year with educational services'
			  ,'Expulsion modified to less than one year with educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPMODNOALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPMODNOALT'
			  ,'Expulsion modified to less than one year without educational services'
			  ,'Expulsion modified to less than one year without educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'EXPALT')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'EXPALT'
			  ,'One year expulsion and educational services'
			  ,'One year expulsion and educational services is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'REMOVEOTHER')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'REMOVEOTHER'
			  ,'Other reasons such as death, withdrawal, or incarceration'
			  ,'Other reasons such as death, withdrawal, or incarceration is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'OTHERDISACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'OTHERDISACTION'
			  ,'Another type of disciplinary action'
			  ,'Another type of disciplinary action is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000537'
		AND edfi.Descriptor.CodeValue = 'NOACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000537'
			  ,'NOACTION'
			  ,'No disciplinary action taken'
			  ,'No disciplinary action taken is the method used to discipline the student(s) who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO



	-- RefIDEADisciplineMethodFirearm


	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'EXPMOD')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'EXPMOD'
			  ,'Expulsion modified to less than one year with ed services under IDEA'
			  ,'Expulsion modified to less than one year with educational services under IDEA was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'EXPNOTMOD')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'EXPNOTMOD'
			  ,'One year expulsion with educational services under IDEA'
			  ,'One year expulsion with educational services under IDEA was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'REMOVEOTHER')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'REMOVEOTHER'
			  ,'Other reasons such as death, withdrawal, or incarceration'
			  ,'Other reasons such as death, withdrawal, or incarceration was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'OTHERDISACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'OTHERDISACTION'
			  ,'Another type of disciplinary action'
			  ,'Another type of disciplinary action was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000556'
		AND edfi.Descriptor.CodeValue = 'NOACTION')
	BEGIN
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Description],[Id],[LastModifiedDate],[CreateDate])
		VALUES ('https://ceds.ed.gov/element/000556'
			  ,'NOACTION'
			  ,'No disciplinary action taken'
			  ,'No disciplinary action taken was the methods used to discipline student(s) who are children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.'
			  ,NEWID(),GetDate(),GetDate()
		)
	END
	GO

		IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000560'
		AND edfi.Descriptor.CodeValue = 'Yes')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000560'
			  ,'Yes'
			  ,'The alternative uses of funds authority'
			  ,'The LEA is exercising the alternative uses of funds authority'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000560'
		AND edfi.Descriptor.CodeValue = 'No')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000560'
			  ,'No'
			  ,'No alternative uses of funds authority'
			  ,'The LEA is eligible but is not exercising the alternative uses of funds authority'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/000560'
		AND edfi.Descriptor.CodeValue = 'NA')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/000560'
			  ,'NA'
			  ,'The LEA is not eligible'
			  ,'The LEA is not eligible to use alternative uses of funds authority'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,NEWID()
			  ,GetDate()
			  ,GetDate()
		)
	END



	-- TitleIII Descriptors =====================================================================

	DECLARE @codeValue varchar(100), @desc varchar(100), @namespace varchar(100)
	set @codeValue = 'MISSING'
	set  @desc = 'The status of the indicator for a specific school is not available.'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = 'uri://ed-fi.org/IndicatorStatusDescriptor' and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT 'uri://ed-fi.org/IndicatorStatusDescriptor', @codeValue, @desc, @desc

	set @codeValue = 'NOSTUDENTS' 
	set @desc = 'No students in the subgroup'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = 'uri://ed-fi.org/IndicatorStatusDescriptor' and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT 'uri://ed-fi.org/IndicatorStatusDescriptor', @codeValue, @desc, @desc

	set @codeValue = 'STTDEF'
	set @desc = 'State defined status'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = 'uri://ed-fi.org/IndicatorStatusDescriptor' and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT 'uri://ed-fi.org/IndicatorStatusDescriptor', @codeValue, @desc, @desc

	set @codeValue = 'TOOFEW'
	set @desc = 'Too few students'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = 'uri://ed-fi.org/IndicatorStatusDescriptor' and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT 'uri://ed-fi.org/IndicatorStatusDescriptor', @codeValue, @desc, @desc

	--------------------------------------

	set @codeValue = 'ECODIS'
	set @desc = 'Economically Disadvantaged (ED) Students'
	set @namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'LEP'
	set @desc = 'English learner'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc


	set @codeValue = 'MA'
	set @desc = 'Asian'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc


	set @codeValue = 'MAN'
	set @desc = 'American Indian \ Alaska Native \ Native American'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'MAP'
	set @desc = 'Asian \ Pacific Islander'
	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc


	set @codeValue = 'MB'
	set @desc = 'Black (not Hispanic) African American'
	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'MF'
	set @desc = 'Filipino'
	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'MHL'
	set @desc = 'Hispanic \ Latino'
	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'MHN'
	set @desc = 'Hispanic (not Puerto Rican)'
	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'MM'
	set @desc = 'Multicultural \ Multiethnic \ Multiracial \ other'
	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'MNP'
	set @desc = 'Native Hawaiian \ other Pacific Islander \ Pacific Islander'
	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	------------------------------------------------------------------
	set @codeValue = 'AllStudents'
	set  @desc = 'All Students'
	SET @namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'DisabilityStatus'
	set  @desc = 'Disability Status'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'EconomicallyDisadvantagedStatus'
	set  @desc = 'Economically DisadvantagedStatus'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'EnglishLearnerStatus'
	set  @desc = 'English Learner Status'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'RaceEthnicity'
	set  @desc = 'Race Ethnicity'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	-------------------------------------------------
	set @codeValue = 'AcademicAchievementIndicatorStatus'
	set  @desc = 'Academic Achievement Indicator Status'
	SET @namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'GraduationRateIndicatorStatus'
	set  @desc = 'Graduation Rate Indicator Status'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'OtherAcademicIndicatorStatus'
	set  @desc = 'Other Academic Indicator Status'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'ProgressAchievingEnglishLanguageProficiency'
	set  @desc = 'Progress Achieving English Language Proficiency Indicator Status'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc

	set @codeValue = 'SchoolQualityOrStudentSuccessIndicatorStatus'
	set  @desc = 'School Quality or Student Success Indicator Status'

	IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE NameSpace = @namespace and CodeValue = @codeValue)
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @namespace, @codeValue, @desc, @desc


	-- new descriptors - Program Type Food Eligibility
	SET @NameSpace = 'uri://ed-fi.org/ProgramTypeDescriptor'
	SET @CodeValue = 'Food Service Program'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)


	-- new descriptors - NSLP
	SET @NameSpace = 'https://ceds.ed.gov/element/001767'
	SET @CodeValue = 'NSLPWOPRO'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'NSLPPRO1'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'NSLPPRO2'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'NSLPPRO3'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'NSLPCEO'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'NSLPNO'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	-- Virtual School type
	SET @NameSpace = 'https://ceds.ed.gov/element/001766'
	SET @CodeValue = 'FaceVirtual'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'FullVirtual'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'NotVirtual'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = 'SupplementalVirtual'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)


	-- Shared Time Indicator
	SET @NameSpace = 'https://ceds.ed.gov/element/000257'
	SET @CodeValue = 'Yes'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @NameSpace = 'https://ceds.ed.gov/element/000257'
	SET @CodeValue = 'No'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)


	-- reconstituted status
	SET @NameSpace = 'https://ceds.ed.gov/element/000230'
	SET @CodeValue = 'Yes'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @NameSpace = 'https://ceds.ed.gov/element/000230'
	SET @CodeValue = 'No'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)


	-- new descriptors - MEP Program enrollment type
	SET @NameSpace = 'https://ceds.ed.gov/element/000437'
	SET @CodeValue = '01'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '02'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '03'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '04'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '05'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)
	SET @CodeValue = '06'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)


	-- ============== ADD Mep Project Type Descriptors
	SET @NameSpace = 'https://ceds.ed.gov/element/000463'
	SET @CodeValue = 'SchoolDay'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	SET @CodeValue = 'ExtendedDay'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	SET @CodeValue = 'SummerIntersession'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

	SET @CodeValue = 'YearRound'
	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE
		Namespace = @NameSpace AND CodeValue = @CodeValue)
		INSERT INTO edfi.Descriptor ([Namespace],[CodeValue],[ShortDescription],[Id],[LastModifiedDate],[CreateDate]) VALUES (
			@NameSpace,@CodeValue,@CodeValue,NEWID(),GETDATE(),GETDATE()
		)

