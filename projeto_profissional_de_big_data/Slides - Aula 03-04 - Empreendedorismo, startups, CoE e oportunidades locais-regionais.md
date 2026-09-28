---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Projeto Profissional de Big Data · Aula 03-04'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Projeto Profissional de Big Data

## Aula 03-04
### Empreendedorismo, startups, CoE e oportunidades locais/regionais

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 01-02 e objetivos de hoje |
| 0:20 – 1:00 | Empreendedorismo em dados: oportunidades e riscos |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | Lean Startup e ciclo construir–medir–aprender |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:20 | CoE em dados, papéis e startup × CoE |
| 3:20 – 4:00 | Mapeamento de oportunidades locais + encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Reconhecer** oportunidades e riscos do empreendedorismo em dados
2. **Descrever** o ciclo construir–medir–aprender da Lean Startup (visão introdutória)
3. **Explicar** o propósito, a governança e os papéis de um Centro de Excelência (CoE) em dados
4. **Distinguir** quando faz sentido uma **startup** e quando faz sentido um **CoE**
5. **Mapear** problemas e oportunidades no contexto **local/regional**

---

## Retomada — Aula 01-02

Na aula anterior, você:

- Conheceu o mercado de Big Data e a saída **Assistente de Big Data**
- Viu que o produto deste componente é uma **startup** ou um **CoE** + protótipo
- Refletiu sobre portfólio, ética e ideias de problema local

**Pergunta de abertura (3 min):**

> Qual ideia vocês trouxeram hoje — e ela parece mais um **produto para o mercado** ou um **núcleo dentro de uma organização**?

---

## Entrega de hoje — formativa (sem peso percentual)

**Atividade principal:** mapa inicial de oportunidades (1 por equipe)

Não vale os 10% ainda — esses vêm na **Aula 07-08** (estudos de caso) e na **Aula 11-12** (canvas e plano).

Hoje o objetivo é **escolher um recorte**: problema, público, dados possíveis e modelo (startup ou CoE).

*Modelo completo no caderno de exercícios — Atividade 3.*

---

## Empreendedorismo em dados — o que é?

Empreender com dados **não** é só “abrir uma empresa de TI”.

É **criar valor** a partir de volume, velocidade ou variedade de dados, seja:

- vendendo um **produto/serviço** (startup)
- ou estruturando a **capacidade interna** de uma organização (CoE)

> Big Data sem problema de alguém = infraestrutura cara procurando utilidade.

---

## Por que empreender (ou intraempreender) agora?

- Organizações geram dados, mas **não extraem valor** de forma contínua
- Pequenos negócios e órgãos públicos locais **carecem** de pipelines e indicadores
- Técnico em Ciência de Dados pode atuar como **ponte** entre ferramenta e decisão
- O projeto deste componente vira **portfólio** e ensaio de carreira

**Davenport:** o desafio deixou de ser “ter Big Data” e passou a ser **usar dados no trabalho de verdade**.

---

## Oportunidades típicas (visão geral)

| Tipo | Exemplo |
|------|---------|
| **Produto** | Alerta de atraso de frota, busca em reclamações, painel setorial |
| **Serviço** | Pipeline + indicadores mensais para cooperativa ou rede de lojas |
| **Plataforma interna** | Padrão de ingestão, catálogo e jobs compartilhados (CoE) |
| **Dados abertos** | Transformar bases públicas em evidência para gestão local |
| **Operação** | Reduzir retrabalho de planilhas manuais em escala |

---

## Riscos do empreendedorismo em dados

| Risco | O que acontece na prática |
|-------|---------------------------|
| **Solução sem problema** | Pipeline sofisticado que ninguém usa |
| **Escopo gigante** | “Vamos processar todos os dados da cidade” |
| **Custo de infraestrutura** | Cluster/nuvem consome o orçamento sem MVP |
| **Dados inacessíveis** | Sem fonte, licença ou qualidade mínima |
| **LGPD e ética** | Volume alto × dados pessoais = dano grave |
| **Cópia de outro contexto** | Modelo de São Paulo/EUA que não cabe no interior |

*Empreender também é **dizer não** cedo.*

---

## Storytelling — dois caminhos na mesma cidade

**Ana** vê filas e desperdício no atacarejo da família. Imagina um **serviço** que consolida notas, estoque e entregas e vende o indicador para outros lojistas da região. → caminho de **startup**.

