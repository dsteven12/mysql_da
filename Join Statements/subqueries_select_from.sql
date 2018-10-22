SELECT * FROM dept_manager;

-- RETRIEVING MANAGER DATA ON THOSE HIRED BETWEEN '1990-01-01' AND '1995-01-01'             
SELECT 
    *
FROM
    employees e
JOIN dept_manager dm
ON e.emp_no = dm.emp_no
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
AND 
	hire_date BETWEEN '1990-01-01' AND '1995-01-01'
ORDER BY e.emp_no;

-- SELECT ALL INFORMATION FOR EMPLOYEES WHOSE JOB TILE IS ASST. ENGINEER
SELECT
	e.*,
    t.title
FROM 
	employees e
JOIN titles t
ON e.emp_no = t.emp_no
WHERE 
	EXISTS (SELECT
			*
		FROM titles t
		WHERE t.emp_no = e.emp_no
        AND title = 'Assistant Engineer')
ORDER BY e.emp_no;

-- ASSIGN EMPLOYEE NUMBER 110022 AS A MGR TO ALL EMPLOYEES FROM
-- 10001 TO 10020, AND EMPLOYEE NUMBER 110039 AS A MANAGER TO 
-- ALL EMPLOYEES FROM 10021 TO 10040
SELECT 
	A.*
FROM
	(SELECT 
		e.emp_no AS employee_ID,
		MIN(de.dept_no) AS department_code,
		(SELECT 
				emp_no
			FROM
				dept_manager
			WHERE
				emp_no = 110022) AS manager_ID
	FROM
		employees e
			JOIN
		dept_emp de ON e.emp_no = de.emp_no
	WHERE
		e.emp_no <= 10020
	GROUP BY e.emp_no
	ORDER BY e.emp_no) AS A
UNION SELECT
	B.*
FROM
	(SELECT 
		e.emp_no AS employee_ID,
		MIN(de.dept_no) AS department_code,
		(SELECT 
				emp_no
			FROM
				dept_manager
			WHERE
				emp_no = 110039) AS manager_ID
	FROM
		employees e
			JOIN
		dept_emp de ON e.emp_no = de.emp_no
	WHERE 
		e.emp_no >= 10021
		AND	e.emp_no <= 10040
	GROUP BY e.emp_no
	ORDER BY e.emp_no) AS B;