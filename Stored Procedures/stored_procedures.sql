USE employees;
DELIMITER $$
CREATE PROCEDURE select_1000_employees()
BEGIN 
	SELECT * FROM employees
    LIMIT 1000;
END $$

DELIMITER ;

CALL employees.select_1000_employees();


-- PROVIDE AVG SALARY OF ALL EMPLOYEES
DELIMITER $$
CREATE PROCEDURE avg_emp_salary()
BEGIN 
	SELECT 
		AVG(salary) 
	FROM salaries;
END $$

DELIMITER ;

CALL avg_emp_salary();

DELIMITER $$

-- STORED PROCEDURES WITH INPUT PARAMETER
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
	e.emp_no,
	e.first_name,
    e.last_name,
    s.salary,
    s.from_date,
    s.to_date
FROM 
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE 
	e.emp_no = p_emp_no;
END $$

DELIMITER ;

CALL emp_salary(11300);

DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
	e.first_name,
    e.last_name,
    AVG(s.salary)
FROM 
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE 
	e.emp_no = p_emp_no;
END $$

DELIMITER ;

CALL emp_avg_salary(11300);

