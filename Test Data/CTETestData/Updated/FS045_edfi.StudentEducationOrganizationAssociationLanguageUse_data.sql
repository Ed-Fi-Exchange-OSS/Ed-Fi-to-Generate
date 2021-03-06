﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.



  DECLARE @LanguageDescriptorId int
  DECLARE @EducationOrganizationId int
  DECLARE @LanguageUseDescriptorId int

	select @LanguageDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/LanguageDescriptor' AND CodeValue = 'Spanish'

	select @LanguageUseDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/LanguageUseDescriptor' AND CodeValue = 'Native language'

SET @EducationOrganizationId = 255901012

BEGIN TRANSACTION

BEGIN TRY


DECLARE @EdFiStudent TABLE
(
	StudentUSI int
)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)

  INSERT INTO [edfi].[StudentEducationOrganizationAssociationLanguage]
           ([EducationOrganizationId]
           ,[LanguageDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
SELECT @EducationOrganizationId
	, @LanguageDescriptorId
	, s.StudentUSI
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentEducationOrganizationAssociationLanguage] l
	ON l.StudentUSI = s.StudentUSI and l.LanguageDescriptorId = @LanguageDescriptorId AND l.EducationOrganizationId = @EducationOrganizationId
WHERE l.StudentUSI  IS NULL


  INSERT INTO [edfi].[StudentEducationOrganizationAssociationLanguageUse]
           ([EducationOrganizationId]
           ,[LanguageDescriptorId]
           ,[StudentUSI]
           ,[CreateDate]
           ,[LanguageUseDescriptorId])
SELECT @EducationOrganizationId
	, @LanguageDescriptorId
	, s.StudentUSI
	, GETDATE()
	, @LanguageUseDescriptorId
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentEducationOrganizationAssociationLanguageUse] l
	ON l.StudentUSI = s.StudentUSI AND l.EducationOrganizationId = @EducationOrganizationId
	and l.LanguageDescriptorId = @LanguageDescriptorId AND l.LanguageUseDescriptorId = @LanguageUseDescriptorId
WHERE l.StudentUSI  IS NULL


COMMIT

END TRY
BEGIN CATCH  
	ROLLBACK

    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH  
