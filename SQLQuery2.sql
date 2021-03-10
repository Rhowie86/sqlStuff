--SELECT s.Title,
--       a.ArtistName
--  FROM Song s
--       LEFT JOIN Artist a on s.ArtistId = a.id;

--SELECT Album.Title, Artist.ArtistName FROM Album Left Join Artist on Album.ArtistId = Artist.Id WHERE Album.GenreId = 4 or Album.GenreId = 2;

--SELECT Album.Title, Song.Title FROM Album Left Join Song on Album.Id = Song.AlbumId WHERE Song.AlbumId IS Null;

--SELECT * FROM Album


--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('David Bowie', 1980);

--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Aladdinsane', '3/09/2021', 4152, 'Idonutknow', 29, 2); 

--SELECT al.Title as AlbumTitle, s.Title as SongTitle, a.ArtistName
--FROM Album al
--LEFT JOIN Song s ON s.AlbumId = al.Id
--LEFT JOIN Artist a ON al.ArtistId = a.Id
--WHERE al.ArtistId = 28;

--select count (s.id) as SongCount, al.Title as AlbumTitle, ar.ArtistName
	--from song s
	--left join Album al on s.AlbumId = al.Id
	--left join Artist ar on al.ArtistId = ar.Id
--group by al.Title, ar.ArtistName


--select count(distinct al.label), ar.ArtistName
	--from Artist ar JOIN Album al on ar.id = al.ArtistId
--group by ar.ArtistName
	--having count(distinct al.label) > 1


select s.Title, s.SongLength
	from song s
	where s.SongLength = (
		select max (s.SongLength)
		  from song s
		);

select top 2 s.Title, s.SongLength 
	from song s
order by s.SongLength desc;






