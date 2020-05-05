

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/NetworkPurposeDescriptor'
		AND edfi.Descriptor.CodeValue = 'CharterSchoolManagement')
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
			   'uri://ed-fi.org/NetworkPurposeDescriptor'
			  ,'CharterSchoolManagement'
			  ,'CharterSchoolManagement'
			  ,'CharterSchoolManagement'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'e5965618-41a0-4eba-ad90-afd09dde1c46'
			  ,'1/31/2019 17:10'
			  ,'1/31/2019 17:10'
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/NetworkPurposeDescriptor'
		AND edfi.Descriptor.CodeValue = 'CharterSchoolApproval')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			--  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/NetworkPurposeDescriptor'
			  ,'CharterSchoolApproval'
			  ,'Charter School Approval Agency'
			  ,'Charter School Approval Agency'
			  ,NULL
			  ,NULL
			  ,NULL
			--  ,'e5965618-41a0-4eba-ad90-afd09dde1c46'
			  ,'1/31/2019 17:10'
			  ,'1/31/2019 17:10'
		)
	END

  DECLARE @NetworkPurposeDescriptorId int 
  SELECT @NetworkPurposeDescriptorId = DescriptorId FROM edfi.Descriptor WHERE CodeValue = 'CharterSchoolApproval'


  IF NOT EXISTS (SELECT 1 FROM [edfi].[NetworkPurposeDescriptor] WHERE [NetworkPurposeDescriptorId] = @NetworkPurposeDescriptorId)
	INSERT INTO [edfi].[NetworkPurposeDescriptor] ([NetworkPurposeDescriptorId]) 
		SELECT @NetworkPurposeDescriptorId


  IF NOT EXISTS (SELECT 1 FROM [edfi].[EducationOrganizationNetwork] WHERE [NetworkPurposeDescriptorId] = @NetworkPurposeDescriptorId)
	INSERT INTO [edfi].[EducationOrganizationNetwork]
           ([EducationOrganizationNetworkId]
           ,[NetworkPurposeDescriptorId])
     VALUES
           (255901
           ,@NetworkPurposeDescriptorId)


	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor'
		AND edfi.Descriptor.CodeValue = 'IRS - EIN')
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
			   'uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor'
			  ,'IRS - EIN'
			  ,'IRS - EIN'
			  ,'IRS - EIN'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'64f99924-7161-4014-a2c6-1179322fcfac'
			  ,'1/31/2019 17:13'
			  ,'1/31/2019 17:13'
		)
	END



	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/001650'
		AND edfi.Descriptor.CodeValue = 'CMO')
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
			   'https://ceds.ed.gov/element/001650'
			  ,'CMO'
			  ,'Charter Management Organization'
			  ,'Charter Management Organization'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'6ae63648-a697-4830-979e-85935981a548'
			  ,'1/31/2019 17:16'
			  ,'1/31/2019 17:16'
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/001650'
		AND edfi.Descriptor.CodeValue = 'EMO')
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
			   'https://ceds.ed.gov/element/001650'
			  ,'EMO'
			  ,'Education Management Organization'
			  ,'Education Management Organization'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'67eac73a-c1fd-46af-8134-acdae15493fd'
			  ,'1/31/2019 17:16'
			  ,'1/31/2019 17:16'
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/001650'
		AND edfi.Descriptor.CodeValue = 'Other')
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
			   'https://ceds.ed.gov/element/001650'
			  ,'Other'
			  ,'Other Management Organization'
			  ,'Other Management Organization'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'35ecb648-cad3-4da5-9876-aa7e0157866e'
			  ,'1/31/2019 17:16'
			  ,'1/31/2019 17:16'
		)
	END

	-- Add new organization
	-- detect Charter Schools Management organization
	DECLARE @CharterSchoolManagement TABLE (EducationOrganizationId INT)
	INSERT @CharterSchoolManagement 
	SELECT edorg.EducationOrganizationId
	FROM edfi.EducationOrganization edorg
	INNER JOIN edfi.EducationOrganizationNetwork edorgnet on edorgnet.EducationOrganizationNetworkId=edorg.EducationOrganizationId
	INNER JOIN extension.EducationOrganizationNetworkExtension edorgnetExt on edorgnetExt.EducationOrganizationNetworkId=edorg.EducationOrganizationId
	INNER JOIN edfi.Descriptor npd ON npd.DescriptorId = edorgnet.NetworkPurposeDescriptorId
	INNER JOIN edfi.Descriptor csmorg ON csmorg.DescriptorId=edorgnetExt.CharterSchoolManagementOrganizationTypeDescriptorId
	JOIN [edfi].EducationOrganizationIdentificationCode edorgcodecs 
		ON edorgcodecs.EducationOrganizationId=edorg.EducationOrganizationId
	JOIN [edfi].Descriptor edorgidsdcs 
		ON edorgcodecs.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdcs.DescriptorId
	WHERE edorgidsdcs.CodeValue = 'IRS - EIN' 
		AND npd.CodeValue = 'CharterSchoolManagement'

	-- declare new descriptors
	DECLARE @OrganizationId INT, 
		@NetworkPurposeDescriptorId INT, 
		@CharterSchoolManagementOrganizationTypeDescriptorId_1 INT, 
		@CharterSchoolManagementOrganizationTypeDescriptorId_2 INT,
		@CharterSchoolManagementOrganizationTypeDescriptorId_3 INT,
		@OperationalStatus INT, @EducationOrganizationIdentificationSystemDescriptorId INT,
		@AddressTypeDescriptorId INT, @StateAbbreviationDescriptorId INT

	SET @OrganizationId = 255901301
	SET @OperationalStatus = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/OperationalStatusDescriptor%' AND CodeValue='Active')

	SET @NetworkPurposeDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/NetworkPurposeDescriptor%' AND CodeValue='CharterSchoolManagement')

	SET @EducationOrganizationIdentificationSystemDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor%' AND CodeValue='IRS - EIN')

	SET @CharterSchoolManagementOrganizationTypeDescriptorId_1 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'https://ceds.ed.gov/element/001650' AND CodeValue='CMO')
	SET @CharterSchoolManagementOrganizationTypeDescriptorId_2 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'https://ceds.ed.gov/element/001650' AND CodeValue='EMO')
	SET @CharterSchoolManagementOrganizationTypeDescriptorId_3 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'https://ceds.ed.gov/element/001650' AND CodeValue='Other')
	SET @AddressTypeDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'uri://ed-fi.org/AddressTypeDescriptor' AND CodeValue='Physical')
	SET @StateAbbreviationDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'uri://ed-fi.org/StateAbbreviationDescriptor' AND CodeValue='TX')

	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganizationIdentificationSystemDescriptor 
		WHERE edfi.EducationOrganizationIdentificationSystemDescriptor.EducationOrganizationIdentificationSystemDescriptorId = @EducationOrganizationIdentificationSystemDescriptorId)
	BEGIN
		INSERT INTO edfi.EducationOrganizationIdentificationSystemDescriptor (EducationOrganizationIdentificationSystemDescriptorId)
		VALUES (@EducationOrganizationIdentificationSystemDescriptorId)
	END

	IF NOT EXISTS (SELECT * FROM extension.CharterSchoolManagementOrganizationTypeDescriptor 
		WHERE extension.CharterSchoolManagementOrganizationTypeDescriptor.CharterSchoolManagementOrganizationTypeDescriptorId = @CharterSchoolManagementOrganizationTypeDescriptorId_1)
	BEGIN
		INSERT INTO extension.CharterSchoolManagementOrganizationTypeDescriptor (CharterSchoolManagementOrganizationTypeDescriptorId)
		VALUES (@CharterSchoolManagementOrganizationTypeDescriptorId_1)
	END

	IF NOT EXISTS (SELECT * FROM edfi.NetworkPurposeDescriptor 
		WHERE edfi.NetworkPurposeDescriptor.NetworkPurposeDescriptorId = @NetworkPurposeDescriptorId)
	BEGIN
		INSERT INTO edfi.NetworkPurposeDescriptor (NetworkPurposeDescriptorId)
		VALUES (@NetworkPurposeDescriptorId)
	END

