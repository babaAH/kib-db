SELECT employee.last_name || ' ' || employee.first_name as employee_full_name, employee.birth_date as employee_birth_date,
       employee.hire_date as employee_hire_date, manager.last_name || ' ' || manager.last_name as manager_full_name,
       manager.birth_date as manager_birth_date, manager.hire_date as manager_hire_date
FROM employee
    LEFT JOIN  employee as manager ON employee.reports_to = manager.employee_id
    WHERE (employee.birth_date < manager.birth_date)
      AND (employee.hire_date > manager.hire_date);
