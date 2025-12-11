create table lorenzoteste(teste number(6));

create table pessoa_fisica(id_pessoa integer, dt_criacao date, data_alteracao date,  nm_pessoa_fisica varchar2(255),
data_nascimento date, nr_cpf varchar2(11), qt_altura number(3,2));

create table municipio(id_municipio integer, dt_descricao date, dt_alteracao date, cd_municipio_ibge number (7), ds_municipio varchar2(255));

create table pessoa_fisica_endereco(id_pessoa_fisica_endereco integer, dt_criacao date, nr_seq_pessoa_fisica integer, nr_seq_uf integer,
nr_seq_municipio integer, ds_logradouro varchar(255), nr_endereco integer, ds_bairro varchar2(255), nd_cpf number(8));

select * from pessoa_fisica;

insert into pessoa_fisica (id_pessoa, nm_pessoa_fisica, qt_altura) values(1, 'João', 1.70);

-------------------alter table 
--alterando tipo da coluna 
alter table pessoa_fisica add(teste number(10));
alter table pessoa_fisica modify (teste number(5,3));
--alterando nome da coluna
alter table pessoa_fisica rename column teste to teste_novo;
alter table pessoa_fisica rename column teste_novo to teste;
--alterando nome da tebela
alter table pessoa_fisica rename to pessoa_fisica_alterado;
 
 




