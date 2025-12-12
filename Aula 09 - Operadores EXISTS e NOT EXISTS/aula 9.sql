--Operadores EXISTS e NOT EXISTS
--1)
select 
    pf.nr_sequencia,
    pf.dt_nascimento,
    pf.nm_pessoa_fisica,
    pfe.nr_seq_municipio,
    m.ds_municipio
from pessoa_fisica pf
left join pessoa_fisica_endereco pfe on(pf.nr_sequencia = pfe.nr_seq_pessoa_fisica)
left join municipio m on(m.nr_municipio = pfe.nr_seq_municipio)
where pfe.nr_sequencia in null;

--2) msm coisa q o de cima 
SELECT
    pf.nr_sequencia,
    dt_nascimento,
    pf.nm_pessoa_fisica
FROM
    pessoa_fisica pf
where NOT exists(
    select 1
    from pessoa_fisica_endereco w
    where w.nr_seq_pessoa_fisica = pf.nr_sequencia
);
