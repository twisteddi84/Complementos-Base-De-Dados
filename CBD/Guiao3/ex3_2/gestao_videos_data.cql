INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('joao1', 'Joao Gomes', 'joao@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('maria2', 'Maria Silva', 'maria@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('carlos3', 'Carlos Oliveira', 'carlos@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('ana4', 'Ana Santos', 'ana@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('pedro5', 'Pedro Pereira', 'pedro@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador6', 'Nome6', 'email6@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador7', 'Nome7', 'email7@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador8', 'Nome8', 'email8@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador9', 'Nome9', 'email9@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador10', 'Nome10', 'email10@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador11', 'Nome11', 'email11@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador12', 'Nome12', 'email12@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador13', 'Nome13', 'email13@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador14', 'Nome14', 'email14@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador15', 'Nome15', 'email15@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador16', 'Nome16', 'email16@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador17', 'Nome17', 'email17@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador18', 'Nome18', 'email18@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador19', 'Nome19', 'email19@gmail.com', toTimestamp(now()));

INSERT INTO utilizadores (username, nome, email, tempo_registo)
VALUES ('utilizador20', 'Nome20', 'email20@gmail.com', toTimestamp(now()));



-- inserir videos
INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (1, 'joao1', 'Video_A', 'Descrição do Video_A', {'Aveiro', 'Lisboa'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('Aveiro', 1);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('Lisboa', 1);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('joao1', 1, 'Video_A', 'Descrição do Video_A', {'Aveiro', 'Lisboa'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (2, 'maria2', 'Video_B', 'Descrição do Video_B', {'Prank', 'Aveiro','tag1'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('Prank', 2);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('Aveiro', 2);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag1', 2);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('maria2', 2, 'Video_B', 'Descrição do Video_B', {'Prank', 'Aveiro','tag1'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (3, 'utilizador3', 'Video_C', 'Descrição do Video_C', {'tag5', 'tag6'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag5', 3);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag6', 3);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('utilizador3', 3, 'Video_C', 'Descrição do Video_C', {'tag5', 'tag6'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (4, 'joao1', 'Video_D', 'Descrição do Video_D', {'Aveiro', 'Prank'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('Aveiro', 4);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('Prank', 4);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('joao1', 4, 'Video_D', 'Descrição do Video_D', {'Aveiro', 'Prank'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (5, 'utilizador5', 'Video_E', 'Descrição do Video_E', {'tag1', 'Corrida'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag1', 5);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('Corrida', 5);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('utilizador5', 5, 'Video_E', 'Descrição do Video_E', {'tag1', 'Corrida'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (6, 'utilizador6', 'Video_F', 'Descrição do Video_F', {'tag11', 'tag12'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag11', 6);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag12', 6);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('utilizador6', 6, 'Video_F', 'Descrição do Video_F', {'tag11', 'tag12'}, '2017-08-10 10:10:00+0000');

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (20, 'utilizador6', 'Video_F12', 'Descrição do Video_F12', {'tag11', 'tag12'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag11', 20);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag12', 20);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('utilizador6', 20, 'Video_F12', 'Descrição do Video_F12', {'tag11', 'tag12'}, toTimestamp(now()));


INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (7, 'utilizador7', 'Video_G', 'Descrição do Video_G', {'tag13', 'tag14'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag13', 7);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag14', 7);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('utilizador7', 7, 'Video_G', 'Descrição do Video_G', {'tag13', 'tag14'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (8, 'joao1', 'Video_H', 'Descrição do Video_H', {'Aveiro', 'tag16'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('Aveiro', 8);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag16', 8);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('joao1', 8, 'Video_H', 'Descrição do Video_H', {'Aveiro', 'tag16'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (9, 'utilizador9', 'Video_I', 'Descrição do Video_I', {'tag17', 'tag18'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag17', 9);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag18', 9);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('utilizador9', 9, 'Video_I', 'Descrição do Video_I', {'tag17', 'tag18'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (10, 'maria2', 'Video_J', 'Descrição do Video_J', {'tag19', 'tag20'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag19', 10);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag20', 10);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('maria2', 10, 'Video_J', 'Descrição do Video_J', {'tag19', 'tag20'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (11, 'utilizador11', 'Video_K', 'Descrição do Video_K', {'tag21', 'tag22'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag21', 11);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag22', 11);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('utilizador11', 11, 'Video_K', 'Descrição do Video_K', {'tag21', 'tag22'}, toTimestamp(now()));

INSERT INTO videos (video_id, username_uploader, nome_video, descricao, tags, tempo_upload)
VALUES (12, 'utilizador12', 'Video_L', 'Descrição do Video_L', {'tag23', 'tag24'}, toTimestamp(now()));
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag23', 12);
INSERT INTO videos_by_tag (tag,video_id)
VALUES ('tag24', 12);
INSERT INTO videos_by_username (username_uploader, video_id, nome_video, descricao, tags, tempo_upload)
VALUES ('utilizador12', 12, 'Video_L', 'Descrição do Video_L', {'tag23', 'tag24'}, toTimestamp(now()));


--Inserir comentários

INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (1, toTimestamp(now()), 'joao1', 'Comentario 1');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('joao1', toTimestamp(now()), 1, 'Comentario 1');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (1, toTimestamp(now()), 'maria2', 'Comentario 2');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('maria2', toTimestamp(now()), 1, 'Comentario 2');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (1, toTimestamp(now()), 'carlos3', 'Comentario 3');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('carlos3', toTimestamp(now()), 1, 'Comentario 3');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (2, toTimestamp(now()), 'ana4', 'Comentario 4');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('ana4', toTimestamp(now()), 2, 'Comentario 4');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (3, toTimestamp(now()), 'joao1', 'Comentario 5');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('joao1', toTimestamp(now()), 3, 'Comentario 5');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (4, toTimestamp(now()), 'maria2', 'Comentario 6');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('maria2', toTimestamp(now()), 4, 'Comentario 6');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (5, toTimestamp(now()), 'carlos3', 'Comentario 7');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('carlos3', toTimestamp(now()), 5, 'Comentario 7');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (6, toTimestamp(now()), 'ana4', 'Comentario 8');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('ana4', toTimestamp(now()), 6, 'Comentario 8');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (7, toTimestamp(now()), 'joao1', 'Comentario 9');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('joao1', toTimestamp(now()), 7, 'Comentario 9');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (8, toTimestamp(now()), 'maria2', 'Comentario 10');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('maria2', toTimestamp(now()), 8, 'Comentario 10');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (1, '2023-01-03 02:10:00+0000', 'joao1', 'Comentario 11');
INSERT INTO comentarios_by_username (username_comentador, tempo_comentario, video_id, comentario)
VALUES ('joao1', '2023-01-03 02:10:00+0000', 1, 'Comentario 11');
INSERT INTO comentarios (video_id, tempo_comentario, username_comentador,comentario)
VALUES (1, '2023-11-25 10:30:00+0000', 'joao1', 'Comentario 12');


-- Inserir eventos
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'joao1', 1, 'Pause', toTimestamp(now()));
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'maria2', 2, 'Play', '2023-01-03 02:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'carlos3', 1, 'Pause', '2023-01-03 02:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'carlos3', 1, 'Stop', '2023-01-03 04:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'ana4', 1, 'Play', '2023-01-03 04:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'joao1', 4, 'Pause', '2023-01-03 04:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'maria2', 1, 'Play', '2023-01-03 04:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'carlos3', 1, 'Pause', '2023-02-10 10:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'ana4', 5, 'Play', '2023-02-10 10:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'joao1', 1, 'Pause', '2023-02-10 10:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'maria2', 1, 'Play', '2023-02-10 10:10:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'joao1', 1, 'Play', '2023-11-25 10:30:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'joao1', 1, 'Pause', '2023-11-25 10:32:00+0000');
INSERT INTO eventos (evento_id, username, video_id, tipo_evento, tempo_evento)
VALUES (uuid(), 'joao1', 1, 'Stop', '2023-11-25 10:33:00+0000');





--Inserir video_followers
INSERT INTO video_followers (username,video_id)
VALUES ('joao1',1);
INSERT INTO video_followers (username,video_id)
VALUES ('maria2',1);
INSERT INTO video_followers (username,video_id)
VALUES ('carlos3',1);
INSERT INTO video_followers (username,video_id)
VALUES ('ana4',2);
INSERT INTO video_followers (username,video_id)
VALUES ('joao1',2);
INSERT INTO video_followers (username,video_id)
VALUES ('maria2',2);
INSERT INTO video_followers (username,video_id)
VALUES ('carlos3',2);
INSERT INTO video_followers (username,video_id)
VALUES ('ana4',3);
INSERT INTO video_followers (username,video_id)
VALUES ('joao1',10);

--Inserir ratings
INSERT INTO rating_videos (video_id,rating)
VALUES (1,5);
INSERT INTO rating_videos (video_id,rating)
VALUES (2,4);
INSERT INTO rating_videos (video_id,rating)
VALUES (3,3);
INSERT INTO rating_videos (video_id,rating)
VALUES (4,2);
INSERT INTO rating_videos (video_id,rating)
VALUES (5,1);
INSERT INTO rating_videos (video_id,rating)
VALUES (6,5);
INSERT INTO rating_videos (video_id,rating)
VALUES (7,4);
INSERT INTO rating_videos (video_id,rating)
VALUES (8,3);
INSERT INTO rating_videos (video_id,rating)
VALUES (9,2);
