drop function if exists count_estabelecimentos;
DELIMITER $$
CREATE FUNCTION count_estabelecimentos(cidade VARCHAR(50))
RETURNS INT
deterministic
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) as "Quantidade Estabelecimentos" 
    INTO total FROM estabelecimento e 
    JOIN endereco en ON e.id = en.id_estabelecimento
    WHERE en.cidade = cidade;
    
    RETURN total;
END $$
DELIMITER ;

SELECT count_estabelecimentos('São Paulo');

