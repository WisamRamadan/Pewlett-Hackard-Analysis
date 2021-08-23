# Pewlett-Hackard-Analysis
## Overview of the analysis:
The purpose of this analysis is to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program.

## Results:
### The Number of Retiring Employees by Title
The results shows that the total number of retiring employees is 90,398 and the following table shows employees per title:
Total No. Employees | Title
--------------------|------
29414	| Senior Engineer
28254	| Senior Staff
14222	| Engineer
12243	| Staff
4502	| Technique Leader
1761	| Assistant Engineer
2	| Manager

* The highest number of retiring employees are the senior engineers followed by the senior staff.

### The Employees Eligible for the Mentorship Program

The employees eligible for the Mentoring Program are the current employees who were born between January 1, 1965 and December 31, 1965. The results shows that there is 1,549 eligible employees. The complete list of employees is available via the below link:

[mentorship_eligibilty.csv](https://github.com/WisamRamadan/Pewlett-Hackard-Analysis/files/7032894/mentorship_eligibilty.csv)

## Summary:
In preparation for the upcoming "silver tsunami", critical decisions have to be made in advance. The below highlights key points:
* The following roles will need to be filled as the retirement begins to make an impact:
    *Senior Engineer
    *Senior Staff
    *Engineer
    *Staff
    *Technique Leader
    *Assistant Engineer
    
* Currently there are 1,549 qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees. However, the number is not enough considering the huge number of retiring employees. Therefore, I recommend expanding the mentoring program eligibility criteria.

The following additional queries may provide more insight to the upcoming "silver tsunami":
* query to understand which deptartments are more affected
```
SELECT e.emp_no, e.first_name, e.last_name,
emp_title.title
INTO unique_titles
from employees as e
INNER JOIN emp_title ON e.emp_no = emp_title.emp_no
INNER JOIN dept_emp ON e.emp_no = emp_title.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
   	ORDER BY e.emp_no, emp_title.to_date DESC;
```
* query to understand the financial impact of the retiring employees by joining salary column
```
SELECT e.emp_no, e.first_name, e.last_name,
emp_title.title
INTO unique_titles
from employees as e
INNER JOIN emp_title ON e.emp_no = emp_title.emp_no
INNER JOIN salaries ON e.emp_no = emp_title.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
   	ORDER BY e.emp_no, emp_title.to_date DESC;
```
