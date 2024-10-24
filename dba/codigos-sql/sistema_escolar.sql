CREATE DATABASE sistema_escola;-- Cria o banco de dados
USE sistema_escola; # Utiliza o banco de dados
CREATE TABLE pessoa(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(11) NOT NULL,
idade INT,
situacao CHAR(1));

CREATE TABLE aluno(
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR(20) NOT NULL,
id_pessoa INT NOT NULL,
situacao CHAR(1),
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa)); #Pegando a chave primaria de outra tabela que vira a chave estrangeira

CREATE TABLE professor(
id_professor INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR(20) NOT NULL,
salario DECIMAL(10,2),
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa));

CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
cidade VARCHAR(45) NOT NULL,
rua VARCHAR(45) NOT NULL,
bairro VARCHAR(45)NOT NULL,
uf CHAR(2) NOT NULL,
cep VARCHAR(8) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa));

CREATE TABLE curso(
id_curso INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(45)NOT NULL,
carga_horaria INT NOT NULL,
data_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
data_fim DATETIME,
semestre VARCHAR(20) NOT NULL,
situacao CHAR(1));

CREATE TABLE turma(
id_turma INT PRIMARY KEY AUTO_INCREMENT,
numero_sala VARCHAR(10) NOT NULL,
capacidade INT NOT NULL,
situacao CHAR(1) NOT NULL,
turno VARCHAR(20) NOT NULL,
id_aluno INT NOT NULL,
id_professor INT NOT NULL,
id_curso INT NOT NULL,
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
FOREIGN KEY (id_curso) REFERENCES curso(id_curso));

SELECT * FROM pessoa;
INSERT INTO pessoa(nome,cpf,idade,situacao) # Inserindo os dados de pessoa
VALUES
('Marcos','784562151',38,'A'),
('Andreia','95451515',25,'A'),
('Adriano','989715641',36,'A'),
('Paulo Sergio','15415645',null,'A');

INSERT INTO pessoa(nome,cpf,idade,situacao) VALUES
('Amostradinho da Silva', '19283746009', 19, 'A'),
('Bora Bilson', '73849912901', 18, 'A');

SELECT * FROM aluno;
INSERT INTO aluno(matricula,id_pessoa,situacao)# Inserindo os dados de aluno
VALUES 
('BT81818',1,'A'),
('BY96662',4,'A');

INSERT INTO aluno(matricula,id_pessoa,situacao) VALUES
('BG81001', 9, 'A'),
('BV98703', 10, 'A');

SELECT * FROM professor;
INSERT INTO professor(matricula,salario,situacao,id_pessoa)# Inserindo os dados de professor 
VALUES
('MR81515',5500.70,'A',3),
('NN88988',7000,'A',2);

SELECT * FROM curso;
INSERT INTO curso(descricao,carga_horaria,data_fim,semestre,situacao)# Inserindo os dados de curso
VALUES
('Tec Desenvolvimento',1200,null,'1 semestre','A'),
('Operador de Micro',300,null,'1 semestre','A');

SELECT * FROM turma;
INSERT INTO turma(numero_sala,capacidade,situacao,turno,id_aluno,id_professor,id_curso) # Inserindo os dados de turma
VALUES
('B10',30,'A','Matutino',1,2,1),
('B11',15,'A','Vespertino',2,1,2);

SELECT * FROM endereco;
INSERT INTO endereco(cidade,rua,bairro,uf,cep,id_pessoa)# Inserindo os dados de endereço										
VALUES
('Brasilia','QNG8','Taguatinga - Norte','DF','72130108',1),
('Osasco','Av Principal','Centro','SP','72135566',2),
('Paracatu','Av Paracatu','Centro','MG','7812315',3),
('Itacare','Av Praia Centro','Centro','BA','7566411',4);

# campo da consulta com inner join
SELECT 
p.nome AS nome_aluno,
t.turno AS turno_curso,
c.carga_horaria AS carga_horaria,
c.descricao AS nome_curso,
t.numero_sala AS turmas_atual
FROM turma t #id_aluno id_curso_id_professor
INNER JOIN pessoa p ON p.id_pessoa = t.id_aluno
INNER JOIN curso c ON c.id_curso = t.id_curso;

-- Criar a tabela de avaliação
CREATE TABLE avaliacao (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    nota_1 DECIMAL(5,2) NOT NULL,
    nota_2 DECIMAL(5,2) NOT NULL,
    nota_3 DECIMAL(5,2) NOT NULL,
    nota_4 DECIMAL(5,2) NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    resultado ENUM('A', 'R') DEFAULT 'R',
    v_media DECIMAL(4,2)
);

SELECT * FROM avaliacao;
INSERT INTO avaliacao(nota_1, nota_2, nota_3, nota_4, id_aluno) VALUES
(7.7, 8.75, 9.15, 8.16, 1),
(7, 8, 9, 8, 2),
(5.5, 7.75, 8.15, 7.16, 3),
(9.7, 8.75, 9, 10, 4);

-- Criar TRIGGER Média

DELIMITER //
CREATE TRIGGER avaliacao_resultado
BEFORE INSERT ON avaliacao
FOR EACH ROW
BEGIN
    DECLARE v_calculado DECIMAL(4,2);
    SET v_calculado = (NEW.nota_1 + NEW.nota_2 + NEW.nota_3 + NEW.nota_4) / 4;
    SET NEW.v_media = v_calculado;
    
    IF v_calculado >= 5 THEN
        SET NEW.resultado = 'A';
    ELSE
        SET NEW.resultado = 'R';
    END IF;
END//
DELIMITER ;