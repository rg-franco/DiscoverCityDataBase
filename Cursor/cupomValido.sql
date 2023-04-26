DROP PROCEDURE IF EXISTS cupomValido;
SET SQL_SAFE_UPDATES = 0;
DELIMITER ||
CREATE PROCEDURE cupomValido()
BEGIN
    DECLARE status_consulta BOOLEAN;
    DECLARE id_v INT;
    DECLARE data_v DATE;
    
    DECLARE cur CURSOR FOR SELECT id, data_validade FROM cupons;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET status_consulta = TRUE;
    
    SET status_consulta = FALSE;
    OPEN cur;
    start_loop: LOOP
        FETCH NEXT FROM cur INTO id_v, data_v;
        IF status_consulta THEN
            LEAVE start_loop;
        END IF;
        IF data_v < CURDATE() THEN
            UPDATE cupons SET valido = false WHERE id = id_v;
        END IF;
    END LOOP;
    CLOSE cur;
END ||
DELIMITER ;

CALL cupomValido();
