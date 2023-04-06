drop view if exists top5_melhores_avaliados;
create view top5_melhores_avaliados as 
select nome, media_nota, telefone, hora_funcionamento from estabelecimento e
join contato c on c.id_estabelecimento = e.id
order by media_nota
limit 5;