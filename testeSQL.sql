create database teste;

use teste;

create table cliente1(
	codigo int not null primary key,
    nome varchar(45) not null,
    cnpj varchar (20) not null,
    endereço varchar (45) not null
);

create table vendas(
	nota_fiscal int not null primary key,
    dataa date not null,
    valor_desc decimal(10,2) not null,
    entregas varchar(45) not null,
    cliente1_codigo int not null,
    foreign key (cliente1_codigo) references cliente1(codigo)
);

create table prod(
	codigo int not null primary key,
	nome varchar(45),
	descriçao varchar(45),
	preco_tabela varchar(45)
);

create table has(
	vendas_nota_fiscal int not null,
    vendas_cliente1_codigo int not null,
    prod_codigo int not null,
	foreign key (vendas_nota_fiscal) references vendas(nota_fiscal),
	foreign key (vendas_cliente1_codigo) references vendas(cliente1_codigo),
	foreign key (prod_codigo) references prod(codigo),
	quantidade int not null,
	prec_venda varchar (45) not null
);

show tables;