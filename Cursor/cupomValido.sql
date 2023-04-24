drop procedure if exists cupomValido;
SET SQL_SAFE_UPDATES = 0;
delimiter ||
create procedure cupomValido()
begin
    declare status_consulta date;
	DECLARE cur CURSOR FOR SELECT data_validade FROM cupons;

    open cur;
		start_loop: loop
			fetch cur into status_consulta;
				if status_consulta < curdate() then
					update cupons set valido = false;
                end if;
		end loop;
    close cur;
	
end ||

delimiter ;

call cupomValido();
