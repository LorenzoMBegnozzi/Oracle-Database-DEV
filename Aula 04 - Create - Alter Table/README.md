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
