--List the following details of each employee: employee number, last name, first name, sex, and salary.


SELECT 
	emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	emp.sex AS "Sex",
	s.salary AS "Salary"
	
FROM employees emp 

INNER JOIN salaries s on emp.emp_no = s.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.


SELECT * FROM employees

SELECT 
	emp.first_name AS "First Name",
	emp.last_name AS "Last Name",
	emp.hire_date AS "Hire Date"
	
FROM employees emp 
WHERE

(emp.hire_date >= '1986-01-01'
AND
emp.hire_date <= '1986-12-31')

ORDER BY emp.hire_date;


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT 
	d.dept_no AS "Department Number",
	d.dept_name AS "Department Name",
	dm.emp_no AS "Managers Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name"

	
FROM employees emp 

INNER JOIN 
	dept_manager dm 
	on emp.emp_no = dm.emp_no
INNER JOIN 
	departments d
	on d.dept_no = dm.dept_no
	
ORDER BY d.dept_no;


--List the department of each employee with the following information: employee number, last name, first name, and department name.


SELECT 
	emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	d.dept_name AS "Department Name"
	
FROM employees emp 

INNER JOIN 
	dept_emp de 
	on emp.emp_no = de.emp_no
INNER JOIN 
	departments d
	on de.dept_no = d.dept_no
	
ORDER BY emp.emp_no;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	emp.first_name AS "First Name",
	emp.last_name AS "Last Name",
	emp.sex AS "Sex"
	
FROM employees emp 

WHERE

emp.first_name = 'Hercules'
AND
emp.last_name LIKE 'B%'

ORDER BY emp.last_name


--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	d.dept_name AS "Department Name"
	
FROM employees emp 

INNER JOIN 
	dept_emp de 
	on emp.emp_no = de.emp_no
INNER JOIN 
	departments d
	on de.dept_no = d.dept_no

WHERE

d.dept_name = 'Sales'


ORDER BY emp.emp_no;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	d.dept_name AS "Department Name"
	
FROM employees emp 

INNER JOIN 
	dept_emp de 
	on emp.emp_no = de.emp_no
INNER JOIN 
	departments d
	on de.dept_no = d.dept_no

WHERE

d.dept_name = 'Sales'
OR
d.dept_name = 'Development'

ORDER BY emp.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT 
	emp.last_name AS "Last Name",
	COUNT(emp.last_name) AS "Frequence of Employee Last Name"
FROM employees emp 
GROUP BY emp.last_name
ORDER BY COUNT(emp.last_name) DESC;