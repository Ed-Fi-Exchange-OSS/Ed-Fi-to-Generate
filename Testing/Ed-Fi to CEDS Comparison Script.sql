USE generate
GO
-------------------------------------------------------------------------------------
----Count Comparison Script														-----
----																			-----
----The purpose of this script is to conduct a logical comparison between the	-----
----counts in the Ed-Fi ODS and the counts in the CEDS ODS and to check for		-----
----total counts in the CEDS ODS for tables that should contain data			-----
-------------------------------------------------------------------------------------


DECLARE @SchoolYear INT
SET @SchoolYear = '2018'

IF OBJECT_ID('tempdb.dbo.#TotalCountsComparison', 'U') IS NOT NULL
  DROP TABLE #TotalCountsComparison; 

IF OBJECT_ID('tempdb.dbo.#TableRecordCounts', 'U') IS NOT NULL
  DROP TABLE #TableRecordCounts; 

CREATE TABLE #TotalCountsComparison
	(CountType VARCHAR(100)
	,EdFiTotalCount INT
	,CEDSTotalCount INT
	,Notes VARCHAR(1000))

CREATE TABLE #TableRecordCounts
	(TableName VARCHAR(100)
	,TotalCountOfRecords INT)


------------------------------------------
----Key Counts in the CEDS IDS------------
------------------------------------------

--Count the Students--

INSERT INTO #TotalCountsComparison
SELECT 'StudentCount', NULL, NULL, NULL

UPDATE #TotalCountsComparison
SET EdFiTotalCount = (SELECT COUNT(DISTINCT StudentUniqueId) AS EdFiTotal FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Student])
WHERE CountType = 'StudentCount'

UPDATE #TotalCountsComparison
SET CEDSTotalCount = (SELECT COUNT(DISTINCT Identifier) AS CEDSTotal
						FROM ODS.PersonIdentifier pid
						JOIN ODS.RefPersonIdentificationSystem ris ON pid.RefPersonIdentificationSystemId = ris.RefPersonIdentificationSystemId
						JOIN ODS.RefPersonIdentifierType rit ON ris.RefPersonIdentifierTypeId = rit.RefPersonIdentifierTypeId
						WHERE rit.Description = 'Student Identification System')
WHERE CountType = 'StudentCount'


--Count the Staff--

INSERT INTO #TotalCountsComparison
SELECT 'StaffCount', NULL, NULL, 'CEDS total should have 1 extra to account for CIO data hand entered for Directory files'

UPDATE #TotalCountsComparison
SET EdFiTotalCount = (SELECT COUNT(DISTINCT StaffUniqueId) AS EdFiTotal FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Staff])
WHERE CountType = 'StaffCount'

UPDATE #TotalCountsComparison
SET CEDSTotalCount = (SELECT COUNT(DISTINCT Identifier) AS CEDSTotal
						FROM ODS.PersonIdentifier pid
						JOIN ODS.RefPersonIdentificationSystem ris ON pid.RefPersonIdentificationSystemId = ris.RefPersonIdentificationSystemId
						JOIN ODS.RefPersonIdentifierType rit ON ris.RefPersonIdentifierTypeId = rit.RefPersonIdentifierTypeId
						WHERE rit.Description = 'Staff Member Identification System')
WHERE CountType = 'StaffCount'


--Count the Student Enrollments--

INSERT INTO #TotalCountsComparison
SELECT 'EnrollmentCounts', NULL, NULL, NULL

UPDATE #TotalCountsComparison
SET EdFiTotalCount = (SELECT COUNT(*) AS EdFiTotal
						FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Student] s
						JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa ON s.StudentUSI = ssa.StudentUSI
						WHERE EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
						AND EntryDate <= App.GetFiscalYearEndDate(@SchoolYear)
						AND (ExitWithdrawDate IS NULL OR ExitWithdrawDate <= App.GetFiscalYearEndDate(@SchoolYear)))
WHERE CountType = 'EnrollmentCounts'

