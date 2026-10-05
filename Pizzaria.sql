CREATE DATABASE IF NOT EXISTS db_pizzaria;
USE db_pizzaria;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    senha VARCHAR(255)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    idcliente INT NOT NULL,
    quantidade INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idcliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE pizza (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    idpedido INT,
    sabor VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2),
    tamanho VARCHAR(20),
    CONSTRAINT fk_pizza_pedido FOREIGN KEY (idpedido) REFERENCES pedido(id_pedido)
);
USE db_pizzaria;

INSERT INTO cliente (nome, email, senha) VALUES
('João Pereira', 'joao.p@email.com', 'senhaHash123'),
('Beatriz Ramos', 'beatriz.r@email.com', 'senhaHash456'),
('Diego Martins', 'diego.m@email.com', 'senhaHash789');

INSERT INTO pedido (idcliente, quantidade, data_pedido, valor_total) VALUES
(1, 2, '2026-10-01', 95.00),
(2, 1, '2026-10-02', 50.00),
(3, 3, '2026-10-03', 135.00);

INSERT INTO pizza (idpedido, sabor, valor, tamanho) VALUES
(1, 'Calabresa', 45.00, 'Grande'),
(2, 'Quatro Queijos', 50.00, 'Grande'),
(3, 'Frango com Catupiry', 45.00, 'Média');