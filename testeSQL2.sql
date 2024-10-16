create database atividade7;

use atividade7;

create table fornecedor(
	codigo int not null primary key,
    nome varchar(45),
    CNPJ varchar (20) not null,
    endereco varchar (45) not null
);

create table prod(
	codigo int not null primary key,
    nome varchar(45),
	descricao varchar(254)
);


create table fornecedor_has_produto(
	id int not null primary key,
	fornecedor_id int not null ,
	foreign key (fornecedor_id) references fornecedor(codigo),
    prod_id int not null,
    foreign key (prod_id) references prod(codigo)
);

create table cliente(
	codigo int not null primary key,
    nome varchar(45),
    endereco varchar(70)
);

create table loja(
	codigo int not null primary key,
	nome varchar(45),
    cnpj varchar(70)
);

create table vendaaa1(
	notafiscal int not null primary key,
    data1 date not null,
    valor_total decimal(10,2) not null,
    loja_codigo int not null,
    foreign key (loja_codigo) references loja(codigo),
    cliente_codigo int not null,
    foreign key (cliente_codigo) references cliente(codigo)
);


create table prod_has_vendas(
	prod_codigo int not null,
	venda_notafiscal int not null,
	venda_loja_codigo int not null,
	venda_cliente_codigo int not null,
    foreign key (prod_codigo) references prod(codigo),
    foreign key (venda_notafiscal) references vendaaa1(notafiscal),
    foreign key (venda_loja_codigo) references vendaaa1(loja_codigo),
    foreign key (venda_cliente_codigo) references vendaaa1(cliente_codigo),
    preco decimal(10,2),
    quantidade int not null
);


show tables;