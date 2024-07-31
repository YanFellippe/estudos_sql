/*			TRIGGER				*/

DELIMITER $$
CREATE TRIGGER AlteraStsVeiculo
BEFORE INSERT ON Locacao
FOR EACH ROW
BEGIN
	UPDATE Carro
	SET StaAlugado = 1
	WHERE IdCarro = NEW.Id_Carro;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER AdicionaVeiculo
BEFORE INSERT ON Carros
for each row
BEGIN
	UPDATE Carro
	SET StaAlugado = 0
	WHERE IdCarro = NEW.IdCarro;
END$$
DELIMITER ;



/*			VIEW				*/

DELIMITER $$
CREATE VIEW CarrosDisponiveis
AS
SELECT
	Marca,
	Modelo,
	Ano,
	Cor,
	Placa
FROM 
	Carros
WHERE StaAlugado = 0;
DELIMITER ;


/*			FUNCTION			*/

DELIMITER $$
CREATE FUNCTION Retornar_CPF_Cliente (Cliente_ID int) 
RETURNS INT
DETERMINISTIC
BEGIN 
	DECLARE ClienteCPF INT;
	SELECT
		CPF INTO ClienteCPF
	FROM
		Cliente
	WHERE IdCliente = Cliente_ID;
	
	RETURN ClienteCPF;
END$$
DELIMITER ;