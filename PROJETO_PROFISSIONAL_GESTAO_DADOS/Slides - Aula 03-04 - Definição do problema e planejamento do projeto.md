---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Projeto Profissional de Gestão de Dados · Aula 03-04'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Projeto Profissional de Gestão de Dados

## Aula 03-04
### Definição do problema e planejamento do projeto

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 01-02 e objetivos de hoje |
| 0:20 – 1:00 | Projetos de gestão de dados e definição do problema |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:00 | Perguntas analíticas, stakeholders e requisitos do dashboard |
| 2:00 – 2:15 | **Intervalo** |
| 2:15 – 3:15 | Seleção de base de dados aberta (exploração guiada) |
| 3:15 – 4:00 | Plano do projeto em equipe + **entrega parcial (10%)** |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Caracterizar** um projeto de gestão de dados e seus entregáveis
2. **Formular** o problema de negócio e **perguntas analíticas** claras
3. **Levantar** requisitos do dashboard e identificar **stakeholders**
4. **Selecionar** uma base de dados aberta de contexto **local/regional**
5. **Elaborar** o plano de trabalho da equipe (cronograma e papéis)

---

## Retomada — onde paramos?

Na **Aula 01-02** você conheceu:

- O mercado de trabalho e o produto final do componente
- As **6 etapas** do projeto integrador
- A ideia de trabalhar com **dados abertos** socioeconômicos

**Hoje** saímos da visão geral e **definimos o projeto concreto** da sua equipe.

> *Traga as ideias de tema que combinamos na aula anterior.*

---

## Entrega de hoje — 10% da nota

**Documento:** Plano do Projeto (1 por equipe)

Conteúdo mínimo:
- Título e contexto do problema
- Stakeholders e usuário do dashboard
- Perguntas analíticas (3 a 5)
- Base de dados escolhida (fonte, link, variáveis)
- Requisitos do dashboard (KPIs e visões previstas)
- Cronograma e papéis da equipe

*Modelo completo no caderno de exercícios — Atividade 3.*

---

## O que é um projeto de gestão de dados?

Projeto orientado a **decisão**, não só a código ou gráficos bonitos.

**Ciclo simplificado:**

```
Problema → Dados → Tratamento → Análise → Visualização → Decisão
```

**Características de um bom projeto (nível técnico):**
- Problema **delimitado** (não “analisar tudo sobre Goiás”)
- Dados **acessíveis** e **licenciados** para uso
- Entregáveis **mensuráveis** (dashboard com KPIs definidos)
- Documentação das **decisões** tomadas

---

## Produto final deste componente

| Entregável | Descrição |
|------------|-----------|
| **Banco analítico** | Dados limpos e estruturados em SGBD |
| **Dashboard** | Painel de monitoramento interativo |
| **Documentação** | Limpeza, EDA e decisões registradas |
| **Apresentação** | Resultados e recomendações (Aulas 17-20) |

Hoje você define **o quê**, **para quem** e **com quais dados** — antes de limpar e codificar.

---

## Definição do problema

### Problema mal definido ❌

> "Fazer um dashboard sobre economia."

### Problema bem definido ✅

> "Pequenos empreendedores de Valparaíso precisam comparar indicadores de renda e emprego do município com a região metropolitana para decidir onde ampliar pontos de venda."

**Elementos:** quem sofre · contexto · decisão que os dados apoiam

---

## Framework — Problema → Perguntas → KPIs

```
PROBLEMA DE NEGÓCIO
        ↓
PERGUNTAS ANALÍTICAS  (respondíveis com dados)
        ↓
INDICADORES / KPIs    (números ou categorias no dashboard)
        ↓
VISUALIZAÇÕES         (gráficos, mapas, tabelas, filtros)
```

*Cada KPI deve responder a pelo menos uma pergunta analítica.*

---

## Perguntas analíticas

Perguntas **específicas**, que dados podem responder.

**Ruins (vagas):**
- "Como está a economia?"
- "Os dados estão bons?"

**Boas (SMART para dados):**
- "Qual município da região teve maior variação de taxa de desemprego entre 2019 e 2023?"
- "Qual faixa etárica concentra o maior percentual de população economicamente ativa?"
- "Existe correlação entre escolaridade média e renda per capita nos municípios selecionados?"

**Meta:** 3 a 5 perguntas por equipe.

---

## Atividade rápida (10 min)

**Exercício 1 — Do problema à pergunta**

Transforme o problema vago em **2 perguntas analíticas**:

> *"Gestores públicos querem entender a saúde financeira dos municípios goianos."*

Anote individualmente → compartilhe com a equipe na sequência.

