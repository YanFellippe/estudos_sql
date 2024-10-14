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
    codigo INT(5),
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
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda)
);

-- Campo dos inserts 

SELECT * FROM pessoa;
INSERT INTO pessoa(nome, idade, cpf, situacao) VALUES
('Bora Bilson', 42, '12345678900', 'ativo'),
('Amostradinho da Silva', 26, '00298366118', 'ativo'),
('Inês Sistente', 52, '93877122300', 'ativo'),
('Oreia Umida', 37, '73849987190', 'ativo'),
('Oreia Seca', 62, '12388900876', 'ativo'),
('Silas Cow', 19, '17389098177', 'ativo');

SELECT * FROM atendente;
INSERT INTO atendente(matricula, salario, situacao, id_pessoa) VALUES
('A3782849012344456981', 2775.44, 'ativo', 1),
('A7986435653268386666', 2775.44, 'ativo', 2),
('A9872345821073892460', 2775.44, 'ativo', 3);

SELECT * FROM cliente;
INSERT INTO cliente(telefone, saldo, email, situacao, id_pessoa) VALUES
('61999885678', 19877.19, 'testandocoins@gmail.com', 'ativo', 4),
('61998765423', 22987.55, 'matanubi@gmail.com', 'ativo', 5),
('61898988534', 6789.99, 'quetirofoiesse@gmail.com', 'ativo', 6);

SELECT * FROM categoria;
INSERT INTO categoria(descricao) VALUES
('Aparelhos Eletrônicos'),
('Aparelhos Eletrodomésticos'),
('Itens de Cozinha');

SELECT * FROM produto;
INSERT INTO produto(codigo, descricao, preco, situacao, quantidade_estoque, id_categoria) VALUES
(12345 , 'Iphone 16 Pro Max', 12777.99, 'disponivel', 200, 1),
(54321 , 'Samsung Galaxy S25 Ultra', 7897.55, 'disponivel', 100, 1),
(09876 , 'Ait Frier - Tramontina', 455.99, 'disponivel', 55, 3),
(67890 , 'Multiprocessador - Tramontina', 199.99, 'disponivel', 22, 3),
(10293 , 'Geladeira Duplex - Eletrolux', 3299.99, 'disponivel', 19, 2),
(76859 , 'Kit Talheres de ouro', 1255.25, 'disponivel', 333, 2);

SELECT * FROM venda;
INSERT INTO venda(valor_bruto, valor_total, desconto, acrescimo, situacao, id_cliente) VALUES
( 3677.25, ),
(),
();