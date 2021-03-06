﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/

INSERT INTO [edfi].[StudentEducationOrganizationAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[LastModifiedDate]
           ,[CreateDate]
           ,[LimitedEnglishProficiencyDescriptorId]
           ,[SexDescriptorId]
)
SELECT  ga.[StudentUSI]
		,ga.EducationOrganizationId
		,ga.LastModifiedDate
		,ga.CreateDate
		, 564
      ,1387
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] ga
 left JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociation] sa ON ga.StudentUSI = sa.StudentUSI
    where sa.StudentUSI is null