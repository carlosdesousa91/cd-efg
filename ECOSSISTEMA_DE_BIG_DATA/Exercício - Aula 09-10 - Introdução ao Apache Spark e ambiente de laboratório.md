# Exercício — Aula 09-10
## Introdução ao Apache Spark e ambiente de laboratório

**Componente curricular:** Ecossistema de Big Data  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Checklist de configuração + exercício prático em laboratório (conforme plano de ensino)

---

## Instruções gerais

- Atividade **1** (checklist) é **individual** e obrigatória.
- Atividade **2** é prática guiada (individual ou dupla).
- Atividade **3** é a **entrega prática** principal (individual ou dupla, conforme o professor).
- Atividade **4** é individual (fixação conceitual).
- Atividade **5** é opcional (desafio extra).
- As Atividades 1 e 3 integram as **atividades práticas/laboratoriais (40%)**.

### Ambiente aceito

Marque o que você usou:

- [ ] Google Colab + PySpark  
- [ ] Databricks Community  
- [ ] Instalação local (Jupyter / VS Code)  
- [ ] Laboratório da unidade  
- [ ] Outro: _________________

---

## Dataset de apoio (amostra)

Crie o arquivo `pedidos.csv` (ou use o fornecido pelo professor) com o conteúdo abaixo:

```csv
pedido_id,cidade,valor,data
1,Goiânia,89.90,2026-08-01
2,Anápolis,120.00,2026-08-01
3,Goiânia,45.50,2026-08-02
4,Aparecida de Goiânia,210.00,2026-08-02
5,Goiânia,150.00,2026-08-03
6,Anápolis,30.00,2026-08-03
7,Luziânia,99.90,2026-08-03
8,Goiânia,15.00,2026-08-04
9,Anápolis,180.50,2026-08-04
10,Goiânia,250.00,2026-08-04
```

*(Opcional)* `eventos.json` — um objeto por linha:

```json
{"evento_id":1,"tipo":"click","cidade":"Goiânia"}
{"evento_id":2,"tipo":"compra","cidade":"Anápolis"}
{"evento_id":3,"tipo":"click","cidade":"Goiânia"}
```

---

## Atividade 1 — Checklist de configuração (individual)

**Tempo sugerido:** 20–30 minutos (início da aula)  
**Objetivo:** Validar o ambiente Spark/PySpark antes das práticas.

| # | Item | OK? (Sim/Não) | Observação / evidência |
|---|------|---------------|------------------------|
| 1 | Consegui abrir o ambiente escolhido (Colab/Databricks/local/lab) | | |
| 2 | PySpark importou sem erro (`from pyspark.sql import SparkSession`) | | |
| 3 | Criei um `SparkSession` com `appName` | | |
| 4 | Imprimi a versão do Spark (`spark.version`) | | |
| 5 | Li o arquivo `pedidos.csv` (ou equivalente) | | |
| 6 | Executei `printSchema()` e `show(5)` | | |
| 7 | Registrei o ambiente usado nesta ficha | | |

**Versão do Spark informada:** _______________

**Problema encontrado (se houver) e como resolveu / status:**

> 

**Nome:** _______________________________

---

## Atividade 2 — Prática guiada: primeiros passos (individual ou dupla)

**Tempo sugerido:** 35–40 minutos  
**Objetivo:** Executar o roteiro mínimo de DataFrame, transformações e ações.

Complete no notebook/script e **anote** os resultados pedidos.

### 2.1 Criar a sessão

Cole/adapte:

```python
from pyspark.sql import SparkSession

spark = (SparkSession.builder
         .appName("Aula0910_Pratica")
         .master("local[*]")
         .getOrCreate())
```

### 2.2 Ler e inspecionar

```python
df = spark.read.csv("pedidos.csv", header=True, inferSchema=True)
df.printSchema()
df.show()
```

**a)** Quais colunas e tipos apareceram no schema?

> 

**b)** Quantas linhas retornou `df.count()`?

> 

### 2.3 Transformações (lazy)

```python
df_goiania = (df
  .filter(df.cidade == "Goiânia")
  .select("pedido_id", "cidade", "valor"))
```

**c)** Ao criar `df_goiania`, o Spark já processou o CSV inteiro? (Sim/Não) Por quê?

> 

### 2.4 Ações

```python
df_goiania.show()
print(df_goiania.count())
```

**d)** Quantos pedidos de Goiânia existem na amostra?

> 

**e)** Filtre `valor > 100` (qualquer cidade) e liste os `pedido_id` resultantes:

> 

---

## Atividade 3 — Exercício prático entregável (individual ou dupla)

**Tempo sugerido:** 40–45 minutos  
**Objetivo:** Consolidar leitura, transformação, ação e registro de evidências.

### Requisitos da entrega

Entregar notebook (`.ipynb`) **ou** script (`.py`) + respostas deste formulário, contendo:

