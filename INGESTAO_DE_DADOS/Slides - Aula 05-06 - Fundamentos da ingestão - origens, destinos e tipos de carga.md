---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ingestão de Dados · Aula 05-06'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Ingestão de Dados

## Aula 05-06
### Fundamentos da ingestão — origens, destinos e tipos de carga

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 03-04 e objetivos de hoje |
| 0:20 – 1:05 | Fontes: arquivos, APIs, bancos e eventos |
| 1:05 – 1:20 | **Intervalo** |
| 1:20 – 2:10 | Carga completa e carga incremental |
| 2:10 – 2:25 | **Intervalo** |
| 2:25 – 3:10 | Esquema, codificação, duplicidade, metadados e destinos |
| 3:10 – 4:00 | Desenho do fluxo, fixação e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Reconhecer** arquivos, APIs, bancos e eventos como fontes
2. **Diferenciar** carga completa e carga incremental
3. **Identificar** problemas de esquema, codificação e duplicidade
4. **Listar** os metadados mínimos de uma ingestão
5. **Escolher** destino relacional, NoSQL ou analítico
6. **Desenhar** o fluxo da origem até o destino

---

## Retomada — Aula 03-04

Na aula anterior, você:

- Ordenou **Extract**, **Transform** e **Load**
- Decidiu se a transformação fica no **Python** (ETL) ou no **destino** (ELT)

**Pergunta de abertura (3 min):**

> ETL e ELT dizem **onde** o dado é tratado. Hoje a pergunta é outra: **de onde** ele sai, **para onde** vai e se a carga traz **tudo** ou **só o que mudou**.

---

## Da origem ao destino

```
Fonte → Extração → Carga → Destino → Uso
```

Quatro decisões acompanham esse caminho:

| Decisão | Pergunta |
|---------|----------|
| Fonte | O dado nasce em arquivo, API, banco ou evento? |
| Carga | Trago o conjunto inteiro ou só o novo/alterado? |
| Cuidado | Esquema, codificação e duplicidade estão sob controle? |
| Destino | Relacional, NoSQL ou analítico? |

---

## Quatro famílias de fonte

| Fonte | Como o dado chega | Exemplo neste curso |
|-------|-------------------|---------------------|
| **Arquivo** | CSV, JSON ou planilha | Agenda da clínica por e-mail |
| **API** | Resposta de um serviço web | Pedidos do e-commerce |
| **Banco** | Leitura de um SGBD já existente | Frota no sistema da secretaria |
| **Evento** | Mensagem que nasce na hora | Check-in, clique, sensor |

A família muda a extração. O destino continua precisando de esquema e de chave.

---

## Arquivos

O arquivo é uma foto que alguém gravou e enviou.

| Formato | Forma | Cuidado típico |
|---------|--------|----------------|
| CSV | Linhas e colunas separadas por `;` ou `,` | Separador, cabeçalho, aspas |
| JSON | Objetos com campos nomeados | Campo opcional, lista aninhada |
| Planilha | Abas e células | Aba errada, linha de título |

Antes de carregar, abra uma amostra: nomes das colunas, tipos e uma linha repetida.

---

## Amostra — CSV da agenda

```text
id;nome;cidade;status;atualizado_em
1;Ana;Goiânia;ok;2026-03-01
1;Ana;GoiÃ¢nia;ok;2026-03-01
2;Caio;Anápolis;confirmado;2026-03-02
```

O que já dá para ver:

- separador **ponto e vírgula**
- o `id` **1** aparece duas vezes
- `GoiÃ¢nia` indica leitura com **codificação** trocada
- `ok` e `confirmado` são o mesmo fato em palavras diferentes

---

## APIs

A API entrega o dado **quando o script pede**, em geral em JSON.

```text
GET /pedidos?atualizado_desde=2026-03-01&pagina=1
```

```json
{ "pagina": 1, "tem_proxima": true,
  "dados": [ { "pedido_id": 90, "status": "pago" } ] }
```

Cuidados: paginação, limite de chamadas, autenticação e o campo que marca o que já foi lido.

---

## Bancos como fonte

Às vezes a origem **já é** um SGBD operacional: a recepção grava o atendimento ali, o dia inteiro.

A ingestão **lê** essa base e leva uma cópia (ou um recorte) para o destino analítico.

| Prática | Por quê |
|---------|---------|
| Ler um recorte com data ou id | Evita copiar a base inteira sem necessidade |
| Evitar consulta pesada no horário de pico | O sistema operacional continua atendendo |
| Combinar colunas e tipos | O esquema de origem vira contrato |

A fonte relacional e o destino relacional podem ser **dois bancos**, ou dois esquemas no mesmo servidor.

---

## Eventos

O evento é um fato que nasce na hora: check-in, clique, sensor, mensagem.

