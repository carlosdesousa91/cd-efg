# Exercício — Aula 03-04
## Tipos de dados e escolha de ferramentas

**Componente curricular:** Ecossistema de Big Data  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Atividades formativas (classificação prática + proposta de ferramenta)

---

## Instruções gerais

- Atividade **1** é individual ou em dupla (aquecimento).
- Atividade **2** é em **duplas** (atividade principal da aula).
- Atividades **3** e **4** são individuais.
- Atividade **5** é opcional (grupo/plenária, se houver tempo).
- As atividades podem integrar a avaliação de **participação e engajamento (15%)** e preparam as práticas laboratoriais (40%).

---

## Atividade 1 — Classificação rápida de amostras (individual ou dupla)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Reconhecer tipos de dados em exemplos curtos.

**Legenda:** **E** = estruturado · **S** = semiestruturado · **N** = não estruturado

| # | Amostra | Tipo (E/S/N) |
|---|---------|--------------|
| 1 | Tabela `clientes` no PostgreSQL com CPF, nome e cidade | |
| 2 | Arquivo `eventos.json` com lista de cliques e campos opcionais | |
| 3 | Comentário: “Produto bom, mas a entrega atrasou.” | |
| 4 | CSV de notas fiscais com colunas fixas e tipos definidos | |
| 5 | Linha de log: `2026-08-28 WARN user=9 action=timeout` | |
| 6 | Foto do comprovante de entrega em JPG | |
| 7 | Documento XML de integração com tags aninhadas | |
| 8 | Planilha “limpa” com uma linha por aluno e colunas de notas | |

**Resposta breve:** Qual amostra foi a mais difícil de classificar? Por quê?

> 

---

## Atividade 2 — Classificar fontes e propor ferramenta (dupla)

**Tempo sugerido:** 25 minutos  
**Objetivo:** Relacionar tipo de dado → operação → ferramenta (SGBD, Spark ou Elasticsearch).

### Cenário — Operadora “Goiás Connect”

A empresa quer melhorar operação e atendimento. Disponibilizou as fontes abaixo.

| ID | Fonte | Descrição |
|----|-------|-----------|
| F1 | `assinantes` (MariaDB) | Cadastro: id, plano, cidade, status, data_adesao |
| F2 | `cdr_chamadas.csv` | Histórico diário de chamadas (milhões de linhas): origem, destino, duração, custo |
| F3 | `eventos_app.json` | Eventos do aplicativo (login, busca, falha) com campos variáveis |
| F4 | `tickets_suporte.txt` | Textos livres de reclamações abertas pelos clientes |
| F5 | `api_erros.log` | Logs da API com timestamp, nível e mensagem |
| F6 | `torres` (PostgreSQL) | Cadastro técnico de antenas/torres e localização |

### Tarefas da dupla

Preencham a tabela:

| Fonte | Tipo (E/S/N) | Operação principal (consultar / agregar / buscar / processar lote…) | Ferramenta principal (SGBD / Spark / Elasticsearch) | Justificativa (1–2 frases) |
|-------|--------------|---------------------------------------------------------------------|------------------------------------------------------|----------------------------|
| F1 | | | | |
| F2 | | | | |
| F3 | | | | |
| F4 | | | | |
| F5 | | | | |
| F6 | | | | |

### Perguntas de síntese

**a)** Em qual fonte vocês usariam **duas ferramentas** em sequência (ex.: Spark → Elasticsearch)? Explique.

> 

**b)** Qual fonte **não** justifica Spark neste momento? Por quê?

> 

**c)** Nomes da dupla:

| Nome |
|------|
| |
| |

---

## Atividade 3 — Mini arquitetura (individual)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Argumentar uma escolha tecnológica coerente.

Escolha **um** dos problemas abaixo e responda.

**Problema A:** “Preciso achar rapidamente tickets que falem de ‘queda de sinal’ e ‘cancelamento’.”  
**Problema B:** “Preciso calcular, todo dia à noite, o total de minutos usados por plano a partir de 80 GB de CDR.”  
**Problema C:** “Preciso garantir que todo assinante ativo tenha um plano válido cadastrado.”

### Seu problema escolhido: ____

**1)** Tipo(s) de dado envolvidos:

> 

**2)** Ferramenta principal e, se houver, ferramenta de apoio:

> 

**3)** Três critérios que fundamentaram a escolha (entre: tipo de dado, escala, latência, operação, custo/complexidade):

> 1.  
> 2.  
> 3.  

**4)** Um risco ou limitação da escolha:

> 

---

## Atividade 4 — Associação: necessidade × ferramenta (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Fixar critérios iniciais de seleção.

**Instrução:** Para cada item, marque **uma** letra.

**Opções:**

- **A)** SGBD relacional (SQL)  
- **B)** Apache Spark  
- **C)** Elasticsearch  
- **D)** Spark + Elasticsearch (pipeline combinado)  
- **E)** Abordagem tradicional basta; Big Data ainda não se justifica  

