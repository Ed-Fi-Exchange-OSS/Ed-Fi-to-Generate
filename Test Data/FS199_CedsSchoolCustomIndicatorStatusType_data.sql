﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


use EdFi_Sample_ODS_Data_For_Generate
declare @IndicatorStatusTypeDescriptor int
select @IndicatorStatusTypeDescriptor = DescriptorId from EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor 
where Namespace like '%statustype%' and CodeValue ='GraduationRateIndicatorStatus'

IF NOT EXISTS(SELECT 1 FROM [extension].[CedsSchoolCustomIndicatorStatusType] 
	WHERE [SchoolId] = 255901007 AND [IndicatorStatusTypeDescriptorId] = @IndicatorStatusTypeDescriptor)
INSERT INTO [extension].[CedsSchoolCustomIndicatorStatusType]
           ([IndicatorStatusDescriptorId]
           ,[IndicatorStatusSubgroupDescriptorId]
           ,[IndicatorStatusSubgroupTypeDescriptorId]
           ,[IndicatorStatusTypeDescriptorId]
           ,[SchoolId]
           ,[StatedDefinedCustomIndicatorStatusType]
           ,[StatedDefinedIndicatorStatus]
           ,[RecordStartDateTime])

SELECT DISTINCT [IndicatorStatusDescriptorId]
      ,[IndicatorStatusSubgroupDescriptorId]
      ,[IndicatorStatusSubgroupTypeDescriptorId]
      ,@IndicatorStatusTypeDescriptor
      ,255901007
      ,[StatedDefinedCustomIndicatorStatusType]
      ,[StatedDefinedIndicatorStatus]
      ,[RecordStartDateTime]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchoolCustomIndicatorStatusType]
  where schoolId = 255901007
