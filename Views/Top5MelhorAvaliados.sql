drop view if exists top5_melhores_avaliados;
create view top5_melhores_avaliados as 
select nome, media_nota, telefone, hora_funcionamento from estabelecimento e
join contato c on c.id_estabelecimento = e.id
order by media_nota
limit 5;

DROP VIEW IF EXISTS lugares_abertos_agora;
CREATE VIEW lugares_abertos_agora AS
SELECT est.nome as 'Estabelecimento', est.descricao, CONCAT(en.rua,', ', en.numero,', ', en.bairro,' - ', en.cidade) as 'Endereço', est.inicio_funcionamento, est.fim_funcionamento
FROM estabelecimento est
JOIN endereco en	ON curtime() > est.inicio_funcionamento AND curtime() < est.fim_funcionamento 
AND est.id = en.id_estabelecimento;
