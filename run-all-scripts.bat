cd Staging
sqlcmd /S (local) /d Generate -E -i"Staging Schema.sql"


for %%G in (Staging.*.sql) do sqlcmd /S (local) /d Generate -E -i"%%G"




cd ..
cd ODS
sqlcmd /S (local) /d Generate -E -i"ODS.SourceSystemReferenceData.sql"


cd ..
cd Functions
for %%G in (*.sql) do sqlcmd /S (local) /d Generate -E -i"%%G"




cd ..
cd "Stored Procedures Encapsulated"
for %%G in (*.sql) do sqlcmd /S (local) /d Generate -E -i"%%G"




cd ..
pause