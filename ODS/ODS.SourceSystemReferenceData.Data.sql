-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE generate
GO

-- Populate ODS.SourceSystemReferenceData
--------------------------------------

-- RefOperationalStatus - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOperationalStatus' and TableFilter = 'LEA')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Active', 'Open')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Added', 'Added')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Changed', 'ChangedBoundary')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Closed', 'Closed')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Continuing', 'Open')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Future', 'FutureAgency')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Inactive', 'Inactive')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'New', 'New')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'LEA', 'Reopened', 'Reopened')

end

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOperationalStatus' and TableFilter = 'K12School')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Active', 'Open')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Added', 'Added')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Changed', 'ChangedAgency')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Closed', 'Closed')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Continuing', 'Open')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Future', 'FutureSchool')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Inactive', 'Inactive')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'New', 'New')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'K12School', 'Reopened', 'Reopened')

end


if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOperationalStatus' and TableFilter = 'Organization')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'Organization', 'Active', 'Active')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOperationalStatus', 'Organization', 'Inactive', 'Inactive')

end


-- RefOrganizationLocationType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationLocationType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationLocationType', null, 'Physical', 'Physical')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationLocationType', null, 'Mailing', 'Mailing')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationLocationType', null, 'Shipping', 'Shipping')
end


-- RefOrganizationIdentificationSystem - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationIdentificationSystem' and TableFilter = 'SEA')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'SEA', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'SEA', 'SEA', 'State')
end

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationIdentificationSystem' and TableFilter = 'LEA')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'ACT', 'ACT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'DUNS', 'DUNS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'NCES', 'NCES')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'Other Federal', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'LEA', 'SEA', 'SEA')

end


if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationIdentificationSystem' and TableFilter = 'K12School')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'ACT', 'ACT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'DUNS', 'DUNS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'LEA', 'LEA')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'NCES', 'NCES')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'Other Federal', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'School', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'K12School', 'SEA', 'SEA')

end


if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationIdentificationSystem' and TableFilter = 'Organization')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'ACT', 'ACT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'DUNS', 'DUNS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'LEA', 'LEA')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'NCES', 'NCES')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'Other Federal', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'School', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIdentificationSystem', 'Organization', 'SEA', 'SEA')

end


-- RefSchoolType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSchoolType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolType', null, 'Alternative', 'Alternative')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolType', null, 'Career and Technical Education', 'CareerAndTechnical')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolType', null, 'Regular', 'Regular')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolType', null, 'Special Education', 'Special')
end


-- RefCharterSchoolType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCharterSchoolType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolType', null, 'College / University Charter', 'CollegeUniversity')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolType', null, 'Open Enrollment', 'NA')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolType', null, 'School Charter', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolType', null, 'Not a Charter School', 'NA')
end


-- RefCharterSchoolApprovalAgencyType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCharterSchoolApprovalAgencyType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolApprovalAgencyType', null, 'State board of education', 'State')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolApprovalAgencyType', null, 'Public charter school board', 'PublicCharterBoard')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolApprovalAgencyType', null, 'University', 'University')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolApprovalAgencyType', null, 'Other', 'Other')
end

-- RefCharterSchoolManagementOrganizationType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCharterSchoolManagementOrganizationType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolManagementOrganizationType', null, 'CMO', 'CNO')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolManagementOrganizationType', null, 'EMO', 'EMO')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCharterSchoolManagementOrganizationType', null, 'Other', 'Other')
end

-- RefInternetAccess - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefInternetAccess')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInternetAccess', null, 'High Speed', 'HighSpeed')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInternetAccess', null, 'Less Than High Speed', 'LessThanHighSpeed')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInternetAccess', null, 'None', null)
end

-- RefTitleIschoolStatus - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefTitleIschoolStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Not A Title I School', 'NOTTITLE1ELIG')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I Schoolwide Eligible School-No Program', 'SWELIGNOPROG')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I Schoolwide Eligible-Target Assist Program', 'SWELIGTGPROG')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I Schoolwide School', 'SWELIGSWPROG')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I Targeted Assistance Eligible-No Program', 'TGELGBNOPROG')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I Targeted Assistance School', 'TGELGBTGPROG')
end

-- extension to LEA for Target I program
-- RefTitleIinstructionalServices
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefTitleIinstructionalServices')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIinstructionalServices', null, 'ReadingLanguageArts', 'ReadingLanguageArts')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIinstructionalServices', null, 'Mathematics', 'Mathematics')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIinstructionalServices', null, 'Science', 'Science')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIinstructionalServices', null, 'SocialSciences', 'SocialSciences')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIinstructionalServices', null, 'CareerAndTechnical', 'CareerAndTechnical')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIinstructionalServices', null, 'Other', 'Other')
end

-- RefTitleIProgramType
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefTitleIProgramType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramType', null, 'TargetedAssistanceProgram', 'TargetedAssistanceProgram')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramType', null, 'SchoolwideProgram', 'SchoolwideProgram')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramType', null, 'PrivateSchoolStudents', 'PrivateSchoolStudents')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramType', null, 'LocalNeglectedProgram', 'LocalNeglectedProgram')
end

-- RefK12LeaTitleISupportService
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefK12LeaTitleISupportService')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12LeaTitleISupportService', null, 'HealthDentalEyeCare', 'HealthDentalEyeCare')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12LeaTitleISupportService', null, 'GuidanceAdvocacy', 'GuidanceAdvocacy')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12LeaTitleISupportService', null, 'Other', 'Other')
end

-- RefMagnetSpecialProgram - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMagnetSpecialProgram')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMagnetSpecialProgram', null, 'All students participate', 'All')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMagnetSpecialProgram', null, 'No students participate', 'None')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMagnetSpecialProgram', null, 'Some, but not all, students participate', 'Some')
end


-- RefAdministrativeFundingControl - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAdministrativeFundingControl')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAdministrativeFundingControl', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAdministrativeFundingControl', null, 'Private School', 'Private')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAdministrativeFundingControl', null, 'Public School', 'Public')
end


-- RefInstitutionTelephoneType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefInstitutionTelephoneType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Administrative', 'Administrative')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Attendance', 'Attendance')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Fax', 'Fax')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Food Service', 'FoodServices')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Health Clinic', 'HealthClinic')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Main', 'Main')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefInstitutionTelephoneType', null, 'Other', 'Other')

end


-- RefGunFreeSchoolsActReportingStatus - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefGunFreeSchoolsActReportingStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGunFreeSchoolsActReportingStatus', null, 'Yes, with one or more student offenses', 'YesReportingOffenses')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGunFreeSchoolsActReportingStatus', null, 'Yes, with no reported offenses', 'YesNoReportedOffenses')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGunFreeSchoolsActReportingStatus', null, 'No', 'No')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGunFreeSchoolsActReportingStatus', null, 'Not applicable', 'NA')
end


-- RefPublicSchoolChoiceStatus - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPublicSchoolChoiceStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolChoiceStatus', null, 'Implemented at all grade levels', 'ImplementedAllGrades')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolChoiceStatus', null, 'Implemented at some but not all grade levels', 'ImplementedSomeGrades')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolChoiceStatus', null, 'Unable to implement at any grades levels', 'UnableToImplement')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolChoiceStatus', null, 'Not required to implement public school choice', 'NotRequiredToImplement')
end


-- RefGradeLevel - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefGradeLevel')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Adult Education', 'ABE')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Early Education', 'PR')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Eighth grade', '08')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Eleventh grade', '11')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Fifth grade', '05')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'First grade', '01')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Fourth grade', '04')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Grade 13', '13')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Infant/toddler', 'IT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Kindergarten', 'KG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Ninth grade', '09')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Postsecondary', 'PS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Preschool/Prekindergarten', 'PK')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Second grade', '02')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Seventh grade', '07')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Sixth grade', '06')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Tenth grade', '10')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Third grade', '03')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Twelfth grade', '12')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000100', 'Ungraded', 'UG')


	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Adult Education', 'ABE')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Early Education', 'PR')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Eighth grade', '08')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Eleventh grade', '11')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Fifth grade', '05')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'First grade', '01')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Fourth grade', '04')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Grade 13', '13')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Infant/toddler', 'IT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Kindergarten', 'KG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Ninth grade', '09')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Postsecondary', 'PS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Preschool/Prekindergarten', 'PK')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Second grade', '02')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Seventh grade', '07')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Sixth grade', '06')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Tenth grade', '10')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Third grade', '03')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Twelfth grade', '12')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000126', 'Ungraded', 'UG')


		insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Adult Education', 'ABE')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Early Education', 'PR')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Eighth grade', '08')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Eleventh grade', '11')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Fifth grade', '05')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'First grade', '01')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Fourth grade', '04')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Grade 13', '13')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Infant/toddler', 'IT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Kindergarten', 'KG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Ninth grade', '09')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Postsecondary', 'PS')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Preschool/Prekindergarten', 'PK')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Second grade', '02')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Seventh grade', '07')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Sixth grade', '06')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Tenth grade', '10')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Third grade', '03')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Twelfth grade', '12')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefGradeLevel', '000131', 'Ungraded', 'UG')


end



-- RefSchoolLevel - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSchoolLevel')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Adult School', '00013')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'All Levels', '01302')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Elementary School', '01304')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'High School', '02402')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Infant/toddler School', '00787')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Intermediate School', '02399')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Junior High School', '02602')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Middle School', '02400')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Preschool/early childhood', '01981')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Primary School', '02397')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSchoolLevel', null, 'Secondary School', '02403')

end


-- RefCalendarEventType - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCalendarEventType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Emergency day', 'EmergencyDay')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Holiday', 'Holiday')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Instructional day', 'InstructionalDay')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Make-up day', 'MakeupDay')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Strike', 'Strike')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Student late arrival/early dismissal', 'LateArrivalEarlyDismissal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Teacher only day', 'TeacherOnlyDay')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCalendarEventType', null, 'Weather day', 'WeatherDay')

end



-- RefSessionType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSessionType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'MiniTerm', 'MiniTerm')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Quarter', 'Quarter')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Semester', 'Semester')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Trimester', 'Trimester')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSessionType', null, 'Year Round', 'FullSchoolYear')
end


