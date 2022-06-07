SELECT
  sn.song_name AS 'nome',
  COUNT(rh.song_id) AS 'reproducoes'
FROM
  SpotifyClone.songs sn
  INNER JOIN SpotifyClone.reproduction_history rh ON rh.song_id = sn.song_id
  INNER JOIN SpotifyClone.users u ON rh.user_id = u.user_id
WHERE
  u.plan_id = 4
  OR u.plan_id = 1
GROUP BY
  nome
ORDER BY
  nome;