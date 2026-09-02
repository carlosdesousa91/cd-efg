---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ecossistema de Big Data · Aula 07-08'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Ecossistema de Big Data

## Aula 07-08
### Processamento massivo paralelo e panorama de ferramentas

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 05-06 e objetivos de hoje |
| 0:20 – 1:00 | Paralelismo, distribuição e particionamento |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | MapReduce (conceitual) e panorama Hadoop / Spark / Elasticsearch |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:30 | Critérios: eficiência, escalabilidade e custo + desafio gamificado |
| 3:30 – 4:00 | Quiz, comparação de soluções e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Compreender** princípios de paralelismo e distribuição de tarefas
2. **Explicar** a ideia do modelo **MapReduce** (nível conceitual)
3. **Reconhecer** o papel do **particionamento** em grandes volumes
4. **Comparar** Hadoop, Spark e Elasticsearch no ecossistema
5. **Avaliar** soluções com critérios de **eficiência, escalabilidade e custo**

---

## Retomada — Aula 05-06

Na aula anterior, você:

- Identificou **armazenamento**, **processamento** e **orquestração**
- Diferenciou ambientes **local**, **cluster** e **nuvem**
- Discutiu **trade-offs** de custo e desempenho
- Desenhou uma **arquitetura simplificada**

**Pergunta de abertura (3 min):**

> Se temos vários nós em um cluster, como o trabalho é *dividido* entre eles?

---

## Por que falar de paralelismo?

Porque um único computador:

- Tem limite de **CPU**, **memória** e **disco**
- Pode demorar **horas/dias** em volumes grandes
- Vira gargalo quando os dados crescem

**Ideia central:**

> Dividir o problema em partes → processar **ao mesmo tempo** → combinar o resultado.

---

## Paralelismo × distribuição (visão simples)

| Conceito | Ideia | Exemplo didático |
|----------|-------|------------------|
| **Paralelismo** | Várias tarefas ao mesmo tempo | 4 núcleos somando pedaços de uma lista |
| **Distribuição** | Tarefas em **máquinas diferentes** | 10 servidores processando fatias de um arquivo |

Na prática do Big Data, usamos os dois: **paralelismo dentro do nó** + **distribuição entre nós**.

---

## Analogia — Contar votos em uma eleição

**Sequencial:** uma pessoa conta todas as urnas.  
**Paralelo/distribuído:**

1. Cada mesa conta sua urna (**map**)
2. Um coordenador soma os totais (**reduce**)

**Ganho:** menos tempo total.  
**Custo:** coordenação, comunicação e possível retrabalho se algo falhar.

---

## Particionamento (noções)

**Particionar** = dividir os dados em **pedaços** (partições) para processar/armazenar em paralelo.

Exemplos de chave de partição:

- Por **data** (dia/mês)
- Por **região** / município
- Por **hash** de um ID
- Por faixa de valores

**Bom particionamento:** trabalho equilibrado entre nós.  
**Mau particionamento:** um nó sobrecarregado (**data skew**).

---

## Exemplo de particionamento

Arquivo de 100 milhões de pedidos:

```
part-2026-08-01/   part-2026-08-02/   ...   part-2026-08-31/
```

- Job processa **só o dia** necessário (eficiente)
- Vários nós leem partições **diferentes** ao mesmo tempo
- Relatório mensal pode varrer todas as partições do mês

---

## Atividade rápida (8 min)

**Exercício 1 — Dividir para conquistar**

Em duplas: para um dataset de logs de 30 dias (~1 TB), proponham:

1. Uma chave de particionamento
2. Como 5 nós poderiam dividir o trabalho
3. Um risco de desbalanceamento

*Depois compartilhamos 2 propostas.*

---

## MapReduce — ideia central (conceitual)

Modelo clássico de processamento paralelo em larga escala:

```
DADOS  →  MAP (transforma/emite pares)  →  EMBARALHA/AGRUPA  →  REDUCE (agrega)  →  RESULTADO
```

