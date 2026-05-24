/*Uma Procedure (ou Stored Procedure) é um conjunto de comandos SQL armazenado diretamente no banco de dados e executado sempre que necessário.

Ela funciona como uma rotina automatizada, permitindo centralizar regras de negócio, reutilizar códigos SQL e executar tarefas de forma mais rápida, segura e organizada.

As Procedures são muito utilizadas para:

Automatizar processos repetitivos;
Realizar consultas complexas;
Inserir, atualizar ou excluir dados;
Melhorar desempenho e segurança;
Centralizar regras de negócio dentro do banco de dados.*/


-- Função para calcular a quantidade de livros disponíveis:

use biblioteca;
DROP PROCEDURE IF EXISTS sp_livros_emprestados_por_cliente;

-- Função para calcular a quantidade de livros disponíveis:

DELIMITER $

CREATE FUNCTION calcular_quantidade_disponivel(F_ID_LIVRO INT)

RETURNS INT DETERMINISTIC

BEGIN

	DECLARE QUANTIDADE_TOTAL INT;
	
	DECLARE QUANTIDADE_EMPRESTADA  INT;
	
	DECLARE QUANTIDADE_DISPONIVEL INT;
	
	SELECT QUANTIDADE INTO QUANTIDADE_TOTAL FROM livro WHERE ID_LIVRO = F_ID_LIVRO ;
	
	SELECT COUNT(*) INTO QUANTIDADE_EMPRESTADA FROM emprestimo WHERE ID_LIVRO = F_ID_LIVRO AND DATA_DEVOLUCAO IS NULL;
	
	RETURN QUANTIDADE_EMPRESTADA;

END;

$

DELIMITER ;

SELECT calcular_quantidade_disponivel();



-- Consultar todos os livros emprestados por um determinado cliente na tabela "Emprestimo":

DELIMITER //

CREATE PROCEDURE sp_livros_emprestados_por_cliente(

    IN P_ID_CLIENTE INT

)

BEGIN

    SELECT 
        TITULO,
        AUTOR,
        DATA_EMPRESTIMO,
        DATA_DEVOLUCAO

    FROM emprestimo AS e

    INNER JOIN livro AS l
        ON l.ID_LIVRO = e.ID_LIVRO

    WHERE e.ID_CLIENTE = P_ID_CLIENTE;

END //

DELIMITER ;

-- Esta procedure deve ser criada pelo formato script, utilizando o comando Alt + X

SHOW PROCEDURE STATUS
WHERE Db = 'biblioteca';

SHOW PROCEDURE STATUS
WHERE Db = 'biblioteca'
AND Name = 'sp_livros_emprestados_por_cliente';


call sp_livros_emprestados_por_cliente(1);


drop PROCEDURE sp_livros_emprestados_por_cliente;


-- Atualizar a quantidade disponível de um livro na tabela "Livro":

DELIMITER $

CREATE PROCEDURE atualizar_quantidade_disponivel(

    IN P_ID_LIVRO INT,

    IN P_QUANTIDADE INT

)

BEGIN

    UPDATE livro

    SET QUANTIDADE= P_QUANTIDADE

    WHERE ID_LIVRO = P_ID_LIVRO ;

END;

$

DELIMITER ;

select * from livro; -- verificamos a quantidade do livro com ID 3 que anteriormente tinha 1 livro para emprestimo

CALL atualizar_quantidade_disponivel(3,5); -- atualizamos o estoque do livro de ID 3 de 1 para 5 livros disponiveis.



-- Atualizar a data de devolução de um empréstimo

DELIMITER $

CREATE PROCEDURE sp_atualizar_data_devolucao(

    IN P_ID_EMPRESTIMO INT,

    IN P_NOVA_DATA DATE

)

BEGIN

    UPDATE emprestimo

    SET DATA_DEVOLUCAO = P_NOVA_DATA

    WHERE ID_EMPRESTIMO = P_ID_EMPRESTIMO;

END;

$

DELIMITER ;

select * from emprestimo; -- verificamos as datas de emprestimo anteriores

call sp_atualizar_data_devolucao(2,curdate()); -- anteriormente o indice 2 estava com data devolução prevista normalizada, mas o cliente resolveu devolver hoje.


-- Excluir um livro da tabela "Livro" e atualizar automaticamente os registros na tabela "Emprestimo":

DELIMITER $

CREATE PROCEDURE sp_excluir_livro(

    IN P_ID_LIVRO INT

)

BEGIN

    START TRANSACTION;

    DELETE FROM emprestimo

    WHERE ID_LIVRO = P_ID_LIVRO;

    DELETE FROM livro

    WHERE ID_LIVRO = P_ID_LIVRO;

    COMMIT;

END;

$

DELIMITER ;



select * from emprestimo; -- para saber qual livro vamos deletar - pelo seu ID_LIVRO

select * from livro; -- para saber qual livro vamos deletar - pelo seu ID_LIVRO


-- DELETAMOS DO SISTEMA O LIVRO QUE NÃO QUEREMOS MAIS EMPRESTAR 

call sp_excluir_livro(23);

-- SE DELETARMOS O LIVRO DIRETO SEM A PROCEDURE O MYSQL NÃO PERMITIRÁ DEVIDO TER UMA FK CONSTRAINT ANTERIORMENTE 

delete from livro where ID_LIVRO=9; 

/*Erro SQL [1451] [23000]: Cannot delete or update a parent row: a foreign key constraint fails (`biblioteca`.`emprestimo`,
 * 
 * CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`ID_LIVRO`) REFERENCES `livro` (`ID_LIVRO`))*/

