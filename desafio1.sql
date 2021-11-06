DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `plano` (
    `id_plano` INT AUTO_INCREMENT PRIMARY KEY,
    `nome_plano` VARCHAR(45) NOT NULL,
    `valor_plano` DECIMAL(3, 2)
)  ENGINE=INNODB;

CREATE TABLE `artista` (
    `id_artista` INT AUTO_INCREMENT PRIMARY KEY,
    `name_artista` VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE `usuario` (
    `id_user` INT AUTO_INCREMENT PRIMARY KEY,
    `usuario_name` VARCHAR(100) NOT NULL,
    `idade` TINYINT NOT NULL,
    `id_plano` INT,
    FOREIGN KEY (`id_plano`)
        REFERENCES `plano` (`id_plano`)
)  ENGINE=INNODB;

CREATE TABLE `album` (
    `id_album` INT AUTO_INCREMENT PRIMARY KEY,
    `name_album` VARCHAR(100) NOT NULL,
    `id_artista` INT,
    FOREIGN KEY (`id_artista`)
        REFERENCES `artista` (`id_artista`)
)  ENGINE=INNODB;

CREATE TABLE `musicas` (
    `id_musica` INT AUTO_INCREMENT PRIMARY KEY,
    `name_musica` VARCHAR(100) NOT NULL,
    `id_album` INT,
    FOREIGN KEY (`id_album`)
        REFERENCES `album` (`id_album`)
)  ENGINE=INNODB;

CREATE TABLE `seguindo` (
    `id_user` INT,
    `id_artista` INT,
    CONSTRAINT PRIMARY KEY (`id_user` , `id_artista`),
    FOREIGN KEY (`id_user`)
        REFERENCES `usuario` (`id_user`),
    FOREIGN KEY (`id_artista`)
        REFERENCES `artista` (`id_artista`)
)  ENGINE=INNODB;

CREATE TABLE `historico` (
    `id_user` INT,
    `id_musica` INT,
    CONSTRAINT PRIMARY KEY (`id_user` , `id_musica`),
    FOREIGN KEY (`id_user`)
        REFERENCES `usuario` (`id_user`),
    FOREIGN KEY (`id_musica`)
        REFERENCES `musicas` (`id_musica`)
)  ENGINE=INNODB;

INSERT INTO `plano` ( `nome_plano`, `valor_plano`) VALUES
( 'gratuito', 0),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO `artista` (`name_artista`) VALUES
( 'Walter Phoenix'),
( 'Peter Strong'),
( 'Lance Day'),
( 'Freedie Sahnno');

INSERT INTO `usuario` (`usuario_name`, `idade`, `id_plano`) VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO `album` (`name_album`, `id_artista`) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO `musicas` (`name_musica`, `id_album`) VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey', 3),
('So Do I',3),
('Sweetie', 3),
("Let's Go Wild", 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everthing', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey', 4),
("Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO `historico` (`id_user`, `id_musica`) VALUES
(1, 1),
(1, 6),
(1, 16),
(1, 19),
(2, 15),
(2, 20),
(2, 2),
(2, 6),
(3, 4),
(3, 19),
(3, 6),
(4, 3),
(4, 21),
(4, 13);

INSERT INTO `seguindo` (`id_user`, `id_artista`) VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
