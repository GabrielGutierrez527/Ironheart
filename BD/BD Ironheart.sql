create database Ironheart;

use Ironheart;

create table armamento (
idArmamento int primary key auto_increment,
nomeArmamento varchar(50)
) auto_increment = 1;

create table armadura (
idArmadura int primary key auto_increment,
nomeArmadura varchar (50)
) auto_increment = 1;

create table usuario (
idUsuario varchar(50) primary key not null,
email varchar(50) not null,
senha varchar(50) not null,
fkArmamento int,
fkArmadura int,
constraint fkArma foreign key (fkArmamento)
	references armamento (idArmamento),
constraint fkArmaduras foreign key (fkArmadura)
	references armadura (idArmadura)
);

drop table armamento;
drop table armadura;
drop table usuario;
truncate table usuario;

insert into armamento values
(null, 'Espada Curta'),
(null, 'Espada Longa'),
(null, 'Espada Grande'),
(null, 'Machado'),
(null, 'Alabarda'),
(null, 'Maça/Martelo'),
(null, 'Lança');

insert into armadura values
(null, 'Estilo Milanês'),
(null, 'Estilo Gótico'),
(null, 'Estilo Maximiliano'),
(null, 'Estilo Greenwich');

select * from armamento;
select * from armadura;
select * from usuario;
select idUsuario, fkArmamento, nomeArmamento from usuario join armamento on idArmamento = fkArmamento;
select idUsuario, fkArmadura, nomeArmadura from usuario join armadura on idArmadura = fkArmadura;

select count(usuario.fkArmamento) as Voto, Armamento.nomeArmamento as Arma from usuario join armamento on armamento.idArmamento = usuario.fkArmamento group by usuario.fkArmamento;
select count(usuario.fkArmadura) as Voto, Armadura.nomeArmadura as Armadura from usuario join armadura on armadura.idArmadura = usuario.fkArmadura group by usuario.fkArmadura;


