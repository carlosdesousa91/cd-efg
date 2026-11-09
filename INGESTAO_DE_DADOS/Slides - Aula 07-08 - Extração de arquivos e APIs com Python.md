---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ingestão de Dados · Aula 07-08'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
  code { font-size: 20px; }
---

<!-- _class: lead -->
# Ingestão de Dados

## Aula 07-08
### Extração de arquivos e APIs com Python

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada da Aula 05-06 e objetivos de hoje |
| 0:20 – 0:40 | Ambiente: Python, pandas e requests |
| 0:40 – 1:15 | Leitura de CSV e de JSON |
| 1:15 – 1:30 | **Intervalo** |
| 1:30 – 2:15 | Validação de esquema e de tipos |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:15 | API, erros de extração e organização do script |
| 3:15 – 4:00 | Exercício prático, entrega e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Ler** CSV e JSON com Python
2. **Requisitar** uma API e tratar falha de extração
3. **Validar** colunas, tipos e valores aceitos
4. **Organizar** o script em funções, com um relatório da extração
5. **Entregar** a evidência do que foi lido, sem carregar em banco

---

## Retomada — Aula 05-06

Na aula anterior, você desenhou:

```text
Fonte → Extração → Carga → Destino
```

**Hoje só a extração sai do papel.** A carga no SGBD é a Aula 09-10.

**Pergunta de abertura (3 min):**

> No CSV da agenda, o `id` 1 vinha duas vezes e a cidade podia aparecer como `GoiÃ¢nia`. O script deve **corrigir em silêncio** ou **avisar** o que encontrou?

---

## O que o script de extração faz

| Faz hoje | Fica para a frente |
|----------|--------------------|
| Abrir arquivo ou chamar API | Gravar no PostgreSQL / MariaDB |
| Contar o que chegou | Agendar a execução |
| Conferir esquema e tipos | Escolher ETL ou ELT de novo |
| Registrar erro de leitura | Limpar e padronizar o conteúdo |

O produto desta aula é um **relatório de extração**: fonte, quantidade e lista de problemas.

---

## Ambiente do laboratório

| Peça | Uso nesta aula |
|------|----------------|
| Python 3.x | Executar o script |
| pandas | Ler CSV e JSON em tabela |
| requests | Chamar a API |
| Jupyter, VS Code ou Colab | Onde escrever e rodar |

```bash
python --version
pip install pandas requests
```

O professor indica se a turma usa o laboratório, o Jupyter ou o Colab.

---

## Checklist antes de codificar

1. `python` abre a versão 3
2. `import pandas` e `import requests` funcionam
3. A pasta `dados/` está ao lado do script
4. `agenda.csv` e `eventos.json` estão nessa pasta
5. Há internet para a API do IBGE — ou o JSON de contingência

**Atividade:** preencher o checklist (Atividade 1) do caderno.

---

## Onde o código fica

```text
aula_07_08/
  dados/
    agenda.csv
    eventos.json
    municipios_goias_amostra.json
  extrair.py
```

- `dados/` guarda a origem
- `extrair.py` só lê e valida
- Nada de senha de banco neste arquivo

---

## CSV com pandas

A agenda usa **`;`** e **UTF-8**, como na aula passada.

```python
from pathlib import Path
import pandas as pd

caminho = Path("dados/agenda.csv")
agenda = pd.read_csv(caminho, sep=";", encoding="utf-8")
print(agenda.shape)
print(list(agenda.columns))
agenda.head()
```

`shape` devolve `(linhas, colunas)`. O cabeçalho vira nome de coluna.

---

## Quando o CSV “quebra”

| Sintoma | Causa provável | Ajuste |
|---------|----------------|--------|
| Uma coluna só, com `;` no meio | Separador omitido | `sep=";"` |
| `GoiÃ¢nia` | UTF-8 lido como latin-1 | `encoding="utf-8"` |
| `UnicodeDecodeError` | Arquivo em outra codificação | Testar `latin-1` e registrar |
| `FileNotFoundError` | Pasta ou nome errado | Conferir `Path` |

```python
if not caminho.exists():
    raise FileNotFoundError(f"Arquivo não encontrado: {caminho}")
```

---

## JSON de eventos

Lista de objetos → uma linha por evento.

