# Exercício — Aula 01-02
## Panorama da ingestão de dados e apresentação do componente

**Componente curricular:** Ingestão de Dados  
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
**Objetivo:** Mapear familiaridade com Python, SQL, arquivos e noções de banco de dados.

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
| Python (leitura de arquivos, scripts simples) | | | | | |
| Bancos de dados / SQL | | | | | |
| Arquivos CSV e JSON | | | | | |
| APIs (consumir dados de um serviço web) | | | | | |
| MongoDB ou outro banco NoSQL | | | | | |
| Conceito de ETL ou ELT | | | | | |
| Agendamento de tarefas (cron ou similar) | | | | | |
| Trabalho em equipe em projetos técnicos | | | | | |

### 1.3 Perguntas abertas (respostas curtas)

**a)** O que você entende por "ingestão de dados"?

> 

**b)** Cite uma situação em que um dado nasce em um lugar (planilha, sistema, site, sensor) e precisa **chegar a outro** para ser usado:

> 

**c)** O que você espera aprender neste componente?

> 

**d)** Qual sua maior dificuldade ou receio em relação a laboratórios (Python, bancos, ambiente técnico)?

> 

**e)** Você já ouviu falar de ETL ou de ELT? Explique com suas palavras, mesmo que seja só um palpite:

> 

---

## Atividade 2 — Mapa de fontes e destinos (grupo)

**Tempo sugerido:** 20 minutos (+ 2 min de apresentação por grupo)  
**Objetivo:** Identificar de onde os dados vêm, para onde vão e o que acontece se a ingestão falhar.

### Contexto

Sua equipe foi convidada a descrever **como os dados alimentam** um sistema. Ainda não é hora de escolher ETL ou ELT em detalhe: o foco é origem, destino e o papel da ingestão.

Escolham **um** dos cenários abaixo **ou** proponham outro (com autorização do professor).

---

**Cenário A — Rede de clínicas**  
Agenda em CSV, atendimentos em JSON, resultados de laboratório por API e painel diário de ocupação para a diretoria.

**Cenário B — E-commerce regional**  
Planilha de produtos, API de pagamentos, exportação de pedidos do sistema da loja e relatório semanal de vendas.

**Cenário C — Prefeitura / dados abertos**  
CSV diário de linhas de ônibus, textos da ouvidoria e tabela de frota já existente no SGBD da secretaria. A gestão quer um painel semanal.

**Cenário D — App de entrega**  
Pedidos em JSON, posição dos entregadores e planilha de estabelecimentos parceiros. A operação precisa ver o movimento do dia.

---

### Tarefas do grupo

**1)** Cenário escolhido: _______________________________

**2)** Preencham o mapa:

| Fonte | Formato ou canal (CSV, JSON, API, tabela…) | Destino (quem ou qual sistema usa) | O que se perde se essa fonte não chegar |
|-------|--------------------------------------------|------------------------------------|------------------------------------------|
| | | | |
| | | | |
| | | | |

**3)** Em uma frase: qual é o **papel da ingestão** nesse cenário?

> 

**4)** Relacionem o cenário com componentes do curso:

| Trecho do problema | Componente que mais ajuda | Por quê |
|--------------------|---------------------------|---------|
| Ler arquivo ou API e organizar o dado | Programação (Python) | |
| Guardar o dado para consulta | Armazenamento (SGBD) | |
| Pensar em volume, lote ou tempo real | Ecossistema de Big Data | |

**5)** Nome dos integrantes:

| Integrante | Função na dinâmica (opcional) |
|------------|-------------------------------|
| | |
| | |
| | |
| | |

---

## Atividade 3 — Mini reflexão: quem alimenta o sistema (individual)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Explicar o papel da ingestão na alimentação de sistemas de dados.

Redija **um parágrafo** (8 a 12 linhas) respondendo:

> **"Por que um painel, um relatório ou uma consulta SQL dependem da ingestão — e o que acontece quando ela atrasa ou falha?"**

Seu texto **deve** incluir:

- [ ] **1 fonte** concreta (arquivo, API, banco, evento ou planilha)
- [ ] **1 destino** concreto (tabela, painel, coleção ou relatório)
- [ ] Relação com **pelo menos 1** outro componente (programação, armazenamento ou ecossistema de Big Data)
- [ ] **1 cuidado** (dado incompleto, atraso, duplicidade ou privacidade/LGPD)

**Espaço para redação:**

> 

---

## Atividade 4 — Associação: situação × conceito (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Fixar o panorama da aula: fonte, destino, ingestão e primeira visão de ETL/ELT.

**Instrução:** Para cada item, marque **uma** letra (A–H) correspondente ao conceito **mais central**.

**Opções:**

- **A)** Fonte de dados  
- **B)** Destino de dados  
- **C)** Ingestão (levar o dado da origem ao destino)  
- **D)** ETL — transformar **antes** de carregar  
- **E)** ELT — carregar e transformar **no destino**  
- **F)** Falha de alimentação do sistema  
- **G)** Apoio da programação (Python)  
- **H)** Apoio do armazenamento (SGBD / SQL)  

| # | Situação | Letra |
|---|----------|-------|
| 1 | Todo dia a clínica recebe a agenda em um arquivo CSV por e-mail. | |
| 2 | O painel da diretoria lê uma tabela chamada `atendimentos_dia`. | |
| 3 | Um script lê o CSV, corrige os nomes das colunas e só então grava no banco. | |
| 4 | O arquivo bruto entra numa tabela de estágio e a limpeza é feita com SQL. | |
| 5 | O painel de segunda-feira continua mostrando os números de sexta porque o CSV de domingo não foi carregado. | |
| 6 | A equipe usa Python e a biblioteca pandas para abrir o JSON da API. | |
| 7 | Depois de carregados, os pedidos são conferidos com `SELECT` no PostgreSQL ou MariaDB. | |
| 8 | O processo combinado faz o dado sair do laboratório parceiro e aparecer no sistema da clínica. | |

