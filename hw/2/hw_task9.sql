-- наброски

select * from album
    left join
(
    select track_id, genre_id, sum(milliseconds)/1000 from track
    group by track_id, genre_id
) as track_by_genre on track_id=track_by_genre.track_id



select title, (select genre_id  from (
    select genre_id, sum(milliseconds) as sums from track where album.album_id=track.album_id
    group by genre_id
    order by sums desc
    limit 1
) as genre), count(t.track_id) from album
left join track t on album.album_id = t.album_id
left join invoice_line il on t.track_id = il.track_id
left join invoice i on i.invoice_id = il.invoice_id
group by title, genre_id
