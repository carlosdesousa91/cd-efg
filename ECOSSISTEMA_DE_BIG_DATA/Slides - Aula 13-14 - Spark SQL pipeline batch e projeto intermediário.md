---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ecossistema de Big Data · Aula 13-14'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
  code { font-size: 20px; }
---

<!-- _class: lead -->
# Ecossistema de Big Data

## Aula 13-14
### Spark SQL, pipeline batch e projeto intermediário

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada e rubrica do projeto intermediário (15%) |
| 0:20 – 1:00 | Spark SQL e tabelas volumosas (prática) |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | Pipeline batch: ingestão → transformação → saída/indexação |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:40 | Desenvolvimento do projeto intermediário + revisão entre pares |
| 3:40 – 4:00 | Métricas, entrega parcial/final e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Consultar** dados com **Spark SQL** (temp views / queries)
2. **Implementar** um pipeline **batch** (ingestão → transformação → saída)
3. **Comparar** SQL tradicional × Spark SQL × busca no Elasticsearch
4. **Registrar** métricas simples de tempo/volume
5. **Entregar** o **projeto intermediário (15%)**

---

## Retomada — Aulas 09-10 e 11-12

Você já:

- Subiu **Spark/PySpark** e manipulou DataFrames
- Indexou e buscou no **Elasticsearch**
- Distinguiu quando usar SGBD × Spark × ES

**Hoje:** juntar as peças em um **pipeline batch** avaliável.

---

## Projeto intermediário — o que vale (15%)

Conforme o plano de ensino:

> Pipeline batch com **Spark** e/ou indexação no **Elasticsearch**, com avaliação básica de desempenho.

**Entrega mínima:**
1. Ingestão de arquivo(s) (CSV/JSON)
2. Transformações + consultas **Spark SQL**
3. Saída persistida (Parquet/CSV) **e/ou** indexação no ES
4. Registro de **métricas** (linhas lidas, tempo, linhas escritas/indexadas)
5. Breve justificativa da arquitetura escolhida

---

## Rubrica resumida (divulgada previamente)

| Critério | Peso relativo | Excelente |
|----------|---------------|-----------|
| Pipeline completo (I→T→S) | Alto | Etapas claras e reproduzíveis |
| Spark SQL | Alto | Queries corretas e documentadas |
| Saída / ES (opcional+) | Médio | Resultado consultável |
| Métricas tempo/volume | Médio | Números registrados |
| Justificativa técnica | Médio | SGBD × Spark × ES coerente |
| Organização / pares | Baixo | Código legível + revisão |

*Detalhamento no caderno de exercícios.*

---

## Spark SQL — o que é?

Camada do Spark que permite consultar DataFrames com **SQL**.

```python
df.createOrReplaceTempView("pedidos")
spark.sql("""
  SELECT cidade, SUM(valor) AS total
  FROM pedidos
  GROUP BY cidade
  ORDER BY total DESC
""").show()
```

- Mesmo motor distribuído do Spark
- Útil para quem já pensa em SQL
- Bom para agregações em volumes maiores que o “SGBD único”

---

## Temp view × tabela permanente (visão lab)

| Recurso | Ideia no laboratório |
|---------|----------------------|
| `createOrReplaceTempView` | Nome SQL válido **na sessão** |
| DataFrame API | `filter`, `groupBy` etc. (equivalente) |
| Escrita Parquet/CSV | Persistir resultado do batch |
| Índice ES | Disponibilizar para **busca** near real-time |

*No projeto intermediário, temp view + `spark.sql` já atendem o requisito de Spark SQL.*

---

## SQL tradicional × Spark SQL × Elasticsearch

| Aspecto | SQL (SGBD) | Spark SQL | Elasticsearch |
|---------|------------|-----------|---------------|
| Melhor para | Cadastro, integridade, OLTP | Batch / agregação em escala | Busca e exploração rápida |
| Latência típica | Baixa–média | Segundos–minutos (job) | Muito baixa (consulta) |
| Volume “confortável” | MB–GB (varia) | GB–TB | Depende do cluster/índice |
| Linguagem | SQL padrão | SQL no Spark | Query DSL (JSON) |

**Não são inimigos:** muitas arquiteturas usam os três em papéis diferentes.

---

## Quando usar cada um no pipeline

```
Arquivos brutos ──► Spark (limpa/agrega) ──► Parquet/CSV (saída analítica)
                         │
                         └──► Elasticsearch (se precisar buscar texto/explorar)
Cadastro mestre ──► SGBD (continua sendo a fonte operacional)
```

---

## Pipeline batch — visão geral

