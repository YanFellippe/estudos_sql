Create database SemiJoias;

Use SemiJoias;

Create table SemiJoias (
	   IdsemiJoias int primary key auto_increment ,
       Tipo varchar (20) ,
       Id_semiJoias int);
      
alter table SemiJoias add constraint Id_SemiJoias 
      foreign key(Id_Semijoias )
      references Semijoias (IdSemiJoias);
      
Insert into Semijoias (IdSemiJoias, tipo,Id_SemiJoias) values 
					 (null,'Prata',null);
                            
Insert into SemiJoias (IdSemiJoias,Tipo, Id_SemiJoias )values 
					 (null,'folheadoPrata',1);
                     
Insert into SemiJoias  (IdSemiJoias,tipo,Id_SemiJoias)values 
                     ( null,'Prata925',2 );
                     
Insert into SemiJoias (IdSemiJoias,Tipo ,Id_SemiJoias) values 
                       (null,'Ouro',null);
                       
Insert into SemiJoias (IdSemiJoias,Tipo ,Id_SemiJoias) values 
                       (null,'FolheadoOuro',null);
                       
Insert into SemiJoias (IdSemiJoias,Tipo ,Id_SemiJoias) values 
                       (null,'Ouro925',null);

SELECT 
    Prata1.tipo AS 'categoria ', Prata2.tipo 'subcategoria'
FROM
    SemiJoias AS Prata1
        INNER JOIN
    SemiJoias AS Prata2 ON Prata1.idsemijoias = Prata2.Id_semijoias;