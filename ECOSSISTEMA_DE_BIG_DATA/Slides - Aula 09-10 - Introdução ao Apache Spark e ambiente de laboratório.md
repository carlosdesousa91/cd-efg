---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ecossistema de Big Data · Aula 09-10'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
  code { font-size: 22px; }
---

<!-- _class: lead -->
# Ecossistema de Big Data

## Aula 09-10
### Introdução ao Apache Spark e ambiente de laboratório

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 07-08 e objetivos de hoje |
| 0:20 – 1:00 | Arquitetura do Spark + configuração do ambiente |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | DataFrames, transformações e ações (prática guiada) |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:30 | Leitura de arquivos + erros comuns + exercício prático |
| 3:30 – 4:00 | Checklist de ambiente, entrega e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Configurar** um ambiente Spark/PySpark para laboratório
2. **Descrever** a arquitetura básica (driver, executors, partições)
3. **Criar e manipular** DataFrames com operações simples
4. **Diferenciar** transformações e ações
5. **Ler** arquivos (CSV/JSON) e reconhecer erros comuns de ambiente

---

## Retomada — Aula 07-08

Na aula anterior, você:

- Entendeu **paralelismo**, **particionamento** e a lógica do **MapReduce**
- Comparou **Hadoop**, **Spark** e **Elasticsearch**
- Avaliou soluções por eficiência, escalabilidade e custo

**Hoje:** sair do conceito e **executar** o Spark na prática.

---

## Por que Apache Spark?

- Processamento **paralelo** de grandes volumes
- APIs produtivas (DataFrame / Spark SQL)
- Bom para **batch** (e base para streaming depois)
- Ecossistema maduro e muito usado no mercado

**Neste curso usaremos PySpark** (Python + Spark), alinhado à formação em ciência de dados.

---

## Opções de ambiente (escolha da unidade)

| Ambiente | Prós | Observação |
|----------|------|------------|
| **Google Colab** + PySpark | Rápido de começar | Precisa internet; sessão pode reiniciar |
| **Databricks Community** | Próximo do mercado | Conta/limites da edição free |
| **Local** (Spark + Jupyter/VS Code) | Controle total | Instalação e Java necessários |
| **Infraestrutura da escola** | Padronizado | Seguir roteiro do laboratório |

*O professor indica qual opção vale para a turma.*

---

## Checklist rápido de configuração

Antes de codificar, valide:

1. Python 3.x disponível
2. Pacote/sessão **PySpark** ok
3. Consegue criar um `SparkSession`
4. Consegue ler um CSV/JSON de exemplo
5. Consegue ver `df.show()` / `df.printSchema()`

**Atividade:** preencher o **Checklist (Atividade 1)** do caderno — instrumento previsto no plano.

---

## SparkSession — porta de entrada

```python
from pyspark.sql import SparkSession

spark = (SparkSession.builder
         .appName("Aula0910")
         .master("local[*]")   # lab local/Colab
         .getOrCreate())

print(spark.version)
```

- **Uma** sessão por aplicativo
- Em cluster real, o `master` aponta para o gerenciador de recursos
- No lab, `local[*]` usa os núcleos da máquina

---

## Arquitetura básica (visão aplicada)

```
┌─────────────┐
│   DRIVER    │  coordena o job, monta o plano
└──────┬──────┘
       │
       ▼
┌──────────────────────────────────┐
│ EXECUTORS (trabalham em paralelo)│
│  partição 1 │ partição 2 │ ...   │
└──────────────────────────────────┘
```

| Peça | Função |
|------|--------|
| **Driver** | Orquestra tarefas e coleta resultados |
| **Executor** | Executa tarefas nos dados |
| **Partição** | Pedaço do DataFrame processado em paralelo |

---

## DataFrame — abstração principal

**DataFrame** ≈ tabela distribuída (colunas + tipos), processada em partições.

Vantagens no lab:

- API parecida com tabelas / pandas (em espírito)
- Otimizações do Catalyst
- Integração natural com **Spark SQL** (próximas aulas)

```python
df = spark.read.csv("pedidos.csv", header=True, inferSchema=True)
df.printSchema()
df.show(5)
```

---

## Transformações × ações (conceito-chave)

| Tipo | O que faz | Exemplos | Executa na hora? |
|------|-----------|----------|------------------|
| **Transformação** | Define um novo DataFrame | `select`, `filter`, `withColumn` | **Não** (lazy) |
| **Ação** | Dispara o cálculo / traz resultado | `show`, `count`, `collect`, `write` | **Sim** |

> Spark atrasa o trabalho até uma **ação** — isso permite otimizar o plano.

---

## Exemplos de transformações

