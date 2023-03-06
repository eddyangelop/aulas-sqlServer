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