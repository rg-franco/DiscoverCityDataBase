DROP PROCEDURE IF EXISTS listar_estabelecimentos_com_notas_altas;

DELIMITER //

CREATE PROCEDURE listar_estabelecimentos_com_notas_altas()
BEGIN
    SELECT 'Melhores' AS tipo, CONCAT(a1.comentarios) AS comentario, a1.nota AS nota
FROM avaliacao a1
WHERE a1.nota = (SELECT MAX(a2.nota) FROM avaliacao a2 WHERE a2.id_estabelecimento = a1.id_estabelecimento)
UNION ALL
SELECT 'Piores' AS tipo, CONCAT(a3.comentarios) AS comentario, a3.nota AS nota
FROM avaliacao a3
WHERE a3.nota = (SELECT MIN(a4.nota) FROM avaliacao a4 WHERE a4.id_estabelecimento = a3.id_estabelecimento)
ORDER BY tipo, nota DESC;

END //

DELIMITER ;

CALL  listar_estabelecimentos_com_notas_altas();


