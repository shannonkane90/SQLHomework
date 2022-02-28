
-- Table Creations

CREATE TABLE departments (
dept_no VARCHAR(50),
dept_name VARCHAR(50),
PRIMARY KEY (dept_no)
	)

CREATE TABLE dept_emp (
emp_no INTEGER,
dept_no VARCHAR(50)
	)
	
CREATE TABLE dept_manager (
dept_no VARCHAR(50),
emp_no INTEGER
)

CREATE TABLE employees (
emp_no INTEGER,
emp_title_id VARCHAR(50),
birth_date DATE,
first_name VARCHAR(50),
last_name VARCHAR(50),
sex VARCHAR(50),
hire_date DATE,
PRIMARY KEY (emp_no)
	)
	
CREATE TABLE salaries (
emp_no INTEGER,
salary INTEGER,
PRIMARY KEY (emp_no)
	)

CREATE TABLE titles (
title_id VARCHAR,
title VARCHAR,
PRIMARY KEY (title_id)
	)
-- 
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- Analysis
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- 1986 Hires
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;


-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, departments.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
JOIN departments
ON departments.dept_no= dm.dept_no
ORDER BY dept_name


-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees AS e
JOIN dept_emp
ON dept_emp.emp_no= e.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
ORDER BY dept_name;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name
FROM employees AS e
	WHERE first_name='Hercules'
	AND last_name LIKE 'B%'
ORDER BY last_name

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.last_name, e.first_name
FROM dept_emp
JOIN employees AS e
ON dept_emp.emp_no = e.emp_no
JOIN departments AS d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp
JOIN employees AS e
ON dept_emp.emp_no = e.emp_no
JOIN departments AS d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;