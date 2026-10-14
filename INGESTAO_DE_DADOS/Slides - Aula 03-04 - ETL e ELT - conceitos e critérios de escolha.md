---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ingestão de Dados · Aula 03-04'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Ingestão de Dados

## Aula 03-04
### ETL e ELT — conceitos e critérios de escolha

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 01-02 e objetivos de hoje |
| 0:20 – 1:05 | Etapas Extract, Transform e Load |
| 1:05 – 1:20 | **Intervalo** |
| 1:20 – 2:10 | ELT e o papel do destino na transformação |
| 2:10 – 2:25 | **Intervalo** |
| 2:25 – 3:20 | Vantagens, limitações, custo, governança e critérios |
| 3:20 – 4:00 | Desafio de escolha, fixação e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Descrever** as etapas Extract, Transform e Load
2. **Descrever** as etapas Extract, Load e Transform
3. **Explicar** onde a transformação acontece em cada abordagem
4. **Comparar** vantagens, limitações, custo e governança
5. **Escolher** ETL ou ELT em um cenário de negócio e justificar

---

## Retomada — Aula 01-02

Na aula anterior, você:

- Definiu **ingestão** como a alimentação dos sistemas de dados
- Identificou **fontes** e **destinos**
- Viu os nomes **ETL** e **ELT** apenas como prévia

**Pergunta de abertura (3 min):**

> O dado pode ser limpo **antes** de entrar no banco ou **depois**, já dentro dele. O que muda para quem usa o painel?

---

## A decisão de hoje

As duas abordagens fazem o mesmo trabalho de fundo: tirar o dado da origem e deixá-lo utilizável no destino.

A diferença está na **ordem** e no **lugar** da transformação.

| Abordagem | Ordem | Onde se transforma |
|-----------|--------|--------------------|
| **ETL** | Extract → Transform → Load | Fora do destino (ex.: Python) |
| **ELT** | Extract → Load → Transform | No destino (ex.: SQL no SGBD) |

---

## Extract — extrair

Trazer o dado da **fonte** para o processo de ingestão.

Exemplos neste curso:

- Ler um CSV ou JSON
- Consultar uma API
- Ler uma tabela de outro banco

Nesta etapa o dado ainda está **como a origem entregou**: nomes de coluna estranhos, datas em formatos diferentes, campos vazios, duplicados.

---

## Transform — transformar

Deixar o dado **utilizável** para o destino e para o negócio.

Exemplos:

- Padronizar datas (`01/03/2026` e `01-03-2026` → `2026-03-01`)
- Filtrar linhas inválidas
- Remover ou mascarar CPF
- Unir agenda e laboratório numa tabela só
- Agregar ocupação por unidade

A transformação é uma **regra de negócio** escrita em código ou em SQL.

---

## Load — carregar

Gravar o dado no **destino**, para que o painel, o relatório ou a consulta passem a enxergá-lo.

Exemplos neste curso:

- `INSERT` em PostgreSQL, MariaDB ou MySQL
- Documento em uma coleção do MongoDB

Carregar encerra a viagem só quando o destino tem o conjunto que o consumidor combinou usar.

---

## ETL — o fluxo completo

```
Fonte → Extract → Transform → Load → Destino oficial
CSV      Python     Python      SQL     tabela limpa
```

1. **Extract:** o script lê o arquivo ou a API
2. **Transform:** o script corrige, filtra e protege os campos
3. **Load:** só o resultado tratado entra no destino

O destino recebe a tabela **já pronta**. A sujeira e o dado sensível ficam fora dele.

---

## Exemplo ETL — rede de clínicas

A agenda chega assim:

| nome | cpf | status | data |
|------|-----|--------|------|
| Ana | 111.222.333-44 | ok | 01/03/2026 |
| Ana | 111.222.333-44 | ok | 01-03-2026 |

O Python, **antes** de gravar:

- remove o CPF
- unifica a data
- descarta a linha duplicada

A tabela `ocupacao_dia` recebe uma linha limpa. O painel lê essa tabela.

---

## ELT — a ordem muda

```
Fonte → Extract → Load → Transform → Destino oficial
CSV      Python    staging   SQL         tabela limpa
```

