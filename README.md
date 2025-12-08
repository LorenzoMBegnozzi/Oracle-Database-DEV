# Trilha de Estudos — Oracle Database (DEV) 🚀  
**Do zero ao avançado (12 semanas)**

> Objetivo: dominar **SQL + Modelagem ER + DML (INSERT/UPDATE/DELETE) + PL/SQL + Performance** no contexto de desenvolvimento.  
> Regra do jogo: **70% prática / 30% teoria**.  
> Rotina sugerida: **Seg–Sex 60–90min/dia + Sábado 2–3h**.

---

## Semana 1 — Fundamentos + Modelagem ER (o “esqueleto”)

### Estudar
- Conceitos: **entidade**, **atributo**, **relacionamento**, **cardinalidade** (1:1, 1:N, N:N), **opcionalidade**
- Chaves: **PK**, **FK**, **natural** vs **surrogate** (ID)
- Normalização: **1FN/2FN/3FN** (só o necessário)
- Mapeamento **ER → relacional** (principalmente N:N com tabela associativa)

### Fazer (entrega)
- Desenhar o **DER** do projeto “Loja”:
  - `CLIENTE`, `PRODUTO`, `PEDIDO`, `ITEM_PEDIDO`, `PAGAMENTO`
- Definir regras:
  - cliente tem **email único**
  - pedido tem **status** (`ABERTO`, `PAGO`, `CANCELADO`, `ENVIADO`)
  - `item_pedido` guarda **preço do momento** (não depender do preço atual do produto)

### Exercícios
- Liste **10 entidades** do mundo real e transforme em **tabelas**.
- Crie **3 exemplos de N:N** e resolva com **tabela associativa**.
- Faça **5 perguntas de negócio** e valide se seu DER responde (ex.: “produtos mais vendidos por mês”).

---

## Semana 2 — Oracle + DDL bem feito (tabelas, constraints, índices)

### Estudar
- Tipos Oracle: `NUMBER`, `VARCHAR2`, `DATE`, `TIMESTAMP`, `CLOB`
- Constraints: `NOT NULL`, `CHECK`, `UNIQUE`, `PK`, `FK`
- `SEQUENCE` e uso com `NEXTVAL`
- Índices: o que é, quando ajuda, índice composto

### Fazer (entrega)
- Criar o schema com **DDL completo**:
  - PKs (IDs numéricos), FKs, checks de status
  - índices nas FKs e campos de busca (ex.: email)

### Exercícios
- Modele `STATUS_PEDIDO` como **tabela de domínio** e também como **CHECK** (entenda prós/contras).
- Crie cenário de FK com delete:
  - tente deletar cliente com pedido (entenda o erro)
- Crie `SEQUENCE` para cada tabela principal e teste inserts.

---

## Semana 3 — SELECT básico + funções (ficar fluente)

### Estudar
- `SELECT ... FROM ... WHERE ...`
- `IN`, `BETWEEN`, `LIKE`, `IS NULL`
- `ORDER BY`, `DISTINCT`
- Funções: `UPPER/LOWER`, `SUBSTR`, `TRIM`
- `NVL/COALESCE`, `CASE WHEN`
- Datas: `SYSDATE`, `TRUNC`, `ADD_MONTHS`

### Fazer (entrega)
- Criar massa de dados pequena: **20 clientes, 30 produtos, 50 pedidos**

### Exercícios (30 queries)
- **10** filtros (inclui `NULL`)
- **10** com funções (texto/data/case)
- **10** com ordenação/limite (Oracle: `FETCH FIRST n ROWS ONLY`)

---

## Semana 4 — JOIN de verdade (modelo mental ER → SQL)

### Estudar
- `INNER JOIN`, `LEFT JOIN`
- Como evitar “cartesiano”
- Entender duplicação por join (cardinalidade)
- Boas práticas: alias, colunas qualificadas, join por FK

### Fazer (entrega)
- Consultas prontas para:
  - pedidos com cliente
  - itens com produto
  - pedido com total calculado (ainda sem group complexo)

### Exercícios (25 queries)
- Clientes com e sem pedidos (`LEFT` + `NULL`)
- Produtos nunca vendidos
- Pedidos com mais de X itens
- “Explodir” pedido → itens → produto

---

## Semana 5 — Agregação + subqueries (relatórios reais)

### Estudar
- `GROUP BY`, `HAVING`
- Agregações com join
- Subquery escalar vs correlacionada
- `EXISTS/NOT EXISTS` (muito usado em Oracle)

### Fazer (entrega)
- Relatórios:
  - faturamento por mês
  - top 5 clientes por valor
  - produtos encalhados (`NOT EXISTS`)

### Exercícios
- Reescreva 5 queries usando `EXISTS` em vez de `IN` (e vice-versa).
- Faça “ticket médio” por mês.
- Faça “% de pedidos cancelados” por mês.

---

## Semana 6 — DML completo + transações (INSERT/UPDATE/DELETE “sem medo”)

### Estudar
- `INSERT` (values, insert-select)
- `UPDATE` com subquery
- `DELETE` vs `TRUNCATE`
- `COMMIT`, `ROLLBACK`, `SAVEPOINT`
- Oracle: `RETURNING INTO`

