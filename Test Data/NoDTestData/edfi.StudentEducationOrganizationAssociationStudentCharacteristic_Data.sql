﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/
use EdFi_Sample_ODS_Data_For_Generate

declare @StudentUSI Int
SET @StudentUSI = 21656
declare @EducationOrganizationId int = 255901

declare @StudentCharacteristicDescriptorId int

select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Homeless'
if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI

select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Migrant'
if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI


select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Parent in Military'

if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI


  --Economic Disadvantaged
  select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Economic Disadvantaged'

if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI

  -- Foster Care
    select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Foster Care'

if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI

  select * from [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
  where StudentUSI = 21656

  --select * from edfi.Descriptor where Namespace like '%StudentCharacteristicDescriptor%'

  