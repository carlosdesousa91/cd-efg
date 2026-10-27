# Aula prática: ETL vs. ELT com Python e PostgreSQL

## Objetivo

Implementar dois processos de integração de dados:

- **ETL (Extract, Transform, Load):** extrair os dados, transformá-los em Python e depois carregá-los no PostgreSQL.
- **ELT (Extract, Load, Transform):** extrair e carregar os dados no PostgreSQL e depois transformá-los utilizando SQL.

Ao final, compare os resultados.

## 1. Cenário

Uma loja fictícia possui as seguintes vendas:

| ID | Produto | Quantidade | Preço (R$) |
|---|---|---:|---:|
| 1 | Notebook | 2 | 3000 |
| 2 | Mouse | 5 | 50 |
| 3 | Teclado | 3 | 100 |
| 4 | Monitor | 2 | 800 |
| 5 | Headset | 4 | 150 |

O gerente precisa do **valor total de cada venda**:

`total = quantidade * preco`

## 2. Preparação (5 minutos)

Crie no PostgreSQL um banco chamado `aula_etl` e execute:

```sql
CREATE TABLE vendas_brutas (
    id INT,
    produto VARCHAR(50),
    quantidade INT,
    preco NUMERIC(10,2)
);

CREATE TABLE vendas_etl (
    id INT,
    produto VARCHAR(50),
    total NUMERIC(10,2)
);

CREATE TABLE vendas_elt (
    id INT,
    produto VARCHAR(50),
    total NUMERIC(10,2)
);
```

Instale a dependência Python:

```bash
pip install psycopg2-binary
```

## 3. Parte 1 — ETL (10 minutos)

**Fluxo:** Extrair → Transformar → Carregar.

Crie o arquivo `etl.py`:

```python
import psycopg2

conn = psycopg2.connect(
    host="localhost",
    database="aula_etl",
    user="postgres",
    password="123456"  # Altere para sua senha local
)

cursor = conn.cursor()

# EXTRACT: dados de origem
vendas = [
    (1, "Notebook", 2, 3000),
    (2, "Mouse", 5, 50),
    (3, "Teclado", 3, 100),
    (4, "Monitor", 2, 800),
    (5, "Headset", 4, 150)
]

# TRANSFORM + LOAD
for id, produto, quantidade, preco in vendas:
    total = quantidade * preco  # Transformação em Python
    cursor.execute(
        "INSERT INTO vendas_etl VALUES (%s, %s, %s)",
        (id, produto, total)
    )

conn.commit()
cursor.close()
conn.close()
print("ETL finalizado!")
```

Execute:

```bash
python etl.py
```

Verifique no banco:

```sql
SELECT * FROM vendas_etl;
```

## 4. Parte 2 — ELT (10 minutos)

**Fluxo:** Extrair → Carregar → Transformar.

**Passo 1 — Carregar dados brutos:**

```sql
INSERT INTO vendas_brutas (id, produto, quantidade, preco)
VALUES
(1, 'Notebook', 2, 3000),
(2, 'Mouse', 5, 50),
(3, 'Teclado', 3, 100),
(4, 'Monitor', 2, 800),
(5, 'Headset', 4, 150);
```

**Passo 2 — Transformar os dados no PostgreSQL:**

```sql
INSERT INTO vendas_elt (id, produto, total)
SELECT id, produto, quantidade * preco
FROM vendas_brutas;
```

**Passo 3 — Consultar:**

```sql
SELECT * FROM vendas_elt;
```

## 5. Comparação e perguntas (5 minutos)

```sql
SELECT * FROM vendas_etl;
SELECT * FROM vendas_elt;
```

### Resultado esperado

| ID | Produto | Total (R$) |
|---|---|---:|
| 1 | Notebook | 6.000,00 |
| 2 | Mouse | 250,00 |
| 3 | Teclado | 300,00 |
| 4 | Monitor | 1.600,00 |
| 5 | Headset | 600,00 |

**Total geral: R$ 8.750,00**

Responda:

1. Qual é a principal diferença entre ETL e ELT?
2. Em qual processo o Python realizou a transformação?
3. Em qual processo o PostgreSQL realizou a transformação?
4. Os resultados foram iguais?
5. Se houvesse 1 milhão de vendas, qual abordagem você escolheria e por quê?

## 6. Desafio extra (opcional)

Vendas com valor total **acima de R$ 1.000** devem receber **10% de desconto**. Adapte os dois processos.

Dica de SQL para ELT:

```sql
SELECT
    produto,
    quantidade * preco AS total_original,
    CASE
        WHEN quantidade * preco > 1000
        THEN quantidade * preco * 0.90
        ELSE quantidade * preco
    END AS total_com_desconto
FROM vendas_brutas;
```

## Orientação

| Critério | ETL | ELT |
|---|---|---|
| Transformação | Antes da carga | Depois da carga |
| Ferramenta de transformação | Python | PostgreSQL (SQL) |
| Dados brutos armazenados neste exemplo | Não | Sim |

**Observação:** para simplificar a atividade, o ETL utiliza uma lista em Python e o ELT utiliza instruções SQL para carregar os dados. Em projetos reais, ambos poderiam ler dados de arquivos CSV, APIs ou outros bancos.


