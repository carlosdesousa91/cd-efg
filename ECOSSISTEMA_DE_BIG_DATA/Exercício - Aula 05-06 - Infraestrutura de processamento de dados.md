# Exercício — Aula 05-06
## Infraestrutura de processamento de dados

**Componente curricular:** Ecossistema de Big Data  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Atividades formativas (diagramação de arquitetura simplificada)

---

## Instruções gerais

- Atividade **1** é individual ou em dupla (aquecimento).
- Atividade **2** é em **duplas ou trios** (atividade principal — prevista no plano de ensino).
- Atividades **3** e **4** são individuais.
- Atividade **5** é opcional (plenária, se houver tempo).
- A Atividade 2 integra **participação (15%)** e prepara as práticas/laboratórios (40%).

---

## Atividade 1 — Papéis da infraestrutura (individual ou dupla)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Distinguir armazenamento, processamento e orquestração.

Marque **A** (armazenamento), **P** (processamento) ou **O** (orquestração).

| # | Situação | Letra |
|---|----------|-------|
| 1 | Salvar arquivos JSON de sensores em um bucket/disco por 12 meses | |
| 2 | Agregar umidade média por talhão em um job Spark | |
| 3 | Agendar o job todo dia às 02:00 e reexecutar se falhar | |
| 4 | Manter índice de alertas textuais no Elasticsearch | |
| 5 | Transformar CSV bruto em tabela limpa com Spark SQL | |
| 6 | Só iniciar a carga no SGBD depois que a validação terminar com sucesso | |
| 7 | Guardar cadastro de clientes no PostgreSQL | |
| 8 | Enviar alerta ao time se o pipeline da madrugada falhar | |

**Resposta breve:** Em uma frase, o que diferencia processamento de orquestração?

> 

---

## Atividade 2 — Desenho de arquitetura simplificada (dupla/trio)

**Tempo sugerido:** 25–30 minutos  
**Objetivo:** Reconhecer componentes, escolher ambiente e justificar trade-offs de custo × desempenho.

### Escolham **um** cenário

**Cenário A — AgroSinal (cooperativa)**  
Telemetria JSON de sensores; relatório diário de umidade; busca em alertas textuais (“falha de sensor”); orçamento apertado no 1º semestre.

**Cenário B — Rede de farmácias**  
Vendas no SGBD; logs de e-commerce em JSON; busca em reclamações de clientes; dashboard semanal para gerentes; picos em datas promocionais.

**Cenário C — Prefeitura (dados abertos)**  
Arquivos CSV publicados semanalmente; consolidação mensal de indicadores; portal de busca em manifestações da ouvidoria (texto); equipe pequena de TI.

**Cenário D — Lab da Escola do Futuro (didático)**  
Turma aprendendo Spark e Elasticsearch com datasets de até 2 GB; precisa de ambiente reprodutível e baixo custo.

---

### 2.1 Identificação

| Campo | Preenchimento |
|-------|---------------|
| Cenário escolhido | |
| Nomes do grupo | |
| Ambiente escolhido (local / cluster / nuvem / híbrido) | |
| Ferramentas previstas (SGBD / Spark / Elasticsearch / outras) | |

### 2.2 Componentes

Preencham:

| Pilar | O que será usado no cenário? | Por quê? |
|-------|------------------------------|----------|
| Armazenamento | | |
| Processamento | | |
| Orquestração | | |

### 2.3 Diagrama (obrigatório)

Desenhem no espaço abaixo (caixas e setas) a arquitetura mínima:

```
[Fontes] → ... → ... → [Consumo / resultado]


Orquestração: ...
Ambiente: ...
```

*(Se preferirem, desenhem em folha/quadro e colem foto na plataforma indicada pelo professor.)*

### 2.4 Trade-off consciente

**a)** O que vocês **priorizaram**? (custo / desempenho / simplicidade / disponibilidade)

> 

**b)** O que **abriram mão** com essa escolha?

> 

**c)** Se o volume de dados **triplicar** em 6 meses, o que mudaria na arquitetura?

> 

---

## Atividade 3 — Local, cluster ou nuvem? (individual)

**Tempo sugerido:** 12 minutos  
**Objetivo:** Comparar ambientes com critérios explícitos.

Para cada situação, indique o ambiente **mais adequado** e uma justificativa curta.

| # | Situação | Ambiente (local / cluster / nuvem) | Justificativa |
|---|----------|-------------------------------------|---------------|
| 1 | Estudante testando PySpark com 500 MB de CSV no notebook | | |
| 2 | Empresa com dados sigilosos e política rígida de não sair do datacenter | | |
| 3 | Startup com picos imprevisíveis e time de 2 pessoas de infra | | |
| 4 | Job estável todo dia, hardware já comprado e equipe de operações madura | | |
| 5 | Workshop de 4 horas com Elasticsearch via Docker na escola | | |

**Pergunta final:** Cite **um risco de custo** típico da nuvem e **um risco operacional** típico do cluster on-premises.

