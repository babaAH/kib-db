SELECT a.title  as album_name, COUNT(t.*) as cnt FROM album as a LEFT JOIN track t on a.album_id = t.album_id GROUP BY a.title HAVING avg(t.milliseconds) > 250000
