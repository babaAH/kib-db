SELECT employee.last_name || ' ' || employee.first_name as employee_full_name,
       count(DISTINCT c.customer_id) as customers_count,
       count(DISTINCT c.address) as addresses_count,
       count(DISTINCT inv.invoice_id) as invoices_count,
       count(inv_line.track_id) as tracks_count
FROM employee
    LEFT JOIN customer c on employee.employee_id = c.support_rep_id
    LEFT JOIN invoice inv on inv.customer_id = c.customer_id
    LEFT JOIN invoice_line inv_line on inv_line.invoice_id = inv.invoice_id
GROUP BY employee_full_name