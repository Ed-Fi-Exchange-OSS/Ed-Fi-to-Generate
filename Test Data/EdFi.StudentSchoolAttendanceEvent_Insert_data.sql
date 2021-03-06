﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

  declare @StudentUSI int

    DECLARE @EdfiStudent TABLE (
	StudentUSI int
  )
  INSERT INTO @EdfiStudent VALUES(20000)
  INSERT INTO @EdfiStudent VALUES(20001)
  INSERT INTO @EdfiStudent VALUES(20002)
  INSERT INTO @EdfiStudent VALUES(20003)
  INSERT INTO @EdfiStudent VALUES(20004)

  --INSERT INTO @EdfiStudent VALUES(20005)
  --INSERT INTO @EdfiStudent VALUES(20006)
  --INSERT INTO @EdfiStudent VALUES(20007)
  --INSERT INTO @EdfiStudent VALUES(20008)
  --INSERT INTO @EdfiStudent VALUES(20009)

  --INSERT INTO @EdfiStudent VALUES(20010)
  --INSERT INTO @EdfiStudent VALUES(20011)
  --INSERT INTO @EdfiStudent VALUES(20012)
  --INSERT INTO @EdfiStudent VALUES(20013)
  --INSERT INTO @EdfiStudent VALUES(20014)

  declare @EducationalEnvironmentDescriptorId int
    select @EducationalEnvironmentDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/EducationalEnvironmentDescriptor' AND CodeValue = 'Classroom'

--	    select * from edfi.Descriptor where Namespace like  '%uri://ed-fi.org/AttendanceEventCategoryDescriptor%'

declare @schoolId int = 255901012
declare @SchoolYear int = 2018
declare @eventDate date = '2017-10-01'

declare @EventDuration decimal = 1.0
declare @SessionName varchar(128) = '2017 - 2018 Fall Semester'

declare @AttendanceEventCategoryDescriptorId int
select @AttendanceEventCategoryDescriptorId = DescriptorId from edfi.Descriptor where Namespace =  'uri://ed-fi.org/AttendanceEventCategoryDescriptor' and CodeValue ='Excused Absence'

  INSERT INTO [edfi].[StudentSchoolAttendanceEvent]
           ([StudentUSI]
           ,[SchoolId]
           ,[SchoolYear]
           ,[EventDate]
           ,[AttendanceEventCategoryDescriptorId]
           ,[EventDuration]
           ,[SessionName]
           ,[EducationalEnvironmentDescriptorId]
 )
 SELECT   s.StudentUSI
		, @schoolId
		, @SchoolYear
		, @eventDate
		, @AttendanceEventCategoryDescriptorId
		, @EventDuration
		, @SessionName
		, @EducationalEnvironmentDescriptorId
 
 FROM @EdfiStudent s
  LEFT JOIN [edfi].[StudentSchoolAttendanceEvent] ssae
	ON ssae.StudentUSI = s.StudentUSI AND ssae.AttendanceEventCategoryDescriptorId = @AttendanceEventCategoryDescriptorId
  WHERE ssae.StudentUSI IS NULL
