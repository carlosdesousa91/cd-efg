# Exercício — Aula 01-02
## Panorama do Big Data e apresentação do componente

**Componente curricular:** Ecossistema de Big Data  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Avaliação diagnóstica + atividades formativas

---

## Instruções gerais

- Atividades **1** e **3** são individuais.
- Atividade **2** é em grupo (3 a 4 integrantes).
- Atividade **4** é individual (fixação).
- Atividade **5** é opcional (grupo ou discussão plenária, se houver tempo).
- A Atividade 1 **não vale nota** — compõe a avaliação diagnóstica.
- As demais podem integrar a avaliação de **participação e engajamento (15%)**.

---

## Atividade 1 — Avaliação diagnóstica (individual)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Mapear experiências prévias e expectativas da turma.

Responda com sinceridade. Não consulte colegas nesta etapa.

### 1.1 Dados pessoais (opcional para o professor organizar equipes)

| Campo | Sua resposta |
|-------|--------------|
| Nome | |
| Já trabalhou ou estagiou com dados/TI? (Sim/Não) | |
| Setor ou contexto, se sim | |

### 1.2 Autoavaliação (escala de 1 a 5)

*1 = nunca ouvi falar · 3 = já pratiquei um pouco · 5 = me sinto confiante*

| Tema | 1 | 2 | 3 | 4 | 5 |
|------|---|---|---|---|---|
| Bancos de dados / SQL | | | | | |
| Python ou outra linguagem do curso | | | | | |
| Conceito de Big Data | | | | | |
| Processamento paralelo / clusters (noções) | | | | | |
| Apache Spark | | | | | |
| Elasticsearch (ou motores de busca) | | | | | |
| Trabalho em equipe em projetos técnicos | | | | | |

### 1.3 Perguntas abertas (respostas curtas)

**a)** O que você entende por "Big Data"?

> 

**b)** Cite uma situação do cotidiano que gera **muitos dados** ou dados em **alta velocidade**:

> 

**c)** O que você espera aprender neste componente?

> 

**d)** Qual sua maior dificuldade ou receio em relação a laboratórios (Spark, Elasticsearch, ambiente técnico)?

> 

**e)** Você já ouviu falar de processamento em lote (batch) ou em tempo real? Explique com suas palavras:

> 

---

## Atividade 2 — Mapa dos Vs (grupo)

**Tempo sugerido:** 20 minutos (+ 2 min de apresentação por grupo)  
**Objetivo:** Aplicar as características do Big Data a um cenário concreto.

### Contexto

Sua equipe foi convidada a analisar se um problema real exige abordagem de **Big Data** ou se uma solução **tradicional** bastaria.

Escolham **um** dos cenários abaixo **ou** proponham outro (com autorização do professor).

---

**Cenário A — E-commerce regional**  
Loja online com picos de venda em datas promocionais, catálogo de produtos, avaliações em texto, logs de clique e histórico de pedidos dos últimos 3 anos.

**Cenário B — App de transporte urbano**  
Corridas em tempo real, GPS dos motoristas, preços dinâmicos, reclamações em chat e relatório mensal de desempenho por bairro.

**Cenário C — Hospital / clínica em rede**  
Prontuários, exames (laudos e imagens), filas de atendimento e painel gerencial diário de ocupação de leitos.

**Cenário D — Prefeitura / dados abertos**  
Dados de transporte público, iluminacao, ouvidoria (texto) e dashboard semanal para a gestão.

---

### Tarefas do grupo

**1)** Cenário escolhido: _______________________________

**2)** Preencham a tabela dos Vs:

| V | Exemplo concreto no cenário | Intensidade (baixa / média / alta) |
|---|-----------------------------|-------------------------------------|
| Volume | | |
| Velocidade | | |
| Variedade | | |
| Veracidade | | |
| Valor | | |

**3)** Classificação da equipe:

- [ ] Predominantemente **tradicional**
- [ ] Predominantemente **Big Data**
- [ ] **Híbrido** (partes tradicionais + partes em escala)

**Justificativa (3 a 5 linhas):**

> 

**4)** Quais **duas ferramentas** do ecossistema deste componente (Spark, Elasticsearch, SGBD/SQL, batch, streaming) fariam mais sentido no cenário? Por quê?

| Ferramenta | Motivo |
|------------|--------|
| | |
| | |

**5)** Nome dos integrantes:

| Integrante | Função na dinâmica (opcional) |
|------------|-------------------------------|
| | |
| | |
| | |
| | |

---

## Atividade 3 — Mini reflexão: tradicional × Big Data (individual)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Diferenciar abordagens e argumentar com critérios claros.

Redija **um parágrafo** (8 a 12 linhas) respondendo:

> **"Em que situação eu usaria um banco relacional clássico e em que situação eu consideraria Spark ou Elasticsearch?"**

Seu texto **deve** incluir:

- [ ] **1 exemplo** de problema adequado a SGBD/SQL tradicional
- [ ] **1 exemplo** de problema que sugere Big Data / processamento em escala
- [ ] Pelo menos **2 Vs** (volume, velocidade, variedade, veracidade ou valor) na argumentação
- [ ] **1 cuidado** (custo, complexidade ou privacidade/LGPD)

**Espaço para redação:**

> 

---

## Atividade 4 — Associação: situação × conceito (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Fixar definições e sinais de escala.

**Instrução:** Para cada item, marque **uma** letra (A–G) correspondente ao conceito **mais central**.

**Opções:**

- **A)** Volume  
- **B)** Velocidade  
- **C)** Variedade  
- **D)** Veracidade  
- **E)** Valor  
- **F)** Processamento tradicional (SGBD/SQL clássico)  
- **G)** Sinal de necessidade de abordagem Big Data / em escala  

| # | Situação | Letra |
|---|----------|-------|
| 1 | Um sensor IoT envia medições a cada segundo para a nuvem. | |
| 2 | A base mistura tabelas SQL, arquivos JSON e prints de conversas. | |
| 3 | Após limpar e analisar os dados, a empresa reduz 12% o desperdício de estoque. | |
| 4 | Há 50 mil linhas em uma planilha bem modelada e as consultas respondem em segundos. | |
| 5 | Uma consulta no servidor único demora 8 horas e a base cresce 200 GB por semana. | |
| 6 | Endereços duplicados, datas inválidas e campos vazios comprometem o relatório. | |
| 7 | O data lake da empresa armazena petabytes de histórico de cliques. | |
| 8 | O app precisa sugerir conteúdo “agora”, com base no que o usuário acabou de assistir. | |

---

## Atividade 5 — Estudo de caso: plataforma de vídeo (grupo ou plenária)

**Tempo sugerido:** 15 minutos (se houver tempo ao final da aula)  
**Objetivo:** Relacionar casos de uso a batch, tempo real e busca.

Leia o caso e responda.

---

**Caso — StreamBrasil**  
Plataforma de streaming com milhões de usuários. Gera eventos de play/pause, mantém catálogo de títulos, avaliações em texto e histórico de visualização. A diretoria pede: (1) relatório diário de horas assistidas por região; (2) lista “continuar assistindo” atualizada quase na hora; (3) busca rápida de títulos e atores.

---

### Questões

**1)** Classifique cada demanda:

| Demanda | Batch, near/real-time ou busca/indexação? | Justificativa breve |
|---------|-------------------------------------------|---------------------|
| Relatório diário por região | | |
| Continuar assistindo | | |
| Busca de títulos/atores | | |

**2)** Qual ferramenta deste componente parece mais alinhada a cada demanda (Spark, Elasticsearch ou SGBD)? Pode repetir.

| Demanda | Ferramenta sugerida |
|---------|---------------------|
| Relatório diário | |
| Continuar assistindo | |
| Busca de títulos | |

**3)** Cite **um risco** de infraestrutura (custo, latência, qualidade dos dados ou privacidade) nesse cenário:

> 

**4)** Liste **três aprendizados** que você quer levar deste componente para o projeto integrador:

> 1.  
> 2.  
> 3.  

---

## Para o professor — Gabarito e orientações

### Atividade 1

- Usar resultados para formar equipes heterogêneas (misturar níveis de autoavaliação).
- Consolidar médias por tema para replanejar reforços (ex.: se Spark/Elasticsearch estiverem baixos, reforçar nas Aulas 09-12).
- A discussão em duplas após o questionário deve ser breve e acolhedora.

### Atividade 2 — Orientações

- Não há classificação única “certa”: valorizar a **argumentação** com base nos Vs.
- Cenários B e C tendem a **híbrido/Big Data** (tempo real + histórico + variedade).
- Cenário A pode ser híbrido: catálogo/pedidos em SGBD + logs/cliques em escala.
- Cobrar menção a pelo menos uma ferramenta do componente (Spark ou Elasticsearch).

### Atividade 4 — Gabarito sugerido

| # | Resposta | Justificativa breve |
|---|----------|---------------------|
| 1 | **B** | Alta frequência de geração (velocidade) |
| 2 | **C** | Múltiplos formatos (variedade) |
| 3 | **E** | Insight que gera resultado de negócio (valor) |
| 4 | **F** | Escala e latência compatíveis com abordagem tradicional |
| 5 | **G** | Gargalo de desempenho e crescimento — sinal de escala |
| 6 | **D** | Qualidade/confiabilidade dos dados (veracidade) |
| 7 | **A** | Quantidade extrema de dados (volume) |
| 8 | **B** (ou discussão com near real-time) | Resposta imediata / velocidade; aceitar diálogo com streaming |

*Item 8 admite discussão: o foco é latência/velocidade da necessidade de negócio.*

### Atividade 5 — Orientações

| Demanda | Classificação típica | Ferramenta alinhada |
|---------|----------------------|---------------------|
| Relatório diário | Batch | Spark (ou SGBD se volume couber) |
| Continuar assistindo | Near/real-time | Streaming + armazenamento de estado; Spark Structured Streaming (nível introdutório) |
| Busca de títulos | Busca/indexação | Elasticsearch |

### Critérios rápidos de participação (qualitativo)

| Critério | Indicador |
|----------|-----------|
| Engajamento | Contribuiu nas discussões e na Atividade 2 |
| Clareza | Atividade 3 coerente e completa |
| Colaboração | Grupo entregou mapa dos Vs preenchido |
| Fixação | ≥ 6 acertos na Atividade 4 |

---

## Referências

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- PC — Ciência de Dados — Paulo Renato de Souza
- ERL, T.; KHATTAK, W.; BUHLER, P. *Big Data Fundamentals.* Prentice Hall, 2015.
- TAURION, C. *Big Data.* Rio de Janeiro: Brasport, 2015.
- DAVENPORT, T. H. *Big data no trabalho.* São Paulo: Alta Books, 2017.

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