```python
eventos = pd.read_json(Path("dados/eventos.json"))
print(eventos.columns.tolist())
print(len(eventos))
```

Campo que falta num objeto (a `unidade` do checkout) chega vazio. Isso é esquema: obrigatório ou opcional.

---

## Contrato da agenda

| Campo | Regra |
|-------|--------|
| `id` | Número, sem repetir |
| `nome`, `cidade` | Texto |
| `status` | Somente `confirmado` |
| `atualizado_em` | Data em `AAAA-MM-DD` |

`ok` é o mesmo fato em outra palavra. Nesta aula o script **aponta** o valor fora do contrato. A padronização entra no pipeline ETL.

---

## Validar colunas e tipos

```python
COLUNAS = ["id", "nome", "cidade", "status", "atualizado_em"]
STATUS_ACEITOS = {"confirmado"}

def validar_agenda(df: pd.DataFrame) -> list[str]:
    erros = []
    faltando = [c for c in COLUNAS if c not in df.columns]
    if faltando:
        return [f"Colunas ausentes: {faltando}"]
    if not pd.api.types.is_numeric_dtype(df["id"]):
        erros.append("id não é numérico")
    if df["id"].duplicated().any():
        erros.append("Há id duplicado")
    fora = set(df["status"].dropna()) - STATUS_ACEITOS
    if fora:
        erros.append(f"Status fora do esquema: {sorted(fora)}")
    datas = pd.to_datetime(df["atualizado_em"], errors="coerce")
    if datas.isna().any():
        erros.append("Há atualizado_em inválido")
    return erros
```

A função **devolve a lista**. Quem chama decide se interrompe ou segue.

---

## Relatório da extração

Cada fonte imprime o mesmo bloco:

```text
Fonte: dados/agenda.csv
Registros lidos: 4
Erros:
- Há id duplicado
- Status fora do esquema: ['ok']
- Há atualizado_em inválido
```

```python
def relatar(fonte: str, quantidade: int, erros: list[str]) -> None:
    print(f"Fonte: {fonte}")
    print(f"Registros lidos: {quantidade}")
    if erros:
        print("Erros:")
        for erro in erros:
            print(f"- {erro}")
    else:
        print("Erros: nenhum")
```

Esse texto é a evidência da entrega.

---

## API — pedir o dado

Municípios de Goiás (UF `52`), sem chave de acesso:

```python
import requests

URL = (
    "https://servicodados.ibge.gov.br"
    "/api/v1/localidades/estados/52/municipios"
)

resposta = requests.get(URL, timeout=20)
resposta.raise_for_status()
municipios = resposta.json()
print(len(municipios))
print(municipios[0]["nome"])
```

`timeout=20` impede a espera infinita. `raise_for_status()` acusa HTTP 4xx e 5xx.

---

## Erros de extração na API

```python
def extrair_api(url: str) -> list:
    try:
        resposta = requests.get(url, timeout=20)
        resposta.raise_for_status()
        dados = resposta.json()
    except requests.Timeout:
        print("A API não respondeu a tempo.")
        raise
    except requests.HTTPError as erro:
        codigo = erro.response.status_code
        print(f"A API recusou a extração: {codigo}")
        raise
    except requests.RequestException as erro:
        print(f"Falha de rede na extração: {erro}")
        raise
    if not isinstance(dados, list):
        raise ValueError("A resposta não é uma lista de municípios")
    return dados
```

O `except` mais específico vem **antes** do `RequestException`.

---

## Sem internet: contingência

Se a rede do laboratório bloquear o IBGE, leia o arquivo local e **registre a troca de fonte**.

```python
def extrair_municipios() -> tuple[list, str]:
    try:
        return extrair_api(URL), URL
    except requests.RequestException:
        reserva = Path("dados/municipios_goias_amostra.json")
        dados = pd.read_json(reserva).to_dict(orient="records")
        return dados, str(reserva)
```

O relatório mostra a URL **ou** o caminho do arquivo. A origem real fica visível.

---

## Esquema mínimo da API

Cada município precisa de `id` numérico e `nome` texto.

```python
def validar_municipios(dados: list) -> list[str]:
    erros = []
    for item in dados:
        if "id" not in item or "nome" not in item:
            erros.append("Item sem id ou nome")
            break
        if not isinstance(item["id"], int):
            erros.append("id do município não é inteiro")
            break
        if not isinstance(item["nome"], str) or not item["nome"].strip():
            erros.append("nome do município vazio")
            break
    return erros
```

