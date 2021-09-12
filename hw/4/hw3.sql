/**
  Вывести все интервалы, в которые не было нанято ни одного сотрудника.
  Минимальная дата - 1999-01-01, Максимальная - 2020-01-01.
  Например, если первый сотрудник был нанят 2010-01-02,
  то первая строка в ответе будет (1999-01-01, 2010-01-01).
  Интервалы должны быть непересекающимися и закрытыми.
  Строки должны быть выведене в результирующей выборке
  в порядке возрастания (date_start, date_end)
 */
with hire_dates as (
    select employee_id, title, hire_date, row_number() over (order by hire_date) as row_id
    from employee order by hire_date
)

(select '1999-01-01' as begin, hire_date as end from employee order by hire_date limit 1)

union

select e1.hire_date as begin, coalesce(e2.hire_date, '2020-01-01') as end from hire_dates e1
    left join hire_dates e2 on e2.row_id=e1.row_id + 1
order by begin;