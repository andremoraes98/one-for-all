select
	ar.artista as artistas,
    al.album as albuns,
    c.cancao as cancoes
from cancao as c
inner join album as al
on c.album_id = al.album_id
inner join artista as ar
on al.artista_id = ar.artista_id;