---

## Stakeholders e usuário do dashboard

**Stakeholder** = pessoa ou grupo **impactado** ou **interessado** no projeto.

| Papel | Exemplo | O que espera do dashboard |
|-------|---------|---------------------------|
| **Usuário principal** | Gestor de pequeno negócio | Comparar vendas potenciais por região |
| **Patrocinador** | Professor / coordenação | Ver aprendizados e entregas |
| **Equipe técnica** | Vocês | Dados tratados e documentados |
| **Público final** | Cidadãos, clientes | Informação clara, sem jargão |

Definam **1 usuário principal** — o dashboard é desenhado para ele(a).

---

## Requisitos do dashboard

Documento que descreve **o que o painel deve fazer** (não como programar ainda).

**Exemplos de requisitos funcionais:**
- Filtrar por **município** e **ano**
- Exibir **3 a 6 KPIs** no topo (cards)
- Gráfico de **evolução temporal** de pelo menos 1 indicador
- Gráfico de **comparação** entre municípios ou categorias
- **Fonte dos dados** visível no rodapé

**Requisitos não funcionais:** legível em tela 1366×768 · atualização manual (dados estáticos) · sem dados pessoais

---

## KPIs — Key Performance Indicators

Indicadores **-chave** que resumem a situação.

**Exemplos (contexto socioeconômico):**
- Taxa de desemprego (%)
- Renda per capita (R$)
- IDHM ou índice similar
- População total
- Percentual de economia informal
- Número de estabelecimentos por setor

**Regra:** escolham KPIs que **respondam às perguntas analíticas** — não encham o painel por enfeite.

---

## Esboço de layout (wireframe)

```
┌─────────────────────────────────────────────┐
│  TÍTULO DO DASHBOARD          [Filtros]     │
├──────────┬──────────┬──────────┬────────────┤
│  KPI 1   │  KPI 2   │  KPI 3   │  KPI 4     │
├────────────────────┬────────────────────────┤
│  Gráfico linha     │  Gráfico barras        │
│  (evolução)        │  (comparação)          │
├────────────────────┴────────────────────────┤
│  Tabela ou mapa · Fonte: IBGE / dados.gov   │
└─────────────────────────────────────────────┘
```

*Rascunhem no caderno — refinam nas aulas de visualização.*

---

## Dados abertos — por que local/regional?

Requisito do plano de curso:

> Base de dados **aberta** de contexto **socioeconômico local/regional**.

**Vantagens:**
- Relevância para a comunidade e portfólio
- Conexão com **empregabilidade** e problemas reais
- Fontes públicas: IBGE, dados.gov.br, portais estaduais/municipais

**Atenção:** verificar **licença**, **formato** (CSV, API) e **atualização**.

---

## Portais recomendados

| Portal | Conteúdo típico |
|--------|-----------------|
| **dados.gov.br** | Catálogo nacional de conjuntos abertos |
| **IBGE** | Censo, PNAD, PIB municipal, estimativas populacionais |
| **Goiás — dados abertos** | Indicadores estaduais (ver portal oficial) |
| **Prefeituras / regiões** | Saúde, educação, finanças locais |
| **IPEA / RAIS / CAGED** | Trabalho, mercado formal (conforme disponibilidade) |

Na prática de hoje: **explorar, baixar amostra e validar** se a base atende ao problema.

---

## Checklist — a base serve para o projeto?

Antes de fechar a escolha, verifiquem:

- [ ] **Contexto** local ou regional (Goiás, RM, município...)
- [ ] **Licença** permite uso educacional / aberta
- [ ] **Formato** aberto (CSV, XLSX, JSON, API)
- [ ] **Variáveis** suficientes para responder às perguntas
- [ ] **Volume** gerenciável para técnicos (não precisa ser Big Data)
- [ ] **Documentação** de dicionário de dados ou metadados
- [ ] **Sem dados pessoais** identificáveis (LGPD)

---

## Exemplo — Projeto modelo (referência)

**Título:** Monitoramento de indicadores de desenvolvimento — municípios da RMR de Goiânia

**Problema:** Associação comercial precisa comparar municípios para orientar associados sobre expansão.

**Perguntas:**
1. Qual município teve maior crescimento populacional 2010–2022?
2. Como evoluiu a taxa de desocupação na região?
3. Qual município tem maior renda per capita?

**Base:** IBGE — estimativas populacionais + PNAD contínua (recorte regional)

**KPIs:** População · Desocupação (%) · Renda · IDHM

---

## Atividade guiada (45 min)

**Exercício 2 — Caça ao dataset**

