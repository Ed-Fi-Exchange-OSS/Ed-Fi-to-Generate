-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


DECLARE @EducationOrganizationId INT = 255500
DECLARE @NameOfInstitution NVARCHAR(75) = 'Texas SEA'
DECLARE @WebSite NVARCHAR(255) = 'https://tea.texas.gov'
DECLARE @AddressTypeDescriptorId INT
DECLARE @StateAbbreviationDescriptorId INT

SELECT @AddressTypeDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/AddressTypeDescriptor' AND CodeValue = 'Physical'

SELECT @StateAbbreviationDescriptorId = DescriptorId FROM [edfi].[Descriptor]
	WHERE Namespace = 'uri://ed-fi.org/StateAbbreviationDescriptor' AND CodeValue = 'TX'

IF NOT EXISTS (SELECT * FROM edfi.EducationOrganization 
			WHERE EducationOrganizationId=@EducationOrganizationId
			AND NameOfInstitution=@NameOfInstitution)
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
		) VALUES (
			@EducationOrganizationId
			,@NameOfInstitution
			,@NameOfInstitution
			,@WebSite
			,NEWID()
			,GetDate()
			,GetDate()
			,NULL
			,NULL
		)

IF NOT EXISTS (SELECT * FROM edfi.StateEducationAgency WHERE StateEducationAgencyId=@EducationOrganizationId)
	INSERT INTO edfi.StateEducationAgency (
		StateEducationAgencyId
	) VALUES (
		@EducationOrganizationId
	)

IF NOT EXISTS (SELECT * FROM edfi.EducationOrganizationAddress WHERE EducationOrganizationId=@EducationOrganizationId)
	INSERT INTO edfi.EducationOrganizationAddress (
		[EducationOrganizationId]
		,[StreetNumberName]
		,[ApartmentRoomSuiteNumber]
		,[BuildingSiteNumber]
		,[City]
		,[PostalCode]
		,[NameOfCounty]
		,[CountyFIPSCode]
		,[Latitude]
		,[Longitude]
		,[CreateDate]
		,[DoNotPublishIndicator]
		,[AddressTypeDescriptorId]
		,[StateAbbreviationDescriptorId]
		,[CongressionalDistrict]
		,[LocaleDescriptorId]
	) VALUES (
		@EducationOrganizationId	--[EducationOrganizationId]
		,'1701 N. Congress Avenue'	--[StreetNumberName]
		,NULL						--[ApartmentRoomSuiteNumber]
		,NULL						--[BuildingSiteNumber]
		,'Austin'					--[City]
		,'78701'					--[PostalCode]
		,NULL						--[NameOfCounty]
		,NULL						--[CountyFIPSCode]
		,NULL						--[Latitude]
		,NULL						--[Longitude]
		,GETDATE()					--[CreateDate]
		,NULL						--[DoNotPublishIndicator]
		,@AddressTypeDescriptorId		--[AddressTypeDescriptorId]
		,@StateAbbreviationDescriptorId	--[StateAbbreviationDescriptorId]
		,NULL						--[CongressionalDistrict]
		,NULL						--[LocaleDescriptorId]
	)