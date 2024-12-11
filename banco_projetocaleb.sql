create database Atividadecaleb;
use Atividadecaleb;


create table clientes(
	id_cliente int not null primary key auto_increment,
    nome varchar(45) not null,
    sobrenome varchar(45) not null,
    email varchar(45) not null unique,
    data_nasc date not null
);

create table produtos(
	id_produto int not null primary key auto_increment,
    nome varchar(45) not null,
    preco_uni decimal(10, 2) not null,
    descricao text(245) not null,
    qtd_estoque int not null
);

create table usuarios(
	id_usuario int not null primary key auto_increment,
    login varchar(45) not null,
    senha varchar(45) not null,
	cargo_usuario varchar(45) #aqui vai ser um join
);

create table cargos(
	id_administrativo int not null primary key auto_increment,
    id_vendedor int not null primary key auto_increment
);


create table Vendas(
	# join de cliente ?
	id_venda int not null primary key auto_increment,
    id_cliente int not null,
    foreign key alguma coisa references alguma coisa,
    status_pedido varchar(45) not null
);

create table parcela(
	valor
    idvenda
);

create table itensdevendas();

