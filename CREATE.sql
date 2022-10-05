---Домашнее задание к лекции «Работа с SQL. Создание БД»
--БД для музыкального сервиса 
--Основные таблицы

CREATE TABLE genre (
	genre_id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL UNIQUE,
	last_update TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE performer (
	performer_id SERIAL PRIMARY KEY,
	alias VARCHAR(60) NOT NULL UNIQUE,
	last_update TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL UNIQUE,
	year_issue DATE NOT NULL,
	last_update TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE track (
	track_id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES album(album_id),---
	title VARCHAR(100) NOT NULL UNIQUE,
	duration INTEGER NOT NULL,
	last_update TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE compilation (
	compilation_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year DATE NOT NULL,
	last_update TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted BOOLEAN DEFAULT FALSE NOT NULL
);

--Таблицы со связями

CREATE TABLE genre_performer (
	genre_id INTEGER REFERENCES genre(genre_id),
	performer_id INTEGER REFERENCES performer(performer_id),
	PRIMARY KEY (genre_id, performer_id),
	last_update TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE album_performer (
	album_id INTEGER REFERENCES album(album_id),
	performer_id INTEGER REFERENCES performer(performer_id),
	PRIMARY KEY (album_id, performer_id),
	last_update TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE track_compilation (
	track_id INTEGER REFERENCES track(track_id),
	compilation_id INTEGER REFERENCES compilation(compilation_id),
	PRIMARY KEY (track_id, compilation_id),
	last_update TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted BOOLEAN DEFAULT FALSE NOT NULL
);

--DROP TABLE genre, performer, album, track, compilation, genre_performer, album_performer--, track_compilation