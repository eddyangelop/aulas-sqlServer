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



SELECT nmProduto, cdProduto, vlProduto FROM tb_Produtos;

SELECT cdProduto FROM tb_Produtos;

SELECT cdProduto, nmProduto, vlProduto FROM tb_Produtos;
SELECT * FROM tb_Vendas