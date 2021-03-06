﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use EdFi_Sample_ODS_Data_For_Generate

  declare @BeginDate date
  declare @StudentUSI int

    DECLARE @EdfiStudent TABLE (
	StudentUSI int
  )
  INSERT INTO @EdfiStudent VALUES(20000)
  INSERT INTO @EdfiStudent VALUES(20001)
  INSERT INTO @EdfiStudent VALUES(20002)
  INSERT INTO @EdfiStudent VALUES(20003)
  INSERT INTO @EdfiStudent VALUES(20004)

  INSERT INTO @EdfiStudent VALUES(20005)
  INSERT INTO @EdfiStudent VALUES(20006)
  INSERT INTO @EdfiStudent VALUES(20007)
  INSERT INTO @EdfiStudent VALUES(20008)
  INSERT INTO @EdfiStudent VALUES(20009)

  INSERT INTO @EdfiStudent VALUES(20010)
  INSERT INTO @EdfiStudent VALUES(20011)
  INSERT INTO @EdfiStudent VALUES(20012)
  INSERT INTO @EdfiStudent VALUES(20013)
  INSERT INTO @EdfiStudent VALUES(20014)

  SET @BeginDate = '2017-09-01'

  DECLARE @StudentCharacteristicDescriptorId INT
  select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Economic Disadvantaged'

   INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
  SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
  FROM @EdfiStudent s
  LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
  WHERE schar.StudentUSI IS NULL

INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
        ([BeginDate]
        ,[EducationOrganizationId]
        ,[StudentCharacteristicDescriptorId]
        ,[StudentUSI]
        ,[CreateDate])
  SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
  FROM @EdfiStudent s
  LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
  WHERE scharp.StudentUSI IS NULL


-- Foster Care
select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Foster Care'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Parent in Military'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL


select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Migrant'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Homeless'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Displaced Homemaker'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Single Parent'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Pregnant'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Immigrant'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL


select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Section 504 Handicapped'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

	--------
	DELETE FROM @EdfiStudent
	INSERT INTO @EdfiStudent VALUES(21000)


	select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Immigrant'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901013, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL


	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901013
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL