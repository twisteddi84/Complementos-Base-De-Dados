CREATE KEYSPACE IF NOT EXISTS Partilha_Videos WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};

USE Partilha_Videos;

--Criar Tabela utilizadores
DROP TABLE IF EXISTS utilizadores;
CREATE TABLE IF NOT EXISTS utilizadores (
    username text,
    nome text,
    email text,
    tempo_registo timestamp,
    PRIMARY KEY (username,nome,email)
);

--Criar Tabela videos
DROP TABLE IF EXISTS videos;
CREATE TABLE IF NOT EXISTS videos (
    video_id int,
    username_uploader text,
    nome_video text,
    descricao text,
    tags set<text>,
    tempo_upload timestamp,
    primary key(video_id,tempo_upload,username_uploader,nome_video)
);

--Criar Tabela videos_by_username
DROP TABLE IF EXISTS videos_by_username;
CREATE TABLE IF NOT EXISTS videos_by_username (
    username_uploader text,
    video_id int,
    nome_video text,
    descricao text,
    tags set<text>,
    tempo_upload timestamp,
    primary key(username_uploader,tempo_upload,video_id)
);

--Criar Tabela videos_by_tag
DROP TABLE IF EXISTS videos_by_tag;
CREATE TABLE IF NOT EXISTS videos_by_tag (
    tag text,
    video_id int,
    primary key(tag,video_id)
);

--Criar Tabela comentarios
DROP TABLE IF EXISTS comentarios;
CREATE TABLE IF NOT EXISTS comentarios (
    username_comentador text,
    video_id int,
    comentario text,
    tempo_comentario timestamp,
    PRIMARY KEY (video_id,tempo_comentario,username_comentador)
);

--Criar Tabela comentarios_by_username
DROP TABLE IF EXISTS comentarios_by_username;
CREATE TABLE IF NOT EXISTS comentarios_by_username (
    username_comentador text,
    video_id int,
    comentario text,
    tempo_comentario timestamp,
    PRIMARY KEY (username_comentador,tempo_comentario,video_id)
);

--Criar Tabela video_followers
DROP TABLE IF EXISTS video_followers;
CREATE TABLE IF NOT EXISTS video_followers (
    username text,
    video_id int,
    primary key(video_id,username)
);

--Criar Tabela eventos
DROP TABLE IF EXISTS eventos;
CREATE TABLE IF NOT EXISTS eventos (
    evento_id uuid,
    username text,
    video_id int,
    tipo_evento text,
    tempo_evento timestamp,
    primary key(video_id,username,tempo_evento,evento_id)
);

--Criar Tabela rating_videos
DROP TABLE IF EXISTS rating_videos;
CREATE TABLE IF NOT EXISTS rating_videos (
    video_id int,
    rating int,
    primary key(rating,video_id)
);







