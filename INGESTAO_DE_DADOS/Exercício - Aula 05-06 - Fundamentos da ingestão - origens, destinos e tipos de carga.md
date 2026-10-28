# Exercício — Aula 05-06
## Fundamentos da ingestão — origens, destinos e tipos de carga

**Componente curricular:** Ingestão de Dados  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Atividades formativas (desenho de fluxo de ingestão)

---

## Instruções gerais

- Atividade **1** é individual ou em dupla (aquecimento com amostras).
- Atividade **2** é em grupo (3 a 4 integrantes) — atividade principal da aula.
- Atividades **3** e **4** são individuais.
- Atividade **5** é opcional (grupo ou plenária, se houver tempo).
- As atividades podem integrar a avaliação de **participação e engajamento (15%)**.
- A Atividade 2 é o exercício de desenho do fluxo previsto no plano de ensino.

---

## Atividade 1 — Leitura de amostras (individual ou dupla)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Reconhecer fonte, esquema, codificação e duplicidade numa amostra pequena.

### Amostra A — arquivo `agenda.csv`

```text
id;nome;cidade;status;atualizado_em
1;Ana;Goiânia;ok;2026-03-01
1;Ana;GoiÃ¢nia;ok;2026-03-01
2;Caio;Anápolis;confirmado;2026-03-02
```

### Amostra B — resposta de API

```json
{
  "pagina": 1,
  "tem_proxima": true,
  "dados": [
    { "pedido_id": 90, "status": "pago", "atualizado_em": "2026-03-02T18:00:00" }
  ]
}
```

### Amostra C — evento

```json
{ "evento_id": "a1", "tipo": "checkin", "ts": "2026-03-02T07:55:00", "unidade": "Centro" }
```

### Questões

**1)** Classifique a família da fonte:

| Amostra | Arquivo, API, banco ou evento? |
|---------|--------------------------------|
| A | |
| B | |
| C | |

**2)** Na amostra A, aponte:

| Cuidado | Onde aparece |
|---------|----------------|
| Codificação | |
| Duplicidade (qual chave?) | |
| Esquema de valores (status) | |
| Separador do CSV | |

**3)** A amostra B informa que existe próxima página. O que a extração precisa fazer além de ler a página 1?

> 

**4)** Qual campo da amostra B serviria de marca d'água para uma carga incremental?

> 

---

## Atividade 2 — Desenho do fluxo de ingestão (grupo)

**Tempo sugerido:** 25 minutos (+ 2 min se o grupo apresentar)  
**Objetivo:** Desenhar o caminho da origem ao destino, com tipo de carga, cuidados e metadados.

### Contexto

O professor distribui **um** cenário por grupo. O desenho deve caber numa folha ou num quadro e ser legível para outra equipe.

Ainda não há código. O produto é o fluxo.

---

**Cenário A — Unidades da clínica**  
Planilha CSV com 12 unidades (nome, cidade, código). Muda raramente. O painel de ocupação precisa dessa lista em uma tabela PostgreSQL, separada do sistema da recepção.

**Cenário B — Pedidos do e-commerce**  
API paginada, com `pedido_id` e `atualizado_em`. Dezenas de milhares de pedidos no mês. O destino é uma tabela relacional de vendas. Correções de status em pedidos antigos precisam entrar na carga seguinte.

**Cenário C — Ouvidoria**  
Cada manifestação chega em JSON. Há sempre `protocolo` e `texto`; `bairro` e `anexo` aparecem só em parte dos registros. O time quer conservar o documento como chegou.

**Cenário D — Frota da secretaria**  
A frota já está numa tabela do SGBD operacional (cerca de 200 linhas). Uma vez por dia o relatório semanal precisa de uma cópia pronta para consulta, sem disputar o sistema que a oficina atualiza.

---

### Tarefas do grupo

**1)** Cenário: _______________

**2)** Desenho (preencha as caixas):

```text
[ Fonte: tipo e nome ]
            ↓
[ Extração: o que se lê e como ]
            ↓
[ Carga: completa ou incremental ]
[ Chave de negócio: _______________ ]
[ Marca d'água, se houver: _______________ ]
            ↓
[ Destino: relacional, NoSQL ou analítico ]
[ Nome da tabela ou coleção: _______________ ]
```

