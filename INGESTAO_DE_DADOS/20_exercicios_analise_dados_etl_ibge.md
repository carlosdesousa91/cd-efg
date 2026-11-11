# 20 Exercícios Práticos — Análise de Dados e ETL com Python e API do IBGE

**Nível:** iniciante  
**Ferramentas:** Python, `requests`, JSON e CSV; PostgreSQL opcional  
**Modalidade:** modificar o código original ou criar versões independentes  

## Objetivo

Atuar como analista de dados iniciante, extraindo, validando, transformando, analisando e carregando informações reais dos municípios brasileiros. Os exercícios abrangem as etapas **Extract, Transform e Load (ETL)**, a diferença para **ELT**, e a produção de indicadores e relatórios.

## Cenário

Uma empresa quer criar uma pequena base de municípios brasileiros para análises e relatórios. A fonte de dados é a API pública de localidades do IBGE.

## Código inicial

```python
import requests

URL = (
    "https://servicodados.ibge.gov.br"
    "/api/v1/localidades/estados/52/municipios"
)

resposta = requests.get(URL, timeout=20)
resposta.raise_for_status()
municipios = resposta.json()

print("Total de registros:", len(municipios))
print("Primeiro registro:", municipios[0])
```

O código `52` corresponde a Goiás. Os dados incluem ID, nome e informações geográficas aninhadas. Utilize principalmente Python e `requests`; as bibliotecas `json` e `csv` da instalação padrão são permitidas. **Não digite manualmente os resultados**: calcule-os com os dados obtidos da API.

---

## Parte 1 — Extração, inspeção e qualidade dos dados

### Exercício 1 — Inventário da fonte de dados
**Situação:** a equipe precisa conhecer a fonte antes de processar os registros.

**Tarefa:** extraia os municípios de Goiás e mostre: quantidade total de registros, primeiro município, último município e quantidade de campos do primeiro registro.

**Entrega:** relatório textual com esses quatro indicadores.  
**Para pensar:** por que verificar a estrutura e o volume antes de transformar?

### Exercício 2 — Extração de outro estado
**Situação:** a empresa quer ampliar a análise para São Paulo.

**Tarefa:** consulte os municípios de São Paulo (código `35`) e Goiás (`52`), conte os registros de cada estado e calcule a diferença.

**Entrega:** tabela comparativa com os dois totais e a diferença.  
**Para pensar:** como adaptar a URL sem duplicar todo o código?

### Exercício 3 — Criando uma base simplificada
**Situação:** o relatório não precisa de todos os campos da API.

**Tarefa:** crie uma nova lista de dicionários com somente `id`, `nome` e `uf` para cada município goiano. Obtenha `uf` da estrutura geográfica da resposta.

**Exemplo de formato:**

```python
{"id": 5200050, "nome": "Abadia de Goiás", "uf": "GO"}
```

**Entrega:** os cinco primeiros registros transformados e o total da nova lista.  
**Para pensar:** qual é o benefício de selecionar só os campos relevantes?

### Exercício 4 — Validando a qualidade dos dados
**Situação:** nomes ausentes não devem seguir para o relatório.

**Tarefa:** identifique registros com `nome` vazio, com apenas espaços ou `None`. Crie `municipios_validos` apenas com registros aprovados.

**Entrega:** quantidade de aprovados e de rejeitados.  
**Para pensar:** o que ocorreria se o campo `nome` estivesse ausente do dicionário?

### Exercício 5 — Verificando IDs duplicados
**Situação:** duplicidades podem distorcer os indicadores.

**Tarefa:** verifique se existem IDs repetidos na extração de Goiás. Compare quantidade total de registros, quantidade de IDs distintos e quantidade de ocorrências duplicadas.

**Entrega:** relatório de qualidade.  
**Dica:** use um conjunto (`set`). Não presuma o resultado.

---

## Parte 2 — Transformação e padronização

### Exercício 6 — Padronização dos nomes
**Situação:** a empresa exige nomes em maiúsculas no relatório.

**Tarefa:** preserve `nome` e acrescente `nome_padronizado`, usando `.upper()`.

**Entrega:** cinco registros com nome original e padronizado.

### Exercício 7 — Criando um indicador novo
**Situação:** o analista quer medir o tamanho dos nomes.

**Tarefa:** crie `tamanho_nome` com a quantidade de caracteres do nome e calcule a média para todos os municípios.

