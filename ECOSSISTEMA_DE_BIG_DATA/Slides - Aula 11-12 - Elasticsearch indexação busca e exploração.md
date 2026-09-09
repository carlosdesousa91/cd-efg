---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ecossistema de Big Data · Aula 11-12'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
  code { font-size: 20px; }
---

<!-- _class: lead -->
# Ecossistema de Big Data

## Aula 11-12
### Elasticsearch — indexação, busca e exploração

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 09-10 e objetivos de hoje |
| 0:20 – 1:00 | Conceitos + checklist de ambiente (ES/Kibana) |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | Indexação via API REST + Query DSL (lab guiado) |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:30 | Aggregations, Kibana e quando usar ES × Spark × SGBD |
| 3:30 – 4:00 | Exercício prático, entrega e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Configurar** um ambiente Elasticsearch (+ Kibana, quando disponível)
2. **Explicar** índices, documentos, mappings e shards (visão introdutória)
3. **Indexar** documentos via API REST e realizar buscas básicas (Query DSL)
4. **Aplicar** aggregations introdutórias e explorar no Kibana
5. **Decidir** quando usar Elasticsearch frente a Spark e SGBD

---

## Retomada — Aula 09-10

Na aula anterior, você:

- Configurou **Spark/PySpark** e trabalhou com **DataFrames**
- Diferenciou **transformações** e **ações**
- Leu CSV/JSON e registrou erros de ambiente

**Hoje:** outra peça do ecossistema — **buscar e explorar** dados com Elasticsearch.

---

## Por que Elasticsearch?

Quando a pergunta do negócio é:

> “Encontre / explore **agora** — em texto, logs ou documentos.”

| Força do ES | Exemplo |
|-------------|---------|
| Busca rápida (full-text) | Tickets com a palavra “atraso” |
| Documentos JSON | Eventos, catálogos, logs |
| Near real-time | Indexou → quase já consulta |
| Aggregations | Contagens e breakdowns exploratórios |

*Não substitui SGBD transacional nem Spark para ETL pesado de TB.*

---

## Opções de ambiente (escolha da unidade)

| Ambiente | Prós | Observação |
|----------|------|------------|
| **Docker** (ES + Kibana) | Reprodutível e didático | Precisa Docker na máquina/lab |
| **Elastic Cloud trial** | Pouca instalação | Conta e limites do trial |
| **Instalação local** | Controle total | Mais passos de setup |
| **Infra da escola** | Padronizado | Seguir roteiro do laboratório |

*O professor indica a opção oficial da turma.*

---

## Checklist rápido de configuração

Valide antes de indexar:

1. Elasticsearch responde em `http://localhost:9200` (ou URL do cloud)
2. Retorna nome do cluster / versão (JSON de health/info)
3. Kibana abre (ex.: `http://localhost:5601`) — se estiver no roteiro
4. Consegue enviar request no **Dev Tools** ou via `curl`/Postman
5. Consegue criar um índice de teste e buscar um documento

**Atividade 1 do caderno:** checklist oficial da aula.

---

## Conceitos essenciais

| Conceito | Analogia simples | O que é |
|----------|------------------|---------|
| **Índice** | “Base / coleção” | Conjunto lógico de documentos |
| **Documento** | “Linha / registro” | JSON indexado |
| **Campo** | “Coluna” | Atributo dentro do documento |
| **Mapping** | “Schema” | Tipos e regras dos campos |
| **Shard** | “Partição do índice” | Fatia para distribuir carga (visão) |

---

## Documento JSON — exemplo

```json
{
  "ticket_id": 101,
  "cliente": "Ana",
  "cidade": "Goiânia",
  "assunto": "Entrega atrasou e ninguém respondeu no chat",
  "status": "aberto",
  "prioridade": 3
}
```

- Unidade básica de indexação/busca
- Campos podem ser texto, número, data, keyword etc. (via mapping)

---

## Mapping (visão introdutória)

O **mapping** define como cada campo é interpretado.

Exemplos de tipos comuns no lab:

- `text` → busca full-text (analisado)
- `keyword` → filtro/agregação exata (status, cidade)
- `integer` / `float` → números
- `date` → datas

**Dica:** no início, o ES pode inferir tipos (*dynamic mapping*), mas em projetos reais o mapping é planejado.

---

## Ingestão via API REST

Elasticsearch fala **HTTP + JSON**.

Operações típicas no lab:

| Ação | Ideia |
|------|-------|
| Criar índice | `PUT /tickets` |
| Indexar documento | `POST /tickets/_doc` + JSON |
| Buscar | `GET /tickets/_search` + Query DSL |
| Contar / agregar | corpo com `aggs` |

Ferramentas: **Kibana Dev Tools**, `curl`, Postman/Insomnia ou cliente Python.

---

## Indexar um documento (exemplo)

No **Dev Tools** (Kibana):

