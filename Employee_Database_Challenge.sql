SELECT e.emp_no
	, e.first_name
	, e.last_name
	, ti.title
	, ti.from_date
	, ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


SELECT DISTINCT ON (rt.emp_no) rt.emp_no
	, rt.first_name
	, rt.last_name
	, rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;


SELECT COUNT(ut.title)
	, title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no
	, e.first_name
	, e.last_name
	, e.birth_date
	, de.from_date
	, de.to_date
	, ti.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
	FULL OUTER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
	   AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');


