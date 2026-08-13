---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Projeto Profissional de Gestão de Dados · Aula 05-06'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
---

<!-- _class: lead -->
# Projeto Profissional de Gestão de Dados

## Aula 05-06
### Diagnóstico e limpeza de dados

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada do plano e objetivos de hoje |
| 0:20 – 1:00 | Qualidade de dados: dimensões e diagnóstico |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | Técnicas de limpeza, padronização e transformação |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:40 | Laboratório: limpeza da base do projeto |
| 3:40 – 4:00 | Documentação das decisões e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Avaliar** a qualidade dos dados nas dimensões de completude, consistência, unicidade e outliers
2. **Aplicar** técnicas de limpeza, padronização e transformação
3. **Documentar** cada decisão de tratamento (o quê, por quê, como)
4. **Preparar** a base limpa para a carga no banco analítico (Aula 07-08)

---

## Retomada — onde paramos?

Na **Aula 03-04** a equipe:

- Definiu **problema**, perguntas e KPIs
- Selecionou a **base de dados aberta**
- Entregou o **Plano do Projeto (10%)**

**Hoje:** mãos na massa — **diagnosticar** e **limpar** os dados reais.

> *Tragam o arquivo baixado e o plano aprovado.*

---

## Por que limpar dados?

> Dados brutos raramente estão prontos para análise.

Problemas comuns em bases abertas:
- Células vazias e campos incompletos
- Datas e números em formatos misturados
- Nomes de município com grafias diferentes
- Linhas duplicadas
- Valores absurdos (outliers / erros de digitação)

**Sem limpeza:** KPIs errados · dashboard enganoso · decisões ruins.

---

## Fluxo desta etapa

```
DADOS BRUTOS  →  DIAGNÓSTICO  →  LIMPEZA  →  BASE TRATADA  →  DOCUMENTAÇÃO
     ↓              ↓              ↓              ↓                ↓
  arquivo CSV    checklist      pandas/Excel   arquivo limpo   registro
  / planilha     de qualidade   + regras       (.csv/.xlsx)    de decisões
```

Na **Aula 07-08:** carga da base tratada no **SGBD**.

---

## Avaliação de hoje

Esta aula é **formativa** (acompanhamento + participação).

| Entrega | Quando | Peso |
|---------|--------|------|
| Diagnóstico + limpeza documentada | Aula 05-06 (rascunho) | Formativa |
| **Banco analítico + dados tratados** | Aula 07-08 | **15%** |

> O que fizerem hoje **alimenta** a entrega de 15% da próxima aula.

---

## Dimensões de qualidade de dados

| Dimensão | Pergunta-chave |
|----------|----------------|
| **Completude** | Há valores ausentes? Em quais colunas? |
| **Consistência** | Formatos e regras batem entre si? |
| **Unicidade** | Existem registros duplicados? |
| **Validade** | Valores estão no domínio esperado? |
| **Acurácia** | O valor faz sentido no mundo real? |
| **Atualidade** | O período cobre as perguntas do projeto? |

*Foco de hoje: completude, consistência, duplicatas e outliers.*

---

## Completude — valores ausentes

**Sintomas:** células vazias, `NaN`, `NULL`, `"-"`, `"N/A"`, espaços.

**Diagnóstico (ideia):**
- Contar nulos por coluna
- Calcular % de preenchimento
- Verificar se nulos são **aleatórios** ou concentrados

**Decisões possíveis:**
- Remover linhas (se poucas e justificável)
- Preencher com valor padrão / mediana / categoria “Não informado”
- Manter nulo e tratar na visualização
- **Descartar a coluna** se estiver quase vazia

---

## Consistência — formatos e regras

Exemplos de inconsistência:

| Problema | Exemplo |
|----------|---------|
| Datas mistas | `01/02/2023` e `2023-02-01` |
| Números como texto | `"1.234,56"` vs `1234.56` |
| Categorias variantes | `GO`, `Go`, `goiás`, `Goiás` |
| Unidades misturadas | população em milhares vs unidades |
| Códigos inválidos | município sem código IBGE |

