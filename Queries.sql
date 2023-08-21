
--Table Schema for each given csv file--

CREATE TABLE departments (
 	dept_no VARCHAR (4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR (30) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT ,
	dept_no VARCHAR (10) ,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR (10) ,
	emp_no INT ,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR (30) NOT NULL,
	birth_date VARCHAR (30) NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (30) NOT NULL,
	hire_date VARCHAR (30) NOT NULL
);

CREATE TABLE salaries(
	emp_no INT ,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
); 

CREATE TABLE titles(
	title_id VARCHAR (10) NOT NULL PRIMARY KEY,
	title VARCHAR (30) NOT NULL
);

SELECT * 
FROM dept_emp


--1. List the employee number, last name, first name, sex, and salary of each employee--

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s 
ON s.emp_no = e.emp_no

--2.List the first name, last name, and hire date for the employees who were hired in 1986.--

SELECT first_name, last_name, hire_date
FROM employees 
WHERE TO_DATE (hire_date, 'MM/DD/YYYY') BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.--

SELECT dm.dept_no, dp.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no
INNER JOIN departments dp ON dm.dept_no = dp.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.--

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees e 
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments dp ON de.dept_no = dp.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.--

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.--

SELECT dp.dept_no, dp.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments dp ON dp.dept_no = dp.dept_no
WHERE dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.--

SELECT dp.dept_no, dp.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments dp ON dp.dept_no = dp.dept_no
WHERE dept_name IN ('Sales', 'Development');

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;