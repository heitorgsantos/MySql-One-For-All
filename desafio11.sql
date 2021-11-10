CREATE VIEW cancoes_premium AS
    SELECT 
        m.name_musica AS `nome`, COUNT(h.id_user) AS `reproducoes`
    FROM
        SpotifyClone.musicas AS m
            INNER JOIN
        SpotifyClone.historico AS h ON m.id_musica = h.id_musica
            INNER JOIN
        SpotifyClone.usuario AS u ON h.id_user = u.id_user
            AND u.id_plano <> 1
    GROUP BY m.name_musica
    ORDER BY m.name_musica;