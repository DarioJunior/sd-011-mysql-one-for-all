CREATE VIEW top_2_hits_do_momento AS
SELECT m.nome_musica AS 'cancao',
(SELECT COUNT(*)
FROM SpotifyClone.historico AS h
WHERE m.musica_id = h.musica_id
) AS 'reproducoes'
FROM SpotifyClone.musicas AS m
ORDER BY 2 DESC, 1 ASC
LIMIT 2;
