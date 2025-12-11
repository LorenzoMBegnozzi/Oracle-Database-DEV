## 📘 Aula 06 — CREATE SEQUENCE + INSERT INTO + SQL*Plus

### 📌 Resumo da Aula
Nesta aula aprendemos a trabalhar com **SEQUENCES**, objetos do Oracle utilizados para gerar valores automáticos, normalmente usados em chaves primárias.
Também revisamos o comando **INSERT INTO**, utilizado para inserir dados nas tabelas, e vimos o uso básico do **SQL\*Plus**, ferramenta de linha de comando do Oracle.

A aula mostrou como:
- Criar sequences para gerar números sequenciais
- Usar `NEXTVAL` e `CURRVAL`
- Inserir registros usando valores automáticos
- Executar comandos no ambiente SQL\*Plus

---

### 🛠️ Comandos Principais

#### ➤ Criar uma SEQUENCE
```sql
CREATE SEQUENCE seq_cliente
START WITH 1
INCREMENT BY 1
NOCACHE;
```
#### ➤ Usar a SEQUENCE ao inserir dados
```sql
INSERT INTO clientes (id, nome)
VALUES (seq_cliente.NEXTVAL, 'João');
```
#### ➤ Ver valor atual da SEQUENCE
```sql
SELECT seq_cliente.CURRVAL FROM dual;
```
#### ➤ Inserção simples com INSERT INTO
```sql
INSERT INTO clientes (id, nome, idade)
VALUES (1, 'Maria', 30);
```
### 🧠 Conceitos-Chave

- **SEQUENCE**
  - Gera números sequenciais automaticamente
  - Muito usada em colunas de chave primária
  - Usa `NEXTVAL` para obter o próximo valor
  - Usa `CURRVAL` para obter o valor atual

- **INSERT INTO**
  - Insere novos registros nas tabelas
  - Pode usar sequences para auto numeração

- **SQL*Plus**
  - Ferramenta de linha de comando do Oracle
  - Permite executar scripts, comandos SQL e visualizar resultados

### ✅ Exemplo Completo da Aula

```sql
-- Criar sequence
CREATE SEQUENCE seq_cliente
START WITH 1
INCREMENT BY 1;

-- Criar tabela
CREATE TABLE clientes (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(50),
    idade NUMBER
);

-- Inserir valores usando a sequence
INSERT INTO clientes (id, nome, idade)
VALUES (seq_cliente.NEXTVAL, 'Ana', 25);

-- Ver o valor atual
SELECT seq_cliente.CURRVAL FROM dual;

```
