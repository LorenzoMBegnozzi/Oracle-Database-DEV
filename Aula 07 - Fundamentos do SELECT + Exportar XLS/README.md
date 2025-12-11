## 📘 Aula 07 — Fundamentos do SELECT + Exportar XLS

### 📌 Resumo da Aula
Nesta aula aprendemos os fundamentos do comando **SELECT**, utilizado para consultar dados no Oracle Database.
Foram abordados conceitos essenciais como:

- Seleção de colunas
- Filtragem de registros com `WHERE`
- Ordenação com `ORDER BY`
- Exportação de dados para Excel (XLS) usando SQL Developer

O foco da aula é entender como consultar, filtrar, ordenar e visualizar dados de forma eficiente.

---

### 🛠️ Comandos Principais

#### ➤ Seleção básica de dados
```sql
SELECT coluna1, coluna2
FROM tabela;
```
#### ➤ Seleção de todos os campos
```sql
SELECT * FROM tabela;
```
#### ➤ Filtrar registros com WHERE
```sql
SELECT nome, idade
FROM clientes
WHERE idade >= 18;
```
#### ➤ Ordenar resultados com ORDER BY
```sql
SELECT nome, idade
FROM clientes
ORDER BY idade DESC;
```
#### ➤ Filtro combinado com operadores lógicos
```sql
SELECT nome, idade
FROM clientes
WHERE idade >= 18 AND idade <= 60;
```

### 🧠 Conceitos-Chave

- **SELECT:** consulta dados existentes nas tabelas.
- **WHERE:** filtra registros com base em condições.
- **ORDER BY:** organiza resultados (ascendente ou descendente).
- **Operadores lógicos:** `AND`, `OR`, `NOT`.
- **Exportação para XLS:** realizada via SQL Developer (botão direito → Export → XLS).
