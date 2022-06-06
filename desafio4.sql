SELECT
  cn.client_name AS 'usuario',
  IF (
    MAX(YEAR(rh.music_played_in)) >= 2021,
    'Usuário ativo',
    'Usuário inativo'
  ) 'condicao_usuario'
FROM
  SpotifyClone.users cn
  INNER JOIN SpotifyClone.reproduction_history rh ON cn.user_id = rh.user_id
GROUP BY
  cn.client_name;