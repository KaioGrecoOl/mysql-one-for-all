SELECT
  an.artist_name AS 'artista',
  albn.albun_name AS 'album'
FROM
  SpotifyClone.artists an
  INNER JOIN SpotifyClone.albuns albn ON albn.artist_id = an.artist_id
WHERE
  artist_name = 'Walter Phoenix';