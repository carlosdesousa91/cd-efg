---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Projeto Profissional de Big Data · Aula 05-06'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Projeto Profissional de Big Data

## Aula 05-06
### Etapas de um projeto de Big Data — da concepção à execução

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada do mapa de oportunidade e objetivos |
| 0:20 – 1:00 | Cadeia das etapas: problema → operação |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | Requisitos de negócio e de dados (Vs e qualidade) |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:20 | Ferramentas da Etapa II, papéis, riscos e sucesso |
| 3:20 – 4:00 | Esboço das etapas da equipe + encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Reconhecer** as etapas de um projeto de Big Data, da concepção à execução
2. **Articular** problema, valor, dados, arquitetura, MVP e operação
3. **Levantar** requisitos de negócio e de dados (volume, velocidade, variedade e qualidade)
4. **Relacionar** cada etapa às ferramentas da Etapa II
5. **Esboçar** cronograma, papéis, riscos e critérios de sucesso da equipe

---

## Retomada — Aula 03-04

Na aula anterior, vocês:

- Distinguiram **startup** e **CoE**
- Mapearam uma **oportunidade local/regional**
- Escreveram hipótese, MVP possível e risco principal

**Pergunta de abertura (3 min):**

> Se alguém perguntar “o que vocês vão fazer na semana 1, 2 e 3?”, vocês conseguem responder **em etapas** — ou só têm uma ideia?

---

## Entrega de hoje — formativa

**Atividade principal:** esboço das etapas do projeto da equipe (diagrama + tabela)

Ainda **não vale os 10%**. A Aula **07-08** (estudos de caso e mercado) é a primeira entrega pontuada.

Hoje o mapa de oportunidade vira um **encadeamento profissional**: o que vem antes de quê, com que dado e com que ferramenta.

*Modelo no caderno — Atividade 3.*

---

## Por que falar de etapas?

Projetos de Big Data falham com frequência quando a equipe:

- Começa pela **ferramenta** (“vamos usar Spark”) sem problema
- Pula **valor** e descobre tarde que ninguém usaria o resultado
- Desenha arquitetura **completa** antes de um MVP
- Esquece a **operação** (quem roda o job na segunda-feira?)

> Etapa não é burocracia: é **ordem de aprendizado e de risco**.

---

## A cadeia deste componente

```
1. PROBLEMA     → quem sofre e qual decisão fica ruim
2. VALOR        → o que muda se der certo (startup ou CoE)
3. FONTES       → de onde vêm os dados, licença e qualidade
4. ARQUITETURA  → ingestão → processar → guardar → entregar
5. MVP          → menor evidência técnica de valor
6. OPERAÇÃO     → papéis, rotina, custo, monitoramento
```

Cada seta exige uma **saída documentada** — não só conversa de corredor.

---

## Etapa 1 — Problema

**Pergunta da etapa:** *Para quem isso dói, e que decisão fica no escuro?*

**Saída esperada:**
- Problema em **uma frase**
- Usuário (cliente externo **ou** área interna, se CoE)
- Recorte local/regional

**Mal definido:** “fazer Big Data para a cidade.”  
**Bem definido:** “a cooperativa não consolida volume e qualidade de leite das unidades a tempo da reunião semanal.”

---

## Etapa 2 — Valor

**Pergunta da etapa:** *Se funcionar, o que a pessoa consegue fazer que hoje não consegue?*

| Modelo | Valor típico |
|--------|----------------|
| **Startup** | Serviço/produto que alguém usaria (ou pagaria) |
| **CoE** | Padrão, retrabalho a menos, adoção interna |

Valor **não** é “ter pipeline”. Valor é **tempo, custo, clareza ou padrão** para uma decisão.

Liguem ao ciclo da aula passada: a hipótese de valor é o que o MVP vai **medir**.

---

## Etapa 3 — Fontes de dados

**Pergunta da etapa:** *Que dados existem, com que licença, em que formato e com que qualidade?*

Listar para cada fonte:
- Origem (portal, planilha autorizada, API, log)
- Tipo (tabela, JSON/log, texto…)
- Recorte (lugar, período)
- Volume aproximado e ritmo (lote diário? contínuo?)
- Limitação (o que os dados **não** permitem concluir)

Sem fonte viável, o projeto **não avança** para arquitetura.

---

## Etapa 4 — Arquitetura (visão de caixas)

Ainda **não** é o diagrama final da Aula 13-14. Hoje: o fluxo.

```
Fontes  →  Ingestão  →  Processamento  →  Armazenamento  →  Entrega
              (lote            (Spark)         (SGBD /           (consulta,
               ou stream)                       índice /          alerta,
                                                arquivo)          playbook)
```

**Regra:** cada caixa precisa de uma **justificativa** (por que essa, e não outra).

---

## Etapa 5 — MVP

**Pergunta da etapa:** *Qual a menor evidência que testa o valor?*

