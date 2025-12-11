SELECT
    a.nr_sequencia      "Seq",
    a.cd_municipio_ibge "Cod Municipio",
    a.ds_municipio      "Municipio",
    a.cd_uf_ibge        "Cod UF"
FROM
    municipio a
WHERE
    a.cd_uf_ibge IN ( 21, 15 )
    AND ( a.ds_municipio LIKE '%São%'
          OR a.ds_municipio LIKE '%Santa%' );

