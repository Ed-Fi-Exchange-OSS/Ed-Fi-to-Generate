
  update sl
  set BeginDate = '2017-10-01' -- from 2017-08-30
    FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation] sl
	where StudentUSI >= 20000