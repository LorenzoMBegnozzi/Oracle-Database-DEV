-------------------PK, FK, UNIQUE, CHECK
create table uf(id_uf integer, dt_criacao date, dt_alteracao date, cd_uf_ubge number(2), sg_uf varchar(2), 
ds_uf varchar2(255));

--DEPOIS DE JA TER CRIADO A TEBELA
--1)definitnaod chave primaria com a tabela ja criada
    alter table uf add constraint nr_seq_pk primary key (id_uf);
--2)definindo campo com registro que deve ser unico
    alter table uf add constraint cd_uf_ubge_un unique (cd_uf_ubge);
--3)alterar para não null
    alter table uf modify(sg_uf not null, cd_uf_ubge not null);
    
--dropar constraint de dentro da tabela 
    alter table uf drop constraint sg_uf_un;

--dropar tabela inteira:
drop table uf;

--CRIANDO A TEBELA COM OS ATRIBUTOS PK, FK, UNIQUE, CHECK
-----UF-----
alter table uf add constraint nr_seq_uf_pk primary key (nr_sequencia);
alter table uf add constraint sg_uf_un unique (sg_uf);
alter table uf add constraint cd_uf_ibge_un unique (cd_uf_ibge);
alter table uf modify(sg_uf not null, cd_uf_ibge not null);
drop table uf;

CREATE TABLE uf (
    nr_sequencia INTEGER
        CONSTRAINT nr_seq_uf_pk PRIMARY KEY,
    dt_criacao   DATE,
    dt_alteracao DATE,
    cd_uf_ibge   NUMBER(2) NOT NULL
        CONSTRAINT cd_uf_ibge_un UNIQUE,
    sg_uf        VARCHAR2(2) NOT NULL
        CONSTRAINT sg_uf_un UNIQUE,
    ds_uf        VARCHAR2(255)
);

--MUNICIPIO----
alter table municipio add constraint nr_seq_municipio_pk primary key(nr_sequencia);
alter table municipio add constraint cd_municipio_ibge_un  unique(cd_municipio_ibge);
alter table municipio modify (cd_municipio_ibge not null);
drop table municipio;

CREATE TABLE municipio (
    nr_sequencia      INTEGER
        CONSTRAINT nr_seq_municipio_pk PRIMARY KEY,
    dt_criacao        DATE,
    dt_alteracao      DATE,
    cd_municipio_ibge NUMBER(7) NOT NULL
        CONSTRAINT cd_municipio_ibge_un UNIQUE,
    ds_municipio      VARCHAR2(255)
);
--PESSOA FISICA
alter table pessoa_fisica add constraint nr_seq_pf_pk primary key(nr_sequencia);
alter table pessoa_fisica add constraint pessoa_fisica_cpf_un  unique(nr_cpf);
drop table pessoa_fisica;

CREATE TABLE pessoa_fisica (
    nr_sequencia     INTEGER
        CONSTRAINT nr_seq_pf_pk PRIMARY KEY,
    dt_criacao       DATE,
    dt_alteracao     DATE,
    nm_pessoa_fisica VARCHAR2(255),
    dt_nascimento    DATE,
    nr_cpf           VARCHAR2(11)
        CONSTRAINT pessoa_fisica_cpf_un UNIQUE,
    qt_altura        NUMBER(3, 2)
);

-- PESSOA FISICA ENDEREÇO
alter table pessoa_fisica_endereco add constraint nr_seq_end_pf_pk primary key(nr_sequencia);
alter table pessoa_fisica_endereco add constraint nr_seq_pf_end_fk foreign key(nr_seq_pessoa_fisica) references pessoa_fisica(nr_sequencia);
alter table pessoa_fisica_endereco add constraint nr_seq_uf_end_fk foreign key(nr_seq_uf) references uf(nr_sequencia);
alter table pessoa_fisica_endereco add constraint nr_seq_municipio_end_fk foreign key(nr_seq_municipio) references municipio(nr_sequencia);
alter table pessoa_fisica_endereco modify (nr_seq_pessoa_fisica not null);
drop table pessoa_fisica_endereco;

CREATE TABLE pessoa_fisica_endereco (
    nr_sequencia         INTEGER
        CONSTRAINT nr_seq_end_pf_pk PRIMARY KEY,
    dt_criacao           DATE,
    dt_alteracao         DATE,
    nr_seq_pessoa_fisica INTEGER NOT NULL,
    CONSTRAINT nr_seq_pf_end_fk FOREIGN KEY ( nr_seq_pessoa_fisica )
        REFERENCES pessoa_fisica ( nr_sequencia ),
    nr_seq_uf            INTEGER,
    CONSTRAINT nr_seq_pf_uf_fk FOREIGN KEY ( nr_seq_uf )
        REFERENCES uf ( nr_sequencia ),
    nr_seq_municipio     INTEGER,
    CONSTRAINT nr_seq_pf_municipio_fk FOREIGN KEY ( nr_seq_municipio )
        REFERENCES municipio ( nr_sequencia ),
    ds_logradouro        VARCHAR(255),
    nr_endereco          INTEGER,
    ds_bairro            VARCHAR2(255),
    nr_cep               NUMBER(8)
);


---------------
create table teste(a1 varchar2(2), b1 number);
alter table teste add constraint a1_ck check (a1 = 'X');
alter table teste add constraint b1_ck check (b1 >= 1);

select * from teste;

insert into teste(a1) values ('X');
insert into teste(b1) values (1);

----------------------------
--DESAFIO
--ADICIONAR UMA COLUNA CHAMADA SEXO DO TIPO VARCHAR2(1) NA TABELA PESSOA_FISICA
--CRIAR UMA CONSTRAINT SEXO_CK RECEBER APENAS AS LETRAS (F M I

select * from pessoa_fisica;

alter table pessoa_fisica add sexo varchar2(1);
alter table pessoa_fisica add constraint sexo_ck CHECK(sexo IN ('F', 'M', 'I'));

INSERT INTO pessoa_fisica(SEXO) VALUES 'M';