**Meta:** um padrão único por coluna, documentado.

---

## Unicidade — duplicatas

**Tipos:**
- Linha **inteira** duplicada
- Duplicata por **chave lógica** (ex.: mesmo município + mesmo ano)

**Diagnóstico:**
- Contar linhas totais vs. linhas únicas
- Identificar chaves candidatas do projeto

**Ação:**
- Remover duplicatas mantendo a regra (primeira, última, agregado)
- Investigar se a “duplicata” é erro ou fato real (ex.: duas medições)

---

## Outliers e valores suspeitos

**Outlier** = valor muito distante do restante.

Pode ser:
- **Erro** (ex.: população = −50 ou 999999999)
- **Fato raro** (ex.: município muito pequeno)

**Como detectar (nível técnico):**
- Ordenar / min e max
- Boxplot ou histogramas simples
- Comparar com fontes oficiais (IBGE)

**Regra de ouro:** não apagar outlier sem **investigar** e **documentar**.

---

## Atividade rápida (10 min)

**Exercício 1 — Diagnóstico rápido**

Olhem a amostra da tabela no caderno e marquem:

- 2 problemas de **completude**
- 2 de **consistência**
- 1 possível **duplicata**
- 1 possível **outlier**

*Discussão em 2 minutos com a equipe.*

---

## Ferramentas da aula

| Ferramenta | Uso sugerido |
|------------|--------------|
| **Python + pandas** | Diagnóstico e limpeza reprodutível |
| **Jupyter / Colab** | Notebook com passos documentados |
| **Excel / Calc / Sheets** | Inspeção rápida e filtros |
| **Bloco de notas / Markdown** | Registro de decisões |

*Prefiram pandas quando possível — facilita a próxima carga no banco.*

---

## Diagnóstico com pandas (roteiro)

```python
import pandas as pd

df = pd.read_csv("dados_brutos.csv")  # ou read_excel

df.shape          # linhas × colunas
df.head()
df.info()
df.describe()
df.isna().sum()
df.duplicated().sum()
df.nunique()
```

Anotem: tamanho, tipos, nulos, duplicatas, colunas críticas.

---

## Técnicas de limpeza — overview

1. **Padronizar nomes de colunas** (`snake_case`, sem acento se necessário)
2. **Corrigir tipos** (número, data, categoria)
3. **Tratar ausentes**
4. **Remover / consolidar duplicatas**
5. **Padronizar textos** (trim, caixa, categorias)
6. **Filtrar recorte** (municípios / anos do projeto)
7. **Tratar outliers** (corrigir, limitar ou manter)
8. **Exportar** base limpa + **documentar**

---

## Padronização de textos

```python
df["municipio"] = (
    df["municipio"]
    .astype(str)
    .str.strip()
    .str.title()
)
```

Outras ações frequentes:
- Unificar categorias com dicionário de mapeamento
- Remover caracteres especiais indesejados
- Separar código e nome (quando vierem juntos)

---

## Datas e números

```python
# Datas
df["ano"] = pd.to_datetime(df["data"], errors="coerce").dt.year

# Números (cuidado com ponto/vírgula)
df["renda"] = (
    df["renda"]
    .astype(str)
    .str.replace(".", "", regex=False)
    .str.replace(",", ".", regex=False)
)
df["renda"] = pd.to_numeric(df["renda"], errors="coerce")
```

`errors="coerce"` transforma o inválido em **NaN** — depois trate os nulos.

---

## Duplicatas e recorte

```python
# Remover linhas iguais
df = df.drop_duplicates()

# Remover por chave lógica
df = df.drop_duplicates(subset=["codigo_ibge", "ano"], keep="last")

# Recorte do projeto
df = df[df["uf"] == "GO"]
df = df[df["ano"].between(2018, 2023)]
```