-- Staff reference tables

-- RefSex - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSex')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSex', null, 'Female', 'Female')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSex', null, 'Male', 'Male')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSex', null, 'Not Selected', 'NotSelected')

end



-- RefUscitizenshipStatus - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefUscitizenshipStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'Non-resident alien', 'NonResidentAlien')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'Permanent resident', 'PermanentResident')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'Refugee', 'Refugee')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'Resident alien', 'ResidentAlien')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefUscitizenshipStatus', null, 'US Citizen', 'USCitizen')
end


-- RefEducationLevel - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefEducationLevel')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Associate''s Degree (two years or more)', '01050')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Bachelor''s', '01051')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Did Not Graduate High School', '01043')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Doctorate', '01057')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'High School Diploma', '01044')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Master''s', '01054')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEducationLevel', null, 'Some College No Degree', '01049')
end


-- RefRace - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefRace')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'American Indian - Alaska Native', 'AmericanIndianorAlaskaNative')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'Asian', 'Asian')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'Black - African American', 'BlackorAfricanAmerican')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'Native Hawaiian - Pacific Islander', 'NativeHawaiianorOtherPacificIslander')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefRace', null, 'White', 'White')

end


-- RefPersonLocationType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPersonLocationType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Billing', 'Billing')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Doubled - up (i.e., living with another family)', 'Doubled - up (i.e., living with another family)')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Father Address', 'Father Address')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Guardian Address', 'Guardian Address')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Home', 'Home')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Hotels/Motels', 'Hotels/Motels')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', '', 'Mailing', 'Mailing')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Mother Address', 'Mother Address')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Physical', 'Physical')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Shelters, Transitional housing, Awaiting Foster Care', 'Shelters, Transitional housing, Awaiting Foster Care')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Shipping', 'Shipping')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Temporary', 'Temporary')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Unsheltered (e.g. cars, parks, campgrounds, temporary trailers including FEMA trailers, or abandoned buildings)', 'Unsheltered (e.g. cars, parks, campgrounds, temporary trailers including FEMA trailers, or abandoned buildings)')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonLocationType', null, 'Work', 'Employment')

end



-- RefCredentialType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCredentialType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Certification', 'Certification')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Endorsement', 'Endorsement')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Licensure', 'Licensure')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCredentialType', null, 'Registration', 'Registration')

end


-- RefOtherNameType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOtherNameType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOtherNameType', null, 'Alias', 'Alias')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOtherNameType', null, 'Nickname', 'Nickname')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOtherNameType', null, 'Other Name', 'OtherName')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOtherNameType', null, 'Previous Legal Name', 'PreviousLegalName')
end


-- RefEmailType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefEmailType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmailType', null, 'Home/Personal', 'Home')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmailType', null, 'Organization', 'Organizational')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmailType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmailType', null, 'Work', 'Work')
end


-- RefLanguageUseType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefLanguageUseType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Correspondence language', 'Correspondence')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Dominant language', 'Dominant')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Home language', 'Home')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Native language', 'Native')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Other language proficiency', 'OtherLanguageProficiency')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Spoken language', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguageUseType', null, 'Written language', 'Other')
end


-- RefPersonTelephoneNumberType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPersonTelephoneNumberType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Emergency 1', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Emergency 2', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Fax', 'Fax')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Home', 'Home')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Mobile', 'Mobile')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Unlisted', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonTelephoneNumberType', null, 'Work', 'Work')
end


-- RefLanguage - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefLanguage')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguage', null, 'English', 'eng')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLanguage', null, 'Spanish', 'spa')
end



-- RefOperationalStatus - Source = EdFi

if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPersonIdentificationSystem' and TableFilter = '001571')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Canadian SIN', 'CanadianSIN')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'District', 'District')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Drivers License', 'DriversLicense')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Federal', 'Federal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Health Record', 'HealthRecord')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Medicaid', 'Medicaid')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Other Federal', 'OtherFederal')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'PIN', 'PIN')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Professional Certificate', 'ProfessionalCertificate')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'School', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'Selective Service', 'SelectiveService')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'SSN', 'SSN')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'State', 'State')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonIdentificationSystem', '001571', 'US Visa', 'USVisa')
end



-- RefProgramType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefProgramType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Adult/Continuing Education', '73056')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Alternative Education', '04961')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Athletics', '04932')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Bilingual', '04923')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Bilingual Summer', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Career and Technical Education', '04906')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Cocurricular Programs', '04931')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'College Preparatory', '04958')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Community Service Program', '04945')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Community/Junior College Education Program', '04944')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Compensatory Services for Disadvantaged Students', '04922')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Counseling Services', '04956')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'District-Funded GED', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Early Head Start', '14609')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Early Intervention Services Part C', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'English as a Second Language (ESL)', '04928')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Even Start', '04919')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Expelled Education', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Extended Day/Child Care Services', '04955')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Fee For Service', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Foreign Exchange', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Gifted and Talented', '04930')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Head Start', '04918')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Health Services Program', '04963')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'High School Equivalency Program (HSEP)', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Home Visiting', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'IDEA', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Immigrant Education', '04957')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Independent Study', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Indian Education', '04921')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'International Baccalaureate', '04959')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Kindergarten - Extended Day', '')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Kindergarten - Full Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Kindergarten - Half Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Library/Media Services Program', '04962')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Magnet/Special Program Emphasis', '04960')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Migrant Education', '04920')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Neglected and Delinquent Program', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Optional Flexible School Day Program (OFSDP)', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Prekindergarten - Extended Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Prekindergarten - Full Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Prekindergarten - Half Day', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Preschool Special Education', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Public Preschool', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Regular Education', '04887')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Remedial Education', '04964')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Section 504 Placement', '04967')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Service Learning', '04966')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Special Education', '04888')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Student Retention/Dropout Prevention', '04954')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Substance Abuse Education/Prevention', '04953')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Teacher Professional Development/Mentoring', '04968')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Technical Preparatory', '04917')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Title I Part A', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Title I Part D Subpart 1', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Title I Part D Subpart 2', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProgramType', null, 'Vocational Education', '09999')
end


-- RefOrganizationRelationship - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationRelationship')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Business', 'Business')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Education organization network', 'Education organization network')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Education Service Center', 'Education Service Center')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Federal government', 'Federal government')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Local Education Agency', 'Local Education Agency')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Non-profit organization', 'Non-profit organization')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Other', 'Other')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Postsecondary institution', 'Postsecondary institution')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Private organization', 'Private organization')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'Religious organization', 'Religious organization')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'School', 'School')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationRelationship', null, 'State Education Agency', 'State Education Agency')
end




-- RefActivityRecognitionType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefActivityRecognitionType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Athletic awards', '00737')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Awarding of units of value', '00738')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Certificate', '00742')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Citizenship award/recognition', '00740')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Completion of requirement, but no units of value awarded', '00741')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Honor award', '00743')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Letter of commendation', '02048')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Medals', '00745')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Monogram/letter', '00746')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Points', '00747')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefActivityRecognitionType', null, 'Promotion or advancement', '00748')

end



-- RefAcademicHonorType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAcademicHonorType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Attendance award', '08692')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Awarding of units of value', '00738')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Certificate', '00742')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Citizenship award/recognition', '00740')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Completion of requirement, but no units of value awarded', '00741')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honor award', '02047')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honor roll', '01985')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honor society', '01986')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honorable mention', '01987')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Honors program', '01988')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Letter of student commendation', '00744')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Medals', '00745')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'National Merit Scholar', '08693')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Points', '00747')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Prize awards', '01989')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Promotion or advancement', '00748')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicHonorType', null, 'Scholarships', '01991')
end



-- RefHighSchoolDiplomaDistinctionType AKA DiplomaLevel - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefHighSchoolDiplomaDistinctionType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Distinguished', 'Distinguished')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Magna cum laude', 'MagnaCumLaude')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Minimum', 'Minimum')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Open Enrollment', 'OpenEnrollment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Recommended', 'Recommended')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaDistinctionType', null, 'Summa cum laude', 'SummaCumLaude')
end


-- RefHighSchoolDiplomaType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefHighSchoolDiplomaType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Alternative credential', '00812')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Apprenticeship Certificate', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Career and Technical Education certificate', '00819')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Certificate of attendance', '00813')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Certificate of completion', '00814')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Endorsed/advanced diploma', '00807')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'General Educational Development (GED) credential', '00816')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'High school equivalency credential, other than GED', '00815')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Industry-recognized Certification', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'International Baccalaureate', '00809')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Modified diploma', '00810')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Occupational License', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Other diploma', '00811')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Post graduate certificate (grade 13)', '00818')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Regents diploma', '00808')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHighSchoolDiplomaType', null, 'Regular diploma', '00806')

end



-- RefExitOrWithdrawalType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefExitOrWithdrawalType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Completed', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Died or is permanently incapacitated', '01923')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Dropout', '01927')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'End of school year', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Enrolled in a high school diploma program', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Expelled', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Graduated', '01921')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Incarcerated', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Invalid enrollment', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Involuntarily Removed', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'No show', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Reached maximum age', '03504')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Transferred', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefExitOrWithdrawalType', null, 'Withdrawn', '09999')
end



-- RefPromotionReason - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPromotionReason')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Accelerated promotion', 'AcceleratedPromotion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Continuous promotion', 'ContinuousPromotion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Probationary promotion', 'ProbationaryPromotion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Regular promotion', 'RegularPromotion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPromotionReason', null, 'Promotion - Variable progress', 'VariableProgress')
end



-- RefNonPromotionReason - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefNonPromotionReason')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Failed to meet testing requirements', 'FailedTestingRequirements')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Illness', 'Illness')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Immaturity', 'Immaturity')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Inadequate performance', 'InadequatePerformance')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Insufficient credits', 'InsufficientCredits')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNonPromotionReason', null, 'Nonpromotion - Prolonged absence', 'ProlongedAbsence')
end



-- RefEntryType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefEntryType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'New to education system', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'Next year school', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'Re-entry', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEntryType', null, 'Transfer', '09999')
end


-- RefPublicSchoolResidence - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPublicSchoolResidence')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of administrative unit and usual school attendance area', '01652')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of administrative unit, but of other school attendance area', '01653')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of an administrative unit that crosses state boundaries', '01655')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of another state', '01656')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPublicSchoolResidence', null, 'Resident of this state, but not of this administrative unit', '01654')
end


