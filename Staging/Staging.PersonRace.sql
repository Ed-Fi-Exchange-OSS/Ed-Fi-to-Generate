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

-- Rename the table 'MembershipRace' to 'PersonRace' and add more fields
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'MembershipRace') BEGIN
	DROP TABLE [Staging].[MembershipRace]
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'PersonRace') BEGIN
	DROP TABLE [Staging].[PersonRace]
END

GO


CREATE TABLE Staging.PersonRace (
	 Student_Identifier_State VARCHAR(100)
	,RaceType VARCHAR(100)
	,RecordStartDateTime DATETIME
	,RecordEndDateTime DATETIME NULL
	,PersonDemographicRaceId INT NULL
	,RunDateTime DATETIME NULL
	)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonRace', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonRace', @level2type = N'Column', @level2name = 'RaceType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefRace', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonRace', @level2type = N'Column', @level2name = 'RaceType' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'PersonRace', @level2type = N'Column', @level2name = 'RecordStartDateTime' 
