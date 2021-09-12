select customer.company, t.track_id, t.name, g.name, a.title, max(i.total) as max from customer
    left join invoice i on customer.customer_id = i.customer_id
    left join invoice_line il on i.invoice_id = il.invoice_id
    left join track t on il.track_id = t.track_id
    left join genre g on t.genre_id = g.genre_id
    left join album a on t.album_id = a.album_id
where customer.company is not null
    group by customer.company, t.track_id, t.name, g.name, a.title