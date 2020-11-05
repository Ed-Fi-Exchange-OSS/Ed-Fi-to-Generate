-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use EdFi_Sample_ODS_Data_For_Generate

  DECLARE @EdfiStudent TABLE (
	StudentUSI int
  )
  INSERT INTO @EdfiStudent VALUES(20000)
  INSERT INTO @EdfiStudent VALUES(20001)
  INSERT INTO @EdfiStudent VALUES(20002)
  INSERT INTO @EdfiStudent VALUES(20003)
  INSERT INTO @EdfiStudent VALUES(20004)

  declare @DisabilityDescriptorId int
  select @DisabilityDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue = 'AUT'
  --  select  * from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisabilityDescriptor'

  INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           (
		   [StudentUSI]
		   ,[DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[CreateDate]
		   )
SELECT s.StudentUSI, @DisabilityDescriptorId, 255901012, GetDate()
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentEducationOrganizationAssociationDisability] disa
	ON disa.StudentUSI = s.StudentUSI and disa.DisabilityDescriptorId = @DisabilityDescriptorId
WHERE disa.StudentUSI IS NULL

  DELETE FROM @EdfiStudent
  INSERT INTO @EdfiStudent VALUES(20005)
  INSERT INTO @EdfiStudent VALUES(20006)
  INSERT INTO @EdfiStudent VALUES(20007)
  INSERT INTO @EdfiStudent VALUES(20008)
  INSERT INTO @EdfiStudent VALUES(20009)

  SELECT @DisabilityDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue = 'DB'

  INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           (
		   [StudentUSI]
		   ,[DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[CreateDate]
		   )
SELECT s.StudentUSI, @DisabilityDescriptorId, 255901012, GetDate()
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentEducationOrganizationAssociationDisability] disa
	ON disa.StudentUSI = s.StudentUSI and disa.DisabilityDescriptorId = @DisabilityDescriptorId
WHERE disa.StudentUSI IS NULL

  DELETE FROM @EdfiStudent
  INSERT INTO @EdfiStudent VALUES(20010)
  INSERT INTO @EdfiStudent VALUES(20011)
  INSERT INTO @EdfiStudent VALUES(20012)
  INSERT INTO @EdfiStudent VALUES(20013)
  INSERT INTO @EdfiStudent VALUES(20014)

  SELECT @DisabilityDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue = 'HI'

  INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           (
		   [StudentUSI]
		   ,[DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[CreateDate]
		   )
SELECT s.StudentUSI, @DisabilityDescriptorId, 255901012, GetDate()
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentEducationOrganizationAssociationDisability] disa
	ON disa.StudentUSI = s.StudentUSI and disa.DisabilityDescriptorId = @DisabilityDescriptorId
WHERE disa.StudentUSI IS NULL

GO


DECLARE @NameSpace varchar(100), @code varchar(200), @Desc varchar(200), @shortDesc varchar(75)
SELECT @NameSpace = 'uri://ed-fi.org/AcademicSubjectDescriptor', @code = 'English as a second language (ESL)', @Desc = 'English as a second language (ESL)'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc


INSERT INTO [edfi].[AcademicSubjectDescriptor]
(
	[AcademicSubjectDescriptorId]
)
SELECT DescriptorId 
FROM [edfi].[Descriptor] D
LEFT JOIN [edfi].[AcademicSubjectDescriptor] cs ON cs.[AcademicSubjectDescriptorId] = d.DescriptorId
WHERE D.Namespace = @NameSpace and D.CodeValue = @code
AND cs.[AcademicSubjectDescriptorId] IS NULL