Na lista oficial, confira se Goiânia (`id` **5208707**) aparece.

---

## Organização do `extrair.py`

```text
1. imports
2. constantes (caminhos, URL, colunas, status aceitos)
3. extrair_csv / extrair_json / extrair_api
4. validar_agenda / validar_eventos / validar_municipios
5. relatar
6. main — só chama as funções e imprime
7. if __name__ == "__main__": main()
```

Uma função, uma origem. `main` não mistura leitura, regra e frase de erro no mesmo bloco.

---

## `main` enxuto

```python
def main() -> None:
    agenda = extrair_csv(Path("dados/agenda.csv"))
    relatar("dados/agenda.csv", len(agenda), validar_agenda(agenda))

    eventos = extrair_json(Path("dados/eventos.json"))
    relatar("dados/eventos.json", len(eventos), validar_eventos(eventos))

    municipios, fonte = extrair_municipios()
    relatar(fonte, len(municipios), validar_municipios(municipios))


if __name__ == "__main__":
    main()
```

Rodar `python extrair.py` executa `main`. Importar o arquivo para um teste não dispara a extração sozinho.

---

## Prática guiada (Atividade 2)

No laboratório, nesta ordem:

1. Ler `agenda.csv` com `sep=";"` e `encoding="utf-8"`
2. Ler o mesmo arquivo com `encoding="latin-1"` e observar `Goiânia`
3. Ler `eventos.json` e localizar o `evento_id` repetido
4. Chamar a API do IBGE (ou a amostra local)
5. Rodar `validar_agenda` e anotar a lista de erros

Anote quantidades e erros no caderno. Eles conferem a entrega.

---

## Exercício prático (Atividade 3)

Entregar `extrair.py` (ou notebook equivalente) que:

1. Lê as três origens
2. Valida o contrato de cada uma
3. Imprime o relatório (fonte, quantidade, erros)
4. Está organizado em funções
5. Troca para o JSON local se a API falhar, dizendo qual fonte usou

Dupla permitida. Os dois nomes no caderno e no topo do script.

---

## Erros que valem ponto

O relatório da agenda, com a amostra do caderno, deve citar:

- `id` duplicado
- `status` `ok` fora do contrato
- `atualizado_em` inválido (`data-invalida`)

Esconder o erro para “o script passar” zera a evidência. Extração boa **mostra** o problema.

---

## Fixação — Exercício 4 (10 min)

| Situação | Conceito |
|----------|----------|
| A) `sep` omitido e o CSV vira uma coluna só | ( ) Separador ( ) API |
| B) HTTP 404 na URL do IBGE | ( ) Erro de extração ( ) Duplicidade |
| C) `status` igual a `ok` | ( ) Fora do esquema ( ) Timeout |
| D) Funções `extrair_` e `validar_` separadas | ( ) Organização ( ) Carga no banco |

*Gabarito no caderno de exercícios.*

---

## Síntese da aula

Hoje você:

- Leu **CSV** e **JSON** com pandas
- Chamou uma **API** com timeout e tratou falha de rede
- Validou **colunas, tipos e valores**
- Organizou o script e imprimiu o **relatório de extração**
- Deixou a carga no banco para a próxima aula

**Próxima aula (09-10):** levar o que foi extraído para um SGBD relacional e conferir com SQL.

---

## Referências desta aula

- Plano de Ensino — Ingestão de Dados (Escola do Futuro)
- PYTHON SOFTWARE FOUNDATION. *The Python Tutorial.* https://docs.python.org/3/tutorial/
- PANDAS DEVELOPMENT TEAM. *pandas documentation.* https://pandas.pydata.org/docs/
- REQUESTS. *Requests: HTTP for Humans.* https://requests.readthedocs.io/
- IBGE. *API de localidades.* https://servicodados.ibge.gov.br/api/docs/localidades

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Entregue o **`extrair.py`** e as **Atividades 1, 2 e 3** do caderno.

Na próxima aula, traga o relatório impresso ou salvo. Ele diz o que está pronto para carregar — e o que ainda fere o esquema.

**Escola do Futuro · Ciência de Dados**
