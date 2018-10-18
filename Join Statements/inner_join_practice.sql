USE employees;

SELECT * FROM departments_dup;
DESC departments_dup;
ALTER TABLE departments_dup 
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

-- SETTING UP FOR INNER JOINS
DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
	emp_no int(11) NOT NULL,
	dept_no char(4) NULL,
	from_date date NOT NULL,
	to_date date NULL
);

INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;

INSERT INTO dept_manager_dup 
(
	emp_no, 
	from_date
)
VALUES 
(999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

INSERT INTO departments_dup 
(
	dept_name
) VALUES 
(
	'Public Relations'
);

DELETE FROM departments_dup
WHERE dept_no = 'd002'; 

-- INNER JOIN
SELECT 
	mgr.dept_no,
    mgr.emp_no,
    dept.dept_name
FROM dept_manager_dup mgr
JOIN departments_dup dept
ON mgr.dept_no = dept.dept_no
ORDER BY mgr.dept_no;

SELECT
	emp.emp_no,
	emp.first_name,
    emp.last_name,
    mgr.dept_no,
    emp.hire_date
FROM dept_manager_dup mgr
JOIN employees emp
ON mgr.emp_no = emp.emp_no
GROUP BY emp.emp_no
ORDER BY mgr.dept_no;