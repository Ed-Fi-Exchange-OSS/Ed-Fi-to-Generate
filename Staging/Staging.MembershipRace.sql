USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'MembershipRace') BEGIN
	DROP TABLE [Staging].[MembershipRace]
END

GO


CREATE TABLE Staging.MembershipRace (
	 Student_Identifier_State VARCHAR(100)
	,RaceType VARCHAR(100)
	,PersonDemographicRaceId INT
	,RunDateTime DATETIME
	)

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipRace', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipRace', @level2type = N'Column', @level2name = 'RaceType' 
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefRace', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'MembershipRace', @level2type = N'Column', @level2name = 'RaceType' 
