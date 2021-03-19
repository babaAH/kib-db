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