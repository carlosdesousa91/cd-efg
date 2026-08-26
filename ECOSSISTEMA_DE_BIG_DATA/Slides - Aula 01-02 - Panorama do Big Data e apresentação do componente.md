---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ecossistema de Big Data · Aula 01-02'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Ecossistema de Big Data

## Aula 01-02
### Panorama do Big Data e apresentação do componente

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:25 | Abertura, apresentação do componente e combinados |
| 0:25 – 0:55 | Avaliação diagnóstica e discussão rápida |
| 0:55 – 1:10 | **Intervalo** |
| 1:10 – 2:10 | O que é Big Data? Os Vs e casos de uso |
| 2:10 – 2:25 | **Intervalo** |
| 2:25 – 3:25 | Processamento tradicional × Big Data e ecossistema |
| 3:25 – 4:00 | Avaliação, cronograma, fixação e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Reconhecer** o papel do componente na Etapa II (Big Data)
2. **Definir** Big Data e suas características principais (os “Vs”)
3. **Diferenciar** processamento tradicional e processamento em escala
4. **Identificar** casos de uso e desafios de infraestrutura
5. **Compreender** o plano de ensino, a avaliação e o percurso do componente

---

## Por que este componente existe?

> No universo atual da ciência de dados, **Big Data** é mais do que “muito dado”: são conjuntos **complexos** e de **rápida evolução** que exigem soluções avançadas de processamento.

- Formar técnicos capazes de **compreender infraestruturas** e **ferramentas** de grande volume
- Preparar para a saída intermediária: **Assistente de Big Data**
- Base para componentes seguintes: Ingestão, Sistemas, Projeto Profissional de Big Data

---

## Onde estamos no curso?

### Etapa II — Big Data (240h)

| Componente | Carga |
|------------|-------|
| **Ecossistema de Big Data** | **40h** ← estamos aqui |
| Desenvolvimento de Sistemas Aplicados a Dados | 40h |
| Ingestão de Dados | 80h |
| Sistemas de Computação | 40h |
| Inglês Aplicado à Big Data | 40h |
| Projeto Profissional de Big Data | 40h |

**Saída intermediária:** Assistente de Big Data

---

## Plano de ensino deste componente

- **Carga horária:** 40h (16h teórica · 24h prática)
- **Ementa:** infraestrutura · paralelismo · **Spark** · **Elasticsearch** · batch · streaming · SQL em grandes volumes
- **Metodologia:** projetos, estudos de caso, storytelling, laboratório, aprendizagem colaborativa
- **Avaliação:** contínua — participação, práticas, projetos e teórico-prática

*O cronograma detalhado será compartilhado hoje e pode ser ajustado com a coordenação.*

---

## Como você será avaliado(a)

| Instrumento | Peso |
|-------------|------|
| Participação e engajamento | 15% |
| Atividades práticas e laboratoriais | 40% |
| Projetos práticos (intermediário + integrador) | 30% |
| Avaliação teórico-prática | 15% |

- Frequência mínima: **75%**
- Aprovação: conceitos **Apto** (≥ 6,0) ou **Não Apto**
- Recuperação disponível conforme orientação da coordenação

---

## Avaliação diagnóstica (30 min)

Antes de avançarmos, vamos conhecer o perfil da turma.

**Atividade:** responder à **Atividade 1** do caderno de exercícios.

- Não há nota — serve para planejar o ritmo e os laboratórios
- Seja honesto(a): não existe resposta certa ou errada
- Tempo: ~15 min individual + ~15 min discussão rápida em duplas

---

## Discussão rápida (5 min)

**Pergunta para a turma:**

> Quais situações do seu dia a dia geram ou consomem **grandes volumes** de dados — e em **alta velocidade**?

Exemplos: redes sociais, apps de transporte, streaming de vídeo, sensores, e-commerce, saúde, trânsito...

---

## O que é Big Data?

**Definição prática:**

Conjuntos de dados cujo **volume**, **velocidade** e/ou **variedade** tornam inviável (ou ineficiente) o uso exclusivo de ferramentas e arquiteturas **tradicionais** de armazenamento e processamento.

Big Data **não** é só “arquivo grande” — é um **desafio de infraestrutura, processamento e análise**.

