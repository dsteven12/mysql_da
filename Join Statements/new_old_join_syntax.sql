-- NEW JOIN SYNTAX
SELECT 
	m.dept_no,
	m.emp_no, 
    d.dept_name
FROM dept_manager_dup m
JOIN departments_dup d 
ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- OLD JOIN SYNTAX (morally old and is more time consuming - computational approach is inefficient)
SELECT 
	*
FROM 
	dept_manager_dup m,
	departments_dup d 
WHERE m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- JOIN EXERCISE WITH WHERE
SELECT * FROM titles LIMIT 1;

SELECT 
	emp.emp_no,
	emp.first_name,
    emp.last_name,
    emp.hire_date,
    t.title
FROM employees emp
JOIN titles t
ON emp.emp_no = t.emp_no
WHERE emp.first_name = 'Margareta' 
AND emp.last_name = 'Markovitch'
ORDER BY emp.emp_no;