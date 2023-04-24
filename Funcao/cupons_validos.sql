drop function if exists cupons_validos;
DELIMITER ||
CREATE FUNCTION cupons_validos(estabelecimento_id int, data_uso date)
RETURNS varchar(50)
DETERMINISTIC
BEGIN   
	DECLARE cod_cupom VARCHAR(50);
    DECLARE descricao_cupom VARCHAR(100);
    
   SELECT c.codigo INTO cod_cupom
   FROM cupons c
   WHERE data_uso < c.data_validade AND c.id_estabelecimento = estabelecimento_id;

   RETURN cod_cupom;
END ||
DELIMITER ;

select cupons_validos(1, curdate());
