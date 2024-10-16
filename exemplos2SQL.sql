CREATE DATABASE exemplo2; 
use exemplo2;
create table clientes(
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    sobrenome varchar(45) not null,
    email varchar(45) not null unique,
    data_nasc date not null
);

insert into clientes(id, nome, sobrenome, email, data_nasc) 
values (null, "henr", "kin", "henrkin@gmail", "2000-10-01");

insert into clientes(nome, sobrenome, email, data_nasc) 
values ("lucas", "loide", "lucasloide@gmail", "1955-10-01");

insert into clientes(nome, sobrenome, email, data_nasc) 
values ("lucas", "loide", "lucasout@gmail", "1955-10-01"),
		("caue", "loide", "caueloide@gmail", "1980-10-01"),
        ("andre", "arthur", "andre@gmail", "1975-10-01"),
        ("iza", "loide", "izaloide@gmail", "1990-10-01");

select * from clientes;

create table produtos(
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    preco decimal(10, 2) not null,
    descricao text(245) not null,
    categoria varchar(45) not null
);

create table pedidos(
	id int not null primary key auto_increment,
    data_pedido date not null,
    id_cliente int not null,
    foreign key (id_cliente) references clientes(id),
    status_pedido varchar(45) not null
);

select id, nome from clientes;
insert into pedidos(data_pedido, id_cliente, status_pedido) 
values ("2024-09-24", 1, "em andamento");

select * from pedidos;

update pedidos set status_pedido = "concluido" where id=1;


select nome from clientes order by nome asc;

