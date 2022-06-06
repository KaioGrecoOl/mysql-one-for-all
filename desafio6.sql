SELECT
  MIN(pl.price) AS 'faturamento_minimo',
  MAX(pl.price) AS 'faturamento_maximo',
  ROUND (AVG(pl.price), 2) AS 'faturamento_medio',
  SUM(pl.price) AS 'faturamento_total'
FROM
  SpotifyClone.plans pl
  INNER JOIN SpotifyClone.users cn ON cn.plan_id = pl.plan_id;