UPDATE #TotalCountsComparison
SET CEDSTotalCount = (SELECT COUNT(*) AS CEDSTotal
						FROM ODS.PersonIdentifier pid
						JOIN ODS.RefPersonIdentificationSystem ris ON pid.RefPersonIdentificationSystemId = ris.RefPersonIdentificationSystemId
						JOIN ODS.RefPersonIdentifierType rit ON ris.RefPersonIdentifierTypeId = rit.RefPersonIdentifierTypeId
						JOIN ODS.OrganizationPersonRole opr ON pid.PersonId = opr.PersonId
						JOIN ODS.OrganizationDetail orgd ON opr.OrganizationId = orgd.OrganizationId
						JOIN ODS.RefOrganizationType rot ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
						WHERE rit.Description = 'Student Identification System'
						AND rot.Code = 'K12School'
						AND EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
						AND EntryDate <= App.GetFiscalYearEndDate(@SchoolYear)
						AND (opr.ExitDate IS NULL OR opr.ExitDate <= App.GetFiscalYearEndDate(@SchoolYear)))
WHERE CountType = 'EnrollmentCounts'

--Count the LEAs--

INSERT INTO #TotalCountsComparison
SELECT 'LEACount', NULL, NULL, NULL

UPDATE #TotalCountsComparison
SET EdFiTotalCount = (SELECT COUNT(DISTINCT lea.LocalEducationAgencyId)
						FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg
						JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON edorg.EducationOrganizationId = lea.LocalEducationAgencyId
						JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School s ON lea.LocalEducationAgencyId = s.LocalEducationAgencyId)
WHERE CountType = 'LEACount'

UPDATE #TotalCountsComparison
SET CEDSTotalCount = (SELECT COUNT(DISTINCT orgd.OrganizationId)
						FROM ODS.OrganizationDetail orgd
						JOIN ODS.RefOrganizationType rot ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
						WHERE rot.Code = 'LEA')
WHERE CountType = 'LEACount'


--Count the Schools--

INSERT INTO #TotalCountsComparison
SELECT 'SchoolCount', NULL, NULL, NULL

UPDATE #TotalCountsComparison
SET EdFiTotalCount = (SELECT COUNT(DISTINCT s.SchoolId)
						FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg
						JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON edorg.EducationOrganizationId = lea.LocalEducationAgencyId
						JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School s ON lea.LocalEducationAgencyId = s.LocalEducationAgencyId)
WHERE CountType = 'SchoolCount'

UPDATE #TotalCountsComparison
SET CEDSTotalCount = (SELECT COUNT(DISTINCT orgd.OrganizationId)
						FROM ODS.OrganizationDetail orgd
						JOIN ODS.RefOrganizationType rot ON orgd.RefOrganizationTypeId = rot.RefOrganizationTypeId
						WHERE rot.Code = 'K12School')
WHERE CountType = 'SchoolCount'

---Count Title I Participation---

INSERT INTO #TotalCountsComparison
SELECT 'TitleIStudentCount', NULL, NULL, NULL

UPDATE #TotalCountsComparison
SET EdFiTotalCount = (SELECT COUNT(DISTINCT s.StudentUniqueId)
						FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
						JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentTitleIPartAProgramAssociation stitleI ON s.StudentUSI = stitleI.StudentUSI
						WHERE BeginDate >= App.GetFiscalYearStartDate(@SchoolYear)
						AND BeginDate <= App.GetFiscalYearEndDate(@SchoolYear))
WHERE CountType = 'TitleIStudentCount'

UPDATE #TotalCountsComparison
SET CEDSTotalCount = (SELECT COUNT(DISTINCT pid.Identifier)
						FROM ODS.PersonIdentifier pid
						JOIN ODS.OrganizationPersonRole opr ON pid.PersonId = opr.PersonId
						JOIN ODS.PersonProgramParticipation ppp ON opr.OrganizationPersonRoleId = ppp.OrganizationPersonRoleId
						JOIN ODS.ProgramParticipationTitleI pppTI ON ppp.PersonProgramParticipationId = pppTI.PersonProgramParticipationId
						WHERE opr.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
						AND opr.ExitDate <= App.GetFiscalYearEndDate(@SchoolYear))
