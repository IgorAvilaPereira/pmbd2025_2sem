DROP DATABASE IF EXISTS itunes_pobre;

CREATE DATABASE itunes_pobre;

\c itunes_pobre;

CREATE TABLE artista (
    id serial primary key,
    nome character varying(150) not null
);
INSERT INTO artista (nome) VALUES
('ANITTA'),
('ANA CASTELA'),
('ZÉ FELIPE'),
('PERICLES'),
('CHRIGOR'),
('KATINGUELE');

CREATE TABLE plano (
    id serial primary key,
    nome text not null
);
INSERT INTO plano (nome) VALUES
('FREE'),
('PREMIUM');


CREATE TABLE usuario (
    id serial primary key,
    email character varying(200) unique,
    nome character varying(200) not null,
    senha text not null
);

INSERT INTO usuario (email, nome, senha) VALUES
('igor.pereira@riogrande.ifrs.edu.br', 'IGOR PEREIRA', MD5('123'));

CREATE TABLE musica (
    id serial primary key,
    titulo character varying(200) not null,
    duracao time not null
);

CREATE TABLE gravadora (
    id serial primary key,
    nome character varying(100) not null,
    contato text not null,
    site text not null,
    rua text,
    bairro text,
    complemento text,
    nro character varying(10) 
);

CREATE TABLE album (
    id serial primary key,
    titulo text not null,
    data_lancamento date default current_date,
    album_id integer references musica (id),
    gravadora_id integer references gravadora (id)
);

CREATE TABLE playlist (
    id serial primary key,
    nome text not null,
    usuario_id integer references usuario (id)
);

CREATE TABLE playlist_musica (
    playlist_id integer references playlist(id),
    musica_id integer references musica (id),
    primary key(playlist_id, musica_id)
);

CREATE TABLE artista_musica  (  
    artista_id integer references artista(id),
    musica_id integer references musica (id),
    primary key(artista_id, musica_id)
);


CREATE TABLE musica_album (  
    album_id integer references album(id),
    musica_id integer references musica (id),
    primary key(album_id, musica_id)
);

