﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use EdFi_Sample_ODS_Data_For_Generate
IF EXISTS (SELECT 1 from INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'XMLTemp')
	DROP TABLE XMLTemp
GO

CREATE TABLE XMLTemp
(
	Id INT IDENTITY PRIMARY KEY,
	XMLData XML,
	CreatedDateTime DATETIME
)

INSERT INTO XMLTemp(XMLData, CreatedDateTime)
SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
FROM OPENROWSET(BULK 'C:\Repos\generate-etl\Test Data\EducationOrganization.xml', SINGLE_BLOB) AS x;
BEGIN TRANSACTION
BEGIN TRY

DECLARE @School TABLE
(
	SchoolType varchar(256)
	,CharterStatus varchar(256)
	,TitleIPartASchoolDesignation varchar(256)
	,AdministrativeFundingControl varchar(256)
	,OperationalStatus varchar(256)
	,SchoolId int
	,NameOfInstitution varchar(256)
	,ShortNameOfInstitution varchar(256)
	,WebSite varchar(256)
	,LEA varchar(256)
)
 ;WITH XMLNAMESPACES 
('http://ed-fi.org/0300' AS ns)

INSERT INTO @School 
(
	SchoolType
	,CharterStatus
	,TitleIPartASchoolDesignation
	,AdministrativeFundingControl
	,OperationalStatus
	,SchoolId
	,NameOfInstitution
	,ShortNameOfInstitution
	,WebSite
	,LEA
)
  SELECT 
  --(select top 1 token from  [util].[Split](c.value('(ns:EducationOrganizationCategory)[1]', 'nvarchar(256)'), '#') order by id desc)  as EducationOrganizationCategory
  --,(select top 1 token from  [util].[Split](c.value('(ns:SchoolCategory)[1]', 'nvarchar(256)'), '#') order by id desc)  as SchoolCategory
  (select top 1 token from  [util].[Split](c.value('(ns:SchoolType)[1]', 'nvarchar(256)'), '#') order by id desc)  as SchoolType
  ,(select top 1 token from  [util].[Split](c.value('(ns:CharterStatus)[1]', 'nvarchar(256)'), '#') order by id desc)  as CharterStatus
  ,(select top 1 token from  [util].[Split](c.value('(ns:TitleIPartASchoolDesignation)[1]', 'nvarchar(256)'), '#') order by id desc)  as TitleIPartASchoolDesignation
  ,(select top 1 token from  [util].[Split](c.value('(ns:AdministrativeFundingControl)[1]', 'nvarchar(256)'), '#') order by id desc)  as AdministrativeFundingControl
  ,(select top 1 token from  [util].[Split](c.value('(ns:OperationalStatus)[1]', 'nvarchar(256)'), '#') order by id desc)  as OperationalStatus
  ,c.value('(ns:EducationOrganizationIdentificationCode/ns:IdentificationCode)[1]', 'int') as SchoolId
  ,c.value('(ns:NameOfInstitution)[1]', 'nvarchar(256)') as NameOfInstitution
  ,c.value('(ns:ShortNameOfInstitution)[1]', 'nvarchar(256)') as ShortNameOfInstitution
  ,c.value('(ns:WebSite)[1]', 'nvarchar(256)') as WebSite
  ,SUBSTRING(c.value('(ns:LocalEducationAgencyReference/@ref)[1]', 'nvarchar(64)'), 6, 6) as LEA
 FROM dbo.XMLTemp s
 cross apply XMLData.nodes('/ns:InterchangeEducationOrganization/ns:School') M(c)

 INSERT INTO [edfi].[EducationOrganization]
           (
		   [EducationOrganizationId]
           ,[NameOfInstitution]
           ,[ShortNameOfInstitution]
           ,[WebSite]
           ,[OperationalStatusDescriptorId]
           ,[Discriminator]
		   )
 SELECT 
	SchoolId 
	,s.NameOfInstitution
	,s.ShortNameOfInstitution
	,s.WebSite
	,d.DescriptorId OperationalStatus
	,'edfi.School'
 FROM @School s
 INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d on d.CodeValue = s.OperationalStatus and Namespace ='uri://ed-fi.org/OperationalStatusDescriptor'
 LEFT JOIN [edfi].[EducationOrganization] st On s.SchoolId = st.[EducationOrganizationId]
 WHERE st.EducationOrganizationId IS NULL

 INSERT INTO [edfi].[School]
           ([SchoolId]
           ,[LocalEducationAgencyId]
           ,[AdministrativeFundingControlDescriptorId]
           ,[CharterStatusDescriptorId]
           ,[SchoolTypeDescriptorId]
           ,[TitleIPartASchoolDesignationDescriptorId])
 SELECT
	s.SchoolId
	,LEA
	,d.DescriptorId AdministrativeFundingControl
	,charterStatus.DescriptorId CharterStatus
 	,schooltype.DescriptorId SchoolType
	,title.DescriptorId TitleIPartASchoolDesignation
 FROM @School s
 LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d on d.CodeValue = s.AdministrativeFundingControl and Namespace ='uri://ed-fi.org/AdministrativeFundingControlDescriptor'
 LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] schooltype on schooltype.CodeValue = s.SchoolType and schooltype.Namespace ='uri://ed-fi.org/SchoolTypeDescriptor'
 LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] charterStatus on charterStatus.CodeValue = s.charterStatus and charterStatus.Namespace ='uri://ed-fi.org/CharterStatusDescriptor'
 LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] title on title.CodeValue = s.TitleIPartASchoolDesignation and title.Namespace ='uri://ed-fi.org/TitleIPartASchoolDesignationDescriptor'
 LEFT JOIN [edfi].[School] st On s.SchoolId = st.SchoolId
 WHERE st.[SchoolId] IS NULL

 COMMIT
 END TRY
 BEGIN CATCH
 print 'rollback'
 print ERROR_MESSAGE ( ) 
 ROLLBACK
 END CATCH