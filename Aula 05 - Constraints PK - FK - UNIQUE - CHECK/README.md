## 📘 Aula 05 — Constraints (PK, FK, UNIQUE, CHECK)

### 📌 Resumo da Aula
Nesta aula estudamos as **constraints**, mecanismos fundamentais para garantir a integridade dos dados no Oracle Database.
Elas definem regras que controlam como os dados podem ser inseridos, alterados ou excluídos.

As principais constraints abordadas foram:

- **PRIMARY KEY (PK):** identifica cada registro de forma única.
- **FOREIGN KEY (FK):** cria relacionamento entre tabelas.
- **UNIQUE:** garante que valores não se repitam.
- **CHECK:** restringe valores permitidos para uma coluna.
- **NOT NULL:** impede que um campo aceite valores nulos.

Também vimos como declarar constraints no momento da criação da tabela ou adicioná-las posteriormente com `ALTER TABLE`.

---

### 🛠️ Exemplos de Uso

#### ➤ Criar tabela com constraints
```sql
CREATE TABLE clientes (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(50) NOT NULL,
    documento VARCHAR2(20) UNIQUE,
    idade NUMBER CHECK (idade >= 18)
);
