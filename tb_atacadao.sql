-- 1)
create database Atacadao;
use Atacadao;

create table atadistaProduto(
ID_NF int(1) not null,
ID_item int(1),
COD_produto int(1),
VALOR_UNIT decimal(10,2),
QUANTIDADE int(100),
DESCONTO int(100)
);

select * from atadistaProduto;

insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('1', '1', '1', '25.0', '10', '5');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('1', '2', '2', '13.5', '3', '5');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('1', '3', '3', '15.0', '2', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('1', '4', '4', '10.0', '1', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('1', '5', '5', '30.0', '1', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('2', '1', '3', '15.0', '4', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('2', '2', '4', '10.00', '5', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('2', '3', '5', '30.00', '7', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('3', '2', '4', '10.0','4', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('3', '3', '5', '30.0', '5', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('3', '4', '2', '13.5', '7', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('4', '1', '5', '30.0', '10', '15');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('4', '2', '4', '10.00', '12', '5');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('4', '3', '1', '25.0', '13', '5');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('4', '4', '2', '13.0', '15', '5');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('5', '1', '3', '15.0', '3', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('5', '2', '5', '30.0', '6', '0');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('5', '2', '5', '25.0', '22', '15');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('6', '2', '3', '15.0', '25', '20');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('7', '1', '1', '25.0', '10', '3');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('7', '2', '2', '13.5', '10', '4');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('7', '3', '3', '15.0', '10', '4');
insert into atadistaProduto(ID_NF, ID_item, COD_produto, VALOR_UNIT, QUANTIDADE, DESCONTO)
values('7', '4', '5', '30.0', '10', '1');

select * from atadistaProduto;

-- a)
select * from atadistaProduto
where DESCONTO = '0';

-- b)
select * from atadistaProduto
where DESCONTO > '0';

-- c)
UPDATE atadistaProduto 
set DESCONTO = '0'
where DESCONTO is null;

-- d)
SELECT ID_NF, ID_item, COD_produto AS COD_PROD, VALOR_UNIT, (QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL, DESCONTO, (VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO
FROM atadistaProduto;

-- e)
SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL FROM atadistaProduto
GROUP BY  ID_NF
ORDER BY  VALOR_TOTAL DESC;

-- f)
SELECT ID_NF, SUM(VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO FROM atadistaProduto
GROUP BY ID_NF
ORDER BY VALOR_VENDIDO DESC;

-- g)
SELECT COD_produto, QUANTIDADE FROM atadistaProduto
ORDER BY QUANTIDADE desc;

-- h)
SELECT ID_NF, COD_produto, QUANTIDADE FROM atadistaProduto
WHERE QUANTIDADE >= '10';

-- i)
SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOT FROM atadistaProduto 
GROUP BY ID_NF HAVING VALOR_TOT > 500
ORDER BY VALOR_TOT DESC;

-- j)
SELECT COD_produto AS COD_PROD, AVG(DESCONTO) AS MEDIA
FROM atadistaProduto
GROUP BY COD_produto;

-- k)
SELECT COD_produto 
AS COD_PROD, MIN(DESCONTO) 
AS MENOR, MAX(DESCONTO) 
AS MAIOR, AVG(DESCONTO) 
AS MEDIA
FROM atadistaProduto
GROUP BY COD_produto;

-- l)
SELECT ID_NF, COUNT(*) AS QTD_ITENS FROM atadistaProduto
GROUP BY ID_NF
HAVING QTD_ITENS > 3;

-- EXTRA
SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOT FROM atadistaProduto
GROUP BY ID_NF
HAVING (
			SELECT SUM(QUANTIDADE * VALOR_UNIT) FROM atadistaProduto
			WHERE ID_NF * atadistaProduto.ID_NF
		) > 500
ORDER BY VALOR_TOT DESC;

-- 2)
CREATE DATABASE Universidade;
USE Universidade;

select * from Alunos;
select * from Disciplinas;
select * from Professores;
select * from Turma;
select * from Historico;

CREATE TABLE Alunos (
    MAT INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    cidade VARCHAR(100)
);

CREATE TABLE Disciplinas (
    COD_DISC INT PRIMARY KEY,
    nome_disc VARCHAR(100),
    carga_hor INT
);

CREATE TABLE Professores (
    COD_PROF INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    cidade VARCHAR(100)
);

CREATE TABLE Turma (
    COD_DISC INT,
    COD_TURMA INT,
    COD_PROF INT,
    ANO INT,
    horario VARCHAR(100),
    PRIMARY KEY (COD_DISC, COD_TURMA, ANO),
    FOREIGN KEY (COD_DISC) REFERENCES Disciplinas(COD_DISC),
    FOREIGN KEY (COD_PROF) REFERENCES Professores(COD_PROF)
);