WHERE CountType = 'TitleIStudentCount'


---Count Migrant Participation---

INSERT INTO #TotalCountsComparison
SELECT 'MigrantStudentCount', NULL, NULL, NULL

UPDATE #TotalCountsComparison
SET EdFiTotalCount = (SELECT COUNT(DISTINCT s.StudentUniqueId)
						FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
						JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentMigrantEducationProgramAssociation smig ON s.StudentUSI = smig.StudentUSI
						WHERE BeginDate >= App.GetFiscalYearStartDate(@SchoolYear)
						AND BeginDate <= App.GetFiscalYearEndDate(@SchoolYear))
WHERE CountType = 'MigrantStudentCount'

UPDATE #TotalCountsComparison
SET CEDSTotalCount = (SELECT COUNT(DISTINCT pid.Identifier)
						FROM ODS.PersonIdentifier pid
						JOIN ODS.OrganizationPersonRole opr ON pid.PersonId = opr.PersonId
						JOIN ODS.PersonProgramParticipation ppp ON opr.OrganizationPersonRoleId = ppp.OrganizationPersonRoleId
						JOIN ODS.ProgramParticipationMigrant mig ON ppp.PersonProgramParticipationId = mig.PersonProgramParticipationId
						WHERE opr.EntryDate >= App.GetFiscalYearStartDate(@SchoolYear)
						AND opr.ExitDate <= App.GetFiscalYearEndDate(@SchoolYear))
WHERE CountType = 'MigrantStudentCount'

-------------------------------------------
---Total Counts----------------------------
-------------------------------------------

