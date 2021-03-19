SELECT * FROM customer WHERE company IS NOT NULL


SELECT * FROM customer WHERE company IS NOT NULL



SELECT g.name, count(DISTINCT track.track_id) FROM track
    LEFT JOIN genre g on g.genre_id = track.genre_id
GROUP BY g.genre_id


SELECT * FROM (SELECT g.name, count(DISTINCT track.track_id) FROM track
    LEFT JOIN genre g on g.genre_id = track.genre_id
    LEFT JOIN invoice_line inv_line on inv_line.track_id = track.track_id
GROUP BY g.genre_id)


SELECT c_name , g_id, max(g_count)  FROM (
    SELECT company as c_name, t.genre_id as g_id, count(t.genre_id) as g_count
        FROM customer
            LEFT JOIN invoice i on customer.customer_id = i.customer_id
            LEFT JOIN invoice_line il on i.invoice_id = il.invoice_id
            LEFT JOIN track t on t.track_id = il.track_id
        WHERE customer.company IS NOT NULL

        GROUP BY company
        ORDER BY company
    ) as company_genres_count
GROUP BY c_name, g_id
ORDER BY c_name





-- Количество приобретенных композиций по жанрам для каждой отдельно взятой компании
SELECT customer.customer_id as c_id, company as company_name, genre_id, count(t.genre_id) as cnt FROM customer
    left join invoice i on customer.customer_id = i.customer_id
    left join invoice_line il on i.invoice_id = il.invoice_id
    left join track t on t.track_id = il.track_id
where company is not null
GROUP BY c_id, company, genre_id
order by c_id





SELECT genre_id, max(cnt) FROM (
    SELECT customer.customer_id as c_id, company as company_name, genre_id, count(t.genre_id) as cnt FROM customer
        left join invoice i on customer.customer_id = i.customer_id
        left join invoice_line il on i.invoice_id = il.invoice_id
        left join track t on t.track_id = il.track_id
    where company is not null
    GROUP BY c_id, company, genre_id
    order by c_id
) as company_genres_count

GROUP BY  genre_id
order by genre_id

