## 📘 Aula 03 — Users / Roles / Grants

### 📌 Resumo da Aula
Nesta aula aprendemos como administrar usuários e permissões no Oracle Database.
Foram abordados três conceitos fundamentais:

1. **Users (Usuários):**
   Representam contas que podem se conectar ao banco e executar ações.
   Cada usuário possui senha, permissões e espaço de armazenamento.

2. **Roles (Papéis):**
   São conjuntos de permissões agrupadas, facilitando a administração e permitindo conceder vários privilégios de uma só vez.

3. **Grants (Concessões de Privilégios):**
   São usados para permitir que usuários executem ações como conectar ao banco, criar tabelas, consultar dados ou acessar objetos de outros usuários.

A aula demonstra como criar usuários, atribuir roles e conceder privilégios essenciais, como *CREATE SESSION*, necessário para realizar login no Oracle.

---

### 🛠️ Comandos Principais

#### ➤ Criar um usuário
```sql
CREATE USER nome IDENTIFIED BY senha;
```
#### ➤ Permitir conexão ao banco
```sql
GRANT CREATE SESSION TO nome;
```
#### ➤ Conceder permissões básicas de desenvolvimento
```sql
GRANT CONNECT, RESOURCE TO nome;
```
#### ➤ Criar uma role personalizada
```sql
CREATE ROLE minha_role;
```
#### ➤ Criar uma role personalizada
```sql
GRANT CREATE TABLE TO minha_role;
```
#### ➤ Atribuir role a um usuário
```sql
GRANT minha_role TO nome;
```
### 🧠 Conceitos-Chave
Usuário: entidade que acessa o banco.
Role: conjunto de permissões agrupadas para facilitar administração.
Grant: comando usado para conceder privilégios.
CREATE SESSION: necessário para login no Oracle.
Privilégios de sistema: permitem criar tabelas, views, procedures etc.

Privilégios de objeto: permitem SELECT, INSERT, UPDATE e DELETE em tabelas específicas.
