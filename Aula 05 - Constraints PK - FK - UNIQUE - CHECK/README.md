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
```

#### ➤ Criar FOREIGN KEY relacionando duas tabelas
```sql
CREATE TABLE pedidos (
    id NUMBER PRIMARY KEY,
    cliente_id NUMBER,
    valor NUMBER CHECK (valor > 0),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
```

#### ➤ Adicionar uma constraint depois da criação da tabela
```sql
ALTER TABLE clientes 
ADD CONSTRAINT ck_idade CHECK (idade >= 18);
);
```

### 🧠 Conceitos-Chave

- **PRIMARY KEY**
  - Identifica um registro de forma única  
  - Não aceita valores nulos  
  - Não permite duplicação  

- **FOREIGN KEY**
  - Relaciona tabelas  
  - Garante integridade referencial  
  - Impede excluir registros que estão sendo referenciados  

- **UNIQUE**
  - Garante que valores não se repitam em uma coluna  

- **CHECK**
  - Impõe regras sobre valores (ex.: `valor > 0`)  

- **NOT NULL**
  - Obrigatório preencher o campo  


### ✅ Exemplo Completo da Aula
```sql
-- Criar tabela clientes
CREATE TABLE clientes (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(50) NOT NULL,
    documento VARCHAR2(20) UNIQUE
);

-- Criar tabela pedidos com relacionamento
CREATE TABLE pedidos (
    id NUMBER PRIMARY KEY,
    cliente_id NUMBER REFERENCES clientes(id),
    valor NUMBER CHECK (valor > 0)
);

-- Criar constraint depois da tabela
ALTER TABLE clientes
ADD CONSTRAINT ck_nome CHECK (LENGTH(nome) > 0);
);
```