Em equipe, no laboratório:

1. Acessem **dados.gov.br** ou **IBGE**
2. Listem **3 conjuntos** candidatos (nome + link)
3. Apliquem o **checklist** da slide anterior
4. Escolham **1 base principal** e justifiquem em 5 linhas
5. Baixem **amostra** ou arquivo completo (se leve)



---

## Armadilhas comuns na escolha da base

| Armadilha | Consequência | Como evitar |
|-----------|--------------|-------------|
| Base enorme demais | Atraso na limpeza | Filtrar municípios/região na origem |
| PDF sem tabela | Impossível automatizar | Buscar CSV/API equivalente |
| Variáveis sem dicionário | Interpretação errada | Ler metadados antes |
| Tema sem usuário claro | Dashboard genérico | Voltar à definição do problema |
| Muitas perguntas | Escopo estourado | Máximo 5 perguntas focadas |

---

## Plano de trabalho da equipe

### Papéis sugeridos (adaptem ao tamanho do grupo)

| Papel | Responsabilidade |
|-------|------------------|
| **Coordenação** | Cronograma, comunicação com professor |
| **Dados** | Limpeza, documentação, carga no SGBD |
| **Análise** | EDA, KPIs, validação das perguntas |
| **Visualização** | Dashboard, layout, storytelling |
| **Qualidade** | Revisão, checklist, consistência |

*Todos participam de todas as etapas — papéis evitam que tarefas fiquem órfãs.*

---

## Cronograma — visão do componente

| Aula | Foco | Entrega |
|------|------|---------|
| 03-04 | Plano e problema | **Plano do projeto (10%)** ← hoje |
| 05-06 | Limpeza | — |
| 07-08 | Banco analítico | Banco + dados tratados (15%) |
| 09-12 | EDA | Notebook/relatório EDA (10%) |
| 13-16 | Dashboard | Construção |
| 17-20 | Finalização | Projeto + apresentação (50%) |

Preencham datas reais no modelo da **Atividade 3**.

---

## Critérios de sucesso do plano

Seu plano será avaliado considerando:

| Critério | Peso sugerido |
|----------|---------------|
| Clareza do problema e do usuário | 25% |
| Qualidade das perguntas analíticas | 25% |
| Adequação da base de dados escolhida | 20% |
| Requisitos/KPIs alinhados ao problema | 20% |
| Cronograma, papéis e viabilidade | 10% |

*Rubrica detalhada no caderno de exercícios.*

---

## Atividade principal (45 min)

**Exercício 3 — Plano do Projeto (entrega oficial)**

Em equipe, preencham o **Modelo de Plano do Projeto** (caderno de exercícios).

- Revisem com o professor antes de entregar
- Formato: PDF ou documento na plataforma indicada
- **1 entrega por equipe** — todos os nomes no documento

---

## Revisão entre pares (10 min)

**Exercício 4 — Checklist de colega**

Troquem planos entre equipes (5 min cada):

- O problema está claro em **1 frase**?
- Dá para responder às perguntas com a base escolhida?
- KPIs e perguntas estão **conectados**?
- Anotem **1 elogio** e **1 sugestão** para a outra equipe.

---

## Próximas aulas — o que vem depois

**Aula 05-06:** Diagnóstico e **limpeza** dos dados da base escolhida

Tragam:
- Arquivo de dados baixado (ou acesso confirmado)
- Plano aprovado/ajustado
- Caderno para **documentar** cada decisão de tratamento

> *Projeto de dados profissional = resultado + **rastro documentado**.*

---

## Síntese da aula

Hoje você:

- Definiu **problema**, **stakeholders** e **perguntas analíticas**
- Levantou **requisitos** e **KPIs** do dashboard
- Selecionou **base de dados aberta** local/regional
- Entregou o **Plano do Projeto** da equipe (**10%**)

**Próxima aula:** limpeza e tratamento — mãos na massa com os dados.

---

## Referências desta aula

- Plano de Ensino — Projeto Profissional de Gestão de Dados
- KIMBALL, R. *The Data Warehouse Toolkit.* Wiley, 2013.
- KNAFLIC, C. N. *Storytelling com dados.* Alta Books, 2019.
- IBGE. Portal de Dados Abertos: https://servicodados.ibge.gov.br/
- BRASIL. Portal de Dados Abertos: https://dados.gov.br/

---

<!-- _class: lead -->
# Obrigado!

### Entreguem o Plano do Projeto na plataforma indicada.

Dúvidas sobre escopo → falem com o professor **antes** da Aula 05-06.

**Escola do Futuro · Ciência de Dados**
