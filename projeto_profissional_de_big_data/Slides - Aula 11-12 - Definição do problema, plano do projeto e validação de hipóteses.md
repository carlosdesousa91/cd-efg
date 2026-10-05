---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Projeto Profissional de Big Data · Aula 11-12'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Projeto Profissional de Big Data

## Aula 11-12
### Definição do problema, plano do projeto e validação de hipóteses

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada do canvas e o que entra nos **15%** |
| 0:20 – 1:00 | Problema, público e proposta de valor fechados |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:20 | Seleção de bases/fontes (laboratório em portais) |
| 2:20 – 2:35 | **Intervalo** |
| 2:35 – 3:20 | Plano: papéis, marcos do MVP, critérios de entrega |
| 3:20 – 4:00 | Documentação da proposta + **entrega 15%** |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Formular** o problema e a proposta de valor de forma fechada e testável
2. **Selecionar** base(s) ou fonte(s) de dados, de preferência **local/regional**
3. **Elaborar** o plano de trabalho com papéis e **marcos do MVP**
4. **Definir** como as hipóteses serão validadas até o protótipo
5. **Documentar** a proposta inicial da startup ou do CoE (**entrega 15%**)

---

## Retomada — Aula 09-10

Na aula anterior vocês rascunharam:

- **Um** canvas (BMC ou Lean)
- Frase de valor com **substituto**
- Hipóteses e indicadores
- Justificativa **startup × CoE**

**Pergunta de abertura (3 min):**

> Se o professor perguntar “qual arquivo vocês vão processar na 13-14?”, a resposta cabe em **uma linha** — ou ainda é “vamos achar um dataset”?

Tragam o canvas **legível**. Sem fonte e sem calendário, o modelo de negócio não vira plano.

---

## Entrega de hoje — 15% da nota

**Documento:** Modelo de negócios e plano da startup/CoE (1 por equipe)

Conteúdo mínimo:
- Problema, público, valor e modelo (startup ou CoE)
- Canvas (anexo ou transcrito, uma página)
- Fonte(s) de dados escolhida(s) + checklist
- Hipóteses + como validar no MVP
- Papéis, cronograma até o pitch e critérios de entrega

*Modelo e rubrica no caderno — Atividade 3.*

---

## O que “consolidar o plano” significa

Até hoje: mapas, lições, rascunhos.

A partir de hoje: um pacote que **outra pessoa** (professor ou banca) consegue seguir.

| Ainda rascunho | Plano consolidado |
|----------------|-------------------|
| “Problema de dados na região” | Uma frase com quem sofre e a decisão |
| “Vamos usar dados abertos” | URL + recorte + licença |
| “Depois a gente vê o Spark” | Marco: o que existe na Aula 15-16 |
| Indicador vago | Fato observável na reunião/piloto |

---

## Formular o problema (versão final)

**Checklist em uma frase:**

- Quem sofre (cargo + organização ou comunidade)
- Qual decisão ou rotina fica ruim
- Recorte **local/regional**
- Sem “todo o estado / toda a empresa / tempo real mágico”

**Mal:** “Falta Big Data na cooperativa.”  
**Bem:** “A diretoria da cooperativa X não consegue abrir a reunião de sexta com volume e qualidade das unidades piloto, e usa planilhas em formatos diferentes.”

---

## Proposta de valor — amarrar ao problema

Reusem a fórmula da 09-10. Hoje ela precisa **bater** com:

- O usuário do plano (não um segmento fantasma)
- A fonte de dados (o valor não pode exigir dado que vocês não terão)
- O canal (reunião, busca, playbook…)

Se valor e fonte brigarem, **encolham o valor** — não inventem a fonte.

---

## Público: usuário × patrocinador

| Papel | Startup | CoE |
|-------|---------|-----|
| **Usuário** | Quem usa o boletim/busca/alerta | Área ou unidade que segue o padrão |
| **Patrocinador** | Quem pagaria ou abriria a porta | Quem cede pauta, tempo e autorização |

