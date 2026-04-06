-- CREATE TABLES

CREATE TABLE clientes (
    id_cliente INT,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2)
);

CREATE TABLE produtos (
    id_produto INT,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco NUMERIC
);

CREATE TABLE vendas (
    id_venda INT,
    id_cliente INT,
    id_produto INT,
    data_venda DATE,
    quantidade INT,
    valor_total NUMERIC
);

-- INSERT CLIENTES
INSERT INTO clientes VALUES (1, 'Cliente 1', 'Brasília', 'DF');
INSERT INTO clientes VALUES (2, 'Cliente 2', 'Rio de Janeiro', 'SP');
INSERT INTO clientes VALUES (3, 'Cliente 3', 'São Paulo', 'SP');
INSERT INTO clientes VALUES (4, 'Cliente 4', 'Brasília', 'BA');
INSERT INTO clientes VALUES (5, 'Cliente 5', 'Brasília', 'BA');
INSERT INTO clientes VALUES (6, 'Cliente 6', 'Belo Horizonte', 'DF');
INSERT INTO clientes VALUES (7, 'Cliente 7', 'Brasília', 'DF');
INSERT INTO clientes VALUES (8, 'Cliente 8', 'São Paulo', 'SP');
INSERT INTO clientes VALUES (9, 'Cliente 9', 'Salvador', 'BA');
INSERT INTO clientes VALUES (10, 'Cliente 10', 'Brasília', 'BA');
INSERT INTO clientes VALUES (11, 'Cliente 11', 'São Paulo', 'BA');
INSERT INTO clientes VALUES (12, 'Cliente 12', 'Belo Horizonte', 'SP');
INSERT INTO clientes VALUES (13, 'Cliente 13', 'Belo Horizonte', 'BA');
INSERT INTO clientes VALUES (14, 'Cliente 14', 'Rio de Janeiro', 'DF');
INSERT INTO clientes VALUES (15, 'Cliente 15', 'São Paulo', 'MG');
INSERT INTO clientes VALUES (16, 'Cliente 16', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes VALUES (17, 'Cliente 17', 'São Paulo', 'SP');
INSERT INTO clientes VALUES (18, 'Cliente 18', 'Rio de Janeiro', 'DF');
INSERT INTO clientes VALUES (19, 'Cliente 19', 'Brasília', 'MG');
INSERT INTO clientes VALUES (20, 'Cliente 20', 'Brasília', 'RJ');
-- INSERT PRODUTOS
INSERT INTO produtos VALUES (1, 'Produto 1', 'Roupas', 305.83);
INSERT INTO produtos VALUES (2, 'Produto 2', 'Eletrônicos', 367.57);
INSERT INTO produtos VALUES (3, 'Produto 3', 'Alimentos', 71.16);
INSERT INTO produtos VALUES (4, 'Produto 4', 'Roupas', 48.61);
INSERT INTO produtos VALUES (5, 'Produto 5', 'Roupas', 416.41);
INSERT INTO produtos VALUES (6, 'Produto 6', 'Alimentos', 443.87);
INSERT INTO produtos VALUES (7, 'Produto 7', 'Roupas', 292.9);
INSERT INTO produtos VALUES (8, 'Produto 8', 'Alimentos', 44.08);
INSERT INTO produtos VALUES (9, 'Produto 9', 'Alimentos', 121.67);
INSERT INTO produtos VALUES (10, 'Produto 10', 'Roupas', 492.76);
INSERT INTO produtos VALUES (1, 'Produto 1', 'Roupas', 305.83);
-- INSERT VENDAS
INSERT INTO vendas VALUES (1, 15, 6, '2025-01-21', 1, 869.15);
INSERT INTO vendas VALUES (2, 3, 10, '2025-03-23', 2, 368.17);
INSERT INTO vendas VALUES (3, 15, 7, '2025-02-04', 1, 543.46);
INSERT INTO vendas VALUES (4, 2, 4, '2025-01-05', 5, 235.22);
INSERT INTO vendas VALUES (5, 19, 6, '2025-01-28', 2, NULL);
INSERT INTO vendas VALUES (6, 15, 3, '2025-02-03', 3, 407.72);
INSERT INTO vendas VALUES (7, 9, 10, '2025-02-24', 1, 261.69);
INSERT INTO vendas VALUES (8, 5, 9, '2025-03-05', 5, 411.41);
INSERT INTO vendas VALUES (9, 5, 3, '2025-03-29', 0, 760.67);
INSERT INTO vendas VALUES (10, 20, 8, '2025-03-09', 3, 604.48);
INSERT INTO vendas VALUES (11, 1, 2, '2025-03-29', 2, 971.66);
INSERT INTO vendas VALUES (12, 11, 2, '2025-02-07', 5, 755.86);
INSERT INTO vendas VALUES (13, 9, 9, '2025-01-23', 3, NULL);
INSERT INTO vendas VALUES (14, 10, 9, '2025-03-19', 5, 914.38);
INSERT INTO vendas VALUES (15, 18, 9, '2025-01-01', 1, 169.78);
INSERT INTO vendas VALUES (16, 12, 5, '2025-01-31', 5, NULL);
INSERT INTO vendas VALUES (17, 3, 2, '2025-03-04', 0, 256.05);
INSERT INTO vendas VALUES (18, 5, 3, '2025-03-26', 0, 978.42);
INSERT INTO vendas VALUES (19, 17, 10, '2025-02-24', 3, 947.91);
INSERT INTO vendas VALUES (20, 7, 5, '2025-02-21', 1, 930.34);
INSERT INTO vendas VALUES (21, 4, 4, '2025-01-29', 2, 449.34);
INSERT INTO vendas VALUES (22, 8, 10, '2025-01-29', 0, 351.32);
INSERT INTO vendas VALUES (23, 8, 2, '2025-01-05', 0, 89.57);
INSERT INTO vendas VALUES (24, 16, 4, '2025-03-11', 2, 89.44);
INSERT INTO vendas VALUES (25, 19, 8, '2025-02-01', 1, 728.89);
INSERT INTO vendas VALUES (26, 4, 7, '2025-02-15', 3, 811.35);
INSERT INTO vendas VALUES (27, 2, 2, '2025-01-08', 3, 422.88);
INSERT INTO vendas VALUES (28, 4, 4, '2025-01-25', 3, 733.65);
INSERT INTO vendas VALUES (29, 6, 5, '2025-03-01', 1, 545.56);
INSERT INTO vendas VALUES (30, 18, 2, '2025-01-07', 1, NULL);
INSERT INTO vendas VALUES (31, 8, 3, '2025-02-22', 5, 839.31);
INSERT INTO vendas VALUES (32, 2, 3, '2025-02-18', 3, 491.73);
INSERT INTO vendas VALUES (33, 15, 5, '2025-02-24', 0, 985.6);
INSERT INTO vendas VALUES (34, 7, 5, '2025-01-28', 5, 668.63);
INSERT INTO vendas VALUES (35, 11, 1, '2025-01-07', 0, 587.6);
INSERT INTO vendas VALUES (36, 17, 3, '2025-01-08', 5, 487.25);
INSERT INTO vendas VALUES (37, 20, 2, '2025-03-28', 5, 98.51);
INSERT INTO vendas VALUES (38, 19, 4, '2025-03-16', 1, 415.7);
INSERT INTO vendas VALUES (39, 19, 10, '2025-03-08', 5, NULL);
INSERT INTO vendas VALUES (40, 11, 4, '2025-02-03', 2, 936.01);
INSERT INTO vendas VALUES (41, 15, 6, '2025-01-10', 3, 148.26);
INSERT INTO vendas VALUES (42, 4, 2, '2025-03-10', 0, 469.12);
INSERT INTO vendas VALUES (43, 12, 2, '2025-02-01', 1, 515.77);
INSERT INTO vendas VALUES (44, 18, 5, '2025-03-20', 2, 299.29);
INSERT INTO vendas VALUES (45, 10, 2, '2025-01-18', 5, 27.67);
INSERT INTO vendas VALUES (46, 18, 3, '2025-02-04', 2, 133.12);
INSERT INTO vendas VALUES (47, 7, 5, '2025-03-06', 2, 612.73);
INSERT INTO vendas VALUES (48, 2, 2, '2025-03-23', 3, 266.1);
INSERT INTO vendas VALUES (49, 11, 3, '2025-03-23', 3, NULL);
INSERT INTO vendas VALUES (50, 14, 9, '2025-01-02', 2, 178.35);
INSERT INTO vendas VALUES (51, 5, 9, '2025-01-05', 0, 93.74);
INSERT INTO vendas VALUES (52, 5, 1, '2025-02-09', 2, 590.86);
INSERT INTO vendas VALUES (53, 2, 6, '2025-01-27', 2, 901.0);
INSERT INTO vendas VALUES (54, 18, 7, '2025-03-21', 1, 673.59);
INSERT INTO vendas VALUES (55, 6, 3, '2025-02-22', 1, 927.25);
INSERT INTO vendas VALUES (56, 14, 4, '2025-02-04', 0, 195.77);
INSERT INTO vendas VALUES (57, 2, 8, '2025-01-29', 1, 791.63);
INSERT INTO vendas VALUES (58, 10, 4, '2025-01-29', 1, 820.25);
INSERT INTO vendas VALUES (59, 9, 2, '2025-02-05', 0, 666.83);
INSERT INTO vendas VALUES (60, 18, 6, '2025-01-04', 2, 648.65);
INSERT INTO vendas VALUES (61, 19, 5, '2025-01-05', 0, 879.5);
INSERT INTO vendas VALUES (62, 11, 7, '2025-03-19', 0, 604.64);
INSERT INTO vendas VALUES (63, 7, 5, '2025-01-06', 5, 133.33);
INSERT INTO vendas VALUES (64, 18, 4, '2025-02-16', 3, 21.66);
INSERT INTO vendas VALUES (65, 11, 10, '2025-02-10', 3, 88.57);
INSERT INTO vendas VALUES (66, 10, 7, '2025-02-11', 0, 725.36);
INSERT INTO vendas VALUES (67, 7, 7, '2025-03-27', 3, 703.26);
INSERT INTO vendas VALUES (68, 20, 10, '2025-02-08', 3, 683.77);
INSERT INTO vendas VALUES (69, 10, 4, '2025-02-25', 3, NULL);
INSERT INTO vendas VALUES (70, 15, 8, '2025-03-28', 5, 614.53);
INSERT INTO vendas VALUES (71, 6, 2, '2025-02-06', 1, 520.95);
INSERT INTO vendas VALUES (72, 3, 4, '2025-03-28', 5, 670.58);
INSERT INTO vendas VALUES (73, 1, 1, '2025-02-01', 2, 240.15);
INSERT INTO vendas VALUES (74, 15, 7, '2025-03-22', 3, 619.05);
INSERT INTO vendas VALUES (75, 16, 7, '2025-02-01', 5, 210.55);
INSERT INTO vendas VALUES (76, 4, 7, '2025-01-29', 1, NULL);
INSERT INTO vendas VALUES (77, 15, 1, '2025-03-13', 1, 808.03);
INSERT INTO vendas VALUES (78, 5, 8, '2025-03-27', 1, 919.12);
INSERT INTO vendas VALUES (79, 15, 10, '2025-03-06', 5, 988.13);
INSERT INTO vendas VALUES (80, 6, 8, '2025-02-27', 3, 833.96);
INSERT INTO vendas VALUES (81, 9, 9, '2025-03-04', 2, 756.74);
INSERT INTO vendas VALUES (82, 10, 4, '2025-02-04', 1, NULL);
INSERT INTO vendas VALUES (83, 5, 3, '2025-01-30', 2, 333.32);
INSERT INTO vendas VALUES (84, 3, 7, '2025-02-22', 3, 700.07);
INSERT INTO vendas VALUES (85, 7, 7, '2025-02-19', 2, 551.76);
INSERT INTO vendas VALUES (86, 19, 7, '2025-03-03', 5, NULL);
INSERT INTO vendas VALUES (87, 13, 7, '2025-03-10', 0, 943.89);
INSERT INTO vendas VALUES (88, 16, 4, '2025-02-04', 5, 803.87);
INSERT INTO vendas VALUES (89, 13, 3, '2025-03-01', 3, 495.93);
INSERT INTO vendas VALUES (90, 13, 10, '2025-03-14', 1, 981.11);
INSERT INTO vendas VALUES (91, 15, 3, '2025-01-07', 0, 102.27);
INSERT INTO vendas VALUES (92, 11, 6, '2025-02-18', 2, 391.52);
INSERT INTO vendas VALUES (93, 9, 2, '2025-03-02', 2, 756.97);
INSERT INTO vendas VALUES (94, 12, 4, '2025-03-25', 0, NULL);
INSERT INTO vendas VALUES (95, 1, 4, '2025-01-26', 0, 785.61);
INSERT INTO vendas VALUES (96, 16, 2, '2025-03-14', 0, 628.91);
INSERT INTO vendas VALUES (97, 12, 3, '2025-03-19', 1, 475.73);
INSERT INTO vendas VALUES (98, 6, 5, '2025-01-14', 5, 964.46);
INSERT INTO vendas VALUES (99, 13, 7, '2025-01-26', 5, 45.16);
INSERT INTO vendas VALUES (100, 8, 2, '2025-03-31', 0, 600.26);