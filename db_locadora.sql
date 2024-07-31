/*Criação do BD LOCADORA*/
create database Locadora;
use Locadora;

create table Carro(
IdCarro int primary key auto_increment not null,
Modelo varchar(45) not null	,
Marca varchar(45) not null,
Ano year not null,
Placa varchar(8) not null unique,
Cor varchar(45) not null,
StaAlugado bit not null,
VlrSeguro decimal(6,2) not null,
Seguradora varchar(45) not null,
NumeroChassi char(17) not null unique,
Cilindradas int not null,
TipoCombustivel varchar(40) not null,
Categoria varchar(20) not null	
);



CREATE TABLE CLIENTE(
	IdCliente INT PRIMARY KEY auto_increment NOT NULL,
	Nome varchar(60) not null,
	CPF char(11) not null unique,
	Telefone varchar(11) not null,
	NadaConsta bit not null,
	Endereco varchar(45) NOT NULL,
	NumeroCasa int not null,
	Bairro varchar(30) not null,
	Uf char(2) not null
);


create table FUNCIONARIO(
IdFuncionario INT PRIMARY KEY auto_increment NOT NULL,
Nome varchar(45) NOT NULL,
Cargo varchar(30) NOT NULL,
Id_Responsavel int null
);

/* ALTER TABLE */
alter table FUNCIONARIO 
add constraint FK_IdResponsavel_FUNCIONARIO foreign key(Id_Responsavel) references FUNCIONARIO(IdFuncionario);


CREATE TABLE HISTORICO_MANUTENCAO(
	IdManut INT PRIMARY KEY auto_increment NOT NULL,
	Descricao VARCHAR(45) NOT NULL,
	Id_Carro INT NOT NULL,
	Valor DECIMAL(6,2) NOT NULL,
	Id_Funcionario INT NOT NULL,
    foreign key (Id_Funcionario) REFERENCES FUNCIONARIO(IdFuncionario),
    foreign key (Id_Carro) REFERENCES Carro(IdCarro)
);

CREATE TABLE LOCACAO(
	IdLocacao INT PRIMARY KEY auto_increment NOT NULL,
	Id_Carro INT NOT NULL,
	Id_Cliente INT NOT NULL,
	DataInicio datetime NOT NULL,
	DataFim datetime NOT NULL
);


create table Tipo_Evento(
IdTipoEvento int primary key auto_increment not null,
Titulo varchar(45) not null
);


create table EVENTO_CARRO(
	IdEvento int primary key auto_increment not null,
	Descricao varchar(300) not null,
	Data_Evento date not null,
	Valor decimal(8,2) not null,
	Id_Locacao int not null,
	Id_TipoEvento int not null,
	foreign key (Id_Locacao) REFERENCES LOCACAO(IdLocacao),
    foreign key (Id_TipoEvento) REFERENCES Tipo_Evento(IdTipoEvento)
);





