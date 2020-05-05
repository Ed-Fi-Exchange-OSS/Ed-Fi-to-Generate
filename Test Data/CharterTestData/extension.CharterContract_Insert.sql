USE [EdFi_Sample_ODS_Data_For_Generate]
GO

IF NOT EXISTS( SELECT 1 FROM [extension].[CharterContract] WHERE [ContractIdentifier] ='Charter 1')
INSERT INTO [extension].[CharterContract]
           ([ContractIdentifier]
           ,[ApprovalDate]
           ,[RenewalDate]
)
SELECT 'Charter 1', '08/01/2017', '09/15/2018'
GO


  UPDATE  [extension].[CedsSchool]
  Set [ContractIdentifier] = 'Charter 1'
  WHERE [CedsSchoolId] = 255901001