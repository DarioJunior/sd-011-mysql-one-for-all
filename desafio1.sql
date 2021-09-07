DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas(
id_artista INT PRIMARY KEY AUTO_INCREMENT,
artista VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE planos(
id_planos INT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(15) NOT NULL,
valor VARCHAR(10) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE usuarios(
id_usuarios INT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(45) NOT NULL,
idade INT NOT NULL,
id_planos INT NOT NULL,
FOREIGN KEY (id_planos) REFERENCES planos (id_planos)
) ENGINE = InnoDB;

CREATE TABLE albuns(
id_albuns INT PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(45) NULL,
id_artista INT NOT NULL,
FOREIGN KEY (id_artista) REFERENCES artistas (id_artista)
) ENGINE = InnoDB;

CREATE TABLE cancoes(
id_cancoes INT PRIMARY KEY AUTO_INCREMENT,
cancao VARCHAR(60)  NOT NULL,
id_albuns INT NOT NULL,
FOREIGN KEY (id_albuns) REFERENCES albuns (id_albuns)
) ENGINE = InnoDB;

CREATE TABLE usuarios_cancoes(
id_usuarios INT NOT NULL,
id_cancoes INT NOT NULL,
FOREIGN KEY (id_usuarios) REFERENCES usuarios (id_usuarios),
FOREIGN KEY (id_cancoes) REFERENCES cancoes (id_cancoes),
CONSTRAINT PRIMARY KEY (id_usuarios, id_cancoes)
) ENGINE = InnoDB;

CREATE TABLE usuario_seguidor (
id_usuarios INT NOT NULL,
id_artista INT NOT NULL,
FOREIGN KEY (id_usuarios) REFERENCES usuarios (id_usuarios),
FOREIGN KEY (id_artista) REFERENCES artistas (id_artista),
CONSTRAINT PRIMARY KEY (id_usuarios, id_artista)
) ENGINE = InnoDB;

INSERT INTO artistas (artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns (album, id_artista)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO planos (plano, valor)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO usuarios (usuario, idade, id_planos)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO cancoes (cancao, id_albuns)
VALUES
("Soul For Us", 1), 
("Reflections Of Magic", 1),
("Dance With Her Own", 1), 
("Troubles Of My Inner Fire'", 2),
("Time Fireworks", 2),
("Magic Circus", 3),
("Honey, So Do I", 3),
("Sweetie Let's Go Wild", 3),
("She Knows", 3),
("Fantasy For Me", 4),
("Celebration Of More", 4),
("Rock His Everything", 4),
("Home Forever", 4),
("Diamond Power", 4),
("Honey, Let's Be Silly", 4),
("Thang Of Thunder", 5),
("Words Of Her Life", 5),
("Without My Streets", 5);

INSERT INTO usuario_seguidor (id_usuarios, id_artista)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

INSERT INTO usuarios_cancoes (id_usuarios, id_cancoes)
VALUES
(1, 1),
(1, 6),
(1, 15),
(1, 17),
(2, 2),
(2, 14),
(2, 16),
(2, 18),
(3, 4),
(3, 6),
(3,17),
(4, 3),
(4, 12),
(4, 18);  
