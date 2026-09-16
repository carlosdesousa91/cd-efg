---
marp: true
theme: default
paginate: true
header: 'Escola do Futuro · Ciência de Dados'
footer: 'Ecossistema de Big Data · Aula 15-16'
style: |
  section { font-size: 28px; }
  h1 { color: #1a5276; }
  h2 { color: #2874a6; }
  code { font-size: 20px; }
---

<!-- _class: lead -->
# Ecossistema de Big Data

## Aula 15-16
### Processamento contínuo, tempo real e consulta near real-time

**Técnico em Ciência de Dados**  
Escola do Futuro · UFG / SECTI / Goiás

**Carga:** 4 horas

---

## Roteiro da aula (4h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 – 0:20 | Retomada do batch e objetivos de hoje |
| 0:20 – 1:00 | Batch × near real-time × real-time; características do streaming |
| 1:00 – 1:15 | **Intervalo** |
| 1:15 – 2:15 | Janelas de tempo + Spark Structured Streaming (lab introdutório) |
| 2:15 – 2:30 | **Intervalo** |
| 2:30 – 3:30 | Consulta near real-time no Elasticsearch + estudo de caso |
| 3:30 – 4:00 | Atividade formativa, questionário curto e encerramento |

---

## Objetivos da aula

Ao final, você será capaz de:

1. **Diferenciar** batch, near real-time e real-time
2. **Descrever** características do streaming e noções de **janelas de tempo**
3. **Experimentar** Spark Structured Streaming (nível introdutório) ou simulação com micro-batches
4. **Realizar** consulta **near real-time** no Elasticsearch
5. **Escolher** entre lote e tempo real com critérios claros

---

## Retomada — Aula 13-14

No projeto intermediário você:

- Montou um pipeline **batch** (I → T → Spark SQL → saída/ES)
- Registrou **métricas** de tempo e volume

**Pergunta de abertura (3 min):**

> Se o relatório precisa estar pronto *às 7h* com os dados de *ontem*, isso é batch ou tempo real? E se o suporte precisa achar um erro *agora*?

---

## Três ritmos de processamento

| Ritmo | Ideia | Latência típica | Exemplo |
|-------|-------|-----------------|---------|
| **Batch** | Processa um bloco fechado de dados | minutos–horas | Job noturno de vendas |
| **Near real-time** | Quase imediato (pequeno atraso ok) | segundos–poucos min | Painel que atualiza a cada 30s |
| **Real-time** | Resposta imediata ao evento | milissegundos–segundos | Fraude no pagamento / GPS ao vivo |

*No mercado, muita coisa chamada de “tempo real” é, na prática, **near real-time**.*

---

## Batch — reforço rápido

Características:

- Janela de dados **definida** (arquivo do dia, partição da hora)
- Roda sob **demanda** ou **agendamento**
- Bom para agregações pesadas e custos previsíveis
- Resultado “fecha” e depois é consumido

**Limite:** não serve bem quando a decisão não pode esperar o próximo job.

---

## Streaming — o que muda?

**Streaming** = dados chegam **continuamente** e o sistema processa **em fluxo**.

| Aspecto | Batch | Streaming |
|---------|-------|-----------|
| Entrada | Arquivo / tabela fechada | Eventos contínuos |
| Processamento | Job com início e fim | Job de longa duração |
| Estado | Frequentemente “reprocessa o bloco” | Pode manter estado ao longo do tempo |
| Falhas | Reexecutar o job | Precisa cuidar de checkpoint/retomada |

---

## Analogia didática

- **Batch:** contar todos os votos **no fim do dia**  
- **Near real-time:** atualizar o placar **a cada minuto**  
- **Real-time:** mostrar o voto **assim que a urna registra**

A escolha depende do **SLA do negócio**, não da ferramenta da moda.

---

## Janelas de tempo (noções)

Em streaming, muitas vezes agregamos por **janela**:

| Tipo (ideia) | Significado simples |
|--------------|---------------------|
| **Tumbling** | Janelas fixas sem sobreposição (ex.: cada 5 min) |
| **Sliding** | Janelas que deslizam (ex.: últimos 5 min a cada 1 min) |
| **Session** (visão) | Agrupa por “atividade” / pausa do usuário |

Exemplo de negócio:

> “Quantos erros por serviço **a cada 5 minutos**?”

---

## Spark Structured Streaming — introdução

Extensão do Spark para tratar fluxos quase como DataFrames.

Ideia central no lab:

```
fonte contínua (arquivos novos / socket / simulação)
        ↓
 transformações (filter, groupBy, janela…)
        ↓
 sink (console, memória, arquivos, ES…)
```

No curso: **nível introdutório** — entender o modelo e rodar um exemplo simples.

---

## Micro-batch (como o Spark costuma operar)

Structured Streaming frequentemente processa em **micro-lotes**:

- Chegam eventos → acumula um pedacinho → processa → emite resultado
- Parece contínuo para o usuário
- Facilita falhas/retomada e integração com o motor Spark

**Por isso** near real-time é o termo mais honesto em muitos demos de lab.

---

## Lab introdutório — opções

| Opção | Quando usar |
|-------|-------------|
| **Structured Streaming** lendo pasta (`text`/`json`) | Novos arquivos caem na pasta a cada X segundos |
| **Simulação com micro-batches** | Loop que relê CSV/JSON periodicamente |
| **Rate source** (se disponível na versão) | Gerar linhas sintéticas para demo |

*O professor indica a opção estável para a infraestrutura da turma.*

---

## Esqueleto conceitual (pasta de entrada)

```python
# Ideia (adaptar ao ambiente da aula)
stream_df = (spark.readStream
    .format("json")
    .schema(schema)
    .load("entrada_stream/"))

consulta = (stream_df
    .groupBy("servico")
    .count()
    .writeStream
    .outputMode("complete")
    .format("console")
    .start())
```

Depois: copiar novos arquivos JSON para `entrada_stream/` e observar a saída.

---

## Elasticsearch — consulta near real-time

Lembrete:

- Documento indexado fica **rapidamente** pesquisável (near real-time)
- Ideal para suporte, logs, busca textual, painéis de exploração
- Não é o melhor motor para ETL pesado contínuo de TB

Fluxo típico do lab:

1. Indexar (ou atualizar) documentos de eventos/erros  
2. Buscar com Query DSL **logo em seguida**  
3. Comparar a sensação de latência com um job batch  

---

## Padrão híbrido (muito comum)

```
Eventos ──► (opcional) stream / micro-batch Spark
                │
                ├──► agregados / arquivos (histórico)
                │
                └──► Elasticsearch ──► busca / Discover / alertas leves
```

**Batch** continua existindo para consolidação diária, reprocessamento e auditoria.

---

## Critérios: lote vs tempo real

Pergunte ao negócio:

1. Qual o **atraso máximo aceitável**?  
2. A decisão é **por evento** ou por **relatório periódico**?  
3. Qual o **custo** de manter um job 24/7?  
4. Precisa de **busca** rápida ou de **agregação** pesada?  
5. Quão grave é processar **duas vezes** o mesmo evento?

| Se… | Prefira |
|-----|---------|
| Relatório diário / consolidação | **Batch** |
| Busca/exploração imediata | **ES near real-time** |
| Contadores contínuos / painel ao vivo | **Streaming / micro-batch** |
| Fraude/pagamento com SLA rígido | Arquitetura **real-time** especializada |

---

## Estudo de caso — App de entregas

Demandas:

- **A)** Ranking diário de entregadores (faturamento)  
- **B)** Mapa com posição dos motoboys “quase ao vivo”  
- **C)** Suporte busca reclamações com “atraso” em segundos  
- **D)** Alerta se erros da API > 100 em 5 minutos  

