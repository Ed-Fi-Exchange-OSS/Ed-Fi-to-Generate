﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [StudentUSI]
      ,[SchoolId]
      ,[SchoolYear]
      ,[EntryDate]
      ,[EntryGradeLevelDescriptorId]
      ,[EntryTypeDescriptorId]
      ,[RepeatGradeIndicator]
      ,[SchoolChoiceTransfer]
      ,[ExitWithdrawDate]
      ,[ExitWithdrawTypeDescriptorId]
      ,[ResidencyStatusDescriptorId]
      ,[PrimarySchool]
      ,[EmployedWhileEnrolled]
      ,[ClassOfSchoolYear]
      ,[EducationOrganizationId]
      ,[GraduationPlanTypeDescriptorId]
      ,[GraduationSchoolYear]
      ,[Id]
      ,[LastModifiedDate]
      ,[CreateDate]
      ,[CalendarCode]
      ,[EntryGradeLevelReasonDescriptorId]
      ,[Discriminator]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation]
  where entrydate > '10-01-2017'

  Update ssa
  set entrydate = '2017-10-01'
   FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa
   where entrydate = '2017-10-15'
