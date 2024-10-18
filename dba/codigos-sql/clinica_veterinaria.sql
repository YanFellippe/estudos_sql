CREATE DATABASE clinica_veterinaria;
USE clinica_veterinaria;

CREATE TABLE pessoa ( 
 id_pessoa INT PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR(45) NOT NULL,  
 cpf VARCHAR(11) NOT NULL,  
 idade INT(2),  
 telefone VARCHAR(12) NOT NULL,  
 situacao CHAR(1) NOT NULL  
);

CREATE TABLE endereco ( 
 id_endereco INT PRIMARY KEY AUTO_INCREMENT,  
 rua VARCHAR(45) NOT NULL,  
 cep VARCHAR(9) NOT NULL,  
 cidade VARCHAR(45) NOT NULL,  
 uf CHAR(2) NOT NULL,  
 situacao CHAR(1) NOT NULL,  
 id_pessoa INT NOT NULL,
 FOREIGN KEY(id_pessoa) REFERENCES pessoa (id_pessoa)
); 

CREATE TABLE animal ( 
 id_animal INT PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR(45) NOT NULL,  
 raca VARCHAR(45) NOT NULL,  
 porte VARCHAR(10) NOT NULL,  
 peso VARCHAR(10),  
 idade INT(2),  
 situacao CHAR(1) NOT NULL,  
 id_tutor INT NOT NULL,
 FOREIGN KEY(id_tutor) REFERENCES tutor (id_tutor)
); 

CREATE TABLE veterinario ( 
 id_veterinario INT PRIMARY KEY AUTO_INCREMENT,  
 crmv VARCHAR(8) NOT NULL,  
 salario FLOAT NOT NULL,  
 especialidade VARCHAR(45) NOT NULL,  
 situacao CHAR(1) NOT NULL,  
 id_pessoa INT NOT NULL,
 FOREIGN KEY(id_pessoa) REFERENCES pessoa (id_pessoa)
); 

CREATE TABLE tutor ( 
 id_tutor INT PRIMARY KEY AUTO_INCREMENT,  
 fidelidade VARCHAR(45) NOT NULL,  
 observacao VARCHAR(150) NOT NULL,  
 situacao CHAR(1) NOT NULL,  
 id_pessoa INT,
 FOREIGN KEY(id_pessoa) REFERENCES pessoa (id_pessoa)
); 

CREATE TABLE consulta ( 
 id_consulta INT PRIMARY KEY AUTO_INCREMENT,  
 data_consulta DATE NOT NULL,  
 tipo_consulta VARCHAR(120) NOT NULL,  
 observacao VARCHAR(150) NOT NULL,  
 situacao CHAR(1) NOT NULL,  
 id_animal INT,  
 id_veterinario INT,
 FOREIGN KEY(id_animal) REFERENCES animal (id_animal),
 FOREIGN KEY(id_veterinario) REFERENCES veterinario (id_veterinario)
); 

CREATE TABLE receita_medica ( 
 id_receita_medica INT PRIMARY KEY AUTO_INCREMENT,  
 medicamento VARCHAR(45) NOT NULL,  
 dias INT NOT NULL,  
 tratamento VARCHAR(150) NOT NULL,  
 data_inicio DATE NOT NULL,  
 data_fim DATE NOT NULL,  
 observacao VARCHAR(250) NOT NULL,  
 id_consulta INT NOT NULL,
 FOREIGN KEY(id_consulta) REFERENCES consulta (id_consulta)
); 

CREATE TABLE historico_medico ( 
 id_historico_medico INT PRIMARY KEY AUTO_INCREMENT,  
 observacao VARCHAR(250) NOT NULL,  
 id_consulta INT NOT NULL,
 FOREIGN KEY(id_consulta) REFERENCES consulta (id_consulta)
);

