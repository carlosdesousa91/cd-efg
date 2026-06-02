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
    
    for item_da_lista_de_codigos in lista_de_codigos_dos_produtos:
        if item_da_lista_de_codigos == codigo:
            codigo = codigo + 1

    
    #Recebe os campos digitados pelo usuário.
    nome = input("digite o nome do produto ")
    
    quantidade = int(input("digite a quantidade de produtos "))
    while quantidade <= 0:
        print("error: a quantidade não pode ser menor ou igual a zero!")
        quantidade = int(input("digite a quantidade de produtos "))
    
    
    preco = float(input("digite o preço do produto "))
    while preco <= 0:
        print("error: O preço do produto deve ser maior que zero.")
        preco = float(input("digite o preço do produto "))

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

def atualizar_estoque():
    #
    #
    #
    pass

def produtos_baixo_estoque():
    lista_de_produtos = carregar_dados()
    for produto in lista_de_produtos:
        if int(produto["quantidade"]) <= 5:
            print("Produto com baixo estoque:")
            print("Código: ", produto["codigo"])
            print("Nome: ", produto["nome"])
            print("Quantidade: ", produto["quantidade"])
            print("Preço: ", produto["preco"])
            print("------------------------------------")

def remover_produto():
    lista_de_produtos = carregar_dados()
    id_do_produto_removido = input("digite o id do produto que deseja remover: ")
    for produto in lista_de_produtos:
        if id_do_produto_removido == produto["codigo"]:
            lista_de_produtos.remove(produto)

    salvar_dados(lista_de_produtos)
            
def atualizar_estoque():
    lista_de_produtos = carregar_dados()
    id_do_produto_removido = int(input("digite o id do produto que deseja atualizar: "))
    for produto in lista_de_produtos:
        if id_do_produto_removido == int(produto["codigo"]):
            #nome
            produto["nome"] = input("digite no novo nome para o produto.")
            #quantidate
            produto["quantidade"] = input("digite a nova quantidade de produtos.")
            #preco
            produto["preco"] = input("digite o novo preço do produto")
            
    salvar_dados(lista_de_produtos)

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
        elif opcao_escolhida == 5: 
            produtos_baixo_estoque()
        elif opcao_escolhida == 4:
            remover_produto()
        elif opcao_escolhida == 3:
            atualizar_estoque()
        

exibir_menu()
