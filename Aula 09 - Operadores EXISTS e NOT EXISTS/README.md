## 📘 Aula 09 — Operadores EXISTS e NOT EXISTS

### 📌 Resumo da Aula
Nesta aula aprendemos a utilizar os operadores **EXISTS** e **NOT EXISTS**, muito importantes em consultas SQL que envolvem **subconsultas correlacionadas**.

Esses operadores são usados para verificar a **existência ou inexistência de registros** em uma subconsulta, sem a necessidade de retornar valores dela. O foco está em filtrar resultados com base em relacionamentos entre tabelas.

As funções estudadas foram:

- **EXISTS:** verifica se a subconsulta retorna pelo menos um registro.
- **NOT EXISTS:** verifica se a subconsulta não retorna nenhum registro.

---

### 🛠️ Sintaxe Básica

#### ➤ Uso do EXISTS
```sql
SELECT coluna
FROM tabela_principal p
WHERE EXISTS (
    SELECT 1
    FROM tabela_relacionada r
    WHERE r.id_fk = p.id
);
```

#### ➤ Uso do NOT EXISTS
```sql
SELECT coluna
FROM tabela_principal p
WHERE NOT EXISTS (
    SELECT 1
    FROM tabela_relacionada r
    WHERE r.id_fk = p.id
);
```

## 🧠 Conceitos-Chave

### 🔹 EXISTS
- Retorna **TRUE** se a subconsulta retornar **ao menos uma linha**.
- Não importa quais colunas são retornadas, apenas se **existe resultado**.
- Muito eficiente em **grandes volumes de dados**.
- Geralmente utilizado com **subconsultas correlacionadas**.

### 🔹 NOT EXISTS
- Retorna **TRUE** se a subconsulta **não retornar nenhuma linha**.
- Ideal para encontrar registros **sem relacionamento** em outra tabela.
- Mais seguro que **NOT IN** quando existem valores **NULL**.

---

## 🧾 Exemplos Práticos da Aula

### ➤ Listar clientes que possuem pedidos
```sql
SELECT c.nome
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM pedidos p
    WHERE p.cliente_id = c.cliente_id
);
