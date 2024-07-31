


delimiter //
create procedure Inserir_Cliente(
in Nome varchar(60),
in CPF char(11),
in Telefone varchar(11),
in NadaCosta bit,
in Endereco varchar(45),
in NumeroCasa int ,
in Bairro varchar(30),
in UF char(2)

)
begin

insert into Cliente(Nome,CPF,Telefone,NadaConsta,Endereco,NumeroCasa,Bairro,UF)
VALUES(Nome,CPF,Telefone,NadaCosta,Endereco,NumeroCasa,Bairro,UF);



end//
delimiter ;

