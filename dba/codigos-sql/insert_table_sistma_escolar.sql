USE sistema_escolar;
SELECT * FROM endereco;
INSERT INTO endereco(cidade, rua, bairro, cep, uf, situacao, id_pessoa) VALUES
('Brasilia', 'QR705', 'Samambaia', '77700-30', 'DF', 'A', 4),
('Brasilia', 'QNP10', 'ceilândia', '72344-00', 'DF', 'A', 3),
('New York', 'Central Park', 'Bronx', '11111-30', 'YK', 'A', 2),
('Washington Dc.', 'Casa Branca', 'Casa Branca', '00115-12', 'US', 'A', 1);

SELECT * FROM pessoa;
INSERT INTO pessoa(nome, cpf, idade, situacao) VALUES
('P. Didy', '11123456698', 37, 'A'),
('Jason Momoa', '23889076922', 26, 'A'),
('Rafael Bomfim', '11122233300', 39, 'A'),
('Rual Lobo', '98723478919', 18, 'A');

SELECT * FROM professor;
INSERT INTO professor(matricula, situacao, id_pessoa) VALUES
('0987324890', 'A', 3),
('0872346337', 'A', 1);

SELECT * FROM aluno;
INSERT INTO aluno(matricula, situacao, id_pessoa) VALUES
('1234567891', 'A', 2),
('0087611133', 'A', 4);

SELECT * FROM curso;
INSERT INTO curso(descricao, carga_horaria, dt_inicio, dt_fim, situacao, id_aluno) VALUES
('Desenvoilvimento de banco de dados  e aplicação backend', '1050h', '2024-03-03', '2025-05-05', 'A', 1),
('Assistente de tecnologia e desenvolvimento de sistemas', '1300h', '2024-02-02', '2025-07-11', 'A', 2);

SELECT * FROM turma;
INSERT INTO turma(num_sala, capacidade, situacao, id_aluno, id_professor, id_curso) VALUES
(111, 50, 'A', 1, 1, 2),
(112, 50, 'A', 2, 2, 1);