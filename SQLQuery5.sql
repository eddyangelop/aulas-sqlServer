--Soma dos valores dos produtos

SELECT * FROM tb_ProdutoVenda

SELECT * FROM tb_Produtos

--Sele��o dos dados com valores inner join
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