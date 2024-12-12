create database Atividadecaleb;

use Atividadecaleb;


create table clientes(
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    sobrenome varchar(45) not null,
    email varchar(45) not null unique,
    data_nasc date not null
);

create table produtos(
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    preco_uni decimal(10, 2) not null,
    descricao text(245) not null,
    quantidade INT NOT NULL CHECK (quantidade >= 0)
);


create table usuarios(
	id int not null primary key auto_increment,
    login varchar(45) not null,
    senha varchar(45) not null,
    role ENUM('admin', 'vendedor') NOT NULL
	
);

CREATE TABLE vendas (
    id int not null auto_increment primary key,
    cliente_id int,
    vendedor_id int,
    produto_id int,
    quantidade int not null,
    valor_total DECIMAL(10, 2),
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (vendedor_id) REFERENCES usuarios(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO usuarios (login, senha, role) VALUES ('admin', 'admin', 'admin');

-- Consultas para verificar os dados 
SELECT * FROM usuarios;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM vendas;

-- inserts dos usuarios


INSERT INTO usuarios (login, senha, role) VALUES ('vendedor1', 'vendedor123', 'vendedor');
INSERT INTO usuarios (login, senha, role) VALUES ('vendedor2', 'vendedor456', 'vendedor');

-- inserts de produtos 

INSERT INTO produtos (nome, preco_uni, descricao, quantidade) 
VALUES ('iPhone 14 Pro Max', 9999.99, 'Smartphone com tela Super Retina XDR, chip A16 Bionic, câmera Pro 48MP e sistema operacional iOS 16.', 5);

INSERT INTO produtos (nome, preco_uni, descricao, quantidade) 
VALUES ('MacBook Pro 14 polegadas', 14999.99, 'Notebook com processador Apple M2 Pro, tela Liquid Retina XDR, teclado Magic Keyboard e Touch ID.', 3);

INSERT INTO produtos (nome, preco_uni, descricao, quantidade) 
VALUES ('AirPods Pro 2', 2999.99, 'Fones de ouvido com cancelamento de ruído ativo, modo transparência adaptável e áudio espacial com rastreamento de cabeça.', 10);

INSERT INTO produtos (nome, preco_uni, descricao, quantidade) 
VALUES ('Tênis Nike Air Max', 599.99, 'Tênis esportivo com amortecimento Air Max para maior conforto e estilo', 20);


-- insert clientes.
INSERT INTO clientes (nome, sobrenome, email, data_nasc) VALUES ('João', 'Silva', 'joao.silva@email.com', '1990-01-15');
INSERT INTO clientes (nome, sobrenome, email, data_nasc) VALUES ('Maria', 'Santos', 'maria.santos@email.com', '1985-07-20');
INSERT INTO clientes (nome, sobrenome, email, data_nasc) VALUES ('Pedro', 'Souza', 'pedro.souza@email.com', '1995-12-10');