---

## Os “Vs” do Big Data

| V | Significado | Exemplo |
|---|-------------|---------|
| **Volume** | Quantidade de dados | Terabytes/petabytes de logs |
| **Velocidade** | Ritmo de geração/processamento | Cliques em tempo real |
| **Variedade** | Formatos e estruturas | CSV, JSON, vídeo, texto |
| **Veracidade** | Qualidade e confiabilidade | Dados incompletos ou ruidosos |
| **Valor** | Utilidade para decisão | Insight que gera ação |

*Os três primeiros (volume, velocidade, variedade) são os clássicos; veracidade e valor completam a visão moderna.*

---

## Storytelling — O dia de um app de entrega

Imagine um app de delivery em uma noite de sexta-feira em Goiânia:

1. **Milhares** de pedidos por minuto (velocidade)
2. Dados de GPS, cardápio, pagamento e chat (variedade)
3. Histórico de meses/anos de pedidos (volume)
4. Endereços duplicados e tipagens erradas (veracidade)
5. Otimizar rotas e promoções (valor)

**Pergunta:** um único banco relacional “clássico” resolve tudo sozinho? Por quê?

---

## Processamento tradicional × Big Data

| Aspecto | Tradicional | Big Data |
|---------|-------------|----------|
| Escala | MB–GB | GB–TB–PB |
| Arquitetura | Servidor / SGBD central | Distribuída (cluster / nuvem) |
| Processamento | Sequencial ou limitado | Paralelo e massivo |
| Tipos de dado | Predominantemente estruturados | Estruturados + semi + não estruturados |
| Latência | Relatórios e lotes | Batch **e** near/real-time |
| Ferramentas | SQL, planilhas, BI clássico | Spark, Elasticsearch, pipelines etc. |

---

## Quando “vira” Big Data?

Sinais de que a abordagem tradicional começa a falhar:

- Consultas SQL demoram **horas** ou travam
- Arquivos não cabem em uma máquina só
- Dados chegam **continuamente** (stream) e precisam de resposta rápida
- Fontes misturam tabela + JSON + logs + texto
- Custo de hardware/licença cresce sem ganho proporcional

*Nem todo projeto é Big Data — parte da competência é **saber quando** escalar.*

---

## Casos de uso (visão geral)

| Setor | Exemplo de uso |
|-------|----------------|
| Varejo / e-commerce | Recomendação, estoque, fraude |
| Transporte | Tráfego, rotas, sensores de frota |
| Saúde | Prontuários, imagens, vigilância epidemiológica |
| Governo | Dados abertos, serviços digitais, smart city |
| Mídia / redes | Feed, moderação, métricas de engajamento |
| Indústria | IoT, manutenção preditiva, qualidade |

---

## Desafios de infraestrutura

Trabalhar com Big Data exige pensar em:

- **Armazenamento** distribuído e confiável
- **Processamento** paralelo (dividir o trabalho entre nós)
- **Rede** e transferência de grandes volumes
- **Orquestração** de jobs (quando e como rodar pipelines)
- **Custo** × desempenho × escalabilidade
- **Segurança** e privacidade (LGPD também vale em escala!)

---

## Panorama do ecossistema (primeira visão)

Neste componente vamos estudar, entre outros:

| Ferramenta / ideia | Papel |
|--------------------|-------|
| **Apache Spark** | Processamento paralelo e análise em escala |
| **Elasticsearch** | Indexação, busca e analytics near real-time |
| **SGBD / SQL** | Dados estruturados e contraste com motores distribuídos |
| **Batch** | Processamento em lote |
| **Streaming** | Processamento contínuo / tempo real |

*Na Aula 03-04 aprofundamos tipos de dados e escolha de ferramentas.*

---

## Estudo de caso — Plataforma de streaming de vídeo

**Contexto:** empresa com milhões de usuários assistindo conteúdo simultaneamente.

**Dados gerados:**
- Eventos de play/pause/seek (velocidade)
- Catálogo, legendas, avaliações (variedade)
- Histórico de visualização (volume)

