SELECT genre.Name as genre_name, mt.Name as media_type_name, COUNT(mt.name) as cnt
    FROM genre
        LEFT JOIN track t on genre.genre_id = t.genre_id
        LEFT JOIN media_type mt on t.media_type_id = mt.media_type_id
GROUP BY genre.Name, media_type_name HAVING COUNT(mt.name) > 0 ORDER BY genre.Name;