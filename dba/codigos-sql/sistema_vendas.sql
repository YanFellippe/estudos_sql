CREATE DATABASE sistema_venda;
USE sistema_venda;

CREATE TABLE pessoa (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    cpf CHAR(11) UNIQUE NOT NULL,
    situacao ENUM('ativo', 'inativo') DEFAULT 'ativo'
);

CREATE TABLE atendente (
    id_atendente INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    situacao ENUM('ativo', 'inativo') DEFAULT 'ativo',
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(15) NOT NULL,
    saldo DECIMAL(10, 2) DEFAULT 0.00,
    email VARCHAR(100) UNIQUE,
    situacao ENUM('ativo', 'inativo') DEFAULT 'ativo',
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE produto (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    situacao ENUM('disponivel', 'indisponivel') DEFAULT 'disponivel',
    quantidade_estoque INT DEFAULT 0,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    valor_bruto DECIMAL(10, 2) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    desconto DECIMAL(10, 2) DEFAULT 0.00,
    acrescimo DECIMAL(10, 2) DEFAULT 0.00,
    situacao ENUM('concluida', 'pendente', 'cancelada') DEFAULT 'pendente',
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE itens_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    desconto DECIMAL(10, 2) DEFAULT 0.00,
    acrescimo DECIMAL(10, 2) DEFAULT 0.00,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    valor_bruto DECIMAL(10, 2) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    cancelado BOOLEAN DEFAULT FALSE,
    id_venda INT NOT NULL,
    codigo_produto INT NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (codigo_produto) REFERENCES produto(codigo)
);
