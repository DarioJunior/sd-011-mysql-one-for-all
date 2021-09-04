CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome AS 'usuario', c.nome_cancao AS 'nome'
FROM SpotifyClone.usuario u
INNER JOIN SpotifyClone.historico_de_reproducoes hdr ON hdr.usuario_id = u.id
INNER JOIN SpotifyClone.cancoes c ON c.id = hrd.cancao_id
ORDER BY `usuario`, `nome`;


select * from historico_reproducao_usuarios;
DROP VIEW historico_reproducao_usuarios;

