USE EdFi_Sample_ODS_Data_For_Generate
GO

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsLocalEducationAgency') AND name = N'UX_CedsLocalEducationAgency_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsLocalEducationAgency_Id ON [extension].[CedsLocalEducationAgency]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsSchool') AND name = N'UX_CedsSchool_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsSchool_Id ON [extension].[CedsSchool]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.SchoolFederalFunds') AND name = N'UX_SchoolFederalFunds_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SchoolFederalFunds_Id ON [extension].[SchoolFederalFunds]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT


BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.DisciplineActionDiscipline') AND name = N'UX_DisciplineActionDiscipline_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineActionDiscipline_Id ON [extension].[DisciplineActionDiscipline]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT