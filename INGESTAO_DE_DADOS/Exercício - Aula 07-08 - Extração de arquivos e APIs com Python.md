# Exercício — Aula 07-08
## Extração de arquivos e APIs com Python

**Componente curricular:** Ingestão de Dados  
**Curso:** Técnico em Ciência de Dados · Escola do Futuro  
**Carga da aula:** 4 horas  
**Tipo:** Checklist de ambiente + exercício prático de extração (conforme plano de ensino)

---

## Instruções gerais

- Atividade **1** (checklist) é **individual** e obrigatória.
- Atividade **2** é prática guiada (individual ou dupla).
- Atividade **3** é a **entrega prática** principal (individual ou dupla, conforme o professor).
- Atividade **4** é individual (fixação).
- Atividade **5** é opcional (desafio extra).
- As Atividades 1 e 3 integram as **atividades práticas e laboratoriais (40%)**.
- Nesta aula o script **não grava em banco**. A carga relacional é a Aula 09-10.

### Ambiente aceito

Marque o que você usou:

- [ ] Jupyter Notebook  
- [ ] VS Code  
- [ ] Google Colab  
- [ ] Laboratório da unidade  
- [ ] Outro: _________________

---

## Arquivos de apoio

Crie a pasta `dados/` ao lado do script e salve os três arquivos abaixo em **UTF-8**.

### `dados/agenda.csv`

```csv
id;nome;cidade;status;atualizado_em
1;Ana;Goiânia;ok;2026-03-01
1;Ana;Goiânia;ok;2026-03-01
2;Caio;Anápolis;confirmado;2026-03-02
3;Bia;Goiânia;confirmado;data-invalida
```

### `dados/eventos.json`

```json
[
  {"evento_id": "a1", "tipo": "checkin", "ts": "2026-03-02T07:55:00", "unidade": "Centro"},
  {"evento_id": "a1", "tipo": "checkin", "ts": "2026-03-02T07:55:00", "unidade": "Centro"},
  {"evento_id": "a2", "tipo": "checkout", "ts": "2026-03-02T09:10:00"}
]
```

### `dados/municipios_goias_amostra.json`

Use somente se a API do IBGE não responder.

```json
[
  {"id": 5200050, "nome": "Abadia de Goiás"},
  {"id": 5201108, "nome": "Anápolis"},
  {"id": 5208707, "nome": "Goiânia"}
]
```

### Contrato usado na validação

| Origem | Obrigatório | Regra |
|--------|-------------|--------|
| Agenda | `id`, `nome`, `cidade`, `status`, `atualizado_em` | `id` numérico e único; `status` só `confirmado`; data em `AAAA-MM-DD` |
| Eventos | `evento_id`, `tipo`, `ts` | `evento_id` único; `unidade` é opcional |
| Municípios | `id`, `nome` | `id` inteiro; `nome` texto não vazio |

---

## Atividade 1 — Checklist do ambiente (individual)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Garantir Python, bibliotecas e arquivos antes da prática.

| # | Verificação | Ok? |
|---|-------------|-----|
| 1 | `python --version` mostra 3.x | [ ] |
| 2 | `import pandas` funciona | [ ] |
| 3 | `import requests` funciona | [ ] |
| 4 | A pasta `dados/` está no lugar certo | [ ] |
| 5 | `agenda.csv` abre com acento em Goiânia | [ ] |
| 6 | `eventos.json` abre como lista de 3 objetos | [ ] |
| 7 | A URL do IBGE responde **ou** a amostra local está pronta | [ ] |

**Nome:** _______________________________

**Se algo falhou, o que foi e como resolveu:**

> 

---

## Atividade 2 — Prática guiada (individual ou dupla)

**Tempo sugerido:** 35–40 minutos  
**Objetivo:** Ler as origens, ver a codificação e obter a primeira lista de erros.

### 2.1 CSV

```python
from pathlib import Path
import pandas as pd

agenda = pd.read_csv(Path("dados/agenda.csv"), sep=";", encoding="utf-8")
print(agenda.shape)
print(agenda["cidade"].tolist())
```

**a)** Quantas linhas e quantas colunas?

> 

**b)** Leia de novo com `encoding="latin-1"` e copie como a cidade da Ana apareceu:

> 

### 2.2 JSON

```python
eventos = pd.read_json(Path("dados/eventos.json"))
print(len(eventos))
print(eventos["evento_id"].duplicated().any())
```

