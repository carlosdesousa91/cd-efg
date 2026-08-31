---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ecossistema de Big Data · Aula 05-06'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Ecossistema de Big Data

## Aula 05-06
### Infraestrutura de processamento de dados

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 03-04 e objetivos de hoje |
| 0:20 – 1:00 | Componentes: armazenamento, processamento e orquestração |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | Clusters, nós e ambientes (local, cluster, nuvem) |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:30 | Trade-offs de custo e desempenho + diagramação |
| 3:30 – 4:00 | Entrega da arquitetura simplificada e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Reconhecer** os componentes de uma infraestrutura de Big Data e seus papéis
2. **Descrever** armazenamento, processamento e orquestração de forma integrada
3. **Explicar** clusters e nós em visão conceitual
4. **Comparar** ambientes local, cluster e nuvem
5. **Analisar** trade-offs de custo e desempenho e **desenhar** uma arquitetura simplificada

---

## Retomada — Aula 03-04

Na aula anterior, você:

- Diferenciou dados **estruturados**, **semiestruturados** e **não estruturados**
- Relacionou tipos de dados a **SGBD**, **Spark** e **Elasticsearch**

**Pergunta de abertura (3 min):**

> Ter a ferramenta certa basta? Ou também precisamos de um “lugar” e uma “organização” para ela rodar?

---

## O que é infraestrutura de Big Data?

É o conjunto de **recursos e serviços** que permitem:

- **Guardar** dados em escala
- **Processar** dados (em lote ou contínuo)
- **Coordenar** quando e como os jobs rodam
- **Entregar** resultados com custo e desempenho aceitáveis

> Ferramenta sem infraestrutura é como motor sem chassi: não anda direito.

---

## Três pilares (visão didática)

```
┌────────────────┐   ┌────────────────┐   ┌────────────────┐
│ ARMAZENAMENTO  │ → │ PROCESSAMENTO  │ → │ ORQUESTRAÇÃO   │
│ Onde os dados  │   │ Onde o trabalho│   │ Quem agenda e  │
│ ficam          │   │ é executado    │   │ coordena       │
└────────────────┘   └────────────────┘   └────────────────┘
```

Na prática os três se conectam o tempo todo — e ainda dialogam com **rede**, **segurança** e **monitoramento**.

---

## 1) Armazenamento — papel

**Função:** persistir dados de forma confiável e acessível.

Pode incluir:
- Sistemas de arquivos locais ou distribuídos
- Object storage em nuvem (ex.: buckets)
- Bancos relacionais e NoSQL
- Índices de busca (ex.: Elasticsearch)
- Data lakes / camadas brutas e tratadas (visão conceitual)

**Pergunta-chave:** *os dados precisam ser duráveis, baratos, rápidos — ou os três?*

---

## Armazenamento — exemplos no nosso ecossistema

| Necessidade | Exemplo de destino |
|-------------|--------------------|
| Cadastro e integridade | SGBD (MariaDB / PostgreSQL) |
| Arquivos brutos / lote | Disco, HDFS (conceitual), object storage |
| Busca e exploração | Índices no Elasticsearch |
| Datasets analíticos | Parquet/CSV processados pelo Spark |

*Um projeto costuma ter **mais de um** tipo de armazenamento.*

---

## 2) Processamento — papel

**Função:** transformar, agregar, limpar e analisar dados.

Pode ser:
- **Batch** — processa um volume em janelas (ex.: job noturno)
- **Streaming / near real-time** — processa continuamente
- **Consulta interativa** — usuário pergunta e espera resposta rápida

**No componente:** Spark (processamento em escala) e consultas/buscas no Elasticsearch.

---

## Processamento — quem executa o trabalho?

```
Entrada (dados)  →  Motor de processamento  →  Saída (tabela, arquivo, índice)
                         │
                    CPU / memória / tempo
```

Quanto maior o volume, mais faz sentido **dividir** o trabalho entre várias máquinas (paralelismo — Aula 07-08).

---

## 3) Orquestração — papel

**Função:** coordenar **quando**, **em que ordem** e **com que dependências** os processos rodam.

