﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [OrganizationRelationshipId]
      ,[Parent_OrganizationId]
      ,[OrganizationId]
      ,[RefOrganizationRelationshipId]
  FROM [generate].[ODS].[OrganizationRelationship]


  SELECT * FROM ods.PersonStatus   WHERE PersonId = 225886



  use generate
    select * from [ODS].[PersonIdentifier] where Identifier = '604872'

	    select * from [ODS].[PersonDisability] where Identifier = '604872'

	  SELECT * FROM ods.OrganizationPersonRole r 
--  join ods.OrganizationDetail o on o.OrganizationId = r.OrganizationId
  WHERE R.PersonId = 21637

  select * from ods.OrganizationDetail where OrganizationId in(18, 34)2

    select * from ods.OrganizationIdentifier where OrganizationId in( 18)

	    select * from ods.OrganizationIdentifier where  Identifier = '255901107'

		select * from ods.OrganizationRelationship where OrganizationId = 18

		select * from rds.DimStudents where StateStudentIdentifier  = '604872'


		select * from rds.DimIdeaStatuses

		SELECT *
      ,[DimRaceId]
  FROM [generate].[RDS].[FactStudentDisciplines]
  where DimStudentId = 787486

	 Update ods.OrganizationPersonRole 
	 set EntryDate = '2017-09-01 00:00:00.000'
--  join ods.OrganizationDetail o on o.OrganizationId = r.OrganizationId
  WHERE OrganizationPersonRoleId IN (43425, 43429)

  	 Update ods.OrganizationPersonRole 
	 set ExitDate = NULL
--  join ods.OrganizationDetail o on o.OrganizationId = r.OrganizationId
  WHERE OrganizationPersonRoleId IN (43425, 43429)