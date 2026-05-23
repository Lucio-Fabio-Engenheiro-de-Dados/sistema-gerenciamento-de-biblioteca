​-- View para listar os livros disponíveis para empréstimo:

select * from emprestimo where DATA_DEVOLUCAO is null;

select * from livro where ID_LIVRO not in (select ID_LIVRO from emprestimo where DATA_DEVOLUCAO is null);


-- Essa view retorna apenas os livros que estão marcados como disponíveis para empréstimo.
CREATE VIEW vw_Livros_Disponiveis as

SELECT ID_LIVRO, TITULO, AUTOR

FROM livro

WHERE ID_LIVRO NOT IN (SELECT ID_LIVRO FROM EMPRESTIMO WHERE DATA_DEVOLUCAO IS NULL);

select * from vw_Livros_Disponiveis;



-- View para mostrar os empréstimos em andamento:

select * from emprestimo;


-- Essa view retorna os empréstimos em andamento, juntamente com os nomes dos clientes e títulos dos livros associados.

CREATE VIEW vw_EmprestimosAndamento AS

SELECT  c.NOME as CLIENTE, l.TITULO as LIVRO, e.DATA_EMPRESTIMO
FROM emprestimo e
inner JOIN cliente c 
ON e.ID_CLIENTE = c.ID_CLIENTE
inner JOIN livro l 
ON e.ID_LIVRO = l.ID_LIVRO
WHERE e.DATA_DEVOLUCAO IS NULL;


-- View para exibir o total de livros emprestados por cliente:

select * from emprestimo as e
inner join cliente c  
on C.ID_CLIENTE =e.ID_CLIENTE 

-- Essa view retorna o total de livros emprestados por cada cliente, considerando também os clientes que não possuem empréstimos registrados.
CREATE VIEW vw_TotalLivrosEmprestados AS

SELECT c.ID_CLIENTE, c.NOME as CLIENTE, COUNT(e.ID_EMPRESTIMO) as TOTAL_LIVROS

FROM cliente c

inner JOIN emprestimo e ON c.ID_CLIENTE = e.ID_CLIENTE

GROUP BY 1,2;

select * from vw_TotalLivrosEmprestados;

-- Essa view retorna o total de livros emprestados por cada cliente, considerando também os clientes que não possuem empréstimos registrados.