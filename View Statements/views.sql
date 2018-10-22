-- COUNTING DUPLICATE EMPLOYEE NUMS
SELECT 
	emp_no,
    from_date,
    to_date,
    COUNT(emp_no) AS num
FROM 
	dept_emp
GROUP BY emp_no
HAVING num > 1;

-- CREATING A VIEW OF LAST CONTRACTED POSITION BASED ON MAX FROM AND TO DATE
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS 
	SELECT
		emp_no, 
		MAX(from_date) AS from_date, 
		MAX(to_date) AS to_date
	FROM 
		dept_emp
	GROUP BY emp_no;

-- RETRIEVING CREATED VIEW    
SELECT * FROM employees.v_dept_emp_latest_date;

-- SELECT AVG SALARY OF EACH MANAGER
SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    ROUND(AVG(s.salary),2) as average_salary
FROM employees e
JOIN dept_manager m
ON e.emp_no = m.emp_no
JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY e.emp_no
ORDER BY e.emp_no;

-- CREATING A VIEW OF AVERAGE SALARY FOR ALL MANAGERS
CREATE OR REPLACE VIEW v_avg_manager_salary AS
SELECT 
    ROUND(AVG(s.salary), 2) AS average_salary
FROM
    salaries s
        JOIN
    dept_manager m ON s.emp_no = m.emp_no;

-- RETRIEVING VIEW OF TOTAL AVG SALARY
SELECT * FROM employees.v_avg_manager_salary;
		