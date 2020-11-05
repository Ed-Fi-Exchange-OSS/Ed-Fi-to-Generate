-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO
Declare @NameSpace varchar(200) = 'uri://ed-fi.org/SpecialEducationAgeGroupTaughtDescriptor'

IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE CodeValue ='3TO5')
BEGIN
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @NameSpace, '3TO5', '3 through 5','The age range of special education students taught is 3 through 5.'


	INSERT INTO [extension].[SpecialEducationAgeGroupTaughtDescriptor]
			   ([SpecialEducationAgeGroupTaughtDescriptorId])
		 VALUES
			   (@@IDENTITY)
END

IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE CodeValue ='6TO21')
BEGIN
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @NameSpace, '6TO21', '6 through 21','The age range of special education students taught is 6 through 21.'

	INSERT INTO [extension].[SpecialEducationAgeGroupTaughtDescriptor]
			   ([SpecialEducationAgeGroupTaughtDescriptorId])
		 VALUES
			   (@@IDENTITY)
END

SELECT * FROM [edfi].[Descriptor]