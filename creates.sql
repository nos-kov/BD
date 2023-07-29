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
album_id serial references Albums(album_id)
);

create table if not exists TrackCollection(
track_id serial references Track(track_id),
collection_id serial references Collection(collection_id),
primary key(track_id, collection_id)
);
