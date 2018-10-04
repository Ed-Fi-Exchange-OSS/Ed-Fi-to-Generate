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
	(2018, 'RefTitleIschoolStatus', null, 'Not designated as a Title I Part A school', 'NOTTITLE1ELIG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I Part A Schoolwide Assistance Program School', 'SWELIGSWPROG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I Part A Targeted Assistance School', 'TGELGBTGPROG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I school wide eligible - Title I targeted program', 'SWELIGTGPROG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I school wide eligible school - no program', 'SWELIGNOPROG')

	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIschoolStatus', null, 'Title I targeted eligible school - no program', 'TGELGBNOPROG')

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
	(2018, 'RefGunFreeSchoolsActReportingStatus', null, 'Yes, with reporting of one or more students for an offense', 'YesReportingOffenses')

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
	(2018, 'RefRace', null, 'American Indian - Alaskan Native', 'AmericanIndianorAlaskaNative')

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
	(2018, 'RefExitOrWithdrawalType', null, 'Dropout', '09999')
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
	(2018, 'RefSpecialEducationExitReason', null, 'Dropout', 'DroppedOut')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Reached maximum age', 'ReachedMaximumAge')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Transferred', 'Transferred')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefSpecialEducationExitReason', null, 'Withdrawn', 'WithdrawalByParent')
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
	(2018, 'RefIdeaeducationalEnvironmentSchoolAge', null, 'Inside regular class no more than 79% of day and no less than 40% of the day', 'RC79TO40')
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
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefWeaponType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Handgun', 'Handgun')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Knife', 'Knife')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Other Firearm', 'OtherFirearm')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Other Object', 'OtherObject')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Other Sharp Objects', 'OtherSharpObject')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Substance Used as Weapon', 'Substance')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefWeaponType', null, 'Unknown', 'Unknown')
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
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefK12staffClassification ')
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
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefDisabilityType')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'Serious Emotional Disability', 'EMN')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'DB', 'DB')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'HI', 'HI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'MD', 'MD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'OI', 'OI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'OHI', 'OHI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'SLD', 'SLD')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'SLI', 'SLI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'VI', 'VI')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'AUT', 'AUT')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'TBI', 'TBI')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, '', 'DD') -- No default Developmental Delay code inn Ed-Fi
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefDisabilityType', null, 'ID', 'ID')

	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'ITD', '') --edfi "Infant/Toddler with a Disability"
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Other', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'PSD', '') -- edfi "Preschooler with a Disability"
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Motor impairment', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Medical condition', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Mental impairment', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Physical Disability', '')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefDisabilityType', null, 'Sensory impairment', '')
end

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
	(2018, 'RefMepServiceType', null, 'CounselingServices', 'CounselingServices')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'HighSchoolAccrual', 'HighSchoolAccrual')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'InstructionalServices', 'InstructionalServices')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'MathematicsInstruction', 'MathematicsInstruction')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'ReadingInstruction', 'ReadingInstruction')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'ReferralServices', 'ReferralServices')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefMepServiceType', null, 'SupportServices', 'SupportServices')

end

-- RefContinuationOfServices - Source = edfi
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
if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'AssessmentPerformanceLevel_Identifier')
begin
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'AssessmentPerformanceLevel_Identifier', null, 'Unsatisfactory', 'L1')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'AssessmentPerformanceLevel_Identifier', null, 'Proficient', 'L2')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'AssessmentPerformanceLevel_Identifier', null, 'Advanced', 'L3')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'AssessmentPerformanceLevel_Identifier', null, '', 'L4')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'AssessmentPerformanceLevel_Identifier', null, '', 'L5')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'AssessmentPerformanceLevel_Identifier', null, '', 'L6')

end

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
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'ALTASSGRADELVL')
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, '', 'ALTASSMODACH')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State alternative assessment/grade-level standards', 'ALTASSALTACH')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefAssessmentTypeChildrenWithDisabilities', null, 'State alternative assessment/modified standards', 'ALTASSALTACH')
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
	--insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	--(2018, 'RefAcademicSubject', null, '', '00256') --English as a second language (ESL)
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
	(2018, 'RefFoodServiceEligibility', null, 'FullPrice', 'FullPrice')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'Free', 'Free')
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefFoodServiceEligibility', null, 'ReducedPrice', 'ReducedPrice')
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
	(2018, 'RefLeaType', null, 'Other', 'Other')

end


-- RefMilitaryConnectedStudentIndicator - Source = edfi
--if not exists (select 1 from ODS.SourceSystemReferenceData where TableName = 'RefMilitaryConnectedStudentIndicator')
--begin
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'NotMilitaryConnected')
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'ActiveDuty')
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'NationalGuardOrReserve')
--	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
--	(2018, 'RefMilitaryConnectedStudentIndicator', null, '', 'Unknown')

--end


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
	(2018, 'RefTitleIIndicator', null, 'Local Neglected Program', '04') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Public Schoolwide Program', '02') 
	insert into ODS.SourceSystemReferenceData (SchoolYear, TableName, TableFilter, InputCode, OutputCode) values
	(2018, 'RefTitleIIndicator', null, 'Public Targeted Assistance Program', '01') 
end
