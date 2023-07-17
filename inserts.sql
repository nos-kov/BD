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
('Killer Mike'),
('Jackson 5')

insert into Albums(name, year)
values
('Album1', 2001 ),
('Album2', 1999),
('Album3', 2005),
('Album4', 2012),
('Album5', 1988 )

insert into Collection  (name, year)
values
('coll1', 2001 ),
('coll2', 1999),
('coll3', 2005),
('coll4', 2012),
('coll5', 2018 ),
('coll6', 2019 ),
('coll7', 2020 )

insert into Track (name, duration, album_id, collection_id)
values
('smells like teen spirit', '00:03:59', 1, 1 ),
('hung up', '00:04:21', 2, 2),
('im good', '00:08:22', 3, 3),
('run', '00:03:34', 4, 4),
('sometrack', '00:07:34', 4, 4),
('newtrack', '00:10:00', 1, 1),
('my love', '00:02:59', 2, 2 )

insert into GenreArtist
values
(1, 1 ),
(2, 2),
(3, 3),
(4, 4),
(1, 5 )

insert into ArtistAlbums
values
(1, 1 ),
(2, 2),
(3, 3),
(4, 4),
(5, 5 )

insert into TrackCollection
values
(1, 1 ),
(2, 2),
(3, 3),
(4, 4),
(5, 5 ),
(6, 6 ),
(7, 7 )
