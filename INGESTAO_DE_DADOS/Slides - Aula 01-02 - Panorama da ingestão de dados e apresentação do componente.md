---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ingestão de Dados · Aula 01-02'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Ingestão de Dados

## Aula 01-02
### Panorama da ingestão de dados e apresentação do componente

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
| 1:10 – 2:10 | O que é ingestão e por que ela alimenta os sistemas |
| 2:10 – 2:25 | **Intervalo** |
| 2:25 – 3:25 | Fontes, destinos, outros componentes e panorama ETL/ELT |
| 3:25 – 4:00 | Avaliação, cronograma, fixação e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Reconhecer** o papel do componente na Etapa II (Big Data)
2. **Explicar** por que a ingestão alimenta sistemas analíticos e operacionais
3. **Identificar** fontes e destinos de dados em um cenário simples
4. **Relacionar** a ingestão com programação, armazenamento e o ecossistema de Big Data
5. **Antever** os processos de ETL e ELT que serão construídos no componente
6. **Compreender** o plano de ensino, a avaliação e o percurso das 80 horas

---

## Por que este componente existe?

> Coletar, preparar e **disponibilizar** dados de forma eficiente é o que permite a uma organização extrair valor das informações que gera todos os dias.

- Formar técnicos capazes de **alimentar** sistemas de dados com processos de ETL e ELT
- Preparar para a saída intermediária: **Assistente de Big Data**
- Base para o **Projeto Profissional de Big Data**, em que a solução precisa de dados chegando ao destino

---

## Onde estamos no curso?

### Etapa II — Big Data (240h)

| Componente | Carga |
|------------|-------|
| Ecossistema de Big Data | 40h |
| Desenvolvimento de Sistemas Aplicados a Dados | 40h |
| **Ingestão de Dados** | **80h** ← estamos aqui |
| Sistemas de Computação | 40h |
| Inglês Aplicado à Big Data | 40h |
| Projeto Profissional de Big Data | 40h |

**Saída intermediária:** Assistente de Big Data

---

## O que você já traz da Etapa I

| Componente anterior | O que reaproveitamos aqui |
|---------------------|---------------------------|
| Lógica e Linguagens de Programação | Python para extrair e transformar |
| Armazenamento, Manipulação e Transformação de Dados | SGBD relacional como destino e SQL |
| Estrutura e Qualidade dos Dados | Esquema, nulos, duplicidade e consistência |

*Se algum tema estiver fraco, o laboratório será o lugar de retomar — por isso a diagnóstica de hoje.*

---

## Plano de ensino deste componente

- **Carga horária:** 80h (32h teórica · 48h prática)
- **Ementa:** ETL e ELT · fundamentos de ingestão · pipelines · agendamento · lote e streaming · métodos e ferramentas
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
- Aprovação por conceitos: **Apto Nível 1** (8,0–10,0) · **Apto Nível 2** (6,0–7,9) · **Não Apto** (&lt; 6,0)
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

> De onde vêm os dados que uma organização usa para decidir — e o que acontece se esses dados **não chegarem** ao sistema?

Exemplos: planilha por e-mail, API de pagamento, exportação de um sistema, sensor, formulário, portal de dados abertos...

---

## O que é ingestão de dados?

**Definição prática:**

Processo de **coletar** dados de uma ou mais origens e **disponibilizá-los** em um destino, para que sistemas analíticos ou operacionais possam usá-los.

Ingestão **não** é só “copiar um arquivo”. É garantir que o dado **chegue**, no formato combinado, no lugar certo e em tempo útil.

---

## Sem ingestão, o resto não funciona

| Etapa do trabalho com dados | Depende de… |
|-----------------------------|-------------|
| Painel da diretoria | Dados atualizados no destino |
| Consulta SQL ou busca | Tabela, coleção ou índice preenchidos |
| Modelo ou relatório | Histórico confiável e recorrente |
| Decisão de negócio | Informação que **chegou** a tempo |

A ingestão é a **alimentação** desses sistemas. Se ela falha, a análise trabalha com dado velho, incompleto ou inexistente.

---

## Storytelling — A manhã de uma rede de clínicas

