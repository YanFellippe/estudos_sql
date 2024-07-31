/*			INSERTS				*/

-- CARROS
-- Carro 1
INSERT INTO Carro (Modelo, Marca, Ano, Placa, Cor, StaAlugado, VlrSeguro, Seguradora, NumeroChassi, Cilindradas, TipoCombustivel, Categoria)
VALUES ('Gol', 'Volkswagen', 2020, 'ABC1234', 'Prata', 0, 1500.00, 'Seguradora A', '12345678901234567', 1600, 'Gasolina', 'X/Pop');

-- Carro 2
INSERT INTO Carro (Modelo, Marca, Ano, Placa, Cor, StaAlugado, VlrSeguro, Seguradora, NumeroChassi, Cilindradas, TipoCombustivel, Categoria)
VALUES ('Onix Plus', 'Chevrolet', 2019, 'DEF5678', 'Preto', 1, 1300.00, 'Seguradora B', '23456789012345678', 1400, 'Flex', 'Confort/Plus');

-- Carro 3
INSERT INTO Carro (Modelo, Marca, Ano, Placa, Cor, StaAlugado, VlrSeguro, Seguradora, NumeroChassi, Cilindradas, TipoCombustivel, Categoria)
VALUES ('Corolla', 'Toyota', 2021, 'GHI9012', 'Branco', 0, 1800.00, 'Seguradora C', '34567890123456789', 1800, 'Gasolina', 'Black');

-- Carro 4
INSERT INTO Carro (Modelo, Marca, Ano, Placa, Cor, StaAlugado, VlrSeguro, Seguradora, NumeroChassi, Cilindradas, TipoCombustivel, Categoria)
VALUES ('HB20', 'Hyundai', 2018, 'JKL3456', 'Azul', 0, 1200.00, 'Seguradora D', '45678901234567890', 1500, 'Flex', 'Confort/Plus');

-- Carro 5
INSERT INTO Carro (Modelo, Marca, Ano, Placa, Cor, StaAlugado, VlrSeguro, Seguradora, NumeroChassi, Cilindradas, TipoCombustivel, Categoria)
VALUES ('Civic', 'Honda', 2022, 'MNO7890', 'Vermelho', 1, 1700.00, 'Seguradora E', '56789012345678901', 2000, 'Flex', 'Black');


-- CLIENTE 
INSERT INTO CLIENTE (Nome, CPF, Telefone, NadaConsta, Endereco, NumeroCasa, Bairro, Uf)
VALUES ('Fulano da Vida', '12345678901', '11987654321', 1, 'Rua das Flores', 123, 'Centro', 'DF');

INSERT INTO CLIENTE (Nome, CPF, Telefone, NadaConsta, Endereco, NumeroCasa, Bairro, Uf)
VALUES ('Maria das Corridas', '23456789012', '11987654322', 0, 'Avenida Brasil', 456, 'Samambaia', 'DF');

INSERT INTO CLIENTE (Nome, CPF, Telefone, NadaConsta, Endereco, NumeroCasa, Bairro, Uf)
VALUES ('Carlos Pereira', '34567890123', '11987654323', 1, 'Travessa dos Amores', 789, 'São Sebastião', 'DF');

INSERT INTO CLIENTE (Nome, CPF, Telefone, NadaConsta, Endereco, NumeroCasa, Bairro, Uf)
VALUES ('Ana Costa', '45678901234', '11987654324', 0, 'Rua das Estrelas', 101, 'Lagoa', 'GO');

INSERT INTO CLIENTE (Nome, CPF, Telefone, NadaConsta, Endereco, NumeroCasa, Bairro, Uf)
VALUES ('Droga é o Bryan', '56789012345', '11987654325', 1, 'Avenida dos Lírios', 112, 'Centro', 'GO');



INSERT INTO FUNCIONARIO (Nome, Cargo, Id_Responsavel) 
VALUES ('João Silva', 'Gerente', NULL);
INSERT INTO FUNCIONARIO (Nome, Cargo, Id_Responsavel)
VALUES ('Maria Santos', 'Atendente', 1);
INSERT INTO FUNCIONARIO (Nome, Cargo, Id_Responsavel)
VALUES ('Carlos Pereira', 'Mecanico', 1);



INSERT INTO HISTORICO_MANUTENCAO (Descricao, Id_Carro, Valor, Id_Funcionario) VALUES ('Troca de óleo', 1, 100.00, 3);
INSERT INTO HISTORICO_MANUTENCAO (Descricao, Id_Carro, Valor, Id_Funcionario) VALUES ('Reparo de freio', 2, 250.00, 3);
INSERT INTO HISTORICO_MANUTENCAO (Descricao, Id_Carro, Valor, Id_Funcionario) VALUES ('Alteração de pneus', 3, 150.00, 3);
INSERT INTO HISTORICO_MANUTENCAO (Descricao, Id_Carro, Valor, Id_Funcionario) VALUES ('Lubrificação geral', 4, 50.00, 3);
INSERT INTO HISTORICO_MANUTENCAO (Descricao, Id_Carro, Valor, Id_Funcionario) VALUES ('Reparo de para-choques', 5, 300.00,3);



INSERT INTO LOCACAO (Id_Carro, Id_Cliente, DataInicio, DataFim) 
VALUES 
 (1, 1, '2024-05-01 08:00:00', '2024-05-07 18:00:00'),
 (2, 2, '2024-05-08 08:00:00', '2024-05-14 18:00:00'),
 (3, 3, '2024-05-15 08:00:00', '2024-05-21 18:00:00'),
 (4, 4, '2024-05-22 08:00:00', '2024-05-28 18:00:00'),
 (5, 5, '2024-05-29 08:00:00', '2024-06-04 18:00:00');


INSERT INTO Tipo_Evento (titulo)
VALUES 
 ('Multa'),
 ('Batida'),
 ('gravame '),
 ('batida');

select * from Tipo_Evento;


INSERT INTO EVENTO_CARRO (Descricao, Data_Evento, Valor, Id_Locacao, Id_TipoEvento)
VALUES 
 ('Multa velocidade','2024-05-01', 100.00, 1, 1),
 ('Batida engavetamento','2024-05-02', 150.00, 2, 2),
 ('transferencia','2024-05-03', 200.00, 3, 3),
 ('Multa estacionamento', '2024-05-04', 250.00, 4, 1),
 ('Multa faixa canalizada','2024-05-05', 300.00, 5, 1);










