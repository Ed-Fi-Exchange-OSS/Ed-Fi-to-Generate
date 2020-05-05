/***************************************************************
*
*	FS195: This script is for the unit test for FS195 between the Stagin and EdFi
*
***************************************************************/		
USE generate 
DECLARE @SchoolYear INT = 2018
DECLARE @StagingCount INT, @EdFiCount INT

-- EdFi
SELECT @EdFiCount = Count(*) FROM (
SELECT SchoolId, SchoolYear, StudentUSI, SUM(AbsentDays) AbsentDays FROM 
(
	SELECT SchoolId, SchoolYear, StudentUSI, EventDate 
	, CASE
		WHEN SUM([EventDuration]) >= 0.5 THEN 1
		ELSE 0
	END AbsentDays
	FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAttendanceEvent] stSchAtt 
	INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d ON d.DescriptorId = stSchAtt.AttendanceEventCategoryDescriptorId
	WHERE d.CodeValue <> 'In Attendance' AND SchoolYear = @SchoolYear
		GROUP BY SchoolId, SchoolYear, StudentUSI, EventDate
	) abDays --Check if absent for a day
GROUP BY SchoolId, SchoolYear, StudentUSI --Sum up the absent days for the entire school year
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM [Staging].[Enrollment] staging
INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s ON s.StudentUniqueId = staging.Student_Identifier_State
inner JOIN 
(
	SELECT SchoolId, SchoolYear, StudentUSI, SUM(AbsentDays) AbsentDays FROM (
		SELECT SchoolId, SchoolYear, StudentUSI, EventDate 
		, CASE
			WHEN SUM([EventDuration]) >= 0.5 THEN 1
			ELSE 0
		END AbsentDays
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAttendanceEvent] stSchAtt 
		INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d ON d.DescriptorId = stSchAtt.AttendanceEventCategoryDescriptorId
		WHERE d.CodeValue <> 'In Attendance' AND SchoolYear = @SchoolYear
			GROUP BY SchoolId, SchoolYear, StudentUSI, EventDate
		) abDays --Check if absent for a day
	GROUP BY SchoolId, SchoolYear, StudentUSI --Sum up the absent days for the entire school year
) EdFi
	ON s.StudentUSI = EdFi.StudentUSI 
	AND staging.SchoolYear = edfi.SchoolYear 
	AND staging.School_Identifier_State = edfi.SchoolId 
	AND staging.NumberOfDaysAbsent = EdFi.AbsentDays
WHERE staging.SchoolYear = @SchoolYear

PRINT '-----------------------------------------------------'
PRINT 'The Staging Student Absent Days by Student: ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi Student Absent Days by Student: ' + CAST(@EdFiCount AS varchar)

IF @StagingCount = @EdFiCount 
	PRINT '''Student Absent Days Unit Test'' Succeeded'
ELSE
	PRINT '''Student Absent Days Unit Test'' Failed'

DECLARE @StagingSchoolDaysCount INT, @EdFiSchoolDaysCount INT

-- EdFi School Days
SELECT @EdFiSchoolDaysCount = COUNT(*) FROM
(
		  SELECT DISTINCT schoolid, SchoolYear, COUNT(Date) schoolDays
		  FROM  [EdFi_Sample_ODS_Data_For_Generate].[edfi].[CalendarDateCalendarEvent] calEvent
		  INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d ON d.DescriptorId = calEvent.CalendarEventDescriptorId 
		  WHERE  calEvent.[SchoolYear] = 2018
		  and (d.CodeValue = 'Instructional day' OR d.CodeValue = 'Make-up day' OR d.CodeValue = 'Student late arrival/early dismissal')
		  group by schoolid, SchoolYear
) EdFi

-- Staging School Days
SELECT @StagingSchoolDaysCount = COUNT(*) FROM
(
	SELECT DISTINCT en.School_Identifier_State, en.SchoolYear, en.NumberOfSchoolDays FROM Staging.Enrollment en
	INNER JOIN (
			  SELECT DISTINCT schoolid, SchoolYear, COUNT(Date) schoolDays
			  FROM  [EdFi_Sample_ODS_Data_For_Generate].[edfi].[CalendarDateCalendarEvent] calEvent
			  INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d ON d.DescriptorId = calEvent.CalendarEventDescriptorId 
			  WHERE  calEvent.[SchoolYear] = @SchoolYear
			  and (d.CodeValue = 'Instructional day' OR d.CodeValue = 'Make-up day' OR d.CodeValue = 'Student late arrival/early dismissal')
			  group by schoolid, SchoolYear
	) edfi ON edfi.SchoolId = en.School_Identifier_State AND edfi.SchoolYear = en.SchoolYear AND edfi.schoolDays = en.NumberOfSchoolDays
) staging 

PRINT ''
PRINT '-----------------------------------------------------'
PRINT 'The Staging School Days Count by School, School Year: ' + CAST(@StagingSchoolDaysCount AS varchar)
PRINT 'The EdFi School Days Count by School, School Year: ' + CAST(@EdFiSchoolDaysCount AS varchar)

IF @StagingSchoolDaysCount = @EdFiSchoolDaysCount 
	PRINT '''School Days Unit Test'' Succeeded'
ELSE
	PRINT '''School Days Unit Test'' Failed'

DECLARE @StagingAttendanceRateCount INT, @EdFiAttendanceRateCount INT

-- Staging Student Attendance Rate
SELECT @StagingAttendanceRateCount = COUNT(*) FROM [ODS].[RoleAttendance] att 
INNER JOIN ods.OrganizationPersonRole opr ON opr.OrganizationPersonRoleId = att.OrganizationPersonRoleId
INNER JOIN staging.Enrollment en ON en.OrganizationID_School = opr.OrganizationId AND en.PersonId = opr.PersonId
AND en.AttendanceRate = att.AttendanceRate AND en.NumberOfDaysAbsent = att.NumberOfDaysAbsent AND en.NumberOfSchoolDays = (att.NumberOfDaysAbsent + att.NumberOfDaysInAttendance)
WHERE en.SchoolYear = @SchoolYear

-- EdFi Student Attendance Rate
SELECT @EdFiAttendanceRateCount = COUNT(*) FROM staging.Enrollment en
WHERE en.SchoolYear = @SchoolYear
	AND en.NumberOfDaysAbsent IS NOT NULL 
	AND (en.NumberOfSchoolDays IS NOT NULL AND en.NumberOfSchoolDays <> 0)

PRINT '-----------------------------------------------------'
PRINT 'The Staging Student Attendance Rate by Student: ' + CAST(@StagingAttendanceRateCount AS varchar)
PRINT 'The EdFi Student Attendance Rate by Student: ' + CAST(@EdFiAttendanceRateCount AS varchar)

IF @StagingAttendanceRateCount = @EdFiAttendanceRateCount 
	PRINT '''Student Attendance Rate Unit Test'' Succeeded'
ELSE
	PRINT '''Student Attendance Rate Unit Test'' Failed'