# Exercício — Aula 05-06
## Diagnóstico e limpeza de dados

**Componente curricular:** Projeto Profissional de Gestão de Dados  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Atividades formativas (alimentam a entrega de **15%** da Aula 07-08)

---

## Instruções gerais

- Atividade **1** é individual ou em dupla (fixação).
- Atividades **2** e **3** são **em equipe** (mesma equipe do Plano do Projeto).
- Atividade **4** é checklist de encerramento / autoavaliação.
- Mantenham **sempre** uma cópia do arquivo **bruto** (não sobrescrever).
- Preferência: **Python + pandas** em Jupyter/Colab; planilha é aceita se documentada.

---

## Atividade 1 — Diagnóstico rápido (individual ou dupla)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Identificar problemas de qualidade em uma amostra.

### Amostra (fictícia)

| id | municipio | uf | ano | populacao | renda_media | taxa_desemprego |
|----|-----------|----|-----|-----------|-------------|-----------------|
| 1 | Goiânia | GO | 2022 | 1555626 | 2450,30 | 8.2 |
| 2 | goiania | go | 2022 | 1555626 | 2.450,30 | 8,2 |
| 3 | Anápolis | GO | 2022 | | 1890.00 | 9.1 |
| 4 | Valparaíso De Goiás | GO | 2022 | 198874 | N/A | 10.5 |
| 5 | Aparecida de Goiânia | GO | 22 | 601844 | 2100 | 7.8 |
| 6 | Goiânia | GO | 2022 | 1555626 | 2450.30 | 8.2 |
| 7 | Luziânia | GO | 2022 | -120 | 1500 | 999 |
| 8 | Águas Lindas de Goiás | GO | 2022 | 217724 |  | 11 |

### Tarefa

Liste:

**a) 2 problemas de completude**

> 1.  
> 2.  

**b) 2 problemas de consistência**

> 1.  
> 2.  

**c) 1 possível duplicata** (indique as linhas)

> 

**d) 1 possível outlier ou valor inválido**

> 

**e) Qual decisão você tomaria primeiro? Por quê?**

> 

---

## Atividade 2 — Checklist de diagnóstico da base do projeto (equipe)

**Tempo sugerido:** 25 minutos  
**Objetivo:** Avaliar a qualidade da base escolhida na Aula 03-04.

### 2.1 Identificação

| Campo | Preenchimento |
|-------|---------------|
| Nome da equipe | |
| Arquivo bruto (nome) | |
| Fonte original | |
| Formato | CSV / XLSX / outro: ____ |
| Linhas × colunas (iniciais) | |

### 2.2 Dimensões de qualidade

| Dimensão | Situação encontrada | Gravidade (A/M/B) | Colunas afetadas |
|----------|---------------------|-------------------|------------------|
| Completude (nulos / vazios) | | | |
| Consistência (formatos / categorias) | | | |
| Unicidade (duplicatas) | | | |
| Validade (domínio / tipos) | | | |
| Outliers / valores suspeitos | | | |
| Adequação ao recorte do projeto | | | |

### 2.3 Comandos / inspeções realizadas

Marque o que a equipe executou:

- [ ] `shape` / contagem de linhas e colunas
- [ ] `info` / tipos de dados
- [ ] Contagem de nulos por coluna
- [ ] Contagem de duplicatas
- [ ] Min / max ou estatísticas descritivas
- [ ] Amostra visual (`head`) e filtros
- [ ] Comparação com dicionário/metadados da fonte

### 2.4 Resumo do diagnóstico (5–8 linhas)

> 

---

## Atividade 3 — Limpeza + Diário de Limpeza (equipe)

**Tempo sugerido:** 45–55 minutos  
**Objetivo:** Limpar a base e documentar decisões de forma rastreável.

### 3.1 Backup

- [ ] Cópia do arquivo bruto salva com nome claro  
  Ex.: `projeto_nome_BRUTO_2026-08-13.csv`

### 3.2 Ações de limpeza (marque e descreva)

| Ação | Feito? | Como foi feito (resumo) |
|------|--------|-------------------------|
| Padronizar nomes de colunas | [ ] | |
| Converter tipos (número/data/texto) | [ ] | |
| Tratar valores ausentes | [ ] | |
| Remover ou consolidar duplicatas | [ ] | |
| Padronizar categorias / textos | [ ] | |
| Aplicar recorte (UF, município, ano…) | [ ] | |
| Tratar outliers / inválidos | [ ] | |
| Exportar `dados_limpos` | [ ] | |

**Arquivo limpo gerado:** _________________________________

**Linhas × colunas (após limpeza):** _______________________

---