-- RefSpecialEducationExitReason - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSpecialEducationExitReason')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Died or is permanently incapacitated', 'Died')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Discontinued schooling', 'DroppedOut')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Reached maximum age', 'ReachedMaximumAge')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Transferred to another district or school', 'MovedAndContinuing')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Withdrawal by a parent (or guardian)', 'WithdrawalByParent')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Transferred', 'Transferred')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Graduated with a high school diploma', 'HighSchoolDiploma')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'AlternateDiploma', 'AlternateDiploma')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Received certificate of completion or equivalent', 'ReceivedCertificate')
end



-- RefIdeaEducationalEnvironmentSchoolAge - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIdeaeducationalEnvironmentSchoolAge')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Correctional Facilities', 'CF')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Homebound/Hospital', 'HH')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Inside regular class 80% or more of the day', 'RC80')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Inside regular class less than 40% of the day', 'RC39')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Inside reg class between 40-79% of the day', 'RC79TO40')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Parentally-placed in Private Schools', 'PPPS')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Residential Facility', 'RF')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Separate School', 'SS')
end


-- RefIDEAEducationalEnvironmentEC - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIDEAEducationalEnvironmentEC')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'REC09YOTHLOC', 'REC09YOTHLOC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'REC10YOTHLOC', 'REC10YOTHLOC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'REC09YSVCS', 'REC09YSVCS')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'REC10YSVCS', 'REC10YSVCS')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'SC', 'SC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'SS', 'SS')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'RF', 'RF')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'H', 'H')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAEducationalEnvironmentEC', null, 'SPL', 'SPL')
end


-- RefAcademicSubject - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAcademicSubject')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Career and Technical Education', '73065')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Composite', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Critical Reading', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English', '13372')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English Language Arts', '13373')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Fine and Performing Arts', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Foreign Language and Literature', '00546')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Life and Physical Sciences', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Mathematics', '01166')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Military Science', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Physical, Health, and Safety Education', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Reading', '00560')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Religious Education and Theology', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Science', '00562')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Social Sciences and History', '13374')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Social Studies', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Writing', '01287')
end

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefAcademicSubject' AND InputCode ='English as a second language (ESL)')
	INSERT INTO [ODS].[SourceSystemReferenceData]
			   ([SchoolYear]
			   ,[TableName]
			   ,[InputCode]
			   ,[OutputCode])
	SELECT 2018
		,'RefAcademicSubject'
		,'English as a second language (ESL)'
		,'00256'



-- RefIncidentBehavior - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIncidentBehavior')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentBehavior', null, 'School Violation', '04704')
end


-- RefIncidentLocation - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIncidentLocation')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Administrative offices area', '03012')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Athletic field or playground', '03022')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Auditorium', '03020')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Bus stop', '03027')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Cafeteria area', '03013')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Classroom', '03014')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Computer lab', '03019')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Hallway or stairs', '03015')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Library/media center', '03018')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Locker room or gym areas', '03016')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off campus', '03026')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off-campus at a school sponsored activity', '13773')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off-campus at another location unrelated to school', '13774')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off-campus at other school', '03030')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Off-campus at other school district facility', '03031')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'On campus', '03011')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'On-campus other inside area', '03021')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'On-campus other outside area', '03025')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Online', '03413')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Parking lot', '03024')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Restroom', '03017')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'School bus', '03028')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Stadium', '03023')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Unknown', '09997')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentLocation', null, 'Walking to or from school', '03029')
end



-- RefWeaponType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefFirearmType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Club', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Handgun', 'Handguns')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Knife', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Other Firearm', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Other Object', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Other Sharp Objects', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Rifle/Shotgun', 'RiflesShotguns')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Substance Used as Weapon', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Unknown', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFirearmType', null, 'Multiple', 'Multiple')
end


-- RefIncidentReporterType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIncidentReporterType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Law enforcement officer', '03054')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Non-school personnel', '03059')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Parent/guardian', '00850')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Staff', '03422')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentReporterType', null, 'Student', '00126')
end


-- RefEmploymentStatus - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefEmploymentStatus')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Contractual', '01379')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Employed or affiliated with outside agency part-time', '06071')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Employed or affiliated with outside organization', '01383')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Employed part-time', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Non-contractual', '01385')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Other', '09999')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Probationary', '01378')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Substitute/temporary', '01380')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Tenured or permanent', '01381')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefEmploymentStatus', null, 'Volunteer/no contract', '01382')
end


-- RefK12staffClassification  - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefK12staffClassification')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Counselor', 'SchoolCounselors')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Instructional Coordinator', 'InstructionalCoordinators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Librarians/Media Specialists', 'LibraryMediaSpecialists')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'School Administrator', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Support Services Staff', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Instructional Aide', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Assistant Principal', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Principal', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Teacher', 'ElementaryTeachers') -- Need more granularity to this for the EDFacts report
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Substitute Teacher', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Operational Support', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Superintendent', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'School Leader', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Assistant Superintendent', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Other', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'LEA Specialist', 'StudentSupportServicesStaff')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'LEA Administrator', 'Administrators')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'School Specialist', 'StudentSupportServicesStaff')
	
end
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefK12staffClassification'
	AND InputCode = 'Paraprofessionals'
)
insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefK12staffClassification ', null, 'Paraprofessionals', 'Paraprofessionals')




	-- RefIncidentPersonRoleType - Source = EdFi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIncidentPersonRoleType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentPersonRoleType', null, 'Perpetrator', 'Perpetrator')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentPersonRoleType', null, 'Reporter', 'Reporter')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentPersonRoleType', null, 'Victim', 'Victim')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIncidentPersonRoleType', null, 'Witness', 'Witness')
end


-- RefDisabilityType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'Serious Emotional Disability')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'Serious Emotional Disability', 'EMN')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'DB')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'DB', 'DB')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'HI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'HI', 'HI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'ID')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'ID', 'ID')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'MD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'MD', 'MD')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'OI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'OI', 'OI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'OHI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'OHI', 'OHI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'SLD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'SLD', 'SLD')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'SLI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'SLI', 'SLI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'VI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'VI', 'VI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'AUT')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'AUT', 'AUT')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'TBI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'TBI', 'TBI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'ITD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'ITD', 'OHI') --edfi "Infant/Toddler with a Disability"
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'Medical condition')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'Medical condition', 'OHI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'Mental impairment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'Mental impairment', 'OHI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'Motor impairment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'Motor impairment', 'OHI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'Other', 'OHI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'Physical Disability')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'Physical Disability', 'OHI')
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'PSD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'PSD', 'OHI') -- edfi "Preschooler with a Disability"
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType' AND InputCode = 'Sensory impairment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'Sensory impairment', 'OHI')



-- RefMepEnrollmentType - Source = edfi
--Cannot find these values in edfi, put the CEDS description as a placeholder for now
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMepEnrollmentType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '01', '01') --Basic School Program
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '02', '02') --Regular Term MEP-Funded Project
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '03', '03') --Summer/Intersession MEP-Funded Project
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '04', '04') --Year Round MEP-Funded Project
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '05', '05') --Basic School Program and Regular-Term MEP-Funded Project
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepEnrollmentType', null, '06', '06') --Residency Only (none of the above)

end

-- RefMepServiceType - Source = edfi
-- Cannot find these values in edfi, put the CEDS code as a placeholder for now
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMepServiceType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'Counseling Services', 'CounselingServices')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'High School Accrual', 'HighSchoolAccrual')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'Instructional Services', 'InstructionalServices')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'Mathematics Instruction', 'MathematicsInstruction')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'Reading Instruction', 'ReadingInstruction')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'Referral Services', 'ReferralServices')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'Support Services', 'SupportServices')

end

-- RefContinuationOfServices - Source = edfi
-- Previously migratory secondary student - not used
-- Ceased to be migratory during previous term - not used
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefContinuationOfServices')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefContinuationOfServices', null, 'Ceased to be migratory during school term', '01')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefContinuationOfServices', null, 'Ceased to be migratory during prev term and no com', '02')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefContinuationOfServices', null, 'Prev migratory scndry student continuing scndry sc', '03')

end


-- RefAssessmentParticipationIndicator - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentParticipationIndicator')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentParticipationIndicator', null, '1', 'Participated')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentParticipationIndicator', null, '0', 'DidNotParticipate')

end

-- AssessmentPerformanceLevel_Identifier - Source = edfi
--if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'AssessmentPerformanceLevel_Identifier')
--begin
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'AssessmentPerformanceLevel_Identifier', null, 'Unsatisfactory', 'L1')
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'AssessmentPerformanceLevel_Identifier', null, 'Proficient', 'L2')
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'AssessmentPerformanceLevel_Identifier', null, 'Advanced', 'L3')
--	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	--(2018, 'AssessmentPerformanceLevel_Identifier', null, '', 'L4')
--	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	--(2018, 'AssessmentPerformanceLevel_Identifier', null, '', 'L5')
--	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	--(2018, 'AssessmentPerformanceLevel_Identifier', null, '', 'L6')

--end
DECLARE @TableName varchar(100) = 'AssessmentPerformanceLevel_Identifier'
DECLARE @SchoolYear INT = 2018
DECLARE @InputValue varchar(1000) = 'Advanced'
DECLARE @OutputValue varchar(1000) = 'L6' -- the highest level