CREATE TABLE Historico (
    MAT INT,
    COD_DISC INT,
    COD_TURMA INT,
    COD_PROF INT,
    ANO INT,
    frequencia FLOAT,
    nota FLOAT,
    PRIMARY KEY (MAT, COD_DISC, COD_TURMA, ANO),
    FOREIGN KEY (MAT) REFERENCES Alunos(MAT),
    FOREIGN KEY (COD_DISC, COD_TURMA, ANO) REFERENCES Turma(COD_DISC, COD_TURMA, ANO),
    FOREIGN KEY (COD_PROF) REFERENCES Professores(COD_PROF)
);

-- Dados dos alunos
INSERT INTO Alunos(MAT, nome, endereco, cidade)
values('2015010101', 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL');
INSERT INTO Alunos(MAT, nome, endereco, cidade)
values('2015010102', 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA');
INSERT INTO Alunos(MAT, nome, endereco, cidade)
values('2015010103', 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE');
INSERT INTO Alunos(MAT, nome, endereco, cidade)
values('2015010104', 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA');
INSERT INTO Alunos(MAT, nome, endereco, cidade)
values('2015010105', 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');
INSERT INTO Alunos(MAT, nome, endereco, cidade)
values('2015010106', 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

-- Dados das Disciplinas
INSERT INTO Disciplinas(COD_DISC, nome_disc, carga_hor)
VALUES('01', 'BANCO DE DADOS', '100');
INSERT INTO Disciplinas(COD_DISC, nome_disc, carga_hor)
VALUES('02', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', '100');
INSERT INTO Disciplinas(COD_DISC, nome_disc, carga_hor)
VALUES('03', 'AUTORIA WEB', '50');
INSERT INTO Disciplinas(COD_DISC, nome_disc, carga_hor)
VALUES('04', 'ENGENHARIA DE SOFTWARE', '80');

-- Dados Professores
INSERT INTO Professores(COD_PROF, nome, endereco, cidade)
VALUES('212131', 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA');
INSERT INTO Professores(COD_PROF, nome, endereco, cidade)
VALUES('122135', 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL');
INSERT INTO Professores(COD_PROF, nome, endereco, cidade)
VALUES('192011', 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

-- Dados da Turma
INSERT INTO Turma(COD_DISC, COD_TURMA, COD_PROF, ANO, horario)
VALUES('01', '1', '212131', '2015', '11H-12H');
INSERT INTO Turma(COD_DISC, COD_TURMA, COD_PROF, ANO, horario)
VALUES('01', '2', '212131', '2015', '13H-14H');
INSERT INTO Turma(COD_DISC, COD_TURMA, COD_PROF, ANO, horario)
VALUES('02', '1', '192011', '2015', '08H-09H');
INSERT INTO Turma(COD_DISC, COD_TURMA, COD_PROF, ANO, horario)
VALUES('03', '1', '192011', '2015', '07H-08H');
INSERT INTO Turma(COD_DISC, COD_TURMA, COD_PROF, ANO, horario)
VALUES('04', '1', '122135', '2015', '10H-11H');

-- Dados dos Históricos
INSERT INTO Historico(MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota)
VALUES ('2015010101', '01', '1', '212131', '2015', '100', '7.0');
INSERT INTO Historico(MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota)
VALUES ('2015010102', '02', '1', '122135', '2015', '100', '5.5');
INSERT INTO Historico(MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota)
VALUES ('2015010103', '01', '1', '212131', '2015', '100', '4.0');
INSERT INTO Historico(MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota)
VALUES ('2015010104', '03', '1', '192011', '2015', '50', '9.4');
INSERT INTO Historico(MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota)
VALUES ('2015010105', '04', '1', '122135', '2015', '80', '6.8');
INSERT INTO Historico(MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota)
VALUES ('2015010106', '04', '1', '192011', '2015', '80', '10.0');

-- a) Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD = código da disciplinas).
SELECT MAT FROM Historico 
WHERE COD_DISC = '01' AND ANO = '2015' AND nota < 5;

-- b) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015.
SELECT AVG(nota) AS media_notas
FROM Historico
WHERE COD_DISC = '02' 
AND ANO = '2015';

-- c) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015 e que esta média seja superior a 6.
SELECT MAT, AVG(nota) AS media_notas
FROM Historico
WHERE COD_DISC = '02'
AND ANO = '2015'
GROUP BY MAT
HAVING AVG(nota) > 6;

-- d) Encontre quantos alunos não são de Natal.
SELECT COUNT(*) AS total_alunos_nao_natal
FROM Alunos
WHERE cidade != 'NATAL';