/*
	-- delete from filter table
	ALTER TABLE [edfi].EducationOrganizationNetwork 
		DROP CONSTRAINT FK_EducationOrganizationNetwork_CharterSchoolManagementOrganizationTypeDescriptor
	TRUNCATE TABLE extension.CharterSchoolManagementOrganizationTypeDescriptor 
	ALTER TABLE [edfi].[EducationOrganizationNetwork]  WITH CHECK 
		ADD  CONSTRAINT [FK_EducationOrganizationNetwork_CharterSchoolManagementOrganizationTypeDescriptor] 
		FOREIGN KEY([CharterSchoolManagementOrganizationTypeDescriptorId])
		REFERENCES [extension].[CharterSchoolManagementOrganizationTypeDescriptor] ([CharterSchoolManagementOrganizationTypeDescriptorId])
	
	-- delete from filter table
	ALTER TABLE [edfi].EducationOrganizationNetwork 
		DROP CONSTRAINT FK_EducationOrganizationNetwork_NetworkPurposeDescriptor
	DELETE FROM edfi.NetworkPurposeDescriptor 
		WHERE NetworkPurposeDescriptorId=@NetworkPurposeDescriptorId
	DELETE FROM edfi.EducationOrganizationNetwork
		WHERE edfi.EducationOrganizationNetwork.EducationOrganizationNetworkId in (
		SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)
	ALTER TABLE [edfi].[EducationOrganizationNetwork]  WITH CHECK 
		ADD  CONSTRAINT [FK_EducationOrganizationNetwork_NetworkPurposeDescriptor] 
		FOREIGN KEY([NetworkPurposeDescriptorId])
		REFERENCES [edfi].[NetworkPurposeDescriptor] ([NetworkPurposeDescriptorId])

	-- delete from filter table
	ALTER TABLE [edfi].EducationOrganizationIdentificationCode 
		DROP CONSTRAINT FK_EducationOrganizationIdentificationCode_EducationOrganizationIdentificationSystemDescriptor
	DELETE FROM edfi.EducationOrganizationIdentificationSystemDescriptor 
		WHERE EducationOrganizationIdentificationSystemDescriptorId=@EducationOrganizationIdentificationSystemDescriptorId
	DELETE FROM edfi.EducationOrganizationIdentificationCode
		WHERE EducationOrganizationId IN (SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)
	ALTER TABLE [edfi].[EducationOrganizationIdentificationCode]  WITH CHECK 
		ADD  CONSTRAINT [FK_EducationOrganizationIdentificationCode_EducationOrganizationIdentificationSystemDescriptor] 
		FOREIGN KEY([EducationOrganizationIdentificationSystemDescriptorId])
		REFERENCES [edfi].[EducationOrganizationIdentificationSystemDescriptor] ([EducationOrganizationIdentificationSystemDescriptorId])


  delete from [edfi].[EducationOrganizationIdentificationCode] where [EducationOrganizationId]=255901301
  delete from [edfi].[EducationOrganization] where [EducationOrganizationId]=255901301

	*/

	-- delete from EducationOrganization address
	DELETE FROM edfi.EducationOrganizationAddress
	WHERE edfi.EducationOrganizationAddress.EducationOrganizationId in (
	SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)


	-- delete from EducationOrganization
	DELETE FROM edfi.EducationOrganization
	WHERE edfi.EducationOrganization.EducationOrganizationId in (
	SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)

	-- delete from EducationOrganizationIdentificationCode
	DELETE FROM edfi.EducationOrganizationIdentificationCode
		WHERE EducationOrganizationId IN (SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)

	-- delete from EducationOrganizationNetwork
	DELETE FROM edfi.EducationOrganizationNetwork
		WHERE edfi.EducationOrganizationNetwork.EducationOrganizationNetworkId in (
		SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)

	-- delete from extension.EducationOrganizationNetworkExtension
	DELETE FROM extension.EducationOrganizationNetworkExtension
		WHERE extension.EducationOrganizationNetworkExtension.EducationOrganizationNetworkId in (
		SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)
		
	-- start inserting test data
	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganization WHERE EducationOrganizationId = @OrganizationId)
	INSERT INTO edfi.EducationOrganization (
		 [EducationOrganizationId]
		,[NameOfInstitution]
		,[ShortNameOfInstitution]
		,[WebSite]
		,[Id]
		,[LastModifiedDate]
		,[CreateDate]
		,[OperationalStatusDescriptorId]
		,[Discriminator]
		)
	VALUES (
		@OrganizationId
		, 'Test CS Management Organization'
		, 'TCS MNGMT'
		, 'http://www.NISD.edu/MNGMT/'
		, 'ed199c03-a983-4f50-bd9c-9adc4613b187'
		, '2018-06-25 16:57'
		, '2018-06-25 16:57'
		, @OperationalStatus
		, 'edfi.Management'
		)

	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganizationNetwork )
	INSERT INTO edfi.EducationOrganizationNetwork (
		[EducationOrganizationNetworkId]
		,NetworkPurposeDescriptorId
		)
	VALUES (
		@OrganizationId
		, @NetworkPurposeDescriptorId
		)

	-- extension.EducationOrganizationNetworkExtension
	IF NOT EXISTS (SELECT * FROM extension.EducationOrganizationNetworkExtension WHERE EducationOrganizationNetworkId=@OrganizationId)
	INSERT INTO extension.EducationOrganizationNetworkExtension (
		[EducationOrganizationNetworkId]
		,[CharterSchoolManagementOrganizationTypeDescriptorId]
		, [CreateDate]
		)
	VALUES (
		@OrganizationId
		, @CharterSchoolManagementOrganizationTypeDescriptorId_1
		, GETDATE()
		)

	-- EducationOrganizationIdentificationCode
	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganizationIdentificationCode 
		WHERE [EducationOrganizationId]=@OrganizationId
		AND [EducationOrganizationIdentificationSystemDescriptorId] =  @EducationOrganizationIdentificationSystemDescriptorId)
	INSERT INTO edfi.EducationOrganizationIdentificationCode (
		 [EducationOrganizationId]
		,[IdentificationCode]
		,[CreateDate]
		,[EducationOrganizationIdentificationSystemDescriptorId]
		)
	VALUES
		(
		 @OrganizationId
		,@OrganizationId
		,'2018-06-25 16:57'
		,@EducationOrganizationIdentificationSystemDescriptorId
		)

	-- address
	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganizationAddress WHERE [EducationOrganizationId]=@OrganizationId)
	INSERT INTO edfi.EducationOrganizationAddress (
		 [EducationOrganizationId]
		,[StreetNumberName]
		,[City]
		,[PostalCode]
		,[NameOfCounty]
		,[CreateDate]
		,[AddressTypeDescriptorId]
		,[StateAbbreviationDescriptorId]
		)
	VALUES (
		@OrganizationId
		, '1000 Hickory Lane'
		, 'Northridge'
		, '77535'
		, 'Travis'
		, '2018-06-25 16:57'
		, @AddressTypeDescriptorId
		, @StateAbbreviationDescriptorId
	)