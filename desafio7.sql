CREATE VIEW perfil_artistas AS
  SELECT
    at.nome_artistico AS 'artista',
    ab.titulo AS 'album',
    (
      SELECT
        COUNT(*)
      FROM
        SpotifyClone.usuario_seguindo_artista AS uh
      WHERE
        uh.artista_id = at.artista_id
    ) AS 'seguidores'
  FROM
    SpotifyClone.artista AS at
  INNER JOIN
    SpotifyClone.album AS ab
    ON ab.artista_id = at.artista_id
  ORDER BY
    3 DESC,
    1 ASC,
    2 ASC;
