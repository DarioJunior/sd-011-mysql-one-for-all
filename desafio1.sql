DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE Planos(
	plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(20) NOT NULL,
    valor_plano DECIMAL(3, 2) NOT NULL
);

CREATE TABLE Usuario(
	usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
	idade INT NOT NULL,
    plano_id INT,
    FOREIGN KEY(plano_id) REFERENCES Planos(plano_id)
    ) ENGINE = InnoDB;
    
CREATE TABLE Artista(
	artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Album(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES Artista(artista_id)
) ENGINE = InnoDB;

CREATE TABLE Cancoes(
	cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(50),
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
) ENGINE = InnoDB;

CREATE TABLE Historico_reproducoes(
	usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    FOREIGN KEY(usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY(cancao_id) REFERENCES Cancoes(cancao_id),
	CONSTRAINT PRIMARY KEY(usuario_id, cancao_id)
) ENGINE = InnoDB;

CREATE TABLE Seguidores(
	usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY(usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY(artista_id) REFERENCES Artista(artista_id),
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id)
) ENGINE = InnoDB;

INSERT INTO Planos (plano, valor_plano)
VALUES ('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO Usuario (usuario, idade, plano_id)
VALUES ('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO Artista (artista)
VALUES ('Walter Phoenix'),
('Freedie Shannon'),
('Lance Day'),
('Peter Strong');

INSERT INTO Album (album, artista_id)
VALUES ('Envious', 1),
('Exuberant', 1),
('Halloween Steam', 4),
('Incandescent', 3),
('Temporary Culture', 2);

INSERT INTO Cancoes (cancao, album_id)
VALUES ('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie', 3),
("Let's Go Wild", 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO Historico_reproducoes (usuario_id, cancao_id)
VALUES (1, 1),
(1, 6),
(1, 15),
(1, 17),
(2, 14),
(2, 18),
(2, 2),
(2, 16),
(3, 4),
(3,	17),
(3, 6),
(4,	3),
(4, 19),
(4, 12);

INSERT INTO Seguidores (usuario_id, artista_id)
VALUES (1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 4),
(3, 1),
(4, 2);
