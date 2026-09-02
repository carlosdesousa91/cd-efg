# Exercício — Aula 07-08
## Processamento massivo paralelo e panorama de ferramentas

**Componente curricular:** Ecossistema de Big Data  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Quiz + atividade comparativa / gamificação (conforme plano de ensino)

---

## Instruções gerais

- Atividade **1** é em dupla (aquecimento).
- Atividade **2** é em **grupo (3 a 4)** — desafio gamificado principal.
- Atividades **3** e **4** são individuais.
- Atividade **5** é opcional (estudo de caso / plenária).
- A Atividade 2 e o quiz (Atividade 4) integram **participação (15%)** e preparam os laboratórios (40%).

---

## Atividade 1 — Dividir para conquistar (dupla)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Aplicar noções de paralelismo e particionamento.

### Cenário

Dataset de **logs de aplicação (~1 TB)** cobrindo **30 dias**. A equipe tem **5 nós** de processamento disponíveis para um job batch noturno que conta erros por serviço.

### Tarefas

**a)** Proponham **uma chave de particionamento** (ex.: por dia, por serviço, por hash…). Justifiquem.

> 

**b)** Como os 5 nós dividiriam o trabalho, em linhas gerais?

> 

**c)** Descrevam **um risco de desbalanceamento** (data skew) nesse plano:

> 

**d)** Se o objetivo mudasse para **buscar uma mensagem de erro em segundos**, a mesma estratégia bastaria? Por quê?

> 

| Nome da dupla |
|---------------|
| |
| |

---

## Atividade 2 — Arena do ecossistema: “Escolha a ferramenta” (grupo)

**Tempo sugerido:** 25 minutos (+ 2 min de apresentação)  
**Objetivo:** Comparar soluções com critérios de eficiência, escalabilidade e custo.

### Regras da gamificação

1. Para cada missão, escolham **uma opção principal**:
   - **S** = Spark  
   - **E** = Elasticsearch  
   - **R** = SGBD relacional  
   - **H** = Hadoop/HDFS (contexto conceitual)  
   - **C** = Combinação (especificar quais)
2. Atribuam notas de **1 a 5** (5 = melhor no critério) para:
   - Eficiência (tempo/recurso para o objetivo)
   - Escalabilidade (se o volume crescer bastante)
   - Custo (infra + complexidade de operar/manter) — aqui **5 = mais vantajoso / menor custo relativo**
3. Soma máxima por missão = 15.  
4. Ao final, apresentem a missão em que houve **mais discussão interna**.

### Missões

**Missão 1 — Madrugada de cliques**  
Agregar **500 GB/dia** de eventos JSON (cliques) para gerar métricas de funil até as 6h.

**Missão 2 — Busca na loja**  
Autocomplete e busca de produtos por nome/descrição com resposta em **menos de 1 segundo**.

**Missão 3 — Cadastro crítico**  
Manter cadastro de clientes com CPF único, status e integridade com tabela de contratos.

**Missão 4 — Legado do data lake**  
A documentação da empresa cita arquivos históricos em **HDFS** processados no passado com **MapReduce**. Vocês precisam **explicar** o papel disso em uma reunião (não necessariamente reimplementar).

### Ficha do grupo

| Missão | Opção (S/E/R/H/C) | Se C, quais? | Eficiência (1–5) | Escalabilidade (1–5) | Custo (1–5) | Total | Justificativa (2–3 linhas) |
|--------|-------------------|--------------|------------------|----------------------|-------------|-------|----------------------------|
| 1 | | | | | | | |
| 2 | | | | | | | |
| 3 | | | | | | | |
| 4 | | | | | | | |

**Missão mais difícil para o grupo e por quê:**

> 

**Integrantes:**

| Nome | Papel na dinâmica (opcional) |
|------|------------------------------|
| | |
| | |
| | |
| | |

---

## Atividade 3 — MapReduce no papel (individual)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Explicitar a lógica map → agregação → reduce sem código complexo.

### Problema

Pedidos (amostra):

| pedido_id | cidade | valor |
|-----------|--------|-------|
| 1 | Goiânia | 50 |
| 2 | Anápolis | 30 |
| 3 | Goiânia | 20 |
| 4 | Goiânia | 10 |
| 5 | Anápolis | 40 |

Queremos o **total de vendas por cidade**.

**a)** O que cada etapa **Map** emitiria (pares chave → valor)? Liste pelo menos 5 pares.

> 

**b)** Como ficaria o agrupamento por chave antes do Reduce?

> 

**c)** Qual o resultado do **Reduce**?

> 

**d)** Em uma frase: por que esse modelo ajuda quando há **milhões** de pedidos em vários nós?

> 

---

## Atividade 4 — Quiz de fixação (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Verificar compreensão conceitual (instrumento previsto no plano).

### Parte A — Verdadeiro (V) ou Falso (F)

