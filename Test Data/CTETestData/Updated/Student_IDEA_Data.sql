-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           ([DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[StudentUSI])
select 390 -- AUT
,255901
,21631

GO


INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           )
SELECT 
255901
,684
,21631
GO


