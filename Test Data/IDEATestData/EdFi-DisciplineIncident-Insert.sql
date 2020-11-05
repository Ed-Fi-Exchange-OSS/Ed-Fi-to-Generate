-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

DECLARE @IncidentIdentifier INT 
SELECT @IncidentIdentifier = [IncidentIdentifier]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineIncident]
  order by 
  CASE 
    WHEN ISNUMERIC([IncidentIdentifier]) = 1 THEN CONVERT(INT, [IncidentIdentifier]) 
    ELSE 9999999 
  END,
  [IncidentIdentifier]

  DECLARE @StudentUSI INT = 12066

  SELECT @IncidentIdentifier
  SELECT @IncidentIdentifier =  @IncidentIdentifier + 1

  INSERT INTO [edfi].[DisciplineIncident]
           ([IncidentIdentifier]
           ,[SchoolId]
           ,[IncidentDate]
           ,[IncidentTime]
           ,[IncidentDescription]
           ,[ReporterDescriptionDescriptorId]
           ,[ReporterName]
           ,[StaffUSI]
           ,[IncidentLocationDescriptorId])

SELECT @IncidentIdentifier
      ,[SchoolId]
      ,CAST('2017-10-05' AS Date)
      ,[IncidentTime]
      ,[ReporterDescriptionDescriptorId]
      ,'AEM Developer'
      ,[StaffUSI]
      ,[IncidentLocationDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineIncident]
  WHERE [IncidentIdentifier] = 189

  -------------------------
  
INSERT INTO [edfi].[StudentDisciplineIncidentAssociation]
           (
			   [StudentUSI]
			   ,[SchoolId]
			   ,[IncidentIdentifier]
			   ,[StudentParticipationCodeDescriptorId]
			)
SELECT [StudentUSI]
      ,[SchoolId]
      ,@IncidentIdentifier
      ,[StudentParticipationCodeDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentDisciplineIncidentAssociation]
  where [StudentUSI] = @StudentUSI


