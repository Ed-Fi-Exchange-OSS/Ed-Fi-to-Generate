
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