1. **Extract:** o script lê a origem
2. **Load:** o dado **bruto** entra numa área de estágio
3. **Transform:** o SGBD aplica as regras em SQL e gera a tabela oficial

Quem transforma é o **destino**, com a capacidade e a linguagem dele.

---

## O papel do destino no ELT

No ELT o banco deixa de ser só uma gaveta. Ele passa a ser o **motor da transformação**.

| Peça no destino | Função |
|-----------------|--------|
| Tabela de **estágio** (staging) | Guarda o bruto, fiel à origem |
| SQL de transformação | Aplica regras, filtros e junções |
| Tabela **oficial** | É a que o painel e o relatório consultam |

A equipe combina: ninguém monta o painel em cima do estágio.

---

## Exemplo ELT — varejo

A API de pedidos manda o JSON completo do mês.

1. O script **carrega** o JSON numa tabela `staging_pedidos`
2. O time de negócio escreve SQL para faturamento por categoria
3. No mês seguinte a regra muda (“cancelado não entra”)
4. A nova SQL roda de novo sobre o **mesmo bruto**, sem pedir o arquivo outra vez

O destino conserva a origem da transformação.

---

## Os dois caminhos, lado a lado

| | ETL | ELT |
|---|-----|-----|
| 1ª etapa | Extrair | Extrair |
| 2ª etapa | Transformar fora | Carregar o bruto |
| 3ª etapa | Carregar o tratado | Transformar no destino |
| Ferramenta típica aqui | Python / pandas | SQL no SGBD |
| O que o destino guarda | Dado já tratado | Bruto **e** dado tratado |

---

## Vantagens do ETL

- O destino só armazena o que já foi aprovado
- Dado sensível pode ser removido **antes** de entrar
- A regra fica no script, visível no fluxo
- Cabe bem quando o volume passa no Python do laboratório
- O consumidor encontra uma tabela única e estável

---

## Vantagens do ELT

- O bruto permanece disponível para uma regra nova
- Dá para reprocessar sem voltar à origem
- Várias tabelas oficiais podem nascer da mesma carga
- A transformação usa a força do SGBD e o SQL da equipe
- A carga inicial é mais curta: trata-se depois

---

## Limitações do ETL

- Se o bruto não foi guardado, uma regra nova exige **extrair de novo**
- O computador que transforma pode ficar lento ou sem memória
- Toda mudança de regra mexe no script, não só numa consulta
- Quem só sabe SQL depende de quem mantém o Python

---

## Limitações do ELT

- O destino precisa de espaço para o bruto e para o oficial
- O dado sensível **entra** no ambiente, mesmo que numa tabela separada
- Alguém pode consultar o estágio por engano e publicar dado cru
- Sem disciplina de acesso, a flexibilidade vira risco

---

## Custo

| Onde o custo aparece | ETL | ELT |
|----------------------|-----|-----|
| Processamento | Na máquina que transforma | No SGBD, na hora do SQL |
| Armazenamento | Menor: só o tratado | Maior: bruto + tratado |
| Retrabalho | Pode exigir nova extração | Em geral, novo SQL sobre o estágio |
| Ferramenta | Python no laboratório | SGBD que aguente a transformação |

Custo baixo num lado pode ser custo alto no outro. A escolha inclui **onde** a organização prefere pagar.

---

## Governança

Governança, aqui, é combinar **quem vê o quê** e **qual tabela é a oficial**.

| Tema | ETL | ELT |
|------|-----|-----|
| Dado sensível | Pode ser eliminado antes da carga | Precisa de acesso restrito ao estágio |
| Tabela oficial | É o que foi carregado | É a saída do SQL, separada do bruto |
| Regra de negócio | Vive no script de transformação | Vive no SQL documentado |
| Auditoria | “O que entrou já estava tratado” | “O bruto está aqui; a regra está na consulta” |

---

## Quando o ETL é mais apropriado

- O destino **não deve** guardar CPF, payload cru ou dado clínico identificável
- O SGBD é modesto e não deve armazenar a sujeira da origem
- O volume cabe na transformação em Python
- O contrato com o painel é uma tabela limpa e estável
- A origem é confusa e a limpeza precisa acontecer antes de qualquer uso

---

## Quando o ELT é mais apropriado

