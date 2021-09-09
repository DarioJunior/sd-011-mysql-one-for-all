USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN artist_name VARCHAR(200))
BEGIN
SELECT T.artist artista, A.album album
FROM SpotifyClone.albums A
INNER JOIN SpotifyClone.artists T
ON T.artist_id = A.artist_id
WHERE T.artist = artist_name;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
