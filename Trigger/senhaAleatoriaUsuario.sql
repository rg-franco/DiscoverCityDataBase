DROP TRIGGER IF EXISTS senhaInicial;
DELIMITER |
CREATE TRIGGER senhaInicial before INSERT ON db_discoverycity.usuario
FOR EACH ROW
BEGIN 
	SET new.senha = floor(rand()*9000) + 1000;
END;
|
DELIMITER ;