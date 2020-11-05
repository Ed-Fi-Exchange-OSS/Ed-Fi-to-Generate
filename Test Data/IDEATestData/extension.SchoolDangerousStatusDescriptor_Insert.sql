-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO
Declare @NameSpace varchar(200) = 'uri://ed-fi.org/SchoolDangerousStatusDescriptor'

IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE CodeValue ='YES' and Namespace = @NameSpace)
BEGIN
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @NameSpace, 'YES', 'Persistently Dangerous','Persistently Dangerous.'


	INSERT INTO [extension].[SchoolDangerousStatusDescriptor]
			   ([SchoolDangerousStatusDescriptorId])
		 VALUES
			   (@@IDENTITY)
END

IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE CodeValue ='NO' and Namespace = @NameSpace)
BEGIN
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @NameSpace, 'NO', 'Not Persistently Dangerous','Not Persistently Dangerous.'

	INSERT INTO [extension].[SchoolDangerousStatusDescriptor]
			   ([SchoolDangerousStatusDescriptorId])
		 VALUES
			   (@@IDENTITY)
END
SELECT * FROM [edfi].[Descriptor] where Namespace = @NameSpace