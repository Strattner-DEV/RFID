-- Gerado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   em:        2021-09-03 15:47:51 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE equipments (
    equip_id       NUMBER(5) NOT NULL,
    equip_stage_id NUMBER(5) NOT NULL,
    equip_name     VARCHAR2(150) NOT NULL
);

ALTER TABLE equipments ADD CONSTRAINT equipments_pk PRIMARY KEY ( equip_id );

CREATE TABLE hospitals (
    hospital_id   NUMBER(9) NOT NULL,
    hospital_name VARCHAR2(200) NOT NULL
);

ALTER TABLE hospitals ADD CONSTRAINT hospitais_pk PRIMARY KEY ( hospital_id );

CREATE TABLE "INSTR/EQUIP" (
    "INSTR/EQUIP_ID" NUMBER(5) NOT NULL,
    instr_id         NUMBER(5) NOT NULL,
    equip_id         NUMBER(5) NOT NULL
);

ALTER TABLE "INSTR/EQUIP" ADD CONSTRAINT "INSTR/EQUIP_PK" PRIMARY KEY ( "INSTR/EQUIP_ID" );

CREATE TABLE "INSTR/PROCESS" (
    "INSTR/PROCESS_ID"     NUMBER(5) NOT NULL,
    process_id             NUMBER(5) NOT NULL,
    instr_id               NUMBER(5) NOT NULL,
    "INSTR/PROCESS_ANSWER" CHAR(1) NOT NULL
);

ALTER TABLE "INSTR/PROCESS" ADD CONSTRAINT "INSTR/PROCESSO_PK" PRIMARY KEY ( "INSTR/PROCESS_ID" );

CREATE TABLE instrumentals (
    instr_id        NUMBER(5) NOT NULL,
    instr_name      VARCHAR2(150) NOT NULL,
    instr_code      VARCHAR2(150) NOT NULL,
    instr_specialty VARCHAR2(150) NOT NULL,
    instr_batch     VARCHAR2(150) NOT NULL,
    instr_rfid_code VARCHAR2(150),
    instr_image_url VARCHAR2(200)
);

ALTER TABLE instrumentals ADD CONSTRAINT instrumentals_pk PRIMARY KEY ( instr_id );

CREATE TABLE processes (
    process_id       NUMBER(5) NOT NULL,
    process_stage_id NUMBER(5) NOT NULL,
    process_name     VARCHAR2(150) NOT NULL
);

ALTER TABLE processes ADD CONSTRAINT processes_pk PRIMARY KEY ( process_id );

CREATE TABLE stages (
    stage_id    NUMBER(5) NOT NULL,
    stage_wf_id NUMBER(5) NOT NULL,
    stage_desc  VARCHAR2(100)
);

ALTER TABLE stages ADD CONSTRAINT stages_pk PRIMARY KEY ( stage_id );

CREATE TABLE workflows (
    wf_id          NUMBER(5) NOT NULL,
    wf_hospital_id NUMBER(5) NOT NULL,
    wf_desc        VARCHAR2(100) NOT NULL
);

ALTER TABLE workflows ADD CONSTRAINT workflows_pk PRIMARY KEY ( wf_id );

ALTER TABLE equipments
    ADD CONSTRAINT equipments_stage_fk FOREIGN KEY ( equip_stage_id )
        REFERENCES stages ( stage_id );

ALTER TABLE "INSTR/EQUIP"
    ADD CONSTRAINT "INSTR/EQUIP_EQUIPAMENTOS_FK" FOREIGN KEY ( equip_id )
        REFERENCES equipments ( equip_id );

ALTER TABLE "INSTR/EQUIP"
    ADD CONSTRAINT "INSTR/EQUIP_INSTRUMENTAIS_FK" FOREIGN KEY ( instr_id )
        REFERENCES instrumentals ( instr_id );

ALTER TABLE "INSTR/PROCESS"
    ADD CONSTRAINT "INSTR/PROCESSO_FK_INSTR" FOREIGN KEY ( instr_id )
        REFERENCES instrumentals ( instr_id );

ALTER TABLE "INSTR/PROCESS"
    ADD CONSTRAINT "INSTR/PROCESSO_FK_PROCESSOS" FOREIGN KEY ( process_id )
        REFERENCES processes ( process_id );

ALTER TABLE processes
    ADD CONSTRAINT processos_etapas_fk FOREIGN KEY ( process_stage_id )
        REFERENCES stages ( stage_id );

ALTER TABLE stages
    ADD CONSTRAINT stages_workflows_fk FOREIGN KEY ( stage_wf_id )
        REFERENCES workflows ( wf_id );

ALTER TABLE workflows
    ADD CONSTRAINT workflows_fk_hospitals FOREIGN KEY ( wf_hospital_id )
        REFERENCES hospitals ( hospital_id );