### 3.3 Diário de Limpeza (mínimo 5 decisões)

Preencham **uma linha por decisão**. Copiem linhas extras se necessário.

| # | Problema encontrado | Ação tomada | Motivo / justificativa | Impacto (ex.: N linhas) | Responsável | Data |
|---|---------------------|-------------|------------------------|-------------------------|-------------|------|
| 1 | | | | | | |
| 2 | | | | | | |
| 3 | | | | | | |
| 4 | | | | | | |
| 5 | | | | | | |
| 6 | | | | | | |
| 7 | | | | | | |

---

### 3.4 Pendências (o que ficou para depois)

| Pendência | Por que não resolveu hoje | Plano para Aula 07-08 |
|-----------|---------------------------|------------------------|
| | | |
| | | |

---

### 3.5 Trecho de código ou passos (opcional, recomendado)

Cole abaixo o trecho principal do notebook **ou** a lista numerada dos passos na planilha:

```
(cole aqui)



```

---

## Atividade 4 — Checklist de encerramento (equipe)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Verificar se a equipe está pronta para a Aula 07-08.

| Item | Sim | Não | Observação |
|------|-----|-----|------------|
| Arquivo bruto preservado | | | |
| Arquivo `dados_limpos` salvo e compartilhado na equipe | | | |
| Diário de Limpeza com ≥ 5 decisões | | | |
| Tipos das colunas principais corretos | | | |
| Duplicatas críticas tratadas | | | |
| Recorte alinhado às perguntas do Plano | | | |
| Ainda conseguimos calcular os KPIs previstos? | | | |
| Sem dados pessoais identificáveis | | | |

**Autoavaliação da equipe (1 a 5):** qualidade da limpeza = ____

**O que precisa da ajuda do professor antes da próxima aula?**

> 

---

## Para o professor — Gabarito orientativo (Atividade 1)

| Item | Exemplos aceitáveis |
|------|---------------------|
| Completude | `populacao` vazia (linha 3); `renda_media` = N/A ou vazia (linhas 4 e 8) |
| Consistência | `Goiânia` vs `goiania`; `GO` vs `go`; `2450,30` vs `2.450,30`; ano `22` vs `2022`; vírgula/ponto em taxas |
| Duplicata | Linhas 1 e 6 (mesmo município/ano/população); linha 2 como variação inconsistente do mesmo registro |
| Outlier / inválido | `populacao = -120`; `taxa_desemprego = 999` |
| Primeira decisão | Ex.: padronizar município/UF e tipos; ou remover/tratar linha 7 por valores inválidos — aceitar desde que justificado |

---

## Para o professor — Rubrica formativa (Aula 05-06)

| Critério | Excelente | Satisfatório | Parcial | Insuficiente |
|----------|-----------|--------------|---------|--------------|
| Diagnóstico | Dimensões cobertas com evidências | Checklist completo | Superficial | Ausente |
| Limpeza | Tratamentos coerentes e reprodutíveis | Limpeza funcional | Poucas ações | Sem limpeza real |
| Documentação | Diário claro (≥5) com impacto | Diário preenchido | Genérico | Ausente |
| Preparação p/ banco | Arquivo limpo + tipos ok | Arquivo limpo | Arquivo confuso | Não exportou |
| Ética / backup | Bruto preservado; LGPD ok | Backup ok | Backup incerto | Sobrescreveu bruto |

*Esta nota pode compor participação (15%) e/ou servir de pré-requisito qualitativo para liberar a entrega de 15% na Aula 07-08.*

---

## Para o professor — Snippets úteis (demo em sala)

```python
import pandas as pd

df = pd.read_csv("dados_brutos.csv")
print(df.shape)
print(df.isna().sum())
print(df.duplicated().sum())

# Exemplo de padronização
df.columns = (
    df.columns.str.strip().str.lower()
    .str.replace(" ", "_").str.replace("-", "_")
)

# Exemplo de nulos
df["renda_media"] = pd.to_numeric(df["renda_media"], errors="coerce")

# Exemplo de duplicatas por chave
df = df.drop_duplicates(subset=["codigo_ibge", "ano"], keep="last")

df.to_csv("dados_limpos.csv", index=False)
```

---

## Referências

- Plano de Ensino — Projeto Profissional de Gestão de Dados (Escola do Futuro)
- GRUS, J. **Data science do zero.** Rio de Janeiro: Alta Books, 2016.
- PYDATA DEVELOPMENT TEAM. **pandas documentation.** Disponível em: https://pandas.pydata.org/docs/
- KNAFLIC, C. N. **Storytelling com dados.** São Paulo: Alta Books, 2019.

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