*Só recortem o necessário para responder às perguntas do plano.*

---

## Documentação — o artefato mais importante

Em projetos profissionais, **documentar a limpeza** vale tanto quanto limpar.

Para **cada** decisão, registrem:

| Campo | Exemplo |
|-------|---------|
| **Problema** | 18% de nulos em `renda` |
| **Ação** | Preencher com mediana por município |
| **Motivo** | Evitar perder linhas; coluna crítica para KPI |
| **Impacto** | 42 valores imputados |
| **Responsável / data** | Ana · 13/08/2026 |

Usem o **Diário de Limpeza** do caderno de exercícios.

---

## O que NÃO fazer

❌ Apagar colunas “porque atrapalham” sem alinhar às perguntas  
❌ Preencher nulos com zero sem sentido de negócio  
❌ Remover outliers só para “o gráfico ficar bonito”  
❌ Alterar a base original **sem backup**  
❌ Limpar sem salvar script/notebook  
❌ Inventar dados para completar tabelas  

✅ Sempre: **backup** → **diagnóstico** → **limpeza** → **export** → **documentação**

---

## Laboratório — Exercício 2 e 3 (70 min)

Em equipe, com a **base do projeto**:

1. **Diagnóstico** (Exercício 2): preencher checklist de qualidade
2. **Limpeza** (Exercício 3): aplicar tratamentos no notebook ou planilha
3. **Exportar** `dados_limpos.csv` (ou `.xlsx`)
4. **Preencher** o Diário de Limpeza (mín. 5 decisões)

*Professor circula e valida escolhas.*

---

## Entregáveis do laboratório (rascunho)

Ao final da aula, a equipe deve ter:

- [ ] Backup do arquivo **bruto**
- [ ] Notebook ou planilha com passos de limpeza
- [ ] Arquivo **`dados_limpos`**
- [ ] Diário de Limpeza preenchido (Exercício 3)
- [ ] Lista de problemas **ainda pendentes** (se houver)

Na **Aula 07-08:** modelagem + carga no SGBD + validação SQL.

---

## Critérios de qualidade da limpeza

| Critério | Bom sinal |
|----------|-----------|
| Reprodutibilidade | Outra pessoa consegue repetir os passos |
| Rastreabilidade | Cada decisão está no diário |
| Adequação | Base ainda responde às perguntas do plano |
| Integridade | Tipos corretos; chaves sem duplicata indevida |
| Ética | Sem dados pessoais; fonte preservada |

---

## Ponte para a próxima aula

**Aula 07-08 — Criação e validação do banco analítico (15%)**

Vocês vão:
- Modelar tabelas a partir da base limpa
- Carregar no MySQL/PostgreSQL (ou SGBD da unidade)
- Validar com `SELECT` (contagens, nulos, chaves)

**Tragam:** `dados_limpos` + Diário de Limpeza + Plano do Projeto.

---

## Síntese da aula

Hoje você:

- Diagnosticou **completude, consistência, duplicatas e outliers**
- Aplicou **técnicas de limpeza e padronização**
- Documentou decisões no **Diário de Limpeza**
- Preparou a base para o **banco analítico**

**Lembrete:** limpeza sem documentação **não** conta como entrega profissional.

---

## Referências desta aula

- Plano de Ensino — Projeto Profissional de Gestão de Dados
- GRUS, J. *Data science do zero.* Alta Books, 2016.
- NIELD, T. *Introdução à linguagem SQL.* Novatec, 2016.
- PYDATA. *pandas documentation:* https://pandas.pydata.org/docs/
- KNAFLIC, C. N. *Storytelling com dados.* Alta Books, 2019.

---

<!-- _class: lead -->
# Obrigado!

### Completem o Diário de Limpeza e salvem `dados_limpos`.

Dúvidas de tratamento → resolvam **antes** da Aula 07-08.

**Escola do Futuro · Ciência de Dados**
