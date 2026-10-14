# Exercício — Aula 03-04
## ETL e ELT — conceitos e critérios de escolha

**Componente curricular:** Ingestão de Dados  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Atividades formativas (classificação de cenários)

---

## Instruções gerais

- Atividade **1** é individual ou em dupla (aquecimento).
- Atividade **2** é em grupo (3 a 4 integrantes) — atividade principal da aula.
- Atividades **3** e **4** são individuais.
- Atividade **5** é opcional (grupo ou plenária, se houver tempo).
- As atividades podem integrar a avaliação de **participação e engajamento (15%)** e preparam a escolha do projeto intermediário.

---

## Atividade 1 — Nomeie a ordem (individual ou dupla)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Reconhecer as etapas e a ordem de cada abordagem.

### Fluxo 1

Um script Python lê o CSV da agenda, padroniza as datas, remove o CPF e só então grava na tabela `ocupacao_dia`.

**a)** Ordem das etapas (numere 1, 2 e 3):

| Etapa | Ordem |
|-------|-------|
| Load — gravar na tabela oficial | |
| Extract — ler o CSV | |
| Transform — padronizar, deduplicar e remover o CPF | |

**b)** Este fluxo é ETL ou ELT? _______________

**c)** Onde a transformação acontece? _______________

### Fluxo 2

O mesmo CSV é gravado inteiro na tabela `staging_agenda`. Em seguida, uma consulta SQL cria `ocupacao_dia` já sem CPF e sem linha repetida.

**d)** Ordem das etapas (numere 1, 2 e 3):

| Etapa | Ordem |
|-------|-------|
| Transform — SQL que gera a tabela oficial | |
| Extract — ler o CSV | |
| Load — gravar o bruto no estágio | |

**e)** Este fluxo é ETL ou ELT? _______________

**f)** Qual é o papel da tabela `staging_agenda`?

> 

---

## Atividade 2 — Classificação de cenários (grupo)

**Tempo sugerido:** 20 minutos (+ 2 min se o grupo for sorteado)  
**Objetivo:** Decidir entre ETL e ELT com vantagem e cuidado explícitos.

### Contexto

Ainda não vamos agendar o job nem escolher lote ou streaming. A pergunta é só: **a transformação ocorre antes da carga ou no destino?**

Cada grupo preenche os **quatro** cenários. Na rodada de gamificação, a sala sorteia um cenário por grupo.

---

**Cenário A — Painel da clínica**  
A ocupação do dia é vista por recepção, gestão e estagiários. O arquivo traz nome e CPF. A regra da instituição: o banco do painel não armazena CPF.

**Cenário B — Pedidos do e-commerce**  
A API entrega o JSON completo do mês. O PostgreSQL tem espaço. O marketing avisou que a definição de “venda válida” vai mudar e que o histórico bruto precisa continuar disponível.

**Cenário C — Secretaria municipal**  
O CSV de viagens chega com datas em três formatos e linhas duplicadas. O SGBD da secretaria é pequeno. O painel público deve mostrar só o agregado limpo por linha de ônibus. A limpeza cabe no Python do laboratório.

**Cenário D — Laboratório de análises**  
Chegam exportações grandes todo dia. O SGBD aguenta guardar a carga bruta. A equipe de indicadores trabalha em SQL e, com frequência, refaz o mês anterior quando uma tabela de códigos é corrigida.

---

### Tarefas do grupo

| Cenário | ETL ou ELT | Uma vantagem dessa escolha | Um limite, custo ou cuidado de governança |
|---------|------------|----------------------------|--------------------------------------------|
| A | | | |
| B | | | |
| C | | | |
| D | | | |

**Pergunta do grupo:** em qual cenário a escolha foi mais difícil? O que faltou saber para ter certeza?

> 

**Integrantes:**

| Nome | |
|------|--|
| | |
| | |
| | |
| | |

---

## Atividade 3 — Mini reflexão: onde a regra mora (individual)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Comparar as abordagens com critério de custo, limite ou governança.

Redija **um parágrafo** (8 a 12 linhas) respondendo:

> **"Em que situação eu transformaria o dado antes de carregar e em que situação eu carregaria o bruto para transformar no banco?"**

Seu texto **deve** incluir:

- [ ] Onde a transformação acontece no **ETL**
- [ ] Onde a transformação acontece no **ELT**
- [ ] **1 cenário** em que o ETL é mais apropriado
- [ ] **1 cenário** em que o ELT é mais apropriado
- [ ] **1 critério** entre custo, limitação ou governança

**Espaço para redação:**

> 

---

## Atividade 4 — Associação: situação × conceito (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Fixar etapas, lugar da transformação, custo e governança.

**Instrução:** Para cada item, marque **uma** letra (A–H) correspondente ao conceito **mais central**.

**Opções:**

- **A)** Extract  
- **B)** Transform  
- **C)** Load  
- **D)** ETL  
- **E)** ELT  
- **F)** Vantagem do ELT (reprocessar sem voltar à origem)  
- **G)** Cuidado de governança  
- **H)** Custo de armazenamento no destino  

| # | Situação | Letra |
|---|----------|-------|
| 1 | O script abre o CSV enviado pela clínica. | |
| 2 | As datas `01/03/2026` e `01-03-2026` viram `2026-03-01`. | |
| 3 | A linha já tratada entra na tabela `ocupacao_dia`. | |
| 4 | Padronizar, remover CPF e deduplicar ocorrem no Python; o banco só recebe o resultado. | |
| 5 | O bruto fica em `staging_pedidos` e a regra de “venda válida” é uma consulta SQL. | |
| 6 | A tabela de códigos mudou e o indicador do mês passado é refeito em SQL, sobre os dados que já estavam no estágio. | |
| 7 | O estágio com laudo e CPF está liberado para qualquer usuário do banco. | |
| 8 | A diretoria reclama do disco: há doze meses de JSON cru além das tabelas oficiais. | |