**Map:** processa cada pedaço e emite pares chave → valor  
**Reduce:** recebe valores da mesma chave e consolida

*Não vamos implementar MapReduce “na mão” — vamos entender a lógica que inspirou ferramentas como Hadoop e influenciou o Spark.*

---

## MapReduce — exemplo: contar palavras

Texto dividido em pedaços:

**Map** (por pedaço):  
`("big",1) ("data",1) ("big",1) ...`

**Agrupa por chave:**  
`big → [1,1,1]` · `data → [1,1]`

**Reduce:**  
`big → 3` · `data → 2`

**Tradução para negócios:** contar eventos, somar vendas por cidade, agregar cliques por produto…

---

## Limitações do MapReduce clássico (visão)

- Muitos jobs escrevem resultado intermediário em **disco** (mais lento)
- Pipelines complexos = vários estágios Map/Reduce
- Menos ágil para exploração interativa

Isso ajudou a popularizar motores como o **Spark**, que prioriza processamento em **memória** (quando possível) e APIs mais produtivas.

---

## Panorama do ecossistema — três peças

| Ferramenta | Papel principal | Pense em… |
|------------|-----------------|-----------|
| **Hadoop** (ecossistema) | Armazenamento distribuído + processamento clássico (HDFS + MapReduce/YARN) | Fundação histórica / batch em cluster |
| **Apache Spark** | Motor de processamento paralelo (batch e streaming introdutório) | Transformar e agregar em escala |
| **Elasticsearch** | Indexação, busca e analytics near real-time | Encontrar e explorar rápido |

*No curso, Spark e Elasticsearch são as ferramentas de estudo práticas; Hadoop entra como panorama conceitual.*

---

## Hadoop — o que você precisa saber agora

**Ideias-chave:**

- **HDFS:** dados grandes espalhados em vários discos/nós
- **YARN / recurso do cluster:** agenda e gerencia recursos
- **MapReduce:** modelo clássico de processamento

**Quando aparece no mercado:**
- Legados de data lake on-premise
- Bases conceituais de armazenamento distribuído

**Para este componente:** entender o *porquê* do modelo, não operar um cluster Hadoop completo.

---

## Spark — onde se encaixa no paralelismo

- Divide dados em **partições**
- Executa tarefas em paralelo nos **executors**
- Útil para **batch** (e introdução a streaming depois)
- Spark SQL para consultas sobre grandes volumes

**Frase-guia:**

> Spark = “motor” para processar muita coisa em paralelo com produtividade.

---

## Elasticsearch — paralelismo de outro tipo

- Dados em **índices** divididos em **shards** (partições do índice)
- Busca e aggregations distribuídas entre nós
- Foco em **baixa latência** de consulta/busca
- Não substitui Spark para ETL pesado de TB

**Frase-guia:**

> Elasticsearch = “motor” para indexar/buscar/explorar com velocidade.

---

## Comparativo rápido

| Critério | Hadoop (MapReduce) | Spark | Elasticsearch |
|----------|--------------------|-------|---------------|
| Força | Batch histórico / HDFS | Processamento paralelo produtivo | Busca e near real-time |
| Latência típica | Minutos–horas | Segundos–minutos (batch) | Milissegundos–segundos |
| Ideal para | Fundações / legado | ETL, agregações, Spark SQL | Texto, logs, busca |
| Custo de complexidade | Alto operar cluster | Médio (ambiente/lab) | Médio (mappings/cluster) |

---

## Critérios de decisão: eficiência, escalabilidade e custo

Toda escolha técnica deve responder:

1. **Eficiência:** resolve no tempo aceitável com bons recursos?
2. **Escalabilidade:** continua ok se o volume **dobrar ou 10×**?
3. **Custo:** dinheiro, tempo de equipe, infraestrutura e manutenção?

> A “melhor” ferramenta é a que equilibra os três para **aquele** problema — não a mais famosa.

---

## Matriz de decisão (uso em sala)

