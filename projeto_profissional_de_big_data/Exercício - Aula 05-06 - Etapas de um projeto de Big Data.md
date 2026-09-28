# Exercício — Aula 05-06
## Etapas de um projeto de Big Data — da concepção à execução

**Componente curricular:** Projeto Profissional de Big Data  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Atividades formativas (alimentam a entrega de **10%** da Aula 07-08)

---

## Instruções gerais

- Atividade **1** é individual ou em dupla.
- Atividades **2**, **3** e **4** são em equipe (a mesma do mapa de oportunidade).
- A **Atividade 3** é a atividade principal da aula (esboço das etapas). **Não vale os 10%** — esses são na Aula 07-08.
- A Atividade 3 pode integrar a avaliação de **participação e engajamento (15%)**.
- Tragam o **mapa de oportunidade** da Aula 03-04. Se o recorte mudou, registrem a mudança no início da Atividade 3.

---

## Atividade 1 — Ordem e artefato (individual ou dupla)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Relacionar cada saída documental à etapa certa da cadeia.

### 1.1 Numeração da cadeia

Numere de **1 a 6** a ordem recomendada neste componente:

| Ordem | Etapa |
|-------|--------|
| | Operação (quem roda, custo, monitoramento) |
| | Fontes de dados (origem, licença, qualidade) |
| | Problema (quem sofre e a decisão) |
| | Arquitetura (fluxo ingestão → entrega) |
| | Valor (o que muda se der certo) |
| | MVP (menor evidência técnica) |

---

### 1.2 Artefato × etapa

Marque a etapa **mais central** de cada artefato.

**Etapas:** P = Problema · V = Valor · F = Fontes · A = Arquitetura · M = MVP · O = Operação

| # | Artefato | Letra |
|---|----------|-------|
| 1 | Lista de CSVs da cooperativa, licença e volume aproximado por semana | |
| 2 | “O gestor reduz de 4 horas para 30 minutos a preparação da reunião de sexta.” | |
| 3 | Diagrama com caixas: ingestão em lote → Spark → tabela + README | |
| 4 | Job PySpark em **amostra** de 2 semanas + 3 consultas de verificação | |
| 5 | “Unidades enviam qualidade do leite em formatos diferentes e a reunião usa dado atrasado.” | |
| 6 | Responsável da sexta-feira, tempo máximo do job e o que fazer se nulos > 10% | |

---

### 1.3 Uma frase por etapa (rascunho pessoal)

Usando o recorte da **sua** equipe, complete só com frases curtas (depois alinham na Atividade 3):

| Etapa | Uma frase |
|-------|-----------|
| Problema | |
| Valor | |
| Fontes | |
| Arquitetura | |
| MVP | |
| Operação | |

---

## Atividade 2 — Requisitos e Vs (equipe)

**Tempo sugerido:** 20 minutos (inclui diagramação coletiva das caixas)  
**Objetivo:** Separar requisitos de negócio e de dados e nomear os Vs do recorte.

### 2.1 Requisitos de negócio (mínimo 3)

| # | Requisito de negócio | Como saberemos se foi atendido? |
|---|----------------------|----------------------------------|
| 1 | | |
| 2 | | |
| 3 | | |

### 2.2 Requisitos de dados (mínimo 3)

| # | Requisito de dados | Fonte / limitação |
|---|--------------------|-------------------|
| 1 | | |
| 2 | | |
| 3 | | |

---

### 2.3 Os Vs no recorte da equipe

Para cada V: intensidade **baixa / média / alta** e um exemplo concreto.

| V | Intensidade | Exemplo no projeto |
|---|-------------|---------------------|
| Volume | | |
| Velocidade | | |
| Variedade | | |
| Veracidade / qualidade | | |
| Valor | | |

**Há inconsistência?** (ex.: negócio pede tempo real, mas a fonte só existe em lote mensal)

> ( ) Não &nbsp; ( ) Sim — o que faremos: ________________________________

---

### 2.4 Caixas da arquitetura (rascunho)

Desenhem no espaço abaixo ou anexem print (lousa, papel, Draw.io):

```
Fontes → Ingestão (lote / stream) → Processar → Guardar → Entregar

[espaço para o diagrama]




```

Marquem com **★** o recorte do **MVP** (o que entra neste componente).  
O que ficou **fora** do MVP (de propósito):

> 

---

### 2.5 Ferramentas da Etapa II (só as necessárias)

