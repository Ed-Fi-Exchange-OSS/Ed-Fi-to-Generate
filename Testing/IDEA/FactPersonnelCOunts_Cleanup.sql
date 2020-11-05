-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use generate

truncate table rds.FactOrganizationCounts
truncate table rds.FactStudentDisciplines
truncate table rds.FactPersonnelCounts
truncate table rds.FactStudentCounts
truncate table rds.FactStudentAssessments

delete from [RDS].[DimSchools]
delete from rds.DimLeas
delete from rds.DimSeas
delete from rds.DimStudents
delete from [RDS].[BridgePersonnelDate]
delete from rds.DimPersonnel

delete  from rds.FactOrganizationCountReports
--select * from rds.FactStudentAssessments where ReportCode ='c130'

ALTER DATABASE generate SET RECOVERY SIMPLE

select object_name(id) from syscomments where text like '%Danger%'