| # | Necessidade / situação | Letra |
|---|------------------------|-------|
| 1 | Manter cadastro de alunos com matrícula única e restrições de integridade | |
| 2 | Processar em lote 300 GB de arquivos JSON de sensores | |
| 3 | Buscar em segundos trechos de avaliações com a palavra “atraso” | |
| 4 | Somar vendas por município em tabela de 20 mil linhas bem modelada | |
| 5 | Limpar logs volumosos e depois permitir busca interativa nos erros | |
| 6 | Fazer JOIN diário entre pedidos e clientes em base transacional estável | |
| 7 | Indexar catálogo de produtos para autocomplete na loja virtual | |
| 8 | Agregar cliques de um ano inteiro para relatório mensal de funil | |

---

## Atividade 5 — Estudo de caso: CerradoShop (grupo ou plenária)

**Tempo sugerido:** 15 minutos (opcional)  
**Objetivo:** Integrar classificação de dados e arquitetura conceitual.

### Caso

O marketplace **CerradoShop** possui:

1. Tabela `pedidos` e `clientes` em PostgreSQL  
2. Eventos de clique em JSON (centenas de milhões/mês)  
3. Avaliações em texto livre  
4. Logs de erro da API  

A gestão pede três entregas:

- **D1** Dashboard semanal de faturamento por cidade  
- **D2** Detecção de produtos com muitas reclamações sobre “embalagem”  
- **D3** Job noturno que consolida cliques em métricas de funil  

### Questões

**1)** Classifique cada fonte (E/S/N):

| Fonte | Tipo |
|-------|------|
| pedidos/clientes | |
| cliques JSON | |
| avaliações | |
| logs | |

**2)** Para cada entrega, indique ferramenta principal:

| Entrega | Ferramenta | Por quê? |
|---------|------------|----------|
| D1 | | |
| D2 | | |
| D3 | | |

**3)** Desenhe em texto a sequência mínima do pipeline (3 a 5 etapas):

> Ex.: origem → … → …

**4)** O que aconteceria de errado se tentássemos resolver **D2** só com SQL em coluna `texto` sem indexação adequada?

> 

---

## Para o professor — Gabarito e orientações

### Atividade 1 — Gabarito sugerido

| # | Tipo | Nota |
|---|------|------|
| 1 | **E** | Tabela relacional |
| 2 | **S** | JSON com estrutura flexível |
| 3 | **N** | Texto livre |
| 4 | **E** | CSV tabular com esquema implícito claro |
| 5 | **S** | Log com campos, porém variável |
| 6 | **N** | Imagem |
| 7 | **S** | XML |
| 8 | **E** | Planilha tabular bem formada |

### Atividade 2 — Gabarito orientativo (aceitar variações bem justificadas)

| Fonte | Tipo | Ferramenta típica | Observação |
|-------|------|-------------------|------------|
| F1 | E | **SGBD** | Cadastro / integridade |
| F2 | E (arquivo tabular volumoso) | **Spark** (ou SGBD se volume couber) | Priorizar Spark se “milhões/dia” for gargalo |
| F3 | S | **Spark** (batch) e/ou **Elasticsearch** se busca/exploração | Depende da operação |
| F4 | N | **Elasticsearch** | Busca em texto |
| F5 | S | **Elasticsearch** (busca) ou **Spark** (processamento em lote) | Combinável |
| F6 | E | **SGBD** | Cadastro técnico |

Valorizar respostas que separem **armazenamento operacional** (SGBD) de **processamento em escala** (Spark) e **busca** (Elasticsearch).

### Atividade 3 — Orientações

| Problema | Tendência |
|----------|-----------|
| A | Elasticsearch (texto / busca) |
| B | Spark (batch volumoso) |
| C | SGBD (integridade referencial) |

### Atividade 4 — Gabarito sugerido

| # | Resposta | Justificativa breve |
|---|----------|---------------------|
| 1 | **A** | Integridade e cadastro |
| 2 | **B** | Volume + lote |
| 3 | **C** | Busca full-text |
| 4 | **E** (ou **A**) | Escala pequena; tradicional basta — aceitar A se enfatizarem SQL |
| 5 | **D** | Processar + indexar/buscar |
| 6 | **A** | Join transacional/relacional |
| 7 | **C** | Busca / autocomplete |
| 8 | **B** | Agregação histórica em lote |

*Item 4: preferir **E** se a intenção for reforçar “nem tudo é Big Data”; aceitar **A** com boa justificativa.*

### Atividade 5 — Orientações

| Entrega | Ferramenta alinhada |
|---------|---------------------|
| D1 | SGBD (+ BI) ou Spark se volume de pedidos explodir |
| D2 | Elasticsearch sobre avaliações |
| D3 | Spark (batch noturno nos cliques) |

### Critérios rápidos de participação (qualitativo)

| Critério | Indicador |
|----------|-----------|
| Classificação | Atividade 1 com ≥ 6 acertos |
| Aplicação | Tabela da Atividade 2 completa e coerente |
| Argumentação | Atividade 3 com critérios explícitos |
| Fixação | ≥ 6 acertos na Atividade 4 |

---

## Referências

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- PC — Ciência de Dados — Paulo Renato de Souza
- ERL, T.; KHATTAK, W.; BUHLER, P. *Big Data Fundamentals.* Prentice Hall, 2015.
- Documentação Apache Spark e Elasticsearch Guide

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
