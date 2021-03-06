﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'Person') BEGIN
	DROP TABLE [Staging].[Person]
END

GO


CREATE TABLE Staging.Person (
	 Id INT IDENTITY(1, 1) Primary Key
	,Identifier VARCHAR(100)
	,FirstName VARCHAR(100)
	,LastName VARCHAR(100)
	,MiddleName VARCHAR(100)
	,Birthdate DATE
	,Sex VARCHAR(30)
	,HispanicLatinoEthnicity BIT
	,[Role] VARCHAR(30)
	,PersonId INT NULL
	,RunDateTime DATETIME
	);

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'Identifier' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'FirstName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'LastName' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'Birthdate' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'HispanicLatinoEthnicity' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'Sex' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'Role' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'Role', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'Person', @level2type = N'Column', @level2name = 'Role' 