DELETE FROM ODS.SourceSystemReferenceData WHERE TableName = @TableName 

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Basic'
SET @OutputValue = 'L4' -- Pass
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Below Basic'
SET @OutputValue = 'L3' -- Not Pass
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Pass'
SET @OutputValue = 'L4' -- Pass
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Fail'
SET @OutputValue = 'L1' -- Fail
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Proficient'
SET @OutputValue = 'L6' --
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Well Below Basic'
SET @OutputValue = 'L1' --
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Above Benchmark'
SET @OutputValue = 'L5' -- Pass
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Commended Performance'
SET @OutputValue = 'L4' -- Pass
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Met Standard'
SET @OutputValue = 'L4' -- Pass
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Minimum'
SET @OutputValue = 'L3' -- Pass
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Satisfactory'
SET @OutputValue = 'L5' -- Pass
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Unsatisfactory'
SET @OutputValue = 'L2' --
IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
	INSERT INTO [ODS].[SourceSystemReferenceData] ([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

-- RefAssessmentReasonNotCompleting - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentReasonNotCompleting')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Refusal by parent', 'ParentsOptOut')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Parental waiver', 'ParentsOptOut')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Absent', 'Absent')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'LEP postponement', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Not appropriate (ARD decision)', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Not tested (ARD decision)', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Alternate assessment administered', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Foreign exchange student waiver', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Refusal by student', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Disruptive behavior', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Previously passed the examination', 'Other')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentReasonNotCompleting', null, '', 'OutOfLevelTest')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentReasonNotCompleting', null, '', 'NoValidScore')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'Medical waiver', 'Medical')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentReasonNotCompleting', null, '', 'Moved')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentReasonNotCompleting', null, '', 'LeftProgram')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentReasonNotCompleting', null, 'LEP exempt', 'PARTELP')

end


-- RefAssessmentTypeChildrenWithDisabilities - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentTypeChildrenWithDisabilities')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State assessment', 'REGASSWOACC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State summative assessment 3-8 general', 'REGASSWOACC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'REGASSWACC', 'REGASSWACC')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State alternative assessment/grade-level standards', 'ALTASSGRADELVL')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'ALTASSMODACH')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State alternate assessment/ELL', 'ALTASSALTACH')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State alternative assessment/modified standards', 'ALTASSMODACH')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'AgeLevelWithoutAccommodations')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'AgeLevelWithAccommodations')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'BelowAgeLevelWithoutAccommodations')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'BelowAgeLevelWithAccommodations')

end


-- RefAssessmentPurpose - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentPurpose')
begin
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00050') --Admission
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00051') --Assessment of student's progress
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, 'College entrance exam', '73055') --College Readiness
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00063') --Course credit
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00064') --Course requirement
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73069') --Diagnosis	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '03459') --Federal accountability
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73068') --Inform local or state policy
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00055') --Instructional decision
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '03457') --Local accountability
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '02404') --Local graduation requirement
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73042') --Obtain a state- or industry-recognized certificate or license
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73043') --Obtain postsecondary credit for the course
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '73067') --Program eligibility
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00057') --Program evaluation
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00058') --Program placement 
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00062') --Promotion to or retention in a grade or program
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00061') --Screening
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '09999') --Other
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentPurpose', null, '', '00054') --State graduation requirement
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State assessment', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State high school course assessment', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State high school subject assessment', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State summative assessment 3-8 general', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State alternative assessment/grade-level standards', '03458') --State accountability
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentPurpose', null, 'State alternative assessment/modified standards', '03458') --State accountability

--These are additional Ed-Fi Assessment Category Descriptors that are not included in the above mapping, but may need to be in the future--
--they don't appear to be state assessment which is what we need for Ed-Fi

--Language proficiency test
--State alternate assessment/ELL
--Alternate assessment/ELL
--Advanced Placement
--Class quiz
--Psychomotor test
--Early Learning - Physical well-being and motor dev
--Early Learning - Social and emotional development
--Manual dexterity test
--Reading readiness test
--State English proficiency test
--Achievement test
--Class test
--Early Learning - Language and literacy development
--Psychological test
--International Baccalaureate
--Developmental observation
--Alternative assessment/modified standards
--Foreign language proficiency test
--Performance assessment
--Aptitude test
--Diagnostic
--Formative
--Personality test
--Benchmark test
--Early Learning - Cognition and general knowledge
--Interim
--Prekindergarten Readiness
--Attitudinal test
--Early Learning - Approaches toward learning
--Interest inventory
--Portfolio assessment
--Alternate assessment/grade-level standards
--Cognitive and perceptual skills test
--English proficiency screening test
--Mental ability (intelligence) test
--Other

end

-- RefAcademicSubject - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAcademicSubject')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Fine and Performing Arts', '13371') --Arts
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Career and Technical Education', '73065') --Career and Technical Education
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English', '13372') --English
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English as a second language (ESL)', '00256') --English as a second language (ESL)
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Foreign Language and Literature', '00546') --Foreign Languages
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '73088') --History Government - US
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '73089') --History Government - World
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English Language Arts', '00554') --Language arts
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Mathematics', '01166') --Mathematics
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Reading', '00560') --Reading
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Critical Reading', '00560') --Reading
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'English Language Arts', '13373') --Reading/Language Arts
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Science', '00562') --Science
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Life and Physical Sciences', '73086') --Science - Life
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '73087') --Science - Physical
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Social Sciences and History', '13374') --Social Sciences (History, Geography, Economics, Civics and Government)
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '02043') --Special education
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Writing', '01287') --Writing
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Other', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Composite', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Social Studies', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Physical, Health, and Safety Education', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Religious Education and Theology', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAcademicSubject', null, 'Military Science', '09999') --Other
end


-- RefAssessmentType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefAssessmentType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Achievement test', 'AchievementTest')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Advanced Placement', 'AdvancedPlacementTest')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Alternate assessment/ELL', 'AlternateAssessmentELL')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Alternate assessment/grade-level standards', 'AlternateAssessmentGradeLevelStandards')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Alternative assessment/modified standards', 'AlternativeAssessmentModifiedStandards')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Aptitude test', 'AptitudeTest')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Benchmark test', 'Benchmark')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Cognitive and perceptual skills test', 'CognitiveAndPerceptualSkills')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'ComputerAdaptiveTest')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Developmental observation', 'DevelopmentalObservation')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Diagnostic', 'Diagnostic')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'DirectAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Formative', 'Formative')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'GrowthMeasure')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Interim', 'Interim')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'KindergartenReadiness')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Language proficiency test', 'LanguageProficiency')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Mental ability (intelligence) test', 'MentalAbility')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'Observation')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'ParentReport')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Performance assessment', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State assessment', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State summative assessment 3-8 general', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State alternative assessment/grade-level standards', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State alternative assessment/modified standards', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State high school subject assessment', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State high school course assessment', 'PerformanceAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Portfolio assessment', 'PortfolioAssessment')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Prekindergarten Readiness', 'PrekindergartenReadiness')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Reading readiness test', 'ReadingReadiness')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'Screening')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentType', null, '', 'TeacherReport')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Attitudinal test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Class test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Class quiz', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'College entrance exam', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Approaches toward learning', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Cognition and general knowledge', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Language and literacy development', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Physical well-being and motor dev', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Early Learning - Social and emotional development', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'English proficiency screening test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Foreign language proficiency test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Interest inventory', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'International Baccalaureate', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Manual dexterity test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Personality test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'Psychological test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State English proficiency test', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentType', null, 'State alternate assessment/ELL', 'Other')

end

 --RefFoodServiceEligibility - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefFoodServiceEligibility')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Full Price Breakfast', 'FullPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Full Price Lunch', 'FullPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Full Price Milk', 'FullPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Full Price Snack', 'FullPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Full Price Supper', 'FullPrice')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Free Breakfast', 'Free')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Free Lunch', 'Free')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Free Milk', 'Free')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Free Snack', 'Free')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Free Supper', 'Free')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Reduced Price Breakfast', 'ReducedPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Reduced Price Lunch', 'ReducedPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Reduced Price Snack', 'ReducedPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Reduced Price Supper', 'ReducedPrice')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Other', 'Other')

end

 --RefLeaType - Source = edfi (Note: This had to be extended in Ed-Fi and CEDS Valules were used as enumerations)
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefLeaType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'RegularNotInSupervisoryUnion', 'RegularNotInSupervisoryUnion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'RegularInSupervisoryUnion', 'RegularInSupervisoryUnion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'SupervisoryUnion', 'SupervisoryUnion')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'SpecializedPublicSchoolDistrict', 'SpecializedPublicSchoolDistrict')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'ServiceAgency', 'ServiceAgency')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'StateOperatedAgency', 'StateOperatedAgency')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'FederalOperatedAgency', 'FederalOperatedAgency')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'Independent', 'Independent Charter District')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefLeaType', null, 'Other', 'Other')

end


-- RefMilitaryConnectedStudentIndicator - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMilitaryConnectedStudentIndicator')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMilitaryConnectedStudentIndicator', null, '0', 'NotMilitaryConnected')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMilitaryConnectedStudentIndicator', null, '1', 'ActiveDuty')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'NationalGuardOrReserve')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'Unknown')

end


-- RefDisciplinaryReason- Source = edfi
-- Includes Extended Codes
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisciplineReason')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'DrugRelated', 'DrugRelated') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'AlcoholRelated', 'AlcoholRelated') 	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'WeaponsPossession', 'WeaponsPossession') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'WithPhysicalInjury', 'WithPhysicalInjury')  
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'WithoutPhysiclInjury', 'WithoutPhysiclInjury') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, 'Other', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '01', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '02', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '03', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '04', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '09', 'DrugRelated')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '21', 'Other')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineReason', null, '46', 'Other')

end

-- RefDisciplineMethodofCWD - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisciplineMethodOfCwd')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'Expulsion with Services', 'OutOfSchool') -- Out of School suspensions/Expulsions
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'Expulsion', 'OutOfSchool') -- Out of School suspensions/Expulsions
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'Out-Of-School Suspension', 'OutOfSchool') -- Out of School suspensions/Expulsions
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'Out of School Suspension', 'OutOfSchool') -- Out of School suspensions/Expulsions
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'In School Suspension', 'InSchool') --In School Suspensions 	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodOfCwd', null, 'In-School Suspension', 'InSchool') --In School Suspensions 	
end

-- RefDisciplineMethodFirearms - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisciplineMethodFirearms')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodFirearms', null, 'EXPNOTMODNOALT', 'EXPNOTMODNOALT')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodFirearms', null, 'EXPMODALT', 'EXPMODALT')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodFirearms', null, 'EXPMODNOALT', 'EXPMODNOALT')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodFirearms', null, 'EXPALT', 'EXPALT')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodFirearms', null, 'REMOVEOTHER', 'REMOVEOTHER')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodFirearms', null, 'OTHERDISACTION', 'OTHERDISACTION')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplineMethodFirearms', null, 'NOACTION', 'NOACTION')
end

