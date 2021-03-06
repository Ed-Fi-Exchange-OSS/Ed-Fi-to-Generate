﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


IF NOT EXISTS (SELECT 1 FROM  [edfi].[EducationOrganizationInstitutionTelephone] WHERE [EducationOrganizationId] = 255500)
INSERT INTO [edfi].[EducationOrganizationInstitutionTelephone]
           ([EducationOrganizationId]
           ,[TelephoneNumber]
           ,[InstitutionTelephoneNumberTypeDescriptorId])
SELECT 255500, '(303)800-2001', 1602