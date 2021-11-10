CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.usuario_name AS `usuario`, m.name_musica AS `nome`
    FROM
        SpotifyClone.usuario AS u
            INNER JOIN
        SpotifyClone.historico AS h ON u.id_user = h.id_user
            INNER JOIN
        SpotifyClone.musicas AS m ON m.id_musica = h.id_musica
    ORDER BY u.usuario_name , m.name_musica;