-- RefIDEADisciplineMethodFirearm - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIDEADisciplineMethodFirearm')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEADisciplineMethodFirearm', null, 'EXPMOD', 'EXPMOD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEADisciplineMethodFirearm', null, 'EXPNOTMOD', 'EXPNOTMOD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEADisciplineMethodFirearm', null, 'REMOVEOTHER', 'REMOVEOTHER')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEADisciplineMethodFirearm', null, 'OTHERDISACTION', 'OTHERDISACTION')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEADisciplineMethodFirearm', null, 'NOACTION', 'NOACTION')
end

-- RefDisciplinaryActionTaken - Source = edfi
-- Includes extended codes
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisciplinaryActionTaken')
begin
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03071') --Bus Suspension
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03072') --Change of placement (long-term)	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03073') --Change of placement (reassignment), pending an expulsion hearing
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03074') --Change of placement (reassignment), resulting from an expulsion hearing
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03075') --Change of placement (reassignment), temporary
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Community Service', '03076') --Community service
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03077') --Conference with and warning to student	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03078') --Conference with and warning to student and parent/guardian
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03079') --Confiscation of contraband
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03080') --Conflict resolution or anger management services mandated	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03081') --Corporal punishment
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03082') --Counseling mandated	
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03083') --Demerit
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03084') --Detention
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03085') --expulsion recommendation
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Expulsion with Services', '03086') --Expulsion with services
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Expulsion', '03087') --Expulsion without services
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03088') --Juvenile justice referral
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03089') --Law enforcement referral
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03090') --letter of apology
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03091') --Loss of privileges
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '13357') --Mechanical Restraint
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03105') --No action
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'No action for incident', '09998') --None
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Other', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Partial Day Out-Of-School Suspension', '09999') --Other
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Removal from Classroom', '09999') --Other
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03092') --Physical activity
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '13358') --Physical Restraint
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03158') --Removal by a hearing officer
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03093') --Reprimand
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03094') --Restitution
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03095') --Saturday school
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03096') --School probation
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '13359') --Seclusion
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03097') --Substance abuse counseling mandated
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03098') --Substance abuse treatment mandated
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03099') --Suspension after school
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'In School Suspension', '03100') --Suspension, in-school
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'In-School Suspension', '03100') --Suspension, in-school
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03154') --Suspension, out of school, greater than 10 consecutive school days
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03155') --Suspension, out of school, spearate days cumulating to more than 10 school days
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Out-Of-School Suspension', '03101') --Suspension, out of school with services
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'Out of School Suspension', '03101') --Suspension, out of school with services
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03102') --Supension, out of school, without services
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'InterimRemovalDrugs', '03157') --Unilateral removal - drug incident
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisciplinaryActionTaken', null, 'InterimRemovalWeapons', '03156') --Unilateral removal - weapon incident
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '09997') --Unknown
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03103') --Unsatisfactory behavior grade
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisciplinaryActionTaken', null, '', '03104') --Work detail
end

 --RefIDEAInterimRemoval - Source = edfi
 --Includes extended codes
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefIDEAInterimRemoval')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, Outputcode) values
	(2018, 'RefIDEAInterimRemoval', null, 'InterimRemovalDrugs', 'REMDW') --Removal for drugs, weapons, or serious bodily injury
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, Outputcode) values
	(2018, 'RefIDEAInterimRemoval', null, 'InterimRemovalWeapons', 'REMDW') --Removal for drugs, weapons, or serious bodily injury
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, Outputcode) values
	(2018, 'RefIDEAInterimRemoval', null, 'InterimRemovalSeriousBodilyInjury', 'REMDW') --Removal for drugs, weapons, or serious bodily injury
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefIDEAInterimRemoval', null, 'InterimRemovalHearingOfficer', 'REMHO') --Removed based on a Hearing Officer finding
end

 --RefIDEAInterimRemovalReason - Source = edfi
 --Includes extended codes
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'IDEAInterimRemovalReason')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'IDEAInterimRemovalReason', null, 'InterimRemovalDrugs', 'Drugs')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'IDEAInterimRemovalReason', null, 'InterimRemovalWeapons', 'Weapons') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'IDEAInterimRemovalReason', null, 'InterimRemovalSeriousBodilyInjury', 'SeriousBodilyInjury')
end


 --RefPersonStatusType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefPersonStatusType')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonStatusType', null, 'Homeless', 'HomelessUnaccompaniedYouth') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefPersonStatusType', null, 'Migrant', 'Migrant') 
end


 --RefSharedTimeIndicator - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSharedTimeIndicator')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSharedTimeIndicator', null, 'Yes', 'Yes') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSharedTimeIndicator', null, 'No', 'No') 
end

 --RefNSLPStatus - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefNSLPStatus')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPWOPRO', 'NSLPWOPRO') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPPRO1', 'NSLPPRO1')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPPRO2', 'NSLPPRO2') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPPRO3', 'NSLPPRO3') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPCEO', 'NSLPCEO') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefNSLPStatus', null, 'NSLPNO', 'NSLPNO') 
end

-- RefOrganizationIndicator - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationIndicator')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIndicator', null, 'AP Course Self Selection', 'AP Course Self Selection') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIndicator', null, 'SharedTime', 'SharedTime') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIndicator', null, 'AbilityGrouping', 'AbilityGrouping') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationIndicator', null, 'Virtual', 'Virtual') 
end

 --RefReconstitutedStatus - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefReconstitutedStatus')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefReconstitutedStatus', null, 'Yes', 'Yes') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefReconstitutedStatus', null, 'No', 'No') 
end

 --RefVirtualSchoolStatus - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefVirtualSchoolStatus')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefVirtualSchoolStatus', null, 'FaceVirtual', 'FaceVirtual') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefVirtualSchoolStatus', null, 'FullVirtual', 'FullVirtual')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefVirtualSchoolStatus', null, 'NotVirtual', 'NotVirtual') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefVirtualSchoolStatus', null, 'SupplementalVirtual', 'SupplementalVirtual') 
end

 --RefTitleIProgramStaffCategory - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefTitleIProgramStaffCategory')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleITeacher', 'TitleITeacher') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleIParaprofessional', 'TitleIParaprofessional') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleISupportStaff', 'TitleISupportStaff') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleIAdministrator', 'TitleIAdministrator') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIProgramStaffCategory', null, 'TitleIOtherParaprofessional', 'TitleIOtherParaprofessional') 
end

 --RefSpecialEducationAgeGroupTaught - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSpecialEducationAgeGroupTaught')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationAgeGroupTaught', null, '3TO5', '3TO5') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationAgeGroupTaught', null, '6TO21', '6TO21') 
end

 --RefParaprofessionalQualification - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefParaprofessionalQualification')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Qualified', 'Qualified')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Certification', 'Qualified')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Endorsement', 'NotQualified')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Licensure', 'NotQualified')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Other', 'NotQualified')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefParaprofessionalQualification', null, 'Registration', 'NotQualified')

end

 --RefSpecialEducationStaffCategory - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefSpecialEducationStaffCategory')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'PSYCH', 'PSYCH') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'SOCIALWORK', 'SOCIALWORK')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'OCCTHERAP', 'OCCTHERAP') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'AUDIO', 'AUDIO') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'PEANDREC', 'PEANDREC') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'PHYSTHERAP', 'PHYSTHERAP') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'SPEECHPATH', 'SPEECHPATH') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'INTERPRET', 'INTERPRET') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'COUNSELOR', 'COUNSELOR') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'ORIENTMOBIL', 'ORIENTMOBIL') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationStaffCategory', null, 'MEDNURSE', 'MEDNURSE') 
end


 --RefTitleIIndicator - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefTitleIIndicator')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Public Targeted Assistance Program', '01')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Public Schoolwide Program', '02') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Private school students participating', '03')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Local Neglected Program', '04') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Was not served', '05') 
end


--RefOrganizationType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefOrganizationType' and TableFilter='001156')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationType', '001156', 'LEA', 'LEA') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationType', '001156', 'K12School', 'K12School') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationType', '001156', 'SEA', 'SEA') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefOrganizationType', '001156', 'CharterSchoolManagementOrganization', 'CharterSchoolManagementOrganization') 
end


-- RefStatePovertyDesignation - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefStatePovertyDesignation')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefStatePovertyDesignation', null, 'HighQuartile', 'HighQuartile') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefStatePovertyDesignation', null, 'LowQuartile', 'LowQuartile') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefStatePovertyDesignation', null, 'Neither', 'Neither') 
end


-- RefHomelessNighttimeResidence - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefHomelessNighttimeResidence')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHomelessNighttimeResidence', null, 'Doubled-up', 'DoubledUp') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHomelessNighttimeResidence', null, 'Hotels/motels', 'HotelMotel') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHomelessNighttimeResidence', null, 'Shelters', 'Shelters') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefHomelessNighttimeResidence', null, 'Unsheltered', 'Unsheltered') 
end

-- RefReapAlternativeFundingStatus - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefReapAlternativeFundingStatus')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefReapAlternativeFundingStatus', null, 'Yes', 'Yes') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefReapAlternativeFundingStatus', null, 'No', 'No') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefReapAlternativeFundingStatus', null, 'NA', 'NA') 
end

-- RefCourseApplicableEducationLevel - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCourseApplicableEducationLevel')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Adult Education', 'AE')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Early Education', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Eighth grade', '08')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Eleventh grade', '11')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Fifth grade', '05')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'First grade', '01')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Fourth grade', '04')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Grade 13', '13')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Infant/toddler', 'IT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Kindergarten', 'KG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Ninth grade', '09')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Other', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Postsecondary', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Preschool/Prekindergarten', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Second grade', '02')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Seventh grade', '07')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Sixth grade', '06')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Tenth grade', '10')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Third grade', '03')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Twelfth grade', '12')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Ungraded', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'No grade level', 'OT')
end

