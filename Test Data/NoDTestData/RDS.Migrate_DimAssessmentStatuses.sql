﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [RDS].[Migrate_DimAssessmentStatuses]    Script Date: 8/22/2019 1:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [RDS].[Migrate_DimAssessmentStatuses]
	@studentDates as rds.StudentDateTableType ReadOnly
AS
BEGIN
	
	declare @k12StudentRoleId as int
	declare @schoolOrganizationTypeId as int
	select @k12StudentRoleId = RoleId from ods.[Role] where Name = 'K12 Student'
	select @schoolOrganizationTypeId = RefOrganizationTypeId from ods.RefOrganizationType where code = 'K12School'
	
	
SELECT 
	s.DimStudentId,	
	IIF(aft.DimSchoolId > 0, aft.DimSchoolId, progress.DimSchoolId) as DimSchoolId,		
	IIF(aft.DimLeaId > 0, aft.DimLeaId, progress.DimLeaId) as DimLeaId,
	s.PersonId,
	s.DimCountDateId,
	case when 
	aft.FirstAssessedDate between s.SubmissionYearStartDate and s.SubmissionYearEndDate THEN 'FIRSTASSESS' ELSE 'MISSING'
	END as 'FirstAssessed',
	AcademicSubject,
	isnull(progress.ProgressLevel,'MISSING') as ProgressLevel

FROM  @studentDates s 
left outer join (

		
		  SELECT reg.PersonId, org.DimSchoolId, org.DimLeaId, org.DimCountDateId,  min(adm.StartDate) as 'FirstAssessedDate'
          from  (select * from RDS.Get_StudentOrganizations(@studentDates, 0)) org
				inner join ods.OrganizationPersonRole r on r.OrganizationId = IIF(org.OrganizationId > 0 , org.OrganizationId, org.LeaOrganizationId)
					and r.PersonId = org.PersonId and r.RoleId = @k12StudentRoleId
                inner join ods.AssessmentRegistration reg on r.PersonId = reg.PersonId and r.OrganizationId = isnull(reg.SchoolOrganizationId,reg.LeaOrganizationId)
                inner join ods.RefGradeLevel grd on reg.RefGradeLevelWhenAssessedId = grd.RefGradeLevelId
                inner join ods.AssessmentAdministration adm on reg.AssessmentAdministrationId = adm.AssessmentAdministrationId        
                inner join ods.Assessment ass on adm.AssessmentId = ass.AssessmentId
                inner join ods.RefAcademicSubject sub on ass.RefAcademicSubjectId = sub.RefAcademicSubjectId
                inner join ods.OrganizationCalendar oc on oc.OrganizationId = isnull(reg.SchoolOrganizationId,reg.LeaOrganizationId)
                inner join ods.OrganizationCalendarSession ocs on
					  oc.OrganizationCalendarId = ocs.OrganizationCalendarId    
					  and adm.StartDate between ocs.BeginDate and ocs.EndDate
				where sub.Code = '00256'		--ELP Subjects
                group by reg.PersonId, org.DimSchoolId, org.DimLeaId, org.DimCountDateId                     
                                        
                ) aft on aft.PersonId = s.PersonId and s.DimCountDateId = aft.DimCountDateId   
left outer join (

					  SELECT reg.PersonId --.PersonId
					  , org.DimSchoolId, org.DimLeaId, org.DimCountDateId, sub.Code as AcademicSubject, levels.Code as ProgressLevel
          from  (select * from RDS.Get_StudentOrganizations(@studentDates, 0)) org
				inner join ods.OrganizationPersonRole r on r.OrganizationId = IIF(org.OrganizationId > 0 , org.OrganizationId, org.LeaOrganizationId)
					 and r.PersonId = org.PersonId and r.RoleId = @k12StudentRoleId
				inner join ods.OrganizationRelationship orp on  r.OrganizationId = orp.Parent_OrganizationId
				inner join ods.OrganizationPersonRole r2 on r2.OrganizationId = orp.OrganizationId
				inner join ods.PersonProgramParticipation ppp on r2.OrganizationPersonRoleId = ppp.OrganizationPersonRoleId 
				inner join ods.ProgramParticipationNeglectedProgressLevel ppnProgress on ppp.PersonProgramParticipationId = ppnProgress.PersonProgramParticipationId
                inner join ods.RefProgressLevel levels on levels.RefProgressLevelId = ppnProgress.RefProgressLevelId
                inner join ods.AssessmentRegistration  reg on r.PersonId = reg.PersonId and r.OrganizationId = isnull(reg.SchoolOrganizationId,reg.LeaOrganizationId)  
                inner join ods.RefGradeLevel grd on reg.RefGradeLevelWhenAssessedId = grd.RefGradeLevelId
                inner join ods.AssessmentAdministration adm on reg.AssessmentAdministrationId = adm.AssessmentAdministrationId        
                inner join ods.RefAcademicSubject sub on ppnProgress.RefAcademicSubjectId = sub.RefAcademicSubjectId
                inner join ods.OrganizationCalendar oc on oc.OrganizationId = isnull(reg.SchoolOrganizationId,reg.LeaOrganizationId)
                inner join ods.OrganizationCalendarSession ocs on
					  oc.OrganizationCalendarId = ocs.OrganizationCalendarId    
					  and adm.StartDate between ocs.BeginDate and ocs.EndDate
     
                ) progress on progress.PersonId = s.PersonId and s.DimCountDateId = progress.DimCountDateId
				
 END               