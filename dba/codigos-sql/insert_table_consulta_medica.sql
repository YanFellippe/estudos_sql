CREATE DATABASE consulta_medica;
USE consulta_medica;

-- DROP TABLE consulta; -> apaga a tabela desejada

CREATE TABLE pessoa(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT, -- pk da tabela
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(11) NOT NULL,
data_nascimento DATE,
rg VARCHAR(7),
telefone VARCHAR(20),
email VARCHAR(45),
situacao CHAR(1)
);

CREATE TABLE paciente(
id_paciente INT PRIMARY KEY AUTO_INCREMENT,
num_sus VARCHAR(20),
plano_saude VARCHAR(45),
observacao VARCHAR(250),
situacao CHAR(1),
-- puxa a fk da tabela pessoa
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE medico(
id_medico INT PRIMARY KEY AUTO_INCREMENT,
crm INT(6) NOT NULL,
especialidade VARCHAR(45) NOT NULL,
salario DECIMAL(10,2),
situacao CHAR(1),
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE consulta(
id_consulta INT PRIMARY KEY AUTO_INCREMENT,
tipo_consulta VARCHAR(45) NOT NULL,
data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP, -- puxa a data e hora exata do insert
status VARCHAR(45),
-- puxa os IDs das tabelas medico e paciente
id_paciente INT NOT NULL,
FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
id_medico INT NOT NULL,
FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

-- campo dos inserts

SELECT * FROM pessoa;
INSERT INTO pessoa(nome, cpf, data_nascimento, rg, telefone, email, situacao) VALUES
('Renato Cariani', '23456711200', '1979-12-22', '2447800', '+55617832209', 'cajuzinho@gmail.com', 'A'),
('Amanda Souza', '78965432100', '1990-05-15', '3678901', '+5561987234512', 'amanda.souza@example.com', 'A'),
('Carlos Mendes', '12378945601', '1985-08-10', '4587210', '+5561932123456', 'carlos.mendes@example.com', 'A'),
('Patrícia Lima', '32165498702', '1992-11-03', '6890123', '+5561987456321', 'patricia.lima@example.com', 'A'),
('Gabriel Monteiro', '98765432109', '1988-06-24', '1254789', '+5561987345980', 'gabriel.monteiro@example.com', 'A'),
('Fernanda Carvalho', '85296374125', '1995-03-12', '3457892', '+5561923457890', 'fernanda.carvalho@example.com', 'A');

SELECT * FROM paciente;
INSERT INTO paciente(num_sus, plano_saude, observacao, situacao, id_pessoa) VALUES
('0101223489', 'Amil', 'Precisa marcar exames adicionais.', 'A', 9),
('9372388791', 'UNIMED', '7 seções de Quiropraxia.', 'A', 10),
('0939907771', 'UNIMED', 'Retorno médico.', 'A', 11),
('0936766581', 'Bradesco Saúde', 'Paciente com histórico de refluxo.', 'A', 12);

SELECT * FROM medico;
INSERT INTO medico(crm, especialidade, salario, situacao, id_pessoa) VALUES
(91201, 'Fisioterapeuta', 27000.00, 'A', 7),
(66780, 'Ortopedista', 27000.00, 'A', 8);

SELECT * FROM consulta;
INSERT INTO consulta (tipo_consulta, status, id_paciente, id_medico) VALUES 
('Consulta de Fisioterapia', 'Agendada', 6, 6),
('Consulta de Ortopedia', 'Agendada', 7, 7),
('Consulta de Fisioterapia', 'Agendada', 8, 6),
('Consulta de Ortopedia', 'Agendada', 9, 7);