INSERT INTO #TableRecordCounts SELECT 'ODS.[Location]', (SELECT COUNT(*) FROM ODS.[Location])
INSERT INTO #TableRecordCounts SELECT 'ODS.Assessment', (SELECT COUNT(*) FROM ODS.Assessment)
INSERT INTO #TableRecordCounts SELECT 'ODS.AssessmentAdministration', (SELECT COUNT(*) FROM ODS.AssessmentAdministration)
INSERT INTO #TableRecordCounts SELECT 'ODS.AssessmentForm', (SELECT COUNT(*) FROM ODS.AssessmentForm)
INSERT INTO #TableRecordCounts SELECT 'ODS.AssessmentPerformanceLevel', (SELECT COUNT(*) FROM ODS.AssessmentPerformanceLevel)
INSERT INTO #TableRecordCounts SELECT 'ODS.AssessmentRegistration', (SELECT COUNT(*) FROM ODS.AssessmentRegistration)
INSERT INTO #TableRecordCounts SELECT 'ODS.AssessmentResult', (SELECT COUNT(*) FROM ODS.AssessmentResult)
INSERT INTO #TableRecordCounts SELECT 'ODS.AssessmentResult_PerformanceLevel', (SELECT COUNT(*) FROM ODS.AssessmentResult_PerformanceLevel)
INSERT INTO #TableRecordCounts SELECT 'ODS.AssessmentSubtest', (SELECT COUNT(*) FROM ODS.AssessmentSubtest)
INSERT INTO #TableRecordCounts SELECT 'ODS.Incident', (SELECT COUNT(*) FROM ODS.Incident)
INSERT INTO #TableRecordCounts SELECT 'ODS.K12FederalFundAllocation', (SELECT COUNT(*) FROM ODS.K12FederalFundAllocation)
INSERT INTO #TableRecordCounts SELECT 'ODS.K12LEAFederalFunds', (SELECT COUNT(*) FROM ODS.K12LEAFederalFunds)
INSERT INTO #TableRecordCounts SELECT 'ODS.K12School', (SELECT COUNT(*) FROM ODS.K12School)
INSERT INTO #TableRecordCounts SELECT 'ODS.K12SchoolGradeOffered', (SELECT COUNT(*) FROM ODS.K12SchoolGradeOffered)
INSERT INTO #TableRecordCounts SELECT 'ODS.K12StaffAssignment', (SELECT COUNT(*) FROM ODS.K12StaffAssignment)
INSERT INTO #TableRecordCounts SELECT 'ODS.K12StudentDiscipline', (SELECT COUNT(*) FROM ODS.K12StudentDiscipline)
INSERT INTO #TableRecordCounts SELECT 'ODS.K12StudentEnrollment', (SELECT COUNT(*) FROM ODS.K12StudentEnrollment)
INSERT INTO #TableRecordCounts SELECT 'ODS.LocationAddress', (SELECT COUNT(*) FROM ODS.LocationAddress)
INSERT INTO #TableRecordCounts SELECT 'ODS.Organization', (SELECT COUNT(*) FROM ODS.Organization)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationCalendar', (SELECT COUNT(*) FROM ODS.OrganizationCalendar)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationCalendarSession', (SELECT COUNT(*) FROM ODS.OrganizationCalendarSession)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationDetail', (SELECT COUNT(*) FROM ODS.OrganizationDetail)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationIdentifier', (SELECT COUNT(*) FROM ODS.OrganizationIdentifier)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationLocation', (SELECT COUNT(*) FROM ODS.OrganizationLocation)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationOperationalStatus', (SELECT COUNT(*) FROM ODS.OrganizationOperationalStatus)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationPersonRole', (SELECT COUNT(*) FROM ODS.OrganizationPersonRole)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationProgramType', (SELECT COUNT(*) FROM ODS.OrganizationProgramType)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationRelationship', (SELECT COUNT(*) FROM ODS.OrganizationRelationship)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationTelephone', (SELECT COUNT(*) FROM ODS.OrganizationTelephone)
INSERT INTO #TableRecordCounts SELECT 'ODS.OrganizationWebsite', (SELECT COUNT(*) FROM ODS.OrganizationWebsite)
INSERT INTO #TableRecordCounts SELECT 'ODS.Person', (SELECT COUNT(*) FROM ODS.Person)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonCredential', (SELECT COUNT(*) FROM ODS.PersonCredential)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonDemographicRace', (SELECT COUNT(*) FROM ODS.PersonDemographicRace)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonDetail', (SELECT COUNT(*) FROM ODS.PersonDetail)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonDisability', (SELECT COUNT(*) FROM ODS.PersonDisability)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonEmailAddress', (SELECT COUNT(*) FROM ODS.PersonEmailAddress)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonIdentifier', (SELECT COUNT(*) FROM ODS.PersonIdentifier)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonLanguage', (SELECT COUNT(*) FROM ODS.PersonLanguage)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonProgramParticipation', (SELECT COUNT(*) FROM ODS.PersonProgramParticipation)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonStatus', (SELECT COUNT(*) FROM ODS.PersonStatus)
INSERT INTO #TableRecordCounts SELECT 'ODS.PersonTelephone', (SELECT COUNT(*) FROM ODS.PersonTelephone)
INSERT INTO #TableRecordCounts SELECT 'ODS.ProgramParticipationMigrant', (SELECT COUNT(*) FROM ODS.ProgramParticipationMigrant)
INSERT INTO #TableRecordCounts SELECT 'ODS.ProgramParticipationSpecialEducation', (SELECT COUNT(*) FROM ODS.ProgramParticipationSpecialEducation)
INSERT INTO #TableRecordCounts SELECT 'ODS.ProgramParticipationTitleI', (SELECT COUNT(*) FROM ODS.ProgramParticipationTitleI)
INSERT INTO #TableRecordCounts SELECT 'ODS.StaffCredential', (SELECT COUNT(*) FROM ODS.StaffCredential)

------------------------------------------
----Run the Report -----------------------
------------------------------------------

SELECT * FROM #TotalCountsComparison
SELECT * FROM #TableRecordCounts

IF OBJECT_ID('tempdb.dbo.#TotalCountsComparison', 'U') IS NOT NULL
  DROP TABLE #TotalCountsComparison; 

IF OBJECT_ID('tempdb.dbo.#TableRecordCounts', 'U') IS NOT NULL
  DROP TABLE #TableRecordCounts; 




