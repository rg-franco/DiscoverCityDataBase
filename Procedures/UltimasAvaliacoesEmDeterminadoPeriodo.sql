drop procedure if exists ultimasAvaliacao;
delimiter |
create procedure ultimasAvaliacao(in qtdDias int, in idEstabelecimento int)
begin
	declare qtdUsuarios int;
    select estabelecimento.nome, round(AVG(nota), 2) as MediaUltimosDias from avaliacao 
    inner join estabelecimento on avaliacao.id_estabelecimento = estabelecimento.id
    where avaliacao.data_avaliacao > (select curdate() - qtdDias) and avaliacao.id_estabelecimento = idEstabelecimento;
end |