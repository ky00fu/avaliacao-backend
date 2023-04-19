DROP DATABASE IF EXISTS vendas;
CREATE DATABASE vendas CHARSET=UTF8 COLLATE utf8_general_ci;
USE vendas;

CREATE TABLE vendedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    matricula INT NOT NULL
);

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome TEXT NOT NULL,
    valor DECIMAL(6,2)
);

CREATE TABLE vendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    quantidade INT NOT NULL,
    produtoID INT NOT NULL,
    vendedorID INT NOT NULL,
    FOREIGN KEY (produtoID) REFERENCES produtos(id),
    FOREIGN KEY (vendedorID) REFERENCES vendedores(id)
);