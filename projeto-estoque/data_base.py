import json

def salvar_dados(estoque):
    # função responsável por salvar os dados no estoque
    
    with open("estoque.json", "w", encoding="utf-8") as arquivo:
        json.dump(estoque, arquivo, indent=4, ensure_ascii=False)
 
       
def carregar_dados():
    # função responsável por carregar os dados vindos do arquivo estoque.json 
    # disponível neste projeto.    

    try:
        with open("estoque.json", "r", encoding="utf-8") as arquivo:
            return json.load(arquivo)

    except FileNotFoundError:
        return []