Exemplos de responsabilidades:
- Agendar job diário às 02:00
- Só rodar a etapa B se a etapa A terminar com sucesso
- Reexecutar em caso de falha (retry)
- Registrar logs e alertas

**Ferramentas (visão):** cron, Airflow, pipelines gerenciados em nuvem — o conceito importa mais que o produto.

---

## Analogia rápida (5 min)

Compare com uma **cozinha industrial**:

| Cozinha | Infraestrutura de dados |
|---------|-------------------------|
| Despensa / câmaras | Armazenamento |
| Fogões / preparo | Processamento |
| Chef de cozinha / roteiro do serviço | Orquestração |
| Garçons / pedidos | Consumidores (BI, APIs, busca) |

**Discussão:** o que acontece se a despensa estiver cheia, mas ninguém coordenar o preparo?

---

## Cluster e nó — visão conceitual

**Nó:** uma máquina (física ou virtual) que participa do sistema.  
**Cluster:** conjunto de nós que trabalham juntos.

```
        ┌─────────┐
        │  Nó 1   │
        └────┬────┘
┌─────────┐  │  ┌─────────┐
│  Nó 2   ├──┴──┤  Nó 3   │   = CLUSTER
└─────────┘     └─────────┘
```

Ideia central: **dividir dados e tarefas** para ganhar escala e resiliência.

---

## Por que usar cluster?

| Benefício | Em linguagem simples |
|-----------|----------------------|
| Escalabilidade | Cresce adicionando nós |
| Desempenho | Mais mão de obra paralela |
| Resiliência | Se um nó falha, outros podem continuar (com desenho adequado) |
| Especialização | Alguns nós armazenam, outros processam |

**Custo:** mais complexidade operacional (rede, configuração, monitoramento).

---

## Ambientes: local × cluster × nuvem

| Ambiente | O que é | Quando faz sentido |
|----------|---------|-------------------|
| **Local** | Seu PC / lab / uma VM | Aprender, prototipar, datasets pequenos |
| **Cluster** | Várias máquinas gerenciadas por você/empresa | Carga estável, controle fino, dados sensíveis on-premises |
| **Nuvem** | Recursos sob demanda (IaaS/PaaS) | Elasticidade, menos capex, experimentos rápidos |

*Neste curso, laboratórios podem ser locais, Docker ou nuvem trial — conforme a infraestrutura da unidade.*

---

## Ambiente local

**Vantagens:** barato para estudar; controle total; offline parcial.  
**Limitações:** pouca RAM/CPU; não simula bem falhas e escala real; disco limitado.

**Exemplos didáticos:**
- Spark “local mode”
- Elasticsearch + Kibana via Docker no notebook
- PostgreSQL no lab

> Local é excelente para **aprender o conceito** — não para afirmar “aguenta produção”.

---

## Ambiente em cluster (on-premises)

**Vantagens:** desempenho previsível; dados próximos; compliance em alguns cenários.  
**Limitações:** investimento alto; equipe para manter; escala lenta (comprar/instalar hardware).

Pense em: sala de servidores + rede + energia + backup + pessoas.

---

## Ambiente em nuvem

**Vantagens:** sobe/desce recursos; paga pelo uso; serviços gerenciados (banco, storage, Spark).  
**Limitações:** custo pode explodir sem governança; dependência de provedor; latência/egresso de dados.

**Perguntas de ouro:**
- Quanto custa **armazenar**?
- Quanto custa **processar**?
- Quanto custa **sair** com os dados (egress)?

---

## Trade-offs: custo × desempenho

Não existe arquitetura “perfeita” — existe arquitetura **adequada**.

| Se você prioriza… | Pode sacrificar… |
|-------------------|------------------|
| Baixo custo | Velocidade ou disponibilidade |
| Baixa latência | Custo (mais nós / SSD / réplicas) |
| Máxima disponibilidade | Complexidade e dinheiro |
| Simplicidade operacional | Flexibilidade extrema |

**Regra prática:** otimize o que o negócio **sente** (prazo, custo, SLA) — não o que parece “mais moderno”.

---

## Matriz rápida de decisão