> Nuvem:  
> Cluster:  

---

## Atividade 4 — Associação e verdadeiro/falso (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Fixar vocabulário de infraestrutura.

### 4.1 Associação

**Opções:** **A)** Nó · **B)** Cluster · **C)** Armazenamento · **D)** Processamento · **E)** Orquestração · **F)** Trade-off

| # | Definição / situação | Letra |
|---|----------------------|-------|
| 1 | Conjunto de máquinas que cooperam em uma tarefa | |
| 2 | Uma máquina (física ou virtual) participante do sistema | |
| 3 | Escolher mais desempenho aceitando maior custo | |
| 4 | Camada que agenda jobs e trata dependências/falhas | |
| 5 | Camada que transforma e agrega dados | |
| 6 | Camada que persiste dados para uso posterior | |

### 4.2 Verdadeiro (V) ou Falso (F)

| # | Afirmação | V/F |
|---|-----------|-----|
| 1 | Ambiente local é ideal para afirmar capacidade de produção em petabytes. | |
| 2 | Orquestração substitui a necessidade de um motor de processamento. | |
| 3 | Um mesmo projeto pode combinar SGBD, arquivos e Elasticsearch. | |
| 4 | Cluster aumenta escala, mas também a complexidade operacional. | |
| 5 | Na nuvem, o custo de saída (egress) dos dados pode ser relevante. | |

---

## Atividade 5 — Crítica de arquitetura (grupo ou plenária)

**Tempo sugerido:** 10–15 minutos (opcional)  
**Objetivo:** Avaliar uma proposta e sugerir melhorias.

### Arquitetura proposta (hipotética)

> “Vamos colocar **tudo** (cadastros, logs, vídeos e busca) em um único PostgreSQL no notebook do estagiário. Não precisamos de orquestração: alguém roda o script manualmente quando lembrar. Se ficar lento, compramos mais RAM para o notebook.”

### Questões

**1)** Quais pilares estão fracos ou ausentes?

> 

**2)** Quais riscos de **desempenho**, **custo** e **operação** vocês identificam?

> 

**3)** Proponham uma versão **mínima viável** melhor (5–8 linhas), citando ambiente e ferramentas:

> 

---

## Para o professor — Gabarito e orientações

### Atividade 1 — Gabarito sugerido

| # | Resposta |
|---|----------|
| 1 | **A** |
| 2 | **P** |
| 3 | **O** |
| 4 | **A** (índice como armazenamento especializado; aceitar discussão) |
| 5 | **P** |
| 6 | **O** |
| 7 | **A** |
| 8 | **O** |

Diferença-chave: processamento **executa a transformação**; orquestração **coordena quando/ordem/falhas**.

### Atividade 2 — Orientações por cenário

| Cenário | Ambiente frequente | Notas |
|---------|--------------------|-------|
| A AgroSinal | Nuvem enxuta ou híbrido; local só para POC | Spark batch + Elasticsearch para alertas + storage barato |
| B Farmácias | Híbrido/nuvem (picos) | SGBD vendas + Spark logs + ES reclamações |
| C Prefeitura | Local/cluster leve ou nuvem governamental | Simplicidade e custo; orquestração semanal/mensal |
| D Lab escolar | **Local + Docker** | Priorizar aprendizado e reprodutibilidade |

Avaliar: diagrama legível; três pilares presentes; trade-off explícito; coerência com o volume/latência do cenário.

### Atividade 3 — Gabarito orientativo

| # | Ambiente |
|---|----------|
| 1 | Local |
| 2 | Cluster (on-prem) |
| 3 | Nuvem |
| 4 | Cluster |
| 5 | Local |

### Atividade 4 — Gabarito

**4.1:** 1-B · 2-A · 3-F · 4-E · 5-D · 6-C  

**4.2:** 1-F · 2-F · 3-V · 4-V · 5-V

### Atividade 5 — Pontos esperados

- Misturar workloads demais em um único SGBD local
- Ausência de orquestração confiável
- Escala vertical no notebook não resolve Big Data
- Proposta melhor: separar cadastro (SGBD), lote (Spark), busca (ES), agendar jobs, escolher ambiente adequado

### Critérios rápidos de participação (qualitativo)

| Critério | Indicador |
|----------|-----------|
| Conceitos | ≥ 6 acertos na Atividade 1 |
| Arquitetura | Diagrama da Atividade 2 completo e coerente |
| Critério | Trade-off custo × desempenho explicitado |
| Fixação | ≥ 8 acertos combinados na Atividade 4 |

---

## Referências

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- RAMOS, A. *Infraestrutura Big Data com opensource.* Rio de Janeiro: Ciência Moderna, 2015.
- ERL, T.; KHATTAK, W.; BUHLER, P. *Big Data Fundamentals.* Prentice Hall, 2015.
- WARREN, J.; MARZ, N. *Big Data: Principles and best practices of scalable realtime data systems.* Manning, 2015.

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
