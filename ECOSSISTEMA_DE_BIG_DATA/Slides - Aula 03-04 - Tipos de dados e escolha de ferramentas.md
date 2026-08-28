---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ecossistema de Big Data · Aula 03-04'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Ecossistema de Big Data

## Aula 03-04
### Tipos de dados e escolha de ferramentas

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 01-02 e objetivos de hoje |
| 0:20 – 1:00 | Tipos de dados: estruturados, semiestruturados e não estruturados |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | Exemplos práticos: CSV/SQL, JSON/XML/logs, texto |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:30 | Critérios de escolha: SGBD, Spark e Elasticsearch |
| 3:30 – 4:00 | Atividade prática, fixação e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Diferenciar** dados estruturados, semiestruturados e não estruturados
2. **Reconhecer** exemplos típicos (CSV/SQL, JSON/XML/logs, texto)
3. **Relacionar** cada tipo de dado a ferramentas adequadas
4. **Aplicar** critérios iniciais de seleção tecnológica (SGBD, Spark, Elasticsearch)
5. **Propor** uma combinação de ferramentas para um cenário concreto

---

## Retomada — Aula 01-02

Na aula anterior, você:

- Definiu **Big Data** e os principais **Vs**
- Diferenciou processamento **tradicional** e em **escala**
- Conheceu o panorama do ecossistema (**Spark**, **Elasticsearch**, SGBD…)

**Pergunta de abertura (3 min):**

> Se o Big Data envolve *variedade*, o que isso tem a ver com o *formato* dos dados?

---

## Por que classificar tipos de dados?

Porque o **formato** e a **estrutura** influenciam:

- Onde armazenar
- Como consultar / buscar
- Qual ferramenta processa melhor
- Quanto custa e quão complexa fica a solução

> Escolher ferramenta **sem** olhar o tipo de dado é um dos erros mais comuns em projetos.

---

## Três categorias principais

```
┌─────────────────┐   ┌──────────────────┐   ┌──────────────────┐
│  ESTRUTURADOS   │   │ SEMIESTRUTURADOS │   │ NÃO ESTRUTURADOS │
│  Tabelas / SQL  │   │ JSON, XML, logs  │   │ Texto, imagem…   │
└─────────────────┘   └──────────────────┘   └──────────────────┘
         ↑                      ↑                      ↑
    esquema rígido        esquema flexível      pouco/nenhum esquema
```

*Na prática, projetos reais misturam as três — por isso o ecossistema.*

---

## Dados estruturados

**Características:**
- Organização em **linhas e colunas** (tabelas)
- **Esquema definido** antes (tipos, chaves, restrições)
- Fácil de consultar com **SQL**
- Alta consistência quando bem modelados

**Exemplos:**
- Tabelas em MariaDB / PostgreSQL / MySQL
- Planilhas bem normalizadas
- Arquivos **CSV** com colunas fixas e tipos claros

---

## Exemplo — CSV / SQL

```text
id_pedido;cliente;cidade;valor;data
1001;Ana;Goiânia;89.90;2026-08-01
1002;Bruno;Anápolis;120.00;2026-08-01
```

```sql
SELECT cidade, SUM(valor) AS total
FROM pedidos
GROUP BY cidade;
```

**Quando brilha:** relatórios, cadastros, indicadores tabulares, integridade referencial.

---

## Dados semiestruturados

**Características:**
- Possuem **marcadores / chaves**, mas esquema **flexível**
- Nem tudo precisa ter o mesmo formato em todos os registros
- Comuns em APIs, logs e integração entre sistemas

**Exemplos:**
- **JSON** (APIs, NoSQL, eventos)
- **XML** (integrações legadas, documentos)
- **Logs** (linhas com campos variáveis)
- Avro / Parquet (visão introdutória — formato analítico)

---

## Exemplo — JSON

```json
{
  "pedido_id": 1001,
  "cliente": "Ana",
  "itens": [
    {"sku": "A1", "qtd": 2},
    {"sku": "B3", "qtd": 1}
  ],
  "cupom": null
}
```

**Observe:** um pedido pode ter N itens; campos opcionais (`cupom`) existem.

**Quando brilha:** eventos, APIs, documentos com estrutura variável.

