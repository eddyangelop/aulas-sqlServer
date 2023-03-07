--Soma dos valores dos produtos

SELECT * FROM tb_ProdutoVenda

SELECT * FROM tb_Produtos

--Seleção dos dados com valores inner join
SELECT P.cdProduto, P.nmProduto, PV.qtProduto, P.vlProduto 
FROM tb_Produtos  P INNER JOIN tb_ProdutoVenda PV
ON P.cdProduto = PV.cdProduto