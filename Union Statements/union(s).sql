USE employees;
DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup (
	emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

-- CREATING A TEMP TABLE BY DUPLICATING 20 ROWS FROM THE EMPLOYEES TABLE
INSERT INTO employees_dup
SELECT e.* FROM employees e LIMIT 20;

-- CHECK 
SELECT * FROM employees_dup;

-- ADDING DUP ROW FOR EMP_NO = 10001
INSERT INTO employees_dup
SELECT e.* FROM employees e WHERE emp_no = '10001';

SELECT 
	e.emp_no,
	e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM 
	employees_dup e
WHERE e.emp_no = 10001
UNION SELECT -- UNION displays only distinct values in the output (more computational power)
-- UNION ALL SELECT retrieves duplicates as well
	NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM 
	dept_manager m;