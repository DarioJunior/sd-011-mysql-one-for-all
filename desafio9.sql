DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN singer VARCHAR(100))
BEGIN
SELECT s.name AS artista, a.title AS album
FROM SpotifyClone.singers s
INNER JOIN SpotifyClone.albums a
ON s.singer_id = a.singer_id
WHERE s.name = singer
ORDER BY album;
END $$

DELIMITER ;
