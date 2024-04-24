--1. Os últimos 3 comentários introduzidos para um vídeo;
SELECT * FROM comentarios
WHERE video_id = 1
ORDER BY tempo_comentario DESC
LIMIT 3;

--2. Lista das tags de determinado vídeo;
SELECT tags FROM videos WHERE video_id = 1;

--3. Todos os vídeos com a tag Aveiro;
SELECT * FROM videos_by_tag WHERE tag = 'Aveiro';

--4. Os últimos 5 eventos de determinado vídeo realizados por um utilizador;
SELECT * FROM eventos WHERE video_id = 1 and username = 'joao1' ORDER BY tempo_evento DESC LIMIT 5;

--5. Vídeos partilhados por determinado utilizador (maria1987, por exemplo) num determinado período de tempo (Agosto de 2017, por exemplo);
SELECT * FROM videos_by_username 
WHERE username_uploader = 'utilizador6' AND tempo_upload >= '2017-08-01 00:00:00+0000' AND tempo_upload <= '2017-08-31 23:59:59+0000';

--6. Os últimos 10 vídeos, ordenado inversamente pela data da partilhada;
--Não dá para realizar esta query porque o ORDER BY nao dá para ser executado se não se realizar um WHERE à partition key antes. ORDER BY só pode ser usada quando a chave de partição é restrita por um EQ ou um IN.

--7. Todos os seguidores (followers) de determinado vídeo;
SELECT * FROM video_followers WHERE video_id = 1;

--8. Todos os comentários (dos vídeos) que determinado utilizador está a seguir (following);
--Nao é possivel pois iria ser preciso fazer mais que uma querie e isso nao é possivel em cassandra

--9 Os 5 vídeos com maior rating;
--Não é possivel pois para usar o ORDER BY (ordenar por ordem decrescente) e um LIMIT 5 (Mostar apenas 5)  é preciso que seja utilizado um WHERE antes.

--10 Uma query que retorne todos os vídeos e que mostre claramente a forma pela qual estão ordenados;
SELECT video_id, TOKEN(video_id) FROM videos;

--11. Lista com as Tags existentes e o número de vídeos catalogados com cada uma delas;
SELECT tag, COUNT(*) as num_videos
FROM videos_by_tag
GROUP BY tag;

--12 Numero total de comentarios de cada video
SELECT video_id, COUNT(*) as num_comentarios
FROM comentarios
GROUP BY video_id;

--12 Total de videos com rating 3
SELECT rating,COUNT(*) as total_videos
FROM rating_videos
WHERE rating = 3;

