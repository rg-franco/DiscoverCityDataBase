drop procedure if exists lugaresFavoritos;
delimiter ||
CREATE PROCEDURE lugaresFavoritos(IN usuario int)
BEGIN
    select c.nome as 'Lugares Favoritos', c.media_nota, e.rua, e.numero, e.bairro from lugaresvisitados v
    inner join estabelecimento c on c.id = v.id_estabelecimento
    inner join endereco e on c.id = e.id_estabelecimento
    where v.id_usuario = usuario and v.favorito = true;
END ||

call lugaresFavoritos(1);