SELECT
-- SQL Server, Postgres, Oracle, mySql

SELECT coluna1,coluna2
FROM tabela

SELECT *
FROM tabela

SELECT DISTINCT coluna1, coluna2
FROM tabela


CREATE TABLE tb_Produtos(
cdProduto INT PRIMARY KEY IDENTITY(1,1),
nmProduto VARCHAR(50) NOT NULL, --Obrigatorio
vlProduto DECIMAL(6,2) NOT NULL

);


CREATE TABLE tb_Clientes(
cdCliente INT PRIMARY KEY IDENTITY(1,1),
nmCliente VARCHAR(50) NOT NULL,
dtNascimento DATE,
inSEXO VARCHAR(1) NOT NULL,
nmEdereco VARCHAR(50),
nmCidade VARCHAR(50),
nmEstado VARCHAR(30),
nmTelefone1 VARCHAR(15),
nmTelefone2 VARCHAR(15)

)

CREATE TABLE tb_Vendas (
cdVenda INT PRIMARY KEY IDENTITY(1,1),
cdProduto INT NOT NULL,
vlProduto DECIMAL(6,2) NOT NULL

);

--FOREIGN KEY(chave estrangeira)
--CONSTRAINT(regras)

ALTER TABLE tb_Vendas
ADD CONSTRAINT FK_Poduto_Vendas
FOREIGN KEY (cdProduto)
REFERENCES tb_Produtos(cdProduto)


--Inserções das tabelas
--INSERT INTO [nome da tabela] ([colunas]) VALUES ()

INSERT INTO tb_Produtos VALUES ('Suco de Laranja', 4.5);

--Ordem errada
INSERT INTO tb_Produtos VALUES (4.5,'Suco de Manga');

--Com os nomes das colunas
INSERT INTO tb_Produtos(vlProduto, nmProduto) VALUES (3.5,'Suco de Manga');

--testando o constraint
INSERT INTO tb_Vendas VALUES (4, 3.2)

--Selecionando dados das tabelas
--SELECT[Colunas] FROM [Tabela]


--Inserindo novos produtos

--SELECT * FROM tb_Produtos
--SELECT * FROM tb_Vendas
--SELECT * FROM tb_Clientes
--SELECT * FROM tb_ProdutoVenda


-- 1 - Criar um cliente


--INSERT INTO tb_Clientes VALUES('Eddyangelop', '1988-12-24', 'M', 'Travessa do tranco, 56', 'Fortaleza', 'Ceará', '85 9999-9999', '85 1234-5678');

-- 2 - Criar venda
--INSERT INTO tb_Vendas VALUES (1, GETDATE());

-- 3 - Inserir produtos na venda
--INSERT INTO tb_ProdutoVenda VALUES (1, 1, 3);
--INSERT INTO tb_ProdutoVenda VALUES (1, 2, 1);
--INSERT INTO tb_ProdutoVenda VALUES (1, 4, 4);



SELECT nmProduto, cdProduto, vlProduto FROM tb_Produtos;

SELECT cdProduto FROM tb_Produtos;

SELECT cdProduto, nmProduto, vlProduto FROM tb_Produtos;
SELECT * FROM tb_Vendas



--INSERT INTO [nome da tabela] ([colunas]) VALUES ()

INSERT INTO tb_Produtos VALUES ('Suco de Laranja', 4.5);

--Ordem errada
INSERT INTO tb_Produtos VALUES (4.5,'Suco de Manga');

--Com os nomes das colunas
INSERT INTO tb_Produtos(vlProduto, nmProduto) VALUES (3.5,'Suco de Manga');


--Remover a tabela de vendas
DROP TABLE tb_Vendas


CREATE TABLE tb_Vendas (
cdVenda INT PRIMARY KEY IDENTITY(1,1),
cdCliente INT FOREIGN KEY REFERENCES tb_Clientes (cdCliente),
dtVenda DATETIME NOT NULL

);

CREATE TABLE tb_ProdutoVenda (
cdProdutoVenda INT PRIMARY KEY IDENTITY(1,1),
cdVenda INT FOREIGN KEY REFERENCES tb_Vendas (cdVenda) NOT NULL,
cdProduto INT FOREIGN KEY REFERENCES tb_Produtos (cdProduto) NOT NULL,
qtProduto INT NOT NULL

)


--Soma dos valores dos produtos

SELECT * FROM tb_ProdutoVenda

SELECT * FROM tb_Produtos

--Seleção dos dados com valores inner join
SELECT  V.cdVenda, C.nmCliente, P.cdProduto, P.nmProduto, PV.qtProduto, P.vlProduto, qtProduto * vlProduto AS qtValorTotalProduto
FROM tb_Produtos  P INNER JOIN tb_ProdutoVenda PV
ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Vendas V ON PV.cdVenda = V.cdVenda
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente


--SOMA DOS VALORES
SELECT C.nmCliente, SUM(PV.qtProduto) AS qtTotalProdutos, P.nmProduto, SUM(P.vlProduto * PV.qtProduto) AS qtValorTotalVenda--, P.vlProduto, qtProduto * vlProduto AS qtValorTotalProduto
FROM tb_Produtos  P INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Vendas V ON PV.cdVenda = V.cdVenda
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente
GROUP BY C.nmCliente, P.nmProduto

--VALOR TOTAL
SELECT C.nmCliente, SUM(PV.qtProduto) AS qtTotalProdutos, SUM(P.vlProduto * PV.qtProduto) AS qtValorTotalVenda--, P.vlProduto, qtProduto * vlProduto AS qtValorTotalProduto
FROM tb_Produtos  P INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Vendas V ON PV.cdVenda = V.cdVenda
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente
GROUP BY C.nmCliente