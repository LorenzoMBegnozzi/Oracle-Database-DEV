--Principais Tipo de JOINS
--INNER JOIN
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

--LEFT JOIN
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

commit;