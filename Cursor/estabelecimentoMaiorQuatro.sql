USE db_discoverycity;

DROP PROCEDURE IF EXISTS listar_estabelecimentos_com_notas_altas;

DELIMITER $$

CREATE PROCEDURE listar_estabelecimentos_com_notas_altas()
BEGIN
    DECLARE estabelecimento_id INT;
    DECLARE estabelecimento_nome VARCHAR(50);
    DECLARE nota FLOAT;
    DECLARE done BOOLEAN DEFAULT FALSE;
    
    DECLARE cur CURSOR FOR
        SELECT est.id, est.nome, est.media_nota
        FROM estabelecimento est
        WHERE  est.media_nota > 4.0;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_resultados (
        resultado VARCHAR(100)
    );
    
    OPEN cur;
    
    READ_LOOP: LOOP
        FETCH cur INTO estabelecimento_id, estabelecimento_nome, nota;
        IF (done) THEN
            LEAVE READ_LOOP;
        END IF;
        
        INSERT INTO temp_resultados (resultado)
        VALUES (CONCAT(estabelecimento_id, ' - ', estabelecimento_nome, ' - Nota: ', nota));
    END LOOP;

    CLOSE cur;
    
    SELECT * FROM temp_resultados;
    DROP TEMPORARY TABLE IF EXISTS temp_resultados;
    
END$$

DELIMITER ;

CALL listar_estabelecimentos_com_notas_altas();
