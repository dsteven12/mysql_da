USE employees;
-- SETUP FOR LEFT JOINS
SELECT * FROM dept_manager_dup;
SELECT * FROM departments_dup;

-- REMOVING DUPS
DELETE FROM dept_manager_dup
WHERE emp_no = '110228';

DELETE FROM departments_dup
WHERE dept_no = 'd009';

-- ADDING BACK RECORDS
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES ('d009', 'Customer Service');

SELECT 
	m.dept_no, 
    m.emp_no,
    d.dept_name
FROM dept_manager_dup m
LEFT JOIN departments_dup d 
ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

SELECT * FROM employees LIMIT 2;
SELECT * FROM dept_manager LIMIT 2;

SELECT 
	emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	mgr.dept_no,
	mgr.from_date
FROM employees emp
LEFT JOIN dept_manager mgr
ON emp.emp_no = mgr.emp_no
WHERE emp.last_name = 'Markovitch'
ORDER BY mgr.dept_no DESC, emp.emp_no;