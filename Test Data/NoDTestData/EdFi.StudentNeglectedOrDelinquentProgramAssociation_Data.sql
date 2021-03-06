﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/
INSERT INTO [edfi].[GeneralStudentProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[EndDate]
           ,[ReasonExitedDescriptorId]
           ,[ServedOutsideOfRegularSession]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Discriminator])
SELECT  [BeginDate]
      ,[EducationOrganizationId]
      ,[ProgramEducationOrganizationId]
      ,[ProgramName]
      ,[ProgramTypeDescriptorId]
      ,21656
      ,[EndDate]
      ,[ReasonExitedDescriptorId]
      ,[ServedOutsideOfRegularSession]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,[Discriminator]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation]
    where StudentUSI = 22453

	INSERT INTO [edfi].[StudentNeglectedOrDelinquentProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[NeglectedOrDelinquentProgramDescriptorId]
           ,[ELAProgressLevelDescriptorId]
           ,[MathematicsProgressLevelDescriptorId])
SELECT  [BeginDate]
      ,[EducationOrganizationId]
      ,[ProgramEducationOrganizationId]
      ,[ProgramName]
      ,[ProgramTypeDescriptorId]
      ,21656
      ,[NeglectedOrDelinquentProgramDescriptorId]
      ,[ELAProgressLevelDescriptorId]
      ,[MathematicsProgressLevelDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentNeglectedOrDelinquentProgramAssociation]
  where StudentUSI = 22453