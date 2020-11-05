-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use EdFi_Sample_ODS_Data_For_Generate

declare @namespace varchar(1024) = 'uri://ed-fi.org/ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor'
declare @codeValue varchar(50)
declare @shortDescription varchar(75)
declare @description varchar(1024)

SET @codeValue = 'STTDEF'
SET @shortDescription = 'State defined status'
SET @description = 'A status defined by the state.  The state defined status is provided in a separate field in the file.'
IF NOT EXISTS (SELECT 1 FROM edfi.Descriptor where Namespace = @namespace and CodeValue = @codeValue)
INSERT INTO [edfi].[Descriptor]
           ([Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
	)
SELECT @namespace, @codeValue, @shortDescription, @description

SET @codeValue = 'TOOFEW'
SET @shortDescription = 'Too few students'
SET @description = 'The number of students in the school was less than the minimum group size necessary required to reliably calculate the indicator'
IF NOT EXISTS (SELECT 1 FROM edfi.Descriptor where Namespace = @namespace and CodeValue = @codeValue)
INSERT INTO [edfi].[Descriptor]
           ([Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
	)
SELECT @namespace, @codeValue, @shortDescription, @description


SET @codeValue = 'NOSTUDENTS'
SET @shortDescription = 'No students in the subgroup'
SET @description = 'If no students are in the school, the school should not be included in this file. If the school is included, then the status would be NOSTUDENTS.'
IF NOT EXISTS (SELECT 1 FROM edfi.Descriptor where Namespace = @namespace and CodeValue = @codeValue)
INSERT INTO [edfi].[Descriptor]
           ([Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
	)
SELECT @namespace, @codeValue, @shortDescription, @description

