delimiter ||
CREATE PROCEDURE cupomValido()
	DECLARE @cupon_id INT;
	DECLARE @data_validade DATE;
	DECLARE @hoje DATE;

	SET @hoje = GETDATE();

	DECLARE cupon_cursor CURSOR FOR
	SELECT id, data_validade
	FROM cupons;

	OPEN cupon_cursor;

	FETCH NEXT FROM cupon_cursor INTO @cupon_id, @data_validade;

	WHILE @@FETCH_STATUS = 0
	BEGIN
	   IF @data_validade > @hoje
	   BEGIN
		  UPDATE cupons
		  SET codigo = "ok"
		  WHERE id = @cupon_id;
	   END
	   
	   FETCH NEXT FROM cupon_cursor INTO @cupon_id, @data_validade;
	END;
	delimiter ||

	CLOSE cupon_cursor;
	DEALLOCATE cupon_cursor;
delimiter ;


call cupomValido()