**3)** Cuidados deste fluxo:

| Cuidado | O que observar neste cenário |
|---------|------------------------------|
| Esquema | |
| Codificação | |
| Duplicidade | |

**4)** Quatro metadados mínimos que esta carga deve registrar:

| # | Metadado | Exemplo neste cenário |
|---|----------|------------------------|
| 1 | | |
| 2 | | |
| 3 | | |
| 4 | | |

**5)** Em uma frase: o que o painel ou o relatório deixa de mostrar se esta carga falhar?

> 

**Integrantes:**

| Nome |
|------|
| |
| |
| |
| |

---

## Atividade 3 — Mini reflexão: tudo de novo, ou só o que mudou (individual)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Justificar carga completa ou incremental com marca, chave e destino.

Redija **um parágrafo** (8 a 12 linhas) respondendo:

> **"Em que situação eu recarregaria o conjunto inteiro e em que situação eu traria só o que é novo ou foi alterado?"**

Seu texto **deve** incluir:

- [ ] **1 caso** de carga completa, com o motivo (tamanho, arquivo fechado ou ausência de marca)
- [ ] **1 caso** de carga incremental, citando a **marca d'água**
- [ ] A **chave** usada para não duplicar
- [ ] O **destino** (relacional, NoSQL ou analítico) de pelo menos um dos casos

**Espaço para redação:**

> 

---

## Atividade 4 — Associação: situação × conceito (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Fixar famílias de fonte, tipo de carga, cuidados e metadados.

**Instrução:** Para cada item, marque **uma** letra (A–H) correspondente ao conceito **mais central**.

**Opções:**

- **A)** Arquivo como fonte  
- **B)** API como fonte  
- **C)** Banco como fonte  
- **D)** Evento como fonte  
- **E)** Carga completa  
- **F)** Carga incremental  
- **G)** Codificação ou duplicidade  
- **H)** Metadado mínimo da ingestão  

| # | Situação | Letra |
|---|----------|-------|
| 1 | A agenda do dia chega em `agenda.csv`, com cabeçalho e separador `;`. | |
| 2 | O script chama `GET /pedidos?pagina=2` e recebe JSON. | |
| 3 | Toda noite a ingestão lê a tabela `frota` do sistema da oficina. | |
| 4 | Cada check-in nasce na hora, com `evento_id` e `ts`. | |
| 5 | As 12 unidades são recarregadas por inteiro, porque a lista é pequena e estável. | |
| 6 | Entram só os pedidos com `atualizado_em` maior que a última marca. | |
| 7 | A cidade `Goiânia` foi lida como `GoiÃ¢nia` e o `id` 1 está em duas linhas. | |
| 8 | O registro da execução guarda a hora da carga, a quantidade de linhas e o nome do arquivo. | |

---

## Atividade 5 — Três destinos (grupo ou plenária)

**Tempo sugerido:** 15 minutos (se houver tempo ao final da aula)  
**Objetivo:** Associar o uso do dado a destino relacional, NoSQL ou analítico.

Para cada pedido, escolha o destino mais alinhado e justifique em uma linha. Destinos possíveis: **relacional**, **NoSQL**, **analítico**. Pode haver mais de um papel no mesmo fluxo.

| Pedido | Destino | Por quê |
|--------|---------|---------|
| Guardar o JSON da ouvidoria com campos que nem sempre vêm | | |
| Consultar ocupação do dia com `SELECT`, fora do sistema da recepção | | |
| Manter `pedido_id`, status e data em colunas fixas, com chave única | | |

**Pergunta:** no pedido da ocupação, o sistema da recepção pode ser a fonte e o painel, o destino analítico. O que quebra se os dois forem a mesma tabela, atualizada o dia inteiro pela recepção e lida ao mesmo tempo pelo relatório?

> 

---

## Para o professor — Gabarito e orientações

### Atividade 1 — Gabarito sugerido