-- RefCourseApplicableEducationLevel - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefCourseApplicableEducationLevel')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Adult Education', 'AE')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Early Education', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Eighth grade', '08')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Eleventh grade', '11')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Fifth grade', '05')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'First grade', '01')
	
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Fourth grade', '04')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Grade 13', '13')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Infant/toddler', 'IT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Kindergarten', 'KG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Ninth grade', '09')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Other', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Postsecondary', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Preschool/Prekindergarten', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Second grade', '02')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Seventh grade', '07')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Sixth grade', '06')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Tenth grade', '10')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Third grade', '03')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Twelfth grade', '12')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'Ungraded', 'OT')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefCourseApplicableEducationLevel', NULL, 'No grade level', 'OT')
end

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefNeglectedProgramType' AND InputCode = 'Adult Corrections')
	INSERT INTO ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) 
	VALUES
	(2018, 'RefNeglectedProgramType', NULL, 'Adult Corrections', 'AdultCorrection')

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefNeglectedProgramType' AND InputCode = 'Juvenile Corrections')
	INSERT INTO ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) 
	VALUES
	(2018, 'RefNeglectedProgramType', NULL, 'Juvenile Corrections', 'JuvenileCorrection')

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefNeglectedProgramType' AND InputCode = 'Juvenile Detention Facilities')
	INSERT INTO ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) 
	VALUES
	(2018, 'RefNeglectedProgramType', NULL, 'Juvenile Detention Facilities', 'JuvenileDetention')

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefNeglectedProgramType' AND InputCode = 'Neglected Programs')
	INSERT INTO ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) 
	VALUES
	(2018, 'RefNeglectedProgramType', NULL, 'Neglected Programs', 'NeglectedPrograms')

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE TableName = 'RefNeglectedProgramType' AND InputCode = 'Other Programs')
	INSERT INTO ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) 
	VALUES
	(2018, 'RefNeglectedProgramType', NULL, 'Other Programs', 'OtherPrograms')

--------------------------------------------------------------------------------------------------
-- RefProgressLevel
--------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [TableName] = 'RefProgressLevel' AND [InputCode] = 'Negative Grade')
	INSERT INTO ODS.SourceSystemReferenceData (SchoolYear, TableName, InputCode, OutputCode) 
	SELECT 2018, 'RefProgressLevel', 'Negative Grade', 'NEGGRADE'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [TableName] = 'RefProgressLevel' AND [InputCode] = 'No Change')
	INSERT INTO ODS.SourceSystemReferenceData (SchoolYear, TableName, InputCode, OutputCode) 
	SELECT 2018, 'RefProgressLevel', 'No Change', 'NOCHANGE'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [TableName] = 'RefProgressLevel' AND [InputCode] = 'Up More Than One Grade')
	INSERT INTO ODS.SourceSystemReferenceData (SchoolYear, TableName, InputCode, OutputCode) 
	SELECT 2018, 'RefProgressLevel', 'Up More Than One Grade', 'UPGTONE'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [TableName] = 'RefProgressLevel' AND [InputCode] = 'Up One Grade')
	INSERT INTO ODS.SourceSystemReferenceData (SchoolYear, TableName, InputCode, OutputCode) 
	SELECT 2018, 'RefProgressLevel', 'Up One Grade', 'UPONEGRADE'

-- RefProfessionalTechnicalCredentialType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefProfessionalTechnicalCredentialType')
begin 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Alternative credential', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Apprenticeship Certificate', 'ApprenticeshipCertificate') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Career and Technical Education certificate', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Certificate of attendance', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Certificate of completion', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Endorsed/advanced diploma', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'High school equivalency credential, other than GED', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Industry-recognized Certification', 'IndustryCertification') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'International Baccalaureate', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Modified diploma', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Occupational License', 'OccupationalLicense') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Other', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Post graduate certificate (grade 13)', 'OtherOccupational') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefProfessionalTechnicalCredentialType', null, 'Regents diploma', 'OtherOccupational') 
end


-- RefFederalProgramFundingAllocationType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefFederalProgramFundingAllocationType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFederalProgramFundingAllocationType', NULL, 'RETAINED', 'RETAINED')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFederalProgramFundingAllocationType', NULL, 'TRANSFER', 'TRANSFER')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFederalProgramFundingAllocationType', NULL, 'DISTNONLEA', 'DISTNONLEA')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFederalProgramFundingAllocationType', NULL, 'UNALLOC', 'UNALLOC')
end

-- RefMepProjectType - Source = edfi
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMepProjectType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepProjectType', NULL, 'SchoolDay', 'SchoolDay')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepProjectType', NULL, 'ExtendedDay', 'ExtendedDay')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepProjectType', NULL, 'SummerIntersession', 'SummerIntersession')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepProjectType', NULL, 'YearRound', 'YearRound')
end

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIIAccountability' AND InputCode ='No Progress')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIIAccountability', 'No Progress', 'NOPROGRESS'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIIAccountability' AND InputCode ='Proficient')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIIAccountability', 'Proficient', 'PROFICIENT'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIIAccountability' AND InputCode ='Progress')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIIAccountability', 'Progress', 'PROGRESS'


IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Content-Based ESL')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Content-Based ESL', 'ContentBasedESL'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Developmental Bilingual')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Developmental Bilingual', 'DevelopmentalBilingual'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Dual Language')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Dual Language', 'DualLanguage'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Heritage Language')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Heritage Language', 'HeritageLanguage'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Other')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Other', 'Other'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Pull-Out ESL')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Pull-Out ESL', 'PullOutESL'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='SDAIE')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'SDAIE', 'SDAIE'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Sheltered English Instruction')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Sheltered English Instruction', 'ShelteredEnglishInstruction'

