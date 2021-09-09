DELIMITER $$

CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN artist_name VARCHAR(200))
BEGIN
SELECT A.album AS album,
T.artist AS artista
FROM SpotifyClone.albums A
INNER JOIN SpotifyClone.artists T
ON T.artist_id = A.artist_id
WHERE T.artist = 'Walter Phoenix'
ORDER BY album;
END $$

DELIMITER ;
