CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(m.name_musica) AS `cancoes`,
        COUNT(DISTINCT (a.name_artista)) AS `artistas`,
        COUNT(DISTINCT (al.name_album)) AS `albuns`
    FROM
        SpotifyClone.musicas AS m
            INNER JOIN
        SpotifyClone.album AS al ON al.id_album = m.id_album
            INNER JOIN
        SpotifyClone.artista AS a ON al.id_artista = a.id_artista
         
        
