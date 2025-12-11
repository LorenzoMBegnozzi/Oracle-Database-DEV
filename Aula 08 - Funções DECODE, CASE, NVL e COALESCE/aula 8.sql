--Aula 08 - Funções DECODE, CASE, NVL e COALESCE
--DECODE
SELECT
    nr_sequencia,
    nm_pessoa_fisica,
    dt_nascimento,
    sexo,
    decode(sexo, 'M', 'Masculino', 'F', 'Feminino',
           'Não informado')ds_sexo 
FROM
    pessoa_fisica a;
    
--CASE
select nr_sequencia,
    nm_pessoa_fisica,
    dt_nascimento,
    sexo,
    case when sexo = 'M' then 'Masculino'
        when sexo = 'F' then 'Feminino'
        else 'Não informado'
    end ds_sexo
from pessoa_fisica a;

--CASE 2

with param as  (
    select '01/01/1950' dt_in,
    '01/01/1960' dt_fin 
    from dual
),

pf AS (
    select nr_sequencia,
    nm_pessoa_fisica,
    dt_nascimento,
    sexo,
    to_number(to_char(sysdate,'yyyy')) - to_number(to_char(dt_nascimento,'yyyy'))qt_idade,
    'asd' teste
    from pessoa_fisica pf_fis
    join param sp on dt_nascimento BETWEEN sp.dt_in and sp.dt_fin
)

SELECT nr_sequencia,
    nm_pessoa_fisica,
    dt_nascimento,
    sexo,
    qt_idade,
    case when qt_idade BETWEEN 1 and 60 then 'Jovem'
        when qt_idade BETWEEN 61 and 9999 then 'Idoso'
        else 'Não informado'
    end ds_faixa_etaria,
    teste
from pf a;

commit;