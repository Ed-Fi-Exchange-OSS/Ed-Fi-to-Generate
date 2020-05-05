use generate

declare @studentDateQuery as rds.StudentDateTableType
	insert into @studentDateQuery
	(
		DimStudentId,
		PersonId,
		DimCountDateId,
		SubmissionYearDate,
		[Year],
		SubmissionYearStartDate,
		SubmissionYearEndDate
	)
exec rds.Migrate_DimDates_Students 'datapopulation', 'rds', 8

	declare @ideaQuery as table (
		DimStudentId int,
		DimSchoolId int,
		DimLeaId int,
		PersonId int,
		DimCountDateId int,
		DisabilityCode varchar(50),
		EducEnvCode varchar(50),
		BasisOfExitCode varchar(50),
		SpecialEducationServicesExitDate Date
	)
		insert into @ideaQuery
		(
			DimStudentId,
			DimSchoolId,
			DimLeaId,
			PersonId,
			DimCountDateId,
			DisabilityCode,
			EducEnvCode,
			BasisOfExitCode,
			SpecialEducationServicesExitDate
		)

exec rds.Migrate_DimIdeaStatuses @studentDateQuery, 'submission', 0

select 'i', * from @ideaQuery where DimStudentId = 894800

select * from @studentDateQuery s
join rds.DimStudents ds on ds.DimStudentId = s.DimStudentId
where ds.StateStudentIdentifier = '604872'

	select DimStudentId, PersonId, DimCountDateId, DimSchoolId, DimLeaId, Organizationid
	from rds.Get_StudentOrganizations(@studentDateQuery, 0)

DECLARE
	@factTypeCode as varchar(50) = 'datapopulation',
	@useCutOffDate as bit = 0



	declare @k12StudentRoleId as int, @schoolOrganizationTypeId as int, @specialEdProgramTypeId as int

	select @k12StudentRoleId = RoleId from ods.[Role] where Name = 'K12 Student'
	select @schoolOrganizationTypeId = RefOrganizationTypeId from ods.RefOrganizationType where code = 'K12School'
	select @specialEdProgramTypeId = RefProgramTypeId from ods.RefProgramType where code = '04888'

	declare @ctePerkDisab as varchar(50)
			
	select @ctePerkDisab = r.ResponseValue
	from app.ToggleResponses r
	inner join app.ToggleQuestions q on r.ToggleQuestionId = q.ToggleQuestionId
	where q.EmapsQuestionAbbrv = 'CTEPERKDISAB'

	declare @isADADisability as bit
	set @isADADisability = 0

	IF @factTypeCode = 'cte' AND @ctePerkDisab = 'ADA Disability'
	BEGIN
		set @isADADisability = 1
	END

	--select * from RDS.Get_StudentOrganizations(@studentDateQuery,@useCutOffDate)
		select distinct s.DimStudentId, s.PersonId, s.DimCountDateId, sch.DimSchoolId, o.OrganizationId as SchOrganizationId
	from @studentDateQuery s
	left join ods.OrganizationPersonRole r on r.PersonId = s.PersonId
		and r.RoleId = @k12StudentRoleId
	left join ods.OrganizationDetail o on o.OrganizationId = r.OrganizationId
		and o.RefOrganizationTypeId = @schoolOrganizationTypeId
	left join rds.DimSchools sch on sch.SchoolOrganizationId = o.OrganizationId
	where 
	r.EntryDate <=
		case
			when @useCutOffDate = 0 then s.SubmissionYearEndDate
			else s.SubmissionYearDate
		end 
	--and (
	--	r.ExitDate >=
	--		case
	--			when @useCutOffDate = 0 then s.SubmissionYearStartDate
	--			else s.SubmissionYearDate
	--		end 
	--or r.ExitDate is null)
	--and DimSchoolId > -1
	and
	 s.DimStudentId = 787486

---exec rds.Migrate_DimIdeaStatuses @studentDateQuery, @factTypeCode, 0
	select distinct
		s.DimStudentId,
		r.DimSchoolId,
		r.DimLeaId,
		s.PersonId,
		s.DimCountDateId,
		S.PersonId,
		pd.PrimaryDisabilityTypeId,
		case when @isADADisability = 1 then IIF(pd.DisabilityStatus = 1, isnull(dt.Code, 'MISSING'),'MISSING')
			 else isnull(dt.Code, 'MISSING') end as DisabilityCode, 
		isnull(e.Code, isnull(sa.Code, 'MISSING')) as EducEnvCode,
		isnull(exitReason.Code, 'MISSING') as BasisOfExitCode,
		case when @factTypeCode = 'specedexit' then p.SpecialEducationServicesExitDate else NULL end as SpecialEducationServicesExitDate
	from @studentDateQuery s
	left join (select * from RDS.Get_StudentOrganizations(@studentDateQuery,@useCutOffDate)) r
	on s.PersonId = r.PersonId and s.DimCountDateId = r.DimCountDateId
	left join ods.OrganizationRelationship ore on IIF(r.OrganizationId > 0 , r.OrganizationId, r.LeaOrganizationId) = ore.Parent_OrganizationId
	left join ods.OrganizationPersonRole rp on rp.PersonId = s.PersonId
		and rp.EntryDate between s.SubmissionYearStartDate and s.SubmissionYearEndDate
		and ore.OrganizationId = rp.OrganizationId
	left join 	ods.OrganizationProgramType t on t.OrganizationId = rp.OrganizationId and t.RefProgramTypeId = @specialEdProgramTypeId
	left outer join ods.PersonDisability pd on pd.PersonId = S.PersonId
		and	ISNULL(pd.RecordStartDateTime, S.SubmissionYearDate) <= 
			case
				when @useCutOffDate = 0 then S.SubmissionYearEndDate
				else S.SubmissionYearDate
			end 
		and 
			ISNULL(pd.RecordEndDateTime, GETDATE()) >=
			case
				when @useCutOffDate = 0 then S.SubmissionYearStartDate
				else S.SubmissionYearDate
			end
	left join ods.RefDisabilityType dt on dt.RefDisabilityTypeId = pd.PrimaryDisabilityTypeId
	left join ods.PersonProgramParticipation ppp on rp.OrganizationPersonRoleId = ppp.OrganizationPersonRoleId 
	left join ods.ProgramParticipationSpecialEducation p on p.PersonProgramParticipationId = ppp.PersonProgramParticipationId
	left join ods.RefIDEAEducationalEnvironmentEC e on e.RefIDEAEducationalEnvironmentECId = p.RefIDEAEducationalEnvironmentECId
	left join ods.RefIDEAEducationalEnvironmentSchoolAge sa on sa.RefIDESEducationalEnvironmentSchoolAge = p.RefIDEAEdEnvironmentSchoolAgeId
	left join ods.RefSpecialEducationExitReason exitReason on p.RefSpecialEducationExitReasonId = exitReason.RefSpecialEducationExitReasonId
	where s.DimStudentId = 787674






