-- Gerado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   em:        2021-09-03 14:22:52 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE equipamentos (
    id_equipamentos  NUMBER(5) NOT NULL,
    id_etapa         NUMBER(5) NOT NULL,
    nome_equipamento VARCHAR2(150) NOT NULL
);

ALTER TABLE equipamentos ADD CONSTRAINT equipamentos_pk PRIMARY KEY ( id_equipamentos );

CREATE TABLE etapas (
    id_etapa    NUMBER(5) NOT NULL,
    id_workflow NUMBER(5) NOT NULL,
    descricao   VARCHAR2(100)
);

ALTER TABLE etapas ADD CONSTRAINT etapas_pk PRIMARY KEY ( id_etapa );

CREATE TABLE hospitais (
    id_hospital   NUMBER(9) NOT NULL,
    nome_hospital VARCHAR2(200) NOT NULL
);

ALTER TABLE hospitais ADD CONSTRAINT hospitais_pk PRIMARY KEY ( id_hospital );

CREATE TABLE "INSTR/EQUIP" (
    id_relacao      NUMBER(5) NOT NULL,
    id_instrumental NUMBER(5) NOT NULL,
    id_equipamento  NUMBER(5) NOT NULL
);

ALTER TABLE "INSTR/EQUIP" ADD CONSTRAINT "INSTR/EQUIP_PK" PRIMARY KEY ( id_relacao );

CREATE TABLE "INSTR/PROCESSO" (
    id_relacao      NUMBER(5) NOT NULL,
    id_processo     NUMBER(5) NOT NULL,
    id_instrumental NUMBER(5) NOT NULL,
    resposta        CHAR(1) NOT NULL
);

ALTER TABLE "INSTR/PROCESSO" ADD CONSTRAINT "INSTR/PROCESSO_PK" PRIMARY KEY ( id_relacao );

CREATE TABLE instrumentais (
    id_instrumental NUMBER(5) NOT NULL,
    nome            VARCHAR2(150) NOT NULL,
    codigo          VARCHAR2(150) NOT NULL,
    especialidade   VARCHAR2(150) NOT NULL,
    lote            VARCHAR2(150) NOT NULL,
    codigo_rfid     VARCHAR2(150),
    url_imagem      VARCHAR2(200)
);

ALTER TABLE instrumentais ADD CONSTRAINT instrumentais_pk PRIMARY KEY ( id_instrumental );

CREATE TABLE processos (
    id_processo   NUMBER(5) NOT NULL,
    id_etapa      NUMBER(5) NOT NULL,
    nome_processo VARCHAR2(150) NOT NULL
);

ALTER TABLE processos ADD CONSTRAINT processos_pk PRIMARY KEY ( id_processo );

CREATE TABLE workflows (
    id_workflow NUMBER(5) NOT NULL,
    id_hospital NUMBER(5) NOT NULL,
    descricao   VARCHAR2(100) NOT NULL
);

ALTER TABLE workflows ADD CONSTRAINT workflows_pk PRIMARY KEY ( id_workflow );

ALTER TABLE equipamentos
    ADD CONSTRAINT equipamentos_etapas_fk FOREIGN KEY ( id_etapa )
        REFERENCES etapas ( id_etapa );

ALTER TABLE "INSTR/EQUIP"
    ADD CONSTRAINT "INSTR/EQUIP_EQUIPAMENTOS_FK" FOREIGN KEY ( id_equipamento )
        REFERENCES equipamentos ( id_equipamentos );

ALTER TABLE "INSTR/EQUIP"
    ADD CONSTRAINT "INSTR/EQUIP_INSTRUMENTAIS_FK" FOREIGN KEY ( id_instrumental )
        REFERENCES instrumentais ( id_instrumental );

ALTER TABLE "INSTR/PROCESSO"
    ADD CONSTRAINT "INSTR/PROCESSO_FK_INSTR" FOREIGN KEY ( id_instrumental )
        REFERENCES instrumentais ( id_instrumental );

ALTER TABLE "INSTR/PROCESSO"
    ADD CONSTRAINT "INSTR/PROCESSO_FK_PROCESSOS" FOREIGN KEY ( id_processo )
        REFERENCES processos ( id_processo );

ALTER TABLE processos
    ADD CONSTRAINT processos_etapas_fk FOREIGN KEY ( id_etapa )
        REFERENCES etapas ( id_etapa );

ALTER TABLE etapas
    ADD CONSTRAINT table_3_workflows_fk FOREIGN KEY ( id_workflow )
        REFERENCES workflows ( id_workflow );

ALTER TABLE workflows
    ADD CONSTRAINT workflows_fk_hospitais FOREIGN KEY ( id_hospital )
        REFERENCES hospitais ( id_hospital );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
