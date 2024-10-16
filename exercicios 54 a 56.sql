create database exercicios_54_56;

use exercicios_54_56;

create table clientes(
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    email varchar(45) not null unique,
    telefone varchar(11) not null
);


insert into clientes(nome, email, telefone) 
values ("João Silva", "joao@email.com","23456-7890"),
		("Maria Santos", "maria@email.com","87654-3210"),
		("Amarildo Carlos Pereira", "acarlos@email.com","75555-5555"),
		("Ana Rodrigues", "ana@email.com","77123-4567"),
		("Pedro Oliveira", "pedro@email.com","33888-9999");