---

## Exemplo — log (semiestruturado)

```text
2026-08-28T10:01:12Z INFO user=42 action=login ip=189.x.x.x
2026-08-28T10:01:15Z WARN user=42 action=retry reason=timeout
2026-08-28T10:01:20Z INFO user=77 action=search q="big data"
```

- Há **padrões** (data, nível, campos), mas o conteúdo **varia**
- Precisa de parsing antes da análise
- Volume e velocidade costumam ser altos

---

## Dados não estruturados

**Características:**
- **Sem esquema** tabular pré-definido
- Conteúdo livre ou mídia
- Exigem técnicas específicas de busca, indexação ou ML (visão introdutória)

**Exemplos:**
- Texto livre (avaliações, e-mails, tickets)
- Imagens, áudio, vídeo
- PDFs e documentos pouco padronizados

*Neste componente, o foco prático será sobretudo texto + indexação/busca.*

---

## Exemplo — texto livre

> “Entrega atrasou e o atendimento no chat não resolveu. Pedido #1001.”

- Não cabe bem em uma única coluna “nota” se quisermos **buscar** por assunto
- Útil para sentimento, busca full-text, classificação
- Combina bem com **Elasticsearch** (indexação e consulta)

---

## Comparativo rápido

| Aspecto | Estruturado | Semiestruturado | Não estruturado |
|---------|-------------|-----------------|-----------------|
| Esquema | Rígido | Flexível | Fraco / ausente |
| Consulta típica | SQL | Parsing + query | Busca / NLP |
| Exemplo | Tabela pedidos | JSON de API | Avaliação em texto |
| Ferramenta clássica | SGBD | Spark / NoSQL / logs | Elasticsearch / storage |

---

## Atividade rápida (8 min)

**Em duplas — Atividade 1 do caderno**

Classifiquem cada amostra como:

**E** estruturado · **S** semiestruturado · **N** não estruturado

*Depois compartilhamos 2 respostas com a turma.*

---

## Critérios iniciais de escolha de ferramentas

Antes de “instalar tudo”, pergunte:

1. **Qual o tipo predominante** do dado?
2. **Qual a operação principal?** (consultar, agregar, buscar texto, processar em lote…)
3. **Qual a escala?** (cabe em um servidor? precisa de paralelismo?)
4. **Qual a latência aceitável?** (relatório diário × resposta em segundos)
5. **Qual o custo / complexidade** que a equipe aguenta agora?

---

## SGBD relacional — quando usar?

**Bom para:**
- Dados **estruturados** com regras de negócio claras
- Transações, cadastros, chaves e integridade
- Consultas SQL em volumes **moderados**
- Fonte “sistema de registro” (OLTP) ou DW pequeno/médio

**Limitações típicas:**
- Escala vertical cara
- Texto livre e busca avançada menos naturais
- Processamento massivo paralelo não é o foco

**Exemplos no curso:** MariaDB, MySQL, PostgreSQL.

---

## Apache Spark — quando usar?

**Bom para:**
- Processar **grandes volumes** em paralelo (batch)
- Transformar CSV/JSON/Parquet em escala
- Agregações e Spark SQL sobre datasets grandes
- Pipelines: limpar → transformar → exportar

**Limitações típicas:**
- Não substitui SGBD transacional
- Busca interativa tipo “Google” não é o caso de uso principal
- Exige cuidado com ambiente e recursos

---

## Elasticsearch — quando usar?

**Bom para:**
- **Indexar** documentos (JSON) e **buscar** rápido
- Texto livre, logs, catálogos com busca full-text
- Aggregations e exploração near real-time
- Casos em que a pergunta é: *“encontre / explore agora”*

**Limitações típicas:**
- Não é substituto completo de banco relacional para transações
- Modelagem e mappings pedem disciplina
- Custo cresce com volume indexado e réplicas

---

## Guia prático de seleção (primeira versão)

| Se o problema é… | Prefira começar com… |
|------------------|----------------------|
| Cadastro + SQL + integridade | **SGBD** |
| Processar TB / muitos arquivos em lote | **Spark** |
| Buscar texto / logs / documentos rápido | **Elasticsearch** |
| Mistura (ex.: limpar no Spark e indexar) | **Spark + Elasticsearch** |
| Relatório tabular estável e volumetria baixa/média | **SGBD** (ou Spark se crescer) |

