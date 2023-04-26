DROP PROCEDURE IF EXISTS verificaTelefone;
DELIMITER $$

CREATE PROCEDURE verificaTelefone()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE tel VARCHAR(255);
DECLARE cur CURSOR FOR SELECT telefone FROM contato;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

CREATE TEMPORARY TABLE IF NOT EXISTS resultado_temp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resultado VARCHAR(255)
);

OPEN cur;

read_loop: LOOP
    FETCH cur INTO tel;
    IF done THEN
        LEAVE read_loop;
    END IF;

    IF CHAR_LENGTH(tel) > 14 THEN
        INSERT INTO resultado_temp (resultado) VALUES (CONCAT('O telefone ', tel, ' é muito longo!'));
    ELSE
        INSERT INTO resultado_temp (resultado) VALUES (CONCAT('O telefone', tel, ' é válido!'));
    END IF;
END LOOP;

CLOSE cur;

SELECT resultado FROM resultado_temp;

DROP TEMPORARY TABLE IF EXISTS resultado_temp;
END $$

DELIMITER ;
call verificaTelefone();
