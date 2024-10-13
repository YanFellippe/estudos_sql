CREATE DATABASE consulta_medica;
USE consulta_medica;

SELECT * FROM pessoa;
SELECT * FROM paciente;
SELECT * FROM medico;
SELECT * FROM consulta;

-- DROP TABLE consulta; -> apaga a tabela desejada
-- Consulta médica focada no auxílio de controle de pacientes e funcionários do hospital

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

INSERT INTO pessoa(nome, cpf, data_nascimento, rg, telefone, email, situacao) VALUES
('João Paulo', '19023498902', '2000-10-22', '1236782', '+556199980012', 'jpdograu@gmail.com', 'A'),
('Do draude', '15568989027', '2000-03-22', '1233322', '+556192887212', 'dodraude@gmail.com', 'A'),
('Ana Clara', '43568890031', '2003-12-01', '4353237', '+556245655589', 'aninha.com', 'A'),
('Maria do Carmo', '22235000973', '1992-05-27', '1445997', '+551123667889', 'mariacarmo@gmail.com', 'A'),
('Yanzinho Gameplays', '70766645611', '1980-11-03', '1245560', '+551234521199', 'yanzinho@gmail.com', 'A');
SELECT * FROM pessoa;

INSERT INTO medico(crm, especialidade, salario, situacao, id_pessoa) VALUES
(123456, 'Cardiologia', 15000.00, 'A', 1),
(234567, 'Ortopedia', 12000.00, 'A', 2),
(345678, 'Pediatria', 11000.00, 'A', 3),
(456789, 'Neurologia', 16000.00, 'I', 4),
(567890, 'Dermatologia', 13000.00, 'A', 5);
SELECT * FROM medico;

INSERT INTO paciente(num_sus, plano_saude, observacao, situacao, id_pessoa) VALUES
('1234567890', 'Unimed', 'Paciente em observação para exames adicionais.', 'A', 1),
('2345678901', 'Bradesco Saúde', 'Paciente em acompanhamento pós-cirúrgico.', 'A', 2),
('3456789012', 'Amil', 'Paciente com alergias a medicamentos específicos.', 'I', 3),
('4567890123', NULL, 'Paciente sem plano de saúde, atendimento pelo SUS.', 'A', 4),
('5678901234', 'SulAmérica', 'Paciente com histórico de hipertensão.', 'A', 5);
SELECT * FROM paciente;

INSERT INTO consulta (tipo_consulta, status, id_paciente, id_medico) VALUES 
('Consulta de Rotina', 'Agendada', 1, 1),
('Retorno', 'Concluída', 2, 2),
('Exame Pré-operatório', 'Cancelada', 3, 3),
('Acompanhamento', 'Agendada', 4, 4),
('Emergência', 'Concluída', 5, 5);
SELECT * FROM consulta;