-- campo insert das tabelas
SELECT * FROM pessoa;
INSERT INTO pessoa(nome, cpf, idade, telefone, situacao) VALUES
('Yan Fellippe', '01019078891', 22, '61999986767', 'A'),
('Douglas Araújo', '12342378966', 20, '61897729091', 'A'),
('Ruan Lobo', '82901789277', 18, '61892566599', 'A'),
('Raphael Melo', '17289900871', 22, '619825567100', 'A'),
('Bora Bilson', '82990001762', 44, '61992536780', 'A'),
('Amostradinho da Silva', '99182360091', 38, '61789990210', 'A');

SELECT * FROM endereco;
INSERT INTO endereco (rua, cep, cidade, uf, situacao, id_pessoa) VALUES 
('Rua das Flores', '12345-678', 'São Paulo', 'SP', 'A', 1),
('Avenida Central', '98765-432', 'Rio de Janeiro', 'RJ', 'A', 2),
('Travessa da Harmonia', '45678-901', 'Belo Horizonte', 'MG', 'A', 3),
('Rua Verde', '87654-210', 'Curitiba', 'PR', 'A', 4),
('Praça Azul', '34567-890', 'Fortaleza', 'CE', 'A', 5),
('Praça Laranja', '34098-321', 'Fortaleza', 'CE', 'A', 6);

SELECT * FROM tutor;
INSERT INTO tutor(fidelidade, observacao, situacao, id_pessoa) VALUES
('2 anos', 'Plano +Pets', 'A', 1),
('5 anos', 'Plano +Pets', 'A', 2),
('1 ano', 'Plano Inicial', 'A', 3),
('6 anos', 'Plano Pets Especial', 'A', 4);

SELECT * FROM veterinario;
INSERT INTO veterinario (crmv, salario, especialidade, situacao, id_pessoa) VALUES 
('SP-12345', 8000.00, 'Cirurgia', 'A', 5),
('RJ-67890', 9500.50, 'Dermatologia', 'I', 6);

SELECT * FROM animal;
INSERT INTO animal (nome, raca, porte, peso, idade, situacao, id_tutor) VALUES 
('Cupcake', 'Pastor Alemão', 'Grande', '22kg', 2, 'A', 1),
('Mia', 'Shih Tzu', 'Pequeno', '8kg', 3, 'A', 2),
('Thor', 'Pitbull', 'Médio', '25kg', 4, 'I', 3),
('Buddy', 'Labrador', 'Grande', '32kg', 5, 'A', 4);

SELECT * FROM consulta;
INSERT INTO consulta (data_consulta, tipo_consulta, observacao, situacao, id_animal, id_veterinario) VALUES 
('2024-10-10', 'Vacinação', 'Aplicada vacina antirrábica.', 'A', 1, 1),
('2024-09-20', 'Consulta Geral', 'Animal apresentou sinais de dermatite.', 'A', 2, 2),
('2024-08-15', 'Cirurgia', 'Realizada castração com sucesso.', 'I', 3, 1),
('2024-07-25', 'Emergência', 'Atendimento por ingestão de objeto estranho.', 'A', 4, 2);

SELECT * FROM receita_medica;
INSERT INTO receita_medica (medicamento, dias, tratamento, data_inicio, data_fim, observacao, id_consulta) VALUES 
('Antibiótico X', 7, 'Administrar 2x ao dia, via oral.', '2024-10-10', '2024-10-17', 'Garantir que o animal não falte nenhuma dose.', 1),
('Anti-inflamatório Y', 5, 'Aplicação diária após refeição.', '2024-09-21', '2024-09-25', 'Reavaliar ao fim do período.', 2),
('Vermífugo Z', 3, 'Dose única por 3 dias consecutivos.', '2024-08-16', '2024-08-18', 'Manter o animal hidratado.', 3),
('Suplemento A', 30, 'Misturar na ração diária.', '2024-07-26', '2024-08-25', 'Verificar se houve melhora no apetite.', 4);

SELECT * FROM historico_medico;
INSERT INTO historico_medico (observacao, id_consulta) 
VALUES 
('Animal apresentou melhora significativa após tratamento com antibiótico.', 1),
('Recomendada nova consulta devido à persistência da dermatite.', 2),
('Cirurgia de castração realizada com sucesso, recuperação sem complicações.', 3),
('Objeto estranho removido sem danos internos; animal estável.', 4);