O MVP deste componente cabe na **grade da Etapa II**:

- Job batch em amostra (Spark/PySpark)
- Pipeline de ingestão documentado
- Índice/busca (Elasticsearch) em recorte pequeno
- Repositório Git com README e um playbook (se CoE)

MVP **não** é a operação em produção 24/7.

---

## Etapa 6 — Operação

**Pergunta da etapa:** *Quem roda, quando, com que custo e o que acontece se quebrar?*

Mesmo em protótipo de disciplina, registrem:

- Frequência (único experimento / diário / sob demanda)
- Papel responsável pelo job
- Sinal de “deu certo” (tempo, volume processado, consulta que responde)
- Custo aproximado (máquina local, Colab, trial)
- Próximo passo se o piloto for adotado (startup ou CoE)

---

## Atividade rápida (10 min)

**Exercício 1 — Ordem e artefato**

No caderno: associem cada **artefato** à etapa (problema, valor, fontes, arquitetura, MVP, operação).

Depois, em 2 minutos, a equipe diz em voz alta as **6 etapas** do próprio recorte — uma frase cada.

---

## Requisitos de negócio × requisitos de dados

Dois cadernos que não podem se misturar.

| Requisitos de **negócio** | Requisitos de **dados** |
|---------------------------|-------------------------|
| Quem decide o quê | Fontes e licença |
| Frequência da informação (semanal, na hora…) | Volume, velocidade, variedade |
| Formato da entrega (alerta, busca, relatório, playbook) | Qualidade (completude, consistência) |
| Restrição ética / LGPD | Recorte que cabe no laboratório |
| Sucesso para startup **ou** CoE | Ferramenta mínima da Etapa II |

*Se o negócio pede “tempo real” e os dados só existem em lote mensal, o requisito está **inconsistente**.*

---

## Requisitos de dados — os Vs no *seu* projeto

| V | Pergunta para a equipe |
|---|------------------------|
| **Volume** | Cabe em planilha? Em um PC? Precisa de Spark? |
| **Velocidade** | Chega em lote (dia/semana) ou contínuo? |
| **Variedade** | Só tabela, ou JSON, log e texto juntos? |
| **Veracidade / qualidade** | Nulos, duplicatas, atraso, ruído? |
| **Valor** | Qual decisão esse V precisa servir? |

Não precisamos ser “Big Data puro” em todos os Vs — precisamos **nomear** o que é intenso.

---

## Exemplo guiado — cooperativa (retomada)

**Problema:** unidades enviam qualidade e volume em formatos diferentes; a reunião semanal usa planilha atrasada.  
**Valor (CoE):** um job padrão + playbook para as unidades.  
**Fontes:** CSVs semanais + (opcional) texto de ocorrências.  
**Arquitetura:** ingestão em lote → Spark na amostra → tabela consolidada; busca só se o texto for hipótese.  
**MVP:** um job + README + 3 regras de qualidade.  
**Operação:** rode toda sexta; um steward valida nulos antes da reunião.

**Discussão:** onde entram volume e variedade? Onde **não** entra streaming?

---

## Integração com a Etapa II

| Componente / ferramenta | Costuma entrar em qual etapa? |
|-------------------------|-------------------------------|
| **Ingestão de Dados** (ETL/ELT, lote × stream) | Fontes + arquitetura (entrada) |
| **Spark / PySpark** | Processamento em escala (arquitetura / MVP) |
| **Elasticsearch** | Entrega por **busca** (se o valor for achar texto) |
| **SGBD / SQL** | Armazenar recorte estruturado |
| **Git / sistemas** | MVP e operação (versão, README, papéis) |
| **Sistemas de Computação** | Operação: custo, máquina, limites |

Não usem **todas** as ferramentas. Usem as que o **valor** exige.

---

## Escolha de ferramenta — critérios rápidos

| Se o requisito for… | Candidata inicial |
|---------------------|-------------------|
| Tabela que cabe e consulta pontual | SGBD / SQL |
| Volume ou transformação pesada em lote | Spark (batch) |
| Texto livre para achar por termo/lugar | Elasticsearch |
| Chegada contínua *e* decisão na hora | Streaming (só se o dado existir assim) |
| Reuso interno e padrão | Git + playbook (CoE) |

**Anti-padrão:** escolher Elasticsearch “porque vimos na disciplina” sem busca no valor.

---

## Diagramação coletiva (15 min)

**Exercício 2 — Caixas na lousa / Draw.io**

Em equipe, desenhem **só caixas e setas** do recorte de vocês:

1. Fontes (nome da origem)
2. Ingestão (lote ou stream — justifiquem)
3. Processar / guardar / entregar
4. Marquem com ★ onde está o **MVP** (o que cortam do desenho “completo”)

*Um grupo mostra o diagrama em 2 minutos. Os outros tentam achar um pulo de etapa.*

---

## Cronograma — do componente ao projeto

