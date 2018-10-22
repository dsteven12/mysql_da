DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN
SELECT 
	AVG(s.salary)
INTO p_avg_salary FROM
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = p_emp_no;
END $$
DELIMITER ;

SET @v_avg_salary = 0;
CALL employees.emp_avg_salary_out(11300, @v_avg_salary);
SELECT @v_avg_salary AS avg_salary;