**Bruno** trabalha na cooperativa. Cada setor tem planilha própria, jobs repetidos e ninguém padroniza Spark. Ele propõe um **núcleo interno** com playbook, repositório e mentoria. → caminho de **CoE**.

**Discussão (5 min):** os dois usam Big Data. O que muda: **cliente**, **receita** e **sucesso**?

---

## Lean Startup — visão introdutória

**Lean Startup** (Eric Ries): reduzir desperdício aprendendo **rápido** com o mercado, em vez de construir o sistema “completo” antes de validar.

Três ideias para este componente:

1. **Hipótese** — o que acreditamos que é problema e valor
2. **MVP** — a menor evidência que testa essa hipótese
3. **Aprendizado validado** — dados (de uso, de conversa, de protótipo) que confirmam ou derrubam a ideia

*Canvas completo fica para as Aulas 09-12. Hoje: o ciclo.*

---

## Ciclo construir–medir–aprender

```
     APRENDER  ←  o que a evidência mudou na hipótese?
        ↑
     MEDIR     ←  o que observamos no MVP / conversa / dado?
        ↑
     CONSTRUIR ←  a menor coisa que gera evidência
```

**No nosso projeto:**
- **Construir:** recorte do pipeline, busca ou consulta — não a plataforma inteira
- **Medir:** a evidência responde à pergunta de valor?
- **Aprender:** manter, ajustar (**pivotar**) ou abandonar o recorte

---

## MVP — Mínimo Produto Viável (noções)

MVP **não** é “versão feia do produto final”.

É o **menor artefato** que permite aprender se a ideia tem valor.

**Exemplos no nível técnico deste curso:**

| Hipótese | MVP possível |
|----------|----------------|
| “Gestão precisa buscar reclamações por bairro” | Índice pequeno no Elasticsearch + 3 consultas |
| “Safra gera volume demais para planilha” | Job PySpark em amostra + tempo de execução |
| “Setores repetem o mesmo pipeline” | Playbook + um job padrão versionado no Git |

---

## Atividade rápida (10 min)

**Exercício 1 — Hipótese e MVP**

Para a ideia que vocês trouxeram na Aula 01-02:

1. Escrevam **1 hipótese** (“Acreditamos que… porque…”)
2. Proponham **1 MVP** que daria para construir neste componente
3. Digam **o que mediriam** para saber se a hipótese aguenta

*Individual ou dupla → depois alinhem na equipe.*

---

## Centro de Excelência (CoE) em dados — o que é?

**CoE (Center of Excellence)** = núcleo **interno** que concentra competência, padrões e apoio para a organização usar dados com qualidade e menor retrabalho.

Não é, em geral, uma empresa vendendo no mercado aberto.

**Propósito típico:**
- Padronizar ferramentas, pipelines e nomenclaturas
- Evitar que cada área “reinvente” Spark, ingestão e segurança
- Formar pessoas e disseminar boas práticas
- Cuidar de **governança**, custo e LGPD

---

## O que um CoE de dados costuma fazer

| Frente | Exemplos |
|--------|----------|
| **Plataforma** | Ambiente compartilhado, jobs, catálogo mínimo |
| **Padrões** | Pastas no Git, qualidade, documentação de fontes |
| **Habilitação** | Mentoria, roteiros, plantão para áreas de negócio |
| **Governança** | Quem acessa o quê, retenção, dados pessoais |
| **Priorização** | Quais pipelines valem o custo de processar |

> CoE bem-sucedido **habilita** outras equipes — não centraliza tudo para sempre.

---

## Governança e papéis (visão introdutória)

| Papel | Função |
|-------|--------|
| **Patrocinador** | Autoriza prioridade, orçamento e adoção |
| **Coordenação do CoE** | Prioriza demandas e padrões |
| **Engenharia / operação** | Pipelines, jobs, monitoramento |
| **Steward / qualidade** | Regras de dado, dicionário, LGPD |
| **Área usuária** | Problema de negócio e validação do valor |
| **Comunidade de prática** | Troca entre quem já usa os padrões |

No projeto da disciplina, a equipe **simula** esses papéis mesmo em grupo pequeno.

---

## Startup × CoE — lado a lado