| Aula | O que o projeto precisa ter avançado |
|------|--------------------------------------|
| 03-04 | Recorte startup/CoE (mapa) |
| **05-06** | **Etapas encadeadas (hoje)** |
| 07-08 | Casos + mercado (**10%**) |
| 09-12 | Canvas e plano (**15%**) |
| 13-16 | Arquitetura e protótipo (**10%**) |
| 17-20 | Pitch e proposta final (**50%**) |

O esboço de hoje é o **esqueleto** das entregas seguintes.

---

## Papéis da equipe (evitem tarefas órfãs)

| Papel | Foco |
|-------|------|
| **Coordenação** | Escopo, prazos, fala com o professor |
| **Negócio / valor** | Problema, usuário, hipótese, critérios de sucesso |
| **Dados** | Fontes, qualidade, recorte, dicionário mínimo |
| **Arquitetura / MVP** | Fluxo, ferramenta, repositório |
| **Operação / qualidade** | Riscos, LGPD, “como rodamos isso” |

Todos participam de tudo — o papel **não** é desculpa para não documentar.

---

## Riscos por etapa (prevenção)

| Etapa | Risco clássico | Mitigação cedo |
|-------|----------------|----------------|
| Problema | Escopo infinito | Uma frase + recorte local |
| Valor | Pipeline sem usuário | Nomear quem usa o resultado |
| Fontes | PDF, dado pessoal, sem licença | Trocar fonte ou amostrar aberto |
| Arquitetura | “Cluster completo” | Desenhar o MVP primeiro |
| MVP | Perfeição técnica | Critério de aprendizado |
| Operação | Ninguém sabe rerodar | README + responsável |

---

## Critérios de sucesso — três camadas

1. **Aprendizado:** a hipótese foi testada (mesmo que a resposta seja “não é bem assim”).
2. **Evidência técnica:** um terceiro consegue entender o repositório e o fluxo.
3. **Aderência ao modelo:** startup argumenta cliente/valor; CoE argumenta adoção/padrão.

Definam **3 critérios** mensuráveis para o *seu* recorte (caderno, Atividade 3).

Exemplos: “job em amostra < 10 min”; “3 consultas de busca respondem ao gestor”; “playbook com 5 passos que outra dupla consegue seguir”.

---

## Atividade principal (30 min)

**Exercício 3 — Esboço das etapas da equipe**

Preencham o modelo do caderno:

- Uma frase por etapa da cadeia
- Requisitos de negócio e de dados (incluindo Vs)
- Ferramentas da Etapa II (só as necessárias)
- Papéis, 3 riscos e 3 critérios de sucesso

*Revisem 5 minutos com o professor antes do fim da aula.*

---

## Revisão entre pares (8 min)

**Exercício 4 — Ache o pulo**

Outra equipe lê o esboço e marca:

- Alguma etapa está **vazia** ou só tem ferramenta?
- Requisitos de negócio e de dados **brigam** entre si?
- O MVP é menor que a arquitetura “dos sonhos”?

Devolvam **1 pulo encontrado** e **1 elogio**.

---

## O que NÃO precisamos fechar hoje

- Análise de mercado e casos de sucesso/fracasso → **07-08 (10%)**
- Canvas de modelo de negócio → **09-12**
- Diagrama técnico detalhado e código do protótipo → **13-16**

Hoje: **ordem das etapas** + requisitos + esqueleto de execução.

---

## Próxima aula (07-08)

**Estudos de caso de sucesso e fracasso** — primeira entrega pontuada (**10%**).

Tragam:
- Esboço das etapas (Atividade 3)
- Mapa de oportunidade da 03-04
- Disposição para **diagnosticar** projetos alheios e o de vocês (escopo, custo, dados, cultura, adoção)

> *Etapas claras deixam os casos mais fáceis de julgar — e o recorte de vocês mais honesto.*

---

## Síntese da aula

Hoje você:

- Encadeou **problema → valor → fontes → arquitetura → MVP → operação**
- Separou requisitos de **negócio** e de **dados** (Vs e qualidade)
- Ligou etapas às ferramentas da **Etapa II**
- Esboçou **papéis, riscos e critérios de sucesso** do projeto da equipe

**Próxima aula:** casos de sucesso e fracasso + análise de mercado (**10%**).

---

## Referências desta aula

- Plano de Ensino — Projeto Profissional de Big Data (Escola do Futuro)
- CRICKARD, P. *Data Engineering with Python.* Packt, 2020.
- MANLEY, D. *Data Engineering for Beginners and Novices.* 2021.
- RIES, E. *A startup enxuta.* Leya Casa da Palavra, 2012.
- DAVENPORT, T. H. *Big Data at Work.* Harvard Business Review, 2014.

---

<!-- _class: lead -->
# Obrigado!

### Completem as Atividades 1 a 4 do caderno.

Tragam na Aula 07-08 o **esboço das etapas** da equipe.

**Escola do Futuro · Ciência de Dados**