**c)** Há `evento_id` duplicado? Qual é o valor?

> 

**d)** A linha do checkout tem `unidade`? O contrato exige esse campo?

> 

### 2.3 API

```python
import requests

URL = (
    "https://servicodados.ibge.gov.br"
    "/api/v1/localidades/estados/52/municipios"
)
resposta = requests.get(URL, timeout=20)
print(resposta.status_code)
dados = resposta.json()
print(len(dados))
```

**e)** Código HTTP e quantidade de municípios (ou “usei a amostra local” e a quantidade 3):

> 

**f)** O `id` 5208707 (Goiânia) está na lista? (Sim/Não)

> 

### 2.4 Validação da agenda

Use a função `validar_agenda` dos slides (ou a sua, com o mesmo contrato).

**g)** Liste os erros encontrados na amostra:

> 

---

## Atividade 3 — Exercício prático de extração (individual ou dupla)

**Tempo sugerido:** 40–45 minutos  
**Objetivo:** Entregar um script organizado que lê, valida e relata.

### Requisitos da entrega

Entregar `extrair.py` **ou** notebook (`.ipynb`) + este formulário.

O programa deve:

1. Ler `dados/agenda.csv` com separador `;` e UTF-8
2. Ler `dados/eventos.json`
3. Chamar a API do IBGE (UF 52) com `timeout`
4. Se a API falhar, ler `dados/municipios_goias_amostra.json` e dizer que usou a contingência
5. Validar o contrato de cada origem
6. Imprimir, para cada fonte: nome da fonte, quantidade lida e erros
7. Separar extração, validação e relatório em funções
8. Encerrar com `main()` e `if __name__ == "__main__"`

Não é pedido gravar em banco, apagar duplicata nem trocar `ok` por `confirmado`.

### Resultados para registrar aqui

| Item | Resultado |
|------|-----------|
| Linhas da agenda | |
| Erros da agenda | |
| Registros de eventos | |
| Erros dos eventos | |
| Fonte dos municípios (URL ou arquivo) | |
| Quantidade de municípios | |
| Goiânia presente? (Sim/Não) | |
| Erros dos municípios | |
| Arquivo entregue | |

**Nomes (se dupla):**

| Nome |
|------|
| |
| |

**Cole abaixo o relatório impresso pelo script** (as três fontes):

> 

---

## Atividade 4 — Associação: situação × conceito (individual)

**Tempo sugerido:** 10 minutos  
**Objetivo:** Fixar leitura, erro de extração, esquema e organização do script.

**Instrução:** Para cada item, marque **uma** letra (A–H).

**Opções:**

- **A)** Separador ou codificação do CSV  
- **B)** Leitura de JSON  
- **C)** Erro de extração na API (HTTP, rede ou tempo)  
- **D)** Validação de esquema ou de tipo  
- **E)** Duplicidade  
- **F)** Organização do script  
- **G)** Fonte de contingência  
- **H)** Carga em banco (ainda não é esta aula)  

| # | Situação | Letra |
|---|----------|-------|
| 1 | Sem `sep=";"`, a agenda inteira cai numa coluna só. | |
| 2 | `pd.read_json` monta uma linha por evento. | |
| 3 | A URL do IBGE responde 404. | |
| 4 | `status` veio `ok` e o contrato só aceita `confirmado`. | |
| 5 | O `id` 1 e o `evento_id` `a1` aparecem duas vezes. | |
| 6 | `extrair_csv`, `validar_agenda` e `relatar` são funções; `main` só chama. | |
| 7 | A rede caiu e o script leu `municipios_goias_amostra.json`, registrando o caminho. | |
| 8 | O colega já quer dar `INSERT` no PostgreSQL no mesmo arquivo. | |

---

## Atividade 5 — Paginação local (opcional)

**Tempo sugerido:** 15 minutos  
**Objetivo:** Juntar páginas de uma API, como no desenho da Aula 05-06.

A “API” abaixo está num arquivo. Escreva uma função que percorra a lista e pare quando `tem_proxima` for falso. Não chame a rede.

```python
paginas = [
    {
        "pagina": 1,
        "tem_proxima": True,
        "dados": [{"pedido_id": 90, "status": "pago"}],
    },
    {
        "pagina": 2,
        "tem_proxima": False,
        "dados": [{"pedido_id": 91, "status": "pago"}],
    },
]
```

**a)** Quantos pedidos a função devolve?

> 

