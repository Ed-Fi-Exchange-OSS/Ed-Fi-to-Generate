-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

DECLARE @StudentUSI int 

SET @StudentUSI = 21658
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationEndDate]
           ,[SerialNumber]
           ,[AdministrationLanguageDescriptorId]
           ,[AdministrationEnvironmentDescriptorId]
           ,[RetestIndicatorDescriptorId]
           ,[ReasonNotTestedDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[EventCircumstanceDescriptorId]
           ,[EventDescription]
           ,[SchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
		   ,ID
           )
SELECT  [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,@StudentUSI
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
	  ,ID
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
where StudentUSI = 21631

SET @StudentUSI = 21657
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationEndDate]
           ,[SerialNumber]
           ,[AdministrationLanguageDescriptorId]
           ,[AdministrationEnvironmentDescriptorId]
           ,[RetestIndicatorDescriptorId]
           ,[ReasonNotTestedDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[EventCircumstanceDescriptorId]
           ,[EventDescription]
           ,[SchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
		   ,ID
           )
SELECT  [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,@StudentUSI
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
	  ,ID
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
where StudentUSI = 21631


SET @StudentUSI = 21743
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationEndDate]
           ,[SerialNumber]
           ,[AdministrationLanguageDescriptorId]
           ,[AdministrationEnvironmentDescriptorId]
           ,[RetestIndicatorDescriptorId]
           ,[ReasonNotTestedDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[EventCircumstanceDescriptorId]
           ,[EventDescription]
           ,[SchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
		   ,ID
           )
SELECT  [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,@StudentUSI
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
	  ,ID
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
where StudentUSI = 21631

SET @StudentUSI = 21766
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationEndDate]
           ,[SerialNumber]
           ,[AdministrationLanguageDescriptorId]
           ,[AdministrationEnvironmentDescriptorId]
           ,[RetestIndicatorDescriptorId]
           ,[ReasonNotTestedDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[EventCircumstanceDescriptorId]
           ,[EventDescription]
           ,[SchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
		   ,ID
           )
SELECT  [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,@StudentUSI
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
	  ,ID
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
where StudentUSI = 21631

SET @StudentUSI = 22066
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationEndDate]
           ,[SerialNumber]
           ,[AdministrationLanguageDescriptorId]
           ,[AdministrationEnvironmentDescriptorId]
           ,[RetestIndicatorDescriptorId]
           ,[ReasonNotTestedDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[EventCircumstanceDescriptorId]
           ,[EventDescription]
           ,[SchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
		   ,ID
           )
SELECT  [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,@StudentUSI
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
	  ,ID
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
where StudentUSI = 21631

SET @StudentUSI = 22244
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationEndDate]
           ,[SerialNumber]
           ,[AdministrationLanguageDescriptorId]
           ,[AdministrationEnvironmentDescriptorId]
           ,[RetestIndicatorDescriptorId]
           ,[ReasonNotTestedDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[EventCircumstanceDescriptorId]
           ,[EventDescription]
           ,[SchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
		   ,ID
           )
SELECT  [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,@StudentUSI
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
	  ,ID
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
where StudentUSI = 21631


---
SET @StudentUSI = 22338
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationEndDate]
           ,[SerialNumber]
           ,[AdministrationLanguageDescriptorId]
           ,[AdministrationEnvironmentDescriptorId]
           ,[RetestIndicatorDescriptorId]
           ,[ReasonNotTestedDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[EventCircumstanceDescriptorId]
           ,[EventDescription]
           ,[SchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
		   ,ID
           )
SELECT  [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,@StudentUSI
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
	  ,ID
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
where StudentUSI = 21631

SET @StudentUSI = 22390
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationEndDate]
           ,[SerialNumber]
           ,[AdministrationLanguageDescriptorId]
           ,[AdministrationEnvironmentDescriptorId]
           ,[RetestIndicatorDescriptorId]
           ,[ReasonNotTestedDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[EventCircumstanceDescriptorId]
           ,[EventDescription]
           ,[SchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
		   ,ID
           )
SELECT  [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,@StudentUSI
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
	  ,ID
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
where StudentUSI = 21631

SET @StudentUSI = 22453
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationEndDate]
           ,[SerialNumber]
           ,[AdministrationLanguageDescriptorId]
           ,[AdministrationEnvironmentDescriptorId]
           ,[RetestIndicatorDescriptorId]
           ,[ReasonNotTestedDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[EventCircumstanceDescriptorId]
           ,[EventDescription]
           ,[SchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
		   ,ID
           )
SELECT  [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,@StudentUSI
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
	  ,ID
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
where StudentUSI = 21631
