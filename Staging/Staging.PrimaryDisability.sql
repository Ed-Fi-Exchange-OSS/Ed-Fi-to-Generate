-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'PrimaryDisability') BEGIN
	DROP TABLE [Staging].[PrimaryDisability]
END

GO


CREATE TABLE Staging.PrimaryDisability (
	 Student_Identifier_State VARCHAR(100)
	,DisabilityType VARCHAR(100)
	,RunDateTime DATETIME
	)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PrimaryDisability', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PrimaryDisability', @level2type = N'Column', @level2name = 'DisabilityType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefDisabilityType', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PrimaryDisability', @level2type = N'Column', @level2name = 'DisabilityType' 