```
1. INGESTÃO     → ler CSV/JSON (e validar schema)
2. TRANSFORMAÇÃO → limpar, filtrar, enriquecer, agregar
3. CONSULTA      → Spark SQL para responder perguntas
4. SAÍDA         → gravar resultado e/ou indexar no ES
5. MÉTRICAS      → tempo, volume lido/escrito
```

Características do **batch**:
- Janela de dados definida (ex.: “o dia de ontem”)
- Roda sob demanda ou agendado (madrugada)
- Resultado fica pronto para consumo posterior

---

## Métricas simples de tempo/volume

Registre no notebook (obrigatório no projeto):

```python
import time
t0 = time.time()
df = spark.read.csv("...", header=True, inferSchema=True)
n_in = df.count()
# ... transformações / sql ...
n_out = resultado.count()
elapsed = time.time() - t0
print(f"linhas_in={n_in} linhas_out={n_out} tempo_s={elapsed:.2f}")
```

| Métrica | Por que importa |
|---------|-----------------|
| Linhas lidas | Volume de entrada |
| Linhas escritas/indexadas | Volume de saída |
| Tempo total (s) | Eficiência do job |
| Ambiente | Reproduzibilidade (Colab/local…) |

---

## Prática guiada — Spark SQL (20–25 min)

Dataset `vendas_dia.csv` (fornecido / gerado no caderno):

1. Ler no Spark  
2. Criar temp view `vendas`  
3. Query: total por cidade  
4. Query: top produtos por quantidade  
5. Salvar resultado agregado em pasta `saida/`

*Atividade 2 do caderno.*

---

## Opção Elasticsearch no pipeline

Se o ambiente ES estiver ok:

1. Após agregar/filtrar no Spark, converta linhas para JSON/dicts  
2. Indexe no índice `projeto_intermediario` (bulk simples ou docs um a um no lab)  
3. Faça **uma** busca de validação no Kibana/Dev Tools  

**Não é obrigatório** se o lab não tiver ES estável — nesse caso, a saída Parquet/CSV + métricas + justificativa bastam, com menção ao papel do ES.

---

## Desenvolvimento do projeto (bloco principal)

Em **duplas/trios** (ou individual, se definido):

1. Escolher pergunta(s) de negócio (1–3)  
2. Montar pipeline I→T→SQL→S  
3. Registrar métricas  
4. Escrever justificativa (½ página)  
5. **Revisão entre pares** (10 min): outro grupo valida se consegue entender o fluxo  

---

## Perguntas de negócio (exemplos)

- Qual cidade teve maior faturamento no período?  
- Quais produtos mais venderam?  
- Quantos pedidos acima de R$ 100 por cidade?  
- (Com ES) Quais registros/textos mencionam “atraso” / “defeito”?  

*Escolham perguntas compatíveis com o dataset disponível.*

---

## Erros comuns neste laboratório

| Problema | Como evitar |
|----------|-------------|
| Esquecer `createOrReplaceTempView` | Criar a view antes do `spark.sql` |
| Tipos errados no CSV | `printSchema`, `inferSchema` / cast |
| `count()` demais (lento) | Medir o pipeline completo, não cada micropasso |
| Indexar tudo no ES sem filtrar | Indexar só o necessário à busca |
| Sem métricas na entrega | Modelo pronto no caderno |

---

## Entrega de hoje

**Arquivos / evidências:**
- Notebook ou script do pipeline  
- Pasta/arquivo de saída **ou** evidência de índice ES  
- Ficha de métricas preenchida  
- Justificativa técnica (template no exercício)  
- Rubrica de autoavaliação + revisão entre pares  

**Prazo:** final da aula ou conforme o professor (mesma semana).

---

## Ligação com o Bloco 4

| Aula | Continuação |
|------|-------------|
| **15-16** | Streaming / near real-time × batch |
| **17-20** | Projeto **integrador** (mais 15%) + avaliação teórico-prática |

O intermediário é o “ensaio geral” do pipeline que vocês vão evoluir.

---

## Síntese da aula

Hoje você:

- Consultou dados com **Spark SQL**
- Montou um **pipeline batch** ponta a ponta
- Comparou **SQL × Spark SQL × Elasticsearch**
- Registrou **métricas** de tempo e volume
- Entregou o **projeto intermediário (15%)**

**Próxima aula (15-16):** processamento contínuo, tempo real e consulta near real-time.

---

## Referências desta aula

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- Apache Spark SQL Guide / PySpark API
- Elasticsearch Guide (indexação a partir de pipelines)
- ERL et al. *Big Data Fundamentals.* Prentice Hall, 2015.

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Entregue o **Projeto intermediário (Atividade 3)** com métricas e justificativa.

Na revisão entre pares: um elogio técnico + uma sugestão de melhoria.

**Escola do Futuro · Ciência de Dados**
