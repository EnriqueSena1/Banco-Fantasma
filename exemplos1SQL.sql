create database exemplos1;

use exemplos1;


create table cliente(
	id int not null primary key,
    nome varchar(20) not null,
    sobrenome varchar (20) not null,
    email varchar (45) not null,
    data_de_nascimento date not null
);


create table produto(
	id int not null primary key,
    nome varchar(20) not null,
    preco varchar (20) not null,
    descricao varchar (100) not null,
    categoria date not null
);


create table pedidos(
	id int not null primary key,
    data_de_pedido date not null,
    id_cliente int not null,
    foreign key (id_cliente) references cliente(id),
    descricao varchar (100) not null
);

create table itensPedidos(
	id int not null primary key,
    id_pedido int not null,
    foreign key (id_pedido) references pedidos(id),
    id_produto int not null,
    foreign key (id_produto) references produto(id)
);

create table categoria(
	id int not null primary key,
	nome_categoria varchar(45) not null
);

create table funcionarios(
	id int not null primary key,
    nome varchar(20) not null,
    sobrenome varchar (20) not null,
    cargo varchar (45) not null,
    data_de_contratacao  date not null,
    salario decimal(10,2)
);

show tables;
