--Aula 06 - CREATE SEQUENCE + INSERT INTO + SQLPLUS 
alter table pessoa_fisica add(sexo varchar2(1));
alter table pessoa_fisica add constraint pf_sexo_ck check(sexo in('M', 'F', 'I');


--SEQUENCE
create sequence pessoa_fisica_seq
    start with 1 --comeca no 1
    increment by 1 --vai de um em um 
    maxvalue 999999 --até o valor
    minvalue 1 
    nocache;
    
create sequence uf_seq
    start with 1 
    increment by 1
    maxvalue 999999
    minvalue 1
    nocache;
    
create sequence municipio_seq
    start with 1
    increment by 1
    maxvalue 9999999
    minvalue 1
    nocache;


--insert into
--1) aqui estamos especificando as coluna e dando um valor depois
insert into uf(nr_sequencia, dt_criacao, cd_uf_ibge, sg_uf, ds_uf)
values(uf_seq.nextval, sysdate, 12, 'SC', 'Santa Catarina');
--2) aqui estamos dando os valores somente, mas temos que seguir a ordem da tebela 
insert into uf
values(uf_seq.nextval, sysdate,sysdate, 12, 'PR', 'Santa Catarina');


select * from municipio;
alter table municipio add(cd_uf_ibge number(2));
alter table municipio add constraint municipio_uf_ibge_fk foreign key(cd_uf_ibge)references uf(cd_uf_ibge);
 


