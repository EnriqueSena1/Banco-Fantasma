CREATE DATABASE Biblioteca;
USE Biblioteca;
CREATE TABLE Autores (
 autor_id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 pais VARCHAR(50)
);
CREATE TABLE Categorias (
 categoria_id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(50) NOT NULL
);
CREATE TABLE Livros (
 livro_id INT AUTO_INCREMENT PRIMARY KEY,
 titulo VARCHAR(200) NOT NULL,
 autor_id INT,
 categoria_id INT,
 preco DECIMAL(10, 2) NOT NULL,
 estoque INT NOT NULL,
 FOREIGN KEY (autor_id) REFERENCES Autores(autor_id),
 FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);
CREATE TABLE Membros (
 membro_id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 endereco VARCHAR(200),
 telefone VARCHAR(20)
);
CREATE TABLE Emprestimos (
 emprestimo_id INT AUTO_INCREMENT PRIMARY KEY,
 livro_id INT,
 membro_id INT,
 data_emprestimo DATE NOT NULL,
 data_devolucao DATE,
 FOREIGN KEY (livro_id) REFERENCES Livros(livro_id),
 FOREIGN KEY (membro_id) REFERENCES Membros(membro_id)
);
INSERT INTO Autores (nome, pais) VALUES
('George Orwell', 'Reino Unido'),
('J.K. Rowling', 'Reino Unido'),
('Gabriel Garcia Marquez', 'Colômbia'),
('J.R.R. Tolkien', 'Reino Unido');
INSERT INTO Categorias (nome) VALUES
('Ficção Científica'),
('Fantasia'),
('Romance'),
('Biografia');
INSERT INTO Livros (titulo, autor_id, categoria_id, preco, estoque) VALUES
('1984', 1, 1, 35.90, 20),
('Harry Potter e a Pedra Filosofal', 2, 2, 49.90, 15),
('Cem Anos de Solidão', 3, 3, 42.50, 10),
('O Senhor dos Anéis', 4, 2, 75.00, 8);
INSERT INTO Membros (nome, endereco, telefone) VALUES
('João da Silva', 'Rua A, 123', '123456789'),
('Maria Oliveira', 'Rua B, 456', '987654321'),
('Carlos Souza', 'Rua C, 789', '1122334455');
INSERT INTO Emprestimos (livro_id, membro_id, data_emprestimo, data_devolucao)
VALUES
(1, 1, '2023-09-10', '2023-09-20'),
(2, 2, '2023-09-12', '2023-09-22'),
(3, 3, '2023-09-15', NULL),
(4, 1, '2023-09-17', '2023-09-27');



# Exercícios:
# 1-Quais são os livros atualmente em estoque na biblioteca? OK
select titulo from Livros;

# 2-Quais autores têm livros na biblioteca e de que países são?
select Autores.nome, Autores.pais from Autores join Livros on Autores.autor_id = Livros.autor_id;

# 3-Qual é o preço de cada livro?
select titulo,  preco from Livros;

# 4-Quais membros pegaram livros emprestados?
select Membros.nome from Membros 
join Emprestimos on Membros.membro_id = Emprestimos.membro_id;

# 5-Quais livros foram emprestados até agora?
select Livros.titulo from Livros
join Emprestimos on Livros.livro_id = Emprestimos.livro_id;

# 6-Qual é a receita total de cada livro (considerando o preço e as unidades vendidas)?

select Livros.titulo as Nome_livros, count(Emprestimos.livro_id)*Livros.preco
from Livros
join Emprestimos on Emprestimos.livro_id = Livros.livro_id group by Livros.titulo;


# 7- Quais categorias de livros estão disponíveis na biblioteca?
select Categorias.categoria_id, Categorias.nome from Categorias;

# 7- Quais categorias de livros estão disponíveis na biblioteca?
# select Categorias.categoria_id, Categorias.nome from Categorias;
select Categorias.nome as Categorias_Disponiveis
from Livros
join Categorias on Livros.categoria_id = Categorias.categoria_id group by Categorias_Disponiveis;

# 8- Quais são os autores e suas respectivas categorias de livros?
select Autores.nome as Nome_Autor, Categorias.nome as Nome_Categoria
from Livros
join Autores on Autores.autor_id = Livros.livro_id
join Categorias on Categorias.categoria_id = Livros.categoria_id;

# 9- Qual é a quantidade total de livros de cada categoria?
select C.nome, count(L.livro_id) as Quantidade 
from Categorias C 
join Livros L on C.categoria_id = L.categoria_id group by C.nome;


# 10- Liste todos os livros junto com o nome do autor e a categoria.
select L.titulo as Livro, A.nome as Autor, C.nome as Categoria
from Livros L
join Autores A on A.autor_id = L.autor_id
join Categorias C on C.categoria_id = L.categoria_id;

# 11- Quem são os membros que mais pegaram livros emprestados?

select M.nome as Nome_Cliente, count(E.membro_id) as Quantidade_De_Emprestimos
from Membros M
join Emprestimos E on E.membro_id = M.membro_id group by Nome_Cliente;


# 12- Quais livros foram devolvidos e em que datas?

select L.titulo, E.data_devolucao
from Emprestimos E
join Livros L on L.livro_id = E.livro_id
where E.data_devolucao is not null;

# 13- Qual é a média de preço dos livros na biblioteca?

select avg(Livros.preco) as Media_Preco from Livros;

# 14- Qual é a quantidade total de livros emprestados?

select count(E.livro_id) as Livros_Emprestados from Emprestimos E where E.data_devolucao is null;

# 15- Quais membros ainda não devolveram os livros?

select M.nome
from Emprestimos E
join Membros M on E.membro_id = M.membro_id where E.data_devolucao is null;

# 16- Qual foi a receita gerada por empréstimos até agora?

select sum(Livros.preco) as Receita_Gerada
from Livros
join Emprestimos on Emprestimos.livro_id = Livros.livro_id;


# 17- Quais são os livros disponíveis em cada categoria?

select Livros.titulo as Nome_Livro, Categorias.nome as Nome_Categoria
from Livros
join Categorias on Categorias.categoria_id = Livros.categoria_id;
