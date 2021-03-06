﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/

use EdFi_Sample_ODS_Data_For_Generate

declare @AddressTypeDescriptorId int

select @AddressTypeDescriptorId = DescriptorId from edfi.descriptor where Namespace = 'uri://ed-fi.org/AddressTypeDescriptor' AND CodeValue = 'Mailing'

INSERT INTO [edfi].[EducationOrganizationAddress]
           (
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
           ,[LocaleDescriptorId])
SELECT  addr1.[EducationOrganizationId]
      ,addr1.[StreetNumberName]
      ,addr1.[ApartmentRoomSuiteNumber]
      ,addr1.[BuildingSiteNumber]
      ,addr1.[City]
      ,addr1.[PostalCode]
      ,addr1.[NameOfCounty]
      ,addr1.[CountyFIPSCode]
      ,addr1.[Latitude]
      ,addr1.[Longitude]
      ,addr1.[CreateDate]
      ,addr1.[DoNotPublishIndicator]
      ,@AddressTypeDescriptorId
      ,addr1.[StateAbbreviationDescriptorId]
      ,addr1.[CongressionalDistrict]
      ,addr1.[LocaleDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationAddress] addr1
  LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationAddress] addr2
	ON addr1.EducationOrganizationId = addr2.EducationOrganizationId AND addr2.AddressTypeDescriptorId = @AddressTypeDescriptorId
WHERE addr2.EducationOrganizationId IS NULL
