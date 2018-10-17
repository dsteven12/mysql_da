SELECT * FROM departments
ORDER BY dept_no;

CREATE TABLE departments_dup
(
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT * FROM departments_dup
ORDER BY dept_no;

INSERT INTO departments_dup
(
	dept_no,
    dept_name
)
SELECT * FROM departments;

INSERT INTO departments
(
	dept_no,
    dept_name
) VALUES 
(
	'd010',
    'Business Analysis'
);

INSERT INTO departments
(
	dept_no,
    dept_name
) 
SELECT * FROM departments;