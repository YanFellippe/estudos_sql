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
    id_atendente INT,
    numero_cupom INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_atendente) REFERENCES atendente(id_atendente)
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
    id_produto INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    id_venda INT NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda)
);

-- Inserções
INSERT INTO pessoa (nome, idade, cpf, situacao) VALUES
('Bora Bilson', 42, '12345678900', 'ativo'),
('Amostradinho da Silva', 26, '00298366118', 'ativo'),
('Inês Sistente', 52, '93877122300', 'ativo'),
('Oreia Umida', 37, '73849987190', 'ativo'),
('Oreia Seca', 62, '12388900876', 'ativo'),
('Silas Cow', 19, '17389098177', 'ativo');

INSERT INTO atendente (matricula, salario, situacao, id_pessoa) VALUES
('A3782849012344456981', 2775.44, 'ativo', 1),
('A7986435653268386666', 2775.44, 'ativo', 2),
('A9872345821073892460', 2775.44, 'ativo', 3);

INSERT INTO cliente (telefone, saldo, email, situacao, id_pessoa) VALUES
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

INSERT INTO venda (valor_bruto, desconto, acrescimo, valor_total, situacao, id_cliente, id_atendente, numero_cupom) VALUES
(0, 0, 0, 0, 'pendente', 1, 1, 1),
(0, 0, 0, 0, 'pendente', 2, 2, 2),
(0, 0, 0, 0, 'pendente', 3, 3, 3);

-- insert para calculo de itens_venda

SELECT * FROM produto;
SELECT * FROM itens_venda;

INSERT INTO itens_venda (quantidade, preco, valor_bruto, desconto, acrescimo, valor_total, cancelado, id_produto, id_venda) VALUES
(2, (SELECT preco FROM produto WHERE id_produto = 1), 2 * (SELECT preco FROM produto WHERE id_produto = 1), 10, 0, (2 * (SELECT preco FROM produto WHERE id_produto = 1)) - 10, FALSE, 1, 1),
(1, (SELECT preco FROM produto WHERE id_produto = 2), 1 * (SELECT preco FROM produto WHERE id_produto = 2), 0, 0, (1 * (SELECT preco FROM produto WHERE id_produto = 2)), FALSE, 2, 1);
    
INSERT INTO itens_venda (quantidade, preco, valor_bruto, desconto, acrescimo, valor_total, cancelado, id_produto, id_venda) VALUES
(3, (SELECT preco FROM produto WHERE id_produto = 3), 3 * (SELECT preco FROM produto WHERE id_produto = 3), 5, 0, (3 * (SELECT preco FROM produto WHERE id_produto = 3)) - 5, FALSE, 3, 2),
(2, (SELECT preco FROM produto WHERE id_produto = 4), 2 * (SELECT preco FROM produto WHERE id_produto = 4), 0, 0, (2 * (SELECT preco FROM produto WHERE id_produto = 4)), FALSE, 4, 2);

UPDATE venda 
SET valor_bruto = (SELECT SUM(valor_total) FROM itens_venda WHERE id_venda = 1), 
    valor_total = valor_bruto - desconto + acrescimo 
WHERE id_venda = 1;

UPDATE venda 
SET valor_bruto = (SELECT SUM(valor_total) FROM itens_venda WHERE id_venda = 2), 
    valor_total = valor_bruto - desconto + acrescimo 
WHERE id_venda = 2;

SELECT * FROM venda;

-- Relatório de vendas
SELECT 
v.numero_cupom AS 'cupom_compra',
p.nome AS 'nome_cliente',
pp.nome AS 'nome_atendente',
v.valor_total 
FROM itens_venda iv
INNER JOIN venda v ON v.id_venda = iv.id_venda
INNER JOIN cliente c ON c.id_cliente = v.id_cliente
INNER JOIN pessoa p ON p.id_pessoa = c.id_pessoa
INNER JOIN atendente a ON a.id_atendente = v.id_atendente
INNER JOIN pessoa pp ON pp.id_pessoa = a.id_pessoa;

-- Relatório itens venda
SELECT 
pr.descricao AS 'nome_produto',
pr.preco AS 'preco_produto',
c.descricao,
iv.quantidade AS 'quantidade_compra',
iv.valor_bruto,
iv.desconto,
iv.acrescimo,
iv.valor_total AS 'total_compra',
iv.cancelado,
p.nome AS 'nome_cliente',
pp.nome AS 'nome_atendente'
FROM itens_venda iv
INNER JOIN produto pr ON pr.id_produto = iv.id_produto
INNER JOIN categoria c ON c.id_categoria = pr.id_categoria
INNER JOIN venda v ON v.id_venda = iv.id_venda
INNER JOIN cliente cc ON cc.id_cliente = v.id_cliente
INNER JOIN pessoa p ON p.id_pessoa = cc.id_pessoa
INNER JOIN atendente a ON a.id_atendente = v.id_atendente
INNER JOIN pessoa pp ON pp.id_pessoa = a.id_pessoa;

-- Recalcular estoque
UPDATE itens_venda SET cancelado = 1 WHERE id_item = 2; 
UPDATE produto SET quantidade_estoque = 200 WHERE quantidade_estoque IS NULL;
SELECT * FROM produto;

UPDATE produto SET quantidade_estoque = quantidade_estoque - (SELECT(quantidade) FROM itens_venda WHERE id_produto = 1 AND cancelado = 0) WHERE id_produto = 1;
UPDATE produto SET quantidade_estoque = quantidade_estoque - (SELECT(quantidade) FROM itens_venda WHERE id_produto = 2 AND cancelado = 0) WHERE id_produto = 2;

UPDATE produto SET quantidade_estoque = quantidade_estoque + (SELECT(quantidade) FROM itens_venda WHERE id_produto = 1 AND cancelado = 1) WHERE id_produto = 1;
UPDATE produto SET quantidade_estoque = quantidade_estoque - (SELECT(quantidade) FROM itens_venda WHERE id_produto = 2 AND cancelado = 1) WHERE id_produto = 2;


-- alterar tabela com triggers
CREATE TABLE alteracao_preco(
	id_alteracao_preco INT PRIMARY KEY AUTO_INCREMENT,
	preco_novo DECIMAL(10,2),
	preco_antigo DECIMAL(10,2),
	id_produto INT NOT NULL,
	FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

SELECT * FROM alteracao_preco;
SELECT * FROM produto;

UPDATE produto SET preco = 11001.50 WHERE id_produto = 1;

SELECT * FROM itens_venda;

CREATE TABLE alteracao_itens_venda (
    id_alteracao INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    valor_bruto DECIMAL(10, 2) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    desconto DECIMAL(10, 2) DEFAULT 0,
    acrescimo DECIMAL(10, 2) DEFAULT 0,
    cancelado CHAR(1) DEFAULT 'N',
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tipo_operacao ENUM('INSERCAO', 'ATUALIZACAO')
);