---

## Atividade 5 — Caso misto: máscara e histórico (grupo ou plenária)

**Tempo sugerido:** 15 minutos (se houver tempo ao final da aula)  
**Objetivo:** Perceber que um cenário pode puxar as duas abordagens e que a governança desempata.

Leia o caso e responda.

---

**Caso — Operadora de exames**  
A operadora recebe, todo dia, um arquivo com CPF, exame e resultado. Duas exigências convivem:

1. O painel visto pela rede de clínicas **não pode** armazenar CPF.
2. A auditoria interna precisa refazer indicadores do trimestre quando a tabela de códigos de exame é corrigida, sem pedir o arquivo de novo ao parceiro.

O SGBD tem espaço. A equipe usa Python e SQL.

---

### Questões

**1)** Qual exigência empurra para ETL? Qual empurra para ELT?

| Exigência | Puxa para | Por quê |
|-----------|-----------|---------|
| 1. Painel sem CPF | | |
| 2. Refazer o trimestre sem reextrair | | |

**2)** Proponha um desenho que atenda às duas. Use as palavras **estágio**, **SQL** e **tabela oficial**.

> 

**3)** Que regra de governança impede o painel de ler o dado cru?

> 

**4)** Onde este desenho gera custo: no Python, no disco do SGBD, ou nos dois? Explique em duas linhas.

> 

---

## Para o professor — Gabarito e orientações

### Atividade 1 — Gabarito sugerido

**Fluxo 1**

| Etapa | Ordem |
|-------|-------|
| Extract — ler o CSV | 1 |
| Transform — padronizar, deduplicar e remover o CPF | 2 |
| Load — gravar na tabela oficial | 3 |

- **b)** ETL
- **c)** No Python, antes da carga

**Fluxo 2**

| Etapa | Ordem |
|-------|-------|
| Extract — ler o CSV | 1 |
| Load — gravar o bruto no estágio | 2 |
| Transform — SQL que gera a tabela oficial | 3 |

- **e)** ELT
- **f)** Guardar o dado fiel à origem para que o SQL do destino faça a transformação. Aceitar “área de estágio” ou “tabela bruta”.

### Atividade 2 — Classificação típica

Valorizar a **justificativa**. A coluna da direita é o que diferencia participação consistente de chute.

| Cenário | Tendência | Vantagem típica | Cuidado típico |
|---------|-----------|-----------------|----------------|
| A | **ETL** | CPF não chega ao banco do painel | Se o bruto não for guardado em outro lugar controlado, uma regra nova exige reextrair |
| B | **ELT** | Dá para mudar “venda válida” com SQL sobre o histórico | Disco e acesso: o JSON cru fica no destino |
| C | **ETL** | O SGBD pequeno só guarda o agregado limpo | O Python do laboratório é o limite se o CSV crescer muito |
| D | **ELT** | Reprocessar o mês no SGBD, sem novo pedido à origem | Custo de guardar a carga bruta e risco de consultar o estágio |

- Cenário A admite ELT **somente** se o grupo restringir o estágio e a primeira transformação SQL eliminar o CPF antes de qualquer uso. Cobrar esse cuidado de governança; sem ele, a resposta esperada é ETL.
- Na gamificação, 1 ponto pela escolha coerente, 1 pela vantagem, 1 pelo cuidado. Empate favorece o grupo que citou governança ou custo com exemplo do próprio cenário.

### Atividade 3 — Orientações

O parágrafo atende se contiver os cinco itens do enunciado. Não há par “certo” de cenários: clínica/dado sensível para ETL e reprocessamento/SQL para ELT são os eixos mais alinhados à aula.

### Atividade 4 — Gabarito sugerido

| # | Resposta | Justificativa breve |
|---|----------|---------------------|
| 1 | **A** | Ler a origem é Extract |
| 2 | **B** | Padronizar valor é Transform |
| 3 | **C** | Gravar no destino oficial é Load |
| 4 | **D** | Transformação fora do destino, antes da carga |
| 5 | **E** | Carga do bruto e transformação no SGBD |
| 6 | **F** | A regra nova usa o que já está no estágio |
| 7 | **G** | Dado sensível exposto no destino |
| 8 | **H** | Guardar o cru aumenta o armazenamento |

### Atividade 5 — Orientações

| Exigência | Leitura esperada |
|-----------|------------------|
| Painel sem CPF | Puxa para ETL, ou para um ELT em que o CPF não vaze para a tabela oficial |
| Refazer o trimestre | Puxa para ELT, porque o bruto precisa permanecer no destino |

Desenho aceitável: carregar o arquivo em um **estágio** com acesso restrito; um **SQL** remove o CPF e grava a **tabela oficial**; o painel lê só a oficial. Custo nos dois lados se houver limpeza prévia em Python e retenção do bruto no disco — aceitar “principalmente no disco do SGBD” quando o grupo coloca a máscara só no SQL.

### Critérios rápidos de participação (qualitativo)

| Critério | Indicador |
|----------|-----------|
| Engajamento | Contribuiu no desafio e na Atividade 2 |
| Clareza | Atividade 3 distingue o lugar da transformação e cita um critério |
| Colaboração | Grupo entregou os quatro cenários com vantagem e cuidado |
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
