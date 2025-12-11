## 📘 Aula 08 — Funções DECODE, CASE, NVL e COALESCE

### 📌 Resumo da Aula
Nesta aula aprendemos a utilizar funções importantes para manipulação de dados no Oracle, especialmente para lidar com **lógicas condicionais** e **valores nulos**.

As funções estudadas foram:

- **DECODE:** função condicional exclusiva do Oracle, semelhante ao "switch-case".
- **CASE:** forma mais flexível e padrão SQL para criar condições.
- **NVL:** substitui valores nulos por um valor definido.
- **COALESCE:** retorna o primeiro valor não nulo entre vários argumentos.

A aula foca em como tratar dados ausentes e criar colunas derivadas com lógica condicional dentro das consultas.

---

### 🛠️ Comandos Principais

#### ➤ Uso do DECODE
```sql
SELECT nome,
       DECODE(sexo, 'M', 'Masculino',
                     'F', 'Feminino',
                         'Não informado') AS sexo_desc
FROM pessoas;
```
#### ➤ Uso do CASE (versão moderna e recomendada)
```sql
SELECT nome,
       CASE
            WHEN salario < 2000 THEN 'Baixo'
            WHEN salario BETWEEN 2000 AND 5000 THEN 'Médio'
            ELSE 'Alto'
       END AS faixa_salarial
FROM funcionarios;
```
#### ➤ Substituir valores nulos com NVL
```sql
SELECT nome,
       NVL(telefone, 'Sem telefone cadastrado') AS telefone
FROM clientes;
```
#### ➤ Usar COALESCE para múltiplas alternativas
```sql
SELECT nome,
       NVL(telefone, 'Sem telefone cadastrado') AS telefone
FROM clientes;
```

### 🧠 Conceitos-Chave

- **DECODE**
  - Função condicional exclusiva do Oracle
  - Útil para substituições rápidas
  - Menos flexível que CASE

- **CASE**
  - Recomendado por ser padrão SQL
  - Aceita condições mais complexas
  - Mais legível e mais poderoso que DECODE

- **NVL**
  - Substitui valores nulos
  - Aceita apenas dois argumentos (`NVL(valor, substituto)`)

- **COALESCE**
  - Retorna o primeiro valor não nulo
  - Pode receber vários argumentos
  - Mais flexível que NVL


### 🧾 Exemplos Práticos da Aula
#### ➤ Criar classificação de clientes
```sql
SELECT nome,
       CASE
            WHEN idade < 18 THEN 'Menor'
            WHEN idade BETWEEN 18 AND 59 THEN 'Adulto'
            ELSE 'Idoso'
       END AS categoria
FROM clientes;
```
#### ➤ Tratar telefones faltantes
```sql
SELECT nome,
       COALESCE(celular, telefone, 'Nenhum contato informado') AS contato
FROM clientes;
```
