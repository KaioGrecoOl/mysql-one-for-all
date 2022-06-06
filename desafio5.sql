SELECT
  sn.song_name AS 'cancao',
  COUNT(rh.song_id) AS 'reproducoes'
FROM
  SpotifyClone.songs sn
  INNER JOIN SpotifyClone.reproduction_history rh ON sn.song_id = rh.song_id
GROUP BY
  cancao
ORDER BY
  reproducoes DESC,
  cancao ASC
LIMIT
  2;