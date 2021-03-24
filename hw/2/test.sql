
select last_name from customer

select (a_in_last_name) as cnt, count(a_in_last_name)  from (
    select last_name,
           length(last_name) - length(replace(last_name, 'a', '')) as a_in_last_name
    from customer
) as t
group by cnt

select case when cnt=0 then 'A'
            when cnt=1 then 'B'
            when cnt=2 then 'C'
            else 'D'
        end as segment,
       count_a
       from (select (a_in_last_name) as cnt, count(a_in_last_name) as count_a  from (
                select last_name,
                       length(last_name) - length(replace(last_name, 'a', '')) as a_in_last_name
                from customer
            ) as t
            group by cnt

    ) as counted


select
       last_name,
       length(last_name) - length(replace(last_name, 'a', '')) as a_in_last_name,
       count(t.media_type_id)

from customer left join invoice i on customer.customer_id = i.customer_id
left join invoice_line il on i.invoice_id = il.invoice_id
left join track t on il.track_id = t.track_id
where t.genre_id in (select genre_id from genre where LOWER(name) like LOWER('%metal%'))
group by last_name, length(last_name) - length(replace(last_name, 'a', ''))

select genre_id from genre where LOWER(name) like LOWER('%metal%')

select segment, sum(media_count) from
      (select case when cnt=0 then 'A'
            when cnt=1 then 'B'
            when cnt=2 then 'C'
            else 'D'
        end as segment,
        media_count
       from (select (a_in_last_name) as cnt, count(a_in_last_name) as count_a,  media_count  from (
                select
                       last_name,
                       length(last_name) - length(replace(last_name, 'a', '')) as a_in_last_name,
                       count(t.media_type_id) as media_count

                from customer left join invoice i on customer.customer_id = i.customer_id
                left join invoice_line il on i.invoice_id = il.invoice_id
                left join track t on il.track_id = t.track_id
                where t.genre_id in (select genre_id from genre where LOWER(name) like LOWER('%metal%'))
                group by last_name, length(last_name) - length(replace(last_name, 'a', ''))
            ) as t
            group by cnt,  media_count

    ) as counted
) as segment_media
order by segment



select segment, sum(media_count) from counted
order by segment



