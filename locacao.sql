SELECT 
c.Nome,
cr.Modelo,
cr.Marca,
cr.Placa,
l.DataInicio,
l.DataFim,
Cr.StaAlugado,
cr.IdCarro

FROM Locacao l
join Cliente c on c.IdCliente = l.Id_Cliente
join Carro cr on cr.IdCarro = l.Id_Carro;



delimiter //
create trigger Validar_Disponibilidade
before insert on Locacao 
for each row
begin
DECLARE msg VARCHAR(32) DEFAULT "";

if( (select StaAlugado from Carro where IdCarro = new.Id_Carro) = 1) then

 set msg = 'Erro:O Carro está alugado!';
	 signal sqlstate '45000' set message_text = msg;
end if;



end//
delimiter ;


