select a2.name, array_to_string(array_agg(distinct genre.name), ', ') from genre
    left join track t on genre.genre_id = t.genre_id
    left join album a on t.album_id = a.album_id
    left join artist a2 on a.artist_id = a2.artist_id
group by a2.name