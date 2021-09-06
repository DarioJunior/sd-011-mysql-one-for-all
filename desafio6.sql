CREATE VIEW faturamento_atual AS 
SELECT 
ROUND(MIN(B.valor), 2) AS faturamento_minimo,
ROUND(MAX(B.valor), 2) AS faturamento_maximo,
ROUND(AVG(B.valor), 2) AS faturamento_medio,
ROUND(SUM(B.valor), 2) AS faturamento_total
FROM SpotifyClone.Usuario A
INNER JOIN SpotifyClone.Plano B ON B.id = A.id_plano;