**Discussão (8 min):** classifique cada demanda e sugira ferramenta.

---

## Atividade formativa (lab + ficha)

**Exercício 2–3 do caderno:**

1. Classificar cenários (batch / NRT / RT)  
2. Rodar demo de streaming **ou** simulação micro-batch  
3. Fazer busca near real-time no Elasticsearch  
4. Registrar latência percebida e conclusão  

Instrumentos do plano: **prática formativa** + **questionário curto**.

---

## Erros e armadilhas comuns

| Armadilha | Como evitar |
|-----------|-------------|
| Chamar tudo de “tempo real” | Usar batch / NRT / RT com latência explícita |
| Subir streaming sem necessidade | Começar com batch se o SLA permitir |
| Esquecer janela de tempo | Definir “a cada X minutos” no requisito |
| Só ES para agregação pesada histórica | ES para busca; Spark para ETL/histórico |
| Lab sem fonte contínua | Simular com arquivos novos / loop |

---

## Ligação com o projeto integrador

Nas Aulas **17–20** vocês vão:

- Especificar um problema realista  
- Escolher **quando** batch, stream/NRT e busca ES  
- Argumentar eficiência, escalabilidade e custo  

Hoje vocês ganham o vocabulário e a experiência mínima de streaming/NRT.

---

## Síntese da aula

Hoje você:

- Diferenciou **batch**, **near real-time** e **real-time**
- Compreendeu **streaming** e **janelas de tempo** (noções)
- Experimentou **Structured Streaming** ou micro-batches
- Praticou consulta **near real-time** no Elasticsearch
- Aplicou critérios de escolha lote × tempo real

**Próxima aula (17-18):** projeto integrador — especificação e desenvolvimento.

---

## Referências desta aula

- Plano de Ensino — Ecossistema de Big Data (Escola do Futuro)
- Apache Spark Structured Streaming Programming Guide
- ELASTIC. *Elasticsearch Guide* (near real-time search)
- WARREN, J.; MARZ, N. *Big Data.* Manning, 2015.

---

<!-- _class: lead -->
# Obrigado!

### Dúvidas?

Complete a **prática formativa** e o **questionário** do caderno.

Traga na próxima aula: ideia de problema para o **projeto integrador** (com latência desejada explícita).

**Escola do Futuro · Ciência de Dados**
