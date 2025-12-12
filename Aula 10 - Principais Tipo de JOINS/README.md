## 📘 Aula 10 — Principais Tipos de JOINS em SQL

### 📌 Resumo da Aula
Nesta aula aprendemos os **principais tipos de JOIN** em SQL, que são usados para **combinar dados entre duas ou mais tabelas** com base em colunas relacionadas.
Os JOINs permitem que você junte informações de tabelas diferentes para responder perguntas mais completas e obter resultados mais ricos nas suas consultas SQL.

Os tipos de JOIN estudados foram:

- **INNER JOIN**
- **LEFT JOIN**
- (E outros tipos — RIGHT JOIN, FULL JOIN, CROSS JOIN — conforme contexto e necessidade)

---

### 🧠 O que é um JOIN?
Um **JOIN** em SQL é uma cláusula que combina dados de duas (ou mais) tabelas baseando-se em uma **condição de relacionamento**, normalmente usando chaves que conectam essas tabelas. :contentReference[oaicite:1]{index=1}

---

### 🛠️ Sintaxe Básica dos JOINs

#### ➤ INNER JOIN
Retorna apenas os registros que têm **correspondências nas duas tabelas**:

```sql
SELECT t1.coluna1, t2.coluna2
FROM tabela1 t1
INNER JOIN tabela2 t2
    ON t1.chave = t2.chave;
```

#### ➤ LEFT JOIN
```sql
SELECT t1.coluna1, t2.coluna2
FROM tabela1 t1
LEFT JOIN tabela2 t2
    ON t1.chave = t2.chave;
```

#### ➤ RIGHT JOIN
```sql
SELECT t1.coluna1, t2.coluna2
FROM tabela1 t1
RIGHT JOIN tabela2 t2
    ON t1.chave = t2.chave;
```

#### ➤ FULL JOIN
```sql
SELECT t1.coluna1, t2.coluna2
FROM tabela1 t1
FULL JOIN tabela2 t2
    ON t1.chave = t2.chave;
```

#### ➤ CROSS JOIN
```sql
SELECT *
FROM tabela1
CROSS JOIN tabela2;
```


## 📌 Conceitos-Chave dos JOINs

### 🔹 INNER JOIN
- Retorna apenas os registros que **existem em ambas as tabelas** com base na condição de junção.
- Útil quando você precisa associar dados que têm **relação direta** entre tabelas.

---

### 🔹 LEFT JOIN
- Retorna **todos os registros da tabela esquerda**, mesmo que não haja correspondência na tabela direita.
- Os campos da tabela direita ficarão como **NULL** quando não houver correspondência.

---

### 🔹 RIGHT JOIN
- Semelhante ao **LEFT JOIN**, mas mantém **todos os registros da tabela direita**.
- Os campos da tabela esquerda ficarão como **NULL** quando não houver correspondência.

---

### 🔹 FULL JOIN
- Combina **LEFT JOIN** e **RIGHT JOIN**.
- Retorna **todas as linhas de ambas as tabelas**, com valores **NULL** onde não existe correspondência.

---

### 🔹 CROSS JOIN
- Combina **todas as linhas** de ambas as tabelas.
- Gera o **produto cartesiano**, sem necessidade de condição de junção.

---

## 🧾 Exemplos Práticos

### ➤ INNER JOIN — Clientes com pedidos
```sql
SELECT c.nome, p.id_pedido
FROM clientes c
INNER JOIN pedidos p
    ON c.id_cliente = p.cliente_id;
```

### ➤ LEFT JOIN — Todos os clientes e seus pedidos (caso existam)
```sql
SELECT c.nome, p.id_pedido
FROM clientes c
LEFT JOIN pedidos p
    ON c.id_cliente = p.cliente_id;
```

### ➤ RIGHT JOIN — Todos os pedidos e seus clientes (caso existam)
```sql
SELECT c.nome, p.id_pedido
FROM clientes c
RIGHT JOIN pedidos p
    ON c.id_cliente = p.cliente_id;
```
