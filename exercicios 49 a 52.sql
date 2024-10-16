create database exercicios_49_52;

use exercicios_49_52;

create table produtos(
	id int not null primary key auto_increment,
    nome varchar(50),
    descricao text(255),
    preco decimal(10, 2),
    quantidade int
);


insert into produtos(nome, descricao, preco, quantidade)
values ("camiseta", "camiseta de preto", 99.99, 99),
	   ("tenis", "tenis de preto", 99.99, 99),
       ("celular", "smartphone com tela black", 999.99, 99);
       
select * from produtos;

select * from produtos where preco > 20.00;

select nome, preco from produtos where 
preco = (select MAX(preco) from produtos);

select sum(quantidade) from produtos;

select sum(quantidade) from produtos 
where (id = 1 or id = 2);

update produtos set preco = 24.99, quantidade = 120
where id = 1;
select * from produtos;