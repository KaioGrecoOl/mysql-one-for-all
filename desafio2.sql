SELECT
  COUNT(DISTINCT song_name) AS 'cancoes',
  COUNT(DISTINCT artist_name) AS 'artistas',
  COUNT(DISTINCT albun_name) AS 'albuns'
FROM
  SpotifyClone.songs,
  SpotifyClone.artists,
  SpotifyClone.albuns;