DELIMITER $$

CREATE PROCEDURE albuns_do_artista (IN artista VARCHAR(100))
BEGIN 
	SELECT 
		a.name_artista AS `artista`, 
        al.name_album AS `album`
FROM 
	SpotifyClone.artista AS a
		INNER JOIN 
SpotifyClone.album AS al ON a.id_artista = al.id_artista
WHERE a.name_artista= artista
ORDER BY al.name_album;
END $$
DELIMITER ;
