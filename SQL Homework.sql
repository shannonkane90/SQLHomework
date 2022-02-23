CREATE TABLE departments (
dept_no VARCHAR(50),
dept_name VARCHAR(50),
PRIMARY KEY (dept_no)
	)

-- following isn't pulling table in correctly as I need composite keyw
CREATE TABLE dept_emp (
emp_no INTEGER,
dept_no VARCHAR(50),
PRIMARY KEY (emp_no)
	)
	
CREATE TABLE dept_manager (
dept_no VARCHAR(50),
emp_no INTEGER,
PRIMARY KEY (emp_no)
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
---
-- SELECT DEPT_NO
-- , DEPT_NAME
-- , managername
-- , 
-- FROM dept_manager dept
-- inner join dept
-- inner join titles
-- on titles.dept_no = dept.dept_no
