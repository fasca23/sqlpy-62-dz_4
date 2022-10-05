--количество исполнителей в каждом жанре;
SELECT g.title "Жанр", count(p.performer_id) "Количество исполнителей"
	FROM genre g 
		JOIN genre_performer gp ON gp.genre_id = g.genre_id 
		JOIN performer p ON gp.performer_id = p.performer_id
	GROUP BY g.title
	ORDER BY count(p.performer_id)

--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT a."name" "Альбом", count(t.track_id) "Количество треков за 2019-2020"  
	FROM album a 
		JOIN track t ON a.album_id = t.album_id
	WHERE a.year_issue >= '2019-01-01' AND a.year_issue <= '2020-12-31'
	GROUP BY a."name" 
	ORDER BY "Количество треков за 2019-2020"

--средняя продолжительность треков по каждому альбому;
SELECT a."name" "Альбом", avg(t.duration) "Средняя продолжительность"  
	FROM album a 
		JOIN track t ON a.album_id = t.album_id
	GROUP BY a."name"
	ORDER BY "Средняя продолжительность" 

--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT p.alias, a.album_id 
	FROM performer p 
		JOIN album_performer ap ON ap.performer_id = p.performer_id
		JOIN album a ON a.album_id = ap.album_id
	WHERE a.year_issue < '2020-01-01' OR a.year_issue > '2020-12-31'

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT DISTINCT c."name" "Сборники исполнителя alias 1"
	FROM compilation c
		JOIN track_compilation tc ON tc.compilation_id = c.compilation_id 
		JOIN track t ON t.track_id = tc.track_id 
		JOIN album_performer ap ON ap.album_id = t.album_id 
		JOIN performer p ON p.performer_id = ap.performer_id
	WHERE p.alias = 'alias 1'

--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a."name" "Название альбомов", p.alias "Исполнитель более 1 жанра"
	FROM album a 
		JOIN album_performer ap ON ap.album_id = a.album_id 
		JOIN performer p ON p.performer_id = ap.performer_id 
		JOIN genre_performer gp ON gp.performer_id = p.performer_id 
		JOIN genre g ON g.genre_id = gp.genre_id
	GROUP BY p.alias, a."name"
	HAVING count(g.title) > 1

--наименование треков, которые не входят в сборники;
SELECT t.title "Треки, не входящие в сборники" 
	FROM track t 
		FULL JOIN track_compilation tc ON tc.track_id = t.track_id 
		FULL JOIN compilation c ON c.compilation_id = tc.compilation_id
	WHERE c."name" IS NULL

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT DISTINCT p.alias "Исполнители", t.duration "Продолжительность трека"
	FROM performer p 
		JOIN album_performer ap ON ap.performer_id = p.performer_id
		JOIN track t ON t.album_id = ap.album_id
	WHERE t.duration = (SELECT min(t.duration) FROM track t) 

--название альбомов, содержащих наименьшее количество треков.	
SELECT a."name" "Альбомы с минимумом треков"
	FROM album a 
		JOIN track t ON t.album_id = a.album_id
	GROUP BY a."name"
	HAVING count(t.track_id) = (SELECT min(c.ct) m 
									FROM (SELECT a."name" n, count(t.track_id) ct 
												FROM album a 
													JOIN track t ON t.album_id = a.album_id 
												GROUP BY a."name") c)
