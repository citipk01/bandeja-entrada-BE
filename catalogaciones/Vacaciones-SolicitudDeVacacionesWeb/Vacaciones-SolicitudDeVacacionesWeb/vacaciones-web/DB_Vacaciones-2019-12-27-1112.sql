/*	0. Last Date Modified:	2019 12 27	11:12
--	1. Server Name: 		LACARGLXAP020
--	2. Database Name: 		HR_PROD   -    PSS3
--	3. Schema(s) Name:		BASEARG
--	
--	-----------------------------------------------------------------------------------------------
--	1) Use this Connection
--		HR_PROD = (DESCRIPTION = (ADDRESS_LIST = (ADDRESS =(PROTOCOL = TCP)(HOST = LACARGLXAP020.lac.nsroot.net)(PORT = 2432 ))) (CONNECT_DATA = (	SID = PSS3)))
*/

/* 2) Change current schema ********************************************************************************************************************************** */
	ALTER SESSION SET CURRENT_SCHEMA = "BASEARG";

    DROP TABLE "BASEARG"."CB_VAC_SOL_WEB";
    --DROP INDEX "BASEARG"."CB_VAC_SOL_WEB";
/* 3) Create*/

	CREATE TABLE "BASEARG"."CB_VAC_SOL_WEB" (
		"ID"           NUMBER(10)	NOT NULL,
		"COD_MF"       NUMBER(10, 0),
		"PERIODO"      DATE,
		"COD_EMP"      NUMBER(3, 0),
		"FEC_INI"      DATE,
		"FEC_FIN"      DATE,
		"DIAS"         NUMBER(3, 0),
		"FEC_PEDIDO"   DATE,
		"ESTADO"	   VARCHAR2(15),
		"PLUS_VAC"     CHAR(1 BYTE),
		"ADE_VAC"      CHAR(1 BYTE),
		"MES"          NUMBER(2, 0),
		"ANIO"         NUMBER(4, 0),
		"APROB_VAC"    CHAR(1 BYTE),
		"LAST_USR"     CHAR(30 BYTE),
		"LAST_HOST"    CHAR(50 BYTE),
		"FEC_ULT_MODIF"   DATE
	);
	--/

	CREATE UNIQUE INDEX "BASEARG"."CB_VAC_SOL_WEB" ON "BASEARG"."CB_VAC_SOL_WEB" ("ID") 
	PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
	STORAGE(INITIAL 262144 NEXT 262144 MINEXTENTS 1 MAXEXTENTS 2147483645
			PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
			BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT
			)
	TABLESPACE "QSRRHH" ;
	--/

	CREATE SEQUENCE  "BASEARG"."SEQ_CB_VAC_SOL_WEB_ID"  MINVALUE 1 MAXVALUE 99999999999999999999 
	INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE ;
	/

--	4) Grants/Synonym to BXUSER
		-- Grants
		GRANT select, insert, update, delete, alter ON "BASEARG"."CB_VAC_SOL_WEB"   		TO   BXUSER;  
		GRANT select								ON "BASEARG"."SEQ_CB_VAC_SOL_WEB_ID"   	TO   BXUSER;  
		-- GRANT CREATE ANY SEQUENCE, ALTER ANY SEQUENCE, DROP ANY SEQUENCE, SELECT ANY SEQUENCE TO BXUSER;

		-- Syonyms
		CREATE OR REPLACE PUBLIC SYNONYM "CB_VAC_SOL_WEB"   FOR "BASEARG"."CB_VAC_SOL_WEB";       		
		CREATE OR REPLACE PUBLIC SYNONYM "SEQ_CB_VAC_SOL_WEB_ID" FOR "BASEARG"."SEQ_CB_VAC_SOL_WEB_ID";   
		
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