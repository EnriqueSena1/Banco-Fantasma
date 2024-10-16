create database exemplo3;
-- USANDO O BANCO EXERCICIOS_SELECT
use exemplo3;

create table produtos(
	id int not null primary key auto_increment,
    nome varchar(50),
    descricao text(255),
    preco decimal(10, 2),
    quantidade int
);

show tables; -- visualizar tabelas criadas

insert into produtos(nome, descricao, preco, quantidade)
values ("camiseta", "camiseta branca de algodao", 19.99, 50),
	   ("tenis", "tenis esportivo preto", 49.99, 50),
       ("celular", "smartphone com tela oled", 399.99, 20);

-- trazer todos os produtos da tabela
select * from produtos;

-- uma consulta que retorne apenas produtos com preco
-- maior que 20
select * from produtos where preco > 20.00;

-- consulta para trazer o preco maximo
select nome, preco from produtos where 
preco = (select MAX(preco) from produtos);

-- contar quantidade de produtos
select sum(quantidade) from produtos;

-- quero somar apenas quantidade do produto 1 e 2
select sum(quantidade) from produtos 
where (id = 1 or id = 2);

-- atualizar qtd para 120 e preco para 24.99
update produtos set preco = 24.99, quantidade = 120
where id = 1;
select * from produtos;