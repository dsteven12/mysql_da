SELECT 
	* 
FROM 
	employees 
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO employees 
(
	emp_no,
    birth_date,
	first_name,
    last_name,
    gender,
    hire_date
) VALUES 
(
	999901, -- VALUE HIGH TO HELP TEST INSERT STATEMENT
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);

INSERT INTO employees -- MANDATORY
(
    birth_date, -- VALUES MUST BE IN EXACT ORDER OF COLUMN NAMES
    emp_no,
	first_name,
    last_name,
    gender,
    hire_date
) VALUES 			  -- MANDATORY
(
	'1973-03-26',
    999902, -- VALUE HIGH TO HELP TEST INSERT STATEMENT
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'
);

-- DO NOT NEED TO ADD COLUMN NAMES, BUT MUST PUT INFORMATION ACCORDING TO COLUMN STRUCTURE OF TABLE.
INSERT INTO employees
VALUES
(
	999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);