```json
{ "evento_id": "a1", "tipo": "checkin",
  "ts": "2026-03-02T07:55:00", "unidade": "Centro" }
```

| Traço | Consequência na ingestão |
|-------|--------------------------|
| Chega sem um arquivo fechado | A extração acompanha o fluxo |
| Pode repetir o mesmo `evento_id` | A chave evita duplicar |
| Campos variam conforme o tipo | O destino precisa aceitar diferença |

Lote e streaming, em detalhe, ficam para o Bloco 5. Hoje basta reconhecer o evento como **fonte**.

---

## Carga completa

Cada execução traz **o conjunto inteiro** combinado e o destino passa a refletir essa foto.

```text
Arquivo do dia (80 unidades) → substitui a tabela de unidades
```

Combina com:

- cadastros pequenos (unidades, linhas de ônibus, lista de exames)
- arquivos que já são “o dia inteiro”
- situações em que refazer tudo é mais simples do que controlar o que mudou

---

## Carga incremental

Cada execução traz **só o que é novo ou foi alterado** desde a última marca.

```text
última marca: 2026-03-01 18:00
esta carga: pedidos com atualizado_em > essa marca
nova marca: 2026-03-02 18:00
```

A marca d'água pode ser uma **data**, um **id** crescente ou os dois. Sem marca confiável, a carga incremental não se sustenta.

---

## Completa × incremental

| | Completa | Incremental |
|---|----------|-------------|
| O que viaja | O conjunto combinado | Novos e alterados |
| Controle | Substituir o destino daquele conjunto | Marca d'água e chave |
| Quando brilha | Volume pequeno ou arquivo fechado do período | Volume que cresce todo dia |
| Risco típico | Custo de reler tudo | Duplicar ou perder correção antiga |
| Metadado-chave | Lote e quantidade | Marca d'água e quantidade |

As duas convivem com ETL e com ELT. São eixos diferentes.

---

## Como escolher o tipo de carga

1. O conjunto cabe inteiro, sem apertar tempo nem disco?
2. Existe `atualizado_em`, `id` ou outro campo confiável?
3. Uma correção em registro **antigo** precisa entrar na próxima carga?
4. Rodar de novo a mesma carga pode **duplicar** linha?

Se a resposta 2 for “não”, a carga completa do recorte (o arquivo do dia, o cadastro inteiro) é o caminho mais seguro.

---

## Esquema

Esquema é o **contrato** do que a carga espera encontrar.

| Combina-se | Exemplo |
|------------|---------|
| Nomes dos campos | `pedido_id`, `status`, `atualizado_em` |
| Tipos | data, número, texto |
| Obrigatoriedade | `pedido_id` não vem vazio |
| Valores aceitos | `pago`, `cancelado` — e o que fazer com `ok` |

Campo novo, coluna faltando ou status desconhecido: a carga registra o fato e segue a regra combinada (aceitar, ignorar ou rejeitar o lote).

---

## Codificação

Codificação é o modo como letras e acentos foram gravados.

`Goiânia` lido com a codificação errada vira `GoiÃ¢nia`.

| Conferir | Por quê |
|----------|---------|
| UTF-8 na leitura e na gravação | Padrão dos arquivos e das APIs deste curso |
| Acentos numa amostra | Revela troca de codificação antes da carga inteira |
| Separador do CSV | `;` e `,` mudam as colunas |

Cidade errada no painel, muitas vezes, começa na leitura do arquivo.

---

## Duplicidade

A mesma entidade chega mais de uma vez: o `id` 1 duas vezes no CSV, o mesmo `pedido_id` em duas páginas, o mesmo `evento_id` reenviado.

| Peça | Função |
|------|--------|
| **Chave de negócio** | `id`, `pedido_id`, `evento_id` |
| **Regra da carga** | Substituir, atualizar ou rejeitar a repetição |
| **Carga completa** | Trocar o conjunto, em vez de acrescentar por cima |
| **Carga incremental** | Atualizar a chave que já existe |

Sem chave, “carregar de novo” multiplica linha.

---

## Metadados mínimos

Metadado é o dado **sobre** a carga. O mínimo para saber o que entrou:

| Metadado | Exemplo |
|----------|---------|
| Fonte | `agenda_clinica.csv` ou `GET /pedidos` |
| Instante da extração | `2026-03-02 07:10` |
| Instante da carga | `2026-03-02 07:14` |
| Quantidade de registros | `1.240` lidos, `1.238` gravados |
| Identificador do lote | nome do arquivo ou número da execução |
| Marca d'água | último `atualizado_em` processado |
| Status | sucesso ou falha |

Quem opera o painel pergunta “de quando é esse número?”. A resposta está aqui.

---

## Destino relacional

Tabelas, colunas e SQL: MariaDB, MySQL ou PostgreSQL.

Combina quando:

