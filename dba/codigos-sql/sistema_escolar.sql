CREATE DATABASE sistema_escolar;
USE sistema_escolar;

SELECT * FROM pessoa;
SELECT * FROM endereco;
SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM turma;
SELECT * FROM curso;

CREATE TABLE pessoa(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(11) NOT NULL,
idade INT(2),
situacao CHAR(1)
);

CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
cidade VARCHAR(45),
rua VARCHAR(45),
bairro VARCHAR(45),
cep VARCHAR(8),
uf CHAR(2),
situacao CHAR(1),
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE aluno(
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR(10),
situacao CHAR(1),
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE professor(
id_professor INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR(10),
situacao CHAR(1),
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE curso(
id_curso INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(250),
carga_horaria VARCHAR(25),
dt_inicio DATE,
dt_fim DATE,
situacao CHAR(1),
id_aluno INT NOT NULL,
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE turma(
id_turma INT PRIMARY KEY AUTO_INCREMENT,
num_sala INT(3),
capacidade INT(3),
situacao CHAR(1),
id_aluno INT NOT NULL,
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
id_professor INT NOT NULL,
FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
id_curso INT NOT NULL,
FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);