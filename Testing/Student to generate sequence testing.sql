﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


	-- run report to detect involved tables
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c002', @dimFactTypeCode = 'childcount', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c006', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c007', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c009', @dimFactTypeCode = 'specedexit', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c070', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c112', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c089', @dimFactTypeCode = 'childcount', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c099', @dimFactTypeCode = 'submission', @runAsTest = 1

	 -- NCES
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c032', @dimFactTypeCode = 'dropout', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c033', @dimFactTypeCode = 'membership', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c040', @dimFactTypeCode = 'grad', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c059', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c052', @dimFactTypeCode = 'membership', @runAsTest = 1


	 --exec [RDS].[Create_ReportData]	@reportCode = 'c088', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c089', @dimFactTypeCode = 'childcount', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c169', @dimFactTypeCode = 'cte', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c082', @dimFactTypeCode = 'cte', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c083', @dimFactTypeCode = 'cte', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c086', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_OrganizationReportData]	@reportCode = 'c103', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c118', @dimFactTypeCode = 'homeless', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c194', @dimFactTypeCode = 'homeless', @runAsTest = 1

	 -- NOD
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c113', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c119', @dimFactTypeCode = 'nord', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c125', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c127', @dimFactTypeCode = 'nord', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c180', @dimFactTypeCode = 'nord', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c181', @dimFactTypeCode = 'nord', @runAsTest = 1

	 --exec [RDS].[Create_OrganizationReportData]	@reportCode = 'c131', @runAsTest = 1
	 --exec [RDS].[Create_OrganizationReportData]	@reportCode = 'c132', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c142', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c150', @dimFactTypeCode = 'gradrate', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c151', @dimFactTypeCode = 'gradrate', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c155', @dimFactTypeCode = 'cte', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c157', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c156', @dimFactTypeCode = 'cte', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c154', @dimFactTypeCode = 'cte', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c160',@dimFactTypeCode = 'hsgradenroll', @runAsTest = 1
	 
	 --	exec [RDS].[Create_OrganizationReportData]	@reportCode = 'c163', @runAsTest = 0
	 
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c195', @dimFactTypeCode = 'chronic', @runAsTest = 1

	 --exec [RDS].[Create_ReportData]	@reportCode = 'c203', @dimFactTypeCode = 'submission', @runAsTest = 1
	 --exec exec [RDS].[Create_OrganizationReportData]	@reportCode = 'c206', @runAsTest = 1

	 -- Title I
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c037', @dimFactTypeCode = 'titleI', @runAsTest = 1
	 --exec [RDS].[Create_ReportData]	@reportCode = 'c134', @dimFactTypeCode = 'titleI', @runAsTest = 1
 
	-- MEP
	--exec [RDS].[Create_ReportData]	@reportCode = 'c054', @dimFactTypeCode = 'mep', @runAsTest = 1
	--exec [RDS].[Create_ReportData]	@reportCode = 'c121', @dimFactTypeCode = 'mep', @runAsTest = 1
	--exec [RDS].[Create_ReportData]	@reportCode = 'c122', @dimFactTypeCode = 'mep', @runAsTest = 1
	--exec [RDS].[Create_ReportData]	@reportCode = 'c145', @dimFactTypeCode = 'mep', @runAsTest = 1
	--exec [RDS].[Create_ReportData]	@reportCode = 'c165', @dimFactTypeCode = 'immigrant', @runAsTest = 1
 
 --SELECT *  FROM [generate].[Staging].[Person]
 -- where Identifier in ('604872')

  SELECT 'Enrollment', * 
  FROM [generate].[Staging].[Enrollment]
  where Student_Identifier_State in ('604872','888888','999999')

  -- [Staging].[PersonStatus]
  SELECT 'staging-PersonStatus', [Student_Identifier_State]
      ,[LEA_Identifier_State]
      ,[School_Identifier_State]
      ,[IDEAIndicator]
      ,[IDEA_StatusStartDate]
      ,[PrimaryDisabilityType]
      ,[PersonId]
      ,[OrganizationID_LEA]
      ,[OrganizationID_School]
      ,[OrganizationPersonRoleID_School]
  FROM [generate].[Staging].[PersonStatus]
  where Student_Identifier_State in ('604872','888888','999999')

  -- [Staging].[Organization]
  --SELECT TOP 1000 [Id]
  --    ,[School_Identifier_State]
  --    ,[School_Identifier_NCES]
  --    ,[School_Name]
  --    ,[SchoolToSpecialEducationProgram_OrganizationRelationshipId]
  --FROM [generate].[Staging].[Organization]
  --where School_Identifier_State='255901107'

  SELECT 'OrganizationIdentifier', *  FROM [generate].[ODS].[OrganizationIdentifier]
  where Identifier = '255901107'

  SELECT 'OrganizationRelationship', *  FROM [generate].[ODS].[OrganizationRelationship]
  where OrganizationId in (3,18,19,34)

  SELECT 'OrganizationPersonRole', *  FROM [generate].[ODS].[OrganizationPersonRole]
  where PersonId in (21636,21697,21698)

  select 'PersonDisability', * from [ODS].[PersonDisability]
  --exec  [RDS].[Migrate_StudentCounts] 'submission', 1

  -- SELECT * FROM Staging.Discipline where Student_Identifier_State in ('604872','888888','999999')

  /*
  update [ODS].[OrganizationPersonRole]
  set entrydate = '7/1/2017'
  , ExitDate = null
  where PersonId in (21636,21697,21698)
 

  **/
  /*
  select * from [App].[DataMigrations]
 update  [App].[DataMigrations]
 set [DataMigrationStatusId]=2
 where [DataMigrationId]=3
 exec [App].[Migrate_Data]
 */

	SELECT *  FROM [generate].[App].[DataMigrations]

	-- update [App].[DataMigrations] set DataMigrationStatusId=5 where DataMigrationId=2

  --select * from [App].[DataMigrationTasks]
  --where [DataMigrationTypeId] = 3

  -- RDS Migration
	--EXEC	rds.Migrate_DimStudents
	--EXEC	rds.Migrate_DimPersonnel
	--EXEC	rds.Migrate_OrganizationCounts 'directory', 0
	--EXEC	rds.Migrate_OrganizationStatusCounts 'organizationstatus', 0
	--EXEC	rds.Empty_RDS 'datapopulation', 'studentcounts'
	--EXEC	rds.Migrate_StudentCounts 'datapopulation', 0
	--EXEC	rds.Empty_RDS 'datapopulation', 'disciplinecounts'
	--EXEC	rds.Migrate_StudentDisciplines 'datapopulation', 0
	--EXEC	rds.Empty_RDS 'submission', 'studentcounts'
	--EXEC	rds.Migrate_StudentCounts 'submission', 0
	--EXEC	rds.Empty_RDS 'submission', 'disciplinecounts'
	--EXEC	rds.Migrate_StudentDisciplines 'submission', 0
	--EXEC	rds.Empty_RDS 'submission', 'studentassessments'
	--EXEC	rds.Migrate_StudentAssessments 'submission', 0
	--EXEC	rds.Empty_RDS 'submission', 'personnelcounts'
	--EXEC	rds.Migrate_PersonnelCounts 'submission', 0
	--EXEC	rds.Empty_RDS 'childcount'
	--EXEC	rds.Migrate_StudentCounts 'childcount', 0
	--EXEC	rds.Empty_RDS 'specedexit'
	--EXEC	rds.Migrate_SpecialEdStudentCounts 'specedexit', 0
	--EXEC	rds.Empty_RDS 'cte'
	--EXEC	rds.Migrate_StudentCounts 'cte', 0
	--EXEC	rds.Empty_RDS 'membership'
	--EXEC	rds.Migrate_StudentCounts 'membership', 0
	--EXEC	rds.Empty_RDS 'dropout'
	--EXEC	rds.Migrate_StudentCounts 'dropout', 0
	--EXEC	rds.Empty_RDS 'grad'
	--EXEC	rds.Migrate_StudentCounts 'grad', 0
	--EXEC	rds.Empty_RDS 'titleIIIELOct'
	--EXEC	rds.Migrate_StudentCounts 'titleIIIELOct', 0
	--EXEC	rds.Empty_RDS 'titleIIIELSY'
	--EXEC	rds.Migrate_StudentCounts 'titleIIIELSY', 0
	--EXEC	rds.Empty_RDS 'titleI'
	--EXEC	rds.Migrate_StudentCounts 'titleI', 0
	--EXEC	rds.Empty_RDS 'mep'
	--EXEC	rds.Migrate_StudentCounts 'mep', 0
	--EXEC	rds.Empty_RDS 'immigrant'
	--EXEC	rds.Migrate_StudentCounts 'immigrant', 0
	--EXEC	rds.Empty_RDS 'nord'
	--EXEC	rds.Migrate_StudentCounts 'nord', 0
	--EXEC	rds.Empty_RDS 'homeless'
	--EXEC	rds.Migrate_StudentCounts 'homeless', 0
	--EXEC	rds.Empty_RDS 'chronic'
	--EXEC	rds.Migrate_StudentCounts 'chronic', 0
	--EXEC	rds.Empty_RDS 'gradrate'
	--EXEC	rds.Migrate_StudentCounts 'gradrate', 0
	--EXEC	rds.Empty_RDS 'hsgradenroll'
	--EXEC	rds.Migrate_StudentCounts 'hsgradenroll', 0
	--EXEC	rds.Empty_RDS 'other'
	--EXEC	rds.Migrate_StudentCounts 'other', 0
	--EXEC	rds.Empty_RDS 'sppapr'
	--EXEC	rds.Migrate_StudentCounts 'sppapr', 0

	-- REPORT MIGRATION

	--EXEC	rds.Empty_Reports 'directory'
	--EXEC	rds.create_reports 'directory',0, 'organizationcounts'
	--EXEC	rds.Empty_Reports 'organizationstatus'
	--EXEC	rds.create_reports 'organizationstatus',0, 'organizationstatuscounts'
	--EXEC	rds.Empty_Reports 'datapopulation', 'studentcounts'
	--EXEC	rds.create_reports 'datapopulation',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'datapopulation', 'disciplinecounts'
	--EXEC	rds.create_reports 'datapopulation',0,'disciplinecounts'
	--EXEC	rds.Empty_Reports 'datapopulation', 'studentassessments'
	--EXEC	rds.create_reports 'datapopulation',0,'studentassessments'
	--EXEC	rds.Empty_Reports 'submission', 'studentcounts'
	--EXEC	rds.create_reports 'submission',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'submission', 'disciplinecounts'
	--EXEC	rds.create_reports 'submission',0,'disciplinecounts'
	--EXEC	rds.Empty_Reports 'submission', 'studentassessments'
	--EXEC	rds.create_reports 'submission',0,'studentassessments'
	--EXEC	rds.Empty_Reports 'submission', 'personnelcounts'
	--EXEC	rds.create_reports 'submission',0,'personnelcounts'
	--EXEC	rds.Empty_Reports 'specedexit'
	--EXEC	rds.create_reports 'specedexit',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'cte'
	--EXEC	rds.create_reports 'cte',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'childcount'
	--EXEC	rds.create_reports 'childcount',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'membership'
	--EXEC	rds.create_reports 'membership',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'dropout'
	--EXEC	rds.create_reports 'dropout',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'grad'
	--EXEC	rds.create_reports 'grad',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'titleIIIELOct'
	--EXEC	rds.create_reports 'titleIIIELOct',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'titleIIIELSY'
	--EXEC	rds.create_reports 'titleIIIELSY',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'titleI'
	--EXEC	rds.create_reports 'titleI',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'sppapr'
	--EXEC	rds.create_reports 'sppapr',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'mep'
	--EXEC	rds.create_reports 'mep',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'immigrant'
	--EXEC	rds.create_reports 'immigrant',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'nord'
	--EXEC	rds.create_reports 'nord',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'homeless'
	--EXEC	rds.create_reports 'homeless',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'chronic'
	--EXEC	rds.create_reports 'chronic',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'gradrate'
	--EXEC	rds.create_reports 'gradrate',0,'studentcounts'
	--EXEC	rds.Empty_Reports 'hsgradenroll'
	--EXEC	rds.create_reports 'hsgradenroll',0,'studentcounts'