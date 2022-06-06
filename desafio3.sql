SELECT cn.client_name AS 'usuario',  COUNT(rh.song_id) AS 'qtde_musicas_ouvidas', ROUND(SUM(st.music_time/60),2) AS 'total_minutos'
FROM SpotifyClone.users AS cn
INNER JOIN SpotifyClone.reproduction_history AS rh
INNER JOIN SpotifyClone.songs as st
ON cn.user_id = rh.user_id AND rh.song_id = st.song_id
GROUP BY cn.client_name
ORDER BY cn.client_name;