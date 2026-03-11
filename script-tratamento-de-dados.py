import pandas as pd
import re
import datetime

# 1. Carregar os dados
# Substitua 'dados.csv' pelo nome do seu arquivo
df = pd.read_csv('dataset_inconsistente_clientes(in).csv')

def limpar_telefone(txt):
    if pd.isna(txt): return "Não informado"
    # Remove tudo que não é número
    nums = re.sub(r'\D', '', str(txt))
    # Padroniza (ex: coloca espaço ou máscara se desejar)
    return f"({nums[:2]}) {nums[2:7]}-{nums[7:]}" if len(nums) >= 10 else nums

def corrigir_data(data):
    formatos = ["%d/%m/%Y", "%Y-%m-%d"]
    for f in formatos:
        try:
            d = datetime.strptime(data, f)
            return d.strftime("%Y-%m-%d")
        except:
            pass
    return data

# 2. Corrigir os dados
# Preencher campos vazios
df.fillna({'email': 'sem_email@contato.com', 'telefone': '0'}, inplace=True)

# Padronizar Telefones (limpar espaços e caracteres especiais)
df['telefone'] = df['telefone'].apply(limpar_telefone)

# Converter datas para o formato correto (identifica erros automaticamente)
df['data_cadastro'] = corrigir_data(df['data_cadastro'])


print(df)