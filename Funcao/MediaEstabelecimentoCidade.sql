drop function if exists mediaEstabelecimentosCidade;
DELIMITER ||
CREATE FUNCTION mediaEstabelecimentosCidade(cidade varchar(50))
RETURNS float
DETERMINISTIC
BEGIN
   /*
   DETERMINISTIC - Função que retornam o mesmo resultado sempre que são chamadas com os mesmos argumentos
   */
   DECLARE media FLOAT;
   
   SELECT AVG(e.media_nota) INTO media
   FROM estabelecimento e
   INNER JOIN endereco en ON e.id = en.id_estabelecimento
   WHERE en.cidade = cidade;

   RETURN media;
END ||
DELIMITER ;

select mediaEstabelecimentosCidade('São Paulo');

