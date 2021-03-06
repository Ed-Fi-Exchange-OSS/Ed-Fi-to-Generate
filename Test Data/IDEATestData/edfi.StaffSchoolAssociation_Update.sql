﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [StaffUSI]
      ,[ProgramAssignmentDescriptorId]
      ,[SchoolId]
      ,[SchoolYear]
      ,[Id]
      ,[LastModifiedDate]
      ,[CreateDate]
      ,[CalendarCode]
      ,[Discriminator]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StaffSchoolAssociation]
  where [ProgramAssignmentDescriptorId] = 576

  Update [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StaffSchoolAssociation]
  set [ProgramAssignmentDescriptorId] = 576
  where [StaffUSI] in (8, 10)

  use EdFi_Sample_ODS_Data_For_Generate
  select * from edfi.StaffSchoolAssociationAcademicSubject
  
  update edfi.StaffSchoolAssociationAcademicSubject
  set [ProgramAssignmentDescriptorId] = 576
  where [StaffUSI] in (8)

  Update [edfi].[StaffSchoolAssociationGradeLevel]
    set [ProgramAssignmentDescriptorId] = 576
  where [StaffUSI] in (8, 10)