- A equipe vai **refazer** indicadores sem pedir o arquivo de novo
- O SGBD tem espaço e a equipe trabalha bem com SQL
- O mesmo bruto alimenta mais de um relatório
- A regra de negócio ainda muda com frequência
- Interessa conservar a cópia fiel da origem dentro de casa

---

## Como ler um cenário

Antes de escolher, responda:

1. O dado sensível pode **entrar** no destino?
2. Vamos precisar do **bruto** de novo?
3. Onde está a capacidade: no Python ou no SGBD?
4. Quem mantém a regra: quem escreve script ou quem escreve SQL?
5. Qual é o custo de guardar tudo versus limpar antes?

A letra (ETL ou ELT) vale pouco sem essas respostas.

---

## Estudo de caso — a clínica e o varejo

**Clínica.** O painel de ocupação é visto por muita gente. O CPF não pode estar no banco analítico.

**Varejo.** O JSON completo dos pedidos fica no PostgreSQL. No mês que vem o marketing muda a definição de “venda válida”.

**Discussão (5 min):**

1. Qual cenário pede transformação **antes** da carga?
2. Qual cenário pede o bruto **dentro** do destino?
3. Que cuidado de governança cada escolha exige?

---

## Desafio — ETL ou ELT? (gamificação)

Em grupos, três rodadas curtas. Cada rodada vale até **3 pontos**:

| Ponto | Critério |
|-------|----------|
| 1 | Escolha coerente com o cenário |
| 1 | Uma vantagem da abordagem escolhida |
| 1 | Um limite, um custo ou um cuidado de governança |

Ganha quem **justifica**, não quem grita a sigla primeiro.

O registro escrito é a **Atividade 2** do caderno.

---

## Atividade em grupo (20 min)

**Exercício 2 — Classificação de cenários**

Em grupos de 3 a 4 pessoas:

1. Leiam os quatro cenários do caderno
2. Marquem **ETL** ou **ELT**
3. Registrem vantagem e cuidado (custo, limite ou governança)
4. Um cenário da sala será sorteado para apresentação de 2 minutos

*Respostas bem justificadas, mesmo diferentes, podem ser aceitas.*

---

## O que esta aula decide — e o que fica para depois

Hoje a decisão é **ETL ou ELT**.

Nas próximas aulas entram, em separado:

- origens, destinos e carga completa ou incremental (Aula 05-06)
- implementação em Python e em SQL (Blocos 2 e 3)
- agendamento, lote e streaming (Blocos 4 e 5)

---

## Fixação — Exercício 4 (10 min)

**Associe** cada situação à ideia mais central:

| Situação | Conceito |
|----------|----------|
| A) Datas padronizadas no Python e só então o `INSERT` | ( ) ETL ( ) ELT |
| B) JSON cru na tabela `staging` e regra em SQL | ( ) ELT ( ) Extract |
| C) CPF removido antes de existir no banco analítico | ( ) Governança no ETL ( ) Custo de disco |
| D) Estágio aberto para toda a empresa, com dado clínico | ( ) Risco de governança no ELT ( ) Vantagem do ETL |

*Gabarito no caderno de exercícios.*

---

## Síntese da aula

Hoje você:

- Descreveu **Extract**, **Transform** e **Load**
- Diferenciou a ordem do **ETL** e do **ELT**
- Localizou a transformação no script ou **no destino**
- Comparou vantagem, limitação, **custo** e **governança**
- Classificou cenários com justificativa

**Próxima aula (05-06):** origens, destinos, carga completa e carga incremental.

---

## Referências desta aula

- Plano de Ensino — Ingestão de Dados (Escola do Futuro)
- DENSMORE, J. *Data Pipelines Pocket Reference.* Sebastopol: O'Reilly Media, 2021.
- NGUYEN, H.; PHAM, H.; CHIN, C. *The Analytics Setup Guidebook.* Holistics.
- CRICKARD, P. *Data Engineering with Python.* Birmingham: Packt Publishing, 2020.

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Complete as **Atividades 1, 2, 3 e 4** do caderno de exercícios.

Na próxima aula, traga um fluxo desenhado: **origem → … → destino**, indicando se a transformação fica no meio ou no final.

**Escola do Futuro · Ciência de Dados**
