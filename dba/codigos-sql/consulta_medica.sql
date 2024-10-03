CREATE DATABASE consulta_medica;
USE consulta_medica;

SELECT * FROM pessoa;
SELECT * FROM paciente;
SELECT * FROM medico;
SELECT * FROM consulta;

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