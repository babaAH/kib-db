

WITH count_of_sales_by_genre AS (
    select genre_id, count(distinct i.invoice_id) from track
    left join invoice_line il on track.track_id = il.track_id
    left join invoice i on il.invoice_id = i.invoice_id
    group by genre_id
)

SELECT * FROM count_of_sales_by_genre



WITH company_invoices_by_genre AS (
-- Список Компаний совершивших покупки по каждому из жанров
    SELECT t.genre_id, array_agg( distinct ( customer.customer_id)) FROM customer
        LEFT JOIN invoice i on customer.customer_id = i.customer_id
        LEFT JOIN invoice_line il on i.invoice_id = il.invoice_id
        LEFT JOIN track t on il.track_id = t.track_id
    WHERE company is not null
    group by t.genre_id
)


SELECT genre_id, max(cnt) FROM
(
    -- Количество покупок композиций по жанру для компании

    SELECT genre_id, customer.company, count(i.invoice_id) as cnt  FROM customer
    LEFT JOIN invoice i on customer.customer_id = i.customer_id
    LEFT JOIN invoice_line il on i.invoice_id = il.invoice_id
    LEFT JOIN track t on il.track_id = t.track_id
    WHERE company is not null
    group by genre_id, customer.company
) as count_of_company_invoices_by_genre
GROUP BY genre_id