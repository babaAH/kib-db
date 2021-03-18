SELECT art.name artist_name, COUNT(*) qty FROM artist as art
    LEFT JOIN album AS al ON art.artist_id = al.artist_id
    LEFT JOIN track tr on al.album_id = tr.album_id
    WHERE genre_id = (
            SELECT g.genre_id FROM genre g WHERE g.Name='Rock' limit 1
        )
        OR genre_id = (
            SELECT g.genre_id FROM genre g WHERE g.Name='Metal' limit 1
        )
    GROUP BY art.name