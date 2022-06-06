SELECT
  an.artist_name AS 'artista',
  albn.albun_name AS 'album',
  COUNT(flwa.artist_id) AS 'seguidores'
FROM
  SpotifyClone.artists an
  INNER JOIN SpotifyClone.following_artists flwa ON flwa.artist_id = an.artist_id
  INNER JOIN SpotifyClone.albuns albn ON albn.artist_id = an.artist_id
GROUP BY
  albn.albun_name,
  flwa.artist_id,
  an.artist_id
ORDER BY
  seguidores DESC,
  artista,
  album;