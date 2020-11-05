-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentCTEProgramAssociationService]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
		   ,[ServiceDescriptorId]
           ,[StudentUSI]
           ,[ServiceBeginDate]
		)
SELECT [BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
		   ,(Select DescriptorId from Edfi.Descriptor where Namespace = 'uri://ed-fi.org/ServiceDescriptor' And CodeValue = 'Assistive technology device or service')
           ,[StudentUSI]
		   ,'01/15/2019'
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation]
GO


