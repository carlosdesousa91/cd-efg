# Exercício — Aula 13-14
## Spark SQL, pipeline batch e projeto intermediário

**Componente curricular:** Ecossistema de Big Data  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Projeto intermediário (**15%** dos projetos práticos) + práticas formativas

---

## Instruções gerais

- Atividade **1** é individual (aquecimento / comparação de ferramentas).
- Atividade **2** é prática guiada de Spark SQL (individual ou dupla).
- Atividade **3** é o **projeto intermediário avaliativo (15%)** — em dupla/trio (ou individual).
- Atividade **4** é revisão entre pares (obrigatória na aula).
- Atividade **5** é fixação individual (curta).
- Guarde evidências (notebook, prints, URLs) para a correção.

### Ambientes

- [ ] Spark: Colab / Databricks / local / lab da unidade  
- [ ] Elasticsearch: disponível nesta aula? Sim / Não  
- [ ] Se Não: saída apenas em arquivo (Parquet/CSV) + justificativa do papel do ES  

---

## Dataset de apoio — `vendas_dia.csv`

Use o arquivo fornecido pelo professor **ou** crie a amostra:

```csv
pedido_id,cidade,produto,quantidade,valor,data
1,Goiânia,Mouse,2,89.90,2026-09-01
2,Anápolis,Teclado,1,120.00,2026-09-01
3,Goiânia,Monitor,1,899.00,2026-09-01
4,Luziânia,Mouse,1,45.50,2026-09-01
5,Goiânia,Teclado,3,360.00,2026-09-02
6,Anápolis,Headset,2,300.00,2026-09-02
7,Aparecida de Goiânia,Mouse,4,180.00,2026-09-02
8,Goiânia,Headset,1,150.00,2026-09-02
9,Anápolis,Monitor,1,950.00,2026-09-03
10,Goiânia,Mouse,1,49.90,2026-09-03
11,Luziânia,Teclado,2,240.00,2026-09-03
12,Goiânia,Monitor,2,1800.00,2026-09-03
```

*(Turmas com dataset maior: o professor pode substituir por CSV volumoso calibrado ao lab — a rubrica é a mesma.)*

---

## Atividade 1 — Comparação rápida (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Fixar SQL tradicional × Spark SQL × Elasticsearch.

Para cada necessidade, marque **R** (SGBD/SQL), **S** (Spark SQL) ou **E** (Elasticsearch). Se combinação, use **S→E** etc.

| # | Necessidade | Escolha |
|---|-------------|---------|
| 1 | Cadastro de clientes com CPF único e FK | |
| 2 | Agregar 1 dia de vendas a partir de CSV grande em job noturno | |
| 3 | Buscar reclamações com a palavra “atraso” em segundos | |
| 4 | Relatório tabular de faturamento por cidade (batch) | |
| 5 | Autocomplete de produto na loja | |
| 6 | Processar CSV, gerar resumo e indexar textos para suporte | |

**Em 3 linhas:** qual diferença principal entre **Spark SQL** e **SQL do SGBD**?

> 

---

## Atividade 2 — Prática guiada Spark SQL (individual ou dupla)

**Tempo sugerido:** 25–30 minutos  
**Objetivo:** Criar temp view, consultar e persistir resultado.

### Roteiro

```python
from pyspark.sql import SparkSession
import time

spark = (SparkSession.builder
         .appName("Aula1314_Guia")
         .master("local[*]")
         .getOrCreate())

df = spark.read.csv("vendas_dia.csv", header=True, inferSchema=True)
df.createOrReplaceTempView("vendas")
```

**a)** Schema (colunas e tipos principais):

> 

**b)** Execute e anote o resultado:

```sql
SELECT cidade, SUM(valor) AS total
FROM vendas
GROUP BY cidade
ORDER BY total DESC
```

| cidade | total |
|--------|-------|
| | |
| | |
| | |
| | |

**c)** Query dos produtos mais vendidos por `quantidade` (soma). Cole o SQL usado:

```sql

```

**Top 3 produtos (nome + qtd):**

> 1.  
> 2.  
> 3.  

**d)** Salve o resultado por cidade em `saida/total_cidade` (Parquet ou CSV) e confirme que a pasta/arquivo existe.

- [ ] Saída gravada

---

## Atividade 3 — Projeto intermediário (15%) 

**Tempo sugerido:** 50–60 minutos (+ finalização se o professor estender o prazo)  
**Formato:** dupla/trio (recomendado)  
**Objetivo:** Pipeline batch com Spark SQL e saída/indexação + métricas.

### 3.1 Identificação

| Campo | Preenchimento |
|-------|---------------|
| Nome do projeto | |
| Integrantes | |
| Ambiente Spark | |
| Elasticsearch usado? (Sim/Não) | |
| Dataset (nome/origem) | |

### 3.2 Perguntas de negócio (1 a 3)

> 1.  
> 2.  
> 3.  

### 3.3 Arquitetura do pipeline (marque e complete)

```
[ ] INGESTÃO: ________________________________
[ ] TRANSFORMAÇÃO: ____________________________
[ ] SPARK SQL: ________________________________
[ ] SAÍDA arquivo (CSV/Parquet): _______________
[ ] INDEXAÇÃO Elasticsearch (opcional): _______
[ ] MÉTRICAS registradas: _____________________
```

Diagrama em texto (3–6 etapas):

> 

### 3.4 Requisitos técnicos obrigatórios

