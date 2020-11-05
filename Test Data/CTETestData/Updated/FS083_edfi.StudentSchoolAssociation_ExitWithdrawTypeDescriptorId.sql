﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use EdFi_Sample_ODS_Data_For_Generate

 declare @ExitWithdrawTypeDescriptorId int
 select @ExitWithdrawTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace like '%uri://ed-fi.org/ExitWithdrawTypeDescriptor%' and CodeValue ='Graduated'

 Update ssa
 Set [ExitWithdrawTypeDescriptorId] = @ExitWithdrawTypeDescriptorId
 FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa
 where StudentUSI between 20000 and 20005


