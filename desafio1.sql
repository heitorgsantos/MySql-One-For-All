DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `usuario_name` VARCHAR(100) NOT NULL,
  `idade` VARCHAR(45) BINARY NOT NULL,
  `id_plano` INT,
  PRIMARY KEY (`id_user`),
  FOREIGN KEY (`id_plano`) REFERENCES `plano`(`id_plano`),
  UNIQUE INDEX `iduser_UNIQUE` (`id_user` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `plano` (
	`id_plano` INT NOT NULL AUTO_INCREMENT,
    `nome_plano` VARCHAR(45) NOT NULL,
    `valor_plano` DECIMAL(3,2),
    PRIMARY KEY (`id_plano`),
    UNIQUE INDEX `idplano_UNIQUE` (`id_user`) VISIBLE)
    ENGINE = InnoDB;
    
CREATE TABLE IF NOT EXISTS `artista` (
	`id_artista` INT NOT NULL AUTO_INCREMENT,
    `name_artista` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id_artista`),
    UNIQUE INDEX `idartista` (`id_artista`) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `album` (
    `id_album` INT NOT NULL AUTO_INCREMENT,
    `name_album` VARCHAR(100) NOT NULL,
    `id_artista` INT,
    `id_musica` INT,
    PRIMARY KEY (`id_album`),
    FOREIGN KEY (`id_artista`)
        REFERENCES `artista` (`id_artista`),
    FOREIGN KEY (`id_musica`)
        REFERENCES `musicas` (`id_musica`)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS `musicas` (
    `id_musica` INT NOT NULL AUTO_INCREMENT,
    `name_musica` VARCHAR(100) NOT NULL,
    `id_album` INT,
    PRIMARY KEY (`id_musica`),
    FOREIGN KEY (`id_album`)
        REFERENCES `plano` (`id_album`)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS `seguindo` (
    `id_user` INT,
    `id_artista` INT,
    PRIMARY KEY (`id_user` , `id_artista`),
    FOREIGN KEY (`id_user`)
        REFERENCES `usuario` (`id_user`),
    FOREIGN KEY (`id_artista`)
        REFERENCES `artista` (`id_user`)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS `historico` (
    `id_user` INT,
    `id_musica` INT,
    PRIMARY KEY (`id_user` , `id_musica`),
    FOREIGN KEY (`id_user`)
        REFERENCES `usuario` (`id_user`),
    FOREIGN KEY (`id_musica`)
        REFERENCES `musicas` (`id_musica`)
)  ENGINE=INNODB;

INSERT INTO `plano` (`id_plano`, `nome_plano`, `valor_plano`) VALUES
(1, 'gratuito', 0,00),
(2, 'universitário', 5,99),
(3, 'familiar', 7,99);

INSERT INTO `usuario` (`id_user`, `usuario_name`, `idade`, `id_plano`) VALUES
(1,'Thati', 23, 1),
(2, 'Cintia', 35, 3),
(3, 'Bill', 20, 2),
(4, 'Roger', 45, 0);

INSERT INTO `artista` (`id_artista`, `name_artista`) VALUES
(1, 'Walter Phoenix'),
(2, 'Peter Strong'),
(3, 'Lance Day'),
(4, 'Freedie Sahnno');

INSERT INTO `album` (`id_album`, `name_album`, `id_artista`, `id_musica`) VALUES
(1, `Envious`, 1, (1, 2, 3)),
(2, `Exuberant`, 1, (4, 5)),
(3, `Hallowed Steam`, 2, (6, 7, 8, 9, 10, 11)),
(4, `Incandescent`, 3, (12, 13, 14, 15, 16, 17, 18)),
(5, `Temporary Culture`, 4, (19, 20, 21));

INSERT INTO `musicas` (`id_musica`, `name_musica`, `id_album`, `id_artista`) VALUES
(1, 'Soul For Us', 1, 1),
(2, 'Reflections Of Magic', 1, 1),
(3, 'Dance With Her Own', 1, 1),
(4, 'Troubles Of My Inner Fire', 2, 1),
(5, 'Time Fireworks', 2, 1),
(6, 'Magic Circus', 3, 2),
(7, 'Honey', 3, 2),
(8, 'So Do I',3, 2),
(9, 'Sweetie', 3, 2),
(10, "Let's Go Wild", 3, 2),
(11, 'She Knows', 3, 2),
(12, 'Fantasy For Me', 4, 3),
(13, 'Celebration Of More', 4, 3),
(14, 'Rock His Everthing', 4, 3),
(15, 'Home Forever', 4, 3),
(16, 'Diamond Power', 4, 3),
(17, 'Honey', 4, 3),
(18, "Let's Be Silly", 4, 3),
(19, 'Thang Of Thunder', 5, 4),
(20, 'Words Of Her Life', 5, 4),
(21, 'Without My Streets', 5, 4);

INSERT INTO `historico` (`id_user`, `id_musica`) VALUES
(1, (1, 6, 16, 19)),
(2, (15, 20, 2, 6)),
(3, (4, 19, 6)),
(4,(3, 21, 13));

INSERT INTO `seguindo` (`id_user`, `id_artista`) VALUES
(1,(1, 4, 3)),
(2,(1, 3)),
(3, (2, 1)),
(4, 4);
