DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artista(
    artista_id int auto_increment primary key not null,
    artista varchar(50) not null
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id int auto_increment primary key not null,
    album varchar(50) not null,
    lancamento int not null,
    artista_id int not null,
    foreign key (artista_id) references artista (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancao(
    cancao_id int auto_increment primary key not null,
    cancao varchar(50) not null,
    duracao int not null,
    album_id int not null,
    foreign key (album_id) references album (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.plano(
    plano_id int auto_increment primary key not null,
    plano varchar(50) not null,
    valor int not null
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
    usuario_id int auto_increment primary key not null,
    usuario varchar(50) not null,
    idade int not null,
    plano_id int not null,
    assinatura date not null,
    foreign key (plano_id) references plano (plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(
	historico_id int auto_increment primary key not null,
    usuario_id int not null,
    cancao_id int not null,
    data datetime not null,
    foreign key (usuario_id) references usuario (usuario_id),
    foreign key (cancao_id) references cancao (cancao_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario_seguindo_artista(
	id int auto_increment primary key not null,
    usuario_id int not null,
    artista_id int not null,
    foreign key (usuario_id) references usuario (usuario_id),
    foreign key (artista_id) references artista (artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.artista (artista)
VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');

INSERT INTO SpotifyClone.album (album, lancamento, artista_id) 
VALUES
    ('Envious', 1990, 1),
    ('Exuberant', 1993, 1),
    ('Hallowed Steam', 1995, 2),
    ('Incandescent', 1998, 3),
    ('Temporary Culture', 2001, 4),
    ('Library of liberty', 2003, 4),
    ('Chained Down', 2007, 5),
    ('Cabinet of fools', 2012, 5),
    ('No guarantees', 2015, 5),
    ('Apparatus', 2015, 6);
	
INSERT INTO SpotifyClone.cancao (cancao, duracao, album_id)
VALUES
    ('Soul For Us', 200, 1),
    ('Reflections Of Magic', 163, 1),
    ('Dance With Her Own', 116, 1),
    ('Troubles Of My Inner Fire', 203, 2),
    ('Time Fireworks', 152, 2),
    ('Magic Circus', 105, 3),
    ('Honey, So Do I', 207, 3),
    ("Sweetie, Let's Go Wild", 139, 3),
    ('She Knows', 244, 3),
    ('Fantasy For Me', 100, 4),
    ('Celebration Of More', 146, 4),
    ('Rock His Everything', 223, 4),
    ('Home Forever', 231, 4),
    ('Diamond Power', 241, 4),
    ("Let's Be Silly", 132, 4),
    ('Thang Of Thunder', 240, 5),
    ('Words Of Her Life', 185, 5),
    ('Without My Streets', 176, 5),
    ('Need Of The Evening', 190, 6),
    ('History Of My Roses', 222, 6),
    ('Without My Love', 111, 6),
    ('Walking And', 123, 6),
    ('Young And Father', 197, 6),
    ('Finding My Traditions', 179, 7),
    ('Walking And Man', 229, 7),
    ('Hard And Time', 135, 7),
    ("Honey, I'm A Lone Wolf", 150, 7),
    ("She Thinks I Won't Stay Tonight", 166, 8),
    ("He Heard You're Bad For Me", 154, 8),
    ("He Hopes We Can't Stay", 210, 8),
    ('I Know I Know', 117, 8),
    ("He's Walking Away", 159, 9),
    ("He's Trouble", 138, 9),
    ('I Heard I Want To Bo Alone', 120, 9),
    ('I Ride Alone', 151, 9),
    ('Honey', 79, 10),
    ('You Cheated On Me', 95, 10),
    ("Wouldn't It Be Nice", 213, 10),
    ('Baby', 136, 10),
    ('You Make Me Feel So..', 83, 10);

INSERT INTO SpotifyClone.plano (plano, valor)
VALUES
	('gratuito', 0),
    ('familiar', 7.99),
    ('universitario', 5.99),
    ('pessoal', 6.99);