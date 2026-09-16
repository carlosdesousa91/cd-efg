# Exercício — Aula 15-16
## Processamento contínuo, tempo real e consulta near real-time

**Componente curricular:** Ecossistema de Big Data  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Atividade prática formativa + questionário curto (conforme plano de ensino)

---

## Instruções gerais

- Atividade **1** é individual (classificação).
- Atividade **2** é laboratório guiado (individual ou dupla) — streaming ou simulação.
- Atividade **3** é laboratório de consulta near real-time no Elasticsearch (individual ou dupla).
- Atividade **4** é o **questionário curto** individual.
- Atividade **5** é estudo de caso em grupo (opcional / se houver tempo).
- As atividades 1–4 integram **práticas formativas (40%)** e/ou **participação (15%)**, conforme orientação do professor.

### Ambiente usado hoje

- [ ] Spark Structured Streaming  
- [ ] Simulação por micro-batches (loop / leitura periódica)  
- [ ] Elasticsearch disponível: Sim / Não  
- [ ] Observação: ________________________________

---

## Atividade 1 — Classifique o ritmo (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Diferenciar batch, near real-time e real-time.

Marque **B** (batch), **N** (near real-time) ou **R** (real-time).

| # | Situação | Letra |
|---|----------|-------|
| 1 | Job às 2h processa todos os pedidos de ontem e gera relatório das 8h | |
| 2 | Painel de NOC atualiza contagem de erros a cada 30 segundos | |
| 3 | Autorização de cartão aprova/nega na hora da compra | |
| 4 | Consolidação semanal de estoque para a diretoria | |
| 5 | Suporte busca um ticket indexado há poucos segundos | |
| 6 | Alerta se CPU > 90% em menos de 1–2 segundos após a medição | |
| 7 | Recalcular ranking diário de vendedores às 23h59 | |
| 8 | Mapa de entregadores com posição “quase ao vivo” (atraso de alguns segundos ok) | |

**Em 2 linhas:** qual a diferença prática entre **N** e **R**?

> 

---

## Atividade 2 — Lab streaming / micro-batch (individual ou dupla)

**Tempo sugerido:** 35–40 minutos  
**Objetivo:** Experimentar processamento contínuo em nível introdutório.

### Opção A — Structured Streaming (pasta)

1. Crie a pasta `entrada_stream/`.  
2. Defina um schema simples, por exemplo: `ts` (string/timestamp), `servico` (string), `nivel` (string).  
3. Inicie uma query que conte eventos por `servico` e escreva no **console** (ou memória).  
4. Em outro passo, vá adicionando arquivos JSON pequenos na pasta.  
5. Observe a atualização da saída.

### Opção B — Simulação micro-batch (se streaming falhar)

1. Prepare 3 arquivos `lote1.json`, `lote2.json`, `lote3.json` (ou CSV).  
2. Em um loop/célula, a cada ~10–20s leia o próximo arquivo, una ao acumulado e mostre `groupBy("servico").count()`.  
3. Registre como “simulação de micro-batch”.

### Amostra de eventos (JSON por linha)

```json
{"ts":"2026-09-16T17:00:01","servico":"api-pedidos","nivel":"INFO"}
{"ts":"2026-09-16T17:00:05","servico":"api-pagamentos","nivel":"ERROR"}
{"ts":"2026-09-16T17:00:08","servico":"api-pedidos","nivel":"ERROR"}
{"ts":"2026-09-16T17:01:02","servico":"api-pedidos","nivel":"INFO"}
{"ts":"2026-09-16T17:01:10","servico":"api-entregas","nivel":"WARN"}
```

### Registro do experimento

| Item | Resposta |
|------|----------|
| Opção usada (A/B) | |
| O que foi contado/agregado? | |
| A saída atualizou após novos dados? (Sim/Não) | |
| Latência percebida (segundos, aproximado) | |
| 1 dificuldade encontrada | |

**Pergunta:** isso se parece mais com batch clássico, near real-time ou real-time estrito? Por quê?

> 

**Nomes (se dupla):**

| Nome |
|------|
| |
| |

---

## Atividade 3 — Consulta near real-time no Elasticsearch (individual ou dupla)

**Tempo sugerido:** 25–30 minutos  
**Objetivo:** Perceber busca quase imediata após indexação.

### Roteiro

1. Crie/use o índice `eventos_nrt`.  
2. Indexe **agora** 3–5 documentos de erro/alerta (JSON).  
3. Em seguida (sem esperar job batch), execute um `_search` com `match` ou `term`.  
4. (Opcional) Rode uma aggregation por `servico` ou `nivel`.  
5. Cronometre mentalmente: do POST até ver o hit — segundos?

### Modelo de documento

```json
{
  "ts": "2026-09-16T17:05:00",
  "servico": "api-pagamentos",
  "nivel": "ERROR",
  "mensagem": "timeout ao capturar pagamento"
}
```

### Registro

