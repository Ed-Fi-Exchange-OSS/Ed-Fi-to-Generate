
use EdFi_Sample_ODS_Data_For_Generate
declare @Achive_IndicatorStatusTypeDescriptor int
select @Achive_IndicatorStatusTypeDescriptor = DescriptorId from EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor 
where Namespace like '%statustype%' and CodeValue ='AcademicAchievementIndicatorStatus'

declare @Other_IndicatorStatusTypeDescriptor int
--select * from EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor where Namespace like '%statustype%'

select @Other_IndicatorStatusTypeDescriptor = DescriptorId from EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor 
where Namespace like '%statustype%' and CodeValue ='OtherAcademicIndicatorStatus'

INSERT INTO [extension].[CedsSchoolCustomIndicatorStatusType]
           ([IndicatorStatusDescriptorId]
           ,[IndicatorStatusSubgroupDescriptorId]
           ,[IndicatorStatusSubgroupTypeDescriptorId]
           ,[IndicatorStatusTypeDescriptorId]
           ,[SchoolId]
           ,[StatedDefinedCustomIndicatorStatusType]
           ,[StatedDefinedIndicatorStatus]
           ,[RecordStartDateTime])

SELECT TOP (1000) [IndicatorStatusDescriptorId]
      ,[IndicatorStatusSubgroupDescriptorId]
      ,[IndicatorStatusSubgroupTypeDescriptorId]
      ,@Achive_IndicatorStatusTypeDescriptor
      ,255901007
      ,[StatedDefinedCustomIndicatorStatusType]
      ,[StatedDefinedIndicatorStatus]
      ,[RecordStartDateTime]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchoolCustomIndicatorStatusType]
  where schoolId = 255901007

  declare @Other_IndicatorStatusTypeDescriptor int
--select * from EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor where Namespace like '%statustype%'

select @Other_IndicatorStatusTypeDescriptor = DescriptorId from EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor 
where Namespace like '%statustype%' and CodeValue ='OtherAcademicIndicatorStatus'


  INSERT INTO [extension].[CedsSchoolCustomIndicatorStatusType]
           ([IndicatorStatusDescriptorId]
           ,[IndicatorStatusSubgroupDescriptorId]
           ,[IndicatorStatusSubgroupTypeDescriptorId]
           ,[IndicatorStatusTypeDescriptorId]
           ,[SchoolId]
           ,[StatedDefinedCustomIndicatorStatusType]
           ,[StatedDefinedIndicatorStatus]
           ,[RecordStartDateTime])

SELECT distinct [IndicatorStatusDescriptorId]
      ,[IndicatorStatusSubgroupDescriptorId]
      ,[IndicatorStatusSubgroupTypeDescriptorId]
      ,@Other_IndicatorStatusTypeDescriptor
      ,255901007
      ,[StatedDefinedCustomIndicatorStatusType]
      ,[StatedDefinedIndicatorStatus]
      ,[RecordStartDateTime]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchoolCustomIndicatorStatusType]
  where schoolId = 255901007