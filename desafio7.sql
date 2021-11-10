CREATE VIEW perfil_artistas AS
    SELECT 
        ar.name_artista AS `artista`,
        al.name_album AS `album`,
        COUNT(se.id_user) AS `seguidores`
    FROM
        SpotifyClone.artista AS ar
            JOIN
        SpotifyClone.album AS al ON ar.id_artista = al.id_artista
            JOIN
        SpotifyClone.seguindo AS se ON se.id_artista = ar.id_artista
    GROUP BY al.name_album , ar.name_artista
    ORDER BY COUNT(id_user) DESC , ar.name_artista , al.name_album;