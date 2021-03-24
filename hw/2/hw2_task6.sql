
/*
    Сегментация клиентов по количеству букв `а` в его фамилии

*/
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
