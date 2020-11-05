-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use EdFi_Sample_ODS_Data_For_Generate

DECLARE @NationalSchoolLunchProgramStatusDescriptorId int
DECLARE @ReconstitutedStatusDescriptorId int
DECLARE @SharedTimeIndicatorDescriptorId int
DECLARE @VirtualSchoolStatusDescriptorId int
DECLARE @StatePovertyDesignationDescriptorId int
DECLARE @MepProjectTypeDescriptorId int
DECLARE @TitleISchoolStatusDescriptorId int

select @NationalSchoolLunchProgramStatusDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/001767' and CodeValue = 'NSLPCEO'
select @NationalSchoolLunchProgramStatusDescriptorId as NationalSchoolLunchProgramStatusDescriptorId

select @SharedTimeIndicatorDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000257' AND Codevalue = 'Yes'
select @SharedTimeIndicatorDescriptorId as SharedTimeIndicatorDescriptorId

select @ReconstitutedStatusDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000230'  AND Codevalue = 'Yes'
select @ReconstitutedStatusDescriptorId as ReconstitutedStatusDescriptorId


select @VirtualSchoolStatusDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/001766'  AND Codevalue = 'SupplementalVirtual'
select @VirtualSchoolStatusDescriptorId as VirtualSchoolStatusDescriptorId


select @MepProjectTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000463'  AND Codevalue = 'SummerIntersession'
select @MepProjectTypeDescriptorId as MepProjectTypeDescriptorId

select @TitleISchoolStatusDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000285'  AND Codevalue = 'SWELIGNOPROG'
select @TitleISchoolStatusDescriptorId as TitleISchoolStatusDescriptorId

select @StatePovertyDesignationDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000585'  AND Codevalue = 'HighQuartile'
select @StatePovertyDesignationDescriptorId as StatePovertyDesignationDescriptorId


declare @SchoolId int
Set @SchoolId = 255901001

IF NOT EXISTS(SELECT 1 FROM [extension].[CedsSchool] WHERE CedsSchoolId = @SchoolId)
INSERT INTO [extension].[CedsSchool]
           ([CedsSchoolId]
           ,[CharterSchoolApprovalAgencyId]
           ,[EducationOrgabizationNetworkId]
           ,[NationalSchoolLunchProgramStatusDescriptorId]
           ,[ReconstitutedStatusDescriptorId]
           ,[SharedTimeIndicatorDescriptorId]
           ,[VirtualSchoolStatusDescriptorId]
           ,[ContractIdentifier]
           ,[StatePovertyDesignationDescriptorId]
           ,[MepProjectTypeDescriptorId]
		   , [TitleISchoolStatusDescriptorId]
		   )
SELECT @SchoolId
		, 255901
		, 255901001
		, @NationalSchoolLunchProgramStatusDescriptorId --
		, @ReconstitutedStatusDescriptorId -- [ReconstitutedStatusDescriptorId]
		, @SharedTimeIndicatorDescriptorId --  [SharedTimeIndicatorDescriptorId]	
		, @VirtualSchoolStatusDescriptorId -- [VirtualSchoolStatusDescriptorId]
		, 'Charter 1' [ContractIdentifier]
		, @StatePovertyDesignationDescriptorId -- [StatePovertyDesignationDescriptorId]
		, @MepProjectTypeDescriptorId -- [MepProjectTypeDescriptorId]
		, @TitleISchoolStatusDescriptorId -- [TitleISchoolStatusDescriptorId]
GO
