-- Índice em uma coluna específica:

CREATE INDEX idx_titulo ON livro (TITULO);
desc livro;

-- Esse índice será útil se você tiver consultas frequentes que buscam livros com base no título.

-- Índice em várias colunas:

CREATE INDEX idx_emprestimo ON emprestimo (ID_CLIENTE, ID_LIVRO);
desc emprestimo;

-- Esse índice pode melhorar o desempenho de consultas que envolvam a tabela Emprestimo e façam uso das colunas cliente_id e livro_id em conjunto.

-- Índice único:

select * from cliente;

CREATE UNIQUE INDEX idx_email ON cliente (EMAIL);

-- exemplos de aviso de duplicate após o uso de unique index:

insert into cliente values (default, 'mauro', 'maria.silva@gmail.com', 'Rua josé', '(11) 9999-8800' );

-- Esse índice garante a unicidade dos valores na coluna EMAIL da tabela Cliente, evitando duplicatas.

-- Outros:

CREATE UNIQUE INDEX idx_emprestimo_devolucao ON emprestimo (ID_CLIENTE,ID_LIVRO, DATA_DEVOLUCAO);