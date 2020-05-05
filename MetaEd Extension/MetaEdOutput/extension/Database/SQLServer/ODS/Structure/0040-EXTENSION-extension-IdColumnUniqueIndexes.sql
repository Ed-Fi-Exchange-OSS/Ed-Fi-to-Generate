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
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsSchoolAccountability') AND name = N'UX_CedsSchoolAccountability_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsSchoolAccountability_Id ON [extension].[CedsSchoolAccountability]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsSchoolComprehensiveAndTargetedSupport') AND name = N'UX_CedsSchoolComprehensiveAndTargetedSupport_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsSchoolComprehensiveAndTargetedSupport_Id ON [extension].[CedsSchoolComprehensiveAndTargetedSupport]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsSchoolCustomIndicatorStatusType') AND name = N'UX_CedsSchoolCustomIndicatorStatusType_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsSchoolCustomIndicatorStatusType_Id ON [extension].[CedsSchoolCustomIndicatorStatusType]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 100, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsSchoolIndicatorStatus') AND name = N'UX_CedsSchoolIndicatorStatus_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsSchoolIndicatorStatus_Id ON [extension].[CedsSchoolIndicatorStatus]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsSchoolStatus') AND name = N'UX_CedsSchoolStatus_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsSchoolStatus_Id ON [extension].[CedsSchoolStatus]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsSpecialEducationStaffCategory') AND name = N'UX_CedsSpecialEducationStaffCategory_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsSpecialEducationStaffCategory_Id ON [extension].[CedsSpecialEducationStaffCategory]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsStudentAssessment') AND name = N'UX_CedsStudentAssessment_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsStudentAssessment_Id ON [extension].[CedsStudentAssessment]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsStudentCTEProgramAssociation') AND name = N'UX_CedsStudentCTEProgramAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsStudentCTEProgramAssociation_Id ON [extension].[CedsStudentCTEProgramAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsStudentHomelessProgramAssociation') AND name = N'UX_CedsStudentHomelessProgramAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsStudentHomelessProgramAssociation_Id ON [extension].[CedsStudentHomelessProgramAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CedsStudentNoDProgramAssociation') AND name = N'UX_CedsStudentNoDProgramAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CedsStudentNoDProgramAssociation_Id ON [extension].[CedsStudentNoDProgramAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CharterContract') AND name = N'UX_CharterContract_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CharterContract_Id ON [extension].[CharterContract]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CharterSchoolApprovalAgency') AND name = N'UX_CharterSchoolApprovalAgency_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CharterSchoolApprovalAgency_Id ON [extension].[CharterSchoolApprovalAgency]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.DisciplineActionDiscipline') AND name = N'UX_DisciplineActionDiscipline_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineActionDiscipline_Id ON [extension].[DisciplineActionDiscipline]
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
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.StateDefinedCustomIndicator') AND name = N'UX_StateDefinedCustomIndicator_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StateDefinedCustomIndicator_Id ON [extension].[StateDefinedCustomIndicator]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.StateDefinedIndicator') AND name = N'UX_StateDefinedIndicator_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StateDefinedIndicator_Id ON [extension].[StateDefinedIndicator]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