**Discussão (5 min):**
1. O que precisa ser processado **em lote** (ex.: relatório diário)?
2. O que precisa ser **quase em tempo real** (ex.: “continuar assistindo”)?
3. Onde a **busca** rápida (títulos, usuários) seria crítica?

---

## Atividade em grupo (20 min)

**Exercício 2 — Mapa dos Vs**

Em grupos de 3 a 4 pessoas:

1. Escolham **um cenário** real (app, empresa local, órgão público, rede social…)
2. Preencham a tabela dos **5 Vs** com exemplos concretos
3. Digam se o problema parece **tradicional**, **Big Data** ou **híbrido** — e por quê

*Um representante compartilha com a turma em 2 minutos.*

---

## Projetos do componente (visão geral)

### Projeto intermediário (~15%)
Pipeline **batch** com **Spark** e/ou indexação no **Elasticsearch**, com avaliação básica de desempenho.

### Projeto integrador (~15%)
Solução que combine tipos de dados, processamento e critérios de **eficiência, escalabilidade e custo**.

```
Fundamentos → Infraestrutura → Spark + Elasticsearch
     → Batch/Streaming → Projeto integrador → Avaliação final
```

---

## Cronograma resumido do componente

| Bloco | Tema | Horas |
|-------|------|-------|
| 1 | Fundamentos de Big Data e tipos de dados | 8h |
| 2 | Infraestrutura e processamento massivo paralelo | 8h |
| 3 | Spark, Elasticsearch e processamento em lote | 12h |
| 4 | Streaming, integração e avaliação | 12h |

**Próxima aula (03-04):** tipos de dados (estruturados, semiestruturados, não estruturados) e escolha de ferramentas.

---

## Combinados para o componente

- **Presença ativa** — laboratório e projetos exigem participação contínua
- **Documentar** decisões de arquitetura e ferramentas (não só o resultado)
- **Comunicar dificuldades** cedo — recuperação e mentoria existem
- **Respeitar** entregas de projetos intermediário e integrador
- **Colaborar** — pair work e revisão entre pares fazem parte da formação

---

## Recursos de apoio

- Plano de ensino completo (plataforma / SIGA)
- Caderno de exercícios da Aula 01-02
- Documentação: Apache Spark, Elasticsearch, Kibana
- Ambientes: local, Docker, Colab/Databricks Community (conforme infraestrutura)
- Acervo virtual institucional e coordenação pedagógica

---

## Fixação — Exercício 4 (10 min)

**Associe** cada situação ao conceito mais adequado:

| Situação | Conceito |
|----------|----------|
| A) Logs de clique a cada segundo no site | ( ) Volume ( ) Velocidade ( ) Valor |
| B) Mistura de CSV, JSON e vídeos | ( ) Variedade ( ) Veracidade ( ) Batch |
| C) Consulta SQL que demora 6 horas | ( ) Sinal de escala ( ) Soft skill ( ) LGPD |
| D) Insight que reduz custo de frete | ( ) Valor ( ) Shard ( ) Mapping |

*Gabarito no caderno de exercícios.*

---

## Síntese da aula

Hoje você:

- Conheceu o **componente** e os **critérios de avaliação**
- Definiu **Big Data** e os principais **Vs**
- Diferenciou processamento **tradicional** e em **escala**
- Explorou **casos de uso**, desafios e o **ecossistema** (Spark, Elasticsearch…)
- Visualizou o **cronograma** e os **projetos** do componente

**Próxima aula (03-04):** tipos de dados e critérios de escolha de ferramentas (SGBD, Spark, Elasticsearch).

---

## Referências desta aula

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- Plano de Curso — Técnico em Ciência de Dados (Escola do Futuro / UFG)
- ERL, T.; KHATTAK, W.; BUHLER, P. *Big Data Fundamentals.* Prentice Hall, 2015.
- TAURION, C. *Big Data.* Rio de Janeiro: Brasport, 2015.
- DAVENPORT, T. H. *Big data no trabalho.* São Paulo: Alta Books, 2017.

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Complete as **Atividades 1, 2, 3 e 4** do caderno de exercícios.

Traga na próxima aula: **1 exemplo** do seu cotidiano que misture volume, velocidade ou variedade de dados.

**Escola do Futuro · Ciência de Dados**
