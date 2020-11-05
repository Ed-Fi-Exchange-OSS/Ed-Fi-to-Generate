-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
SELECT 'Science'
	, 'uri://ed-fi.org/Assessment/Assessment.xml'
	, 95 -- (BOY -- Beginning of Year)
	, '2017-07-01'
	, '2018-08-31'
	, GetDate()
GO
INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
SELECT 'English as a second language (ESL)'
	, 'uri://ed-fi.org/Assessment/Assessment.xml'
	, 95 -- (BOY -- Beginning of Year)
	, '2017-07-01'
	, '2018-08-31'
	, GetDate()