IF NOT EXISTS(SELECT * FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Structured English Immersion')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Structured English Immersion', 'StructuredEnglishImmersion'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Transitional Bilingual')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Transitional Bilingual', 'TransitionalBilingual'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefTitleIIILanguageInstructionProgramType' AND InputCode ='Two-Way Immersion')
	INSERT INTO [ODS].[SourceSystemReferenceData]([SchoolYear], [TableName], [InputCode], [OutputCode])
	SELECT 2018, 'RefTitleIIILanguageInstructionProgramType', 'Two-Way Immersion', 'TwoWayImmersion'

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Afar') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Afar', 'aar')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Abkhazian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Abkhazian', 'abk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Achinese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Achinese', 'ace')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Acoli') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Acoli', 'ach')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Adangme') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Adangme', 'ada')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Adyghe; Adygei') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Adyghe; Adygei', 'ady')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Afro-Asiatic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Afro-Asiatic languages', 'afa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Afrihili') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Afrihili', 'afh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Afrikaans') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Afrikaans', 'afr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ainu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ainu', 'ain')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Akan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Akan', 'aka')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Akkadian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Akkadian', 'akk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Albanian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Albanian', 'alb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Aleut') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Aleut', 'ale')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Algonquian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Algonquian languages', 'alg')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Southern Altai') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Southern Altai', 'alt')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Amharic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Amharic', 'amh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='English, Old (ca.450-1100)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'English, Old (ca.450-1100)', 'ang')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Angika') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Angika', 'anp')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Apache languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Apache languages', 'apa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Arabic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Arabic', 'ara')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)', 'arc')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Aragonese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Aragonese', 'arg')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Armenian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Armenian', 'arm')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mapudungun; Mapuche') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mapudungun; Mapuche', 'arn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Arapaho') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Arapaho', 'arp')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Artificial languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Artificial languages', 'art')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Arawak') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Arawak', 'arw')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Assamese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Assamese', 'asm')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Asturian; Bable; Leonese; Asturleonese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Asturian; Bable; Leonese; Asturleonese', 'ast')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Athapascan languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Athapascan languages', 'ath')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Australian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Australian languages', 'aus')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Avaric') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Avaric', 'ava')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Avestan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Avestan', 'ave')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Awadhi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Awadhi', 'awa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Aymara') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Aymara', 'aym')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Azerbaijani') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Azerbaijani', 'aze')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Banda languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Banda languages', 'bad')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bamileke languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bamileke languages', 'bai')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bashkir') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bashkir', 'bak')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Baluchi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Baluchi', 'bal')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bambara') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bambara', 'bam')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Balinese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Balinese', 'ban')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Basque') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Basque', 'baq')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Basa') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Basa', 'bas')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Baltic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Baltic languages', 'bat')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Beja; Bedawiyet') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Beja; Bedawiyet', 'bej')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Belarusian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Belarusian', 'bel')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bemba') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bemba', 'bem')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bengali') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bengali', 'ben')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Berber languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Berber languages', 'ber')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bhojpuri') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bhojpuri', 'bho')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bihari languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bihari languages', 'bih')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bikol') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bikol', 'bik')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bini; Edo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bini; Edo', 'bin')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bislama') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bislama', 'bis')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Siksika') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Siksika', 'bla')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bantu languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bantu languages', 'bnt')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bosnian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bosnian', 'bos')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Braj') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Braj', 'bra')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Breton') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Breton', 'bre')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Batak languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Batak languages', 'btk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Buriat') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Buriat', 'bua')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Buginese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Buginese', 'bug')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bulgarian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bulgarian', 'bul')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Burmese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Burmese', 'bur')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Blin; Bilin') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Blin; Bilin', 'byn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Caddo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Caddo', 'cad')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Central American Indian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Central American Indian languages', 'cai')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Galibi Carib') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Galibi Carib', 'car')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Catalan; Valencian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Catalan; Valencian', 'cat')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Caucasian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Caucasian languages', 'cau')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Cebuano') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Cebuano', 'ceb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Celtic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Celtic languages', 'cel')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chamorro') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chamorro', 'cha')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chibcha') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chibcha', 'chb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chechen') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chechen', 'che')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chagatai') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chagatai', 'chg')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chinese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chinese', 'chi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chuukese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chuukese', 'chk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mari') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mari', 'chm')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chinook jargon') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chinook jargon', 'chn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Choctaw') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Choctaw', 'cho')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chipewyan; Dene Suline') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chipewyan; Dene Suline', 'chp')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Cherokee') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Cherokee', 'chr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic', 'chu')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chuvash') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chuvash', 'chv')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Cheyenne') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Cheyenne', 'chy')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chamic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chamic languages', 'cmc')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Coptic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Coptic', 'cop')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Cornish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Cornish', 'cor')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Corsican') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Corsican', 'cos')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Creoles and pidgins, English based') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Creoles and pidgins, English based', 'cpe')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Creoles and pidgins, French-based') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Creoles and pidgins, French-based', 'cpf')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Creoles and pidgins, Portuguese-based') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Creoles and pidgins, Portuguese-based', 'cpp')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Cree') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Cree', 'cre')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Crimean Tatar; Crimean Turkish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Crimean Tatar; Crimean Turkish', 'crh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Creoles and pidgins ') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Creoles and pidgins ', 'crp')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kashubian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kashubian', 'csb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Cushitic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Cushitic languages', 'cus')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Czech') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Czech', 'cze')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dakota') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dakota', 'dak')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Danish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Danish', 'dan')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dargwa') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dargwa', 'dar')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Land Dayak languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Land Dayak languages', 'day')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Delaware') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Delaware', 'del')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Slave (Athapascan)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Slave (Athapascan)', 'den')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dogrib') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dogrib', 'dgr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dinka') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dinka', 'din')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Divehi; Dhivehi; Maldivian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Divehi; Dhivehi; Maldivian', 'div')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dogri') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dogri', 'doi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dravidian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dravidian languages', 'dra')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lower Sorbian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lower Sorbian', 'dsb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Duala') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Duala', 'dua')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dutch, Middle (ca.1050-1350)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dutch, Middle (ca.1050-1350)', 'dum')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dutch; Flemish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dutch; Flemish', 'dut')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dyula') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dyula', 'dyu')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Dzongkha') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Dzongkha', 'dzo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Efik') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Efik', 'efi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Egyptian (Ancient)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Egyptian (Ancient)', 'egy')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ekajuk') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ekajuk', 'eka')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Elamite') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Elamite', 'elx')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='English') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'English', 'eng')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='English, Middle (1100-1500)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'English, Middle (1100-1500)', 'enm')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Esperanto') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Esperanto', 'epo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Estonian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Estonian', 'est')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ewe') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ewe', 'ewe')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ewondo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ewondo', 'ewo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Fang') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Fang', 'fan')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Faroese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Faroese', 'fao')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Fanti') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Fanti', 'fat')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Fijian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Fijian', 'fij')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Filipino; Pilipino') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Filipino; Pilipino', 'fil')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Finnish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Finnish', 'fin')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Finno-Ugrian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Finno-Ugrian languages', 'fiu')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Fon') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Fon', 'fon')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='French') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'French', 'fre')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='French, Middle (ca.1400-1600)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'French, Middle (ca.1400-1600)', 'frm')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='French, Old (842-ca.1400)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'French, Old (842-ca.1400)', 'fro')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Northern Frisian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Northern Frisian', 'frr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Eastern Frisian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Eastern Frisian', 'frs')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Western Frisian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Western Frisian', 'fry')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Fulah') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Fulah', 'ful')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Friulian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Friulian', 'fur')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ga') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ga', 'gaa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Gayo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Gayo', 'gay')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Gbaya') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Gbaya', 'gba')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Germanic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Germanic languages', 'gem')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Georgian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Georgian', 'geo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='German') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'German', 'ger')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Geez') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Geez', 'gez')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Gilbertese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Gilbertese', 'gil')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Gaelic; Scottish Gaelic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Gaelic; Scottish Gaelic', 'gla')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Irish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Irish', 'gle')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Galician') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Galician', 'glg')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Manx') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Manx', 'glv')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='German, Middle High (ca.1050-1500)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'German, Middle High (ca.1050-1500)', 'gmh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='German, Old High (ca.750-1050)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'German, Old High (ca.750-1050)', 'goh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Gondi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Gondi', 'gon')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Gorontalo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Gorontalo', 'gor')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Gothic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Gothic', 'got')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Grebo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Grebo', 'grb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Greek, Ancient (to 1453)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Greek, Ancient (to 1453)', 'grc')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Greek, Modern (1453-)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Greek, Modern (1453-)', 'gre')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Guarani') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Guarani', 'grn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Swiss German; Alemannic; Alsatian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Swiss German; Alemannic; Alsatian', 'gsw')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Gujarati') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Gujarati', 'guj')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Gwich''in') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Gwich''in', 'gwi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Haida') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Haida', 'hai')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Haitian; Haitian Creole') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Haitian; Haitian Creole', 'hat')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hausa') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hausa', 'hau')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hawaiian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hawaiian', 'haw')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hebrew') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hebrew', 'heb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Herero') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Herero', 'her')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hiligaynon') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hiligaynon', 'hil')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Himachali languages; Western Pahari languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Himachali languages; Western Pahari languages', 'him')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hindi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hindi', 'hin')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hittite') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hittite', 'hit')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hmong; Mong') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hmong; Mong', 'hmn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hiri Motu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hiri Motu', 'hmo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Croatian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Croatian', 'hrv')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Upper Sorbian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Upper Sorbian', 'hsb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hungarian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hungarian', 'hun')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Hupa') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Hupa', 'hup')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Iban') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Iban', 'iba')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Igbo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Igbo', 'ibo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Icelandic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Icelandic', 'ice')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ido') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ido', 'ido')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sichuan Yi; Nuosu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sichuan Yi; Nuosu', 'iii')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ijo languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ijo languages', 'ijo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Inuktitut') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Inuktitut', 'iku')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Interlingue; Occidental') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Interlingue; Occidental', 'ile')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Iloko') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Iloko', 'ilo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Interlingua (International Auxiliary Language Association)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Interlingua (International Auxiliary Language Association)', 'ina')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Indic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Indic languages', 'inc')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Indonesian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Indonesian', 'ind')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Indo-European languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Indo-European languages', 'ine')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ingush') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ingush', 'inh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Inupiaq') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Inupiaq', 'ipk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Iranian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Iranian languages', 'ira')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Iroquoian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Iroquoian languages', 'iro')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Italian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Italian', 'ita')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Javanese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Javanese', 'jav')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lojban') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lojban', 'jbo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Japanese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Japanese', 'jpn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Judeo-Persian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Judeo-Persian', 'jpr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Judeo-Arabic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Judeo-Arabic', 'jrb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kara-Kalpak') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kara-Kalpak', 'kaa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kabyle') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kabyle', 'kab')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kachin; Jingpho') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kachin; Jingpho', 'kac')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kalaallisut; Greenlandic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kalaallisut; Greenlandic', 'kal')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kamba') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kamba', 'kam')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kannada') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kannada', 'kan')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Karen languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Karen languages', 'kar')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kashmiri') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kashmiri', 'kas')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kanuri') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kanuri', 'kau')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kawi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kawi', 'kaw')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kazakh') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kazakh', 'kaz')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kabardian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kabardian', 'kbd')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Khasi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Khasi', 'kha')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Khoisan languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Khoisan languages', 'khi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Central Khmer') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Central Khmer', 'khm')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Khotanese; Sakan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Khotanese; Sakan', 'kho')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kikuyu; Gikuyu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kikuyu; Gikuyu', 'kik')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kinyarwanda') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kinyarwanda', 'kin')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kirghiz; Kyrgyz') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kirghiz; Kyrgyz', 'kir')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kimbundu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kimbundu', 'kmb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Konkani') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Konkani', 'kok')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Komi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Komi', 'kom')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kongo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kongo', 'kon')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Korean') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Korean', 'kor')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kosraean') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kosraean', 'kos')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kpelle') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kpelle', 'kpe')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Karachay-Balkar') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Karachay-Balkar', 'krc')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Karelian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Karelian', 'krl')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kru languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kru languages', 'kro')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kurukh') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kurukh', 'kru')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kuanyama; Kwanyama') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kuanyama; Kwanyama', 'kua')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kumyk') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kumyk', 'kum')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kurdish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kurdish', 'kur')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kutenai') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kutenai', 'kut')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ladino') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ladino', 'lad')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lahnda') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lahnda', 'lah')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lamba') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lamba', 'lam')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lao') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lao', 'lao')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Latin') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Latin', 'lat')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Latvian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Latvian', 'lav')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lezghian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lezghian', 'lez')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Limburgan; Limburger; Limburgish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Limburgan; Limburger; Limburgish', 'lim')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lingala') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lingala', 'lin')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lithuanian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lithuanian', 'lit')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mongo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mongo', 'lol')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lozi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lozi', 'loz')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Luxembourgish; Letzeburgesch') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Luxembourgish; Letzeburgesch', 'ltz')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Luba-Lulua') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Luba-Lulua', 'lua')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Luba-Katanga') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Luba-Katanga', 'lub')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ganda') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ganda', 'lug')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Luiseno') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Luiseno', 'lui')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lunda') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lunda', 'lun')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Luo (Kenya and Tanzania)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Luo (Kenya and Tanzania)', 'luo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lushai') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lushai', 'lus')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Macedonian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Macedonian', 'mac')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Madurese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Madurese', 'mad')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Magahi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Magahi', 'mag')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Marshallese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Marshallese', 'mah')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Maithili') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Maithili', 'mai')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Makasar') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Makasar', 'mak')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Malayalam') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Malayalam', 'mal')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mandingo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mandingo', 'man')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Maori') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Maori', 'mao')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Austronesian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Austronesian languages', 'map')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Marathi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Marathi', 'mar')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Masai') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Masai', 'mas')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Malay') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Malay', 'may')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Moksha') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Moksha', 'mdf')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mandar') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mandar', 'mdr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mende') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mende', 'men')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Irish, Middle (900-1200)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Irish, Middle (900-1200)', 'mga')
--IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mi''kmaq; Micmac') 
--	INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'M''ikmaq; Micmac', 'mic')

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode like '%Micmac%') 
	INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'M''ikmaq; Micmac', 'mic')

IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Minangkabau') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Minangkabau', 'min')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Uncoded languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Uncoded languages', 'mis')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mon-Khmer languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mon-Khmer languages', 'mkh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Malagasy') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Malagasy', 'mlg')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Maltese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Maltese', 'mlt')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Manchu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Manchu', 'mnc')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Manipuri') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Manipuri', 'mni')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Manobo languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Manobo languages', 'mno')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mohawk') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mohawk', 'moh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mongolian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mongolian', 'mon')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mossi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mossi', 'mos')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Multiple languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Multiple languages', 'mul')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Munda languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Munda languages', 'mun')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Creek') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Creek', 'mus')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mirandese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mirandese', 'mwl')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Marwari') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Marwari', 'mwr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Mayan languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Mayan languages', 'myn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Erzya') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Erzya', 'myv')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nahuatl languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nahuatl languages', 'nah')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='North American Indian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'North American Indian languages', 'nai')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Neapolitan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Neapolitan', 'nap')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nauru') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nauru', 'nau')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Navajo; Navaho') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Navajo; Navaho', 'nav')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ndebele, South; South Ndebele') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ndebele, South; South Ndebele', 'nbl')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ndebele, North; North Ndebele') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ndebele, North; North Ndebele', 'nde')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ndonga') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ndonga', 'ndo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Low German; Low Saxon; German, Low; Saxon, Low') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Low German; Low Saxon; German, Low; Saxon, Low', 'nds')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nepali') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nepali', 'nep')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nepal Bhasa; Newari') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nepal Bhasa; Newari', 'new')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nias') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nias', 'nia')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Niger-Kordofanian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Niger-Kordofanian languages', 'nic')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Niuean') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Niuean', 'niu')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Norwegian Nynorsk; Nynorsk, Norwegian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Norwegian Nynorsk; Nynorsk, Norwegian', 'nno')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Bokm?l, Norwegian; Norwegian Bokm?l') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Bokm?l, Norwegian; Norwegian Bokm?l', 'nob')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nogai') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nogai', 'nog')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Norse, Old') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Norse, Old', 'non')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Norwegian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Norwegian', 'nor')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='N''Ko') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'N''Ko', 'nqo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Pedi; Sepedi; Northern Sotho') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Pedi; Sepedi; Northern Sotho', 'nso')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nubian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nubian languages', 'nub')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Classical Newari; Old Newari; Classical Nepal Bhasa') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Classical Newari; Old Newari; Classical Nepal Bhasa', 'nwc')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Chichewa; Chewa; Nyanja') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Chichewa; Chewa; Nyanja', 'nya')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nyamwezi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nyamwezi', 'nym')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nyankole') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nyankole', 'nyn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nyoro') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nyoro', 'nyo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nzima') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nzima', 'nzi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Occitan (post 1500)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Occitan (post 1500)', 'oci')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ojibwa') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ojibwa', 'oji')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Oriya') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Oriya', 'ori')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Oromo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Oromo', 'orm')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Osage') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Osage', 'osa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ossetian; Ossetic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ossetian; Ossetic', 'oss')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Turkish, Ottoman (1500-1928)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Turkish, Ottoman (1500-1928)', 'ota')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Otomian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Otomian languages', 'oto')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Papuan languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Papuan languages', 'paa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Pangasinan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Pangasinan', 'pag')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Pahlavi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Pahlavi', 'pal')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Pampanga; Kapampangan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Pampanga; Kapampangan', 'pam')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Panjabi; Punjabi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Panjabi; Punjabi', 'pan')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Papiamento') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Papiamento', 'pap')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Palauan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Palauan', 'pau')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Persian, Old (ca.600-400 B.C.)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Persian, Old (ca.600-400 B.C.)', 'peo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Persian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Persian', 'per')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Philippine languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Philippine languages', 'phi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Phoenician') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Phoenician', 'phn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Pali') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Pali', 'pli')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Polish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Polish', 'pol')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Pohnpeian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Pohnpeian', 'pon')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Portuguese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Portuguese', 'por')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Prakrit languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Prakrit languages', 'pra')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Proven?al, Old (to 1500); Occitan, Old (to 1500)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Proven?al, Old (to 1500); Occitan, Old (to 1500)', 'pro')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Pushto; Pashto') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Pushto; Pashto', 'pus')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Quechua') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Quechua', 'que')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Rajasthani') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Rajasthani', 'raj')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Rapanui') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Rapanui', 'rap')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Rarotongan; Cook Islands Maori') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Rarotongan; Cook Islands Maori', 'rar')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Romance languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Romance languages', 'roa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Romansh') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Romansh', 'roh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Romany') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Romany', 'rom')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Romanian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Romanian', 'rum')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Rundi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Rundi', 'run')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Aromanian; Arumanian; Macedo-Romanian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Aromanian; Arumanian; Macedo-Romanian', 'rup')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Russian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Russian', 'rus')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sandawe') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sandawe', 'sad')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sango') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sango', 'sag')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Yakut') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Yakut', 'sah')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='South American Indian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'South American Indian languages', 'sai')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Salishan languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Salishan languages', 'sal')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Samaritan Aramaic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Samaritan Aramaic', 'sam')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sanskrit') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sanskrit', 'san')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sasak') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sasak', 'sas')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Santali') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Santali', 'sat')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sicilian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sicilian', 'scn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Scots') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Scots', 'sco')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Selkup') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Selkup', 'sel')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Semitic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Semitic languages', 'sem')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Irish, Old (to 900)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Irish, Old (to 900)', 'sga')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sign Languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sign Languages', 'sgn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Shan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Shan', 'shn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sidamo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sidamo', 'sid')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sinhala; Sinhalese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sinhala; Sinhalese', 'sin')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Siouan languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Siouan languages', 'sio')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sino-Tibetan languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sino-Tibetan languages', 'sit')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Slavic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Slavic languages', 'sla')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Slovak') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Slovak', 'slo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Slovenian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Slovenian', 'slv')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Southern Sami') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Southern Sami', 'sma')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Northern Sami') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Northern Sami', 'sme')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sami languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sami languages', 'smi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Lule Sami') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Lule Sami', 'smj')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Inari Sami') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Inari Sami', 'smn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Samoan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Samoan', 'smo')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Skolt Sami') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Skolt Sami', 'sms')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Shona') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Shona', 'sna')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sindhi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sindhi', 'snd')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Soninke') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Soninke', 'snk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sogdian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sogdian', 'sog')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Somali') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Somali', 'som')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Songhai languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Songhai languages', 'son')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sotho, Southern') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sotho, Southern', 'sot')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Spanish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Spanish', 'spa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sardinian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sardinian', 'srd')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sranan Tongo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sranan Tongo', 'srn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Serbian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Serbian', 'srp')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Serer') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Serer', 'srr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Nilo-Saharan languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Nilo-Saharan languages', 'ssa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Swati') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Swati', 'ssw')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sukuma') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sukuma', 'suk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sundanese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sundanese', 'sun')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Susu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Susu', 'sus')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sumerian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sumerian', 'sux')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Swahili') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Swahili', 'swa')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Swedish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Swedish', 'swe')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Classical Syriac') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Classical Syriac', 'syc')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Syriac') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Syriac', 'syr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tahitian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tahitian', 'tah')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tai languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tai languages', 'tai')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tamil') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tamil', 'tam')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tatar') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tatar', 'tat')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Telugu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Telugu', 'tel')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Timne') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Timne', 'tem')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tereno') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tereno', 'ter')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tetum') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tetum', 'tet')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tajik') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tajik', 'tgk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tagalog') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tagalog', 'tgl')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Thai') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Thai', 'tha')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tibetan') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tibetan', 'tib')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tigre') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tigre', 'tig')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tigrinya') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tigrinya', 'tir')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tiv') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tiv', 'tiv')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tokelau') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tokelau', 'tkl')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Klingon; tlhIngan-Hol') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Klingon; tlhIngan-Hol', 'tlh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tlingit') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tlingit', 'tli')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tamashek') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tamashek', 'tmh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tonga (Nyasa)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tonga (Nyasa)', 'tog')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tonga (Tonga Islands)') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tonga (Tonga Islands)', 'ton')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tok Pisin') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tok Pisin', 'tpi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tsimshian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tsimshian', 'tsi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tswana') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tswana', 'tsn')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tsonga') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tsonga', 'tso')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Turkmen') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Turkmen', 'tuk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tumbuka') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tumbuka', 'tum')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tupi languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tupi languages', 'tup')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Turkish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Turkish', 'tur')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Altaic languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Altaic languages', 'tut')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tuvalu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tuvalu', 'tvl')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Twi') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Twi', 'twi')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Tuvinian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Tuvinian', 'tyv')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Udmurt') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Udmurt', 'udm')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ugaritic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ugaritic', 'uga')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Uighur; Uyghur') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Uighur; Uyghur', 'uig')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Ukrainian') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Ukrainian', 'ukr')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Umbundu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Umbundu', 'umb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Undetermined') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Undetermined', 'und')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Urdu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Urdu', 'urd')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Uzbek') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Uzbek', 'uzb')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Vai') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Vai', 'vai')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Venda') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Venda', 'ven')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Vietnamese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Vietnamese', 'vie')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Volap?k') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Volap?k', 'vol')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Votic') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Votic', 'vot')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Wakashan languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Wakashan languages', 'wak')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Wolaitta; Wolaytta') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Wolaitta; Wolaytta', 'wal')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Waray') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Waray', 'war')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Washo') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Washo', 'was')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Welsh') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Welsh', 'wel')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Sorbian languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Sorbian languages', 'wen')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Walloon') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Walloon', 'wln')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Wolof') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Wolof', 'wol')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Kalmyk; Oirat') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Kalmyk; Oirat', 'xal')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Xhosa') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Xhosa', 'xho')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Yao') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Yao', 'yao')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Yapese') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Yapese', 'yap')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Yiddish') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Yiddish', 'yid')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Yoruba') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Yoruba', 'yor')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Yupik languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Yupik languages', 'ypk')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Zapotec') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Zapotec', 'zap')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Blissymbols; Blissymbolics; Bliss') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Blissymbols; Blissymbolics; Bliss', 'zbl')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Zenaga') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Zenaga', 'zen')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Standard Moroccan Tamazight') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Standard Moroccan Tamazight', 'zgh')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Zhuang; Chuang') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Zhuang; Chuang', 'zha')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Zande languages') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Zande languages', 'znd')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Zulu') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Zulu', 'zul')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Zuni') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Zuni', 'zun')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='No linguistic content; Not applicable') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'No linguistic content; Not applicable', 'zxx')
IF NOT EXISTS(SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE  [TableName] = 'RefISO6392Language' AND InputCode ='Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki') INSERT INTO ODS.SourceSystemReferenceData VALUES (2018, 'RefISO6392Language', null, 'Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki', 'zza')




		