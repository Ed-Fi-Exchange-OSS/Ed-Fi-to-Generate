-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO


DECLARE @StudentUSI INT = 21997
DECLARE @SchoolID NVARCHAR(100) = '255901001'


BEGIN TRANSACTION;  
BEGIN TRY  
  DECLARE @MaxDisciplineActionIdentifier INT 
SELECT @MaxDisciplineActionIdentifier = DisciplineActionIdentifier
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineAction]
  order by 
  CASE 
    WHEN ISNUMERIC([DisciplineActionIdentifier]) = 1 THEN CONVERT(INT, [DisciplineActionIdentifier]) 
    ELSE 9999999 
  END,
  [DisciplineActionIdentifier]


SELECT @MaxDisciplineActionIdentifier
SELECT @MaxDisciplineActionIdentifier = @MaxDisciplineActionIdentifier + 1
DECLARE @DisciplineDate DATE = CAST('2017-10-05' AS Date)

INSERT INTO [edfi].[DisciplineAction]
           ([DisciplineActionIdentifier]
           ,[StudentUSI]
           ,[DisciplineDate]
           ,[DisciplineActionLength]
           ,[ActualDisciplineActionLength]
           ,[ResponsibilitySchoolId]
	)
SELECT @MaxDisciplineActionIdentifier
           ,@StudentUSI
           ,@DisciplineDate
           ,[DisciplineActionLength]
           ,[ActualDisciplineActionLength]
           ,[ResponsibilitySchoolId]
FROM [edfi].[DisciplineAction]
WHERE [DisciplineActionIdentifier] = 98

DECLARE @IncidentIdentifier INT 
SELECT @IncidentIdentifier = [IncidentIdentifier]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineIncident]
  order by 
  CASE 
    WHEN ISNUMERIC([IncidentIdentifier]) = 1 THEN CONVERT(INT, [IncidentIdentifier]) 
    ELSE 9999999 
  END,
  [IncidentIdentifier]

  SELECT @IncidentIdentifier
  SELECT @IncidentIdentifier =  @IncidentIdentifier + 1

  DECLARE @IncidentDate DATE = CAST('2017-10-05' AS Date)

  INSERT INTO [edfi].[DisciplineIncident]
           ([IncidentIdentifier]
           ,[SchoolId]
           ,[IncidentDate]
           ,[IncidentTime]
         --  ,[IncidentDescription]
           ,[ReporterDescriptionDescriptorId]
           ,[ReporterName]
           ,[StaffUSI]
           ,[IncidentLocationDescriptorId])

SELECT @IncidentIdentifier
      ,[SchoolId]
      ,@IncidentDate
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
SELECT @StudentUSI
      ,[SchoolId]
      ,@IncidentIdentifier
      ,[StudentParticipationCodeDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentDisciplineIncidentAssociation]
  where [StudentUSI] = @StudentUSI



  INSERT INTO [edfi].[DisciplineActionStudentDisciplineIncidentAssociation]
           ([DisciplineActionIdentifier]
           ,[DisciplineDate]
           ,[IncidentIdentifier]
           ,[SchoolId]
           ,[StudentUSI]
           )
SELECT @MaxDisciplineActionIdentifier, @DisciplineDate, @IncidentIdentifier, @SchoolID, @StudentUSI

INSERT INTO [edfi].[DisciplineActionDiscipline]
           ([StudentUSI]
           ,[DisciplineActionIdentifier]
           ,[DisciplineDate]
           ,[DisciplineDescriptorId]
			)
SELECT @StudentUSI, @MaxDisciplineActionIdentifier, @DisciplineDate, 416

COMMIT

END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
   
        ROLLBACK;  
END CATCH; 