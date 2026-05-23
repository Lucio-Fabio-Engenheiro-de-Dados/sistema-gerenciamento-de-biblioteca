​-- Consultas a serem feitas:

    --Selecionar todos os livros disponíveis
    --Selecionar todos os livros emprestados
    --Selecionar todos os clientes que possuem empréstimos em aberto
    --Inserir um novo livro
    --Realizar um empréstimo
    --Atualizar a data de devolução de um empréstimo
    --Excluir um cliente

--Consultas:

--Selecionar todos os livros disponíveis:

SELECT * FROM LIVRO WHERE ID_LIVRO NOT IN (SELECT ID_LIVRO FROM EMPRESTIMO WHERE DATA_DEVOLUCAO IS NULL);

--Selecionar todos os livros emprestados:

SELECT * FROM LIVRO WHERE ID_LIVRO IN (SELECT ID_LIVRO FROM EMPRESTIMO WHERE DATA_DEVOLUCAO IS NULL);

--Selecionar todos os clientes que possuem empréstimos em aberto:

SELECT c.NOME, e.DATA_EMPRESTIMO FROM cliente c

JOIN emprestimo e ON c.ID_CLIENTE = e.ID_CLIENTE

WHERE e.DATA_DEVOLUCAO IS NULL;


-- INNER JOIN

SELECT c.*,e.*  FROM emprestimo AS e

INNER JOIN cliente c

ON c.ID_CLIENTE = e.ID_CLIENTE

WHERE e.DATA_DEVOLUCAO IS NULL;

--Operações CRUD:

--Inserir um novo livro:
DESC LIVRO;

INSERT INTO Livro (titulo, autor, ano_publicacao, disponivel)

VALUES ('Aventuras na Biblioteca', 'João da Silva', 2022, true);


INSERT INTO Livro (titulo, autor, ano_publicacao, quantidade)

VALUES ('Aventuras na Biblioteca', 'João da Silva', 2026, 2);

--Realizar um empréstimo:
desc 

INSERT INTO emprestimo (id_livro, id_cliente, id_funcionario, data_emprestimo, DATA_DEVOLUCAO_PREVISTA, DATA_DEVOLUCAO )

VALUES (1, 1, 1, '2023-06-01', '2023-06-16', '2026-05-23');


select * from emprestimo
ORDER BY data_devolucao DESC;


--Atualizar a data de devolução de um empréstimo:

UPDATE Emprestimo SET data_devolucao = '2026-05-23' WHERE id = 1;

--Excluir um cliente:

DELETE FROM Cliente WHERE id = 1;