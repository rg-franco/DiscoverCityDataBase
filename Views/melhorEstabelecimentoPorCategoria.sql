drop view if exists estabelecimentosPorCategoria;
create view estabelecimentosPorCategoria as 
select e.nome, c.categoria, e.media_nota, t.email, t.telefone
from estabelecimento e
inner join categoria c on e.id_categoria = c.id
inner join contato t on e.id = t.id_estabelecimento
where e.media_nota = (SELECT MAX(media_nota) FROM estabelecimento WHERE id_categoria = c.id)
GROUP BY c.categoria, e.nome, e.media_nota, t.email, t.telefone;

