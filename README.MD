Abaixo está um exemplo bem simples de login em Python usando PostgreSQL.

1. Instalar biblioteca
pip install psycopg2-binary bcrypt

2. Criar tabela no PostgreSQL
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha_hash TEXT NOT NULL
);

3. Código Python

import psycopg2
import bcrypt


def conectar():
    return psycopg2.connect(
        host="localhost",
        database="meu_banco",
        user="postgres",
        password="sua_senha",
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

Troque estes dados conforme seu PostgreSQL:

database="meu_banco",
user="postgres",
password="sua_senha"