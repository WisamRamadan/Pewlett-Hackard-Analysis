--Deliverable 1, 1.1 retirement titles with duplication
SELECT employees.emp_no, employees.first_name, employees.last_name,
titles.title, titles.from_date, titles.to_date
INTO retirement_titles
from employees
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

--Deliverable 1, 1.2 unique retirement titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) ti.emp_no, ti.first_name, ti.last_name, ti.title,
ti.to_date
INTO emp_title
from retirement_titles as ti
ORDER BY ti.emp_no, ti.to_date DESC;
SELECT * from emp_title;

--join employees table and unique emp_title table
SELECT e.emp_no, e.first_name, e.last_name,
emp_title.title
INTO unique_titles
from employees as e
INNER JOIN emp_title ON e.emp_no = emp_title.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
   	ORDER BY e.emp_no, emp_title.to_date DESC;
select * from unique_titles;

--Deliverable 1, 1.3 unique retirement titles
SELECT COUNT (unique_titles.title), unique_titles.title
INTO retiring_table
FROM unique_titles
Group BY unique_titles.title
ORDER BY COUNT(unique_titles.title)DESC;
select* from retiring_table;

--Deliverable 2, create a table for The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (emp_no) employees.emp_no, employees.first_name,
					employees.last_name, employees.birth_date,
					dept_emp.from_date, dept_emp.to_date, titles.title
INTO mentoring
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles ON employees.emp_no = titles.emp_no
	WHERE (dept_emp.to_date = '9999-01-01')
	 and (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no, titles.to_date DESC;

select * from mentoring;

