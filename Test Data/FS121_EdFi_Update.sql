﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


  update sm
  SET QualifyingArrivalDate = '2017-09-15'
   FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentMigrantEducationProgramAssociation] sm

     Update ssa
  set entrydate = '2017-10-15'
   FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa

   For FS141
      INSERT INTO [edfi].[StudentAcademicRecordDiploma]
           ([StudentUSI]
           ,[SchoolYear]
           ,[TermDescriptorId]
           ,[EducationOrganizationId]
           ,[DiplomaAwardDate]
           ,[CTECompleter]
           ,[CreateDate]
           ,[DiplomaLevelDescriptorId]
           ,[DiplomaTypeDescriptorId])

	select 20002, 2018, 722,  255901012, '2018-05-25', 1, GETDATE(), 925, 1568