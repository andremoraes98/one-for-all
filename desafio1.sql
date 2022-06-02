DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artista(
    artista_id int auto_increment primary key not null,
    artista varchar(50) not null
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id int auto_increment primary key not null,
    album varchar(50) not null,
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