-- 1: Lists employee number, last name, first name, sex, and salary.
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary 
FROM employees AS e
JOIN salaries AS s
ON (e.emp_no=s.emp_no)
ORDER BY e.emp_no;

-- 2: Lists first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,last_name,hire_date
FROM employees
WHERE CAST(hire_date AS VARCHAR) LIKE '1986%'
ORDER BY hire_date;

-- 3: Lists the manager for each department with department number, department name, employee number, last name, first name.
SELECT d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name
FROM dept_manager AS dm
JOIN employees AS e
ON (e.emp_no=dm.emp_no)
JOIN departments AS d
ON (d.dept_no=dm.dept_no);

-- 4: Lists the department of each employee with employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS dm
JOIN departments AS d
ON (d.dept_no=dm.dept_no)
JOIN employees AS e
ON (e.emp_no=dm.emp_no);

-- 5: Lists first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name,sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6: Lists employee number, last name, first name, and department name for Sales department employees.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS dm
JOIN departments AS d
ON (d.dept_no=dm.dept_no)
JOIN employees AS e
ON (e.emp_no=dm.emp_no)
WHERE d.dept_name = 'Sales';

-- 7: Lists employee number, last name, first name, and department name for Sales or Development employees.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS dm
JOIN departments AS d
ON (d.dept_no=dm.dept_no)
JOIN employees AS e
ON (e.emp_no=dm.emp_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8: Lists the frequency count of last names in descending order.
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY count DESC;
