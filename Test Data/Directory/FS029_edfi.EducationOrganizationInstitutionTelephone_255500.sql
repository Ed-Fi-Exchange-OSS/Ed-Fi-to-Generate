-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE EdFi_Sample_ODS_Data_For_Generate
IF NOT EXISTS(SELECT 1 FROM [edfi].[EducationOrganizationInstitutionTelephone] WHERE [EducationOrganizationId] = 255500)
INSERT INTO [edfi].[EducationOrganizationInstitutionTelephone]
    ([EducationOrganizationId]
    ,[TelephoneNumber]
    ,[CreateDate]
    ,[InstitutionTelephoneNumberTypeDescriptorId])
SELECT 255500
	,'(936) 805-8500'
	, GETDATE()
	, 1602

	