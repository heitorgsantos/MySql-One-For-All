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

CREATE TABLE IF NOT EXISTS `album` (
	`id_album` INT NOT NULL AUTO_INCREMENT,
    `name_album` VARCHAR(100) NOT NULL,
    `id_artista` INT,
    `id_musica` INT,
    PRIMARY KEY (`id_album`),
    FOREIGN KEY (`id_artista`) REFERENCES `artista`(`id_artista`),
    FOREIGN KEY (`id_musica`) REFERENCES `musicas`(`id_musica`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `artista` (
	`id_artista` INT NOT NULL AUTO_INCREMENT,
    `name_artista` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id_artista`),
    UNIQUE INDEX `idartista` (`id_artista`) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `musicas` (
	`id_musica` INT NOT NULL AUTO_INCREMENT,
    `name_musica` VARCHAR(100) NOT NULL,
    `id_album` INT,
    PRIMARY KEY (`id_musica`),
    FOREIGN KEY (`id_album`) REFERENCES `plano`(`id_album`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `seguindo` (
	`id_user` INT,
    `id_artista` INT,
    PRIMARY KEY (`id_user`, `id_artista`),
    FOREIGN KEY (`id_user`) REFERENCES `usuario`(`id_user`),
    FOREIGN KEY (`id_artista`) REFERENCES `artista`(`id_user`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `historico` (
	`id_user` INT,
    `id_musica` INT,
    PRIMARY KEY (`id_user`, `id_musica`),
    FOREIGN KEY (`id_user`) REFERENCES `usuario`(`id_user`),
    FOREIGN KEY (`id_musica`) REFERENCES `musicas`(`id_musica`))
ENGINE = InnoDB;
