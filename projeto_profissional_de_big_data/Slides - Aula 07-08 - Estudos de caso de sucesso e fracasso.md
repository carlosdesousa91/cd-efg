---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Projeto Profissional de Big Data · Aula 07-08'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Projeto Profissional de Big Data

## Aula 07-08
### Estudos de caso de sucesso e fracasso

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada das etapas e entrega de hoje (**10%**) |
| 0:20 – 1:00 | Fatores críticos: escopo, custo, dados, cultura, governança, adoção |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:20 | Casos + gamificação “diagnosticar o projeto” |
| 2:20 – 2:35 | **Intervalo** |
| 2:35 – 3:15 | Mercado, concorrência e critérios (viabilidade, inovação, impacto) |
| 3:15 – 4:00 | Lições no recorte da equipe + **entrega 10%** |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Identificar** fatores críticos de sucesso e de fracasso em projetos de Big Data
2. **Diagnosticar** casos (escopo, custo, dados, cultura, governança e adoção)
3. **Realizar** uma análise introdutória de mercado e de concorrência
4. **Avaliar** viabilidade, inovação e impacto socioeconômico
5. **Aplicar** as lições ao recorte local/regional da equipe

---

## Retomada — Aula 05-06

Na aula anterior, vocês encadearam:

```
Problema → Valor → Fontes → Arquitetura → MVP → Operação
```

**Pergunta de abertura (3 min):**

> Qual etapa do *seu* esboço é a mais frágil — e que tipo de fracasso ela anunciaria se vocês ignorassem isso?

Tragam o **esboço das etapas** e o **mapa de oportunidade**. Sem eles, a entrega de hoje fica genérica.

---

## Entrega de hoje — 10% da nota

**Documento:** Análise de mercado e estudos de caso (1 por equipe)

Conteúdo mínimo:
- Diagnóstico de **2 casos** do caderno (sucesso + fracasso)
- Análise introdutória de **mercado/concorrência** do recorte de vocês
- Aplicação dos **6 fatores** ao próprio projeto
- Notas de **viabilidade, inovação e impacto** local/regional
- **3 lições** que mudam o esboço da equipe

*Modelo e rubrica no caderno — Atividade 3.*

---

## Por que estudar fracasso (e não só vitrine)?

Big Data tem marketing forte: “plataforma”, “tempo real”, “IA”.

Na prática, projetos quebram por motivos **repetidos** — e quase nunca só por “falta de Spark”.

> Diagnosticar o alheio é treino para **não repetir o mesmo filme** no piloto da disciplina.

Os casos desta aula são **ficção didática** (inspirados em padrões reais), no contexto local/regional.

---

## Os 6 fatores críticos (lente da aula)

| Fator | Pergunta-chave |
|-------|----------------|
| **Escopo** | Cabe em um MVP ou é “a cidade inteira”? |
| **Custo** | Infra e esforço são proporcionais ao valor? |
| **Dados** | Existem, com licença, qualidade e recorte? |
| **Cultura** | Alguém quer mudar o jeito de trabalhar? |
| **Governança** | Quem decide padrão, acesso e LGPD? |
| **Adoção** | O resultado entra na rotina — ou volta à planilha? |

Sucesso = vários fatores **alinhados**. Fracasso = um fator **crítico** ignorado.

---

## Escopo

**Sinal de perigo:** “vamos integrar todos os dados do estado / da empresa.”

**Sinal de saúde:** recorte (2 unidades, 1 indicador, 1 fonte, 1 usuário).

| Saúde | Doença |
|-------|--------|
| Uma decisão apoiada | Catálogo infinito de desejos |
| Hipótese testável | Roadmap de 3 anos no slide 1 |

Lean Startup (aula 03-04) é **antídoto de escopo**.

---

## Custo

Custo não é só fatura de nuvem:

- Tempo da equipe (o mais caro neste componente)
- Máquina, cluster, trial que vira surpresa
- Retrabalho quando a fonte muda

**Pergunta:** o valor prometido **paga** esse custo — mesmo que o pagamento seja adoção interna (CoE)?

Anti-padrão: cluster “de produção” na semana 1 para um CSV semanal de 20 MB.

---

## Dados

Fracassos clássicos:

- Dado **não existe** (só existe no discurso)
- Existe em **PDF**, sem licença ou com dado pessoal
- Volume/velocidade **incompatíveis** com o requisito de negócio (aula 05-06)
- Qualidade tão baixa que o insight é teatro

Sem fonte viável, não há projeto de Big Data — há **PowerPoint**.

---

## Cultura

Ferramenta nova **não** muda reunião velha.