```http
POST /tickets/_doc/101
{
  "ticket_id": 101,
  "cliente": "Ana",
  "cidade": "Goiânia",
  "assunto": "Entrega atrasou e ninguém respondeu no chat",
  "status": "aberto",
  "prioridade": 3
}
```

Depois: confirme com uma busca simples no mesmo índice.

---

## Query DSL — busca básica

```http
GET /tickets/_search
{
  "query": {
    "match": {
      "assunto": "atraso"
    }
  }
}
```

Outras formas introdutórias:

- `match` → texto analisado (full-text)
- `term` → valor exato em campo `keyword`
- `bool` → combinar `must` / `filter` / `should`

---

## Filtro exato + texto (bool)

```http
GET /tickets/_search
{
  "query": {
    "bool": {
      "must": [
        { "match": { "assunto": "atraso" } }
      ],
      "filter": [
        { "term": { "status.keyword": "aberto" } }
      ]
    }
  }
}
```

*Nomes de campo `.keyword` podem variar conforme o mapping — confira no lab.*

---

## Aggregations (introdução)

Aggregations ≈ “GROUP BY exploratório” no Elasticsearch.

```http
GET /tickets/_search
{
  "size": 0,
  "aggs": {
    "por_cidade": {
      "terms": { "field": "cidade.keyword" }
    }
  }
}
```

Use para: contagem por status, por cidade, médias de prioridade etc.

---

## Kibana — Dev Tools e Discover

| Recurso | Para quê no lab |
|---------|------------------|
| **Dev Tools** | Enviar requests REST com sintaxe assistida |
| **Discover** | Explorar documentos indexados (visão) |
| **Index patterns / data views** | Apontar o Kibana para seus índices |

Fluxo didático sugerido:

1. Indexar no Dev Tools  
2. Conferir documentos no Discover  
3. Rodar buscas e aggregations de novo no Dev Tools  

---

## Quando usar Elasticsearch × Spark × SGBD

| Se você precisa… | Prefira |
|------------------|---------|
| Integridade, cadastro, FK, SQL transacional | **SGBD** |
| Processar TB / ETL batch / agregações pesadas | **Spark** |
| Buscar texto/logs/documentos com baixa latência | **Elasticsearch** |
| Limpar em lote e depois buscar | **Spark → Elasticsearch** |

**Frase-guia:** Spark processa em escala; Elasticsearch encontra e explora rápido; SGBD garante o registro operacional.

---

## Estudo de caso — Central de tickets

Fontes:

- Cadastro de clientes no PostgreSQL  
- Histórico bruto de tickets em arquivos (centenas de MB/dia)  
- Texto livre das reclamações  

Perguntas:

1. Onde fica o cadastro mestre do cliente?  
2. Onde processar a limpeza diária do histórico?  
3. Onde buscar “queda de sinal” em segundos?

*Discussão rápida (5 min) + Atividade 2 do caderno.*

---

## Erros comuns no lab

| Sintoma | Causa frequente | O que checar |
|---------|-----------------|--------------|
| Connection refused | ES não subiu / porta errada | Docker/`9200`, URL do cloud |
| Unauthorized / security | Auth habilitada | Usuário/senha ou trial |
| Campo não agrega | Tipo `text` sem `keyword` | Mapping / `.keyword` |
| Busca não acha termo | Analisador / idioma / campo errado | `match` vs `term`; campo correto |
| Índice já existe | Recriação sem apagar | Outro nome ou `DELETE` consciente |

---

## O que será entregue hoje

Conforme o plano de ensino:

1. **Checklist de ambiente** (ES ± Kibana ok)
2. **Exercício prático** de indexação + consulta (+ aggregation)

Compõe as **atividades práticas/laboratoriais (40%)**.

---

## Ligação com a próxima aula

| Aula | Próximo passo |
|------|----------------|
| **13-14** | Spark SQL + pipeline batch + **projeto intermediário** |
| | Opção: processar no Spark e **indexar** no Elasticsearch |
| **15-20** | Streaming, projeto integrador e avaliação |

Hoje: **motor de busca/analytics**. Depois: encaixar no pipeline.

---

## Síntese da aula

Hoje você:

- Configurou **Elasticsearch** (e Kibana, quando previsto)
- Entendeu **índice**, **documento**, **mapping** e **shard**
- Indexou e buscou com **API REST** / **Query DSL**
- Praticou **aggregations** e exploração no Kibana
- Comparou usos de **ES × Spark × SGBD**

**Próxima aula (13-14):** Spark SQL, pipeline batch e projeto intermediário.

---

## Referências desta aula

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- ELASTIC. *Elasticsearch Guide.*
- ELASTIC. *Kibana Guide.*
- ERL, T.; KHATTAK, W.; BUHLER, P. *Big Data Fundamentals.* Prentice Hall, 2015.

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Entregue o **Checklist (Atividade 1)** e o **Exercício prático (Atividade 3)** do caderno.

Traga na próxima aula: ambiente Spark ok + dúvidas de ES registradas (para o pipeline do projeto intermediário).

**Escola do Futuro · Ciência de Dados**