**Entrega:** cinco registros enriquecidos e média com duas casas decimais.  
**Para pensar:** como gerar uma variável analítica a partir de um campo textual?

### Exercício 8 — Classificando os registros
**Situação:** a equipe quer categorizar os nomes pelo tamanho.

**Tarefa:** crie `categoria_nome` segundo esta regra:

| Tamanho do nome | Categoria |
|---|---|
| Até 10 caracteres | Curto |
| 11 a 20 caracteres | Médio |
| Acima de 20 caracteres | Longo |

**Entrega:** quantidade de municípios por categoria e identificação da categoria mais frequente.

### Exercício 9 — Filtrando os dados
**Situação:** um relatório específico deve incluir nomes que contêm "Goiás".

**Tarefa:** crie uma lista apenas com registros cujo `nome` contém o texto `Goiás`, ignorando maiúsculas e minúsculas.

**Entrega:** nomes encontrados e total filtrado.  
**Para pensar:** o que muda entre comparar igualdade e procurar um trecho do texto?

### Exercício 10 — Enriquecimento geográfico
**Situação:** a empresa quer agrupar municípios por região brasileira.

**Tarefa:** crie registros simplificados com `id`, `nome`, `uf` e `regiao`, navegando pelos objetos geográficos aninhados retornados pela API.

**Entrega:** cinco registros completos da nova estrutura.  
**Regra:** não inserir manualmente a região ou a sigla.

---

## Parte 3 — Análise de dados e indicadores

### Exercício 11 — Comparação de três estados
**Situação:** o gerente deseja saber onde há mais municípios.

**Tarefa:** consulte Goiás (`52`), São Paulo (`35`) e Minas Gerais (`31`), conte os municípios por estado e identifique o maior total.

**Entrega:** relatório comparativo com os três totais e o estado com mais municípios.  
**Para pensar:** como reaproveitar a rotina de consulta com uma função?

### Exercício 12 — Participação percentual
**Situação:** além dos totais absolutos, o gerente deseja proporções.

**Tarefa:** usando os três estados anteriores, calcule a participação de cada estado na soma de seus municípios:

`percentual = quantidade_estado / quantidade_total * 100`

**Entrega:** estado, quantidade e percentual com duas casas decimais.  
**Para pensar:** por que os percentuais devem somar aproximadamente 100%?

### Exercício 13 — Ranking dos estados
**Situação:** o relatório deve apresentar um ranking.

**Tarefa:** monte uma lista de dicionários com `estado` e `total`, ordenada de forma decrescente pelo total.

**Entrega:** ranking numerado dos três estados.  
**Dica:** `sorted(..., key=..., reverse=True)`.

### Exercício 14 — Frequência das letras iniciais
**Situação:** a equipe quer analisar a distribuição das letras iniciais dos municípios goianos.

**Tarefa:** conte os nomes por primeira letra. Identifique a mais frequente e seu percentual do total de municípios.

**Entrega:** tabela de frequências e uma frase de conclusão.  
**Para pensar:** o que significa uma categoria ter maior frequência?

### Exercício 15 — Relatório executivo de qualidade e perfil
**Situação:** o gerente pediu um resumo único dos dados de Goiás.

**Tarefa:** apresente automaticamente: total de municípios; quantidade com nomes compostos (contendo espaço); média do tamanho dos nomes; município com nome mais longo; quantidade de nomes contendo `Goiás`; e total de ocorrências com IDs duplicados.

**Entrega:** relatório formatado no terminal.  
**Desafio:** separar os cálculos em funções.

---

## Parte 4 — Carga e pipelines ETL/ELT

### Exercício 16 — Exportação para CSV
**Situação:** outras equipes precisam utilizar os dados fora do Python.

**Tarefa:** gere `municipios_goias.csv` com colunas `id`, `nome`, `uf`, usando a biblioteca padrão `csv`.

**Exemplo de formato:**

```csv
id,nome,uf
5200050,Abadia de Goiás,GO
5200100,Abadiânia,GO
```

**Entrega:** arquivo CSV e contagem dos registros gravados.  
**Para pensar:** por que usar CSV para trocar dados entre ferramentas?

### Exercício 17 — Pipeline ETL completo
**Situação:** a equipe precisa automatizar a criação de uma base tratada.

**Tarefa:** implemente estas etapas:

1. **Extract:** obter os registros da API.
2. **Transform:** descartar nomes ausentes/vazios; remover IDs duplicados; padronizar os nomes em maiúsculas; adicionar `tamanho_nome`.
3. **Load:** gravar `municipios_tratados.csv`.

