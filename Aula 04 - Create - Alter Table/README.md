## 📘 Aula 04 — CREATE TABLE / ALTER TABLE

### 📌 Resumo da Aula
Nesta aula aprendemos os comandos fundamentais de **DDL (Data Definition Language)** responsáveis por criar e modificar estruturas no Oracle Database.
Foram abordados dois comandos principais:

1. **CREATE TABLE:**
   Utilizado para criar novas tabelas no banco, definindo colunas, tipos de dados e constraints.

2. **ALTER TABLE:**
   Usado para modificar estruturas existentes — adicionando, alterando ou removendo colunas e constraints.

A aula foca na estruturação correta de tabelas, organização dos tipos de dados e boas práticas na criação de objetos no banco.

---

### 🛠️ Comandos Principais

#### ➤ Criar uma tabela
```sql
CREATE TABLE clientes (
    id NUMBER,
    nome VARCHAR2(50),
    idade NUMBER
);
```
#### ➤ Adicionar uma coluna
```sql
ALTER TABLE clientes 
ADD email VARCHAR2(80);
```
#### ➤ Modificar o tipo ou tamanho de uma coluna
```sql
ALTER TABLE clientes 
MODIFY idade NUMBER(3);
```
#### ➤ Remover uma coluna
```sql
ALTER TABLE clientes 
DROP COLUMN email;
```
#### ➤ Renomear uma tabela
```sql
ALTER TABLE clientes 
RENAME TO clientes_ativos;
```
#### ➤ Renomear uma coluna
```sql
ALTER TABLE clientes 
RENAME COLUMN nome TO nome_completo;
```

### 🧠 Conceitos-Chave
- **DDL (Data Definition Language):** grupo de comandos que alteram a estrutura do banco.

- **CREATE TABLE:** cria uma nova tabela.

- **ALTER TABLE:** modifica uma tabela existente.

- **Tipos de dados comuns:**
  - `NUMBER` → números  
  - `VARCHAR2(n)` → textos  
  - `DATE` → datas

- **Boas práticas:**
  - Usar nomes descritivos  
  - Definir tipos corretos para evitar inconsistências  
  - Planejar antes de criar estruturas

### ✅ Exemplo Completo da Aula
```sql
-- Criar tabela
CREATE TABLE clientes (
    id NUMBER,
    nome VARCHAR2(50),
    idade NUMBER
);

-- Adicionar coluna de e-mail
ALTER TABLE clientes ADD email VARCHAR2(80);

-- Corrigir tamanho da coluna idade
ALTER TABLE clientes MODIFY idade NUMBER(3);

-- Renomear coluna
ALTER TABLE clientes RENAME COLUMN nome TO nome_completo;

```