| Ferramenta / componente | Entra no MVP? (S/N) | Para quê (uma linha) |
|-------------------------|---------------------|----------------------|
| Spark / PySpark | | |
| Ingestão (ETL/ELT, lote ou stream) | | |
| Elasticsearch / busca | | |
| SGBD / SQL | | |
| Git / README / playbook | | |
| Outra: _______________ | | |

**Justifiquem 1 ferramenta que vocês *não* vão usar:**

> 

---

## Atividade 3 — Esboço das etapas da equipe

**Tempo sugerido:** 30 minutos  
**Objetivo:** Documentar a cadeia completa do recorte (startup ou CoE).

**Formato:** 1 documento por equipe.  
**Caráter:** formativo — insumo para a Aula 07-08.

---

### Capa

| Campo | Preenchimento |
|-------|---------------|
| **Nome provisório da proposta** | |
| **Modelo** | ( ) Startup &nbsp; ( ) CoE |
| **Equipe** | Nome 1 · Nome 2 · Nome 3 · Nome 4 |
| **Data** | |
| **O mapa da 03-04 mudou?** | ( ) Não &nbsp; ( ) Sim — o que mudou: ________ |

---

### 3.1 Cadeia em uma frase por etapa

| Etapa | Frase da equipe |
|-------|-----------------|
| 1. Problema | |
| 2. Valor | |
| 3. Fontes | |
| 4. Arquitetura | |
| 5. MVP | |
| 6. Operação | |

---

### 3.2 Requisitos (síntese)

**Negócio (3 bullets):**

1.  
2.  
3.  

**Dados (3 bullets):**

1.  
2.  
3.  

**LGPD / ética:** o protótipo usa dado pessoal identificável? ( ) Não &nbsp; ( ) Sim — mitigação:

> 

---

### 3.3 Papéis

| Integrante | Papel principal | Responsabilidade neste esboço |
|------------|-----------------|-------------------------------|
| | Coordenação | |
| | Negócio / valor | |
| | Dados | |
| | Arquitetura / MVP | |
| | Operação / qualidade | |

*(Ajustem se o grupo tiver 3 pessoas: acumulem papéis e registrem.)*

---

### 3.4 Cronograma interno até a Aula 07-08

| Quando | O que precisa estar pronto | Responsável |
|--------|----------------------------|-------------|
| Até o fim desta aula | Este esboço | |
| Até a Aula 07-08 | Ler casos + 1 parágrafo de “nosso risco principal” | |
| Observação | | |

---

### 3.5 Riscos (mínimo 3) e mitigação

| Etapa afetada | Risco | Mitigação cedo |
|---------------|-------|----------------|
| | | |
| | | |
| | | |

---

### 3.6 Critérios de sucesso (mínimo 3)

Como saberemos que o **piloto deste componente** deu certo? (mensuráveis)

1.  
2.  
3.  

---

### 3.7 Ciência da equipe

Este esboço é rascunho de trabalho e pode ser ajustado após os estudos de caso (Aula 07-08).

| Nome | Ciência |
|------|---------|
| | |
| | |
| | |
| | |

---

## Atividade 4 — Revisão entre pares (equipe ↔ equipe)

**Tempo sugerido:** 8 minutos  
**Objetivo:** Encontrar etapa pulada ou requisito inconsistente.

**Equipe avaliadora:** _________________________  
**Equipe avaliada:** _________________________

| Pergunta | Sim | Parcial | Não | Comentário |
|----------|-----|---------|-----|------------|
| As 6 etapas têm frase concreta (não só nome de ferramenta)? | | | | |
| Valor está ligado a startup **ou** CoE? | | | | |
| Fontes têm pista de dado (não “vamos achar depois”)? | | | | |
| O MVP é menor que a arquitetura completa? | | | | |
| Há responsável de operação (quem reroda)? | | | | |
| Negócio e dados não se contradizem (ex.: real-time × lote mensal)? | | | | |

**1 pulo ou inconsistência encontrada:**

> 

**1 ponto forte do esboço:**

> 

---

## Atividade 5 — Associação: situação × etapa/conceito (individual)

**Tempo sugerido:** 10 minutos (se houver tempo)  
**Objetivo:** Fixar etapas, requisitos e escolha de ferramenta.

Marque **uma** letra (A–G).

**Opções:**

- **A)** Etapa problema  
- **B)** Etapa valor  
- **C)** Etapa fontes / qualidade  
- **D)** Etapa arquitetura  
- **E)** Etapa MVP  
- **F)** Etapa operação  
- **G)** Inconsistência de requisito (negócio × dados)