| # | Afirmação | V/F |
|---|-----------|-----|
| 1 | Paralelismo significa executar várias tarefas ao mesmo tempo para reduzir o tempo total. | |
| 2 | Particionamento ruim pode deixar um nó muito mais carregado que os outros. | |
| 3 | MapReduce, em essência, combina uma fase de transformação/emissão (map) com uma fase de agregação (reduce). | |
| 4 | Elasticsearch é, em geral, a melhor primeira escolha para ETL batch de centenas de GB. | |
| 5 | Spark é adequado para processamento paralelo em lote sobre grandes volumes. | |
| 6 | Custo (infra e complexidade) deve entrar na decisão junto com desempenho. | |
| 7 | Hadoop/HDFS aparece sobretudo como base histórica/conceitual de armazenamento e processamento distribuído. | |
| 8 | Se a busca textual em logs precisa responder em segundos, SGBD clássico costuma ser a opção mais natural. | |

### Parte B — Associação (uma letra por item)

**Opções:**  
**A)** Spark · **B)** Elasticsearch · **C)** SGBD · **D)** Particionamento · **E)** MapReduce (conceito)

| # | Situação | Letra |
|---|----------|-------|
| 9 | Contar palavras/eventos em pedaços e depois somar por chave | |
| 10 | Dividir arquivos de pedidos por mês para ler só o necessário | |
| 11 | Job noturno que limpa e agrega 200 GB de JSON | |
| 12 | Buscar tickets com a frase “queda de sinal” | |
| 13 | Garantir FK entre pedido e cliente | |

---

## Atividade 5 — Caso LogBrasil (grupo ou plenária)

**Tempo sugerido:** 15 minutos (opcional)  
**Objetivo:** Montar uma solução comparativa coerente.

### Caso

A **LogBrasil** gera **2 TB/dia** de logs.

| Demanda | Descrição |
|---------|-----------|
| A | Relatório diário de erros por serviço (pronto às 7h) |
| B | Tela para buscar mensagem de erro em segundos |
| C | Arquivar logs brutos por 180 dias com foco em baixo custo |

### Questões

**1)** Para A, B e C, indique ferramenta principal e uma alternativa:

| Demanda | Principal | Alternativa | Motivo |
|---------|-----------|-------------|--------|
| A | | | |
| B | | | |
| C | | | |

**2)** Proponham uma arquitetura em 4 blocos (texto):

> armazenamento → processamento → indexação/busca → consumo

**3)** Se o volume subir para **10 TB/dia**, o que quebra primeiro na proposta de vocês (eficiência, custo ou operação)? 

> 

**4)** Uma pergunta que vocês fariam ao cliente antes de fechar a escolha:

> 

---

## Para o professor — Gabarito e orientações

### Atividade 1 — Orientações

- Chaves boas: **por dia** (natural para 30 dias), por serviço (se distribuição for uniforme), ou combinação dia+serviço.
- Risco clássico: um dia/serviço com pico (Black Friday de erros) concentra carga.
- Para busca em segundos: apontar **Elasticsearch** (ou índice dedicado), não só batch paralelo.

### Atividade 2 — Gabarito orientativo

| Missão | Tendência | Notas |
|--------|-----------|-------|
| 1 | **S** (Spark) | Batch volumoso |
| 2 | **E** (Elasticsearch) | Baixa latência de busca |
| 3 | **R** (SGBD) | Integridade |
| 4 | **H** (conceitual) ou **H+S** | Explicar HDFS/MapReduce; Spark pode ser o motor moderno equivalente em muitos cenários |

Valorizar grupos que marcam custo baixo com honestidade (ex.: Spark em nuvem não é “de graça”).

### Atividade 3 — Gabarito

**Map (exemplos):** (`Goiânia`,50), (`Anápolis`,30), (`Goiânia`,20), (`Goiânia`,10), (`Anápolis`,40)

**Agrupamento:**  
Goiânia → [50,20,10] · Anápolis → [30,40]

**Reduce:** Goiânia = **80** · Anápolis = **70**

### Atividade 4 — Gabarito

**Parte A:** 1V, 2V, 3V, 4F, 5V, 6V, 7V, 8F  

**Parte B:** 9E, 10D, 11A, 12B, 13C

### Atividade 5 — Orientações

| Demanda | Principal típico |
|---------|------------------|
| A | Spark (batch) |
| B | Elasticsearch |
| C | Armazenamento barato tipo object storage / HDFS conceitual + política de retenção |

### Critérios rápidos de participação (qualitativo)

| Critério | Indicador |
|----------|-----------|
| Conceito | Atividade 1 coerente sobre partição e risco |
| Comparação | Ficha da Arena completa com justificativas |
| MapReduce | Atividade 3 com totais corretos (80 / 70) |
| Quiz | ≥ 10 acertos nos 13 itens da Atividade 4 |

---

## Referências

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- ERL, T.; KHATTAK, W.; BUHLER, P. *Big Data Fundamentals.* Prentice Hall, 2015.
- RAMOS, A. *Infraestrutura Big Data com opensource.* Ciência Moderna, 2015.
- Documentação Apache Hadoop (visão geral), Apache Spark e Elasticsearch

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