| Situação | Tendência |
|----------|-----------|
| Aula / protótipo / 1–5 GB | Local |
| Job noturno pesado, equipe pequena | Nuvem gerenciada ou cluster enxuto |
| Dados críticos e política on-prem | Cluster local |
| Picos imprevisíveis de carga | Nuvem (elasticidade) |
| Busca rápida em textos/logs | Elasticsearch bem dimensionado |
| Transformação massiva em lote | Spark em cluster/nuvem |

---

## Ligando aos nossos pilares + ferramentas

```
Armazenamento:  SGBD · arquivos · índices Elasticsearch
Processamento:  Spark (batch/stream) · consultas SQL · buscas
Orquestração:   agendamento do pipeline (conceitual)
Ambiente:       local / cluster / nuvem
```

A arquitetura escolhe **onde** cada peça mora e **como** elas se conversam.

---

## Estudo de caso — “AgroSinal”

Cooperativa agrícola quer:

1. Guardar telemetria de sensores (JSON) por 12 meses  
2. Gerar relatório diário de umidade por talhão (batch)  
3. Permitir busca em alertas textuais (“falha de sensor”)  
4. Rodar tudo com orçamento apertado no primeiro semestre  

**Discussão (8 min):** local, cluster ou nuvem? O que vai para Spark, SGBD e Elasticsearch?

---

## Atividade principal (25–30 min)

**Exercício 2 — Desenho de arquitetura simplificada**

Em duplas ou trios:

1. Escolher um cenário do caderno  
2. Identificar armazenamento, processamento e orquestração  
3. Escolher ambiente (local / cluster / nuvem)  
4. Desenhar o diagrama e justificar **custo × desempenho**

*Instrumento previsto no plano: exercício de arquitetura simplificada.*

---

## Como desenhar (modelo mínimo)

Use caixas e setas:

```
[Fontes] → [Armazenamento bruto]
                ↓
         [Processamento]
                ↓
    [Destino analítico / busca]
                ↑
         [Orquestração]
```

Anote ao lado: ambiente, ferramentas e 1 trade-off consciente.

---

## Sala invertida leve (para casa / reforço)

Antes da Aula 07-08, leia (15–20 min) e anote 3 dúvidas:

- O que é **paralelismo** em poucas palavras?
- O que você imagina que um **MapReduce** faz?
- Por que **particionar** dados ajudaria um cluster?

*Na próxima aula: processamento massivo paralelo e panorama Hadoop / Spark / Elasticsearch.*

---

## Fixação — Exercício 4 (10 min)

Associe o papel ao componente:

| Situação | Componente |
|----------|------------|
| A) Guardar JSON bruto por 1 ano | ( ) Armazenamento ( ) Processamento ( ) Orquestração |
| B) Agregar 80 GB toda madrugada | ( ) Armazenamento ( ) Processamento ( ) Orquestração |
| C) Disparar o job às 02:00 e alertar falha | ( ) Armazenamento ( ) Processamento ( ) Orquestração |
| D) Subir 10 VMs que trabalham juntas | ( ) Nó único ( ) Cluster ( ) Apenas BI |

*Gabarito no caderno.*

---

## Síntese da aula

Hoje você:

- Reconheceu os pilares **armazenamento**, **processamento** e **orquestração**
- Compreendeu **nós** e **clusters**
- Comparou ambientes **local**, **cluster** e **nuvem**
- Analisou **trade-offs** de custo e desempenho
- **Desenhou** uma arquitetura simplificada

**Próxima aula (07-08):** processamento massivo paralelo, MapReduce (conceitual), particionamento e panorama de ferramentas.

---

## Referências desta aula

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- RAMOS, A. *Infraestrutura Big Data com opensource.* Ciência Moderna, 2015.
- ERL, T.; KHATTAK, W.; BUHLER, P. *Big Data Fundamentals.* Prentice Hall, 2015.
- WARREN, J.; MARZ, N. *Big Data.* Manning, 2015.

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Entregue o **desenho de arquitetura** (Atividade 2) e complete as Atividades 1, 3 e 4.

Traga na próxima aula: **1 exemplo** de job que precisaria de orquestração no seu cotidiano digital.

**Escola do Futuro · Ciência de Dados**
