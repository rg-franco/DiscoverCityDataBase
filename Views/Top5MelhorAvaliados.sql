drop view if exists top5_melhores_avaliados;
create view top5_melhores_avaliados as 
select nome, media_nota, telefone, inicio_funcionamento, fim_funcionamento from estabelecimento e
join contato c on c.id_estabelecimento = e.id
order by media_nota DESC
limit 5;
