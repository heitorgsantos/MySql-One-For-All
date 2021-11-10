CREATE VIEW top_3_artistas AS
    SELECT 
        a.name_artista AS `artista`,
        COUNT(s.id_user) AS `seguidores`
    FROM
        SpotifyClone.artista AS a
            INNER JOIN
        SpotifyClone.seguindo AS s ON a.id_artista = s.id_artista
    GROUP BY a.name_artista
    ORDER BY COUNT(s.id_user) DESC , a.name_artista ASC
    LIMIT 3;