| Pergunta | Se SIM, incline para… |
|----------|------------------------|
| Preciso processar muitos arquivos/TB em lote? | **Spark** |
| Preciso busca textual / exploração rápida? | **Elasticsearch** |
| O dado já está bem tabular e cabe no SGBD? | **SGBD** (ainda válido!) |
| O ambiente legado é HDFS/MapReduce? | Conhecer **Hadoop** (contexto) |
| Preciso processar e depois buscar? | **Spark + Elasticsearch** |

---

## Estudo de caso comparativo (10 min)

**Empresa “LogBrasil”** gera 2 TB/dia de logs de aplicação.

Demandas:

- **A)** Relatório diário de erros por serviço (batch)
- **B)** Tela para buscar mensagem de erro em segundos
- **C)** Arquivar logs brutos por 180 dias com baixo custo

**Discussão:** qual combinação Hadoop/HDFS (conceito), Spark e Elasticsearch faria sentido?

---

## Desafio gamificado — “Escolha a ferramenta” (25 min)

**Exercício 2 — Arena do ecossistema**

Em grupos de 3–4:

1. Recebem **4 missões** (cenários)
2. Para cada uma, escolhem: **Spark**, **Elasticsearch**, **SGBD**, **Hadoop (conceitual)** ou **combinação**
3. Dão nota 1–5 para **eficiência**, **escalabilidade** e **custo**
4. Apresentam a missão mais difícil em **2 minutos**

*Quem justificar melhor os trade-offs “vence” a rodada (gamificação).*

---

## Missões da arena (visão geral)

| # | Missão |
|---|--------|
| 1 | Agregar 500 GB de cliques JSON toda madrugada |
| 2 | Autocomplete de produtos na loja virtual |
| 3 | Cadastro de clientes com integridade referencial |
| 4 | Entender um data lake antigo em HDFS citado na documentação da empresa |

*Detalhes e ficha de pontuação estão no caderno de exercícios.*

---

## Quiz relâmpago (10 min)

**Exercício 4 — Fixação**

Verdadeiro ou falso / associação rápida:

- MapReduce = map + reduce (conceitual)
- Particionamento ruim pode gerar nó sobrecarregado
- Elasticsearch é a primeira escolha para ETL de 300 GB
- Spark brilha em processamento paralelo em lote
- Custo importa tanto quanto desempenho

*Gabarito no caderno.*

---

## Ligação com as próximas aulas

| Aula | O que vem |
|------|-----------|
| **09-10** | Laboratório **Spark** / PySpark |
| **11-12** | Laboratório **Elasticsearch** + Kibana |
| **13-14** | Pipeline batch + projeto intermediário |

Hoje vocês fecham o **Bloco 2** (fundamentos de paralelismo e panorama).  
A partir da 09-10, a ênfase é **mão na massa**.

---

## Síntese da aula

Hoje você:

- Compreendeu **paralelismo**, **distribuição** e **particionamento**
- Explicou a lógica do **MapReduce**
- Comparou **Hadoop**, **Spark** e **Elasticsearch**
- Avaliou opções por **eficiência**, **escalabilidade** e **custo**
- Pratricou a escolha de ferramentas em desafios gamificados

**Próxima aula (09-10):** configurar ambiente Spark/PySpark e executar primeiras operações.

---

## Referências desta aula

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- ERL, T.; KHATTAK, W.; BUHLER, P. *Big Data Fundamentals.* Prentice Hall, 2015.
- RAMOS, A. *Infraestrutura Big Data com opensource.* Ciência Moderna, 2015.
- WARREN, J.; MARZ, N. *Big Data.* Manning, 2015.
- Documentação: Apache Spark · Elasticsearch · Apache Hadoop (visão geral)

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Complete as **Atividades 1, 2, 3 e 4** do caderno de exercícios.

Traga na próxima aula: ambiente/lab conforme orientação do professor (Colab, Databricks Community ou instalação local).

**Escola do Futuro · Ciência de Dados**
