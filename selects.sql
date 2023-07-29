-- SELECTs
-- Задание 2
--1.Название и продолжительность самого длительного трека:

select name, duration
from track t
where duration = (select max(duration) from track);

--2. Название треков, продолжительность которых не менее 3,5 минут.

select name 
from track t 
where duration >= '00:03:30';

--3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.

select name
from collection c 
where year between 2018 and 2020;

--4. Исполнители, чьё имя состоит из одного слова

select name
from Artist a
where not name like '% %';

--5. Название треков, которые содержат слово «мой» или «my»

--select name
--from track t 
--where name like '%my%' or name like '%мой%';

SELECT name FROM track t
WHERE string_to_array(lower(t.name), ' ') && ARRAY['my', 'мой' ]; 

SELECT name FROM track t
WHERE name ~* '\mmy\M';  

--Задание 3

--1.Количество исполнителей в каждом жанре

select g.name, count(a.name) as ar_count
from Genre g
inner join GenreArtist ga
on g.genre_id = ga.genre_id
inner join Artist a
on ga.artist_id = a.artist_id
group by g.name;

--2 Количество треков, вошедших в альбомы 2019–2020 годов.

select count(t.name) as t_count
from track t, albums a
where t.album_id = a.album_id and a.year between 2001 and 2012;

--3 Средняя продолжительность треков по каждому альбому.

select a.name, avg (t.duration)
from track t, albums a
where t.album_id = a.album_id
group by a.name;

--4 Все исполнители, которые не выпустили альбомы в 2020 году.
--select a.name
--from artist a
--inner join artistalbums aa
--on a.artist_id = aa.artist_id
--inner join albums al
--on aa.album_id = al.album_id
--where al.year <> 2020;

SELECT a.name /* Получаем имена исполнителей */
FROM artist a  /* Из таблицы исполнителей */
WHERE a.name NOT IN ( /* Где имя исполнителя не входит в вложенную выборку */
    SELECT a.name /* Получаем имена исполнителей */
    FROM artist a /* Из таблицы исполнителей */
    JOIN artistalbums aa on a.artist_id = aa.artist_id /* Объединяем с промежуточной таблицей */
    JOIN albums al ON aa.album_id = al.album_id /* Объединяем с таблицей альбомов */
    WHERE al.year = 2020 /* Где год альбома равен 2020 */
);

--5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

select c.name
from collection c
inner join trackcollection tc
on c.collection_id = tc.collection_id
inner join track t
on tc.track_id = t.track_id
where t.album_id = (select a.album_id 
						from albums a
						inner join artistalbums aa
						on a.album_id = aa.album_id
						inner join artist ar
						on aa.artist_id = ar.artist_id
						where ar.name = 'Nirvana');
