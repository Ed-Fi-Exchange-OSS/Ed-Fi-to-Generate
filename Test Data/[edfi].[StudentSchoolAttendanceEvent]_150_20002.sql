declare @index int = 0;
declare @eventDate date = '2017-10-04'
while (@index < 150)
begin
  INSERT INTO [edfi].[StudentSchoolAttendanceEvent]
           ([StudentUSI]
           ,[SchoolId]
           ,[SchoolYear]
           ,[EventDate]
           ,[AttendanceEventCategoryDescriptorId]
           ,[AttendanceEventReason]
           ,[LastModifiedDate]
           ,[CreateDate]
           ,[EventDuration]
           ,[SessionName]
           ,[EducationalEnvironmentDescriptorId]
           )
SELECT TOP 1  [StudentUSI]
      ,[SchoolId]
      ,[SchoolYear]
      ,@eventDate
      ,[AttendanceEventCategoryDescriptorId]
      ,[AttendanceEventReason]
      ,[LastModifiedDate]
      ,[CreateDate]
      ,[EventDuration]
      ,[SessionName]
      ,[EducationalEnvironmentDescriptorId]

  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAttendanceEvent] ssae
  where [StudentUSI] = 20002

  SET @eventDate = DateADd(DAY, 1,  @eventDate)

  SET @Index = @Index + 1
end