- “Sempre fizemos no Excel”
- Medo de transparência (números que expõem atraso)
- TI versus área de negócio sem tradução
- Troca de gestão no meio do piloto (órgão público)

Startup também tem cultura: o cliente precisa **abrir a rotina**, não só “achar legal”.

---

## Governança

Governança, neste nível técnico:

- Quem **autoriza** fonte e publicação
- Quem acessa o que (LGPD)
- Quem é o **steward** da qualidade
- Quem mata o projeto (ou o escopo) quando o custo explode

CoE sem governança vira **núcleo fantasma**: cluster ligado, ninguém manda no padrão.

---

## Adoção

Adoção é o teste final:

| Não é adoção | É adoção |
|--------------|----------|
| Demo na sexta para o professor | O usuário usa na **próxima** sexta sozinho |
| Dashboard lindo sem dono | Job + alerta na rotina combinada |
| Playbook na gaveta | 2ª unidade consegue repetir o README |

Sem adoção, “sucesso técnico” ainda pode ser **fracasso de projeto**.

---

## Atividade rápida (8 min)

**Exercício 1 — Qual fator está quebrado?**

No caderno, 6 frases curtas. Marquem o fator **mais central** (A–F).

Depois, em dupla: uma frase do *seu* projeto que seria um **sinal de perigo** em algum fator.

---

## Gamificação — Diagnosticar o projeto

Regras (por rodada):

1. O professor lê o caso (2 min)
2. A equipe escolhe o **fator nº 1** do desfecho (escopo, custo, dados, cultura, governança ou adoção)
3. Placa / voto / post-it (1 min)
4. Debate de 3 min: “o 2º fator”
5. Revelação: não há uma única letra sagrada — vale a **argumentação**

*Casos completos no caderno (Atividade 2). Aqui vai o trailer.*

---

## Caso 1 — Cooperativa LeiteCerrado (desfecho positivo)

Unidades enviavam qualidade e volume em formatos diferentes. Um núcleo interno começou por **2 unidades**, job **semanal** em amostra, README e um steward. A diretoria patrocinou 30 minutos na reunião de sexta.

**Trailer para vocês diagnosticarem:** o que mais **seguriu** o sucesso — escopo, governança ou adoção?

---

## Caso 2 — CidadeInteligente GO (desfecho negativo)

Proposta: sensores, ônibus, saúde e educação em **tempo real** para “a cidade inteligente”. Cluster em nuvem no mês 1. A prefeitura não tinha API; parte dos dados era pessoal; o mandato mudou. A fatura chegou; o Excel das secretarias permaneceu.

**Trailer:** o fracasso começa em **escopo**, **dados** ou **custo**? (Provavelmente nos três — vocês escolhem o nº 1.)

---

## Caso 3 — OuvidoriaBairro (desfecho positivo)

Associação de bairros precisava **achar** reclamações por linha e região. MVP: recorte de textos abertos + índice de busca + 3 consultas com um gestor. Só depois falaram em produto pago.

**Trailer:** aqui o valor era **busca**, não “plataforma de dados”. Qual fator quase teria matado se tivessem ido para streaming no dia 1?

---

## Caso 4 — CoE fantasma da Rede SuperGO (desfecho negativo)

Consultoria instalou Spark “para todas as lojas”. Nenhum gerente de loja mudou a rotina. Não havia steward nem regra de acesso. O cluster ficou ligado. As planilhas de sexta continuaram.

**Trailer:** cultura, governança ou adoção — quem puxa o fio?

---

## Atividade em grupo (25 min)

**Exercício 2 — Clínica de casos**

Cada equipe diagnostica os **4 casos** no caderno:

- Desfecho (sucesso / fracasso / misto)
- Fator nº 1 e nº 2
- 1 decisão que teria **invertido** o filme

*Dois grupos apresentam 1 caso cada (2 min). Os outros podem “impugnar” o fator nº 1.*

---

## Mercado e concorrência (visão introdutória)

Não é plano de negócios completo (isso é **09-12**). Hoje: **mapa de alternativas**.

Para o recorte de vocês:

| Pergunta | Exemplo |
|----------|---------|
| Quem já resolve isso (mal ou bem)? | Excel, WhatsApp, sistema legado, ninguém |
| O que o usuário faria **sem** vocês? | Continuar atrasado / não decidir |
| Há concorrente óbvio? | Software nacional, consultoria, outro núcleo interno |
| Barreira local? | Dado fechado, desconfiança, falta de rede |

Concorrência inclui **o jeito atual** — quase sempre o adversário nº 1.

---

## Substitutos e “não-consumo”

Três ideias úteis (nível técnico):