**Entrega:** CSV e relatório com registros extraídos, rejeitados e carregados.  
**Para pensar:** em qual momento os dados foram modificados?

### Exercício 18 — Comparação de dados brutos e tratados
**Situação:** é necessário verificar se a transformação descartou informações.

**Tarefa:** salve a resposta integral da API em `municipios_brutos.json`. Crie também `municipios_tratados.json`, com apenas `id`, `nome` padronizado e `uf`, após validação e remoção de duplicatas.

**Entrega:** os dois JSON e relatório com quantidades antes e depois do tratamento.  
**Para pensar:** por que preservar a versão original ajuda a auditar ou refazer o pipeline?

### Exercício 19 — Simulação de ELT
**Situação:** a equipe quer carregar os dados brutos antes de tratá-los.

**Tarefa:** execute a sequência:

1. **Extract:** consulte a API.
2. **Load:** grave a resposta sem alterações em `municipios_raw.json`.
3. **Transform:** leia o JSON salvo, valide e padronize os nomes.
4. Grave o resultado em `municipios_final.csv`.

**Entrega:** o arquivo bruto e o CSV final.  
**Para pensar:** como essa ordem difere do exercício 17? Trata-se de uma **simulação didática de ELT** usando arquivos; em sistemas reais, a transformação após a carga costuma ocorrer no banco ou na plataforma de dados.

### Exercício 20 — Projeto final: mini data pipeline do IBGE
**Situação:** a empresa quer automatizar um relatório comparativo de três estados.

**Tarefa:** construa um script que:

1. Consulte os municípios de Goiás, São Paulo e Minas Gerais.
2. Valide nomes e IDs e descarte duplicidades.
3. Crie a base consolidada com `id`, `nome`, `uf` e `tamanho_nome`.
4. Salve `municipios_consolidados.csv`.
5. Mostre um relatório com total por estado, ranking, percentuais e total de registros rejeitados.

**Entrega:** script Python, CSV consolidado e relatório exibido no terminal.  
**Desafio:** escrever uma função `executar_etl(codigo_estado, sigla)` para reutilização com outros estados.

---

## Organização sugerida

| Etapa | Exercícios | Habilidades |
|---|---|---|
| Extração e inspeção | 1–5 | API, listas, dicionários, validação |
| Transformação | 6–10 | Padronização, filtros e enriquecimento |
| Análise | 11–15 | Agregação, percentuais, rankings e relatórios |
| Carga e integração | 16–19 | CSV, JSON, ETL e ELT |
| Projeto final | 20 | Pipeline e análise completos |

### Critérios de avaliação

- O programa executa sem erros.
- Os resultados são derivados da API, sem totais fixados no código.
- Os filtros, validações e transformações estão corretos.
- Os relatórios são legíveis e respondem ao problema de negócio.
- Os arquivos solicitados são gerados corretamente.

**Sugestão pedagógica:** cada exercício pode ser resolvido em um script `.py` separado; os exercícios 16–20 também devem incluir os arquivos de saída.

## Extensão opcional — ETL versus ELT no PostgreSQL

Uma turma que já utiliza SQL pode substituir os arquivos por duas tabelas:

```sql
CREATE TABLE municipios_raw (
    id INTEGER,
    nome TEXT,
    uf VARCHAR(2)
);

CREATE TABLE municipios_tratados (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    uf VARCHAR(2),
    tamanho_nome INTEGER
);
```

No **ETL**, o Python trata os registros antes de inserir em `municipios_tratados`. No **ELT**, o Python insere inicialmente em `municipios_raw`, e o PostgreSQL faz a transformação:

```sql
INSERT INTO municipios_tratados (id, nome, uf, tamanho_nome)
SELECT DISTINCT ON (id)
    id,
    UPPER(TRIM(nome)),
    uf,
    LENGTH(TRIM(nome))
FROM municipios_raw
WHERE id IS NOT NULL
  AND nome IS NOT NULL
  AND TRIM(nome) <> ''
ORDER BY id;
```

> Para repetir o experimento, limpe as tabelas ou trate conflitos de chave primária antes de uma nova carga.

**Referência:** [Documentação da API de Localidades do IBGE](https://servicodados.ibge.gov.br/api/docs/localidades).

**Observação:** a API de localidades fornece informações administrativas e geográficas, mas não indicadores como população, renda ou PIB. Para tais análises, seriam necessárias outras fontes.