### Fazer (entrega)
- Roteiro transacional (manual) de “fechar pedido”:
  1. inserir pagamento  
  2. atualizar status do pedido  
  3. registrar baixa de estoque  
  4. `COMMIT`  
  - se falhar, `ROLLBACK` / `SAVEPOINT`

### Exercícios
- Simule erro no passo 3 e faça rollback.
- Atualize preço de produtos por categoria (+10%).
- Delete pedidos `CANCELADO` antigos, entendendo impacto de FK.

---

## Semana 7 — Qualidade de dados + regras (pensar como sistema)

### Estudar
- Integridade: o que colocar em constraint vs no app vs PL/SQL
- Tabelas de domínio (status/tipo)
- Auditoria (quando vale)
- Boas práticas de nomes e padrões

### Fazer (entrega)
- Ajustar schema:
  - status como domínio (ou manter check e justificar)
  - criar `ESTOQUE_MOV` (entrada/saída) pra rastreio
  - criar “soft delete” onde fizer sentido (ex.: produto inativo)

### Exercícios
- Implemente “produto inativo” e garanta que não entra em novos pedidos.
- Garanta que `item_pedido` não aceita quantidade <= 0 (`CHECK`).
- Faça uma rotina de “consistência”: pedidos pagos devem ter pagamento.

---

## Semana 8 — PL/SQL básico (começar a programar no banco)

### Estudar
- Bloco PL/SQL (`DECLARE/BEGIN/END`)
- Variáveis, `IF`, loops
- Exceções (`EXCEPTION WHEN`)
- SQL dentro do PL/SQL (`SELECT ... INTO`)

### Fazer (entrega)
- Função `calc_total_pedido(p_pedido_id)`
- Procedure `recalcular_total_pedido(p_pedido_id)` (atualiza total)

### Exercícios
- Criar procedure que cancela pedido e desfaz estoque (se houver).
- Tratar exceção quando pedido não existir.
- Criar log simples em tabela `LOG_ERRO`.

---

## Semana 9 — PL/SQL “de projeto”: packages + trigger com critério

### Estudar
- `PACKAGE` (spec/body), encapsulamento
- Boas práticas: transação dentro ou fora? (em geral: consistente)
- Trigger: quando usar e quando evitar

### Fazer (entrega)
- `pkg_pedidos` com:
  - `criar_pedido`
  - `adicionar_item`
  - `fechar_pedido`
- Trigger leve (opcional) para auditoria de preço de produto:
  - grava histórico `PRODUTO_PRECO_HIST`

### Exercícios
- Faça um trigger e depois refaça sem trigger (pra sentir prós/contras).
- Garanta que `fechar_pedido` não fecha pedido sem itens.
- Garanta que não vende sem estoque (regra).

---

## Semana 10 — SQL avançado (CTE + analíticas: diferencial)

### Estudar
- `WITH` (CTE)
- Analíticas: `ROW_NUMBER`, `DENSE_RANK`, `LAG/LEAD`
- `SUM(...) OVER (PARTITION BY ...)`

### Fazer (entrega)
- Relatórios avançados:
  - ranking de clientes por mês (com empate)
  - variação mês a mês do faturamento (`LAG`)
  - acumulado no ano (running total)

### Exercícios
- Curva ABC de produtos.
- “Top 3 produtos por categoria por mês”.
- “Clientes que compraram em meses consecutivos” (`LAG`).

---

## Semana 11 — MERGE + staging (carga e sincronização)

### Estudar
- `MERGE INTO` (upsert)
- Estratégia de staging: `STG_*`
- Deduplicação (`ROW_NUMBER` pra pegar “última versão”)

### Fazer (entrega)
- `STG_PRODUTO_PRECO` e rotina:
  - limpar/deduplicar
  - `MERGE` atualizando `PRODUTO`
  - registrar histórico de alterações

### Exercícios
- Deduplicar staging por (sku) pegando registro mais recente.
- Bloquear update se preço vier negativo.
- Gerar relatório de “alterações aplicadas”.

---

## Semana 12 — Performance para DEV (o que te dá emprego)

### Estudar
- `EXPLAIN PLAN` (noção)
- Índices e seletividade
- Anti-patterns:
  - função na coluna indexada
  - `LIKE '%texto%'`
  - join errado
- Reescritas: `EXISTS`, CTE, filtros antes de join

### Fazer (entrega)
- Escolher 5 queries do seu projeto:
  - medir (tempo aproximado)
  - ver plano
  - otimizar (índice/reescrita)
  - documentar “antes/depois”

### Exercícios
- Criar índice composto e comparar plano.
- Refatorar query que usa `TO_CHAR(data)` no `WHERE`.
- Otimizar relatório mensal com CTE/analítica.

---

## Checklist final (se você cumprir isso, você “vira”)
- ✅ DER + schema com constraints  
- ✅ Massa de dados suficiente (100–1000 pedidos)  
- ✅ 60+ queries (inclui analíticas)  
- ✅ 1 package PL/SQL “de negócio”  
- ✅ 1 MERGE com staging  
- ✅ 5 otimizações com plano  

---
