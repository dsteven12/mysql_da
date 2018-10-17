SELECT * FROM departments_dup ORDER BY dept_no;

INSERT INTO departments_dup 
(
	dept_no,
    dept_name
)
SELECT * FROM departments;

COMMIT;

DELETE FROM departments_dup WHERE dept_no = 'd011'; -- CREATED BECAUSE OF AUTOCOMMIT ISSUES

UPDATE departments_dup
SET
	dept_no = 'd011',
    dept_name = 'Quality Control';
    
ROLLBACK;