| Item | Resultado |
|------|-----------|
| Docs indexados (qtde) | |
| Query usada (resumo) | |
| Hits retornados | |
| Tempo percebido até a busca achar o doc | |
| ES indisponível? O que fez no lugar? | |

**Conclusão (3 linhas):** quando o Elasticsearch é melhor que esperar o próximo batch Spark?

> 

---

## Atividade 4 — Questionário curto (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Verificação formativa rápida (instrumento do plano).

### Parte A — V/F

| # | Afirmação | V/F |
|---|-----------|-----|
| 1 | Batch processa uma janela fechada de dados e costuma ter início e fim claros. | |
| 2 | Near real-time admite um atraso pequeno (segundos/minutos), desde que aceitável para o negócio. | |
| 3 | Todo painel que atualiza sozinho é necessariamente real-time em milissegundos. | |
| 4 | Janelas de tempo ajudam a agregar eventos “a cada X minutos”. | |
| 5 | Spark Structured Streaming pode operar em micro-batches. | |
| 6 | Elasticsearch é tipicamente usado para busca/exploração com baixa latência de consulta. | |
| 7 | Se o relatório pode sair no dia seguinte, streaming 24/7 quase sempre é obrigatório. | |
| 8 | Critérios de escolha incluem SLA de latência, custo operacional e tipo de pergunta (agregar vs buscar). | |

### Parte B — Associação

**Opções:** **A)** Batch · **B)** Near real-time · **C)** Real-time · **D)** Janela de tempo · **E)** Elasticsearch  

| # | Descrição | Letra |
|---|-----------|-------|
| 9 | Contar erros a cada 5 minutos sem sobreposição conceitual de intervalos | |
| 10 | Job noturno que fecha o D-1 | |
| 11 | Buscar mensagem de log indexada há poucos segundos | |
| 12 | Aprovar transação na hora, com SLA rígido de milissegundos/segundos | |
| 13 | Painel que pode atrasar 20–60s e ainda atende o NOC | |

---

## Atividade 5 — Estudo de caso: app de entregas (grupo)

**Tempo sugerido:** 15 minutos (opcional)  
**Objetivo:** Desenhar arquitetura batch + streaming/NRT + busca.

### Demandas

| ID | Demanda |
|----|---------|
| A | Ranking diário de entregadores |
| B | Mapa com posição quase ao vivo |
| C | Busca de reclamações com “atraso” |
| D | Alerta se erros da API > 100 em 5 minutos |

### Tarefas

**1)** Classifique A–D (B/N/R) e indique ferramenta principal (Spark batch, Spark streaming/micro-batch, ES, SGBD):

| ID | Ritmo | Ferramenta | Motivo (1 frase) |
|----|-------|------------|------------------|
| A | | | |
| B | | | |
| C | | | |
| D | | | |

**2)** Desenhe o fluxo em texto (4–6 etapas):

> 

**3)** Se o orçamento for baixo, qual demanda vocês **não** implementariam primeiro em streaming 24/7? Por quê?

> 

---

## Para o professor — Gabarito e orientações

### Atividade 1 — Gabarito sugerido

1B · 2N · 3R · 4B · 5N (busca ES) · 6R (ou N se o atraso for maior — aceitar debate) · 7B · 8N  

Diferença N×R: N tolera atraso curto; R exige resposta imediata ao evento com SLA rígido.

### Atividade 2 — Orientações

- Preferir demo estável: se `readStream` falhar no Colab/lab, usar **Opção B** sem penalizar.
- Cobrar registro de latência percebida e classificação (quase sempre **N**).
- Não exigir janelas complexas — `groupBy` simples já atende o introdutório.

### Atividade 3 — Orientações

- Se ES estiver fora: simular “NRT” com busca em arquivo atualizado + discussão do papel do ES; registrar indisponibilidade.
- Foco na percepção: indexou → buscou em segundos.

### Atividade 4 — Gabarito

**V/F:** 1V, 2V, 3F, 4V, 5V, 6V, 7F, 8V  

**Associação:** 9D · 10A · 11E · 12C · 13B  

### Atividade 5 — Orientação

| ID | Ritmo típico | Ferramenta típica |
|----|--------------|-------------------|
| A | B | Spark batch / SGBD+BI |
| B | N (às vezes R) | Stream + armazenamento de posição |
| C | N | Elasticsearch |
| D | N | Streaming + janela 5 min (alerta) |

### Critérios rápidos

| Critério | Indicador |
|----------|-----------|
| Conceito | ≥ 6/8 na Atividade 1 |
| Prática | Atividades 2 e/ou 3 com registro preenchido |
| Questionário | ≥ 10/13 na Atividade 4 |
| Caso | Tabela A–D coerente (Atividade 5) |

---

## Referências

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- Apache Spark Structured Streaming Programming Guide
- ELASTIC. *Elasticsearch Guide*
- WARREN, J.; MARZ, N. *Big Data.* Manning, 2015.

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