| Aspecto | Startup | CoE |
|---------|---------|-----|
| **Onde vive** | Mercado (clientes externos) | Dentro de uma organização |
| **Sucesso** | Adoção + receita (ou tração) | Adoção interna + padrão + custo/qualidade |
| **Cliente** | Quem paga ou usa o produto | Áreas, gestores, operação |
| **Risco típico** | Ninguém quer o produto | Ninguém adota o padrão |
| **MVP** | Evidência de valor no mercado | Playbook + pipeline piloto reutilizável |
| **Linguagem** | Proposta de valor, canal, preço | Governança, papéis, priorização |

---

## Quando escolher startup?

Sinais de que o recorte pende para **startup**:

- O problema atinge **vários** negócios ou cidadãos, não só um RH interno
- Dá para imaginar um **serviço ou produto** repetível
- Vocês precisariam **convencer um cliente** de fora da “empresa-mãe”
- O diferencial é a **oferta**, não só o modo de trabalhar internamente

*Ainda assim: comecem local/regional e enxuto.*

---

## Quando escolher CoE?

Sinais de que o recorte pende para **CoE**:

- O caos está **dentro** de uma organização (planilhas paralelas, jobs duplicados)
- O valor é **padronizar e habilitar**, não vender um app
- Há (ou imagina-se) um **patrocinador interno**
- O protótipo é um **pipeline + playbook** que outras áreas reusariam

*CoE também empreende: é intraempreendedorismo.*

---

## Estudo de caso — startup (local)

**AgroSinal** (ficção didática, inspirada em cooperativas do Centro-Oeste)

Três produtores não conseguiam cruzar clima, carga e perdas. A equipe fez MVP: ingestão semanal de planilhas + job Spark em amostra + alerta simples de desvio.

**O que funcionou:** problema sentido, recorte pequeno, dado acessível.  
**Risco evitado:** não tentaram “plataforma de IA para todo o agronegócio brasileiro” no primeiro mês.

**Pergunta:** o sucesso aqui foi tecnologia de ponta ou **aprendizado validado**?

---

## Estudo de caso — CoE (local)

**Núcleo de Dados da Rede EducaGO** (ficção didática)

Secretarias e escolas geravam matrícula, frequência e ouvidoria em formatos diferentes. Um núcleo interno criou: repositório padrão, job de consolidação e busca de tickets.

**O que funcionou:** patrocínio da gestão + um piloto em 2 unidades.  
**Risco evitado:** não exigiram que toda a rede migrasse no dia 1.

**Pergunta:** quem seriam os **papéis** desse CoE na sua região?

---

## Atividade em grupo (15 min)

**Exercício 2 — Startup ou CoE?**

Leiam os quatro cenários do caderno e, para cada um:

1. Classifiquem: **startup**, **CoE** ou **híbrido**
2. Justifiquem com **cliente** e **definição de sucesso**
3. Citem **1 risco** se a equipe escolher o modelo errado

*Um representante compartilha 1 cenário com a turma.*

---

## Oportunidades no contexto local/regional

Requisito do plano de curso: preferir o **contexto socioeconômico local/regional**.

**Por quê?**
- Vocês conhecem o problema (ou podem conversar com quem conhece)
- Dados abertos de município, estado e setor são mais críveis no pitch
- Portfólio com impacto em Goiás / região metropolitana / interior

**Pergunta-chave:**

> Que decisão local hoje é feita no escuro — ou na planilha que quebra?

---

## Setores-âncora para brainstorm (Goiás e região)

| Setor | Problema típico com dados em escala |
|-------|-------------------------------------|
| Agronegócio / cooperativas | Safra, logística, qualidade, clima |
| Varejo e atacado | Notas, estoque, filiais, picos |
| Transporte e mobilidade | GTFS, GPS, reclamações, atrasos |
| Saúde e assistência | Filas, exames, ouvidoria (cuidado com LGPD) |
| Gestão pública | Dados abertos, transparência, serviços |
| Turismo e eventos | Fluxo, avaliações, sazonalidade |
| Energia / saneamento | Medições, falhas, atendimento |

---

## Fontes para “checar se o problema existe”

- Conversar com **1 pessoa** do setor (comerciante, servidor, cooperado)
- Portais: **dados.gov.br**, **IBGE**, transparência estadual/municipal
- Notícias locais sobre gargalo operacional (fila, atraso, desperdício)
- Experiência da própria turma (trabalho, família, bairro)

*Não precisam ter a base final hoje — precisam de um **problema candidato** e de uma **pista de dados**.*

---

