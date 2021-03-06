﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.



  declare @TermDescriptorId int
  select @TermDescriptorId= DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/TermDescriptor' and CodeValue ='Spring Semester'
  declare @StudentUSI int
  SET @StudentUSI = 20005

    declare @SchoolYear int 
	SET @SchoolYear = 2018

   IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentAcademicRecord] WHERE StudentUSI = @StudentUSI AND SchoolYear = @SchoolYear)
  INSERT INTO [edfi].[StudentAcademicRecord]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[SchoolYear]
           ,[TermDescriptorId]
)
select @StudentUSI
	, 255901012
	, 2018
	, @TermDescriptorId

  SET @StudentUSI = 20006
 IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentAcademicRecord] WHERE StudentUSI = @StudentUSI AND SchoolYear = @SchoolYear)
INSERT INTO [edfi].[StudentAcademicRecord]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[SchoolYear]
           ,[TermDescriptorId]
)
select @StudentUSI
	, 255901012
	, 2018
	, @TermDescriptorId

	declare @DiplomaTypeDescriptorId int
	select @DiplomaTypeDescriptorId = DescriptorId  from edfi.Descriptor where Namespace  = 'uri://ed-fi.org/DiplomaTypeDescriptor' and CodeValue ='Regular diploma'

  SET @StudentUSI = 20005
 IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentAcademicRecordDiploma] WHERE StudentUSI = @StudentUSI AND SchoolYear = @SchoolYear)
  INSERT INTO [edfi].[StudentAcademicRecordDiploma]
           ([StudentUSI]
           ,[SchoolYear]
           ,[TermDescriptorId]
           ,[EducationOrganizationId]
           ,[DiplomaAwardDate]
           ,[CTECompleter]
		   , DiplomaTypeDescriptorId
	)
select @StudentUSI
	, 2018
	, @TermDescriptorId
	, 255901012
	, '2018-05-25'
	,1
	,@DiplomaTypeDescriptorId

  SET @StudentUSI = 20006
 IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentAcademicRecordDiploma] WHERE StudentUSI = @StudentUSI AND SchoolYear = @SchoolYear)
 INSERT INTO [edfi].[StudentAcademicRecordDiploma]
           ([StudentUSI]
           ,[SchoolYear]
           ,[TermDescriptorId]
           ,[EducationOrganizationId]
           ,[DiplomaAwardDate]
           ,[CTECompleter]
		   ,DiplomaTypeDescriptorId
	)
select @StudentUSI
	, 2018
	, @TermDescriptorId
	, 255901012
	, '2018-05-25'
	,1
	,@DiplomaTypeDescriptorId