1. Criação do `SparkSession`
2. Leitura de `pedidos.csv`
3. Contagem total de pedidos
4. DataFrame apenas com pedidos de **Goiânia** e `valor > 100`
5. Exibição (`show`) desse filtro
6. (Opcional + bônus) Leitura de `eventos.json` e `count` por `tipo`
7. Célula/comentário listando **1 erro** encontrado (ou “nenhum”) e como tratou

### Resultados para registrar aqui

| Item | Resultado |
|------|-----------|
| Total de pedidos (`count`) | |
| Pedidos Goiânia com valor > 100 (qtde) | |
| `pedido_id`s do filtro acima | |
| Ambiente usado | |
| Link/arquivo entregue | |

### Agregação introdutória (obrigatória na entrega)

Implemente e registre o resultado:

```python
df.groupBy("cidade").sum("valor").show()
```

| cidade | soma(valor) aproximada |
|--------|-------------------------|
| | |
| | |
| | |
| | |

**Nomes (se dupla):**

| Nome |
|------|
| |
| |

---

## Atividade 4 — Fixação: transformações, ações e erros (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Fixar conceitos sem depender do computador.

### Parte A — Classifique T (transformação) ou A (ação)

| # | Operação | T/A |
|---|----------|-----|
| 1 | `df.filter(df.valor > 50)` | |
| 2 | `df.show()` | |
| 3 | `df.select("cidade")` | |
| 4 | `df.count()` | |
| 5 | `df.withColumnRenamed("valor", "v")` | |
| 6 | `df.write.parquet("saida")` | |
| 7 | `df.collect()` | |

### Parte B — Associe o erro à causa mais provável

**Opções:**  
**A)** Caminho do arquivo incorreto  
**B)** PySpark não instalado / kernel errado  
**C)** Java / JVM não configurada  
**D)** Uso inadequado de `collect()` / memória  
**E)** Separador/header do CSV incorretos  

| # | Sintoma | Letra |
|---|---------|-------|
| 8 | `ModuleNotFoundError: No module named 'pyspark'` | |
| 9 | `Path does not exist` / arquivo não encontrado | |
| 10 | Falha ao iniciar gateway Java / JVM | |
| 11 | Colunas vieram todas em uma só / tipos estranhos | |
| 12 | Sessão trava ou estoura memória ao trazer tudo ao driver | |

---

## Atividade 5 — Desafio extra (opcional)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Aprofundar inspeção e boas práticas.

1. Crie uma coluna `faixa` com regra:
   - `valor < 50` → `"baixo"`
   - `50 <= valor <= 150` → `"medio"`
   - `valor > 150` → `"alto"`
2. Conte quantos pedidos há em cada faixa.
3. Explique em 3 linhas por que evitar `collect()` em arquivos grandes no lab.

> 

---

## Para o professor — Gabarito e orientações

### Atividade 1

- Não avançar para agregações pesadas enquanto o checklist estiver incompleto.
- Registrar ambientes distintos da turma ajuda no suporte.

### Atividade 2 — Resultados da amostra

- Total de linhas: **10**
- Pedidos de Goiânia: **5** (ids 1, 3, 5, 8, 10)
- Item **c):** **Não** — transformação é lazy
- `valor > 100`: ids **2, 4, 5, 9, 10** (Anápolis 120; Aparecida 210; Goiânia 150; Anápolis 180.5; Goiânia 250)

### Atividade 3 — Somas por cidade (amostra)

| cidade | sum(valor) |
|--------|------------|
| Goiânia | 89.9 + 45.5 + 150 + 15 + 250 = **550.4** |
| Anápolis | 120 + 30 + 180.5 = **330.5** |
| Aparecida de Goiânia | **210.0** |
| Luziânia | **99.9** |

### Atividade 4 — Gabarito

**Parte A:** 1T, 2A, 3T, 4A, 5T, 6A, 7A  

**Parte B:** 8B, 9A, 10C, 11E, 12D

### Atividade 5 — Orientação

- Pode usar `when` / `otherwise` do `pyspark.sql.functions`.
- Cobrar a justificativa sobre `collect()` (traz dados ao driver).

### Critérios rápidos de correção (qualitativo/quantitativo)

| Critério | Indicador |
|----------|-----------|
| Ambiente | Checklist ≥ 6 “Sim” ou problema documentado com tentativa de correção |
| Prática | Entrega com sessão, leitura, filtro Goiânia valor > 100 e `groupBy` |
| Conceito | ≥ 9 acertos nos 12 itens da Atividade 4 |
| Boas práticas | Evitou `collect()` desnecessário; registrou erro/ambiente |

### Sugestão Colab (se adotado)

```python
!pip -q install pyspark
```

Em seguida, criar o CSV com `%%writefile pedidos.csv` ou upload manual.

---

## Referências

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- Apache Spark Documentation / PySpark API Reference
- JURNEY, R. *Agile Data Science 2.0.* O’Reilly, 2017.

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