## Framework — mapa de oportunidade

```
QUEM sofre o problema?
        ↓
QUAL decisão fica ruim sem dados em escala?
        ↓
QUE dados existem (ou podem existir) com licença ok?
        ↓
STARTUP ou COE — e por quê?
        ↓
HIPÓTESE + MVP possível neste componente
        ↓
PRINCIPAL RISCO e como descobrir cedo
```

---

## Checklist — a oportunidade é viável na disciplina?

- [ ] Problema **delimitado** (não “Big Data para Goiás inteiro”)
- [ ] Contexto **local/regional** reconhecível
- [ ] Pista de **dados** (abertos ou amostra autorizada)
- [ ] Modelo **startup ou CoE** justificado
- [ ] MVP cabível em **horas de laboratório** (Etapa II: Spark, ingestão, busca, Git…)
- [ ] **LGPD:** sem dados pessoais identificáveis no protótipo
- [ ] Dá para **medir** se a hipótese faz sentido

---

## Armadilhas comuns nesta etapa

| Armadilha | Como corrigir hoje |
|-----------|-------------------|
| “Vamos usar IA / LLM” sem dado nem pergunta | Voltar ao problema e ao MVP técnico da grade |
| Copiar Uber/Netflix | Recortar um pedaço local e mensurável |
| Escolher CoE e falar como se fosse loja | Ajustar cliente e sucesso (adoção interna) |
| Startup sem ninguém que pagaria/usaria | Nomear 1 usuário real ou persona concreta |
| Fonte só em PDF ou dado pessoal | Trocar a fonte ou anonimizar / usar aberto |

---

## Atividade principal (35 min)

**Exercício 3 — Mapa inicial de oportunidades**

Em equipe, preencham o modelo do caderno:

- Problema, quem sofre, decisão apoiada
- Pista de dados e limitações
- Startup **ou** CoE (com justificativa)
- Hipótese, MVP e risco principal

*Revisem com o professor antes do fim da aula.*  
*Esse mapa alimenta as Aulas 05-06 (etapas do projeto) e 07-08 (estudos de caso — 10%).*

---

## Revisão entre pares (8 min)

**Exercício 4 — Um elogio e um corte de escopo**

Troquem o mapa com outra equipe:

- O problema cabe em **uma frase**?
- Startup/CoE está **justificado**?
- O MVP parece **fazível** neste componente?

Anotem **1 ponto forte** e **1 sugestão para reduzir escopo**.

---

## O que NÃO precisamos fechar hoje

Deixem para as próximas aulas (propositalmente):

- Canvas completo e preço/canais → **09-12**
- Arquitetura detalhada e protótipo → **13-16**
- Pitch final → **17-20**

Hoje basta um **norte compartilhado** pela equipe.

---

## Próxima aula (05-06)

**Etapas de um projeto de Big Data** — da concepção à execução.

Tragam:
- Mapa de oportunidade (mesmo que rascunho)
- Dúvidas sobre dados e modelo (startup ou CoE)
- Disposição para desenhar: problema → valor → dados → arquitetura → MVP

> *Depois de escolher o recorte, aprendemos a **encadear** as etapas profissionais.*

---

## Síntese da aula

Hoje você:

- Distinguiu **oportunidades e riscos** de empreender com dados
- Conheceu o ciclo **construir–medir–aprender** e a ideia de **MVP**
- Entendeu o **CoE**: propósito, governança e papéis
- Comparou **startup × CoE** e mapeou uma oportunidade **local/regional**

**Próxima aula:** etapas do projeto de Big Data (concepção → execução).

---

## Referências desta aula

- Plano de Ensino — Projeto Profissional de Big Data (Escola do Futuro)
- RIES, E. *A startup enxuta.* São Paulo: Leya Casa da Palavra, 2012.
- DAVENPORT, T. H. *Big Data at Work.* Harvard Business Review, 2014.
- COELHO, A. M. M. *Empreendedorismo inovador.* São Paulo: Évora, 2015.
- PAKES, A. *Negócios digitais.* São Paulo: Gente, 2016.
- BRASIL. Portal de Dados Abertos: https://dados.gov.br/

---

<!-- _class: lead -->
# Obrigado!

### Completem as Atividades 1 a 4 do caderno.

Tragam na Aula 05-06 o **mapa de oportunidade** da equipe (startup ou CoE).

**Escola do Futuro · Ciência de Dados**
