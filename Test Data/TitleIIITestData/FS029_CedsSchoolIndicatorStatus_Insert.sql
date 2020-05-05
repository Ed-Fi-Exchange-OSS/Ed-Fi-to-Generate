use EdFi_Sample_ODS_Data_For_Generate



----------------------------------------------
truncate table  [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchoolIndicatorStatus]

IF NOT EXISTS (SELECT 1 FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchoolIndicatorStatus])
BEGIN
	INSERT INTO [extension].[CedsSchoolIndicatorStatus]
	(
			   [SchoolId]
			   ,[IndicatorStatusDescriptorId]
			   ,[IndicatorStatusSubgroupDescriptorId]
			   ,[IndicatorStatusSubgroupTypeDescriptorId]
			   ,[IndicatorStatusTypeDescriptorId]
			   ,[RecordStartDateTime]
           
	)
	SELECT 255901001 as SchoolId
	, (SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' And CodeValue ='TOOFEW')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' And CodeValue ='MA')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' And CodeValue ='RaceEthnicity')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' And CodeValue ='GraduationRateIndicatorStatus')
	, '2017-07-01'

	INSERT INTO [extension].[CedsSchoolIndicatorStatus]
	(
			   [SchoolId]
			   ,[IndicatorStatusDescriptorId]
			   ,[IndicatorStatusSubgroupDescriptorId]
			   ,[IndicatorStatusSubgroupTypeDescriptorId]
			   ,[IndicatorStatusTypeDescriptorId]
               ,[RecordStartDateTime]
	)
	SELECT 255901001 as SchoolId
	, (SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' And CodeValue ='TOOFEW')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' And CodeValue ='ECODIS')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' And CodeValue ='EconomicallyDisadvantagedStatus')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' And CodeValue ='GraduationRateIndicatorStatus')
	, '2017-07-01'

	INSERT INTO [extension].[CedsSchoolIndicatorStatus]
	(
			   [SchoolId]
			   ,[IndicatorStatusDescriptorId]
			   ,[IndicatorStatusSubgroupDescriptorId]
			   ,[IndicatorStatusSubgroupTypeDescriptorId]
			   ,[IndicatorStatusTypeDescriptorId]
               ,[RecordStartDateTime]
	)

	SELECT 255901001 as SchoolId
	, (SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' And CodeValue ='NOSTUDENTS')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' And CodeValue ='MAN')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' And CodeValue ='RaceEthnicity')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' And CodeValue ='GraduationRateIndicatorStatus')
	, '2017-07-01'

	INSERT INTO [extension].[CedsSchoolIndicatorStatus]
	(
			   [SchoolId]
			   ,[IndicatorStatusDescriptorId]
			   ,[IndicatorStatusSubgroupDescriptorId]
			   ,[IndicatorStatusSubgroupTypeDescriptorId]
			   ,[IndicatorStatusTypeDescriptorId]
				,[StatedDefinedIndicatorStatus]
				,[RecordStartDateTime]
	)

	SELECT 255901001 as SchoolId
	, (SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusDescriptor' And CodeValue ='STTDEF')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupDescriptor' And CodeValue ='MA')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusSubgroupTypeDescriptor' And CodeValue ='RaceEthnicity')
	,(SELECT DescriptorID From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndicatorStatusTypeDescriptor' And CodeValue ='GraduationRateIndicatorStatus')
	, 'Yellow'
	, '2017-07-01'
END 
