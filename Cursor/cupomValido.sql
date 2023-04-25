DROP PROCEDURE IF EXISTS cupomValido;
SET SQL_SAFE_UPDATES = 0;
DELIMITER ||
CREATE PROCEDURE cupomValido()
BEGIN
    DECLARE status_consulta BOOLEAN;
    DECLARE id_v INT;
    DECLARE data_v DATE;
    DECLARE hoje date;
    
    DECLARE cur CURSOR FOR SELECT id, data_validade FROM cupons;
    
    
    OPEN cur;
    start_loop: LOOP
        FETCH NEXT FROM cur INTO id_v, data_v;
        if data_v < curdate() then
			UPDATE cupons SET valido = false where id = id_v;
		end if;
    END LOOP;
    CLOSE cur;
END ||
DELIMITER ;

CALL cupomValido();
