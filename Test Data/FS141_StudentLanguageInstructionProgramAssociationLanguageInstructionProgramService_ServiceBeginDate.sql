  Update sp
  SET  [ServiceBeginDate] = '2017-07-01'
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService] sp
  where StudentUSI = 20002

    update ssa
  Set entrydate = '2017-07-01'
    FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa
where	entrydate = '2017-07-15'
