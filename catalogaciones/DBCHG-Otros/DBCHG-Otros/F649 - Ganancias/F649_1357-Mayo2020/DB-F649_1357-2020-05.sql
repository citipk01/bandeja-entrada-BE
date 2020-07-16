/*	0. Last Date Modified:	2020 06 18	17:12
--	1. Server Name: 		• UAT: LACARGLXAP019		• Production: LACARGLXAP020
--	2. Database Name: 		• UAT: HRTEST_11G			• Production: HR_PROD   -    PSS3
--	3. Schema(s) Name:		BASEARG
--	
--	-----------------------------------------------------------------------------------------------
--	1) Use Connection requiered for change task
--		HR_PROD = (DESCRIPTION = (ADDRESS_LIST = (ADDRESS =(PROTOCOL = TCP)(HOST = LACARGLXAP020.lac.nsroot.net)(PORT = 2432 ))) (CONNECT_DATA = (	SID = PSS3)))
		HR_UAT 	= (DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = LACARGLXAP019)(PORT = 2432)) (CONNECT_DATA = (SID = HRTEST)) )
*/

/* 2) Change current schema ********************************************************************************************************************************** */
	ALTER SESSION SET CURRENT_SCHEMA = "BASEARG";

/* 3) Script*/
	ALTER TABLE f649_nuevo_log ADD  SAC_PRIMERA_CUOTA_EX	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  SAC_SEGUNDA_CUOTA_EX	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  AJUSTE_PER_ANT_GRAV	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  AJUSTE_PER_ANT_EX	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  GANOT_SAC_PRIMERA_CUOTA_EX	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  GANOT_SAC_SEGUNDA_CUOTA_EX	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  GANOT_AJUSTE_PER_ANT_GRAV	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  GANOT_AJUSTE_PER_ANT_EX	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  REM_SUJETA_IMP_ANTES	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  DED_A_ANTES	NUMBER(22, 24) DEFAULT NULL;
	ALTER TABLE f649_nuevo_log ADD  DED_C_ANTES	NUMBER(22, 24) DEFAULT NULL;

--	4) Grants/Synonym to BXUSER
/*		-- Grants
		GRANT select, insert, update, delete, alter ON "BASEARG"."CB_VAC_SOL_WEB"   		TO   BXUSER;  
		GRANT select								ON "BASEARG"."SEQ_CB_VAC_SOL_WEB_ID"   	TO   BXUSER;  
		-- GRANT CREATE ANY SEQUENCE, ALTER ANY SEQUENCE, DROP ANY SEQUENCE, SELECT ANY SEQUENCE TO BXUSER;

		-- Synonyms
		CREATE OR REPLACE PUBLIC SYNONYM "CB_VAC_SOL_WEB"   FOR "BASEARG"."CB_VAC_SOL_WEB";       		
		CREATE OR REPLACE PUBLIC SYNONYM "SEQ_CB_VAC_SOL_WEB_ID" FOR "BASEARG"."SEQ_CB_VAC_SOL_WEB_ID";   
*/		
--	5) If all instructions have ran successfully:
--		* Save changes:
--		
		COMMIT;	
		/
--	
--		* In case of failing:
--			ROLLBACK TO backup_db_before_ran_script;
--	
--	
--	
--	Thanks & Regards
/*
CREATE SEQUENCE default_on_null_seq;

CREATE TABLE t2 (
  col1        NUMBER DEFAULT default_seq.NEXTVAL,
  col2        NUMBER DEFAULT ON NULL default_on_null_seq.NEXTVAL,
  description VARCHAR2(30)
);
*/