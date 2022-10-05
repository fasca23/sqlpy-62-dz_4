
--Заполняем основные таблицы

INSERT INTO album(name, year_issue) 
VALUES
('name1', '2018-01-09'),
('name2', '2019-01-10'),
('name3', '2020-03-19'),
('name4', '2018-01-09'),
('name5', '2018-07-09'),
('name6', '2020-01-09'),
('name7', '2019-12-09'),
('name8', '2020-01-09');

--SELECT *
--FROM album

INSERT INTO performer(alias) 
VALUES
('alias 1'),
('alias2'),
('alias3'),
('alias4'),
('alias 5'),
('alias6'),
('alias 7'),
('alias8');

--SELECT *
--FROM performer

INSERT INTO genre(title) 
VALUES
('title1'),
('title2'),
('title3'),
('title4'),
('title5');

--SELECT *
--FROM genre

INSERT INTO track(album_id, title, duration) 
VALUES
('1', 'title1', '69'),
('2', 'title2', '309'),
('3', 'title3', '235'),
('4', 'title4', '110'),
('5', 'title5', '215'),
('6', 'title6', '309'),
('7', 'title7', '249'),
('8', 'title8 my', '280'),
('1', 'title9', '309'),
('2', 'title10', '69'),
('1', 'title11', '309'),
('2', 'title12', '69'),
('3', 'title13', '249'),
('8', 'title14', '215'),
('7', 'title15', '251');

--DELETE FROM track
--WHERE album_id = 1;

--SELECT *
--FROM track

INSERT INTO compilation(name, year) 
VALUES
('name1', '2020-09-07'),
('name2', '2020-01-01'),
('name3', '2020-06-04'),
('name4', '2020-06-04'),
('name5', '2020-08-07'),
('name6', '2019-04-07'),
('name7', '2021-02-02'),
('name8', '2019-09-07');

--Заполняем таблицы со связями

INSERT INTO genre_performer(genre_id, performer_id) 
VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('1', '6'),
('2', '7'),
('3', '8'),
('2', '3'),
('4', '1');

INSERT INTO album_performer(album_id, performer_id) 
VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('2', '3'),
('4', '1');

INSERT INTO track_compilation(track_id, compilation_id) 
VALUES
('1', '1'),
('2', '2'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '3'),
('10', '3'),
('11', '5'),
('12', '6'),
('13', '1'),
('14', '3'),
('15', '3'),
('1', '4'),
('2', '5'),
('4', '6'),
('5', '2'),
('6', '3');
