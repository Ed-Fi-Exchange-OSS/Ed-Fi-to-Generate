

  INSERT INTO [edfi].[Calendar]
           ([CalendarCode]
           ,[SchoolId]
           ,[SchoolYear]
           ,[CalendarTypeDescriptorId]
		)
   SELECT 
   data.CalendarCode
   ,data.SchoolId
   ,data.SchoolYear
   ,d.DescriptorId
   FROM
   (
	SELECT 2010605675 CalendarCode
	,'Student Specific' CalendarType
	, 255901107 SchoolId
    , 2010 SchoolYear
	) data
	LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d on d.CodeValue = data.CalendarType
	LEFT JOIN [edfi].[Calendar] C on c.CalendarCode = data.CalendarCode and c.SchoolId = data.SchoolId and c.SchoolYear = data.SchoolYear
	where c.CalendarCode IS NULL