Imagine uma rede de clínicas na região metropolitana de Goiânia, às 8h:

1. A recepção exporta a agenda do dia em **CSV**
2. O prontuário envia atendimentos em **JSON**
3. O laboratório parceiro publica resultados por **API**
4. A diretoria abre o **painel** de ocupação e espera ver o dia

**Pergunta:** quem leva esses três arquivos e essa API até o painel? O que a diretoria vê se ninguém fizer isso?

---

## Fontes de dados (primeira visão)

| Fonte | Exemplo |
|-------|---------|
| Arquivos | CSV, JSON, planilha |
| APIs | Serviço web que devolve registros |
| Bancos | Exportação ou leitura de um SGBD |
| Eventos | Cliques, sensores, mensagens que chegam sem parar |
| Dados abertos | Portais como dados.gov.br e IBGE |

*Na Aula 05-06 detalhamos origens, destinos e tipos de carga.*

---

## Destinos de dados (primeira visão)

| Destino | Para que serve neste curso |
|---------|----------------------------|
| **SGBD relacional** (MariaDB, MySQL ou PostgreSQL) | Tabelas consultáveis com SQL |
| **NoSQL** (MongoDB) | Documentos, quando o formato não é uma tabela fixa |
| **Sistema analítico** | Painel, relatório ou pipeline que consome o dado já disponível |

O destino é onde o dado passa a **existir para quem decide**.

---

## Relação com os outros componentes

```
Programação (Python)  →  extrai e transforma
Armazenamento (SGBD)  →  guarda o que foi carregado
Ecossistema Big Data  →  entra quando volume, lote ou streaming exigem escala
Ingestão de Dados     →  liga a origem ao destino, de forma repetível
Projeto Profissional  →  usa o pipeline para evidenciar valor
```

Ingestão **não substitui** esses componentes: ela **os conecta**.

---

## Panorama: o que vamos construir

Ao longo das 80 horas, os pipelines seguem duas ideias:

| Sigla | Em uma frase | Onde a transformação acontece |
|-------|----------------|-------------------------------|
| **ETL** | Extract, Transform, Load | **Antes** de carregar no destino |
| **ELT** | Extract, Load, Transform | **Depois**, já no destino |

Hoje basta reconhecer os nomes. Na **Aula 03-04** comparamos vantagens, limites e quando usar cada um.

---

## Um fluxo, visto de longe

```
Origem  →  Extração  →  (Transformação)  →  Carga  →  Destino  →  Uso
CSV/API     Python         Python ou SQL       SGBD      painel / consulta
```

- No **ETL**, a transformação fica no meio, antes da carga
- No **ELT**, a carga do dado bruto vem primeiro e a transformação ocorre no destino

*Arquitetura, agendamento e lote × streaming entram nos blocos seguintes.*

---

## Estudo de caso — Prefeitura e dados abertos

**Contexto:** uma secretaria municipal quer um painel semanal de transporte e ouvidoria.

**Dados disponíveis:**
- Arquivo CSV de linhas de ônibus (atualizado todo dia)
- Texto de manifestações da ouvidoria
- Tabela já existente de frota no SGBD da secretaria

**Discussão (5 min):**
1. Quais são as **fontes** e qual é o **destino** do painel?
2. O que a gestão vê na segunda-feira se o CSV de domingo **não for ingerido**?
3. Qual componente do curso ajuda em cada parte: programação, armazenamento ou Big Data?

---

## Atividade em grupo (20 min)

**Exercício 2 — Mapa de fontes e destinos**

Em grupos de 3 a 4 pessoas:

1. Escolham **um cenário** (clínica, comércio, prefeitura, app…)
2. Listem **fontes**, formatos e **destinos**
3. Digam o que acontece se a ingestão **atrasar ou falhar**
4. Indiquem qual componente do curso sustenta cada trecho

*Um representante compartilha com a turma em 2 minutos.*

---

## Projetos do componente (visão geral)

### Projeto intermediário (~15%)
Pipeline **ETL ou ELT**, com a abordagem justificada e os dados **disponíveis no destino**.

### Projeto integrador (~15%)
Pipeline com **agendamento**, estratégia justificada (lote ou streaming) e avaliação de **qualidade e eficiência**.

