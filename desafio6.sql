CREATE VIEW faturamento_atual AS
    SELECT 
        CONVERT( MIN(valor_plano) , DECIMAL (3 , 2 )) AS `faturamento_minimo`,
        CONVERT( MAX(valor_plano) , DECIMAL (3 , 2 )) AS `faturamento_maximo`,
        CONVERT( ROUND(AVG(valor_plano), 1) , DECIMAL (3 , 2 )) AS `faturamento_medio`,
        CONVERT( SUM(valor_plano) , DECIMAL (4 , 2 )) AS `faturamento_total`
    FROM
        SpotifyClone.plano AS p
            INNER JOIN
        SpotifyClone.usuario AS u ON p.id_plano = u.id_plano
