SELECT e.gender, AVG(s.salary) AS average_salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
GROUP BY gender;

-- QUAD JOIN
SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    t.from_date AS start_date,
    d.dept_name
FROM employees e
JOIN dept_manager m
ON e.emp_no = m.emp_no
JOIN titles t
ON e.emp_no = t.emp_no
JOIN departments d
ON m.dept_no = d.dept_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

SELECT 
	e.gender,
    COUNT(*)
FROM employees e
JOIN dept_manager m
ON e.emp_no = m.emp_no
GROUP BY e.gender;

SELECT * FROM dept_manager;
