DROP VIEW IF EXISTS vw_vendas_vendedores;
CREATE VIEW vw_vendas_vendedores AS
SELECT vendedores.nome AS nome_vendedor,
       vendedores.matricula,
       SUM(vendas.quantidade * produtos.valor) AS total_vendido,
       SUM(vendas.quantidade * produtos.valor * 0.05) AS comissao
FROM vendas
JOIN produtos ON vendas.produtoID = produtos.id
JOIN vendedores ON vendas.vendedorID = vendedores.id
GROUP BY vendedores.id;

DROP VIEW IF EXISTS vw_vendas;
CREATE VIEW vw_vendas AS
SELECT v.data AS data_venda, p.nome AS nome_produto, ve.nome AS nome_vendedor
FROM vendas v
JOIN produtos p ON v.produtoID = p.id
JOIN vendedores ve ON v.vendedorID = ve.id;

DROP VIEW IF EXISTS vendas_por_produto;
CREATE VIEW vendas_por_produto AS
SELECT p.nome AS produto, SUM(v.quantidade * p.valor) AS total_vendas
FROM produtos p
JOIN vendas v ON p.id = v.produtoID
GROUP BY p.id;
