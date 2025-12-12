--DECODE
select nr_sequencia,
    nm_pessoa_fisica,
    dt_nascimento,
    sexo,
    decode(sexo, 'M','Masculino', 'F', 'Femino','Não informado')ds_sexo
from pessoa_fisica a;

--CASE 1
SELECT
    nr_sequencia,
    nm_pessoa_fisica,
    dt_nascimento,
    sexo,
    CASE
        WHEN sexo = 'M' THEN
            'Masculino'
        WHEN sexo = 'F' THEN
            'Feminino'
        ELSE
            'Não informado'
    END ds_sexo
FROM
    pessoa_fisica a;
    
--CASE 2
SELECT
    nr_sequencia,
    nm_pessoa_fisica,
    dt_nascimento,
    sexo,
    to_number(to_char(sysdate,'yyyy')) - to_number(to_char(dt_nascimento,'yyyy'))qt_idade,
    case when to_number(to_char(sysdate,'yyyy')) - to_number(to_char(dt_nascimento,'yyyy'))BETWEEN 1 and 60 and sexo = 'M' then 'Jovem Homem'
        when to_number(to_char(sysdate,'yyyy')) - to_number(to_char(dt_nascimento,'yyyy'))BETWEEN 1 and 60 and sexo = 'F' then 'Jovem Mulher'
         when to_number(to_char(sysdate,'yyyy')) - to_number(to_char(dt_nascimento,'yyyy'))BETWEEN 60 and 9999 then 'Idoso'
            else 'Não informado'
    end ds_faixa_etaria
from pessoa_fisica a;


--NVl (onde n tem valor, coloca null)
select nr_sequencia,
    nm_pessoa_fisica,
    dt_nascimento,
    sexo,
    nvl(sexo,'Não informado')ds_sexo
from pessoa_fisica a;


--COALESCE
select 
    nr_sequencia,
    nm_pessoa_fisica,
    dt_nascimento,
    sexo,
    qt_altura,
    coalesce(sexo,to_char(qt_altura),nm_pessoa_fisica, 'Não informado')ds_sexo
from pessoa_fisica a;












