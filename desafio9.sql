SELECT
  COUNT(rh.user_id) AS 'quantidade_musicas_no_historico'
FROM
  SpotifyClone.reproduction_history rh
  INNER JOIN SpotifyClone.users cn ON cn.user_id = rh.user_id
  AND cn.client_name = 'Bill';