*Regra de ouro: comece simples; escale quando o gargalo aparecer.*

---

## Estudo de caso — Marketplace “CerradoShop”

Fontes de dados:

1. Tabela `pedidos` no PostgreSQL (estruturado)
2. Eventos de clique em **JSON** (semiestruturado)
3. Avaliações dos clientes em **texto** (não estruturado)
4. Logs de erro da API (semiestruturado)

**Discussão (5 min):**
- O que fica no SGBD?
- O que processaríamos em Spark?
- O que indexaríamos no Elasticsearch?

---

## Arquitetura conceitual (exemplo)

```
Pedidos (SQL) ──► SGBD ──► relatórios / BI
                          │
Cliques (JSON) ──► Spark ─┼──► dataset limpo / agregados
Logs (texto)  ──►         │
                          ▼
Avaliações ──────────► Elasticsearch ──► busca e exploração
```

*Não é a única arquitetura possível — é um ponto de partida didático.*

---

## Atividade em duplas (25 min)

**Exercício 2 — Classificar e propor ferramenta**

Para cada fonte de um cenário:

1. Classificar o tipo de dado (E / S / N)
2. Indicar a **operação principal** (consultar, agregar, buscar…)
3. Propor **1 ferramenta principal** (SGBD, Spark ou Elasticsearch)
4. Justificar em 1–2 frases

*Entrega: preencher a tabela do caderno. Integra participação (15%).*

---

## Erros comuns na escolha

- Usar Elasticsearch como único “banco de tudo”
- Colocar texto livre só em coluna SQL sem estratégia de busca
- Subir cluster Spark para processar 5 mil linhas
- Ignorar **variedade** e forçar tudo em uma única tabela
- Escolher ferramenta por moda, não por requisito

---

## Ligação com o restante do componente

| Aulas | O que vem a seguir |
|-------|--------------------|
| 05-08 | Infraestrutura e paralelismo |
| 09-10 | Laboratório **Spark** |
| 11-12 | Laboratório **Elasticsearch** |
| 13-14 | Pipeline batch + projeto intermediário |
| 15-20 | Streaming, projeto integrador e avaliação |

Hoje vocês ganham o **vocabulário de decisão** que usaremos nos laboratórios.

---

## Fixação — Exercício 4 (10 min)

Associe cada necessidade à ferramenta **mais adequada**:

| Necessidade | Ferramenta |
|-------------|------------|
| A) Somar vendas por cidade em tabela estável | ( ) SGBD ( ) Spark ( ) Elasticsearch |
| B) Processar 200 GB de JSON em lote | ( ) SGBD ( ) Spark ( ) Elasticsearch |
| C) Buscar reclamações com a palavra “atraso” | ( ) SGBD ( ) Spark ( ) Elasticsearch |
| D) Join de cadastro de clientes e pedidos | ( ) SGBD ( ) Spark ( ) Elasticsearch |

*Gabarito no caderno de exercícios.*

---

## Síntese da aula

Hoje você:

- Diferenciou dados **estruturados**, **semiestruturados** e **não estruturados**
- Reconheceu exemplos: **CSV/SQL**, **JSON/XML/logs**, **texto**
- Aplicou critérios para escolher **SGBD**, **Spark** e **Elasticsearch**
- Praticou classificação e proposta de ferramenta em cenário realista

**Próxima aula (05-06):** infraestrutura de processamento de dados (armazenamento, clusters, nuvem, custo × desempenho).

---

## Referências desta aula

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- ERL, T.; KHATTAK, W.; BUHLER, P. *Big Data Fundamentals.* Prentice Hall, 2015.
- RAMOS, A. *Infraestrutura Big Data com opensource.* Ciência Moderna, 2015.
- Documentação: Apache Spark · Elasticsearch Guide

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Complete as **Atividades 1, 2, 3 e 4** do caderno de exercícios.

Traga na próxima aula: **1 fonte de dados** do seu cotidiano classificada como E, S ou N.

**Escola do Futuro · Ciência de Dados**
