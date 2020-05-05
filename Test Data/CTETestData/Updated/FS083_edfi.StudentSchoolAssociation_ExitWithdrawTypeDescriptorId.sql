use EdFi_Sample_ODS_Data_For_Generate

 declare @ExitWithdrawTypeDescriptorId int
 select @ExitWithdrawTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace like '%uri://ed-fi.org/ExitWithdrawTypeDescriptor%' and CodeValue ='Graduated'

 Update ssa
 Set [ExitWithdrawTypeDescriptorId] = @ExitWithdrawTypeDescriptorId
 FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa
 where StudentUSI between 20000 and 20005