```python
df2 = (df
  .select("cidade", "valor")
  .filter(df.valor > 50)
  .withColumnRenamed("valor", "valor_pedido"))
```

- Ainda **não** processou o arquivo inteiro
- Apenas montou a “receita” do que será feito

---

## Exemplos de ações

```python
df2.show(10)
print(df2.count())
df2.write.mode("overwrite").parquet("saida/pedidos_filtrados")
```

- Aqui o Spark **executa** o plano
- `collect()` traz dados para o driver — **cuidado** com volumes grandes no lab

---

## Leitura de arquivos (prática)

```python
# CSV
df_csv = spark.read.csv("dados/vendas.csv",
                        header=True, inferSchema=True, sep=";")

# JSON (um objeto por linha / multiLine conforme o arquivo)
df_json = spark.read.json("dados/eventos.json")
```

**Boas práticas no lab:**
- Confirmar caminho do arquivo
- Olhar `printSchema()` antes de agregar
- Preferir amostra pequena para testar

---

## Inspeção rápida do DataFrame

```python
df.printSchema()
df.columns
df.show(5, truncate=False)
df.describe().show()      # cuidado em bases enormes
df.limit(20).show()
```

Use inspeção **leve** primeiro; evite ações caras sem necessidade.

---

## Operações guiadas (roteiro do laboratório)

1. Criar `SparkSession`
2. Ler CSV de exemplo
3. Contar linhas (`count`)
4. Filtrar uma condição
5. Selecionar colunas e mostrar
6. (Opcional) Agrupar e somar com `groupBy().sum()`

*Siga o caderno — Exercício 2 (prática guiada) e Exercício 3 (entrega).*

---

## Erros comuns de ambiente

| Sintoma | Causa frequente | O que checar |
|---------|-----------------|--------------|
| `Java gateway` / JVM | Java não instalado/configurado | `JAVA_HOME`, versão do Java |
| `ModuleNotFoundError: pyspark` | Pacote não instalado | `pip install pyspark` / kernel certo |
| Arquivo não encontrado | Caminho errado / working dir | Caminho absoluto ou upload no Colab |
| Sessão “morta” no Colab | Runtime reiniciado | Recriar `SparkSession` |
| `OutOfMemory` | Dataset grande demais no local | Amostrar dados; evitar `collect()` |
| Schema estranho | Separador/header errados | `sep`, `header`, `inferSchema` |

---

## Dicas para não travar o lab

- Trabalhe com **amostra** (`limit` / arquivo menor)
- Evite `collect()` em DataFrame grande
- Se travar: reinicie a sessão e refaça o mínimo
- Documente o ambiente usado (Colab / Databricks / local)
- Peça ajuda cedo — configuração faz parte do aprendizado

---

## Mini estudo de caso — pedidos regionais

Arquivo `pedidos.csv`:

- `pedido_id`, `cidade`, `valor`, `data`

Perguntas do laboratório:

1. Quantos pedidos existem?
2. Quais pedidos de **Goiânia** com valor > 100?
3. Qual a soma de `valor` por `cidade`? (introdução)

*Isso prepara o terreno para Spark SQL na Aula 13-14.*

---

## O que será entregue hoje

Conforme o plano de ensino:

1. **Checklist de configuração** (ambiente ok)
2. **Exercício prático** (notebook/script com leituras e operações)

Essas entregas compõem as **atividades práticas/laboratoriais (40%)**.

---

## Ligação com as próximas aulas

| Aula | Próximo passo |
|------|----------------|
| **11-12** | Elasticsearch: indexar e buscar |
| **13-14** | Spark SQL + pipeline batch + projeto intermediário |
| **15-20** | Streaming, projeto integrador e avaliação |

Hoje: **subir o motor**. Depois: SQL em escala, pipelines e integração.

---

## Síntese da aula

Hoje você:

- Configurou o ambiente **Spark/PySpark**
- Conheceu **driver**, **executors** e **DataFrames**
- Diferenciou **transformações** e **ações**
- Leu arquivos e enfrentou **erros típicos** de ambiente
- Entregou checklist + prática guiada

**Próxima aula (11-12):** Elasticsearch — indexação, busca e exploração com Kibana.

---

## Referências desta aula

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- APACHE SOFTWARE FOUNDATION. *Apache Spark Documentation.*
- APACHE SOFTWARE FOUNDATION. *PySpark API Reference.*
- JURNEY, R. *Agile Data Science 2.0.* O’Reilly, 2017.

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Entregue o **Checklist (Atividade 1)** e o **Exercício prático (Atividade 3)** do caderno.

Traga na próxima aula: dúvidas de ambiente resolvidas (ou registradas) para não travar o bloco do Elasticsearch.

**Escola do Futuro · Ciência de Dados**