**b)** O que aconteceria se o `break` fosse esquecido e ainda existisse uma página 3 depois de `tem_proxima: false`?

> 

---

## Para o professor — Gabarito e orientações

### Atividade 1

- Não iniciar a Atividade 3 com `import pandas` ou `import requests` falhando.
- Colab: lembrar upload da pasta `dados/` a cada sessão nova.
- Sem internet, a amostra de 3 municípios cumpre a API. O relatório precisa nomear o arquivo, não a URL.

### Atividade 2 — Resultados da amostra

| Item | Resposta |
|------|----------|
| a | **4 linhas e 5 colunas** |
| b | `Goiânia` lida como latin-1 aparece como **`GoiÃ¢nia`** |
| c | **Sim.** O valor repetido é **`a1`** |
| d | A linha `a2` **não tem** `unidade`. O contrato **não exige** o campo |
| e | HTTP **200**. A UF 52 tem **246** municípios na divisão vigente; aceitar o número impresso se o status for 200. Na amostra local, **3** |
| f | **Sim** (`5208707`) |
| g | Três avisos: **id duplicado**; **status `ok` fora do esquema**; **`atualizado_em` inválido** (`data-invalida`) |

`pd.to_datetime("data-invalida", errors="coerce")` produz valor nulo. Não usar a data `31/03/2026` como caso de erro: o pandas pode interpretá-la conforme a versão.

### Atividade 3 — Rubrica da entrega

| Critério | Atende |
|----------|--------|
| Três origens lidas | CSV com `;` e UTF-8, JSON e API ou contingência |
| Validação | Agenda aponta os três problemas; eventos apontam `a1` duplicado; municípios conferem `id` e `nome` |
| Relatório | Fonte, quantidade e erros das três origens |
| Organização | Funções de extrair, validar e relatar; `main` curto |
| Contingência | Falha de rede não derruba o script sem mensagem; a fonte usada aparece no relatório |
| Escopo | Não há carga em SGBD nem “correção silenciosa” que apague o `ok` e a duplicata |

Erros da agenda esperados no relatório:

- Há id duplicado
- Status fora do esquema: `ok`
- Há atualizado_em inválido

Erros dos eventos: `evento_id` `a1` duplicado. Ausência de `unidade` em `a2` não é erro.

Municípios pela API: quantidade coerente com a resposta (referência: 246) e Goiânia presente. Pela amostra: 3 registros, sem erro de esquema.

### Atividade 4 — Gabarito sugerido

| # | Resposta | Justificativa breve |
|---|----------|---------------------|
| 1 | **A** | Separador omitido |
| 2 | **B** | Leitura do arquivo JSON |
| 3 | **C** | HTTP 404 é falha de extração |
| 4 | **D** | Valor fora do contrato |
| 5 | **E** | Chave repetida nas duas amostras |
| 6 | **F** | Funções com uma responsabilidade |
| 7 | **G** | Arquivo local no lugar da API, com a origem declarada |
| 8 | **H** | Persistência é a próxima aula |

### Atividade 5 — Orientações

- **a)** 2 pedidos (`90` e `91`).
- **b)** Sem o `break`, a página 3 ainda seria lida. A flag deixa de valer e a extração ignora o fim anunciado pela API.

### Critérios rápidos de participação (qualitativo)

| Critério | Indicador |
|----------|-----------|
| Ambiente | Checklist completo antes da entrega |
| Evidência | Atividade 2 com quantidades e a lista de erros da agenda |
| Entrega | `extrair.py` roda e o relatório bate com a amostra |
| Escopo | Duplicata e `ok` aparecem como erro, não somem do arquivo |

---

## Referências

- Plano de Ensino — Ingestão de Dados (Escola do Futuro)
- PYTHON SOFTWARE FOUNDATION. *The Python Tutorial.* Disponível em: https://docs.python.org/3/tutorial/. Acesso em: 9 nov. 2026.
- PANDAS DEVELOPMENT TEAM. *pandas documentation.* Disponível em: https://pandas.pydata.org/docs/. Acesso em: 9 nov. 2026.
- REQUESTS. *Requests: HTTP for Humans.* Disponível em: https://requests.readthedocs.io/. Acesso em: 9 nov. 2026.
- IBGE. *API de localidades.* Disponível em: https://servicodados.ibge.gov.br/api/docs/localidades. Acesso em: 9 nov. 2026.

---

**UFG · SECTI · GOIÁS — O ESTADO QUE DÁ CERTO**