- o esquema é estável
- o uso é junção, filtro e agregação
- a transformação do ELT será escrita em SQL

É o destino padrão dos painéis tabulares deste componente.

---

## Destino NoSQL

Documentos, no MongoDB, próximos do JSON da origem.

Combina quando:

- os campos mudam de um registro para outro
- o evento traz atributos opcionais
- a carga quer preservar o documento sem forçar todas as colunas

A chave (`evento_id`, `pedido_id`) continua necessária.

---

## Destino analítico

É o lugar **preparado para consulta e indicador**, separado do sistema que registra o fato na hora.

| Sistema operacional | Destino analítico |
|---------------------|-------------------|
| A recepção grava o atendimento agora | O painel lê a ocupação do dia |
| A alteração é de uma ficha | A carga traz o recorte combinado |
| Muita gente operando | Leitura de relatório sem disputar a ficha |

Pode ser um esquema `analitico` no mesmo PostgreSQL, uma tabela oficial depois do estágio, ou uma coleção de consulta. O que define é o **uso**, não a marca do software.

---

## Qual destino para qual uso

| Situação | Destino mais alinhado |
|----------|------------------------|
| Agenda vira tabela de ocupação com SQL | Relacional e analítico |
| JSON de ouvidoria com campos opcionais | NoSQL |
| Cadastro de frota consultado em relatório semanal | Analítico (tabela pronta para o painel) |
| Pedidos com `pedido_id`, status e data estáveis | Relacional |

Um fluxo pode ter estágio relacional **e** tabela analítica. Os dois papéis ficam explícitos no desenho.

---

## Estudo de caso — três caminhos

**1. Unidades da clínica**  
Planilha de 12 linhas, estável. Todo dia a mesma lista.

**2. Pedidos**  
API com `atualizado_em`. Dezenas de milhares de linhas no mês.

**3. Check-in da recepção**  
Um JSON por chegada, às vezes com campo `acompanhante`, às vezes sem.

**Discussão (5 min):** fonte, carga completa ou incremental, e destino de cada um.

---

## Atividade em grupo (25 min)

**Exercício 2 — Desenho do fluxo de ingestão**

Em grupos de 3 a 4 pessoas, um cenário do caderno:

```text
[Fonte: tipo e nome]
        ↓
[Extração: arquivo, API, banco ou evento]
        ↓
[Carga: completa ou incremental + chave]
        ↓
[Destino: relacional, NoSQL ou analítico]
```

No quadro ao lado: esquema, codificação, duplicidade e **quatro** metadados.

*Um grupo apresenta o desenho em 2 minutos.*

---

## O que esta aula fecha — e o que vem em seguida

Hoje o fluxo fica desenhado: origem, tipo de carga, cuidados e destino.

Na **Aula 07-08** o mesmo caminho sai do papel:

- abrir CSV e JSON com Python
- chamar uma API
- tratar erro de extração e validar o esquema da amostra

Traga o desenho do seu grupo. Ele vira o roteiro do laboratório.

---

## Fixação — Exercício 4 (10 min)

**Associe** cada situação ao conceito mais central:

| Situação | Conceito |
|----------|----------|
| A) `Goiânia` gravada e lida virou `GoiÃ¢nia` | ( ) Codificação ( ) Duplicidade |
| B) O `id` 1 aparece em duas linhas do CSV | ( ) Duplicidade ( ) API |
| C) A carga pede só `atualizado_em` maior que a marca | ( ) Incremental ( ) Completa |
| D) Anota-se a hora da carga e quantas linhas entraram | ( ) Metadado ( ) Esquema |

*Gabarito no caderno de exercícios.*

---

## Síntese da aula

Hoje você:

- Reconheceu **arquivo, API, banco e evento** como fontes
- Diferenciou carga **completa** e **incremental**
- Usou **esquema**, **codificação** e **chave** para ler uma amostra
- Listou os **metadados mínimos** da ingestão
- Escolheu destino **relacional**, **NoSQL** ou **analítico**
- Desenhou o fluxo da origem ao destino

**Próxima aula (07-08):** extração de arquivos e APIs com Python.

---

## Referências desta aula

- Plano de Ensino — Ingestão de Dados (Escola do Futuro)
- DENSMORE, J. *Data Pipelines Pocket Reference.* Sebastopol: O'Reilly Media, 2021.
- NGUYEN, H.; PHAM, H.; CHIN, C. *The Analytics Setup Guidebook.* Holistics.
- CRICKARD, P. *Data Engineering with Python.* Birmingham: Packt Publishing, 2020.

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Complete as **Atividades 1, 2, 3 e 4** do caderno de exercícios.

Na próxima aula, traga o **desenho do fluxo** e uma amostra pequena de CSV ou JSON.

**Escola do Futuro · Ciência de Dados**