- [ ] `SparkSession` criado e documentado  
- [ ] Leitura do dataset  
- [ ] Pelo menos **2 consultas Spark SQL** (com `temp view`)  
- [ ] Persistência de pelo menos **1** resultado (arquivo) **ou** indexação no ES  
- [ ] Métricas de tempo/volume preenchidas na tabela abaixo  
- [ ] Justificativa técnica (seção 3.6)  

### 3.5 Ficha de métricas (obrigatória)

| Métrica | Valor |
|---------|-------|
| Linhas lidas (entrada) | |
| Linhas após filtros (se houver) | |
| Linhas na saída / docs indexados | |
| Tempo total do pipeline (segundos) | |
| Observações (amostra? cluster? travou?) | |

Trecho sugerido:

```python
t0 = time.time()
# ... pipeline ...
elapsed = time.time() - t0
```

### 3.6 Justificativa técnica (½ página)

Responda:

1. Por que **Spark** (e não só planilha/SGBD) neste problema?  
2. O que ficaria melhor em **SGBD**?  
3. O papel do **Elasticsearch** no seu desenho (mesmo que não tenha indexado hoje):  

> 

### 3.7 Evidências anexas

Liste o que será enviado:

| Evidência | Nome do arquivo / link |
|-----------|------------------------|
| Notebook/script | |
| Saída (amostra) | |
| Print/export ES (se houver) | |
| Este formulário | |

---

## Rubrica de correção — Projeto intermediário (15%)

| Critério | 0–40% | 41–70% | 71–100% |
|----------|-------|--------|---------|
| Pipeline I→T→S | Incompleto | Completo com falhas menores | Claro, reproduzível |
| Spark SQL | Ausente/erro | 1 query ok | ≥ 2 queries adequadas às perguntas |
| Saída ou ES | Sem resultado | Saída parcial | Saída/índice validável |
| Métricas | Não há | Parciais | Tempo + volumes coerentes |
| Justificativa | Genérica | Razoável | Distingue SGBD × Spark × ES |
| Organização | Confuso | Legível | Bem documentado + revisão pares |

**Nota do projeto intermediário** (preenchimento do professor): _______ / 15% da disciplina (dentro dos 30% de projetos; este marco = **15 pontos percentuais** do componente).

---

## Atividade 4 — Revisão entre pares (obrigatória)

**Tempo sugerido:** 10–15 minutos  
**Objetivo:** Validar clareza do pipeline de outra equipe.

| Campo | Preenchimento |
|-------|---------------|
| Seu nome | |
| Equipe revisada | |
| Consegui entender o fluxo? (Sim/Parcial/Não) | |
| 1 ponto forte | |
| 1 melhoria sugerida | |
| As métricas estão presentes? (Sim/Não) | |

Assinatura do revisor: _______________  Data: _______________

---

## Atividade 5 — Fixação rápida (individual)

**Tempo sugerido:** 8–10 minutos  

### Parte A — V/F

| # | Afirmação | V/F |
|---|-----------|-----|
| 1 | `createOrReplaceTempView` permite consultar o DataFrame com SQL na sessão. | |
| 2 | Pipeline batch costuma processar uma janela definida de dados (ex.: o dia). | |
| 3 | Elasticsearch substitui o Spark SQL para ETL de centenas de GB. | |
| 4 | Registrar tempo e quantidade de linhas ajuda a avaliar eficiência. | |
| 5 | SQL do SGBD e Spark SQL têm o mesmo papel em sistemas transacionais com FK. | |

### Parte B — Ordene as etapas do batch (1 a 5)

| Etapa | Ordem |
|-------|-------|
| Registrar métricas e validar saída | |
| Transformar / limpar / agregar | |
| Ingerir arquivos | |
| Persistir resultado e/ou indexar | |
| Consultar com Spark SQL | |

---

## Para o professor — Gabarito e orientações

### Atividade 1 — Gabarito sugerido

1R · 2S · 3E · 4S (ou R se volume pequeno — aceitar com justificativa) · 5E · 6 **S→E**

### Atividade 2 — Totais da amostra (`SUM(valor)` por cidade)

| cidade | total |
|--------|-------|
| Goiânia | 89.9+899+360+150+49.9+1800 = **3348.8** |
| Anápolis | 120+300+950 = **1370.0** |
| Luziânia | 45.5+240 = **285.5** |
| Aparecida de Goiânia | **180.0** |

**Quantidade por produto (soma):** Mouse 2+1+4+1=**8**; Teclado 1+3+2=**6**; Monitor 1+1+2=**4**; Headset 2+1=**3**

### Atividade 3 — Orientações

- Aceitar dataset maior institucional desde que o pipeline e a rubrica se mantenham.
- Se ES estiver indisponível: **não zerar** — exigir justificativa explícita do papel do ES + saída em arquivo.
- Cobrar evidência mínima de execução (não só código sem output).

### Atividade 5 — Gabarito

**V/F:** 1V, 2V, 3F, 4V, 5F  

**Ordem sugerida:** Ingerir (1) → Transformar (2) → Consultar Spark SQL (3) → Persistir/indexar (4) → Métricas/validar (5)  
*(Aceitar métricas intercaladas se o aluno cronometrou o pipeline inteiro.)*

### Critérios de aula

| Item | Papel |
|------|-------|
| Atividades 1–2 e 5 | Formativas / participação e preparo |
| Atividade 3 | **Somativa — 15%** (projeto intermediário) |
| Atividade 4 | Qualitativa (engajamento + qualidade da entrega) |

---

## Referências

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- Apache Spark SQL Guide · PySpark API Reference
- ELASTIC. *Elasticsearch Guide* (quando houver indexação)

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
