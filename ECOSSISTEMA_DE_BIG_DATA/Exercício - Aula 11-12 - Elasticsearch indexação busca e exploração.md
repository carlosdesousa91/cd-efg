# Exercício — Aula 11-12
## Elasticsearch — indexação, busca e exploração

**Componente curricular:** Ecossistema de Big Data  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Checklist de ambiente + exercício prático de indexação/consulta (conforme plano de ensino)

---

## Instruções gerais

- Atividade **1** (checklist) é **individual** e obrigatória.
- Atividade **2** é prática guiada (individual ou dupla).
- Atividade **3** é a **entrega prática** principal (individual ou dupla).
- Atividade **4** é individual (fixação).
- Atividade **5** é opcional (estudo de caso / desafio).
- As Atividades 1 e 3 integram as **atividades práticas/laboratoriais (40%)**.

### Ambiente aceito

Marque o que você usou:

- [ ] Docker (Elasticsearch + Kibana)  
- [ ] Elastic Cloud trial  
- [ ] Instalação local  
- [ ] Laboratório da unidade  
- [ ] Outro: _________________

**URL do Elasticsearch:** _______________________________  
**Kibana (se houver):** _______________________________

---

## Dataset de apoio — tickets

Indexe os documentos abaixo no índice `tickets_aula` (IDs sugeridos 101–108).

```json
{"ticket_id":101,"cliente":"Ana","cidade":"Goiânia","assunto":"Entrega atrasou e ninguém respondeu no chat","status":"aberto","prioridade":3}
{"ticket_id":102,"cliente":"Bruno","cidade":"Anápolis","assunto":"Produto veio com defeito na tela","status":"aberto","prioridade":4}
{"ticket_id":103,"cliente":"Carla","cidade":"Goiânia","assunto":"Queda de sinal durante a videochamada","status":"fechado","prioridade":5}
{"ticket_id":104,"cliente":"Diego","cidade":"Luziânia","assunto":"Cobrança duplicada na fatura","status":"aberto","prioridade":4}
{"ticket_id":105,"cliente":"Elena","cidade":"Goiânia","assunto":"Atraso na entrega do pedido 8891","status":"aberto","prioridade":2}
{"ticket_id":106,"cliente":"Fábio","cidade":"Anápolis","assunto":"Não consigo resetar a senha do aplicativo","status":"fechado","prioridade":3}
{"ticket_id":107,"cliente":"Gabi","cidade":"Aparecida de Goiânia","assunto":"Chat demorou e a entrega atrasou de novo","status":"aberto","prioridade":5}
{"ticket_id":108,"cliente":"Hugo","cidade":"Goiânia","assunto":"Solicito cancelamento do plano","status":"aberto","prioridade":1}
```

---

## Atividade 1 — Checklist de ambiente (individual)

**Tempo sugerido:** 20–30 minutos  
**Objetivo:** Validar Elasticsearch (e Kibana) antes das práticas.

| # | Item | OK? (Sim/Não) | Observação / evidência |
|---|------|---------------|------------------------|
| 1 | Consegui acessar o endpoint do Elasticsearch | | |
| 2 | A resposta JSON mostra cluster/versão (ou health) | | |
| 3 | Kibana abriu (se fizer parte do roteiro) | | |
| 4 | Consegui enviar request no Dev Tools **ou** curl/Postman | | |
| 5 | Criei o índice `tickets_aula` (ou equivalente) | | |
| 6 | Indexei pelo menos 1 documento de teste | | |
| 7 | Recuperei esse documento com `_search` ou GET por id | | |

**Versão do Elasticsearch (se visível):** _______________

**Problema encontrado (se houver) e status:**

> 

**Nome:** _______________________________

---

## Atividade 2 — Prática guiada: indexar e buscar (individual ou dupla)

**Tempo sugerido:** 35–40 minutos  
**Objetivo:** Operar API REST, Query DSL básico e uma aggregation.

### 2.1 Criar índice (opcional se dynamic mapping)

No Dev Tools (exemplo):

```http
PUT /tickets_aula
```

*(Se o índice já existir, use outro nome ou siga orientação do professor.)*

### 2.2 Indexar os 8 documentos

Use `POST /tickets_aula/_doc/101` … até `108` (ou bulk, se o professor demonstrar).

**a)** Quantos documentos o índice passou a ter? (`GET /tickets_aula/_count` ou `_search` com `track_total_hits`)

> 

### 2.3 Busca full-text

```http
GET /tickets_aula/_search
{
  "query": {
    "match": { "assunto": "atraso" }
  }
}
```

**b)** Quais `ticket_id` retornaram (ou quantos hits)?

> 

### 2.4 Filtro por status (ajuste `.keyword` conforme mapping)

```http
GET /tickets_aula/_search
{
  "query": {
    "bool": {
      "must": [ { "match": { "assunto": "entrega" } } ],
      "filter": [ { "term": { "status.keyword": "aberto" } } ]
    }
  }
}
```

**c)** Quais tickets atenderam à combinação?

> 

### 2.5 Aggregation por cidade

```http
GET /tickets_aula/_search
{
  "size": 0,
  "aggs": {
    "por_cidade": {
      "terms": { "field": "cidade.keyword" }
    }
  }
}
```

**d)** Complete (valores aproximados ok):

| cidade | doc_count |
|--------|-----------|
| | |
| | |
| | |
| | |

---

## Atividade 3 — Exercício prático entregável (individual ou dupla)

**Tempo sugerido:** 40–45 minutos  
**Objetivo:** Evidenciar indexação, consulta e decisão de ferramenta.

### Requisitos da entrega

Enviar: export/print do Dev Tools **ou** arquivo com requests + respostas, contendo:

1. Evidência do checklist (Atividade 1)  
2. Indexação dos documentos em `tickets_aula`  
3. Uma busca `match` por termo combinado com a turma (**“atraso”** ou **“sinal”**)  
4. Uma query `bool` (texto + filtro de `status`)  
5. Uma aggregation (`terms` por `status` **ou** por `cidade`)  
6. Parágrafo curto: **quando** você usaria Elasticsearch em vez de Spark ou SGBD neste cenário de tickets  

### Resultados para registrar aqui

| Item | Resultado |
|------|-----------|
| Total de docs no índice | |
| Termo buscado no `match` | |
| Hits do `match` (ids ou qtde) | |
| Hits da query `bool` | |
| Aggregation usada | |
| Ambiente (Docker/Cloud/local) | |

**Parágrafo (ES × Spark × SGBD):**

> 

**Nomes (se dupla):**

| Nome |
|------|
| |
| |

---

## Atividade 4 — Fixação conceitual (individual)

**Tempo sugerido:** 10 minutos  

### Parte A — Associe o conceito

**Opções:**  
**A)** Índice · **B)** Documento · **C)** Mapping · **D)** Shard · **E)** Query DSL · **F)** Aggregation  

| # | Descrição | Letra |
|---|-----------|-------|
| 1 | JSON armazenado/buscável no Elasticsearch | |
| 2 | Define tipos/regras dos campos | |
| 3 | Linguagem JSON de consulta do ES | |
| 4 | Contagem/breakdown estilo “group by” exploratório | |
| 5 | Conjunto lógico de documentos | |
| 6 | Fatia do índice para distribuição (visão) | |

### Parte B — Escolha a ferramenta (uma letra)

**Opções:** **S** Spark · **E** Elasticsearch · **R** SGBD  

| # | Necessidade | Letra |
|---|-------------|-------|
| 7 | Garantir CPF único e FK entre cliente e contrato | |
| 8 | Buscar em segundos tickets com “queda de sinal” | |
| 9 | Processar 200 GB de logs em lote durante a madrugada | |
| 10 | Autocomplete de produtos no e-commerce | |
| 11 | Cadastro operacional de assinantes com SQL | |
| 12 | Limpar JSON volumoso e depois indexar para busca | |

*No item 12, se quiser combinação, escreva **S→E** na margem e explique em 1 linha abaixo.*

> 

---

## Atividade 5 — Estudo de caso / desafio (opcional)

**Tempo sugerido:** 15 minutos  

### Caso — Central Goiás Connect

A empresa tem:

1. Cadastro de clientes no MariaDB  
2. Job Spark que consolida tickets do dia (CSV/JSON)  
3. Necessidade de a equipe de suporte **buscar** reclamações abertas por palavra-chave  

**1)** Desenhe o fluxo em 4 etapas (texto):

> origem → … → …

**2)** O que fica no SGBD, o que roda no Spark e o que vai para o Elasticsearch?

| Camada | Conteúdo / responsabilidade |
|--------|-----------------------------|
| SGBD | |
| Spark | |
| Elasticsearch | |

**3)** Desafio técnico: monte uma aggregation que mostre a **média de prioridade** por `status` (pesquise `avg` na documentação se necessário) e cole o request:

```http


```

---

## Para o professor — Gabarito e orientações

### Atividade 1

- Não avançar para aggregations enquanto `_search` básico não funcionar.
- Em Elastic Cloud, orientar auth (API key/usuário).
- Docker: conferir portas `9200` e `5601`.

### Atividade 2 — Orientações de resultado (amostra)

- Total de documentos: **8**
- `match` em **“atraso”**: tende a pegar tickets **101, 105, 107** (analisador pode variar)
- `bool` com “entrega” + `status=aberto`: tende a **101, 105, 107** (103 tem “queda”, não entrega; 102 defeito; etc.) — validar na hora com o mapping real
- Contagem por cidade (esperado): Goiânia **4**; Anápolis **2**; Luziânia **1**; Aparecida de Goiânia **1**

Se `.keyword` falhar: demonstrar dynamic mapping e campo correto em `_mapping`.

### Atividade 3 — Rubrica rápida

| Critério | Esperado |
|----------|----------|
| Ambiente | Checklist majoritariamente OK ou problema documentado |
| Indexação | ≥ 8 docs (ou amostra completa fornecida) |
| Busca | `match` + `bool` funcionando com evidência |
| Aggregation | `terms` com resultado coerente |
| Decisão | Parágrafo distingue ES × Spark × SGBD |

### Atividade 4 — Gabarito

**Parte A:** 1B, 2C, 3E, 4F, 5A, 6D  

**Parte B:** 7R, 8E, 9S, 10E, 11R, 12 **S→E** (aceitar E só se justificarem busca; preferir combinação)

### Atividade 5 — Aggregation sugerida

```http
GET /tickets_aula/_search
{
  "size": 0,
  "aggs": {
    "por_status": {
      "terms": { "field": "status.keyword" },
      "aggs": {
        "media_prioridade": { "avg": { "field": "prioridade" } }
      }
    }
  }
}
```

### Critérios rápidos de participação/prática

| Critério | Indicador |
|----------|-----------|
| Setup | Checklist preenchido |
| Prática | Atividades 2–3 com evidências de request/resposta |
| Conceito | ≥ 9 acertos nos 12 itens da Atividade 4 |
| Decisão | Explica quando NÃO usar Elasticsearch |

### Sugestão Docker (referência didática)

O professor pode disponibilizar um `docker-compose` institucional com Elasticsearch + Kibana. Evite expor cluster sem senha em rede pública.

---

## Referências

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- ELASTIC. *Elasticsearch Guide.* https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html
- ELASTIC. *Kibana Guide.* https://www.elastic.co/guide/en/kibana/current/index.html

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
