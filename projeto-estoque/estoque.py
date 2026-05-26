from data_base import salvar_dados, carregar_dados

def listar_produtos():
    lista_de_produtos = carregar_dados()
    #print(lista_de_produtos)
    for produto in lista_de_produtos:
        print("######## Lista de produtos ########")
        print("Código: ", produto["codigo"])
        print("Nome: ", produto["nome"])
        print("Quantidade: ", produto["quantidade"])
        print("Preço: ", produto["preco"])
        print("------------------------------------")

def cadastrar_produto():
    
    # Confere se o código já está em uso.
    todos_os_dados_dos_produtos = carregar_dados()
    lista_de_codigos_dos_produtos = []
    for produto_um_por_um in todos_os_dados_dos_produtos:
        lista_de_codigos_dos_produtos.append(produto_um_por_um['codigo'])
    
    #codigo = input("digite o código do produto ")
    # Cria o código automaticamente.
    quantidade_de_produtos = len(carregar_dados())
    codigo = quantidade_de_produtos + 1 

    
    #Recebe os campos digitados pelo usuário.
    nome = input("digite o nome do produto ")
    quantidade = input("digite a quantidade de produtos ")
    preco = input("digite o preço do produto ")

    produtos = carregar_dados()
    produtos.append(
        {
            "codigo": codigo,
            "nome": nome,
            "quantidade": quantidade,
            "preco": preco
        }
    )    
    
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