```
Panorama → ETL/ELT → Extração e carga → Pipeline
    → Agendamento → Lote/streaming → Projeto integrador
```

---

## Cronograma resumido do componente

| Bloco | Tema | Horas |
|-------|------|-------|
| 1 | Fundamentos de ingestão, ETL e ELT | 12h |
| 2 | Extração e carga com linguagens e bancos | 12h |
| 3 | Arquitetura e implementação de pipelines | 16h |
| 4 | Agendamento, orquestração e automação | 12h |
| 5 | Lote, streaming e escolha da estratégia | 12h |
| 6 | Qualidade, projeto integrador e encerramento | 16h |

**Próxima aula (03-04):** ETL e ELT — conceitos e critérios de escolha.

---

## Ferramentas que vamos usar (prévia)

| Ferramenta | Papel na ingestão |
|------------|-------------------|
| **Python** (pandas, requests) | Extrair arquivos e APIs; transformar no ETL |
| **SGBD relacional** | Destino em tabelas e transformação SQL no ELT |
| **MongoDB** | Destino em documentos |
| **cron / Airflow** | Agendar e orquestrar o pipeline |
| **Eventos** (simulação ou fila) | Experimentar ingestão contínua |

*O conjunto pode ser ajustado à infraestrutura do laboratório.*

---

## Combinados para o componente

- **Presença ativa** — laboratório e projetos exigem participação contínua
- **Documentar** a origem, o destino e a escolha entre ETL e ELT (não só o script)
- **Comunicar dificuldades** cedo — recuperação e mentoria existem
- **Respeitar** entregas do projeto intermediário e do integrador
- **Colaborar** — trabalho em dupla e revisão entre pares fazem parte da formação

---

## Recursos de apoio

- Plano de ensino completo (plataforma / SIGA)
- Caderno de exercícios da Aula 01-02
- Documentação: Python, pandas, SGBD adotado, MongoDB
- Ambientes: laboratório local, Jupyter ou VS Code (conforme infraestrutura)
- Portais de dados abertos: dados.gov.br e IBGE
- Acervo virtual institucional e coordenação pedagógica

---

## Fixação — Exercício 4 (10 min)

**Associe** cada situação ao conceito mais adequado:

| Situação | Conceito |
|----------|----------|
| A) Planilha CSV que chega por e-mail todo dia | ( ) Fonte ( ) Destino ( ) ETL |
| B) Tabela SQL que o painel consulta | ( ) Destino ( ) API ( ) Streaming |
| C) Script Python que lê o CSV e grava no banco | ( ) Ingestão ( ) Somente visualização |
| D) Painel vazio porque o arquivo de ontem não entrou | ( ) Falha de alimentação ( ) Excesso de volume |

*Gabarito no caderno de exercícios.*

---

## Síntese da aula

Hoje você:

- Conheceu o **componente** e os **critérios de avaliação**
- Definiu **ingestão** como a alimentação dos sistemas de dados
- Identificou **fontes** e **destinos** em cenários simples
- Relacionou a ingestão com **programação**, **armazenamento** e **Big Data**
- Anteviu **ETL** e **ELT**, o **cronograma** e os **projetos**

**Próxima aula (03-04):** diferenças entre ETL e ELT e quando cada abordagem é mais apropriada.

---

## Referências desta aula

- Plano de Ensino — Ingestão de Dados (Escola do Futuro)
- Plano de Curso — Técnico em Ciência de Dados (Escola do Futuro / UFG)
- DENSMORE, J. *Data Pipelines Pocket Reference.* Sebastopol: O'Reilly Media, 2021.
- NGUYEN, H.; PHAM, H.; CHIN, C. *The Analytics Setup Guidebook.* Holistics.
- CRICKARD, P. *Data Engineering with Python.* Birmingham: Packt Publishing, 2020.

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Complete as **Atividades 1, 2, 3 e 4** do caderno de exercícios.

Traga na próxima aula: **1 exemplo** de dado que nasce em um lugar e precisa chegar a outro para alguém decidir.

**Escola do Futuro · Ciência de Dados**
