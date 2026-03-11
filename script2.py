import csv
from datetime import datetime

input_file = "dataset_inconsistente_clientes(in).csv"
output_file = "dados_corrigidos.csv"
log_file = "erros.txt"

# padronização de cidades
cidades_padrao = {
    "brasília": "Brasília",
    "brasilia": "Brasília",
    "curitiba": "Curitiba",
    "sao paulo": "São Paulo",
    "são paulo": "São Paulo"
}

def corrigir_data(data):
    formatos = ["%d/%m/%Y", "%Y-%m-%d"]
    for f in formatos:
        try:
            d = datetime.strptime(data, f)
            return d.strftime("%Y-%m-%d")
        except:
            pass
    return data

def corrigir_telefone(tel):
    return tel.replace(" ", "").replace("-", "")

def corrigir_cidade(cidade):
    c = cidade.lower().strip()
    return cidades_padrao.get(c, cidade)

with open(input_file, newline='', encoding='utf-8') as csvfile,\
     open(output_file, "w", newline='', encoding='utf-8') as out,\
     open(log_file, "w", encoding='utf-8') as log:

    reader = csv.reader(csvfile)
    writer = csv.writer(out)

    for linha in reader:

        if len(linha) < 6:
            log.write(f"Linha incompleta: {linha}\n")
            continue

        id_, nome, email, data, telefone, cidade = linha

        # verificar campos vazios
        if "" in linha:
            log.write(f"Campo vazio: {linha}\n")

        data_corrigida = corrigir_data(data)
        telefone_corrigido = corrigir_telefone(telefone)
        cidade_corrigida = corrigir_cidade(cidade)

        writer.writerow([
            id_,
            nome.strip(),
            email.strip(),
            data_corrigida,
            telefone_corrigido,
            cidade_corrigida
        ])

print("Processamento concluído.")
print("Arquivo corrigido:", output_file)
print("Relatório de erros:", log_file)