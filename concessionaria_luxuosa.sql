-- Database: concessionaria_luxuosa

-- DROP DATABASE IF EXISTS concessionaria_luxuosa;

CREATE DATABASE concessionaria_luxuosa
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- FUNCIONÁRIOS
CREATE TABLE funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) CHECK (cargo IN ('Vendedor', 'Gerente', 'Mecânico', 'Administrador', 'Financeiro', 'Atendimento')),
    salario NUMERIC(10,2) NOT NULL,
    data_admissao DATE NOT NULL,
    email VARCHAR(120) UNIQUE
);

-- FORNECEDORES
CREATE TABLE fornecedores (
    id_fornecedor SERIAL PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(120),
    endereco VARCHAR(200)
);

-- VEÍCULOS
CREATE TABLE veiculos (
    id_veiculo SERIAL PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT CHECK (ano >= 1980),
    cor VARCHAR(30),
    motor VARCHAR(50),
    transmissao VARCHAR(50),
    quilometragem NUMERIC(10,2) DEFAULT 0,
    preco NUMERIC(12,2) NOT NULL,
    tipo VARCHAR(30) CHECK (tipo IN ('Novo', 'Usado', 'Blindado')),
    status VARCHAR(20) DEFAULT 'Disponível' CHECK (status IN ('Disponível', 'Reservado', 'Vendido', 'Em manutenção')),
    id_fornecedor INT REFERENCES fornecedores(id_fornecedor) ON DELETE SET NULL
);

-- ESTOQUE
CREATE TABLE estoque (
    id_estoque SERIAL PRIMARY KEY,
    id_veiculo INT REFERENCES veiculos(id_veiculo) ON DELETE CASCADE,
    quantidade INT CHECK (quantidade >= 0),
    localizacao VARCHAR(100),
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- VENDAS
CREATE TABLE vendas (
    id_venda SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    id_funcionario INT REFERENCES funcionarios(id_funcionario) ON DELETE SET NULL,
    id_veiculo INT REFERENCES veiculos(id_veiculo) ON DELETE SET NULL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total NUMERIC(12,2) NOT NULL,
    forma_pagamento VARCHAR(30) CHECK (forma_pagamento IN ('Crédito', 'Débito', 'Pix', 'Transferência', 'Financiamento')),
    status_venda VARCHAR(20) DEFAULT 'Concluída' CHECK (status_venda IN ('Concluída', 'Pendente', 'Cancelada'))
);

-- MANUTENÇÕES
CREATE TABLE manutencoes (
    id_manutencao SERIAL PRIMARY KEY,
    id_veiculo INT REFERENCES veiculos(id_veiculo) ON DELETE CASCADE,
    id_funcionario INT REFERENCES funcionarios(id_funcionario) ON DELETE SET NULL,
    descricao TEXT,
    custo NUMERIC(10,2),
    data_servico DATE NOT NULL,
    tipo_servico VARCHAR(50) CHECK (tipo_servico IN ('Revisão', 'Reparo', 'Personalização', 'Inspeção'))
);

-- TEST DRIVES
CREATE TABLE test_drives (
    id_test_drive SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    id_veiculo INT REFERENCES veiculos(id_veiculo) ON DELETE CASCADE,
    id_funcionario INT REFERENCES funcionarios(id_funcionario) ON DELETE SET NULL,
    data_agendada TIMESTAMP NOT NULL,
    status VARCHAR(20) DEFAULT 'Agendado' CHECK (status IN ('Agendado', 'Realizado', 'Cancelado')),
    observacoes TEXT
);

-- FINANCEIRO (parcelas, comissões)
CREATE TABLE financeiro (
    id_transacao SERIAL PRIMARY KEY,
    tipo_transacao VARCHAR(20) CHECK (tipo_transacao IN ('Receita', 'Despesa')),
    descricao TEXT,
    valor NUMERIC(12,2) NOT NULL,
    data_transacao DATE NOT NULL,
    id_venda INT REFERENCES vendas(id_venda) ON DELETE SET NULL,
    id_funcionario INT REFERENCES funcionarios(id_funcionario) ON DELETE SET NULL
);

-- SEGUROS
CREATE TABLE seguros (
    id_seguro SERIAL PRIMARY KEY,
    id_veiculo INT REFERENCES veiculos(id_veiculo) ON DELETE CASCADE,
    id_cliente INT REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    empresa_seguro VARCHAR(100),
    valor_mensal NUMERIC(10,2),
    validade DATE,
    tipo_cobertura VARCHAR(50)
);

-- PEÇAS (estoque de peças de manutenção)
CREATE TABLE pecas (
    id_peca SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco_unitario NUMERIC(10,2),
    quantidade_estoque INT CHECK (quantidade_estoque >= 0),
    id_fornecedor INT REFERENCES fornecedores(id_fornecedor) ON DELETE SET NULL
);

-- SERVIÇOS REALIZADOS (uso de peças)
CREATE TABLE servicos_realizados (
    id_servico SERIAL PRIMARY KEY,
    id_manutencao INT REFERENCES manutencoes(id_manutencao) ON DELETE CASCADE,
    id_peca INT REFERENCES pecas(id_peca) ON DELETE SET NULL,
    quantidade_usada INT CHECK (quantidade_usada >= 0),
    valor_total NUMERIC(10,2)
);

-- LOGS (auditoria)
CREATE TABLE logs (
    id_log SERIAL PRIMARY KEY,
    acao VARCHAR(50),
    tabela_afetada VARCHAR(50),
    usuario VARCHAR(100),
    data_evento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
