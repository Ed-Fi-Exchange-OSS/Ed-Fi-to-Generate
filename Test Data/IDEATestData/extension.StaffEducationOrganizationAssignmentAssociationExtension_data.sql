﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
           ([StaffUSI]
		   ,[BeginDate]
           ,[EducationOrganizationId]
           ,[StaffClassificationDescriptorId]

           ,[SpecialEducationAgeGroupTaughtDescriptorId]
           ,[SpecialEducationSupportServicesCategoryDescriptorId]
           ,[ParaprofessionalQualificationDescriptorId]
           ,[TitleIProgramStaffCategoryDescriptorId]
         --  ,[InexperiencedStatusDescriptorId]
         --  ,[EmergencyorProvisionalCredentialStatusDescriptorId]
         --  ,[OutOfFieldStatusDescriptorId]
           ,[RecordStartDateTime]
           ,[RecordEndDateTime]
           )
SELECT  [StaffUSI]
,[BeginDate]
      ,[EducationOrganizationId]
      ,[StaffClassificationDescriptorId]
	  , 3009  [SpecialEducationAgeGroupTaughtDescriptorId] --3 through 5
	  , 4035 [SpecialEducationSupportServicesCategoryDescriptorId] -- Audiologists
	  , 4030 [ParaprofessionalQualificationDescriptorId] -- Qualified
	  , 4046 [TitleIProgramStaffCategoryDescriptorId] -- TitleIAdministrator
	  , '2017-07-01'
	  , '2018-06-30'
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StaffEducationOrganizationAssignmentAssociation]
  where StaffUSI = 1334
GO


