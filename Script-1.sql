drop table GenreArtist;
drop table ArtistAlbums;
drop table TrackCollection;

drop table Albums;
drop table Artist;
drop table Collection;
drop table Track;
drop table Genre;

create table if not exists Genre(
genre_id serial primary key,
name varchar (50) not null unique
);

create table if not exists Artist(
artist_id serial primary key,
name varchar (50) not null
);

create table if not exists GenreArtist(
genre_id serial references Genre(genre_id),
artist_id serial references Artist(artist_id),
primary key(genre_id, artist_id)
);

create table if not exists Albums(
album_id serial primary key,
name varchar (50) not null,
year smallint not null check (year <= 9999)
);

create table if not exists ArtistAlbums(
album_id serial references Albums(album_id),
artist_id serial references Artist(artist_id),
primary key (album_id, artist_id)
);

create table if not exists Collection(
collection_id serial primary key,
name varchar (50) not null,
year smallint not null check (year <= 9999)
);

create table if not exists Track(
track_id serial primary key,
name varchar (100) not null,
duration time not null unique,
album_id serial references Albums(album_id),
collection_id serial references Collection(collection_id)
);

create table if not exists TrackCollection(
track_id serial references Track(track_id),
collection_id serial references Collection(collection_id),
primary key(track_id, collection_id)
);

insert into Genre(name)
values
('pop'),
('rock'),
('edm'),
('rap')

insert into Artist(name)
values
('Madonna'),
('Nirvana'),
('Davit Guetta'),
('Killer Mike')

insert into Albums(name, year)
values
('Album1', 2001 ),
('Album2', 1999),
('Album3', 2005),
('Album4', 2012)

insert into Collection  (name, year)
values
('coll1', 2001 ),
('coll2', 1999),
('coll3', 2005),
('coll4', 2012)

insert into Track (name, duration, album_id, collection_id)
values
('smells like teen spirit', '00:03:59', 1, 1 ),
('hung up', '00:04:21', 2, 2),
('im good', '00:08:22', 3, 3),
('run', '00:03:34', 4, 4),
('sometrack', '00:07:34', 4, 4),
('newtrack', '00:10:00', 1, 1)

insert into GenreArtist
values
(1, 1 ),
(2, 2),
(3, 3),
(4, 4)

insert into ArtistAlbums
values
(1, 1 ),
(2, 2),
(3, 3),
(4, 4)

insert into TrackCollection
values
(1, 1 ),
(2, 2),
(3, 3),
(4, 4)

select * from collection
