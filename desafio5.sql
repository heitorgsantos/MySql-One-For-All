CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        m.name_musica AS `cancao`,
        COUNT(h.id_musica) AS `reproducoes`
    FROM
        SpotifyClone.musicas AS m
            INNER JOIN
        SpotifyClone.historico AS h ON m.id_musica = h.id_musica
    GROUP BY m.name_musica
    ORDER BY COUNT(h.id_musica) DESC , m.name_musica
    LIMIT 2;