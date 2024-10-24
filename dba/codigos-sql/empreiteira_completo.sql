CREATE DATABASE empreiteira;
USE empreiteira;

CREATE TABLE pessoa(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cnpj_cpf VARCHAR(15) NOT NULL,
nome_fantasia VARCHAR(45),
telefone VARCHAR(15),
email VARCHAR(50) NOT NULL,
situacao CHAR(1) NOT NULL
);

CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(45) NOT NULL,
cidade VARCHAR(45) NOT NULL,
uf CHAR(2) NOT NULL,
bairro VARCHAR(45) NOT NULL,
cep VARCHAR(9) NOT NULL,
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE empreiteira(
id_empreiteira INT PRIMARY KEY AUTO_INCREMENT,
area_atuacao VARCHAR(120) NOT NULL,
tipo_contrato VARCHAR(30) NOT NULL,
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE colaborador(
id_colaborador INT PRIMARY KEY AUTO_INCREMENT,
funcao VARCHAR(45) NOT NULL,
matricula VARCHAR(10) NOT NULL,
salario FLOAT(10.2),
tipo_contrato VARCHAR(20) NOT NULL,
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE projeto(
id_projeto INT PRIMARY KEY AUTO_INCREMENT,
valor DECIMAL(10,2) NOT NULL,
tipo_projeto VARCHAR(45) NOT NULL,
nome_projeto VARCHAR(45) NOT NULL,
data_inicio DATE NOT NULL,
previsao DATE,
data_fim DATE,
status CHAR(1) NOT NULL,
id_colaborador INT NOT NULL,
FOREIGN KEY (id_colaborador) REFERENCES colaborador(id_colaborador)
);

CREATE TABLE obra(
id_obra INT PRIMARY KEY AUTO_INCREMENT,
valor DECIMAL(10,2) NOT NULL,
data_inicio DATE NOT NULL,
previsao DATE,
data_fim DATE,
status CHAR(1) NOT NULL,
id_empreiteira INT NOT NULL,
id_projeto INT NOT NULL,
id_colaborador INT NOT NULL,
FOREIGN KEY (id_empreiteira) REFERENCES empreiteira(id_empreiteira),
FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto),
FOREIGN KEY (id_colaborador) REFERENCES colaborador(id_colaborador)
);

SELECT * FROM pessoa;
INSERT INTO pessoa(nome, cnpj_cpf, nome_fantasia, telefone, email, situacao) VALUES
('Ruan Lobo', '12344599087', NULL, '+5566972887652', 'ruanzito@gmail.com', 'A'),
('Douglas Araújo', '12000976811', NULL, '+5521927768840', 'araujo.d@gmail.com', 'A'),
('Talisson Leandro', '99012678390', NULL, '+5527981190065', 'leandertal@gmail.com', 'A'),
('Raphael Melo', '12230009866', NULL, '+5561998990081', 'raphamelo@gmail.com', 'A'),
('Isabela Souza', '93456789234', NULL, '+5561987654321', 'isabela.souza@gmail.com', 'A'),
('Carlos Silva', '56789012345', NULL, '+5521998765432', 'carlos.silva@gmail.com', 'A'),
('Jair Bolsonaro', '34567890123', 'Jair Consntruction', '+5561887654321', 'messias.bolsonaro@gmail.com', 'A'),
('Pablo Marçal', '78901234567', 'Malçal Enterprise', '+5521999876543', 'pablo.marcal@gmail.com', 'A'),
('Fernanda Costa', '23456789012', 'Nandinha Construções', '+5561998765432', 'fernanda.costa@gmail.com', 'A');

SELECT * FROM endereco;
INSERT INTO endereco(rua, cidade, uf, bairro, cep, situacao, id_pessoa) VALUES
('Rua das Flores', 'São Paulo', 'SP', 'Centro', '01000-000', 'A', 1),
('Avenida Brasil', 'Rio de Janeiro', 'RJ', 'Copacabana', '22000-001', 'A', 2),
('Rua 7 de Setembro', 'Vitória', 'ES', 'Praia do Canto', '29000-002', 'A', 3),
('Rua dos Pinhais', 'Brasília', 'DF', 'Asa Sul', '70000-003', 'A', 4),
('Rua das Palmeiras', 'Goiânia', 'GO', 'Jardim Goiás', '74000-004', 'A', 5),
('Avenida Atlântica', 'Fortaleza', 'CE', 'Meireles', '60000-005', 'A', 6),
('Rua Presidente Vargas', 'Salvador', 'BA', 'Pituba', '40000-006', 'A', 7),
('Rua Augusto Severo', 'Belo Horizonte', 'MG', 'Savassi', '30000-007', 'A', 8),
('Rua Monteiro Lobato', 'Curitiba', 'PR', 'Batel', '80000-008', 'A', 9);

SELECT * FROM colaborador;
INSERT INTO colaborador(funcao, matricula, salario, tipo_contrato, situacao, id_pessoa) VALUES
('Arquiteto', '918273821A', 5770.88, 'Finalizar a Obra', 'A', 1),
('Mestre de Obras', '736288910B', 8550.00, 'Finalizar a Obra', 'A', 2),
('Arquiteto', '283746565C', 3200.00, 'Temporário', 'A', 3),
('Mestre de Obras', '192837465D', 7800.50, 'Permanente', 'A', 4),
('Arquiteto', '273849102E', 4500.75, 'Temporário', 'A', 5),
('Mestre de Obras', '374829475F', 5200.00, 'Permanente', 'A', 6);

SELECT * FROM empreiteira;
INSERT INTO empreiteira(area_atuacao, tipo_contrato, situacao, id_pessoa) VALUES
('Infraestrutura e Construção', '2 anos', 'A', 7),
('Manutenção', '2 anos', 'A', 8),
('Designer de Interiores', '1 ano', 'A', 9);

SELECT * FROM projeto;
INSERT INTO projeto(valor, tipo_projeto, nome_projeto, data_inicio, previsao, data_fim, status, id_colaborador) VALUES
(29000.22, 'Planta do Projeto', 'Pousada Chapada do Reino', '2024-10-10', '2028-12-09', NULL, 'A', 1),
(917880.22, 'Design e Planejamento', 'Parque das Araucárias', '2024-10-10', '2028-12-09', NULL, 'A', 3),
(325997.22, 'Construção da Base', 'Shopping Central', '2024-10-10', '2028-12-09', NULL, 'A', 5);

SELECT * FROM obra;
INSERT INTO obra(valor, data_inicio, previsao, data_fim, status, id_empreiteira, id_projeto, id_colaborador) VALUES
(1200000.00, '2024-10-11', '2028-12-09', NULL, 'A', 1, 1, 2),
(2500000.00, '2024-10-15', '2028-12-09', NULL, 'A', 2, 2, 4),
(3300000.00, '2024-11-01', '2028-12-09', NULL, 'A', 3, 3, 6);

-- seção de select com inner join
SELECT 
p.nome,
o.valor,
o.data_inicio,
o.previsao,
(data_inicio + INTERVAL previsao DAY) AS data_entrega, # fazer o calculo em dias
o.status
 FROM obra o # id_projeto id_empreiteira id_colaborador
 INNER JOIN empreiteira ep ON ep.id_empreiteira = o.id_empreiteira #id_pessoa
 INNER JOIN pessoa p ON p.id_pessoa = ep.id_pessoa;
 
 -- consulta da empresa
 SELECT 
 p.nome_fantasia AS nome_empresa,
 ed.rua,
 ed.cidade,
 ed.uf AS UF,
 p.telefone,
 o.data_inicio,
 o.previsao,
 o.data_fim AS previsao_conclusao,
 o.valor AS valor_total
 FROM obra o
 INNER JOIN empreiteira ep ON ep.id_empreiteira = o.id_empreiteira
 INNER JOIN pessoa p ON p.id_pessoa = ep.id_pessoa
 INNER JOIN endereco ed ON ed.id_pessoa = p.id_pessoa;


-- consulta dos projetos com a obra
SELECT 
pp.nome_projeto AS projeto_obra,
p.nome AS responsavel_projeto,
c.salario,
c.matricula,
pp.data_inicio AS inicio_projeto,
pp.previsao,
pp.data_fim AS final_projeto,
pp.valor AS valor_projeto,
pp.status AS status_projeto
FROM obra o
INNER JOIN projeto pp ON pp.id_projeto = o.id_projeto  
INNER JOIN empreiteira ep ON ep.id_empreiteira = o.id_empreiteira
INNER JOIN pessoa p ON p.id_pessoa = ep.id_empreiteira
INNER JOIN colaborador c ON c.id_pessoa = p.id_pessoa;

-- Relatório Projeto e Empreiteira
CREATE VIEW relatorio_empreiteira AS
   SELECT
   pm.nome AS "Meste Obra",
   pe.nome AS "Nome Empresa",  
   p.nome  AS "Nome Arquiteto",
   pj.nome_projeto,
   pj.valor AS "Valor Projeto",
   o.valor AS "Valor Obra",
   o.data_inicio
   FROM obra o
   INNER JOIN projeto pj ON pj.id_projeto = o.id_projeto
   INNER JOIN colaborador c ON c.id_colaborador = PJ.id_colaborador
   INNER JOIN pessoa p ON p.id_pessoa = c.id_pessoa
   INNER JOIN empreiteira em ON em.id_empreiteira = o.id_empreiteira
   INNER JOIN pessoa pe ON pe.id_pessoa = em.id_pessoa
   INNER JOIN colaborador cn ON cn.id_colaborador = o.id_colaborador
   INNER JOIN pessoa pm ON pm.id_pessoa = cn.id_pessoa;
   
   SELECT * FROM relatorio_empreiteira;
   
-- select para endereco de empreiteira, mestre de obras e arquiteto  
SELECT 
en.rua AS rua_empreiteira,
en.cep AS cep_empreiteira,
en.cidade AS cidade_empreiteira,
en.uf AS uf_empreiteira,
e.rua AS rua_mestre_obra,
e.cep AS cep_mestre_obra,
e.cidade AS cidade_mestre_obra,
e.uf AS uf_mestre_obra,
ee.rua AS rua_arquiteto,
ee.cep AS cep_arquiteto,
ee.cidade AS cidade_arquiteto,
ee.uf AS uf_arquiteto
FROM obra o 
INNER JOIN empreiteira ep ON ep.id_empreiteira = o.id_empreiteira
INNER JOIN pessoa p ON p.id_pessoa = ep.id_pessoa
INNER JOIN endereco en ON en.id_pessoa = p.id_pessoa
INNER JOIN colaborador c ON c.id_colaborador = o.id_colaborador
INNER JOIN pessoa pe ON pe.id_pessoa = c.id_pessoa
INNER JOIN endereco e ON e.id_pessoa = pe.id_pessoa
INNER JOIN projeto pj ON pj.id_projeto = o.id_projeto
INNER JOIN colaborador cc ON cc.id_colaborador = pj.id_colaborador
INNER JOIN pessoa pp ON pp.id_pessoa = cc.id_pessoa
INNER JOIN endereco ee ON ee.id_pessoa = pp.id_pessoa;