| # | Situação | Letra |
|---|----------|-------|
| 1 | A equipe descreve o fluxo lote → Spark → tabela, mas ainda não rodou nada. | |
| 2 | “Precisamos de alerta em segundos”, porém a prefeitura só publica CSV mensal. | |
| 3 | Definiram que o sucesso do CoE é 2 unidades seguirem o mesmo README. | |
| 4 | Listaram nulos, duplicatas e atraso de 3 dias na planilha da cooperativa. | |
| 5 | Processaram só 7 dias de log para testar se o gestor acha a reclamação por bairro. | |
| 6 | Combinaram quem sobe o job na sexta e o que fazer se o tempo passar de 15 min. | |
| 7 | Ainda discutem se o usuário é o feirante (paga boletim) ou o núcleo interno da associação. | |
| 8 | Escolheram Elasticsearch sem nenhuma pergunta do tipo “achar texto/ocorrência”. | |

---

## Para o professor — Gabarito e orientações

### Atividade 1.1 — ordem da cadeia

1. Problema  
2. Valor  
3. Fontes de dados  
4. Arquitetura  
5. MVP  
6. Operação  

*(Aceitar discussão se alguém inverter MVP e arquitetura: neste componente a arquitetura é **esboço de caixas** antes do recorte do MVP; o código mínimo vem na etapa MVP. O importante é não começar por operação ou por ferramenta.)*

### Atividade 1.2 — gabarito sugerido

| # | Resposta | Nota |
|---|----------|------|
| 1 | **F** | Inventário de fontes |
| 2 | **V** | Resultado para a decisão/tempo |
| 3 | **A** | Fluxo em caixas (ainda pode ser só desenho) |
| 4 | **M** | Recorte que gera evidência |
| 5 | **P** | Dor e contexto |
| 6 | **O** | Rotina, limiares, responsável |

### Atividade 2

- Cobrar **pelo menos um V em alta** justificado — ou a honestidade de que o recorte é híbrido/pequeno.
- Ferramenta “não usar” é tão importante quanto a escolhida (evita colecionar o ecossistema inteiro).
- Diagramação: 15 min na lousa/Draw.io; um grupo apresenta.

### Atividade 3

- Não exigir canvas nem código.
- Recusar esboços em que todas as frases são nomes de ferramentas.
- Startup: valor precisa citar usuário externo; CoE: adoção/padrão interno.
- Encaminhar inconsistência real-time × lote para ajuste **antes** da 07-08.

### Atividade 5 — gabarito sugerido

| # | Resposta | Justificativa breve |
|---|----------|---------------------|
| 1 | **D** | Fluxo desenhado, ainda sem evidência rodando |
| 2 | **G** | Velocidade de negócio incompatível com a fonte |
| 3 | **B** (aceitar CoE como valor) | Critério de valor = adoção do padrão |
| 4 | **C** | Qualidade/veracidade das fontes |
| 5 | **E** | Recorte mínimo para aprender |
| 6 | **F** | Rotina e limiar operacional |
| 7 | **A** (ou diálogo com valor) | Usuário/problema ainda indefinido — centrar em problema |
| 8 | **D** (ou G) | Ferramenta na arquitetura sem requisito de busca; preferir **D** se o foco for escolha técnica; **G** se a turma enfatizar requisito de negócio ausente |

*Item 7: se a equipe já tem problema claro e só hesita no modelo, aceitar discussão com **B**.*  
*Item 8: preferir **D** + comentário de anti-padrão; aceitar **G** com boa argumentação.*

### Critérios rápidos de participação (qualitativo)

| Critério | Indicador |
|----------|-----------|
| Engajamento | Atividade 1 completa; falou as 6 frases do recorte |
| Clareza | Atividade 3 com cadeia preenchida (não só ferramentas) |
| Colaboração | Diagrama de caixas + revisão (pulo nomeado) |
| Fixação | ≥ 6 acertos na Atividade 5 (se aplicada) |

### Encaminhamento para a Aula 07-08

Pedir o esboço impresso ou na plataforma. Na 07-08, os casos (escopo, custo, dados, cultura, adoção) devem ser aplicados **ao próprio encadeamento** da equipe.

---

## Referências

- Plano de Ensino — Projeto Profissional de Big Data (Escola do Futuro)
- CRICKARD, P. **Data Engineering with Python.** Birmingham: Packt Publishing, 2020.
- MANLEY, D. **Data Engineering for Beginners and Novices.** Amazon Digital Services LLC, 2021.
- RIES, E. **A startup enxuta.** São Paulo: Leya Casa da Palavra, 2012.
- DAVENPORT, T. H. **Big Data at Work.** Harvard Business Review, 2014.

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
