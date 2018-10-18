USE employees;
DESC dept_emp;

SELECT COUNT(DISTINCT dept_no) FROM dept_emp;

DESC salaries;
SELECT SUM(salary) FROM salaries WHERE from_date > '1997-01-01';
SELECT ROUND(AVG(salary),2) FROM salaries;
SELECT ROUND(AVG(salary),2) FROM salaries WHERE from_date > '1997-01-01';

SELECT MAX(emp_no) FROM employees;
SELECT MIN(emp_no) FROM employees;

-- IFNULL AND COALESCE FUNCTIONS SETUP

SELECT * FROM departments_dup ORDER BY dept_no;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

SELECT * FROM departments_dup ORDER BY dept_no;

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL 
AFTER dept_name;

DESC departments_dup;

SELECT * FROM departments_dup ORDER BY dept_no;

COMMIT;

SELECT 
	dept_no, 
    IFNULL(
		 dept_name,
		'Missing dept name') AS dept_name
FROM departments_dup;

SELECT 
	dept_no, 
    dept_name,
    COALESCE('dept mgr name') AS dept_mgr
FROM departments_dup;

SELECT dept_no, dept_name, COALESCE(dept_no, dept_name) AS dept_info FROM departments_dup;
SELECT IFNULL(dept_no, 'N/A') AS dept_no, IFNULL(dept_name, 'N/A') AS dept_name, COALESCE(dept_no, dept_name) AS dept_info FROM departments_dup;