| Amostra | Família |
|---------|---------|
| A | **Arquivo** (CSV) |
| B | **API** |
| C | **Evento** |

| Cuidado na amostra A | Onde |
|----------------------|------|
| Codificação | `GoiÃ¢nia` na segunda linha |
| Duplicidade | `id` 1 repetido |
| Esquema de valores | `ok` e `confirmado` |
| Separador | `;` |

- **3)** Percorrer as páginas enquanto `tem_proxima` for verdadeiro (ou enquanto houver página seguinte).
- **4)** `atualizado_em`. Aceitar também `pedido_id` se o grupo explicar que a marca é o maior id já lido; lembrar que id só numérico perde correção de pedido antigo se o status mudar sem id novo.

### Atividade 2 — Leitura esperada dos cenários

Valorizar desenho completo (fonte, extração, carga, chave, destino) e quatro metadados nomeados. A frase sobre a falha mostra se o grupo entendeu a alimentação do sistema.

| Cenário | Fonte | Carga típica | Chave | Destino |
|---------|-------|--------------|-------|---------|
| A | Arquivo CSV | **Completa** (conjunto pequeno) | `código` da unidade | Relacional **analítico** (tabela do painel) |
| B | API paginada | **Incremental** pela marca `atualizado_em` | `pedido_id` | Relacional |
| C | Evento / JSON | Incremental por chegada, ou lote do período se o grupo ainda não usar fila | `protocolo` | **NoSQL** (documento) |
| D | Banco operacional | **Completa** (cerca de 200 linhas) | identificador do veículo | **Analítico** (cópia para o relatório) |

- Cenário B: se o grupo escolher carga completa “porque é mais simples”, peça o custo de reler o mês inteiro e a necessidade de correção antiga. A tendência da aula é incremental.
- Cenário C: aceitar destino relacional só com justificativa de colunas fixas e campo de texto; o enunciado puxa para documento.
- Metadados aceitáveis: fonte, instante da extração, instante da carga, quantidade, identificador do lote/arquivo, marca d'água, status. Exigir quatro, não a lista inteira.
- Codificação: nos CSV, citar UTF-8 e amostra com acento. Na API e no evento, citar UTF-8 do JSON.

### Atividade 3 — Orientações

O parágrafo atende se houver um caso completo, um caso incremental com marca d'água, uma chave e um destino. Cadastro pequeno ou arquivo fechado do dia sustentam a carga completa. API com `atualizado_em` sustenta a incremental.

### Atividade 4 — Gabarito sugerido

| # | Resposta | Justificativa breve |
|---|----------|---------------------|
| 1 | **A** | CSV é arquivo |
| 2 | **B** | Chamada HTTP que devolve JSON |
| 3 | **C** | A origem é uma tabela de SGBD |
| 4 | **D** | Fato que nasce na hora, com identificador próprio |
| 5 | **E** | O conjunto inteiro é recarregado |
| 6 | **F** | Só o que passou da marca |
| 7 | **G** | Mojibake e chave repetida; aceitar a letra única mesmo com dois problemas na frase |
| 8 | **H** | Hora, quantidade e nome do arquivo descrevem a carga |

*Item 7 junta codificação e duplicidade de propósito, para o estudante reconhecer a família “cuidado com a amostra”. A letra é uma só.*

### Atividade 5 — Orientações

| Pedido | Destino alinhado |
|--------|------------------|
| JSON com campos opcionais | NoSQL |
| Ocupação consultada fora da recepção | Analítico (em geral também relacional) |
| Colunas fixas e chave única | Relacional |

A pergunta final: relatório e operação na mesma tabela disputam a base viva, misturam dado ainda incompleto com indicador e dificultam saber “de quando é o número”. A cópia analítica separa o uso.

### Critérios rápidos de participação (qualitativo)

| Critério | Indicador |
|----------|-----------|
| Engajamento | Contribuiu na leitura da amostra e na apresentação do desenho |
| Clareza | Atividade 3 distingue carga completa e incremental com marca e chave |
| Colaboração | Grupo entregou o fluxo com destino, chave e quatro metadados |
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
