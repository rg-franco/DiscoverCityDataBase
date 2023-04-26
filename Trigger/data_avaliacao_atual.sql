DROP TRIGGER IF EXISTS data_avaliacao_atual;
DELIMITER |
CREATE TRIGGER data_avaliacao_atual BEFORE INSERT ON db_discoverycity.avaliacao
FOR EACH ROW
BEGIN 
	SET new.data_avaliacao = curdate();
END;
|
DELIMITER ;
