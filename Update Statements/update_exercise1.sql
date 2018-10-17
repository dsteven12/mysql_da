SELECT * FROM departments 
ORDER BY dept_no DESC
LIMIT 10;

UPDATE departments 
SET 
	dept_name = 'Data Analysis'
WHERE
	dept_no = 'd010';

SELECT * FROM departments_dup LIMIT 10; -- dept_no still has 'Business Analysis' in departments_dup

