-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

DECLARE @StudentUSI INT

--21658
--21657
--21743
--21766


SET @StudentUSI = 21658
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessmentPerformanceLevel] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
SELECT [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,@StudentUSI
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]
  where StudentUSI = 21631

  
SET @StudentUSI = 21657
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessmentPerformanceLevel] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
SELECT [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,@StudentUSI
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]
  where StudentUSI = 21631

  SET @StudentUSI = 21743
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessmentPerformanceLevel] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
SELECT [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,@StudentUSI
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]
  where StudentUSI = 21631

    SET @StudentUSI = 21766
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessmentPerformanceLevel] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
SELECT [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,@StudentUSI
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]
  where StudentUSI = 21631

  --22066
--22244


    SET @StudentUSI = 22066
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessmentPerformanceLevel] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
SELECT [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,@StudentUSI
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]
  where StudentUSI = 21631


    SET @StudentUSI = 22244
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessmentPerformanceLevel] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
SELECT [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,@StudentUSI
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]
  where StudentUSI = 21631

  --22338
--22390
--22453

    SET @StudentUSI = 22338
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessmentPerformanceLevel] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
SELECT [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,@StudentUSI
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]
  where StudentUSI = 21631

      SET @StudentUSI = 22390
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessmentPerformanceLevel] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
SELECT [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,@StudentUSI
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]
  where StudentUSI = 21631

      SET @StudentUSI = 22453
IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessmentPerformanceLevel] WHERE StudentUSI = @StudentUSI)
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
SELECT [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,@StudentUSI
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]
  where StudentUSI = 21631


