DROP TRIGGER IF EXISTS calculoAvaliacaoMedia;
DELIMITER |
CREATE TRIGGER calculoAvaliacaoMedia AFTER INSERT ON avaliacao
FOR EACH ROW
BEGIN 
	DECLARE qtdUsuarios INT;
	SELECT count(*) INTO qtdUsuarios FROM avaliacao where id_estabelecimento = new.id_estabelecimento;
    
	update estabelecimento set media_nota = (media_nota + new.nota) / qtdUsuarios
    where id = new.id_estabelecimento;
END;
|
DELIMITER ;


DROP TRIGGER IF EXISTS data_avaliacao_atual;
DELIMITER |
CREATE TRIGGER data_avaliacao_atual BEFORE INSERT ON db_discoverycity.avaliacao
FOR EACH ROW
BEGIN 
	SET new.data_avaliacao = curdate();
END;
|
DELIMITER ;
		


