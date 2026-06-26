import psycopg2
import bcrypt


def conectar():
    return psycopg2.connect(
        host="localhost",
        database="db-test",
        user="postgres",
        password="123",
        port="5432"
    )



def cadastrar_usuario(nome, email, senha):
    conn = conectar()
    cursor = conn.cursor()

    senha_hash = bcrypt.hashpw(senha.encode("utf-8"), bcrypt.gensalt())

    try:
        cursor.execute("""
            INSERT INTO usuarios (nome, email, senha_hash)
            VALUES (%s, %s, %s)
        """, (nome, email, senha_hash.decode("utf-8")))

        conn.commit()
        print("Usuário cadastrado com sucesso!")

    except psycopg2.errors.UniqueViolation:
        conn.rollback()
        print("Este e-mail já está cadastrado.")

    finally:
        cursor.close()
        conn.close()


def login(email, senha):
    conn = conectar()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT id, nome, senha_hash
        FROM usuarios
        WHERE email = %s
    """, (email,))

    usuario = cursor.fetchone()

    cursor.close()
    conn.close()

    if usuario is None:
        print("Usuário não encontrado.")
        return False

    id_usuario, nome, senha_hash = usuario
    
    if bcrypt.checkpw(senha.encode("utf-8"), senha_hash.encode("utf-8")):
        print(f"Login realizado com sucesso! Bem-vindo, {nome}.")
        return True
    else:
        print("Senha incorreta.")
        return False


while True:
    print("\n=== SISTEMA DE LOGIN ===")
    print("1 - Cadastrar usuário")
    print("2 - Login")
    print("3 - Sair")

    opcao = input("Escolha uma opção: ")

    if opcao == "1":
        nome = input("Nome: ")
        email = input("E-mail: ")
        senha = input("Senha: ")

        cadastrar_usuario(nome, email, senha)

    elif opcao == "2":
        email = input("E-mail: ")
        senha = input("Senha: ")

        login(email, senha)

    elif opcao == "3":
        print("Saindo...")
        break

    else:
        print("Opção inválida.")