-- Creating tables for PH-Employee
Create Table departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL, 
	PRIMARY KEY (dept_no), 
	UNIQUE (dept_name)
);

Create Table employees (
	emp_no INT NOT NULL, 
	birth_date DATE NOT NULL, 
	first_name VARCHAR NOT NULL, 
	last_name VARCHAR NOT NULL, 
	gender VARCHAR NOT NULL, 
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
); 

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL, 
	dept_no VARCHAR(4) NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM departments;

-- Determine Retirement Eligibility
SELECT first_name, last_name
FROM employees 
where birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement Eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- NUMBER OF EMPLOYEES RETIRING.
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create a table to save our search
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departements and dept_manager tables.
SELECT d.dept_name
	, dm.emp_no
	, dm.from_date
	, dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Use left Join to capture retirement table

	-- Joining retirement_info and dept_emp tables.
SELECT ri.emp_no
	, ri.first_name
	, ri.last_name
	, de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Use left join function for retirement_info and dept_emp tables.
SELECT ri.emp_no
	, ri.first_name
	, ri.last_name
, de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Using the count, Group By, and ORDER BY

-- Employee Count by Department Number 
SELECT COUNT(ce.emp_no), de.dept_no
INTO emp_dept_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Create Additional Tables
SELECT e.emp_no
	, e.first_name
, e.last_name
	, e.gender
	, s.salary
	, de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');

-- List Managers Per Department 
SELECT dm.dept_no
	, d.dept_name
	, dm.emp_no
	, ce.last_name
	, ce.first_name
	, dm.from_date
	, dm.to_date
INTO manager_info
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN current_emp as ce
		ON (dm.emp_no = ce.emp_no);
		

-- List 3: Department Retirees.
SELECT ce.emp_no
, ce.first_name
, ce.last_name
, d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- SKILL DRILL
SELECT ri.emp_no
	, ri.first_name
	, ri.last_name
	, d.dept_name
From retirement_info AS ri
INNER JOIN dept_emp AS de
		ON (de.emp_no = ri.emp_no)
	INNER JOIN departments AS d
		ON (d.dept_no = de.dept_no)
	WHERE (d.dept_name = 'Sales');
	
Select * FROM dept_emp;

-- Skill Drill 2.0
SELECT ri.emp_no
	, ri.first_name
	, ri.last_name
	, d.dept_name
From retirement_info AS ri
INNER JOIN dept_emp AS de
		ON (de.emp_no = ri.emp_no)
	INNER JOIN departments AS d
		ON (d.dept_no = de.dept_no)
	WHERE d.dept_name IN('Sales', 'Development');