O plano nomeia **os dois**. Se forem a mesma pessoa, escrevam isso.

Sem patrocinador em CoE, o Caso 4 (núcleo fantasma) volta.

---

## Atividade rápida (10 min)

**Exercício 1 — Trava de uma frase**

Cada integrante escreve problema + valor. A equipe escolhe **uma** versão oficial (pode misturar).

Critério: um colega de outra equipe entende **sem** o canvas ao lado.

---

## Fontes de dados — por que fechar hoje

A Aula 13-14 começa arquitetura e repositório. Sem arquivo (ou API) acessível, o MVP vira slide.

Preferência do plano de curso: **contexto socioeconômico local/regional** e, sempre que possível, **dado aberto** ou autorizado.

**Não** precisam de petabytes. Precisam de recorte **honesto** + amostra baixável.

---

## Portais e pistas

| Fonte | Uso típico neste componente |
|-------|------------------------------|
| **dados.gov.br** | Catálogos federais / setoriais |
| **IBGE** | Recortes territoriais, socioeconômicos |
| **Transparência / dados GO ou município** | Gestão local |
| Planilha **autorizada** de cooperativa, loja, associação | Dado real com termo simples |
| Amostra sintética **só** se a fonte real falhar — e documentem o plano B |

Verifiquem **licença**, formato (CSV, JSON, API) e **LGPD**.

---

## Checklist da fonte (antes de se apaixonar)

- [ ] Contexto local/regional (ou recorte geográfico explícito)
- [ ] Licença / autorização para uso educacional
- [ ] Formato utilizável (não só PDF-imagem)
- [ ] Variáveis que sustentam a **proposta de valor**
- [ ] Volume cadastrável num MVP (amostra se for grande)
- [ ] Metadados ou dicionário mínimo
- [ ] Sem dado pessoal identificável (ou anonimizado de verdade)
- [ ] A equipe **baixou ou acessou amostra hoje**

Um “N” grave em licença ou acesso = fonte **não** está escolhida.

---

## Atividade guiada (40 min)

**Exercício 2 — Caça à fonte**

Em equipe, no laboratório:

1. Listem **3 conjuntos candidatos** (nome + link)
2. Apliquem o checklist
3. Escolham **1 fonte principal** (+ 1 reserva, se fizer sentido)
4. Anotem 5–10 campos que o MVP vai usar
5. Baixem a **amostra** (ou comprovem acesso)

*Isso entra na seção 4 da entrega de 15%.*

---

## Armadilhas na escolha da base

| Armadilha | Efeito | Saída |
|-----------|--------|-------|
| Só PDF / print | Não entra no Spark | Buscar CSV/API |
| Base mundial genérica | Perde o recorte local | Filtrar GO/município ou trocar |
| “A empresa vai mandar depois” | 13-14 sem arquivo | Plano B aberto **hoje** |
| CPF, prontuário, chat cru | LGPD | Anonimizar ou desistir da fonte |
| Tudo que o catálogo tem | Escopo Caso 2 | Recorte alinhado ao valor |

---

## Validação de hipóteses — do canvas ao calendário

As 3 hipóteses da 09-10 agora ganham **marco**:

| Hipótese | Evidência até a Aula 15-16 | Se for falsa |
|----------|----------------------------|--------------|
| Problema | Conversa/pauta com usuário ou persona documentada | Encolher segmento |
| Valor | Resultado do MVP usado (ou recusado) na rotina combinada | Pivotar entrega (busca vs lote vs playbook) |
| Canal / adoção | Gestor abriu / unidade 2 seguiu o README | Trocar canal, não “adicionar cluster” |

Validar **não** é ter certeza hoje. É saber **o que olhar** no piloto.

---

## Plano de trabalho — papéis

Mesma lógica da 05-06, agora com **nome** e entrega:

| Papel | Responsável por |
|-------|-----------------|
| Coordenação | Prazo, versão única do documento, fala com o professor |
| Negócio | Problema, valor, hipóteses, critérios de sucesso |
| Dados | Fonte, amostra, dicionário, LGPD |
| Arquitetura / MVP | Fluxo, repo, job/índice (13-16) |
| Operação | Como rerodar, riscos, README |

Grupos de 3: acumulem papéis **por escrito**.

---

## Marcos do MVP (mínimo)

| Marco | “Pronto” significa |
|-------|---------------------|
| **11-12** | Este plano + amostra da fonte (hoje) |
| **13-14** | Diagrama + repositório criado + 1ª evidência |
| **15-16** | MVP que um terceiro entende (job, busca, consulta ou playbook) |
| **17-18** | Ajustes + ensaio de pitch |
| **19-20** | Pitch + proposta final |

Cada marco tem **dono**. Marco sem dono não existe.

---

## Critérios de entrega (o que a banca vai olhar)

Definam 3–5 critérios **deste componente**, não da empresa dos sonhos:

- Job/consulta/índice reproduzível no lab
- README com como rodar
- Indicadores de validação preenchidos (mesmo que a hipótese tenha caído)
- Argumento startup **ou** CoE coerente com o canvas
- Fonte citada e recorte local/regional

Isso evita “sucesso” só com slide bonito.

---

## Atividade principal (35 min)

**Exercício 3 — Plano oficial (15%)**

Preencham o modelo do caderno (documento único).

- Anexem canvas (foto nítida ou página)
- Colem link da fonte e comprovem amostra
- Revisem a **rubrica** antes de enviar
- Mentoria: se a fonte estiver vermelha, **não** entreguem “depois a gente vê”

---

## Revisão entre pares (8 min)

**Exercício 4 — Três travas**

Outra equipe só responde:

1. Qual é o **arquivo** (ou API) do MVP?
2. O que existe de concreto na **Aula 15-16**?
3. A frase de problema cabe em **uma respiração**?

Se alguma trava falhar, ajustem **antes** do envio.

---

## O que NÃO precisamos fechar hoje

- Diagrama ponta a ponta detalhado e Git organizado → **13-14**
- Código do protótipo e métricas de tempo/volume → **15-16**
- Pitch ensaiado → **17-20**

Hoje: **problema + valor + fonte + plano + critérios**.

---

## Próxima aula (13-14)

**Arquitetura da solução Big Data e início do protótipo.**

Tragam:
- Plano aprovado/enviado (15%)
- Amostra da fonte no pendrive/nuvem da equipe
- Decisão de ferramenta **já justificada no plano** (batch, busca, SGBD…)

> *A partir da 13-14 o canvas tem de virar repositório. Sem plano, a arquitetura vira desenho solto.*

---

## Síntese da aula

Hoje você:

- **Fechou** problema, público e proposta de valor
- **Selecionou** fonte local/regional (com checklist e amostra)
- **Amarrou** hipóteses a marcos do MVP
- Entregou o **plano da startup ou CoE** (**15%**)

**Próxima aula:** arquitetura e primeiras evidências técnicas.

---

## Referências desta aula

- Plano de Ensino — Projeto Profissional de Big Data (Escola do Futuro)
- BRASIL. Portal de Dados Abertos: https://dados.gov.br/
- IBGE. Portal de Dados Abertos: https://servicodados.ibge.gov.br/
- RIES, E. *A startup enxuta.* São Paulo: Leya Casa da Palavra, 2012.
- CRICKARD, P. *Data Engineering with Python.* Packt, 2020.
- DAVENPORT, T. H. *Big Data at Work.* Harvard Business Review, 2014.

---

<!-- _class: lead -->
# Obrigado!

### Entreguem a Atividade 3 (15%) na plataforma indicada.

Completem também as Atividades 1, 2 e 4 do caderno.

**Escola do Futuro · Ciência de Dados**
