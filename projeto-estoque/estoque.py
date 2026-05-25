from data_base import salvar_dados, carregar_dados

def listar_produtos():
    lista_de_produtos = carregar_dados()
    print(lista_de_produtos)

def cadastrar_produto():
    codigo = input("digite o código do produto ")
    nome = input("digite o nome do produto ")
    quantidade = input("digite a quantidade de produtos ")
    preco = input("digite o preço do produto ")
    # print("produto cadastrado com sucesso: ", codigo, nome, quantidade, preco)
    produtos = [{
        "codigo": codigo,
        "nome": nome,
        "quantidade": quantidade,
        "preco": preco
    }]
    salvar_dados(produtos)
    print("produto cadastrado com sucesso!")

def exibir_menu():
    
    opcao_escolhida = 0
    while opcao_escolhida != 6:
        print("===== SISTEMA DE ESTOQUE =====")
        print("1 - Cadastrar produto")
        print("2 - Listar produtos")
        print("3 - Atualizar estoque")
        print("4 - Remover produto")
        print("5 - Ver produtos com baixo estoque")
        print("6 - Sair")
        opcao_escolhida = int(input())
        
        # cadastrar o produto
        if opcao_escolhida == 1:          
            cadastrar_produto()
        elif opcao_escolhida == 2: 
            listar_produtos()
        


exibir_menu()