---

## Atividade 5 — Estudo de caso: secretaria municipal (grupo ou plenária)

**Tempo sugerido:** 15 minutos (se houver tempo ao final da aula)  
**Objetivo:** Relacionar fontes, destinos e componentes do curso em um caso de alimentação de painel.

Leia o caso e responda.

---

**Caso — Painel da Secretaria de Mobilidade**  
A secretaria quer um painel semanal. Dispõe de: (1) CSV diário das viagens de ônibus; (2) manifestações da ouvidoria em texto; (3) cadastro da frota já gravado no SGBD interno. Na segunda-feira, a gestão cobra os números da semana. O estagiário diz que “os arquivos estão na pasta”, mas o painel não mudou.

---

### Questões

**1)** Classifique cada item:

| Item | Fonte, destino ou sintoma de falha? | Justificativa breve |
|------|--------------------------------------|---------------------|
| CSV diário das viagens | | |
| Tabela da frota no SGBD | | |
| Painel que não mudou na segunda-feira | | |

**2)** O que falta acontecer entre a pasta de arquivos e o painel?

> 

**3)** Qual componente do curso entra em cada pedido da secretaria? Pode repetir.

| Pedido | Componente (programação, armazenamento, ingestão ou ecossistema) |
|--------|-------------------------------------------------------------------|
| Abrir o CSV e o texto da ouvidoria | |
| Manter a frota consultável | |
| Fazer o dado da semana chegar ao painel | |

**4)** Sem escolher ainda a ferramenta: este caso parece mais “transformar e depois carregar” ou “carregar e transformar no banco”? Registre só a **intuição** e uma razão. A aula 03-04 aprofunda essa escolha.

> 

---

## Para o professor — Gabarito e orientações

### Atividade 1

- Usar resultados para formar equipes heterogêneas (misturar níveis de autoavaliação em Python e SQL).
- Consolidar médias por tema para replanejar reforços (ex.: se CSV/JSON ou SQL estiverem baixos, reforçar nas Aulas 07-12).
- A discussão em duplas após o questionário deve ser breve e acolhedora.
- Respostas sobre ETL/ELT servem só como diagnóstico: a distinção formal é conteúdo da Aula 03-04.

### Atividade 2 — Orientações

- Não há mapa único “certo”: valorizar **fonte, formato, destino e consequência da falha**.
- Cobrar pelo menos **duas fontes** e **um destino** nomeados.
- Na relação com os componentes, aceitar formulações simples: Python lê o arquivo; SGBD guarda; Big Data aparece se o grupo falar em volume ou tempo real.
- Evitar exigir, nesta aula, a decisão definitiva entre ETL e ELT.

### Atividade 4 — Gabarito sugerido

| # | Resposta | Justificativa breve |
|---|----------|---------------------|
| 1 | **A** | O CSV é a origem do dado |
| 2 | **B** | A tabela consultada pelo painel é o destino |
| 3 | **D** | Há transformação (corrigir colunas) antes da carga |
| 4 | **E** | O bruto é carregado e a transformação ocorre no destino, via SQL |
| 5 | **F** | O sistema analítico ficou desatualizado porque a ingestão não ocorreu |
| 6 | **G** | Python/pandas cumpre o papel de extração tratado na programação |
| 7 | **H** | A conferência por SQL apoia-se no armazenamento relacional |
| 8 | **C** | O processo descrito é a ingestão de ponta a ponta |

*Itens 3 e 4 admitem diálogo se o estudante justificar a etapa, mas a letra esperada separa “transformar antes” de “transformar no destino”.*

### Atividade 5 — Orientações

| Item | Classificação típica |
|------|----------------------|
| CSV diário das viagens | Fonte |
| Tabela da frota no SGBD | Pode ser fonte (já está no banco) e também destino de consultas; aceitar as duas leituras se justificadas |
| Painel que não mudou | Sintoma de falha de alimentação |

- A resposta central da questão 2 é: falta a **ingestão** (extrair o arquivo e disponibilizá-lo no destino que o painel lê).
- Intuição ETL ou ELT: aceitar qualquer uma das duas se houver uma razão (ex.: “limpar o CSV antes” ou “subir o bruto e tratar com SQL”). Não penalizar a escolha.

### Critérios rápidos de participação (qualitativo)

| Critério | Indicador |
|----------|-----------|
| Engajamento | Contribuiu nas discussões e na Atividade 2 |
| Clareza | Atividade 3 inclui fonte, destino, outro componente e um cuidado |
| Colaboração | Grupo entregou o mapa de fontes e destinos preenchido |
| Fixação | ≥ 6 acertos na Atividade 4 |

---

## Referências

- Plano de Ensino — Ingestão de Dados (Escola do Futuro)
- PC — Ciência de Dados — Paulo Renato de Souza
- DENSMORE, J. *Data Pipelines Pocket Reference.* Sebastopol: O'Reilly Media, 2021.
- NGUYEN, H.; PHAM, H.; CHIN, C. *The Analytics Setup Guidebook.* Holistics.
- CRICKARD, P. *Data Engineering with Python.* Birmingham: Packt Publishing, 2020.

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
