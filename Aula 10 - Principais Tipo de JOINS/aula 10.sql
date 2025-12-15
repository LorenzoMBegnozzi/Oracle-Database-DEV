--Principais Tipo de JOINS
--INNER JOIN --> ou JOIN --> tras oq tem de igual ambas as tabelas
SELECT
    pf.nr_sequencia,
    pf.nm_pessoa_fisica,
    pf.dt_nascimento,
    m.ds_municipio,
    uf.ds_uf
FROM pessoa_fisica pf
join pessoa_fisica_endereco pfe on(pf.nr_sequencia = pfe.nr_seq_pessoa_fisica)
join municipio m on(m.nr_sequencia = pfe.nr_seq_municipio)
join uf on(uf.nr_sequencia = pfe.nr_seq_uf);

--LEFT JOIN --> (exemplo: se tiver endereço traz, caso n tenha, traz tambem)
SELECT
    pf.nr_sequencia,
    pf.nm_pessoa_fisica,
    pf.dt_nascimento,
    m.ds_municipio,
    uf.ds_uf
FROM pessoa_fisica pf
left join pessoa_fisica_endereco pfe on(pf.nr_sequencia = pfe.nr_seq_pessoa_fisica)
left join municipio m on(m.nr_sequencia = pfe.nr_seq_municipio)
left join uf on(uf.nr_sequencia = pfe.nr_seq_uf);


select 
    pf.nr_sequencia,
    pf.nm_pessoa_fisica,
    pf.dt_nascimento,
    m.ds_municipio,
    uf.ds_uf
from pessoa_fisica pf
join pessoa_fisica_endereco pfe on (pf.nr_sequencia = pfe.nr_seq_pessoa_fisica)
join municipio m on (m.nr_sequencia = pfe.nr_seq_municipio)
join uf on (uf.nr_sequencia = pfe.nr_seq_uf);




