	USE [EdFi_Sample_ODS_Data_For_Generate]

	/*
	This script performs its actions in the following order:
	1. Disable foreign-key constraints.
	2. Perform DELETE commands. 
	3. Perform UPDATE commands.
	4. Perform INSERT commands.
	5. Re-enable foreign-key constraints.
	Please back up your target database before running this script.
	*/
	SET NUMERIC_ROUNDABORT OFF
	GO
	SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
	GO

	-- detect Charter Schools
	DECLARE @CharterSchool TABLE (SchoolId INT, CharterApprovalAgencyTypeDescriptorId INT, SchoolTypeDescriptorId INT)
	INSERT @CharterSchool 
	SELECT SchoolId, CharterApprovalAgencyTypeDescriptorId, SchoolTypeDescriptorId
	FROM edfi.School
	INNER JOIN edfi.Descriptor d ON d.DescriptorId = edfi.School.CharterStatusDescriptorId
	WHERE d.Namespace LIKE '%uri://ed-fi.org/CharterStatusDescriptor%' AND CodeValue <> 'Not a Charter School'

	-- delete from School table
	DELETE FROM edfi.DisciplineAction
	WHERE ResponsibilitySchoolId IN (
		SELECT SchoolId FROM edfi.School
		WHERE edfi.School.CharterApprovalAgencyTypeDescriptorId in (
		SELECT cs.CharterApprovalAgencyTypeDescriptorId FROM @CharterSchool cs)
	)

	DELETE FROM edfi.StudentSchoolAssociation
	WHERE SchoolId IN (
		SELECT SchoolId FROM edfi.School
		WHERE edfi.School.CharterApprovalAgencyTypeDescriptorId in (
		SELECT cs.CharterApprovalAgencyTypeDescriptorId FROM @CharterSchool cs)
	)


	DELETE FROM edfi.School
	WHERE edfi.School.CharterApprovalAgencyTypeDescriptorId in (
	SELECT cs.CharterApprovalAgencyTypeDescriptorId FROM @CharterSchool cs)

	-- delete from filter table
	ALTER TABLE [edfi].School DROP CONSTRAINT FK_School_CharterApprovalAgencyTypeDescriptor
	TRUNCATE TABLE edfi.CharterApprovalAgencyTypeDescriptor
	ALTER TABLE [edfi].[School]  WITH CHECK ADD  CONSTRAINT [FK_School_CharterApprovalAgencyTypeDescriptor] FOREIGN KEY([CharterApprovalAgencyTypeDescriptorId])
	REFERENCES [edfi].[CharterApprovalAgencyTypeDescriptor] ([CharterApprovalAgencyTypeDescriptorId])

	DELETE FROM edfi.CharterApprovalAgencyTypeDescriptor 
	WHERE edfi.CharterApprovalAgencyTypeDescriptor.CharterApprovalAgencyTypeDescriptorId in (
	SELECT cs.CharterApprovalAgencyTypeDescriptorId FROM @CharterSchool cs)

	-- delete from EducationOrganization address
	DELETE FROM edfi.EducationOrganizationAddress
	WHERE edfi.EducationOrganizationAddress.EducationOrganizationId in (
	SELECT cs.SchoolId FROM @CharterSchool cs)

	-- delete from EducationOrganization
	DELETE FROM edfi.EducationOrganization
	WHERE edfi.EducationOrganization.EducationOrganizationId in (
	SELECT cs.SchoolId FROM @CharterSchool cs)

	-- insert new charter school into EducationOrganization table
	-- Operational Status
	DECLARE @OperationalStatus INT, @OrganizationId INT, @LeaId INT, @AdministrativeFundingControlDescriptorId INT
		, @CharterStatusDescriptorId INT, @SchoolTypeDescriptorId INT
		, @CharterApprovalAgencyTypeDescriptorId_1 INT, @CharterApprovalAgencyTypeDescriptorId_2 INT
		, @CharterApprovalAgencyTypeDescriptorId_3 INT, @CharterApprovalAgencyTypeDescriptorId_4 INT
		, @TitleIPartASchoolDesignationDescriptorId INT
		, @AddressTypeDescriptorId INT, @StateAbbreviationDescriptorId INT

	SET @OrganizationId = 255901201
	SET @LeaId = 255901
	SET @OperationalStatus = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/OperationalStatusDescriptor%' AND CodeValue='Active')

	SET @AdministrativeFundingControlDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/AdministrativeFundingControlDescriptor%' AND CodeValue='Public School')

	SET @CharterStatusDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/CharterStatusDescriptor%' AND CodeValue='School Charter')

	SET @SchoolTypeDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/SchoolTypeDescriptor%' AND CodeValue='Regular')

	SET @CharterApprovalAgencyTypeDescriptorId_1 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/CharterApprovalAgencyTypeDescriptor%' AND CodeValue='Other')
	SET @CharterApprovalAgencyTypeDescriptorId_2 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/CharterApprovalAgencyTypeDescriptor%' AND CodeValue='Public charter school board')
	SET @CharterApprovalAgencyTypeDescriptorId_3 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/CharterApprovalAgencyTypeDescriptor%' AND CodeValue='State board of education')
	SET @CharterApprovalAgencyTypeDescriptorId_4 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/CharterApprovalAgencyTypeDescriptor%' AND CodeValue='University')

	SET @TitleIPartASchoolDesignationDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/TitleIPartASchoolDesignationDescriptor%' AND CodeValue='Not A Title I School')

	SET @AddressTypeDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/AddressTypeDescriptor%' AND CodeValue='Physical')
	SET @StateAbbreviationDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/StateAbbreviationDescriptor%' AND CodeValue='TX')

	IF NOT EXISTS(SELECT 1 FROM edfi.EducationOrganization WHERE [EducationOrganizationId] = @OrganizationId)
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
		, 'Test1 High School'
		, 'T1HS'
		, 'http://www.NISD.edu/T1HS/'
		, '9a66b41e-2d99-4e5f-9381-2916ba07af7b'
		, '2018-06-25 16:57'
		, '2018-06-25 16:57'
		, @OperationalStatus
		, 'edfi.School'
		)

	IF NOT EXISTS (SELECT * FROM edfi.CharterApprovalAgencyTypeDescriptor 
		WHERE edfi.CharterApprovalAgencyTypeDescriptor.CharterApprovalAgencyTypeDescriptorId = @CharterApprovalAgencyTypeDescriptorId_1)
	BEGIN
		INSERT INTO edfi.CharterApprovalAgencyTypeDescriptor (CharterApprovalAgencyTypeDescriptorId)
		VALUES (@CharterApprovalAgencyTypeDescriptorId_1)
	END

	-- insert into School
	IF NOT EXISTS(SELECT 1 FROM edfi.School WHERE [SchoolId] = @OrganizationId)
	INSERT INTO edfi.School (
		   [SchoolId]
		  ,[LocalEducationAgencyId]
		  ,[AdministrativeFundingControlDescriptorId]
		  ,[CharterApprovalSchoolYear]
		  ,[CharterApprovalAgencyTypeDescriptorId]
		  ,[CharterStatusDescriptorId]
		  ,[InternetAccessDescriptorId]
		  ,[MagnetSpecialProgramEmphasisSchoolDescriptorId]
		  ,[SchoolTypeDescriptorId]
		  ,[TitleIPartASchoolDesignationDescriptorId]
		  )
	VALUES (
		@OrganizationId,
		@LeaId,
		@AdministrativeFundingControlDescriptorId,
		NULL,
		@CharterApprovalAgencyTypeDescriptorId_1,
		@CharterStatusDescriptorId,
		NULL,
		NULL,
		@SchoolTypeDescriptorId,
		@TitleIPartASchoolDesignationDescriptorId
		)

	IF NOT EXISTS(SELECT 1 FROM edfi.EducationOrganizationAddress WHERE [EducationOrganizationId] = @OrganizationId and [AddressTypeDescriptorId] = @AddressTypeDescriptorId)
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
		, '9851 Hickory Lane'
		, 'Northridge'
		, '77535'
		, 'Travis'
		, '2018-06-25 16:57'
		, @AddressTypeDescriptorId
		, @StateAbbreviationDescriptorId
	)

	SET @OrganizationId = 255901202
	IF NOT EXISTS(SELECT 1 FROM edfi.EducationOrganization WHERE [EducationOrganizationId] = @OrganizationId)
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
		, 'Test2 High School'
		, 'T2HS'
		, 'http://www.NISD.edu/T2HS/'
		, '331072e0-037e-4637-b938-b6436bd0a12d'
		, '2018-06-25 16:57'
		, '2018-06-25 16:57'
		, @OperationalStatus
		, 'edfi.School'
		)

	IF NOT EXISTS (SELECT * FROM edfi.CharterApprovalAgencyTypeDescriptor 
		WHERE edfi.CharterApprovalAgencyTypeDescriptor.CharterApprovalAgencyTypeDescriptorId = @CharterApprovalAgencyTypeDescriptorId_2)
	BEGIN
		INSERT INTO edfi.CharterApprovalAgencyTypeDescriptor (CharterApprovalAgencyTypeDescriptorId)
		VALUES (@CharterApprovalAgencyTypeDescriptorId_2)
	END

	-- insert into School
	IF NOT EXISTS(SELECT 1 FROM edfi.School WHERE [SchoolId] = @OrganizationId)
	INSERT INTO edfi.School (
		   [SchoolId]
		  ,[LocalEducationAgencyId]
		  ,[AdministrativeFundingControlDescriptorId]
		  ,[CharterApprovalSchoolYear]
		  ,[CharterApprovalAgencyTypeDescriptorId]
		  ,[CharterStatusDescriptorId]
		  ,[InternetAccessDescriptorId]
		  ,[MagnetSpecialProgramEmphasisSchoolDescriptorId]
		  ,[SchoolTypeDescriptorId]
		  ,[TitleIPartASchoolDesignationDescriptorId]
		  )
	VALUES (
		@OrganizationId,
		@LeaId,
		@AdministrativeFundingControlDescriptorId,
		NULL,
		@CharterApprovalAgencyTypeDescriptorId_2,
		@CharterStatusDescriptorId,
		NULL,
		NULL,
		@SchoolTypeDescriptorId,
		@TitleIPartASchoolDesignationDescriptorId
		)

	IF NOT EXISTS(SELECT 1 FROM edfi.EducationOrganizationAddress WHERE [EducationOrganizationId] = @OrganizationId and [AddressTypeDescriptorId] = @AddressTypeDescriptorId)
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
		, '9852 Hickory Lane'
		, 'Northridge'
		, '77535'
		, 'Travis'
		, '2018-06-25 16:57'
		, @AddressTypeDescriptorId
		, @StateAbbreviationDescriptorId
	)

	SET @OrganizationId = 255901203
	IF NOT EXISTS(SELECT 1 FROM edfi.EducationOrganization WHERE [EducationOrganizationId] = @OrganizationId)
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
		, 'Test3 High School'
		, 'T3HS'
		, 'http://www.NISD.edu/T3HS/'
		, '73ebec2f-fb85-4fb8-8a32-65495114af52'
		, '2018-06-25 16:57'
		, '2018-06-25 16:57'
		, @OperationalStatus
		, 'edfi.School'
		)

	IF NOT EXISTS (SELECT * FROM edfi.CharterApprovalAgencyTypeDescriptor 
		WHERE edfi.CharterApprovalAgencyTypeDescriptor.CharterApprovalAgencyTypeDescriptorId = @CharterApprovalAgencyTypeDescriptorId_3)
	BEGIN
		INSERT INTO edfi.CharterApprovalAgencyTypeDescriptor (CharterApprovalAgencyTypeDescriptorId)
		VALUES (@CharterApprovalAgencyTypeDescriptorId_3)
	END

	-- insert into School
	IF NOT EXISTS(SELECT 1 FROM edfi.School WHERE [SchoolId] = @OrganizationId)
	INSERT INTO edfi.School (
		   [SchoolId]
		  ,[LocalEducationAgencyId]
		  ,[AdministrativeFundingControlDescriptorId]
		  ,[CharterApprovalSchoolYear]
		  ,[CharterApprovalAgencyTypeDescriptorId]
		  ,[CharterStatusDescriptorId]
		  ,[InternetAccessDescriptorId]
		  ,[MagnetSpecialProgramEmphasisSchoolDescriptorId]
		  ,[SchoolTypeDescriptorId]
		  ,[TitleIPartASchoolDesignationDescriptorId]
		  )
	VALUES (
		@OrganizationId,
		@LeaId,
		@AdministrativeFundingControlDescriptorId,
		NULL,
		@CharterApprovalAgencyTypeDescriptorId_3,
		@CharterStatusDescriptorId,
		NULL,
		NULL,
		@SchoolTypeDescriptorId,
		@TitleIPartASchoolDesignationDescriptorId
		)


	IF NOT EXISTS(SELECT 1 FROM edfi.EducationOrganizationAddress WHERE [EducationOrganizationId] = @OrganizationId and [AddressTypeDescriptorId] = @AddressTypeDescriptorId)
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
		, '9853 Hickory Lane'
		, 'Northridge'
		, '77535'
		, 'Travis'
		, '2018-06-25 16:57'
		, @AddressTypeDescriptorId
		, @StateAbbreviationDescriptorId
	)

	SET @OrganizationId = 255901204
	IF NOT EXISTS(SELECT 1 FROM edfi.EducationOrganization WHERE [EducationOrganizationId] = @OrganizationId)
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
		, 'Test4 High School'
		, 'T4HS'
		, 'http://www.NISD.edu/T4HS/'
		, '48c72ca9-7c86-45ac-a036-141d321b925b'
		, '2018-06-25 16:57'
		, '2018-06-25 16:57'
		, @OperationalStatus
		, 'edfi.School'
		)

	IF NOT EXISTS (SELECT * FROM edfi.CharterApprovalAgencyTypeDescriptor 
		WHERE edfi.CharterApprovalAgencyTypeDescriptor.CharterApprovalAgencyTypeDescriptorId = @CharterApprovalAgencyTypeDescriptorId_4)
	BEGIN
		INSERT INTO edfi.CharterApprovalAgencyTypeDescriptor (CharterApprovalAgencyTypeDescriptorId)
		VALUES (@CharterApprovalAgencyTypeDescriptorId_4)
	END

	-- insert into School
	IF NOT EXISTS(SELECT 1 FROM edfi.School WHERE [SchoolId] = @OrganizationId)
	INSERT INTO edfi.School (
		   [SchoolId]
		  ,[LocalEducationAgencyId]
		  ,[AdministrativeFundingControlDescriptorId]
		  ,[CharterApprovalSchoolYear]
		  ,[CharterApprovalAgencyTypeDescriptorId]
		  ,[CharterStatusDescriptorId]
		  ,[InternetAccessDescriptorId]
		  ,[MagnetSpecialProgramEmphasisSchoolDescriptorId]
		  ,[SchoolTypeDescriptorId]
		  ,[TitleIPartASchoolDesignationDescriptorId]
		  )
	VALUES (
		@OrganizationId,
		@LeaId,
		@AdministrativeFundingControlDescriptorId,
		NULL,
		@CharterApprovalAgencyTypeDescriptorId_4,
		@CharterStatusDescriptorId,
		NULL,
		NULL,
		@SchoolTypeDescriptorId,
		@TitleIPartASchoolDesignationDescriptorId
		)

IF NOT EXISTS(SELECT 1 FROM edfi.EducationOrganizationAddress WHERE [EducationOrganizationId] = @OrganizationId and [AddressTypeDescriptorId] = @AddressTypeDescriptorId)
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
		, '9853 Hickory Lane'
		, 'Northridge'
		, '77535'
		, 'Travis'
		, '2018-06-25 16:57'
		, @AddressTypeDescriptorId
		, @StateAbbreviationDescriptorId
	)