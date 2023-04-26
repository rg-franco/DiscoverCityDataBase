USE db_discoveryCity;

drop procedure if exists listar_estabelecimentos_com_notas_altas;
DELIMITER $$
CREATE PROCEDURE listar_estabelecimentos_com_notas_altas()
BEGIN
    DECLARE estabelecimento_id INT;
    DECLARE estabelecimento_nome VARCHAR(50);
    DECLARE nota FLOAT;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    DECLARE cur CURSOR FOR
        SELECT est.id, est.nome, ava.nota
        FROM estabelecimento est
        JOIN avaliacao ava 
        ON est.id = ava.id_estabelecimento
        WHERE ava.nota > 4.0;
        
    OPEN cur;
    
    READ_LOOP: LOOP
        FETCH cur INTO estabelecimento_id, estabelecimento_nome, nota;
        IF (done) THEN
		SELECT CONCAT(estabelecimento_id, ' - ', estabelecimento_nome, ' - Nota: ', nota) AS 'Resultado';
        END IF;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;

call listar_estabelecimentos_com_notas_altas();

