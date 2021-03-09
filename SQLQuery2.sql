--SELECT s.Title,
--       a.ArtistName
--  FROM Song s
--       LEFT JOIN Artist a on s.ArtistId = a.id;

--SELECT Album.Title, Artist.ArtistName FROM Album Left Join Artist on Album.ArtistId = Artist.Id WHERE Album.GenreId = 4 or Album.GenreId = 2;

--SELECT Album.Title, Song.Title FROM Album Left Join Song on Album.Id = Song.AlbumId WHERE Song.AlbumId IS Null;

SELECT * FROM Album

--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Tears For Fears', 1980);

--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Songs From The Big Chair', 2/25/1985, 4152, 'Phonogram', 28, 2); 






