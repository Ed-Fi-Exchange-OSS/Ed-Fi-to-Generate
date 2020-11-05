-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

		SELECT DISTINCT
			  NULL OrganizationId
			, 'Nebraska' StateName
			, sat.CodeValue StateCode
			, edorg.NameOfInstitution SeaName
			, edorg.ShortNameOfInstitution SeaShortName
			, StateOrganizationId SeaStateIdentifier
			, edorg.WebSite Sea_WebSiteAddress
			, 'John' SeaContact_FirstName
			, 'Doe' SeaContact_LastOrSurname
			, 'Mr.' SeaContact_PersonalTitleOrPrefix
			, 'John.Doe@txdoe.edu' SeaContact_ElectronicMailAddress
			, '5554127389' SeaContact_PhoneNumber
			,  NEWID() SeaContact_Identifier
			, NULL PersonId
			, NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].StateEducationAgency sea
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorg
			ON sea.StateEducationAgencyId = edorg.EducationOrganizationID
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationAddress edorgadd
			ON edorg.EducationOrganizationId = edorgadd.EducationOrganizationid
		JOIN [EdFi_Ods_Glendale_v21].[edfi].AddressType aty
			ON edorgadd.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].StateAbbreviationType sat
			ON edorgadd.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
		WHERE aty.CodeValue = 'Physical'





		SELECT DISTINCT
			 edorglea.StateOrganizationId LEA_Identifier_State
			,leancesid.IdentificationCode AS LEA_Identifier_NCES
			,NULL LEA_SupervisoryUnionIdentificationNumber
			,edorglea.NameOfInstitution LEA_Name
			,edorglea.WebSite LEA_WebSiteAddress
			,ostlea.CodeValue LEA_OperationalStatus
			,leacst.CodeValue LEA_CharterSchoolIndicator
			,leatype.CodeValue LEA_Type
			,edorgschool.StateOrganizationId School_Identifier_State
			,schncesid.IdentificationCode AS School_Identifier_NCES
			,edorgschool.NameOfInstitution School_Name
			,edorgschool.WebSite School_WebSiteAddress
			,ostschool.CodeValue School_OperationalStatus
			,st.CodeValue School_Type
			,NULL School_MagnetOrSpecialProgramEmphasisSchool
			,NULL School_SharedTimeIndicator
			,NULL School_VirtualSchoolStatus
			,NULL School_NationalSchoolLunchProgramStatus
			,NULL School_ReconstitutedStatus
			,NULL School_CharterSchoolApprovalAgencyType
			,schcst.CodeValue School_CharterSchoolIndicator
			,NULL LEAOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SEAOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SpecialEducationProgramOrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL TitleIProgramOrganizationId
			,NULL MigrantProgramOrganizationId
			,NULL FosterProgramOrganizationId
			,0 NewLEA -- Leave this value 0, the Code below will populate as necessary
			,0 NewSchool -- Leave this value 0, the Code below will populate as necessary
			,0 NewSpecialEducationProgram -- Leave this value 0, the Code below will populate as necessary
			,0 NewTitleIProgram
			,0 NewMigrantProgram
			,0 NewFosterProgram
			,0 LEA_Identifier_State_ChangedIdentifier -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_Identifier_State_Identifier_Old -- Only populate if an LEA State Identifier has changed, otherwise NULL
			,0 School_Identifier_State_ChangedIdentifier -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_Identifier_State_Identifier_Old -- Only populate if a School State Identifier has changed, otherwise NULL
			,NULL SEAToLEA_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEAToSchool_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolToSpecialEducationProgram_OrganizationRelationshipId -- Leave this value NULL, the Code below will populate as necessary
			,NULL SchoolToTitleIProgram_OrganizationRelationshipId
			,NULL SchoolToMigrantProgram_OrganizationRelationshipId
			,NULL SchoolToFosterProgram_OrganizationRelationshipId
			,NULL LEA_OrganizationWebsiteId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationWebsiteId -- Leave this value NULL, the Code below will populate as necessary
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].School sch
		JOIN [EdFi_Ods_Glendale_v21].[edfi].LocalEducationAgency lea ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].SchoolType st ON sch.SchoolTypeId = st.SchoolTypeId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].OperationalStatusType ostlea ON edorglea.OperationalStatusTypeId = ostlea.OperationalStatusTypeId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].OperationalStatusType ostschool ON edorgschool.OperationalStatusTypeId = ostschool.OperationalStatusTypeId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].CharterStatusType leacst ON lea.CharterStatusTypeId = leacst.CharterStatusTypeId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].CharterStatusType schcst ON sch.CharterStatusTypeId = schcst.CharterStatusTypeId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[extension].CEDSLocalEducationAgency CEDSLea ON lea.LocalEducationAgencyId = CEDSLea.LocalEducationAgencyId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor leatype ON CEDSLea.LocalEducationAgencyTypeDescriptorId = leatype.DescriptorId
		-- LEA NCES IDs
		LEFT JOIN (
			SELECT 
				  edorgidcodelea.EducationOrganizationId
				, edorgidcodelea.IdentificationCode
			FROM [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationIdentificationCode edorgidcodelea 
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationIdentificationSystemDescriptor edorgidsdlea ON edorgidcodelea.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdlea.EducationOrganizationIdentificationSystemDescriptorId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationIdentificationSystemType edorgidstlea ON edorgidsdlea.EducationOrganizationIdentificationSystemTypeId = edorgidstlea.EducationOrganizationIdentificationSystemTypeId 
				AND edorgidstlea.CodeValue = 'NCES'
		) leancesid ON edorglea.EducationOrganizationId = leancesid.EducationOrganizationId
		-- School NCES IDs
		LEFT JOIN (
			SELECT 
				  edorgidcodesch.EducationOrganizationId
				, edorgidcodesch.IdentificationCode
			FROM [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationIdentificationCode edorgidcodesch 
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationIdentificationSystemDescriptor edorgidsdsch ON edorgidcodesch.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdsch.EducationOrganizationIdentificationSystemDescriptorId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationIdentificationSystemType edorgidstsch ON edorgidsdsch.EducationOrganizationIdentificationSystemTypeId = edorgidstsch.EducationOrganizationIdentificationSystemTypeId
				AND edorgidstsch.CodeValue = 'NCES'
		) schncesid ON edorgschool.EducationOrganizationId = schncesid.EducationOrganizationId



		SELECT DISTINCT
			 edorgsea.StateOrganizationId OrganizationIdentifier
			,aty.CodeValue AddressTypeForOrganization
			,edorgaddress.StreetNumberName AddressStreetNumberAndName
			,edorgaddress.ApartmentRoomSuiteNumber AddressApartmentRoomOrSuite
			,edorgaddress.City AddressCity
			,edorgaddress.PostalCode AddressPostalCode
			,NULL OrganizationId
			,NULL LocationId
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].StateEducationAgency sea
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorgsea ON sea.StateEducationAgencyId = edorgsea.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationAddress edorgaddress ON edorgsea.EducationOrganizationId = edorgaddress.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].AddressType aty ON edorgaddress.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].StateAbbreviationType sat ON edorgaddress.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
		WHERE edorgaddress.StreetNumberName IS NOT NULL
		AND edorgaddress.StreetNumberName <> ''
		AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')



		SELECT DISTINCT
				edorglea.StateOrganizationId OrganizationIdentifier
			,aty.CodeValue AddressTypeForOrganization
			,edorgaddress.StreetNumberName AddressStreetNumberAndName
			,edorgaddress.ApartmentRoomSuiteNumber AddressApartmentRoomOrSuite
			,edorgaddress.City AddressCity
			,edorgaddress.PostalCode AddressPostalCode
			,NULL OrganizationId
			,NULL LocationId
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationAddress edorgaddress ON edorglea.EducationOrganizationId = edorgaddress.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].AddressType aty ON edorgaddress.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].StateAbbreviationType sat ON edorgaddress.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
		WHERE edorgaddress.StreetNumberName IS NOT NULL
		AND edorgaddress.StreetNumberName <> ''
		AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current address information - if it is different from previous years address information, the ETL code below will end date the
		--address for this address type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they will be end
		--dated on June 30, xxxx and the new record will begin July 1, xxxx.




		SELECT DISTINCT
				edorgschool.StateOrganizationId OrganizationIdentifier
			,aty.CodeValue AddressTypeForOrganization
			,edorgaddress.StreetNumberName AddressStreetNumberAndName
			,edorgaddress.ApartmentRoomSuiteNumber AddressApartmentRoomOrSuite
			,edorgaddress.City AddressCity
			,edorgaddress.PostalCode AddressPostalCode
			,NULL OrganizationId
			,NULL LocationId
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].School sch
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationAddress edorgaddress ON edorgschool.EducationOrganizationId = edorgaddress.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].AddressType aty ON edorgaddress.AddressTypeId = aty.AddressTypeId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].StateAbbreviationType sat ON edorgaddress.StateAbbreviationTypeId = sat.StateAbbreviationTypeId
		WHERE edorgaddress.StreetNumberName IS NOT NULL
		AND edorgaddress.StreetNumberName <> ''
		AND aty.CodeValue NOT IN ('Billing', 'Other', 'Temporary')
		--Ensure the OrganizationIdentifier is the same as the Staging.Organization table
		--This is current address information - if it is different from previous years address information, the ETL code below will end date the
		--address for this address type and organization and start a new record.  The start/end dates will fall on the fiscal year.  So they will be end
		--dated on June 30, xxxx and the new record will begin July 1, xxxx.




		SELECT DISTINCT
				edorgsea.StateOrganizationId OrganizationIdentifier
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].StateEducationAgency sea
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorgsea ON sea.StateEducationAgencyId = edorgsea.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorgsea.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].InstitutionTelephoneNumberType itnt ON edorgphone.InstitutionTelephoneNumberTypeId = itnt.InstitutionTelephoneNumberTypeId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeId IS NOT NULL


		SELECT DISTINCT
				edorglea.StateOrganizationId OrganizationIdentifier
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorglea.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].InstitutionTelephoneNumberType itnt ON edorgphone.InstitutionTelephoneNumberTypeId = itnt.InstitutionTelephoneNumberTypeId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeId IS NOT NULL



		SELECT DISTINCT
				edorgschool.StateOrganizationId OrganizationIdentifier
			,itnt.CodeValue InstitutionTelephoneNumberType
			,edorgphone.TelephoneNumber TelephoneNumber
			,NULL OrganizationId -- Leave this value NULL, the Code below will populate as necessary
			,NULL LEA_OrganizationTelephoneId -- Leave this value NULL, the Code below will populate as necessary
			,NULL School_OrganizationTelephoneId
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].School sch
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganizationInstitutionTelephone edorgphone ON edorgschool.EducationOrganizationId = edorgphone.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].InstitutionTelephoneNumberType itnt ON edorgphone.InstitutionTelephoneNumberTypeId = itnt.InstitutionTelephoneNumberTypeId
		WHERE edorgphone.TelephoneNumber IS NOT NULL
		AND edorgphone.TelephoneNumber <> ''
		AND edorgphone.InstitutionTelephoneNumberTypeId IS NOT NULL


		SELECT DISTINCT
				edorgschool.StateOrganizationId OrganizationIdentifier
			,glt.CodeValue GradeOffered
			,NULL OrganizationId -- Leave this value NULL, the code below will populatee as necessary
			,NULL K12SchoolGradeOfferedId -- Leave this value NULL, the code below will populate as necessary
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].School sch
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].SchoolGradeLevel sgl ON sch.SchoolId = sgl.SchoolId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].GradeLevelDescriptor gld ON sgl.GradeLevelDescriptorId = gld.GradeLevelDescriptorId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].GradeLevelType glt ON gld.GradeLevelTypeId = glt.GradeLevelTypeId


		SELECT DISTINCT
			edorglea.StateOrganizationId OrganizationIdentifier
			,NULL FederalProgramCode
			,NULL FederalProgramsFundingAllocation
			,NULL ParentalInvolvementReservationFunds
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId





 SELECT DISTINCT
              REPLACE(StudentUniqueId, ' ', '')
			, FirstName
			, LastSurname
			, MiddleName
			, Birthdate
			, 'K12 Student'
			, NULL RunDateTime
        FROM
			[EdFi_Ods_Glendale_v21].[edfi].[Student] 
		WHERE StudentUniqueId IS NOT NULL


		
        SELECT DISTINCT
              Identifier = REPLACE(StaffUniqueId, ' ', '')
			, FirstName
			, LastSurname
			, MiddleName
			, Birthdate
			, 'K12 Personnel'
			, NULL RunDateTime
        FROM
			[EdFi_Ods_Glendale_v21].[edfi].Staff
		WHERE StaffUniqueId IS NOT NULL




		SELECT DISTINCT
			 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
			,edorg.StateOrganizationId School_Identifier_State	
			,ssa.EntryDate EnrollmentEntryDate
			,ssa.ExitWithdrawDate EnrollmentExitDate
			,etd.CodeValue ExitWithdrawType
			,d.CodeValue GradeLevel
			,ssa.ClassOfSchoolYear
			,ssa.GraduationSchoolYear
			,dt.CodeValue [HighSchoolDiplomaType]
			,NULL PersonID
			,NULL OrganizationID_School
			,NULL OrganizationPersonRoleId_School
			,NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].student s
		JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Ods_Glendale_v21].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorg ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor etd ON ssa.ExitWithdrawTypeDescriptorId = etd.DescriptorId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor d ON ssa.EntryGradeLevelDescriptorId = d.DescriptorId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentAcademicRecordDiploma sard ON s.StudentUSI = sard.StudentUSI
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].DiplomaType dt ON sard.DiplomaTypeID = dt.DiplomaTypeId





		SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,edorg.StateOrganizationId School_Identifier_State	
				,spa.BeginDate ProgramParticipationBeginDate
				,spa.EndDate ProgramParticipationEndDate
				,d.CodeValue SpecialEducationExitReason
				,NULL IDEAEducationalEnvironmentForEarlyChildhood
				,NULL IDEAEducationalEnvironmentForSchoolAge
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL OrganizationID_Program
				,NULL OrganizationPersonRoleId_Program
				,NULL PersonProgramParticipationID
				,NULL RunDateTime
			FROM [EdFi_Ods_Glendale_v21].[edfi].student s
			JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentProgramAssociation spa ON s.StudentUSI = spa.StudentUSI
			JOIN [EdFi_Ods_Glendale_v21].[edfi].ProgramType pt ON spa.ProgramTypeId = pt.ProgramTypeId
			LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor d ON spa.ReasonExitedDescriptorId = d.DescriptorId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentSpecialEducationProgramAssociation sepa ON s.StudentUSI = sepa.StudentUSI and spa.BeginDate = sepa.BeginDate
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorg ON sepa.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].School sch ON edorg.EducationOrganizationId = sch.SchoolId
			WHERE pt.CodeValue = 'Special Education'


			select * from [EdFi_Ods_Glendale_v21].[edfi].student s 
			JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
			JOIN [EdFi_Ods_Glendale_v21].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].LocalEducationAgency lea ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
			JOIN [EdFi_Ods_Glendale_v21].[extension].CEDSStudent ceds ON s.StudentUSI = ceds.StudentUSI
			JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor d ON ceds.NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId = d.DescriptorId


			SELECT DISTINCT
						 s.StudentUSI RecordId
						,edorgschool.StateOrganizationId School_Identifier_State 
						,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
						,s.LastSurName LastName
						,s.FirstName FirstName 
						,s.BirthDate Birthdate
						,NULL PrimaryDisability
						,s.HispanicLatinoEthnicity RaceEthnicityQuestion_Hispanic
						,st.CodeValue Sex
						,CASE 
							WHEN spa.ProgramName IS NOT NULL THEN 1
							ELSE 0
						 END  EnglishLearnerStatus
						,0 IDEAStatus
						,ld.CodeValue ISO_639_2_NativeLanguage
						,fse.CodeValue EligibilityStatusForSchoolFoodServicePrograms
						,NULL NationalSchoolLunchProgramDirectCertificationIndicator
						,NULL PersonID
						,NULL PersonDetailID
						,NULL PersonDisabilityId
						,NULL PersonLanguageId
						,NULL PersonStatusId_IDEA
						,NULL PersonStatusId_LEP
						,NULL OrganizationID_School
						,NULL OrganizationPersonRoleID_School
						,NULL OrganizationID_SpecialEducationProgram
						,NULL RunDateTime
			FROM [EdFi_Ods_Glendale_v21].[edfi].student s
			JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
			JOIN [EdFi_Ods_Glendale_v21].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].LocalEducationAgency lea ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].SexType st ON s.SexTypeId = st.SexTypeId
			LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentLanguageUse slu ON s.StudentUSI = slu.StudentUSI
			LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor ld ON slu.LanguageDescriptorId = ld.DescriptorId
			LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].LanguageUseType lut ON slu.LanguageUseTypeId = lut.LanguageUseTypeId
				AND lut.CodeValue IN ('Native Language', 'Home Language')
			LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor fse ON s.SchoolFoodServicesEligibilityDescriptorId = fse.DescriptorId
			LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentProgramAssociation spa ON s.StudentUSI = spa.StudentUSI
				AND spa.ProgramName = 'English as a Second Language (ESL)'



				SELECT DISTINCT
				 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,rt.CodeValue
				,NULL PersonDemographicRaceId
				,NULL RunDateTime
			FROM [EdFi_Ods_Glendale_v21].[edfi].Student s
			JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentRace sr ON s.StudentUSI = sr.StudentUSI
			JOIN [EdFi_Ods_Glendale_v21].[edfi].RaceType rt ON sr.RaceTypeId = rt.RaceTypeId
			order by REPLACE(s.StudentUniqueId, ' ', '')



			SELECT DISTINCT
				 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,d.CodeValue
				,NULL RunDateTime
			FROM [EdFi_Ods_Glendale_v21].[edfi].Student s
			JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentDisability sd ON s.StudentUSI = sd.StudentUSI
			JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor d 
				ON sd.DisabilityDescriptorId = d.DescriptorId





				SELECT DISTINCT
				 pa.StudentUSI RecordId
				,NULL SchoolYear
				,edorg.StateOrganizationId School_Identifier_State
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,1 MigrantStatus --defaulted based on join to migrant
				,NULL MigrantEducationProgramEnrollmentType --this element is not available in Ed-Fi part of MetaEd Extension
				,NULL MigrantEducationProgramServicesType -- This element is not avaialble in Ed-Fi part of MetaEd Extension
				,CASE ISNULL(dc.CodeValue, 'xx')
					WHEN 'xx' THEN '0'
					ELSE 1 END MigrantEducationProgramContinuationOfServicesStatus -- This should be a bit value -- if Continuation of Services is true, then 1, else 0
				,dc.CodeValue ContinuationOfServicesReason
				,NULL MigrantStudentQualifyingArrivalDate --this element is not available in Ed-Fi part of MetaEd Extension
				,pa.LastQualifyingMove LastQualifyingMoveDate 
				,pa.PriorityForServices MigrantPrioritizedForServices --this is a bit value 1 = true, 0 = false
				,pa.BeginDate ProgramParticipationStartDate
				,NULL ProgramParticipationExitDate
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL OrganizationPersonRoleID_MigrantProgram
				,NULL OrganizationID_MigrantProgram
				,NULL PersonProgramParticipationId
				,NULL ProgramParticipationMigrantId
				,NULL RunDateTime
			FROM [EdFi_Ods_Glendale_v21].[edfi].Student s
			JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentMigrantEducationProgramAssociation pa ON s.StudentUSI = pa.StudentUSI
			LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor dc ON pa.ContinuationOfServicesReasonDescriptorId = dc.DescriptorId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].ProgramType pt ON pa.ProgramTypeId = pt.ProgramTypeId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorg ON pa.EducationOrganizationId = edorg.EducationOrganizationId




			SELECT DISTINCT
						 pa.StudentUSI RecordId
						,edorg.StateOrganizationId School_Identifier_State 
						,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
						,par.CodeValue Title1Indicator
						,NULL PersonID
						,NULL OrganizationID_School
						,NULL OrganizationPersonRoleID_TitleIProgram
						,NULL OrganizationID_TitleIProgram
						,NULL PersonProgramParticipationId
						,NULL RefTitleIIndicatorId
						,NULL RunDateTime
			--This is not the right "From" selection, just leaving it here so to load the Stored Procedure, need to go back and fill that in correctly to get
			--the title I information
			FROM [EdFi_Ods_Glendale_v21].[edfi].Student s
			JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentTitleIPartAProgramAssociation pa ON s.StudentUSI = pa.StudentUSI
			JOIN [EdFi_Ods_Glendale_v21].[edfi].ProgramType pt ON pa.ProgramTypeId = pt.ProgramTypeId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].TitleIPartAParticipantType par ON pa.TitleIPartAParticipantTypeId = par.TitleIPartAParticipantTypeId
			JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization edorg ON pa.EducationOrganizationId = edorg.EducationOrganizationId





			SELECT 
			  s.StaffUniqueId
			, eo.StateOrganizationId
			, ea.FullTimeEquivalency
			, NULL
			, scd.CodeValue
			, NULL
			, ct.CodeValue
			, sc.CredentialIssuanceDate
			, sc.CredentialExpirationDate
			, para.CodeValue 
			, NULL
			, s.HighlyQualifiedTeacher [HighlyQualifiedTeacherIndicator]
			, aa.BeginDate
			, aa.EndDate
			, NULL RunDateTime
		FROM [EdFi_Ods_Glendale_v21].[edfi].Staff s
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].StaffCredential sc
			ON s.StaffUSI = sc.StaffUSI
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].CredentialType ct
			ON sc.CredentialTypeId = ct.CredentialTypeId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].StaffEducationOrganizationAssignmentAssociation aa
			ON s.StaffUSI = aa.StaffUSI
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].EducationOrganization eo
			ON aa.EducationOrganizationId = eo.EducationOrganizationId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor scd
			ON aa.StaffClassificationDescriptorId = scd.DescriptorId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].StaffEducationOrganizationEmploymentAssociation ea
			ON s.StaffUSI = ea.StaffUSI
			AND aa.EducationOrganizationId = ea.EducationOrganizationId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].StaffSchoolAssociation ssa
			ON s.StaffUSI = ssa.StaffUSI
			AND aa.EducationOrganizationId = ssa.SchoolId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor para ON sc.TeachingCredentialDescriptorId = para.DescriptorId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor pad
			ON ssa.ProgramAssignmentDescriptorId = pad.DescriptorId
		WHERE pad.ShortDescription = 'Special Education'





		SELECT DISTINCT
				    a.AssessmentTitle [AssessmentTitle] -- break down the assessment by subject area so if it's end of instruction, this should be End of Instruction English Language Arts not just End of Instruction.
										--is this the title that has to match toggle exactly so that it can find it?
				   ,a.AssessmentTitle [AssessmentShortName]
				   ,asubject.CodeValue [AssessmentAcademicSubject]
				   ,atype.CodeValue [AssessmentPurpose]
				   ,atype.CodeValue [AssessmentType]
				   ,atype.CodeValue [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,CASE ISNULL(a.AssessmentFamilyTitle, a.AssessmentTitle)
						WHEN a.AssessmentTitle THEN a.AssessmentTitle
						ELSE a.AssessmentFamilyTitle END [AssessmentFamilyTitle]
				   ,a.AssessmentFamilyTitle [AssessmentFamilyShortName]
				   ,NULL [AssessmentAdministrationStartDate]
				   ,NULL [AssessmentAdministrationFinishDate]
				   ,aperformance.CodeValue [AssessmentPerformanceLevelIdentifier] -- example L1, L2, L3, L4
				   ,aperformance.Description [AssessmentPerformanceLevelLabel] -- example Unsatisfactory, Proficient, Advanced, etc. which align with the AssessmentPerformanceLevelIdentifier
				   ,NULL [AssessmentId]
				   ,NULL [AssessmentAdministrationId]
				   ,NULL [AssessmentSubtestId]
				   ,NULL [AssessmentFormId]
				   ,NULL [AssessmentPerformanceLevelId]
				   ,NULL [RunDateTime]
		FROM [EdFi_Ods_Glendale_v21].[edfi].[Assessment] a
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[Descriptor] asubject 
			ON a.AcademicSubjectDescriptorId = asubject.DescriptorId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[Descriptor] atype 
			ON a.AssessmentCategoryDescriptorId = atype.DescriptorId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[AssessmentPerformanceLevel] apl
			ON a.AssessmentTitle = apl.AssessmentTitle
			AND a.AcademicSubjectDescriptorId = apl.AcademicSubjectDescriptorId
			AND a.AssessedGradeLevelDescriptorId = apl.AssessedGradeLevelDescriptorId
			AND a.Version = apl.Version
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[Descriptor] aperformance
			ON apl.PerformanceLevelDescriptorId = aperformance.DescriptorId
		WHERE atype.CodeValue NOT IN ('Benchmark test', 'Advanced Placement', 'College Entrance Exam')




		SELECT DISTINCT
				    s.StudentUniqueId [Student_Identifier_State]
				   ,edorg.StateOrganizationId [School_Identifier_State]
				   ,a.AssessmentTitle [AssessmentTitle] -- should match exactly with the assessment title above
				   ,asubject.CodeValue [AssessmentAcademicSubject]
				   ,atype.CodeValue [AssessmentPurpose]
				   ,atype.CodeValue [AssessmentType]
				   ,atype.CodeValue [AssessmentTypeAdministeredToChildrenWithDisabilities]
				   ,sa.AdministrationDate [AssessmentAdministrationStartDate]
				   ,sa.AdministrationDate [AssessmentAdministrationFinishDate]
				   ,CASE ISNULL(sa.ReasonNotTestedTypeId, '99')
						WHEN '99' THEN '1'
						ELSE 0 END [AssessmentRegistrationParticipationIndicator]
				   ,agradelevel.CodeValue [GradeLevelWhenAssessed]
				   ,NULL [StateFullAcademicYear]
				   ,NULL [LEAFullAcademicYear]
				   ,NULL [SchoolFullAcademicYear]
				   ,rntt.CodeValue [AssessmentRegistrationReasonNotCompleting]
				   ,aperformance.CodeValue [AssessmentPerformanceLevelIdentifier] -- this is what the student scored as it relates to performance level/proficiency - should match with what was put into the Assessment table above
				   ,aperformance.Description [AssessmentPerformanceLevelLabel] -- this is what the student scored as it relates to performance level/proficiency - should match with what was put into the Assessment table above
				   ,NULL [AssessmentRegistrationId]
				   ,NULL [AssessmentId]
				   ,NULL [AssessmentAdministrationId]
				   ,NULL [PersonId]
				   ,NULL [AssessmentFormId]
				   ,NULL [AssessmentSubtestId]
				   ,NULL [AssessmentPerformanceLevelId]
				   ,NULL [AssessmentResultId]
				   ,NULL [AssessmentResult_PerformanceLevelId]
				   ,NULL [OrganizationID_School]
				   ,NULL [OrganizationPersonRoleId_School]
				   ,NULL [RunDateTime]
		FROM [EdFi_Ods_Glendale_v21].[edfi].[Assessment] a
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[Descriptor] asubject 
			ON a.AcademicSubjectDescriptorId = asubject.DescriptorId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[Descriptor] atype 
			ON a.AssessmentCategoryDescriptorId = atype.DescriptorId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[StudentAssessment] sa 
			ON a.AssessmentTitle = sa.AssessmentTitle
			AND a.AcademicSubjectDescriptorId = sa.AcademicSubjectDescriptorId
			AND a.AssessedGradeLevelDescriptorId = sa.AssessedGradeLevelDescriptorId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].[StudentAssessmentPerformanceLevel] sapl
			ON sa.AssessmentTitle = sapl.AssessmentTitle
			AND sa.StudentUSI = sapl.StudentUSI
			AND sa.AcademicSubjectDescriptorId = sapl.AcademicSubjectDescriptorId
			AND sa.AdministrationDate = sapl.AdministrationDate
			AND sa.AssessedGradeLevelDescriptorId = sapl.AssessedGradeLevelDescriptorId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].[Descriptor] aperformance 
			ON sapl.PerformanceLevelDescriptorId = aperformance.DescriptorId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].[Descriptor] agradelevel
			ON sapl.AssessedGradeLevelDescriptorId = agradelevel.DescriptorId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[Student] s 
			ON sa.StudentUSI = s.StudentUSI
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[StudentSchoolAssociation] ssa 
			ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[EducationOrganization] edorg 
			ON ssa.SchoolId = edorg.EducationOrganizationId
		JOIN [EdFi_Ods_Glendale_v21].[edfi].[School] sch 
			ON edorg.EducationOrganizationId = sch.SchoolId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].[ReasonNotTestedType] rntt 
			ON sa.ReasonNotTestedTypeId = rntt.ReasonNotTestedTypeId
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].[StudentAssessmentAccommodation] saa
			ON sa.StudentUSI = saa.StudentUSI
			AND sa.AssessmentTitle = saa.AssessmentTitle
			AND sa.AcademicSubjectDescriptorId = saa.AcademicSubjectDescriptorId
			AND sa.AssessedGradeLevelDescriptorId = saa.AssessedGradeLevelDescriptorId
			AND sa.AdministrationDate = saa.AdministrationDate
			AND sa.Version = saa.Version
		LEFT JOIN [EdFi_Ods_Glendale_v21].[edfi].[Descriptor] aaccom
			ON saa.AccommodationDescriptorId = aaccom.DescriptorId
		WHERE ssa.EntryDate <= sa.AdministrationDate
		AND (ssa.ExitWithdrawDate IS NULL OR ssa.ExitWithdrawDate >= sa.AdministrationDate)
		AND atype.CodeValue NOT IN ('Benchmark test', 'Advanced Placement', 'College Entrance Exam')


		SELECT *
		FROM [EdFi_Ods_Glendale_v21].edfi.Student s
		JOIN [EdFi_Ods_Glendale_v21].edfi.StudentSchoolAssociation ssa 
			ON s.StudentUSI = ssa.StudentUSI
		JOIN [EdFi_Ods_Glendale_v21].edfi.School sch 
			ON ssa.SchoolId = ssa.SchoolId
		JOIN [EdFi_Ods_Glendale_v21].edfi.EducationOrganization edorg 
			ON sch.SchoolId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi_Ods_Glendale_v21].edfi.StudentCharacteristic sc 
			ON s.StudentUSI = sc.StudentUSI
		LEFT JOIN [EdFi_Ods_Glendale_v21].edfi.Descriptor d 
			ON sc.StudentCharacteristicDescriptorId = d.DescriptorId



			SELECT DISTINCT
				 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,d.CodeValue
				,NULL RunDateTime
			FROM [EdFi_Ods_Glendale_v21].[edfi].Student s
			JOIN [EdFi_Ods_Glendale_v21].[edfi].StudentDisability sd ON s.StudentUSI = sd.StudentUSI
			JOIN [EdFi_Ods_Glendale_v21].[edfi].Descriptor d 
				ON sd.DisabilityDescriptorId = d.DescriptorId
