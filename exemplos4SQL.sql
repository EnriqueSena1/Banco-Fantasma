create database vendas_join;
use vendas_join;

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15)
);

select nome, telefone from clientes;

CREATE TABLE vendas (
    id INT PRIMARY KEY,
    cliente_id INT,
    DataDaVenda DATE,
    valor DECIMAL(10, 2),
    produto VARCHAR(100),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
select clientes.nome, clientes.telefone, vendas.valor, vendas.produto 
from clientes 
join vendas on clientes.id = vendas.cliente_id
where clientes.nome like "João Silva";


INSERT INTO clientes (id, nome, email, telefone) VALUES
(1, 'João Silva', 'joao@example.com', '123456789'),
(2, 'Maria Oliveira', 'maria@example.com', '987654321'),
(3, 'Carlos Santos', 'carlos@example.com', '456789123');

INSERT INTO vendas (id, cliente_id, DataDaVenda, valor, produto) VALUES
(1, 1, '2024-01-15', 150.00, 'Produto A'),
(2, 2, '2024-01-20', 200.00, 'Produto B'),
(3, 1, '2024-02-10', 300.00, 'Produto C'),
(4, 3, '2024-02-15', 100.00, 'Produto D');



-- qual o total de compras por cliente
select clientes.nome, SUM(vendas.valor) 
from clientes 
join vendas on clientes.id = vendas.cliente_id
group by clientes.nome;

-- quais são as vendas realizadas após o dia 31/01/2024
select clientes.nome, clientes.telefone, vendas.DataDaVenda, 
vendas.valor, vendas.produto 
from clientes 
join vendas on clientes.id = vendas.cliente_id
where vendas.DataDaVenda > "2024-01-31";