1. **Substituto:** planilha, caderno, ligação para o encarregado
2. **Não-consumo:** a decisão simplesmente **não é tomada** com dado
3. **Concorrente formal:** empresa ou sistema que já cobra por algo parecido

No interior e em órgãos pequenos, o não-consumo é comum: não falta só software — falta **rotina + dado + alguém que use**.

---

## Viabilidade, inovação, impacto

Três critérios do plano de curso — usem como nota honesta (alta / média / baixa + 1 frase).

| Critério | Pergunta |
|----------|----------|
| **Viabilidade** | Dado + MVP + skill da equipe + custo cabem neste componente? |
| **Inovação** | É melhor que o jeito atual *neste contexto* — não precisa ser inédito no mundo |
| **Impacto socioeconômico** | Quem ganha no município/região? Há risco de exclusão ou de dado pessoal? |

Inovação local ≠ copiar Netflix. Impacto ≠ slogan de “transformar Goiás”.

---

## Aplicar ao projeto da equipe

Não analisem só os casos alheios.

Preencham no documento de 10%:

1. Os **6 fatores** no *seu* recorte (verde / amarelo / vermelho)
2. Mercado: substituto + 1 concorrente ou “ninguém”
3. Nota de viabilidade, inovação e impacto
4. **3 lições** — cada uma deve mudar uma linha do esboço da 05-06

Exemplo de lição útil: “Tiramos streaming do MVP porque o Caso 2 morreu de escopo+dados.”

---

## Armadilhas na entrega de 10%

| Armadilha | Como evitar |
|-----------|-------------|
| Resumo do caso sem fator | Nomear escopo/custo/dados/cultura/governança/adoção |
| Mercado = “não tem concorrente” | Sempre existe Excel ou o não-consumo |
| Lição genérica (“vamos nos comunicar melhor”) | Ligar a uma etapa da cadeia |
| Copiar o caso e esquecer o recorte local | Última seção = **nossa** proposta |
| Inventar dado que não existe | Vermelho em **Dados** e plano B de fonte |

---

## Atividade principal (35 min)

**Exercício 3 — Entrega oficial (10%)**

Em equipe, preencham o **modelo do caderno**.

- 1 documento por equipe (PDF / plataforma)
- Nomes de todos
- Revisem a rubrica antes de enviar
- Mentoria rápida com o professor se o fator “Dados” estiver vermelho

---

## Revisão-relâmpago (5 min)

Antes de entregar, outra equipe olha só 3 coisas:

1. Os 6 fatores do **projeto de vocês** estão preenchidos?
2. Há **3 lições** concretas?
3. Mercado cita substituto (Excel / rotina atual)?

*Checklist no caderno — Atividade 4 (participação).*

---

## O que NÃO precisamos fechar hoje

- Canvas (proposta de valor, canais, receita) → **09-12 (15%)**
- Arquitetura detalhada e código → **13-16**
- Pitch → **17-20**

Hoje: **diagnóstico + mercado introdutório + lições**.

---

## Próxima aula (09-10)

**Modelo de negócios orientado a dados** — canvas da startup ou CoE.

Tragam:
- Esta entrega (mesmo rascunho enviado)
- Decisão **startup ou CoE** mais firme (os casos devem ter ajudado)
- 1 frase de proposta de valor que sobreviva aos 6 fatores

> *Caso diagnosticado sem modelo de negócio ainda é recorte. Na 09-10 vocês desenham como isso se sustenta.*

---

## Síntese da aula

Hoje você:

- Usou a lente dos **6 fatores** (escopo, custo, dados, cultura, governança, adoção)
- Diagnosticou casos de **sucesso e fracasso**
- Fez análise introdutória de **mercado e concorrência**
- Avaliou **viabilidade, inovação e impacto** e tirou **lições** para o projeto

**Próxima aula:** canvas de modelo de negócio (startup ou CoE).

---

## Referências desta aula

- Plano de Ensino — Projeto Profissional de Big Data (Escola do Futuro)
- DAVENPORT, T. H. *Big Data at Work.* Harvard Business Review, 2014.
- RIES, E. *A startup enxuta.* São Paulo: Leya Casa da Palavra, 2012.
- COELHO, A. M. M. *Empreendedorismo inovador.* São Paulo: Évora, 2015.
- EUROPEAN DATA PROTECTION SUPERVISOR. *Meeting the challenges of big data.* 2015.
- CRICKARD, P. *Data Engineering with Python.* Packt, 2020.

---

<!-- _class: lead -->
# Obrigado!

### Entreguem a Atividade 3 (10%) na plataforma indicada.

Completem também as Atividades 1, 2 e 4 do caderno.

**Escola do Futuro · Ciência de Dados**
